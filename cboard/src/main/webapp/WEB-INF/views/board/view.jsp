<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Centent-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width" initial-scale="1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

    <title>게시판 웹사이트</title>
    <style>
        h4 {
            font-size: 14pt;
            display: inline-block;
            margin-left: 10px;
            font-weight: bold;
        }

        .profile {
            border-radius: 50%;
            width: 40px !important;
            height: 40px !important;
        }

        #rereplyContent {}

        input {
            margin-left: 10px;
            margin: 10px;
            width: 90%;
            outline: 0;
            border-width: 0 0 2px;
            border-color: #e2e2e2;
        }

        input:focus {
            border-color: #333;
        }
    </style>
</head>

<body>
    <!--  
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="Main.jsp">JSP 게시판 웹 사이트</a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="Main.jsp">메인</a></li>
				<li class="active"><a href="list.bo?pageNum=1">게시판</a></li>
			</ul>


			<c:set var="SessionUserID" value="${sessionScope.userID}" />
			<c:choose>
				<c:when test="${empty SessionUserID}">
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">접속하기<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="Login.jsp">로그인</a></li>
								<li><a href="Join.jsp">회원가입</a></li>
							</ul></li>
					</ul>
				</c:when>
				<c:otherwise>
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">회원관리<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="Logout.bo">로그아웃</a></li>
							</ul></li>
					</ul>
				</c:otherwise>
			</c:choose>
		</div>
	</nav>
	<c:set var="info" value="${boardInfo}" />
