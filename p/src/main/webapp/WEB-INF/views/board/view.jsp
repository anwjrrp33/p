<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<style>
	div {
		margin:50px;
	}
</style>

	<div>
		<h1>In View Page</h1>
		<input type="text" class="bno" name='bno' value="${vo.bno}"
			readonly="readonly"> <input type="text" name="title"
			value="${vo.title}" readonly="readonly"> <input type="text"
			name="content" value="${vo.content}" readonly="readonly"> <input
			type="text" name="writer" value="${vo.writer}" readonly="readonly">
		<button>
			<a href="/board/update?bno=${vo.bno}">UpdateBtn</a>
		</button>
		<form action="/board/delete?bno=${vo.bno}" method="post">
			<button>Delete</button>
		</form>
	</div>

	<div class="replyForm">
		<input type="text" class="replyer" name="replyer">
		<input type="text" class="reple" name="reple">
		<button class="replybtn">reply</button>
	</div>

	<div>
		<ul class="replyUL">

		</ul>
	</div>

</body>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>

<script>
	var bno = ${vo.bno};
	
	function getReply(){
 		$.getJSON("/reply/list/" + bno+ "/" + 1, function(data) {
			var str = "";
			console.log(data);
			console.log(data.length);

			$(data).each(
				function() {
					str += "<li data-rno='" + this.rno + "' class='replyLi'>" + this.replyer + ":" + this.reple + "<li>";
			});
			
			$(".replyUL").html(str);
		});		
	}
	
	$(document).ready(function() {
		getReply();
	});
	
	$(".replybtn").on("click", function(e){
		var replyer = $(".replyer").val();
		var reple = $(".reple").val();
		console.log(replyer == "");
		console.log(replyer != "");
		
		if(replyer != "" && reple != ""){
			$.ajax({
				url : '/reply/insert',
				type : 'post',
				data : JSON.stringify({
					bno : bno,
					replyer : replyer,
					reple : reple
				}),
				headers : {
					"Content-Type" : "application/json"
				},
				success : function(result) {
					if(result == 'success'){
						alert("Insert Success");
						getReply();
						$(".replyer").val("");
						$(".reple").val("");
					}
				}
			}); 
		}else{
			alert("please Input data");
		}
	});
	
	
	$(".replyUL").on("click", ".replyLi", function(data){
		console.log($(this).attr("data-rno"));
		
		
	});
	
</script>
</html>
$.getJSON("/reply/list/" + bno+ "/" + 1, function(data) {
			var str = "";
			console.log(data);
			console.log(data.length);

			$(data).each(
				function() {
					str += "<li data-rno='" + this.rno + "' class='replyLi'>" + this.replyer + ":" + this.reple + "<li>";
			});
			
			$(".replyUL").html(str);
		});		
	}
