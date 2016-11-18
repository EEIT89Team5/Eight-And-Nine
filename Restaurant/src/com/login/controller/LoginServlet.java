package com.login.controller;

import java.io.IOException;
import java.util.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.emp.model.EmpService;
import com.emp.model.EmpVO;


public class LoginServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();

		Map<String, String> errorMsgMap = new HashMap<String, String>();

		request.setAttribute("ErrorMsgKey", errorMsgMap);

		String userId = request.getParameter("userId");
		String password = request.getParameter("pswd");

		
		if (userId == null || userId.trim().length() == 0) {
			errorMsgMap.put("AccountEmptyError", "帳號欄必須輸入");
		}

		if (password == null || password.trim().length() == 0) {
			errorMsgMap.put("PasswordEmptyError", "密碼欄必須輸入");
		}

		if (!errorMsgMap.isEmpty()) {
			RequestDispatcher rd = request
					.getRequestDispatcher("/login/login.jsp");
			rd.forward(request, response);
			return;
		}

		EmpService ls = new EmpService();

		EmpVO mb = ls.checkIDPassword(userId);

		String tl="經理";
		if (mb != null && password.equals(mb.getEmp_password())) {
			session.setAttribute("LoginOK", mb);

			if(mb !=null && password.equals(mb.getEmp_password()) && tl.equals(mb.getEmp_title())){
				session.setAttribute("TitleOK", mb);
			}
			else{
				session.setAttribute("LoginOK", mb);
			}

			
		}
		else {
			
			errorMsgMap.put("LoginError", "該帳號不存在或密碼錯誤");
		}

		if (errorMsgMap.isEmpty()) {

			String contextPath = getServletContext().getContextPath();
			String target = (String) session.getAttribute("target");
			if (target != null) {

				session.removeAttribute("target");

				response.sendRedirect(contextPath + target);

			} else {
				response.sendRedirect(contextPath + "/index_theme.jsp");
			}
			return;
		} else {

			RequestDispatcher rd = request
					.getRequestDispatcher("/login/login.jsp");
			rd.forward(request, response);
			return;
		}
	}
}
