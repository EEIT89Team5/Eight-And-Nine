package com.order.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import com.emp.model.EmpService;
import com.emp.model.EmpVO;
import com.member.model.MemberService;
import com.member.model.MemberVO;
import com.order.model.OrderService;
import com.order.model.OrderVO;
import com.orderx.model.OrderXVO;
import com.product.model.ProductService;
import com.product.model.ProductVO;
import com.table.model.TableService;
import com.table.model.TableVO;

@WebServlet("/androidorder")
public class OrderForAndroid extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");

		System.out.println("QQQ");

		StringBuilder sb = new StringBuilder();
		try {
			BufferedReader body =req.getReader();
			
			body.mark(10000);
			String line;
			do {
				line = body.readLine();
				sb.append(line).append("\n");

			} while (line != null);
			body.reset();
		} catch (IOException e) {
			e.printStackTrace();
		}

		String jsoncontent=URLDecoder.decode(sb.toString(),"UTF-8");
		System.out.println(jsoncontent);
		

		 JSONObject json=new JSONObject(jsoncontent);
		 JSONObject orderJson=json.getJSONObject("orderVO");
		 OrderVO orderVO=new OrderVO();
		 orderVO.setOrder_numP(orderJson.getInt("order_numP"));
		 orderVO.setOrder_date(Date.valueOf(orderJson.getString("order_date")));
		 orderVO.setOrder_table(orderJson.getString("order_table"));
		 orderVO.setOrder_price(orderJson.getInt("order_price"));
		 MemberService memberSvc=new MemberService();
		 MemberVO memberVO = memberSvc.findByPrimaryKey(orderJson.getInt("order_member"));
		 orderVO.setMemberVO(memberVO);
		 EmpService empSvc=new EmpService();
		 EmpVO empVO = empSvc.getOneEmp(orderJson.getInt("order_emp"));
		 //EmpVO empVO = empSvc.getOneEmp(1001);
		 orderVO.setEmpVO(empVO);
		 
		 List<OrderXVO> orderlist=new LinkedList<OrderXVO>();
		 JSONArray orderListJson=json.getJSONArray("orderlist");
		 OrderXVO orderXVO;
		 ProductVO productVO;
		 ProductService productSvc=new ProductService();
		 for(Object objectorderX:orderListJson){
			 orderXVO=new OrderXVO();
			 JSONObject jsonorderX=(JSONObject)objectorderX;
			 productVO=productSvc.findByPrimaryKey(jsonorderX.getInt("product_id"));
			 orderXVO.setProductVO(productVO);
			 orderXVO.setOrderX_time(Timestamp.valueOf(jsonorderX.getString("orderX_time")));
			 orderXVO.setOrderX_num(jsonorderX.getInt("orderX_num"));
			 orderXVO.setOrderX_status("未製作");
			 orderlist.add(orderXVO);
		 }
		 
		OrderService orderSvc=new OrderService();
		orderSvc.addOrderWithNewX(orderVO, orderlist);
		 
		TableService tableSvc=new TableService();
		TableVO tableVO = tableSvc.getOneTable(orderVO.getOrder_table());
		tableVO.setTable_status("用餐中");
		tableSvc.update(tableVO);


		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter out = resp.getWriter();
		out.print("^^");

	}

}
