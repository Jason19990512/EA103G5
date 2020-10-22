<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.tracking_list.model.*"%>
<%@ page import="com.members.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
		String memno = request.getParameter("memno");
	    TrackingListService trackinglistSvc = new TrackingListService();
// 	    List<TrackingListVO> list = trackinglistSvc.findByMemno(memno);
// 	    request.setAttribute("list",list);


// 		TrackingListService trackinglistSvc = new TrackingListService();
//    		List<TrackingListVO> list = trackinglistSvc.getAll();
//      	request.setAttribute("list",list);




%>

<%-- <jsp:useBean id="empSvc" scope="page" class="com.employee.model.*" /> --%>
<%-- <jsp:useBean id="memSvc" scope="page" class="com.members.model.*" /> --%>

<html>
<head>
<title>追蹤資料 - listAllTrackingFront.jsp</title>

<style>
  table#table-1 {
	background-color: #CCCCFF;
    border: 2px solid black;
    text-align: center;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: blue;
    display: inline;
  }
</style>

<style>
  table {
	width: 800px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
</style>

</head>
<body bgcolor='white'>


<table id="table-1">
	<tr><td>
		 <h3>所有追蹤資料 - listAllTracking.jsp</h3>
		 <h4><a href="<%= request.getContextPath() %>跳轉回瀏覽課程.jsp">跳轉回瀏覽課程</a></h4>
	</td></tr>
</table>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<table>
	<tr>
		<th>會員編號</th>
		<th>課程編號</th>
		
		
		
	</tr>
<%-- 	<%@ include file="page1.file" %>  --%>
<%-- 	<c:forEach var="trackinglistVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>"> --%>
		
<!-- 		<tr> -->
			
<%-- 			<td>${TrackingListVO.memno}</td> --%>
<%-- 			<td>${TrackingListVO.coursetno}</td> --%>
			
<%-- 			<td><c:forEach var="empVO" items="${empSvc.all}"> --%>
<%--                     <c:if test="${empVO.empno==empVO.empno}"> --%>
<%-- 	                    ${empVO.empno}【${empVO.empname} - ${emptVO.empemail}】 --%>
<%--                     </c:if> --%>
<%--                 </c:forEach> --%>
<!-- 			</td> -->
		
			
			
<!-- 			<td> -->
<%-- 			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/tracking_list/tracking_list.do" style="margin-bottom: 0px;"> --%>
<!-- 			     <input type="submit" value="取消追蹤"> -->
<%-- 			     <input type="hidden" name="memno" value="${trackinglistVO.memno}"> --%>
<%-- 			     <input type="hidden" name="courseno" value="${trackinglistVO.courseno}"> --%>
<!-- 			     <input type="hidden" name="action"	value="delete"></FORM> -->
<!-- 			</td> -->
			

			
<!-- 		</tr> -->
<%-- 	</c:forEach> --%>
</table>
<%-- <%@ include file="page2.file" %> --%>

</body>
</html>