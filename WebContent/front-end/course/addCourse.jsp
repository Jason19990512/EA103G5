<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <%@ page import="java.util.*"%>
<%@ page import="com.course.model.*"%>

<%
	CourseVO courseVO = (CourseVO) request.getAttribute("courseVO");
%>

<!DOCTYPE html>
<html lang="zh-Hant">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<!-- ========== CSS Area ========== -->
	<!-- Bootstrap 的 CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

	<!-- This page's CSS -->
	<style>
		main {
			margin-top: 90px;
		}
	</style>
	<!-- ========== CSS Area ========== -->

	<title>申請開課 - Xducation 陪你成長的學習好夥伴</title>
</head>

<body>
	<!-- include 前台頁面的 header -->
	<jsp:include page="/index/front-index/header.jsp" />

	<main>
		<div class="container">
			<div class="row">
				<div class="col">
					<h1>申請開課 - Xducation 上架你的才華</h1>
					<%-- <p><a href="<%=request.getContextPath()%>/front-end/course/select_page.jsp">回首頁</a></p> --%>
				</div>
			</div>

			<div class="row">
				<div class="col-md-6">

					<!-- 注意! 雖有警告，但 form tag 不可移動到 col 之上，版型會有問題 -->
					<form METHOD="post" ACTION="<%=request.getContextPath()%>/course/course.do" name="form1" enctype="multipart/form-data">

						<jsp:useBean id="courseSvc" scope="page" class="com.course.model.CourseService" />
						<jsp:useBean id="courseTypeSvc" scope="page" class="com.course_type.model.CourseTypeService" />

						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text">課程名稱</span>
							</div>
							<input type="text" class="form-control" aria-label="Sizing example input"
								name="coursename" value="<%=(courseVO == null) ? "老師很懶不取名" : courseVO.getCoursename()%>">
						</div>

						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<label class="input-group-text">課程類別</label>
							</div>
							<select class="custom-select" name="cstypeno">
								<option value="">請選擇...</option>
								<c:forEach var="courseTypeVO" items="${courseTypeSvc.all}">
									<option value="${courseTypeVO.cstypeno}" ${courseVO.cstypeno==courseTypeVO.cstypeno ? 'selected' : '' }>
										${courseTypeVO.cstypename}
								</c:forEach>
							</select>
						</div>

						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text">課程單價</span>
							</div>
							<input type="number" class="form-control"
								min="0" max="999999" step="1"
								name="courseprice" value="<%=(courseVO == null) ? 0 : courseVO.getCourseprice()%>">
						</div>

						<!-- 教師編號應該要自己抓到 -->
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text">該從 session 抓老師</span>
							</div>
							<input type="text" class="form-control"
								name="tchrno" value="<%=(courseVO == null) ? "TCHR0001" : courseVO.getTchrno()%>">
						</div>

						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text" id="inputGroupFileAddon01">課程圖片</span>
							</div>
							<div class="custom-file">
								<input type="file" class="custom-file-input" id="fileUp"
									name="courseimg">
								<label class="custom-file-label" for="fileUp"> 建議圖片比例 4 : 3</label>
							</div>
						</div>

						<div id="picturePreview"></div>

				</div> <!-- end of col-->

				<div class="col-md-6">

					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">課程資訊</span>
						</div>
						<textarea name="courseinfo" class="form-control" aria-label="With textarea">${courseVO == null ? "<h1>你可以學到...</h1>" : courseVO.courseinfo}</textarea>
					</div>

				</div> <!-- end of col-->
			</div>

			<div class="row">
				<div class="col">

					<br>

					<div>
						<%-- 錯誤表列 --%>
						<c:if test="${not empty errorMsgs}">
							<font style="color: red">請修正以下錯誤：</font>
							<ul>
								<c:forEach var="message" items="${errorMsgs}">
									<li style="color: red">${message}</li>
								</c:forEach>
							</ul>
						</c:if>
					</div>

					<br>

					<input type="hidden" name="action" value="create">
					<h5>送出申請後，將繼續編輯課程內容...</h5>
					<button type="submit" class="btn btn-lg btn-primary btn-block">申請開課</button>

					</form>
					<!-- 注意! 雖有警告，但 form tag 不可移動到外面，版型會有問題 -->

				</div>
			</div>

		</div>
	</main>

	<!-- ========== JavaScript Area ========== -->
	<!-- 關於讀取圖片 -->
	<script type="text/javascript">
		var fileUp = document.getElementById("fileUp");

		fileUp.addEventListener('change', function () {
			var files = fileUp.files;
			if (files) {
				for (var i = 0; i < files.length; i++) {
					var file = files[i];

					if (file.type.indexOf('image') > -1) {
						var reader = new FileReader();
						reader.addEventListener('load', function () {

							var div = document.getElementById('picturePreview');
							div.innerHTML = "";
							var img = document.createElement('img');

							img.setAttribute('src', event.target.result);
							img.setAttribute('style', "max-width:100%;height:300px;");

							if (fileUp.nextElementSibling) { //只給上傳一張
								fileUp.nextElementSibling.remove();
							}

							div.append(img);
						});
						reader.readAsDataURL(file);
					} else {
						var div = document.getElementById('picturePreview');
						div.innerHTML = "";
						files = null;
						alert("僅支援圖片類型檔案");
					}
				}
			}
		});
	</script>

	<!-- 關於 CK EDITER -->
	<script src="https://cdn.ckeditor.com/4.7.3/basic/ckeditor.js"></script>
	<script>
		function init() {
			CKEDITOR.replace("courseinfo", {
				width: 800,
				height: 300
			});
			CKEDITOR.editorConfig = function (config) {
				config.enterMode = CKEDITOR.ENTER_BR; //br換行
			};
		}
		window.onload = init;
	</script>
	<!-- ========== JavaScript Area ========== -->

	<!-- include 前台頁面的 footer -->
	<jsp:include page="/index/front-index/footer.jsp" />
</body>

</html>