package edu.unsw.comp9321.web;

import java.io.IOException;

import edu.unsw.comp9321.jdbc.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminLoginCommand implements Command {

	private BookStoreDAO bookstoreDAO;

	public AdminLoginCommand() {
		DAOFactory factory = DAOFactory.getInstance();
		bookstoreDAO = factory.getBookStoreDAO();
	}

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		//get admin dto
		AdminDTO adminDTO = new AdminDTO();
		adminDTO.setId(request.getParameter("adminId"));
		adminDTO.setPassword(request.getParameter("password"));
		//check if provided credentials are legit
		String nextPage = "/adminLogin.jsp";
		if (bookstoreDAO.validAdmin(adminDTO)) {
			nextPage = "/index.jsp";
			request.getSession().setAttribute("adminAccount", "yes");
		} else if (adminDTO.getId() != null){
			request.setAttribute("loginFailed", "yes");	
		} 

		return nextPage;
	}

}
