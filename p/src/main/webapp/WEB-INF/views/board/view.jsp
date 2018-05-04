<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>SB Admin - Start Bootstrap Template</title>
  <!-- Bootstrap core CSS-->
  <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom fonts for this template-->
  <link href="/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <!-- Custom styles for this template-->
  <link href="/resources/css/sb-admin.css" rel="stylesheet">
</head>
<style>
	.card-header a {
		margin-left : 74%;
	}
	#debtn {
		background-color: rgba( 255, 255, 255, 0 );
		border : 0;
		outline : 0;
	}
	.replyLi {
		list-style : none;
		text-align: left;
		margin-bottom : 10px;
	}
	.replecol, .replyercol {
		float : left;
	}
	.replecol {
		margin-right : 40%;
	}
</style>
<body class="bg-dark">
  <div class="container">
    <div class="card card-register mx-auto mt-5">
      <div class="card-header">View Page<a href="/board/list">Back</a></div>
      <div class="card-body">
       
          <div class="form-group">
          		<label for="exampleInputName">Bno.${vo.bno}</label>
          </div>	
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <label for="exampleInputName">Title</label>
                <input class="form-control" id="exampleInputName" type="text" aria-describedby="nameHelp" placeholder="Enter Title" value="${vo.title}" readonly="readonly">
              </div>
              <div class="col-md-6">
                <label for="exampleInputLastName">Writer</label>
                <input class="form-control" id="exampleInputLastName" type="text" aria-describedby="nameHelp" placeholder="Enter Writer" value="${vo.writer}" readonly="readonly">
              </div>
            </div>
          </div>
          <div class="form-group">
            <label for="exampleInputEmail1">Content</label>
            <input class="form-control" id="exampleInputEmail1" type="email" aria-describedby="emailHelp" placeholder="Enter Content" value="${vo.content}" readonly="readonly">
          </div>
          <a class="btn btn-primary btn-block" href="/board/update?bno=${vo.bno}">Update</a>
          <a class="btn btn-primary btn-block"><form action="/board/delete?bno=${vo.bno}" method="post"><button id="debtn">Delete</button></form></a>
          <hr>
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <label for="exampleInputPassword1">Replyer</label>
                <input class="form-control replyer" id="exampleInputPassword1" type="text" placeholder="Replyer.." name="replyer">
              </div>
              <div class="col-md-6">
                <label for="exampleConfirmPassword">Reply</label>
                <input class="form-control reple" id="exampleConfirmPassword" type="text" placeholder="Reply" name="reple">             
              </div>
            </div>
          </div>
          <div class="form-group">
          <a class="btn btn-primary btn-block replybtn">Insert</a>
          <a class="btn btn-primary btn-block updatebtn">Update</a>
          </div>
          <hr>
        
        <div class="text-center">
         	<ul class="replyUL">

			</ul>
        </div>
      </div>
    </div>
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
					str += "<li data-rno='" + this.rno + "' class='replyLi'><button class='deleteBtn' data-rno='"+this.rno+"'>x</button><div class='replyercol'>" + this.replyer + "</div>:<div class='replecol'>" + this.reple + "</div></li>";
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