-->

    <div class="container">
        <div class="row">
            <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
                <thead>
                    <tr>
                        <th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글
                            보기</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td colspan="2"
                            style="text-align: left; padding-left: 80px; font-weight: bold; font-size: 17pt;'">
                            <c:out value="${board.boardCategory}" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 20%">글 제목</td>
                        <td colspan="2">
                            <c:out value="${board.boardTitle}" />
                        </td>
                    </tr>
                    <tr>
                        <td>작성자</td>
                        <td colspan="2">
                            <c:out value="${board.boardWriter}" />
                        </td>
                    </tr>
                    <tr>
                        <td>작성일자</td>
                        <td colspan="2">
                            <c:out value="${board.boardDate}" />
                        </td>
                    </tr>
                    <tr style="height: 300px">
                        <td>내용</td>
                        <td colspan="2" style="min-height: 200px; text-align: left;">
                            <c:out value="${board.boardContent}" />
                        </td>
                    </tr>

                </tbody>

            </table>

            <div id="loding" style="bottom: 0px; left:50%; position: fixed; visibility: hidden;">
                <img alt="" src="/resources/img/loding.gif">
            </div>

            <a id="listGO" href="#" class="btn btn-primary">목록</a> <a id="updateGO" href="#"
                class="btn btn-primary">수정</a> <a id="deleteGO" href="#" class="btn btn-primary">삭제</a>

            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title" id="myModalLabel">Modal title</h4>
                        </div>
                        <div class="modal-body">처리가 완료되었습니다.</div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>

            <form id="listGetForm" action="/board/list" method="get">
                <input type="hidden" name="pageNum" value="${pageMaker.pageNum}">
                <input type="hidden" name="amount" value="${pageMaker.amount}">
                <input type="hidden" name="type" value="${pageMaker.type}">
                <input type="hidden" name="keyword" value="${pageMaker.keyword}">
                <input type="hidden" name="boardBno" value="${board.boardBno}">
            </form>
            <a href="reply.jsp"></a>
            <table class="table table-striped" style="border: 1px solid #dddddd; margin-top: 20px">
                <thead>
                    <tr>
                        <th colspan="2" style="background-color: #eeeeee; text-align: center; padding-left: 100px">댓글
                            입력</th>
                        <td style="background-color: #eeeeee; width: 50px;"><a onclick="replyDO(${board.boardBno})"
                                class="btn btn-primary">댓글
                                등록</a></td>
                    </tr>
                </thead>
                <tbody>
                    <tr>

                        <td colspan="3">
                            <!--  	<textarea rows="5" cols="100" id="textarea"
										style="resize: none; width: 100%;" disabled="disabled">로그인이 필요합니다.</textarea>-->
                            <textarea id="replyContent" rows="5" cols="100" style="resize: none; width: 100%;"
                                id="commentContent"></textarea>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    <div class="container">
        <div class="row">
            <div id="commentField">
                <!--  	<c:forEach items="${CommentList}" var="cdto">
							<tr>
								<td style="text-align: left;">
									<c:if test="${cdto.commentIndent != 0}">
										<img src="./img/z.jpg" style="width:30px;height:30px;">
									</c:if>작성자 : ${cdto.commentUserID}</td>
								<td style="text-align: right;"><a
									onclick="showReply(${cdto.commentNo});">댓글</a> <a
									style="margin-left: 10px;" href="thumb.bo">따봉
										${cdto.commentThumb}</a></td>
							</tr>
							<tr>
								<td colspan="2" style="text-align: left;">
									${cdto.commentContent}</td>
							</tr>
					</c:forEach> -->
            </div>
        </div>
    </div>


    <script src="https://code.jquery.com/jquery-3.4.1.js"
        integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <script src="/resources/js/sibar.js"></script>
    <script>

        $().ready(
            function () {

                var result = '<c:out value="${result}"/>';

                checkModal(result);

                history.replaceState({}, null, null);

                function checkModal(result) {
                    if (result == '' || history.state) {
                        return;
                    }
                    if (result) {
                        $(".modal-body").html(
                            "게시글 " + parseInt(result)
                            + " 번이 수정되었습니다.");
                    }

                    $('#myModal').modal("show");
                }

                var actionForm = $('#listGetForm');

                $('#listGO').on('click', function (e) {
                    actionForm.submit();
                });

                $('#deleteGO').on('click', function (e) {
                    e.preventDefault();
                    actionForm.attr('action', '/board/delete');
                    actionForm.submit();
                });

                $('#updateGO').on('click', function (e) {
                    e.preventDefault();
                    actionForm.attr('action', '/board/update');
                    actionForm.submit();
                });

                $('.addReply').on('click', function (e) {
                    addReplyList($(this));
                });


            })

        var replyBno = "<c:out value='${board.boardBno}'/>";
        var pageNum = 1;


        $.ajax({
            async: false,
            type: "get",
            url: "/reply/getReplyList/" + replyBno + "/" + pageNum + ".json",
            success: function (data) {
                for (var i = 0; i < data.length; i++) {
                    var obj = data[i];

                    if (obj.cnt != 0) {
                        var div = $("<div id='replys" + obj.replyCno + "'><img src='/resources/img/panda.png' class='profile'></img><h4>" + obj.replyWriter + "</h4><div colspan='2' style='text-align: left;margin-left:50px;'>" + obj.replyContent + "</div><a class='btn writeReReply' id='rere" + obj.replyCno + "'' style='margin-right:10px;'>댓글</a><a class='thumbs-"+obj.replyThumbs+"' onclick='thumbs("+obj.replyCno+")'>좋아요" + obj.replyThumbs + "</a><div class='kk'><a class='btn addReply' id='re" + obj.replyCno + "''>답글 보기...</a></div></div>");
                    } else {
                        var div = $("<div id='replys" + obj.replyCno + "'><img src='/resources/img/panda.png' class='profile'></img><h4>" + obj.replyWriter + "</h4><div colspan='2' style='text-align: left;margin-left:50px;'>" + obj.replyContent + "</div><a class='btn writeReReply' id='rere" + obj.replyCno + "'' style='margin-right:10px;'>댓글</a><a class='thumbs-"+obj.replyThumbs+"' onclick='thumbs("+obj.replyCno+")'>좋아요" + obj.replyThumbs + "</a></div>");
                    }

                    $("#commentField").append(div);
                }
                pageNum = pageNum + 1;
            }
        });

        $(function () {
            $(window).scroll(function () {
                var scrolltop = $(window).scrollTop();
                if (scrolltop == $(document).height() - $(window).height()) {
                    $("#loding").css("visibility", "visible");
                }
            });
        });

        function sleep(num) {   //[1/1000초]

            var now = new Date();

            var stop = now.getTime() + num;

            while (true) {

                now = new Date();

                if (now.getTime() > stop) return;

            }

        }

        $(function () {
            $(window).scroll(function () {
                var scrolltop = $(window).scrollTop();
                if (scrolltop == $(document).height() - $(window).height()) {
                    $.ajax({
                        type: "get",
                        url: "/reply/getReplyList/" + replyBno + "/" + pageNum + ".json",
                        success: function (data) {
                            sleep(1200);
                            for (var i = 0; i < data.length; i++) {
                                var obj = data[i];

                                if (obj.cnt != 0) {
                                    var div = $("<div id='replys" + obj.replyCno + "'><img src='/resources/img/panda.png' class='profile'></img><h4>" + obj.replyWriter + "</h4><div colspan='2' style='text-align: left;margin-left:50px;'>" + obj.replyContent + "</div><a class='btn writeReReply' id='rere" + obj.replyCno + "'' style='margin-right:10px;'>댓글</a><a>좋아요 " + obj.replyThumbs + "</a><div class='kk'><a class='btn addReply' id='re" + obj.replyCno + "''>답글 보기...</a></div></div>");
                                } else {
                                    var div = $("<div id='replys" + obj.replyCno + "'><img src='/resources/img/panda.png' class='profile'></img><h4>" + obj.replyWriter + "</h4><div colspan='2' style='text-align: left;margin-left:50px;'>" + obj.replyContent + "</div><a class='btn writeReReply' id='rere" + obj.replyCno + "'' style='margin-right:10px;'>댓글</a><a>좋아요 " + obj.replyThumbs + "</a></div>");
                                }

                                $("#commentField").append(div);
                            } $("#loding").css("visibility", "hidden");
                            pageNum = pageNum + 1;
                            $('.writeReReply').on('click', textHandeler);
                        }
                    });
                }
            });
        });



        function addReplyList(parent) {
            var cno = $(parent).attr('id').replace(/[^0-9]/g, "");
            var cc = parseInt(cno);
            if ($('#re' + cc + '').html() == '답글 보기...') {
                $.ajax({
                    type: "get",
                    url: "/reply/getReReplyList/" + cc + ".json",
                    success: function (data) {
                        var pDiv = $("<div id=zzz" + data[0].replyCno + "></div>");
                        for (var i = 0; i < data.length; i++) {
                            var obj = data[i];
                            var div = $("<div style='margin:10px; margin-left:20px;' id='replys" + obj.replyCCno + "'><img src='/resources/img/panda.png' class='profile'></img><h4>" + obj.replyWriter + "</h4><div colspan='2' style='text-align: left;margin-left:50px;'>" + obj.replyContent + "</div><a class='btn' onclick='Writerereply("+obj.replyCCno+",\"" + obj.replyWriter + "\");' id='rere" + obj.replyCno + "'' style='margin-right:10px;'>댓글</a><a>좋아요 " + obj.replyThumbs + "</a></div>");

                            pDiv.append(div);
                        }
                        $('#replys' + data[0].replyCno + '').after(pDiv);
                        $('#re' + data[0].replyCno + '').html('답글 숨기기...');
                    }
                });
            } else {
                $('#zzz' + cc + '').remove();
                $('#re' + cc + '').html('답글 보기...');
            }


        }



       

        $('.writeReReply').on('click', textHandeler);


        function textHandeler(){
        	 var div = ('<div class="rereplydiv"><input type="text" placeholder="공개 댓글 추가..." id="rereplyContent" rows="5" cols="100" style=""></div>');
             var div2 = ("<div class='rereplydiv' style='width:100%;'><a class='btn' onclick='closeWrite();' style='color:#606060 !important;'>취소</a><a class='btn' style='color:white !important; background-color:#cccccc;' >댓글</a></div>");
             $('.rereplydiv').remove();
             $("#replys" + $(this).attr('id').replace(/[^0-9]/g, "") + "").append(div);
             $("#replys" + $(this).attr('id').replace(/[^0-9]/g, "") + "").append(div2);
        }
        
        function closeWrite() {
            $('.rereplydiv').remove();
        }
        
        

        function Writerereply(cno,writer) {
        	alert(writer);
        	alert(cno);
            var div = ('<div class="rereplydiv"><input type="text" value="@'+writer+' " placeholder="공개 댓글 추가..." id="rereplyContent" rows="5" cols="100" style=""></div>');
            var div2 = ("<div class='rereplydiv' style='width:100%;'><a class='btn' onclick='closeWrite();' style='color:#606060 !important;'>취소</a><a class='btn' style='color:white !important; background-color:#cccccc;' >댓글</a></div>");
            $('.rereplydiv').remove();
            $("#replys" + cno + "").append(div);
            $("#replys" + cno + "").append(div2);
        }
        
        
        function thumbs(cno){
			var click = 1;
			$.ajax({
				type: "get",
	            url: "/reply/upthumbs/" + cno +".json",
	            success: function (data) {
	            	alert(data);
	            }
			})
        }

        function replyDO(boardBno) {
            if ($('#replyContent').val() == '') {
                $(".modal-body").html("댓글을 입력해주세요");
                $('#myModal').modal("show");
                return;
            }
            var reply = {
                replyBno: boardBno,
                replyWriter: "작성자",
                replyContent: $('#replyContent').val(),
            };
            this.replyService.add(reply, function (obj) {
                if (obj) {
                    var div = $("<div id='replys" + obj.replyCno + "'><img src='/resources/img/panda.png' class='profile'></img><h4>" + obj.replyWriter + "</h4><div colspan='2' style='text-align: left;margin-left:50px;'>" + obj.replyContent + "</div><a class='btn writeReReply' id='rere" + obj.replyCno + "'' style='margin-right:10px;'>댓글</a><a>좋아요 " + obj.replyThumbs + "</a></div>");

                    $("#commentField").prepend(div);
                    $('#replyContent').val('');
                    $('.writeReReply').on('click', textHandeler);
                }
            });
        }

    </script>
</body>

</html>