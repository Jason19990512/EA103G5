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
<jsp:useBean id="CourseSvc" scope="page" class="com.course.model.CourseService" />
 
<!DOCTYPE html>
<html>
<head>
<title>�ӷ|�����Ҹլ���</title>
<style>
.font{
	font-weight: 700;
    font-size: 20px;
    color: #09adbf;
}
.statement{
	background: #fff;
    border: 1px solid rgba(0,0,0,.15);
    border-radius: .25rem;
    padding: 30px;
    margin-top: 15px;
}
.statementTitle{
	padding-left: 8px;
    border-left: 2px solid #14bdcc;
    font-weight: 700;
    margin-bottom: 4px;
    line-height: 20px;
    font-size: 20px;
}
.statementContent{
	padding-left: 10px;
    font-size: 20px;
    color: rgba(0,0,0,.6);
}

tr.bg-color:hover{
	BACKGROUND-COLOR: rgba(20, 189, 204, 0.1);
	 cursor: pointer;
}
</style>

</head>

<body>
<!-- include �e�x������ header -->
	<jsp:include page="/index/front-index/header.jsp" />
	<div id="hero-area" style="background-image: none">
		<div class="container">

				<h2 class="font">${CourseSvc.getOneCourse(param.courseno).coursename}</h2>
				<div class="statement">
					<div class="statementTitle">����y�z</div>
					<div class="statementContent">�ҫ�m��</div>
					<div class="statementTitle">�@������</div>
					<div class="statementContent">��������</div>
					<div class="statementTitle">�����D��</div>
					<div class="statementContent">10�D</div>
				</div>
				
				<h3 class="font" style="margin:20px 0;">���v����</h3>
				<div class="statement">
					<table class="table ">
  						<thead>
    						<tr>
    							<th scope="col">#</th>
      							<th scope="col">����ɶ�</th>
      							<th scope="col">����椸</th>
      							<th scope="col">����</th>
    						</tr>
  						</thead>
  							<c:forEach var="TestsVO" items="${recordList}" varStatus="counter" >
  								<tbody>
  								<FORM METHOD="post" ACTION="<%= request.getContextPath()%>/question/questionTest.do" id="myForm${counter.count}" style="margin-bottom: 0px;">
    								<tr id="review${counter.count}" class="bg-color">
    									<th>${counter.count}</th>
										<td><fmt:formatDate value="${TestsVO.testtime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
										<td >${TestsVO.testscope}</td>
										<td>${TestsVO.score}</td>
<!-- 			     								<input type="submit" value="�˵�"> -->
			     								<input type="hidden" name="selectedTestno"  value="${TestsVO.testno}">
			     								<input type="hidden" name="courseno"  value="${TestsVO.courseno}">
			     								<input type="hidden" name="action"	value="reviewByTestNo">
    								</tr>
    							</FORM>
 						 		</tbody>
 						 	</c:forEach>
					</table>
				</div>
			</div>
       </div>
<!-- <table id="table-1"> -->
<!-- 	<tr><td> -->
<!-- 		 <h3>�ӦҥͦҸլ���</h3> -->
<!-- 		 <h4><img src="../images/tomcat.gif" width="100" height="100" border="0"></h4> -->
<!-- 	</td></tr> -->
<!-- </table> -->
<!-- <table table-collapse> -->
<!-- 	<tr> -->
<!-- 		<th>�ҵ{�W��</th> -->
<!-- 		<th>����d��</th> -->
<!-- 		<th>����ɶ�</th> -->
<!-- 		<th>�������</th> -->
<%-- 		<th><a href="<%= request.getContextPath()%>/front-end/test/SelectedTest.jsp">�^����</a></th> --%>
<!-- 	</tr> -->
<%-- 	 <%@ include file="page/page1.file" %> --%>
<%-- 	<c:forEach var="TestsVO" items="${recordList}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>"> --%>
		
<!-- 		<tr> -->
<%-- 			<td>${TestsVO.courseno}</td> --%>
<%-- 			<td>${TestsVO.testscope}</td> --%>
<%-- 			<td><fmt:formatDate value="${TestsVO.testtime}" pattern="yyyy-MM-dd HH:mm:ss"/></td> --%>
<%-- 			<td>${TestsVO.score}</td> --%>
<!-- 			<td> -->
<%-- 			  <FORM METHOD="post" ACTION="<%= request.getContextPath()%>/question/questionTest.do" style="margin-bottom: 0px;"> --%>
<!-- 			     <input type="submit" value="�˵�"> -->
<%-- 			     <input type="hidden" name="selectedTestno"  value="${TestsVO.testno}"> --%>
<%-- 			     <input type="hidden" name="courseno"  value="${TestsVO.courseno}"> --%>
<!-- 			     <input type="hidden" name="action"	value="reviewByTestNo"> -->
			     
<!-- 			  </FORM> -->
<!-- 			</td> -->
			
<!-- 		</tr> -->
<%-- 	</c:forEach> --%>
	
<!-- </table> -->

<%-- <%@ include file="page/page2.file" %> --%>
<script>
	$(document).ready(function(){
		for(let i = 1 ; i <= '${recordList.size()}' ; i++){
			console.log(i);
			$('body').on('click' , '#review'+i,function(e){
				e.preventDefault();
				$('#myForm' + i ).submit();
			});
		}
	});
</script>
<jsp:include page="/index/front-index/footer.jsp" />
</body>
</html>