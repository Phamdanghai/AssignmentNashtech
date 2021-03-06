package com.nashtech.assignment.pdh.services;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.nashtech.assignment.pdh.exception.ResourceNotFoundException;
import com.nashtech.assignment.pdh.request.LoginRequest;
import com.nashtech.assignment.pdh.request.SignupRequest;

@Service
public interface IAuthService {
	public ResponseEntity<?> authenticateUser(LoginRequest loginRequest);

	public ResponseEntity<?> signup(SignupRequest signUpRequest) throws ResourceNotFoundException;

//	ResponseEntity<?> logoutUser(HttpServletRequest request, HttpServletResponse response);
}
