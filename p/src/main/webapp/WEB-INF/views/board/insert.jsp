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
	
</style>
<body class="bg-dark">
  <div class="container">
    <div class="card card-register mx-auto mt-5">
      <div class="card-header">Register Board<a href="/board/list">Back</a></div>
      <div class="card-body">
        <form method="post">
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <label for="exampleInputName">Title</label>
                <input class="form-control" id="exampleInputName" type="text" aria-describedby="nameHelp" placeholder="Enter Title" name="title">
              </div>
              <div class="col-md-6">
                <label for="exampleInputLastName">Writer</label>
                <input class="form-control" id="exampleInputLastName" type="text" aria-describedby="nameHelp" placeholder="Enter Writer" name="writer">
              </div>
            </div>
          </div>
          <div class="form-group">
            <label for="exampleInputEmail1">Content</label>
            <textarea class="form-control" id="exampleInputEmail1" type="text" aria-describedby="emailHelp" placeholder="Enter Content" rows="15" name="content"></textarea>
          </div>
          <button class="btn btn-primary btn-block">Register</button>
        </form>
      </div>
    </div>
  </div>
</body>

</html>
