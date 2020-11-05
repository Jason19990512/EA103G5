<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.DateFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.lecture.model.*" %>
<%@ page import="com.lecorder.model.*" %>
<%@ page import="com.lecseat.model.*" %>

<%	String memno = request.getParameter("memno");
	//lecseat
	String lodrno = request.getParameter("lodrno").trim();
	if(lodrno.length() == 0){
		lodrno = (String) request.getAttribute("lodrno");
	}
	LecseatService seatSvc = new LecseatService();
	List<LecseatVO> list = seatSvc.getSeatsByOrder(lodrno);
	//lecorder
	LodrService lodrSvc = new LodrService();
	LodrVO lodrVO = lodrSvc.getOne(lodrno);
	String lecno = lodrVO.getLecno();
	String lodrseat = lodrVO.getLodrseat();
	//lecture
	LecService lecSvc = new LecService();
	LecVO lecVO = lecSvc.getOne(lecno);
	String roomno = lecVO.getRoomno();
	Integer lecprice = lecVO.getLecprice();
	//classroom
	ClassroomService roomSvc = new ClassroomService();
	ClassroomVO roomVO = roomSvc.getOneClassroom(roomno);
	String roomname = roomVO.getRoomname();
	//date time formatter
	Timestamp lecstart = lecVO.getLecstart();
	Timestamp lecend = lecVO.getLecend();
	String startdate = "";
	String starttime = "";
	String endtime = "";
	DateFormat fmtdate = new SimpleDateFormat("yyyy/MM/dd");
	DateFormat fmttime = new SimpleDateFormat("HH:mm");
	startdate = fmtdate.format(lecstart);
	starttime = fmttime.format(lecstart);
	endtime = fmttime.format(lecend);
	
	pageContext.setAttribute("list", list);
	pageContext.setAttribute("lodrVO", lodrVO);
	pageContext.setAttribute("lecVO", lecVO);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Xducation - 陪你成長的學習好夥伴</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/library/bootstrap/4.5.3/css/bootstrap.min.css">
<%@ include file="/index/front-index/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/back-end/css/bootTable.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/lecseat/css/listOneForMem.css">
<style>
ul, ol {
       list-style: outside none none;
       }
</style>
<script>
</script>
</head>
<body>
<div id="padd">padd</div>
<div id="table-area" class="container-xl">
    <div class="table-responsive">
        <div class="table-wrapper">			
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-4">
                    </div>
                    <div class="col-sm-4">
                        <h2 class="text-center">修改座位</h2>
                    </div>
                    <div class="col-sm-4">
                    </div>
                </div>
            </div>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>訂單編號</th>
                        <th>講座名稱</th>
                        <th>講座票價</th>
                        <th>座位號碼</th>
                        <th>座位狀態</th>
                        <th>取消座位</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="seatVO" items="${list}">

					<tr>
						<td>${seatVO.lodrno}</td>
						<td>${lecVO.lecname}</td>
						<td>${lecVO.lecprice}</td>
						<td>${seatVO.seatno}</td>
						<td>${seatVO.seatstatus}</td>
			            <td>
				            <form id="${seatVO.seatno}modi" method="post" action="<%=request.getContextPath()%>/lecseat/lecseat.do">
					            <input type="hidden" name="lodrno" value="${lodrVO.lodrno}">
								<button class="btn edit modify" style="color: orange"><i class="material-icons">&#xE254;</i></button>
							</form>
			            </td>
		            </tr>
					
					</c:forEach>
                </tbody>
            </table>
            <div class="clearfix" style="padding-bottom: 50px">
               <div class="pagination">
               <form id="modifyForm" method="post" action="<%=request.getContextPath()%>/lecorder/lecorder.do">
			       <input type="hidden" name="lodrno" value="<%=lodrno%>">
			       <input type="hidden" name="lecno" value="<%=lecno%>">
			       <input type="hidden" name="memno" value="<%=memno%>">
			       <input id="count" type="hidden" name="count" readonly>
			 	   <input id="lecamt" type="hidden" name="lecamt" readonly>
				   <input id="lecprice" type="hidden" value=<%=lecprice%> readonly>
			  	   <input id="seatno" type="hidden" name="seatno" readonly>
			  	   <!-- catch currseat from seat layout for sending request -->
			  	   <input id="currseat" type="hidden" name="currseat" readonly>
			  	   <input type="hidden" name="action" value="update">
		       </form>
                </div>
            </div>
        </div>
    </div>
