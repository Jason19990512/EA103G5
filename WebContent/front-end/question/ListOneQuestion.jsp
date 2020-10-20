<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.question_bank.model.*"%>
<%
	QuestionBankVO QuestionBankvo = (QuestionBankVO)request.getAttribute("QuestionBankvo");
	
	
	
	if(QuestionBankvo!=null && QuestionBankvo.getOp1()!=null){
    StringBuilder testAns = new StringBuilder();
    
    
    for(int i = 0 ; i < QuestionBankvo.getQuans().length();i++){
      if(QuestionBankvo.getQuans().charAt(i) =='1'){
        testAns.append((char)(65+i));
      }
    }
    pageContext.setAttribute("testAns",testAns.toString());
  }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Bootstrap CRUD Data Table for Database with Modal Form</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="http://www.bootcss.com/p/bootstrap-switch/static/stylesheets/bootstrapSwitch.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/front-end/css/listAll.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container-xl">
        <div class="table-responsive">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Manage <b>TestQuestion</b></h2>
                        </div>
                        <div class="col-sm-6">
                            <a href='<%= request.getContextPath()%>/front-end/question/ListAllQuestion.jsp' class="btn btn-success" ><span>
Back to the question bank</span></a>
                        </div>
                    </div>
                </div>
                <table class="table table-striped table-hover">
                   
                        <tr>
                            <td>題目編號</td><td>${QuestionBankvo.qbankno }</td>
                        </tr>
                        <tr>
                            <td>課程名稱</td><td>${QuestionBankvo.courseno }</td>
                        </tr>
                        <tr>    
                            <td>課程難易度</td><td>${QuestionBankvo.typeno }</td>
                        </tr>
                        <tr>                            
                        	<td>單元範圍</td><td>${QuestionBankvo.testscope }</td>
                        </tr>
                        <tr>
                            <td>題目敘述</td>	<td>${QuestionBankvo.qustmt}</td>
                        </tr>
                       <c:if test="${not empty QuestionBankvo.op1}">
                        <tr>    
                            <td>選項A</td><td>${QuestionBankvo.op1}</td>
                        </tr>
                        <tr>    
                            <td>選項B</td><td>${QuestionBankvo.op2}</td>
                        </tr>
                        <tr>    
                            <td>選項C</td><td>${QuestionBankvo.op3}</td>
                        </tr>
                        <tr>    
                            <td>選項D</td><td>${QuestionBankvo.op4}</td>
                        </tr>
                        <tr>   
                            <td>答案</td><td>${testAns}</td>
                        </tr>
                        </c:if>
                        <c:if test="${empty QuestionBankvo.op1}">
                        <tr>   
                            <td>答案</td><td>${QuestionBankvo.quans}</td>
                        </tr>
                        </c:if>
                   
                 
                 </table>
              </div>
        </div>
    </div>     
</body>
</html>