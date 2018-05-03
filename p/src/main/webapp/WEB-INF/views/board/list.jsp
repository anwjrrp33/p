<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- Bootstrap core CSS-->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom fonts for this template-->
<link href="/resources/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<!-- Page level plugin CSS-->
<link href="/resources/vendor/datatables/dataTables.bootstrap4.css"
	rel="stylesheet">
<!-- Custom styles for this template-->
<link href="/resources/css/sb-admin.css" rel="stylesheet">
</head>
<body>

	<div class="card mb-3">
		<div class="card-header">
			<i class="fa fa-table"></i> Data Table Example
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">
					<thead>
						<tr>
							<th>No.</th>
							<th>Title</th>
							<th>Writer</th>
							<th>regdate</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="list">
						<tr>
							<td>${list.bno}</td>
							<td>${list.title}</td>
							<td>${list.writer}</td>
							<td>${list.regdate}</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<form>
			
			<input type="text" name="keyword"> <button> 확인 </button>
			
			</form>					
			<div class="col-sm-12 col-md-7">
			<div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">
				<ul class="pagination">
				<c:if test="${maker.prev}">
				<li class="paginate_button page-item"><a class="page-link" href="/board/list?page=${maker.start-1}">Previous</a><li></c:if>
					<c:forEach var="maker" begin="${maker.start}" end="${maker.end}">
						<li class="paginate_button page-item"><a class="page-link" href="/board/list?page=${maker}">${maker}</a></li>
					</c:forEach>
					<c:if test="${maker.next}">
				<li class="paginate_button page-item"><a class="page-link" href="/board/list?page=${maker.end+1}">Next</a></li></c:if>
				</ul>
			</div>	
			</div>
		</div>
		<div class="card-footer small text-muted">Updated yesterday at
			11:59 PM</div>
	</div>
	</div>
	<!-- /.container-fluid-->
	<!-- /.content-wrapper-->
	<footer class="sticky-footer">
	<div class="container">
		<div class="text-center">
			<small>Copyright © Your Website 2018</small>
		</div>
	</div>
	</footer>
</body>
</html>
<script>
	
	if(${type eq "success"}){
		alert("success");
	}

</script>