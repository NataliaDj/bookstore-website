package edu.unsw.comp9321.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.unsw.comp9321.jdbc.UserDTO;
import edu.unsw.comp9321.jdbc.UserService;
import edu.unsw.comp9321.jdbc.Utilities;


public class LoginCommand implements Command{
	
	public LoginCommand() {
	}
	
	public String execute(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		String action = "";
		if (request.getParameter("action") != null) {
			action = request.getParameter("action");
		}
		String nextPage = "login.jsp";
		request.setAttribute("error", "" ); 
		
<<<<<<< HEAD
		if (action.equals("loggingin")) {			
=======
		if (action.equals("loggingin")) {
>>>>>>> 01fc8da187e4302818ec9186171e91fd5492507a
			UserService service = new UserService();
			
			String password = request.getParameter("password");
			
			UserDTO user = service.login(request.getParameter("username"), Utilities.generateMD5(password));
			if (user == null) {
				request.setAttribute("error", "Username and/or password is incorrect, please try again." );
				
			} else {
				// found user
				HttpSession session = request.getSession(true);
				session.setAttribute("username", request.getParameter("username")); // set user session so it remembers logged in
				session.setAttribute("user", user);
				nextPage = "register.jsp";
			}
		} 
		
<<<<<<< HEAD
=======

>>>>>>> 01fc8da187e4302818ec9186171e91fd5492507a
		return "/"+nextPage;
	}
	
	
	
	

}
