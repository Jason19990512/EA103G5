<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.employee.model.*"%>
<jsp:include page="/back-end/index/homepage.jsp"/>
<%
	EmployeeVO employeeVO = (EmployeeVO) request.getAttribute("EmployeeVO");
%>
<%
	java.sql.Date hiredate = null;
	try {
		hiredate = employeeVO.getHiredate();
	} catch (Exception e) {
		hiredate = new java.sql.Date(System.currentTimeMillis());
	}
%>
<jsp:useBean id="funSvc" scope="page" class="com.functionx.model.FunctionxService"/>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>新增員工</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/library/bootstrap/4.5.3/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<script src="<%=request.getContextPath()%>/library/jquery/jquery-3.5.1.js"></script>
<style>
body {
	color: #566787;
	background: #f5f5f5;
	font-family: 'Varela Round', sans-serif;
}

.table-responsive {
	margin: 30px 0;
}

.table-wrapper {
	min-width: auto;
	background: #fff;
	padding: 20px 25px;
	border-radius: 3px;
	box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
}

.table-wrapper .btn {
	float: right;
	color: #333;
	background-color: #fff;
	border-radius: 3px;
	border: none;
	outline: none !important;
	margin-left: 10px;
}

.table-wrapper .btn:hover {
	color: #333;
	background: #f2f2f2;
}

.table-wrapper .btn.btn-primary {
	color: #fff;
	background: #03A9F4;
}

.table-wrapper .btn.btn-primary:hover {
	background: #03a3e7;
}

.table-title .btn {
	font-size: 13px;
	border: none;
}

.table-title .btn i {
	float: left;
	font-size: 21px;
	margin-right: 5px;
}

.table-title .btn span {
	float: left;
	margin-top: 2px;
}

.table-title {
	color: #fff;
	background: #4b5366;
	padding: 16px 25px;
	margin: -20px -25px 10px;
	border-radius: 3px 3px 0 0;
}

.table-title h2 {
	margin: 5px 0 0;
	font-size: 24px;
}

.show-entries select.form-control {
	width: 60px;
	margin: 0 5px;
}

.table-filter .filter-group {
	float: right;
	margin-left: 15px;
}

.table-filter input, .table-filter select {
	height: 34px;
	border-radius: 3px;
	border-color: #ddd;
	box-shadow: none;
}

.table-filter {
	padding: 5px 0 15px;
	border-bottom: 1px solid #e9e9e9;
	margin-bottom: 5px;
}

.table-filter .btn {
	height: 34px;
}

.table-filter label {
	font-weight: normal;
	margin-left: 10px;
}

.table-filter select, .table-filter input {
	display: inline-block;
	margin-left: 5px;
}

.table-filter input {
	width: 200px;
	display: inline-block;
}

.filter-group select.form-control {
	width: 110px;
}

.filter-icon {
	float: right;
	margin-top: 7px;
}

.filter-icon i {
	font-size: 18px;
	opacity: 0.7;
}

table.table tr th, table.table tr td {
	border-color: #e9e9e9;
	padding: 12px 15px;
	vertical-align: middle;
}

table.table tr th:first-child {
	width: 60px;
}

table.table tr th:last-child {
	width: 80px;
}

table.table-striped tbody tr:nth-of-type(odd) {
	background-color: #fcfcfc;
}

table.table-striped.table-hover tbody tr:hover {
	background: #f5f5f5;
}

table.table th i {
	font-size: 13px;
	margin: 0 5px;
	cursor: pointer;
}

table.table td a {
	font-weight: bold;
	color: #566787;
	display: inline-block;
	text-decoration: none;
}

table.table td a:hover {
	color: #2196F3;
}

table.table td a.view {
	width: 30px;
	height: 30px;
	color: #2196F3;
	border: 2px solid;
	border-radius: 30px;
	text-align: center;
}

table tr th input[type="submit"].view {
	width: 100px;
	height: 30px;
	color: #2196F3;
	border: 2px solid;
	border-radius: 30px;
	text-align: center;
}



table tr th input[type="submit"].view:hover  {
	color: #2196F3;
}

table.table td a.view i {
	font-size: 22px;
	margin: 2px 0 0 1px;
}

table.table .avatar {
	border-radius: 50%;
	vertical-align: middle;
	margin-right: 10px;
}

.status {
	font-size: 30px;
	margin: 2px 2px 0 0;
	display: inline-block;
	vertical-align: middle;
	line-height: 10px;
}

.text-success {
	color: #10c469;
}

.text-info {
	color: #62c9e8;
}

.text-warning {
	color: #FFC107;
}

.text-danger {
	color: #ff5b5b;
}

.pagination {
	float: right;
	margin: 0 0 5px;
}

.pagination2 {
	float: left;
	margin: 0 0 5px;
}

.pagination2 form {
	border: none;
	font-size: 13px;
	min-width: 30px;
	min-height: 30px;
	color: #999;
	margin: 0 2px;
	line-height: 30px;
	border-radius: 2px !important;
	text-align: center;
	padding: 0 6px;
}

.pagination li a {
	border: none;
	font-size: 13px;
	min-width: 30px;
	min-height: 30px;
	color: #999;
	margin: 0 2px;
	line-height: 30px;
	border-radius: 2px !important;
	text-align: center;
	padding: 0 6px;
}

.pagination li a:hover {
	color: #666;
}

.pagination li.active a {
	background: #03A9F4;
}

.pagination li.active a:hover {
	background: #0397d6;
}

.pagination li.disabled i {
	color: #ccc;
}

