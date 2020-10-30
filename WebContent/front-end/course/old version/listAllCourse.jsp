<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="com.course.model.*,com.course_type.model.*"%>

<%
	List<CourseVO> list = (List<CourseVO>)request.getAttribute("list");
	
	if(list == null){
		CourseService cSvc = new CourseService();
		list = cSvc.getAllForUser();
	}
	pageContext.setAttribute("Courselist",list);
	
// 	CourseTypeService courseTypeSvc = new CourseTypeService();
// 	pageContext.setAttribute("courseTypeList", courseTypeSvc.getAll());

%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>所有課程列表 - listAllCourse.jsp</title>

				
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<script src="https://google-code-prettify.googlecode.com/svn/loader/run_prettify.js"></script>
<script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/front-end/css/star-rating-svg.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/front-end/css/demo.css">

</head>

<body>
	<jsp:useBean id="courseTypeSvc" scope="page" class="com.course_type.model.CourseTypeService"/>
	<jsp:include page="/index/front-index/header.jsp"/>
<!-- 	<div class="section-header text-center"> -->
<!--                 <h2 class="section-title wow fadeInDown" data-wow-delay="0.3s"><i class="lni-rocket"></i>搜尋課程</h2> -->
<!-- <!--                 <div class="shape wow fadeInDown" data-wow-delay="0.3s"></div> --> 
<!--             </div> -->
	<div id="hero-area" style="background-image: none">
	<div class="container">
                <div class="container">
                
  			<div class="row">
    				<div class="col-2">
      						
                            <label>課程名稱</label>      
                            
                            <div><input class="form-control" type="text" placeholder="&nbsp;&nbsp;今天想學什麼呢？" id="searchText"></div>
                                  
                     </div> 
    				<div class="col-2">
    						<label>類別名稱</label>
    						<div>
    						<select class="form-control" id="cstypeno">
									<option value="all">請選擇類別</option>
									<c:forEach var="courseVO" items="${courseTypeSvc.all}">
      									<option value="${courseVO.cstypeno}">${courseVO.cstypename}</option>
      								</c:forEach>
							</select>
      							
      							
      						</div>
    				</div>
    				<div class="col-2">
      						<label>最低價格</label>
      						<input class="form-control" type="number" size="5" min="0" name="minValue" id="min">
    				</div>
    				<div class="col-2">
      						<label>最高價格</label>
      						<input class="form-control" type="number" size="5" min="0" name="maxValue" id="max">
    				</div>
    				<div class="col-2">
    						<label>排序</label>
      						<select class="form-control" id="order">
      							<option value="courlmod" seleted>最新</option>
  								<option value="csscore">評價高&#x27A1;低</option>
  								<option value="ttltime">課時高&#x27A1;低</option>
  								<option value="courseprice">價格高&#x27A1;低</option>
  								<option value="coursepriceLow">價格低&#x27A1;高</option>
							</select>
    				</div>
    				<div class="col-2">
    					<label></label>
    					<button type="button" class="btn btn-primary" id="turnin" style="display:block">送出查詢</button>
    				</div>
  			</div>
  
			</div>
                      
	<section id="services" class="section-padding">
        <div class="container">
            <div class="row seacharea">
                <!-- Services item1 -->
                <c:forEach var="courseVO" items="${Courselist}">
                <div class="col-md-6 col-lg-3 col-xs-12">
                    <div class="services-item wow fadeInRight" data-wow-delay="0.3s">
                        <div class="icon">
                            <img src="<%=request.getContextPath()%>/course/coursephoto.do?action=searchPhoto&courseno=${courseVO.courseno}" style="width:200px;height:150px">
                        </div>
                        <div class="services-content">
                            <div class="my-rating jq-stars"></div>
                            &nbsp;${courseVO.csscore}則評價
                            <h3><a href="#">${courseVO.coursename}</a></h3>
                            <p>課程共${courseVO.ttltime}分鐘</p>
<!--                             <p>同學累計9487人</p> -->
                            <h6>NT$${courseVO.courseprice}</h6>
                        </div>
                    </div>
                </div>
                
                </c:forEach>
             </div>
          </div>
          
       </section>
       </div>
       </div>
<!-- 	<h1>所有課程列表 - listAllCourse.jsp</h1> -->
<!-- 	<p> -->
<%-- 		<a href="<%=request.getContextPath()%>/front-end/course/select_page.jsp">回首頁</a> --%>
<!-- 	</p> -->

<%-- 	<%-- 錯誤表列 --%> 
<%-- 	<c:if test="${not empty errorMsgs}"> --%>
<!-- 		<font style="color: red">請修正以下錯誤:</font> -->
<!-- 		<ul> -->
<%-- 			<c:forEach var="message" items="${errorMsgs}"> --%>
<%-- 				<li style="color: red">${message}</li> --%>
<%-- 			</c:forEach> --%>
<!-- 		</ul> -->
<%-- 	</c:if> --%>

