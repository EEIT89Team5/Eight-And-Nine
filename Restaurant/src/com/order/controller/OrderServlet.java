package com.order.controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.LinkedList;
import java.util.List;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dishclass.model.DishClassService;
import com.dishclass.model.DishClassVO;
import com.emp.model.EmpVO;
import com.member.model.MemberVO;
import com.order.model.OrderService;
import com.order.model.OrderVO;
import com.orderx.model.OrderXService;
import com.orderx.model.OrderXVO;
import com.product.model.ProductService;
import com.product.model.ProductVO;
import com.table.model.TableService;
import com.table.model.TableVO;

@WebServlet("/order/order.do")
public class OrderServlet extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		// 顯示單筆訂單明細
		if ("get_one_for_display".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				String str = req.getParameter("orderno");

				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入訂單編號");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/order/listAllOrder.jsp");
					failureView.forward(req, resp);
					return;
				}

				Integer order_id = null;

				try {
					order_id = new Integer(str);
				} catch (NumberFormatException e) {
					errorMsgs.add("訂單編號格式不正確");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/order/listAllOrder.jsp");
					failureView.forward(req, resp);
					return;
				}

				OrderService orderSvc = new OrderService();
				OrderVO orderVO = orderSvc.getOneOrder(order_id);

				if (orderVO == null) {
					errorMsgs.add("查無資料");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/order/listAllOrder.jsp");
					failureView.forward(req, resp);
					return;
				}
				List<OrderXVO> orderXVOs = orderSvc.getOneOrderDetails(order_id);

				req.setAttribute("orderno", order_id);
				req.setAttribute("orderXVOs", orderXVOs);
				String url = "/order/listOneOrderDetails.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, resp);
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/order/listAllOrder.jsp");
				failureView.forward(req, resp);
			}
		}

		// 開始點餐(輸入桌號、人數、會員、員工)
		if ("begin_order".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				String table = req.getParameter("table").trim();// 桌號

				TableService tableSvc = new TableService();
				TableVO tableVO = tableSvc.getOneTable(table);
				System.out.println(tableVO);
				Integer people = tableVO.getTable_numP();// 人數
				String test = req.getParameter("member").trim();
				Integer member = null;
				if (test != "") {
					member = new Integer(req.getParameter("member").trim());// 會員
				}
				Integer employee = new Integer(req.getParameter("employee").trim());// 員工

				OrderVO orderVO = new OrderVO();// set訂單orderVO

				orderVO.setOrder_table(table);
				orderVO.setOrder_numP(people);
				if (test != "") {
					MemberVO memberVO = new MemberVO();
					memberVO.setMember_id(member);
					orderVO.setMemberVO(memberVO);
				}
				EmpVO empVO = new EmpVO();
				empVO.setEmp_id(employee);
				orderVO.setEmpVO(empVO);

				if (!errorMsgs.isEmpty()) {
					req.setAttribute("orderVO", orderVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/order/addOrder1.jsp");
					failureView.forward(req, resp);
					return;
				}

				HttpSession session = req.getSession();
				session.setAttribute("orderVO", orderVO);// session存入訂單orderVO

				List<OrderXVO> orderList = new LinkedList<OrderXVO>();// 新增購物車
				session.setAttribute("orderList", orderList);// session存入購物車orderList

				Integer mainQ = 0;
				session.setAttribute("mainQ", mainQ);

				Integer pcgQ = 0;
				session.setAttribute("pcgQ", pcgQ);

				Integer orderQ = 0;
				session.setAttribute("orderQ", orderQ);

				Integer orderP = 0;
				session.setAttribute("orderP", orderP);

				DishClassService classSvc = new DishClassService();
				DishClassVO classVO = classSvc.getOneClass(10);
				session.setAttribute("classVO", classVO);// session存入菜色類型classVO(各種forward後可以回到先前狀態)

				ProductService productSvc = new ProductService();
				List<ProductVO> productList = productSvc.getSingleDishesByClass(10);
				session.setAttribute("productList", productList);// session存入菜色類型之菜色List
																	// productList(各種forward後可以回到先前狀態)
				System.out.println(session);
				String url = "/order/addOrder2.jsp";// 至addOrder2購物
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, resp);

			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				System.out.println(e);
				RequestDispatcher failureView = req.getRequestDispatcher("/order/addOrder1.jsp");
				failureView.forward(req, resp);
			}

		}

		// 選擇單點菜色類別
		if ("choose_S_class".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {

				HttpSession session = req.getSession();

				Integer class_id = new Integer(req.getParameter("class"));// 讀取新類別

				DishClassService classSvc = new DishClassService();
				DishClassVO classVO = classSvc.getOneClass(class_id);

				session.setAttribute("classVO", classVO);// classVO存入session

				ProductService productSvc = new ProductService();
				List<ProductVO> productList = productSvc.getSingleDishesByClass(class_id);

				session.setAttribute("productList", productList);// productList存入session

				String url = "/order/addOrder2.jsp";// 至addOrder2繼續購物
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, resp);

			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/order/addOrder2.jsp");
				failureView.forward(req, resp);
			}

		}

		// 新增菜色至購物車
		if ("add_S_orderX".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			System.out.println("==========================================");
			try {
				HttpSession session = req.getSession();

				Integer product_id = new Integer(req.getParameter("product"));
				Integer product_price = new Integer(req.getParameter("price"));
				Integer orderX_num = new Integer(req.getParameter("number"));

				ProductService productSvc = new ProductService();// 查詢Product並丟productVO至購物車
				ProductVO productVO = null;
				productVO = productSvc.findByPrimaryKey(product_id);

				List<OrderXVO> orderList = (List<OrderXVO>) session.getAttribute("orderList");
				boolean match = false;// 以下判斷productVO是否已存在在購物車明細中
				for (int i = 0; i < orderList.size(); i++) {
					// 存在增加原有明細orderX_num
					if ((orderList.get(i).getProductVO().getProduct_id()).equals(product_id)) {
						Integer number = orderList.get(i).getOrderX_num();
						orderList.get(i).setOrderX_num(number + orderX_num);
						match = true;
					}
				}
				// 不存在直接加入購物車
				if (!match) {
					OrderXVO orderXVO = new OrderXVO();
					orderXVO.setProductVO(productVO);
					orderXVO.setOrderX_num(orderX_num);
					orderList.add(orderXVO);
				}
				session.setAttribute("orderList", orderList);// session存入新orderList

				if (productVO.getProductKindVO().getKind_id() == 2) {// 若新增套餐修改pcgQ
					Integer pcgQ = (Integer) session.getAttribute("pcgQ");
					pcgQ = pcgQ + orderX_num;
					session.setAttribute("pcgQ", pcgQ);
				} else if (productVO.getProductKindVO().getKind_id() == 1) {// 若新增單點主菜修改mainQ
					if (productVO.getDishClassVO().getClass_id() == 40) {
						Integer mainQ = (Integer) session.getAttribute("mainQ");
						mainQ = mainQ + orderX_num;
						session.setAttribute("mainQ", mainQ);
					}
				}

				Integer orderQ = (Integer) session.getAttribute("orderQ");// 修改orderQ
				orderQ = orderQ + orderX_num;
				session.setAttribute("orderQ", orderQ);

				Integer orderP = (Integer) session.getAttribute("orderP");// 修改orderP
				orderP = orderP + product_price * orderX_num;
				session.setAttribute("orderP", orderP);

				OrderVO orderVO = (OrderVO) session.getAttribute("orderVO");
				orderVO.setOrder_price(orderP);// 查詢orderVO最新價格
				session.setAttribute("orderVO", orderVO);// session存入新orderVO

				String url = "/order/addOrder2.jsp";// 至addOrder2繼續購物
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, resp);

			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				System.out.println(e);
				RequestDispatcher failureView = req.getRequestDispatcher("/order/addOrder2.jsp");
				failureView.forward(req, resp);
			}
		}

		// 修改明細數量
		if ("alter_S_orderX".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {

				HttpSession session = req.getSession();

				List<OrderXVO> orderList = (List<OrderXVO>) session.getAttribute("orderList");

				Integer alt = new Integer(req.getParameter("alt").trim());
				Integer altNumber = new Integer(req.getParameter("altNumber").trim());

				OrderXVO alterOrderXVO = orderList.get(alt - 1);
				Integer productId = alterOrderXVO.getProductVO().getProduct_id();
				Integer productP = alterOrderXVO.getProductVO().getProduct_price();
				Integer oldQ = alterOrderXVO.getOrderX_num();

				ProductService productSvc = new ProductService();
				ProductVO productVO = productSvc.findByPrimaryKey(productId);

				if (productVO.getProductKindVO().getKind_id() == 2) {// 若修改套餐修改pcgQ
					Integer pcgQ = (Integer) session.getAttribute("pcgQ");
					pcgQ = pcgQ - oldQ + altNumber;
					session.setAttribute("pcgQ", pcgQ);
				} else if (productVO.getProductKindVO().getKind_id() == 1) {// 若修改單點主菜修改mainQ
					if (productVO.getDishClassVO().getClass_id() == 40) {
						Integer mainQ = (Integer) session.getAttribute("mainQ");
						mainQ = mainQ - oldQ + altNumber;
						session.setAttribute("mainQ", mainQ);
					}
				}

				Integer orderQ = (Integer) session.getAttribute("orderQ");
				Integer orderP = (Integer) session.getAttribute("orderP");
				orderQ = orderQ - oldQ + altNumber;
				orderP = orderP + (altNumber - oldQ) * productP;
				session.setAttribute("orderQ", orderQ);
				session.setAttribute("orderP", orderP);

				OrderXVO deleteOrderXVO = orderList.get(alt - 1);
				orderList.get(alt - 1).setOrderX_num(altNumber);// 修改orderList

				session.setAttribute("orderList", orderList);// session存入最新orderList

				OrderXService orderXSvc = new OrderXService();

				OrderVO orderVO = (OrderVO) session.getAttribute("orderVO");
				orderVO.setOrder_price(orderP);// 查詢orderVO最新價格
				session.setAttribute("orderVO", orderVO);// session存入最新orderVO

				String url = "/order/orderList.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, resp);

			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/order/orderList.jsp");
				failureView.forward(req, resp);
			}

		}

		// 刪除明細
		if ("delete_S_orderX".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {

				HttpSession session = req.getSession();

				List<OrderXVO> orderList = (List<OrderXVO>) session.getAttribute("orderList");

				Integer del = new Integer(req.getParameter("del").trim());// 取得要刪除orderList裡物件的位置

				OrderXVO deleteOrderXVO = orderList.get(del - 1);
				Integer productId = deleteOrderXVO.getProductVO().getProduct_id();
				Integer oldQ = deleteOrderXVO.getOrderX_num();

				ProductService productSvc = new ProductService();
				ProductVO productVO = productSvc.findByPrimaryKey(productId);

				if (productVO.getProductKindVO().getKind_id() == 2) {// 若修改套餐修改pcgQ
					Integer pcgQ = (Integer) session.getAttribute("pcgQ");
					pcgQ = pcgQ - oldQ;
					session.setAttribute("pcgQ", pcgQ);
				} else if (productVO.getProductKindVO().getKind_id() == 1) {// 若修改單點主菜修改mainQ
					if (productVO.getDishClassVO().getClass_id() == 40) {
						Integer mainQ = (Integer) session.getAttribute("mainQ");
						mainQ = mainQ - oldQ;
						session.setAttribute("mainQ", mainQ);
					}
				}

				Integer orderQ = (Integer) session.getAttribute("orderQ");
				Integer orderP = (Integer) session.getAttribute("orderP");
				session.setAttribute("orderQ", orderQ);
				session.setAttribute("orderP", orderP);
				orderQ = orderQ - deleteOrderXVO.getOrderX_num();
				orderP = orderP - (deleteOrderXVO.getOrderX_num()) * (deleteOrderXVO.getProductVO().getProduct_price());

				orderList.remove(deleteOrderXVO);// 刪除

				session.setAttribute("orderQ", orderQ);
				session.setAttribute("orderP", orderP);

				session.setAttribute("orderList", orderList);// session存入最新orderList

				OrderXService orderXSvc = new OrderXService();

				OrderVO orderVO = (OrderVO) session.getAttribute("orderVO");
				orderVO.setOrder_price(orderXSvc.getTotalPrice(orderList));// 查詢orderVO最新價格
				session.setAttribute("orderVO", orderVO);// session存入最新orderVO

				String url = "/order/orderList.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, resp);

			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/order/orderList.jsp");
				failureView.forward(req, resp);
			}

		}

		// 查看購物車
		if ("check_orderList".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {

				String url = "/order/orderList.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, resp);// 至購物車頁面

			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/order/addOrder2.jsp");
				failureView.forward(req, resp);
			}

		}

		// 訂單送出
		if ("final_order".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				HttpSession session = req.getSession();

				long currentTime = System.currentTimeMillis();// 取得現在時間

				List<OrderXVO> orderList = (List<OrderXVO>) session.getAttribute("orderList");
				for (OrderXVO orderXVOs : orderList) {
					orderXVOs.setOrderX_time(new Timestamp(currentTime));// 把現在時間輸入每筆訂單明細時間
					orderXVOs.setOrderX_status("處理中");// 把"處理中"輸入每筆訂單明細狀態
				}

				// OrderXService orderXSvc = new OrderXService();
				// Integer totalP = orderXSvc.getTotalPrice(orderList);

				OrderVO orderVO = (OrderVO) session.getAttribute("orderVO");// 從session取出orderVO
				orderVO.setOrder_date(new Date(currentTime));// 把現在時間訂單時間
				// orderVO.setOrder_price(totalP);
				OrderService orderSvc = new OrderService();
				orderVO = orderSvc.addOrderWithX(orderVO, orderList);// orderVO及orderList一併由Service方法送入資料庫中
				String table_name = orderVO.getOrder_table();
				TableService tableSvc = new TableService();
				TableVO tableVO = tableSvc.getOneTable(table_name);
				tableVO.setTable_status("用餐中");
				tableSvc.update(tableVO);
				session.setAttribute("orderVO", orderVO);

				String url = "/order/addOrder3.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, resp);

			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				System.out.println(e);
				RequestDispatcher failureView = req.getRequestDispatcher("/order/orderList.jsp");
				failureView.forward(req, resp);
			}
		}

		// 繼續購物
		if ("keep_order".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {

				String url = "/order/addOrder2.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, resp);

			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/order/orderList.jsp");
				failureView.forward(req, resp);
			}
		}

		// 加點選擇桌位
		if ("addition1".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				System.out.println("23");
				Integer order_id = new Integer(req.getParameter("order_id").trim());

				OrderService orderSvc = new OrderService();
				OrderVO orderVO = orderSvc.getOneOrder(order_id);// 取得原訂單
				List<OrderXVO> oldList = orderSvc.getOneOrderDetails(order_id);// 取得原訂單明細

				if (!errorMsgs.isEmpty()) {
					req.setAttribute("orderVO", orderVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/order/addOrder1.jsp");
					failureView.forward(req, resp);
					return;
				}

				HttpSession session = req.getSession();
				session.setAttribute("orderVO", orderVO);
				session.setAttribute("oldList", oldList);// 原本訂單明細

				List<OrderXVO> orderList = new LinkedList<OrderXVO>();
				session.setAttribute("orderList", orderList);// 新增之訂單明細

				Integer orderQ = 0;
				session.setAttribute("orderQ", orderQ);

				Integer orderP = 0;
				session.setAttribute("orderP", orderP);

				DishClassService classSvc = new DishClassService();
				DishClassVO classVO = classSvc.getOneClass(10);
				session.setAttribute("classVO", classVO);

				ProductService productSvc = new ProductService();
				List<ProductVO> productList = productSvc.getSingleDishesByClass(10);
				session.setAttribute("productList", productList);

				String url = "/order/additional2.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, resp);

			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/order/additional1.jsp");
				failureView.forward(req, resp);
			}
		}

		if ("add_choose_S_class".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {

				HttpSession session = req.getSession();

				Integer class_id = new Integer(req.getParameter("class"));

				DishClassService classSvc = new DishClassService();
				DishClassVO classVO = classSvc.getOneClass(class_id);

				session.setAttribute("classVO", classVO);

				ProductService productSvc = new ProductService();
				List<ProductVO> productList = productSvc.getSingleDishesByClass(class_id);

				session.setAttribute("productList", productList);

				String url = "/order/additional2.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, resp);

			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/order/additional2.jsp");
				failureView.forward(req, resp);
			}

		}

		if ("add_add_S_orderX".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				HttpSession session = req.getSession();

				Integer product_id = new Integer(req.getParameter("product"));
				Integer product_price = new Integer(req.getParameter("price"));
				Integer orderX_num = new Integer(req.getParameter("number"));

				ProductService productSvc = new ProductService();
				ProductVO productVO = null;
				productVO = productSvc.findByPrimaryKey(product_id);

				List<OrderXVO> orderList = (List<OrderXVO>) session.getAttribute("orderList");

				boolean match = false;
				for (int i = 0; i < orderList.size(); i++) {
					if ((orderList.get(i).getProductVO().getProduct_id()).equals(product_id)) {
						Integer number = orderList.get(i).getOrderX_num();
						orderList.get(i).setOrderX_num(number + orderX_num);
						match = true;
					}
				}
				if (!match) {
					OrderXVO orderXVO = new OrderXVO();
					orderXVO.setProductVO(productVO);
					orderXVO.setOrderX_num(orderX_num);
					orderList.add(orderXVO);
				}

				Integer orderQ = (Integer) session.getAttribute("orderQ");// 修改orderQ
				orderQ = orderQ + orderX_num;
				session.setAttribute("orderQ", orderQ);

				Integer orderP = (Integer) session.getAttribute("orderP");// 修改orderP
				orderP = orderP + product_price * orderX_num;
				session.setAttribute("orderP", orderP);

				session.setAttribute("orderList", orderList);

				String url = "/order/additional2.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, resp);

			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/order/additional2.jsp");
				failureView.forward(req, resp);
			}
		}

		if ("add_alter_S_orderX".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {

				HttpSession session = req.getSession();

				List<OrderXVO> orderList = (List<OrderXVO>) session.getAttribute("orderList");

				Integer alt = new Integer(req.getParameter("alt").trim());
				Integer altNumber = new Integer(req.getParameter("altNumber").trim());

				Integer oldQ = orderList.get(alt - 1).getOrderX_num();
				Integer productP = orderList.get(alt - 1).getProductVO().getProduct_price();

				Integer orderQ = (Integer) session.getAttribute("orderQ");
				Integer orderP = (Integer) session.getAttribute("orderP");
				orderQ = orderQ - oldQ + altNumber;
				orderP = orderP + (altNumber - oldQ) * productP;
				session.setAttribute("orderQ", orderQ);
				session.setAttribute("orderP", orderP);

				orderList.get(alt - 1).setOrderX_num(altNumber);

				session.setAttribute("orderList", orderList);

				String url = "/order/additionalorderList.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, resp);

			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/order/additionalorderList.jsp");
				failureView.forward(req, resp);
			}

		}

		if ("add_delete_S_orderX".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {

				HttpSession session = req.getSession();

				List<OrderXVO> orderList = (List<OrderXVO>) session.getAttribute("orderList");

				Integer del = new Integer(req.getParameter("del").trim());

				OrderXVO deleteOrderXVO = orderList.get(del - 1);

				Integer orderQ = (Integer) session.getAttribute("orderQ");
				Integer orderP = (Integer) session.getAttribute("orderP");

				orderQ = orderQ - deleteOrderXVO.getOrderX_num();
				orderP = orderP - (deleteOrderXVO.getOrderX_num()) * (deleteOrderXVO.getProductVO().getProduct_price());

				orderList.remove(deleteOrderXVO);

				session.setAttribute("orderQ", orderQ);
				session.setAttribute("orderP", orderP);

				session.setAttribute("orderList", orderList);

				String url = "/order/additionalorderList.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, resp);

			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/order/additionalorderList.jsp");
				failureView.forward(req, resp);
			}

		}

		if ("add_check_orderList".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {

				String url = "/order/additionalorderList.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, resp);

			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/order/additionaladdOrder2.jsp");
				failureView.forward(req, resp);
			}

		}

		if ("add_final_order".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {

				HttpSession session = req.getSession();

				long currentTime = System.currentTimeMillis();

				Time orderTime = new Time(currentTime);
				req.setAttribute("time", orderTime);

				List<OrderXVO> orderList = (List<OrderXVO>) session.getAttribute("orderList");

				for (OrderXVO orderXVOs : orderList) {
					orderXVOs.setOrderX_time(new Timestamp(currentTime));
					orderXVOs.setOrderX_status("處理中");
				}

				OrderXService orderXSvc = new OrderXService();
				Integer totalP = (Integer) session.getAttribute("orderP");

				OrderVO orderVO = (OrderVO) session.getAttribute("orderVO");
				Integer oldP = orderVO.getOrder_price();
				orderVO.setOrder_price(oldP + totalP);

				OrderService orderSvc = new OrderService();
				orderVO = orderSvc.addOrderWithNewX(orderVO, orderList);

				String table_name = orderVO.getOrder_table();
				TableService tableSvc = new TableService();
				TableVO tableVO = tableSvc.getOneTable(table_name);
				tableVO.setTable_status("用餐中");
				tableSvc.update(tableVO);

				session.setAttribute("orderVO", orderVO);

				orderList = orderSvc.getOneOrderDetails(orderVO.getOrder_id());
				session.setAttribute("orderList", orderList);

				String url = "/order/additional3.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, resp);

			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				System.out.println(e);
				RequestDispatcher failureView = req.getRequestDispatcher("/order/additionalorderList.jsp");
				failureView.forward(req, resp);
			}
		}

		if ("add_keep_order".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {

				String url = "/order/additional2.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, resp);

			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/order/additionalorderList.jsp");
				failureView.forward(req, resp);
			}
		}
	}

}
