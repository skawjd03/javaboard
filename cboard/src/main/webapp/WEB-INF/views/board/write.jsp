<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Centent-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<title>게시판 웹사이트</title>
</head>

<body>

	<div class="container">
		<div class="row">
			<form id="writeForm" method="post" action="/board/writeDO">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2"
								style="background-color: #eeeeee; text-align: center;">게시판
								글쓰기 양식</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td style="width: 120px;"><select class="form-control" id="category" name="boardCategory">
									<option value="">카테고리</option>
									<option value="일반">일반</option>
									<option value="유머">유머</option>
									<option value="힙합">힙합</option>
									<option value="발라드">발라드</option>
									<option value="팝">팝</option>
							</select></td>
							<td><input type="text" class="form-control"
								placeholder="글 제목(50 자)" name="boardTitle" maxlength="50" /></td>
						</tr>
						<tr>
							<td colspan="2"><input type="text" class="form-control"
								placeholder="작성자(로그인기능 점검중)" name="boardWriter" maxlength="50" />
							</td>
						</tr>
						<tr>
							<td colspan="2"><textarea class="form-control"
									placeholder="글 내용(2048 자)" name="boardContent" maxlength="2048"
									style="height: 350px;"></textarea></td>
						</tr>
					</tbody>
				</table>
				
				<input id="writeBtn" type="submit" class="btn btn-primary pull-right" value="글쓰기" />
			</form>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.4.1.js"
		integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script>
	 $().ready(function(){
		 var actionForm = $('#writeForm');
		 
		 $('#writeBtn').on('click',function(){
			 if($('#category option:selected').val()==""){
				 alert('카테고리를 설정해주세요');
				 return;
			 }else{
				 actionForm.submit();
			 }
		 })
     })
	</script>
</body>
</html>