<!-- 	<table> -->
<!-- 		<tr> -->
<!-- 			<th>課程編號</th> -->
<!-- 			<th>類別編號</th> -->
<!-- 			<th>老師編號</th> -->
<!-- 			<th>課程名稱</th> -->
<!-- 			<th>課程資訊</th> -->
<!-- 			<th>課程單價</th> -->
<!-- 			<th>課程總時數</th> -->
<!-- 			<th>累積總評分</th> -->
<!-- <!-- 			<th>評分次數</th> --> 
<!-- 			<th>課程圖片</th> -->
<!-- 			<th>最後更動時間</th> -->
<!-- 			<th>修改</th> -->
<!-- 			<th>商品狀態</th> -->
<!-- 		</tr> -->
		
<%-- <%-- 		<jsp:useBean id="courseSvc" scope="page" class="com.course.model.CourseService"/> --%> 
<%-- 		<c:forEach var="courseVO" items="${Courselist}"> --%>
			
<!-- 			<tr> -->
<%-- 				<td>${courseVO.courseno}</td> --%>
<%-- 				<td>${courseVO.cstypeno}</td> --%>
<%-- 				<td>${courseVO.tchrno}</td> --%>
<%-- 				<td>${courseVO.coursename}</td> --%>
<%-- 				<td>${courseVO.courseinfo}</td> --%>
<%-- 				<td>${courseVO.courseprice}</td> --%>
<%-- 				<td>${courseVO.ttltime}</td> --%>
				
<%-- 				<td>${courseVO.csscore}</td> --%>
<%-- 				<td><img src="<%=request.getContextPath()%>/course/coursephoto.do?action=searchPhoto&courseno=${courseVO.courseno}" style="width:180px;height:150px"></td> --%>
<%-- 				<td><fmt:formatDate value="${courseVO.courlmod}" pattern="yyyy-MM-dd HH:mm:ss"/></td> --%>
				
<!-- 				<td> -->
<%-- 					<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/course/course.do" style="margin-bottom: 0px;"> --%>
<!-- 			     	<input type="submit" value="修改"> -->
<%-- 			     	<input type="hidden" name="courseno"  value="${courseVO.courseno}"> --%>
<!-- 			     	<input type="hidden" name="action"	value="getOne_For_Update"></FORM> -->
<!-- 				</td> -->
<%-- 				<td>${courseVO.csstatus}</td> --%>
<!-- <!-- 				<td> --> 
<%-- <%-- 					<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/course/course.do" style="margin-bottom: 0px;"> --%> 
<!-- <!-- 			     	<input type="submit" value="刪除"> -->
<%-- <%-- 			     	<input type="hidden" name="courseno"  value="${courseVO.courseno}"> --%> 
<!-- <!-- 			     	<input type="hidden" name="action"	value="delete"></FORM> --> 
<!-- <!-- 				</td> --> 
<!-- 			</tr> -->
<%-- 		</c:forEach> --%>
<!-- 	</table> -->
<script src="<%=request.getContextPath()%>/front-end/js/rateit/jquery.star-rating-svg.js"></script>
<script>
	$(document).ready(function(){
		
		$(function() {
			$(".my-rating").starRating({
							initialRating: 5.0,
							starSize: 25
			});
		});
		
		$('#hero-area').css('background-image',null)
		console.log($('#hero-area').css('background-image'));
		
		$('#turnin').click(function(){
			$.ajax({
				type:"post",
				url	:"<%=request.getContextPath()%>/course/coursesearch.do", 
				data:{
					searchText:$('#searchText').val(),
					cstypeno:$('#cstypeno').val(),
					min:$('#min').val(),
					max:$('#max').val(),
					order:$('#order').val(),
					action:'mutlipleSearch'
				},
				success: function(data){
					var JSONarray = JSON.parse(data);
					$(".seacharea").empty();
					
					var str = "";
					for(let i = 0 ; i < JSONarray.length ; i++){
						
						var courseimgno = "<%=request.getContextPath()%>/course/coursephoto.do?action=searchPhoto&courseno=" + JSONarray[i].courseno;
						
					
						
						str +=  `<div class="col-md-6 col-lg-3 col-xs-12">
		                    <div class="services-item wow fadeInRight" data-wow-delay="0.3s">
		                        <div class="icon">
		                            <img src= "` +  courseimgno    + `"style="width:200px;height:150px">
		                        </div>
		                        <div class="services-content">
		                            <i class="lni-star-filled"></i><i class="lni-star-filled"></i><i
		                                class="lni-star-filled"></i><i class="lni-star-filled"></i><i
		                                class="lni-star-filled"></i>
		                            &nbsp;`+ JSONarray[i].csscore +`則評價
		                            <h3><a href="#">`+  JSONarray[i].coursename +`</a></h3>
		                            <p>課程共` + JSONarray[i].ttltime +` 分鐘</p>
		<!--                             <p>同學累計9487人</p> -->
		                            <h6>NT$` + JSONarray[i].courseprice +`</h6>
		                        </div>
		                    </div>
		                </div>`;
						
					}
					
					
					$(".seacharea").html(str);
					
				}
			});
		});
		
	});
</script>

	<jsp:include page="/index/front-index/footer.jsp"/>
	
</body>
</html>