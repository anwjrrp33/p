<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<div>
		<h1>In View Page</h1>
		<input type="text" class="bno" name='bno' value="${vo.bno}"
			readonly="readonly"> 
			<input type="text" name="title"	value="${vo.title}" readonly="readonly"> 
			<input type="text"	name="content" value="${vo.content}" readonly="readonly">
			 <input	type="text" name="writer" value="${vo.writer}" readonly="readonly">
		<button>
			<a href="/board/update?bno=${vo.bno}">UpdateBtn</a>
		</button>
		<form action="/board/delete?bno=${vo.bno}" method="post">
			<button>Delete</button>
		</form>
	</div>

	<div class="replyForm">
		Replyer : <input type="text" class="replyer" name="replyer">
		Reple : <input type="text" class="reple" name="reple">
		<button class="replybtn">reply</button>
		<button class="updatebtn">update</button>
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
					str += "<li data-rno='" + this.rno + "' class='replyLi'><button class='deleteBtn' data-rno='"+this.rno+"'>x</button>" + this.replyer + ":" + this.reple + "<li>";
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
		var rno = $(this).attr("data-rno");
		$.getJSON("/reply/read/"+rno, function(data){
			$(".replyer").val($(data).attr("replyer"));
			$(".reple").val($(data).attr("reple"));
			$(".updatebtn").attr("data-rno",rno);
		});
	});

	
	$(".replyUL").on("click", ".deleteBtn", function(event){
		console.log($(this).attr("data-rno"));
		var rno = $(this).attr("data-rno");
		$.ajax({
			url : "/reply/delete/"+rno,
			type : 'delete',
			data : JSON.stringify({rno : rno}),
			headers : {"Content-Type" : "application/json"},
			success : function(result){
				if(result == 'success'){
					alert("Delete Success");
					getReply();
				}
			}
		});
	});
	
	
	$(".updatebtn").on("click", function(event){
		var rno = $(this).attr("data-rno");
		var replyer = $(".replyer").val();
		var reple = $(".reple").val();
		$.ajax({
			url : "/reply/update",
			type : 'put',
			data : JSON.stringify({
				rno : rno,
				replyer : replyer,
				reple : reple
			}),
			headers : {"Content-Type" : "application/json"},
			success : function(result){
				if(result == 'success'){
					alert("Update Success");
					getReply();
				}
			}
		});
	});
	
	
</script>
</html>