</div> 
<div id="table-area" class="container-xl">
    <div class="table-responsive">
	    <div class="table-wrapper">
        	<div class="container">
            	<div class="row">
                	<div class="col-md-4">
               		  <img id="cus-service" src="<%=request.getContextPath()%>/index/front-index/assets/img/head/cus-service.png">
               		  <br>
               		  <br>編輯完畢後請點選右方【確定變更】按鈕
               		</div>
		          	<div class="col-md-4">
					    <%@ include file="/front-end/lecseat/bookedSeats.jsp" %>
		            </div>
                	    <div id="lecinfo" class="col-md-4">
					   	<ul><li>${lecVO.lecname}</li> 
					   	<li>講師姓名：${lecVO.spkrno}</li>
					   	<li>講座日期：<%=startdate%></li>
						<li>講座時間：<%=starttime%> - <%=endtime%></li>
						<li>講座地點：<%=roomname%>教室</li>
						</ul>
						<form method="post" action="<%=request.getContextPath()%>/front-end/lecorder/listByMemno.jsp">
						<input type="hidden" name="memno" value="<%=memno%>"><br>
						<button id="return" class="btn btn-border" style="border: 1px solid #0099cc;">回上頁</button>
						</form>
						<button id="confirm" class="hide btn btn-border" style="border: 1px solid #0099cc;">確定變更</button>
                  </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="/index/front-index/footer.jsp" %>
<script>
	
		
	
	$(".modify").click(function(e){
		e.preventDefault();
		swal("請點選綠色區塊取消指定座位","請點選綠色區塊","info");
		addClickForCancel();
		$("#confirm").removeClass("hide");
		$(".booked").addClass("cursor");
		$(".cancelled").addClass("cursor");
	});
	
	$("#confirm").mouseenter(function(){
		 var arr = document.getElementsByClassName("cancelled");
		    let txt = "";
		    if (arr.length > 0) {
		        for (let i = 0; i < arr.length; i++) {
		            txt += arr[i].textContent + " ";
		        }
		    }
		    $("#seatno").val(txt);
		    
		 var currseat = $("#defaultseat").val();
		 $("#currseat").val(currseat);
		 
		 if (currseat.indexOf("*") === -1){
			 $("#modifyForm").attr("action", "<%=request.getContextPath()%>/front-end/lecseat/cancelSeatMem.jsp");
		 		console.log($("#modifyForm").attr("action"));
		 }
			 
	});
	
	$("#confirm").click(function(e){
// 			e.preventDefault();
// 		var confirm = swal("座位即將被取消");
// 		if (confirm === true)
			$("#modifyForm").submit();

		
		/*擋不住*/
// 		e.preventDefault();
// 		var result = swal("座位即將被取消");
// 		console.log(result);
// 		$("#modifyForm").submit();

		/*擋住取消，但確認無法送出*/	
		// 		swal({
		// 		    title: "確定要取消座位嗎",
		// 		    text: "",
		// 		    type: "warning",
		// 		    showCancelButton: true,
		// 		    confirmButtonColor: '#DD6B55',
		// 		    confirmButtonText: '確定取消',
		// 		    cancelButtonText: "放棄變更"
		// 		 }).then((result)=>{
		// 			 //console.log(result);
		// 			 if(result === true){
		// 				 $("#modifyForm").submit();
		// 			 }
		// 		 });
	});
	
</script>
</body>
</html>                                		