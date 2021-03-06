package com.nashtech.assignment.pdh.services.impl;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Optional;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.jaxb.SpringDataJaxb.OrderDto;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;

import com.nashtech.assignment.pdh.dto.CartItemDTO;
import com.nashtech.assignment.pdh.dto.OrderDTO;
import com.nashtech.assignment.pdh.dto.OrderDetailDTO;
import com.nashtech.assignment.pdh.entities.OrderDetail;
import com.nashtech.assignment.pdh.entities.Orders;
import com.nashtech.assignment.pdh.entities.Products;
import com.nashtech.assignment.pdh.exception.ResourceNotFoundException;
import com.nashtech.assignment.pdh.repositories.OrderDetailRepository;
import com.nashtech.assignment.pdh.repositories.OrderRepository;
import com.nashtech.assignment.pdh.repositories.ProductRepository;
import com.nashtech.assignment.pdh.response.MessageResponse;
import com.nashtech.assignment.pdh.services.ICartItemService;
import com.nashtech.assignment.pdh.services.IOrderService;

@Component
public class OderServiceImpl implements IOrderService {

	@Autowired
	OrderRepository orderRepository;
	private OrderDetailRepository orderDetailRepository;
	private ProductRepository productRepository;
	private ModelMapper modelMapper;
	private ICartItemService iCartItemService;

	@Override
	public OrderDTO findByIdOrder(long id) throws ResourceNotFoundException {
		Optional<Orders> optional = orderRepository.findById(id);
		if (!optional.isPresent()) {
			throw new ResourceNotFoundException("Order not found");
		}
		Orders order = optional.get();
		return modelMapper.map(order, OrderDTO.class);
	}

	@Override
	public ResponseEntity<?> getAllOrder() {
		List<Orders> list = orderRepository.findAll();
		List<OrderDTO> listDto = new ArrayList<OrderDTO>();
		list.forEach(s -> listDto.add(modelMapper.map(s, OrderDTO.class)));

		return ResponseEntity.ok(listDto);
	}

	@Override
	public ResponseEntity<?> addOrder(OrderDTO orderDTO) throws ResourceNotFoundException {
		Collection<CartItemDTO> cartItemDTO = iCartItemService.getCartByIdAccount(orderDTO.getUsers().getUserId());
		if(cartItemDTO.isEmpty())
			throw new ResourceNotFoundException("add order not success");
		Orders order = orderRepository.save(modelMapper.map(orderDTO, Orders.class));
		List<OrderDetail> listOrderDetails = new ArrayList<>();
		for (CartItemDTO cart : cartItemDTO) {
			OrderDetail orderdetails = new OrderDetail();
			orderdetails.setOrdQuantity(cart.getQuantity());
			orderdetails.setProducts(modelMapper.map(cart.getProducts(), Products.class));
			orderdetails.setOrders(order);
			listOrderDetails.add(orderdetails);
		}
			orderDetailRepository.saveAll(listOrderDetails);
			iCartItemService.deleteCart(orderDTO.getUsers().getUserId());
			return ResponseEntity.ok(new MessageResponse("The order was added successfully"));

	}
}