.pagination li i {
	font-size: 16px;
	padding-top: 6px
}

.hint-text {
	float: left;
	margin-top: 10px;
	font-size: 13px;
}
</style>
<script>
	$(document).ready(function() {
		$('[data-toggle="tooltip"]').tooltip();
	});
</script>
</head>
<body>

	<main class="app-content">
	<div class="container-xl">
		<div class="table-responsive">
			<div class="table-wrapper">
				<div class="table-title">
					<div class="row">
						<div class="col-sm-4">
							<h2>
								<b>員工詳細資料</b>
							</h2>
						</div>
					</div>
				</div>
			
				<form method="post" ACTION="<%=request.getContextPath() %>/employee/employee.do" name="form1" enctype="multipart/form-data">
					<table class="table table-striped table-hover" id="test">
						<tbody>
							<c:if test="${not empty errMsgs}">
								<font style="color:red">請修正以下錯誤:</font>
								<ul>
									<c:forEach var="message" items="${errMsgs}">
										<li style="color:red">${message}</li>
									</c:forEach>
								</ul>
							</c:if>						
							<tr>
								<th>員工帳號</th>
								<th><input type="text" name="empacc" id="empacc" placeholder="請輸入員工帳號" value="<%= (employeeVO==null)? "" : employeeVO.getEmpacc()%>"></th>
							</tr>
							<tr>
								<th>員工姓名</th>
								<th><input type="text" name="empname" id="empname" placeholder="請輸入員工姓名" autocomplete="off" value="<%= (employeeVO==null)? "" : employeeVO.getEmpname()%>"></th>
							</tr>
							<tr>
								<th>員工薪水</th>
								<th><input type="text" name="empsalary"  id="empsalary" placeholder="請輸入員工薪水" autocomplete="off" value="<%= (employeeVO==null)? "" : employeeVO.getEmpsalary()%>"></th>
							</tr>
							<tr>
								<th>員工到職日期</th>
								<th><input type="text" id="f_date1" name="hiredate" placeholder="請輸入員工到職日" 
								value="<%= (employeeVO==null)? "" : employeeVO.getHiredate()%>">
								</th>
							</tr>
							<tr>
								<th>員工Email</th>
								<th><input type="email" name="empemail" id="empemail" placeholder="請輸入email" value="<%= (employeeVO==null)? "" : employeeVO.getEmpemail()%>" ></th>
							</tr>
							<tr>
								<th>員工權限</th>
								<th>																												
									<c:forEach var="functionxVO" items="${funSvc.all}">																																
	                   				<input type="checkbox" name="functionx" value="${functionxVO.funcno}" id="${functionxVO.funcno}">
	                   				<label for="${functionxVO.funcno}">${functionxVO.funcname}</label><br>	                   			
	                   			    </c:forEach>												  
      							</th>     							
							</tr>
							<tr>
								<th>員工照片</th>
								 <th width="100" height="100" id="preview"></th>  																																		
     							<th><input type="file" name="emppic"   placeholder="請上傳圖片" id="emp_pic"></th>							          							                                                             							
							</tr>
							<tr>
								<th>								
									<input type="hidden" name="action" value="insert"> 
									<input type="submit" class="view" value="新增員工">
									<span  class="status text-primary" id="insert">&#x2b;</span>										
								</th>
								<th>								
															
								</th>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>
<script type="text/javascript">
        $.datetimepicker.setLocale('zh');
        $('#f_date1').datetimepicker({
           theme: '',              //theme: 'dark',
 	       timepicker:false,       //timepicker:true,
 	       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
 	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
 		   value: '${param.hiredate}', // value:   new Date(),
           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
           //startDate:	            '2017/07/10',  // 起始日
//            minDate:               '-1970-01-01', // 去除今日(不含)之前
           maxDate:               '+1970-01-01'  // 去除今日(不含)之後
        });
</script>
<script type="text/javascript">
var now = new Date();
var day = ("0" + now.getDate()).slice(-2);
var month = ("0" + (now.getMonth() + 1)).slice(-2);
var today = now.getFullYear()+"-"+(month)+"-"+(day) ;
$("#insert").click(function(e){
	e.preventDefault();
	$("#empacc").val("T00013");
	$("#empname").val("野原廣智");
	$("#empsalary").val("40000");
	$("#f_date1").val(today);
	$("#empemail").val("n8742977@gmail.com");
})
</script>
<script type="text/javascript">
	var x = document.getElementsByName("functionx");
	var y = document.getElementsByName("emp");
	for(var i=0; i<x.length;i++){
		for(var j=0;j<y.length;j++){			
			if((x[i].value) === (y[j].value)){
				x[i].checked = true;
			}
			
		}
	}	
</script>
<script type="text/javascript">
    var admin_pic = document.getElementById("emp_pic");
    var preview = document.getElementById('preview');

    admin_pic.addEventListener('change', function() {

        var files = admin_pic.files;

        if (files !== null) {
            for (var i = 0; i < files.length; i++) {
                var file = files[i];
                console.log(file);

                if (file.type.indexOf('image') > -1) {

                    var reader = new FileReader();

                    reader.addEventListener('load', function(e) {

                        var img = document.createElement('img');                   
                        img.setAttribute('src', e.target.result);
                        img.setAttribute('class', 'rounded-circle');
                        img.style.width="350px";
                        img.style.height="350px";
                        preview.append(img);
                    });
                    reader.readAsDataURL(file); // ***** trigger
                } else {
                    alert('請上傳圖片！');
                }
            }
        }
    });
 </script>

</html>