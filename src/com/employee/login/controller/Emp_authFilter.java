package com.employee.login.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.emp_authority.model.EmpAuthorityVO;

public class Emp_authFilter implements Filter {

	private FilterConfig config;

	public void init(FilterConfig config) throws ServletException {
		this.config = config;
	}

	public void destroy() {
		config = null;
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;

		HttpSession session = req.getSession();
		List<EmpAuthorityVO> empauthlist = (List<EmpAuthorityVO>) session.getAttribute("empauth");

		List<String> list = new ArrayList<>();

		for (int i = 0; i < empauthlist.size(); i++) {
			list.add(empauthlist.get(i).getFuncno());
		}

		String urls = req.getRequestURI();
		System.out.println(urls);
		List<String> FUN0001 = new ArrayList<>();
		FUN0001.add(req.getContextPath() + "/back-end/employee/newallemp.jsp");
		FUN0001.add(req.getContextPath() + "/back-end/employee/newadd_emp.jsp");
		FUN0001.add(req.getContextPath() + "/back-end/employee/newupdate_emp.jsp");
		FUN0001.add(req.getContextPath() + "/back-end/employee/empone.jsp");

		List<String> FUN0002 = new ArrayList<>();
		FUN0002.add(req.getContextPath() + "/back-end/members/select_members.jsp");
		FUN0002.add(req.getContextPath() + "/back-end/members/listAllMembers.jsp");
		FUN0002.add(req.getContextPath() + "/back-end/members/listOneMembers.jsp");

		List<String> FUN0003 = new ArrayList<>();
		FUN0003.add(req.getContextPath() + "/back-end/teacher/select_teacher.jsp");
		FUN0003.add(req.getContextPath() + "/back-end/teacher/listAllTeachers.jsp");
		FUN0003.add(req.getContextPath() + "/back-end/teacher/listAllPendingTeachers.jsp");
		FUN0003.add(req.getContextPath() + "/back-end/teacher/showOneTeacher.jsp");
		FUN0003.add(req.getContextPath() + "/back-end/teacher/listOneTeacher.jsp");

		if (list.contains("FUN0001") && FUN0001.contains(urls)) {
			chain.doFilter(request, response);
		} else if (list.contains("FUN0002") && FUN0002.contains(urls)) {
			chain.doFilter(request, response);
		} else if (list.contains("FUN0003") && FUN0003.contains(urls)) {
			chain.doFilter(request, response);
		} else {
			session.setAttribute("error", "你沒有權限!");
			System.out.println("跑到這");
			res.sendRedirect(req.getContextPath() + "/back-end/index/homepage.jsp");
		}

	}

}
