<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta name="viewport" content="width=device-width" ,initial-scale="1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<!-- 
   <nav class="navbar navbar-default">
      <div class="navbar-header">
         <button type ="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
         aria-expanded="false">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
         </button>
         <a class="navbar-brand" href="main.jsp">JSP 게시판 웹 사이트</a>
      </div>
      <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
         <ul class="nav navbar-nav">
            <li><a href="main.jsp">메인</a></li>
            <li class="active"><a href="list.bo?pageNum=1">게시판</a></li>
         </ul>
         <c:set var="SessionUserID" value="${sessionScope.userID}"/>
         <c:choose>
            <c:when test="${empty SessionUserID}">
               <ul class="nav navbar-nav navbar-right">
                  <li class="dropdown"><a href="#" class="dropdown-toggle"
                     data-toggle="dropdown" role="button" aria-haspopup="true"
                     aria-expanded="false">접속하기<span class="caret"></span></a>
                     <ul class="dropdown-menu">
                        <li><a href="login.jsp">로그인</a></li>
                        <li><a href="join.jsp">회원가입</a></li>
                     </ul>
                  </li>
               </ul>
            </c:when>
   
            <c:when test="${not empty SessionUserID}">
               <ul class="nav navbar-nav navbar-right">
                  <li class="dropdown"><a href="#" class="dropdown-toggle"
                     data-toggle="dropdown" role="button" aria-haspopup="true"
                     aria-expanded="false">회원관리<span class="caret"></span></a>
                     <ul class="dropdown-menu">
                        <li><a href="logout.uo">로그아웃</a></li>
                     </ul>
                  </li>
               </ul>
            </c:when>
            
            <c:otherwise>
                 
             </c:otherwise>

         </c:choose>
      </div>
   </nav>
   -->



	<div class="container">

		<div class="pull-right" style="margin: 10px;">
			<select name="" id="amount">
				<option value="">--</option>
				<option value="10">10개씩</option>
				<option value="20">20개씩</option>
				<option value="30">30개씩</option>
			</select>
		</div>
		<div class="row">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<th
						style="background-color: #eeeeee; text-align: center; width: 100px;">글번호</th>
					<th
						style="background-color: #eeeeee; text-align: center; width: 100px;">카테고리</th>
					<th style="background-color: #eeeeee; text-align: center;">제목</th>
					<th style="background-color: #eeeeee; text-align: center;">작성자</th>
					<th
						style="background-color: #eeeeee; text-align: center; width: 100px;">작성일</th>
					<th
						style="background-color: #eeeeee; text-align: center; width: 100px;">조회수</th>
				</thead>
				<tbody>
					<c:forEach var="bdto" items="${list}">
						<tr>
							<td>${bdto.boardBno}</td>
							<td>${bdto.boardCategory}</td>
							<td><a class="move" href="${bdto.boardBno}">${bdto.boardTitle}</td>
							<td>${bdto.boardWriter}</td>
							<td>${bdto.boardDate}</td>
							<td>${bdto.boardHit}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<!--  -->
			<div style="">
				<label style=" padding: 2px;">검색</label> <input
					type="text" id="keyword" value="${pageMaker.cri.keyword}">
				<button style="background-image: url('/resources/png.png');padding:0px;background-size: 110% 110%;background-color:white;
				boder:none; outline:none; width:25px; height:25px" id="searchBtn" name="searchBtn"
					type="submit" class="btn"></button>
				<select id="type" style="padding: 2px; height: 26px">
					<option value="TC" ${pageMaker.cri.type eq 'TC' ? 'selected' : ''}>제목+내용</option>
					<option value="T" ${pageMaker.cri.type eq 'T' ? "selected" : ''}>제목</option>
					<option value="C" ${pageMaker.cri.type eq 'C' ? "selected" : ''}>내용</option>
					<option value="W" ${pageMaker.cri.type eq 'W' ? "selected" : ''}>작성자</option>
					<option value="TWC"
						${pageMaker.cri.type eq 'TWC' ? "selected" : ''}>전체</option>
				</select>
				<div class="pull-right">
					<a href="/board/write"><button>글쓰기</button></a>
				</div>
			</div>

			<div style="text-align: center;">
				<ul class="pagination">

					<c:if test="${pageMaker.prev }">
						<li class="previous"><a href="/board/list">Super prev</a></li>
					</c:if>

					<c:if test="${pageMaker.prev }">
						<li class="paginate_button previous"><a
							href="${pageMaker.startPage-1 }">Previous</a></li>
					</c:if>

					<c:forEach var="num" begin="${pageMaker.startPage }"
						end="${pageMaker.endPage }">
						<li class="paginate_button ${pageMaker.cri.pageNum == num? "active":"" }"><a
							href="${num }">${num}</a></li>
					</c:forEach>

					<c:if test="${pageMaker.next }">
						<li class="paginate_button next"><a
							href="${pageMaker.endPage+1 }">Next</a></li>
					</c:if>

					<c:if test="${pageMaker.next }">
						<li class="paginate_button next"><a
							href="${pageMaker.lastPage }">Super Next</a></li>
					</c:if>


				</ul>
			</div>

			<form id="listGetForm" action="/board/list" method="get">
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
				<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
				<input type="hidden" name="type" value="${pageMaker.cri.type}">
				<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
			</form>


			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">Modal title</h4>
						</div>
						<div class="modal-body">처리가 완료되었습니다.</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
		</div>
	</div>

	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

	<script type="text/javascript">
		var result = '<c:out value="${result}"/>';
		var checkWD = '<c:out value="${checkWD}"/>';

		checkModal(result);

		history.replaceState({}, null, null);

		function checkModal(result) {
			if (result == '' || history.state) {
				return;
			}
			if (result) {
				if(checkWD==="write"){
				$(".modal-body").html(
						"게시글 " + parseInt(result) + " 번이 등록되었습니다.");					
				} else{
				$(".modal-body").html(
						"게시글 " + parseInt(result) + " 번이 삭제되었습니다.");										
				}
			}

			$('#myModal').modal("show");
		}

		var actionForm = $("#listGetForm");

		$(".paginate_button a").on("click", function(e) {
			e.preventDefault();
			console.log('click');
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});

		$('.move')
				.on(
						'click',
						function(e) {
							e.preventDefault();
							actionForm
									.append("<input type='hidden' name='boardBno' value='"
											+ $(this).attr("href") + "'>");
							actionForm.attr('action', '/board/view');
							actionForm.submit();
						});

		$('#searchBtn').on('click', function(e) {
			var ss = $('#keyword').val();
			var cc = $("#type option:selected").val();
			$("input[name='keyword']").val(ss);
			$("input[name='type']").val(cc);
			$("input[name='pageNum']").val(1);
			actionForm.submit();
		});

		$("#keyword").keyup(function(key) {
			if (key.keyCode == 13) {
				var ss = $('#keyword').val();
				var cc = $("#type option:selected").val();
				$("input[name='keyword']").val(ss);
				$("input[name='type']").val(cc);
				$("input[name='pageNum']").val(1);
				actionForm.submit();
			}
		});

		$('#amount').on('change', function(e) {
			$("input[name='amount']").val($('#amount option:selected').val());
			actionForm.submit();
		});
	</script>

</body>
</html>