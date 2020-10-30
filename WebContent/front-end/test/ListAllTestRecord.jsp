<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*,com.tests.model.*,com.members.model.*" %>

<%
	MembersVO Membersvo = (MembersVO) request.getSession().getAttribute("loginMembersVO");

	TestsService testSvc = new TestsService();
	List<TestsVO>  recordList = testSvc.getAll(Membersvo.getMemno());
	pageContext.setAttribute("recordList",recordList);
	
%>

 
<!DOCTYPE html>
<html>
<head>
<title>�ӷ|�����Ҹլ���</title>
<style>
  table#table-1 {
	background-color: #66CCFF;
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

<body>

<table id="table-1">
	<tr><td>
		 <h3>�ӦҥͦҸլ���</h3>
		 <h4><img src="../images/tomcat.gif" width="100" height="100" border="0"></h4>
	</td></tr>
</table>
<table table-collapse>
	<tr>
		<th>�ҵ{�W��</th>
		<th>����d��</th>
		<th>����ɶ�</th>
		<th>�������</th>
		<th><a href="<%= request.getContextPath()%>/front-end/test/SelectedTest.jsp">�^����</a></th>
	</tr>
	 <%@ include file="page/page1.file" %>
	<c:forEach var="TestsVO" items="${recordList}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
			<td>${TestsVO.courseno}</td>
			<td>${TestsVO.testscope}</td>
			<td><fmt:formatDate value="${TestsVO.testtime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			<td>${TestsVO.score}</td>
			<td>
			  <FORM METHOD="post" ACTION="<%= request.getContextPath()%>/question/questionTest.do" style="margin-bottom: 0px;">
			     <input type="submit" value="�˵�">
			     <input type="hidden" name="selectedTestno"  value="${TestsVO.testno}">
			     <input type="hidden" name="courseno"  value="${TestsVO.courseno}">
			     <input type="hidden" name="action"	value="reviewByTestNo">
			     
			  </FORM>
			</td>
			
		</tr>
	</c:forEach>
	
</table>

<%@ include file="page/page2.file" %>
</body>
</html>