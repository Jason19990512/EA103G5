<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.course.model.*"%>
<%@ page import="com.teacher.model.*"%>
<%@ page import="com.members.model.*"%>

<jsp:useBean id="membersSvc" scope="page" class="com.members.model.MembersService" />

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
	<link rel="stylesheet" href="<%=request.getContextPath()%>/library/bootstrap/4.5.3/css/bootstrap.min.css">
	<!-- Ckeditor 的 CSS (for CourseInfo)-->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/front-end\course\css\ckeditorForCourseInfo.css">
	<!-- This page's CSS -->
	<style>
		main {
			margin-top: 90px;
		}

		#picturePreview {
			text-align: center;
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
				</div>
			</div>

			<div class="row">

				<div class="col-12">
					<!-- 注意! 雖有警告，但 form tag 不可移動到 col 之上，版型會有問題 -->
					<form METHOD="post"
						ACTION="<%=request.getContextPath()%>/course/course.do"
						name="form1" enctype="multipart/form-data">

						<jsp:useBean id="courseSvc" scope="page" class="com.course.model.CourseService" />
						<jsp:useBean id="courseTypeSvc" scope="page" class="com.course_type.model.CourseTypeService" />

						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text">課程名稱</span>
							</div>
							<input type="text" class="form-control"
								aria-label="Sizing example input" name="coursename"
								value="<%=(courseVO == null) ? "老師很懶不取名" : courseVO.getCoursename()%>">
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
							<input type="number" class="form-control" min="0" max="999999"
								step="1" name="courseprice"
								value="<%=(courseVO == null) ? 0 : courseVO.getCourseprice()%>">
						</div>

						<!-- 教師編號自動抓取 -->
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text">開課老師</span>
							</div>
							<input type="text" class="form-control" readonly
								value="${loginMembersVO.memname}">
							<input type="hidden" class="form-control" name="tchrno"
								value="${loginTeacherVO.tchrno}">
						</div>

						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text" id="inputGroupFileAddon01">課程圖片</span>
							</div>
							<div class="custom-file">
								<input type="file" class="custom-file-input" id="fileUp" name="courseimg">
								<label class="custom-file-label" for="fileUp"> 建議圖片比例 4 : 3</label>
							</div>
						</div>

						<div id="picturePreview">
							<img src="<%=request.getContextPath()%>/front-end/course/image/CourseNoPicture.PNG" style="max-width: 100%; height: 300px;">
						</div>

						<br>
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text">課程資訊</span>
							</div>
							<textarea id="ckeditor5" name="courseinfo" class="form-control" aria-label="With textarea">
								${courseVO == null ? "<h2>你可以學到...</h2><h4>在這堂課程中，將提供你</h4><ol><li>知識點 1</li><li>知識點 2</li></ol>" : courseVO.courseinfo}
							</textarea>
						</div>

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

						<br> <input type="hidden" name="action" value="create">
						<h5>送出申請後，將繼續編輯課程內容...</h5>
						<button type="submit" class="btn btn-lg btn-primary btn-block">申請開課</button>

					</form>
					<!-- 注意! 雖有警告，但 form tag 不可移動到外面，版型會有問題 -->
					
					<br>
					<button id="magicButton" class="btn btn-lg btn-block btn-outline-light">magic touch</button>
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

	<!-- =============== Ckeditor 5 =============== -->
	<script src="<%=request.getContextPath()%>\library\ckeditor5-build-classic\ckeditor.js"></script>
	<script>
		ClassicEditor
			.create(document.querySelector('#ckeditor5'), {
				toolbar: ['heading' , '|', 'bold', 'italic', 'bulletedList', 'numberedList']
			})
			.then(editor => {
				console.log(editor);
			})
			.catch(error => {
				console.error(error);
			});
	</script>
	<!-- =============== Ckeditor 5 =============== -->
	
	
	<!-- =============== 神奇小按鈕 =============== -->
	<script>
		$("#magicButton").click(function(){
			$("input[name='coursename']").val("HTML前端網頁設計入門");
			$("select[name='cstypeno'] option[value='TYPE0001']").prop('selected',true);
			$("input[name='courseprice']").val(1688);
			
			// 清除 CKEditor生成出來的區塊後，再重新生成一個
			$("div[role='application']").empty();
			$("textarea[name='courseinfo']").val("<h2><strong>甚麼是HTML5</strong></h2><p>HTML5廣義是包含HTML、CSS和JavaScript在內的一套技術組合，HTML5擺脫影音外掛程式的束縛，讓網頁設計更加豐富，同時支援使用多媒體Audio、Video的標籤，你不需要安裝外掛程式，一樣可以在網頁上瀏覽豐富的影音內容，HTML5將Web帶入了多媒體的世界，一個更成熟且完整的應用平台。</p><br><h2><strong>他們也都使用HTML5</strong></h2><p>知名網站如Google、Facebook、Youtube、Wikipedia、Twitter、淘寶、百度、Apple、台灣Yahoo皆使用HTML5建置網站。2015年，YouTube以HTML5取代Flash為預設值，而Google Adwords也宣稱他們自動將Flash廣告格式轉換成HTML5，更宣布將於2017年1月停止播放Flash格式的廣告，全面啟用HTML5。除此之外，目前的主流瀏覽器(chrome、firefox、IE、Safari、Edge、Opera)都支援HTML5，HTML5成為網站開發必備技術之一。</p><br><h2><strong>HTML5語法標籤讓結構變簡單</strong></h2><p>利用HTML5的標籤可以很輕易的辨認網頁架構，而不是滿滿的 div 標籤，這些容易閱讀的標籤及結構讓電腦更容易理解網頁內容，可以提高搜尋引擎排名，這也是越來越多企業網站使用HTML5最大的原因之一！</p>");
			
			ClassicEditor
				.create(document.querySelector('#ckeditor5'), {
					toolbar: ['heading' , '|', 'bold', 'italic', 'bulletedList', 'numberedList']
				})
				.then(editor => {
					console.log(editor);
				})
				.catch(error => {
					console.error(error);
			});
		});
	</script>

	<!-- include 前台頁面的 footer -->
	<jsp:include page="/index/front-index/footer.jsp" />
</body>

</html>