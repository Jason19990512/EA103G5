<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.report_detail.model.*"%>

<%
  //????-如何先get到session member登入資料  才能夠去檢舉
		  ReportDetailVO reportdetailVO2 = new ReportDetailVO();//假資料
		  reportdetailVO2.setMemno("MEM0001");//假資料
		  reportdetailVO2.setPostno("POST0001");//假資料
// 		  reportdetailVO2.setReportno("REPO0005");//假資料
			reportdetailVO2.setEmpno("EMP0002");//假資料
			//reportdetailVO2.setCourseno("COUR0002");//假資料
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>新增檢舉 - addReport.jsp</title>

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
	width: 450px;
	margin-top: 1px;
	margin-bottom: 1px;
  }
  table, th, td {
    border: 0px solid #CCCCFF;
  }
  th, td {
    padding: 1px;
  }
  textarea{
  resize:none;
  }
</style>

</head>
<body bgcolor='white'>


<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/report_detail/report_detail.do" name="form1">
<table>

	<tr>
		<td>貼文編號:</td>
		<td><%=reportdetailVO2.getPostno()%></td>
	</tr>
	
	<tr>
		<td>會員編號:</td>
		<td><%=reportdetailVO2.getMemno()%></td>
	</tr>
<!-- <tr> -->
<!-- 		<td>課程編號:</td> -->
<%-- 		<td><%=reportdetailVO2.getCourseno()%></td> --%>
<!-- 	</tr> -->


</table>
<br>
<%-- <input type="hidden" name="empno" value="<%=reportdetailVO2.getCourseno()%>"/> --%>
<input type="hidden" name="memno" value="<%=reportdetailVO2.getMemno()%>"/>
<input type="hidden" name="postno" value="<%=reportdetailVO2.getPostno()%>"/>
<input type="hidden" name="action"	value="getOne_For_Update_AddReport">
<input type="submit" value="送出檢舉">
</FORM>


</body>




</html>