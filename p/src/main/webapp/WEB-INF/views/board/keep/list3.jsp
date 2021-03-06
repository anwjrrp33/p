<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- Bootstrap core CSS-->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
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
<style>

	#paging {
	
		display: inline;
	
	}

</style>
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
							<td><a href="/board/view?bno=${list.bno}">${list.bno}</a></td>
							<td>${list.title}</td>
							<td>${list.writer}</td>
							<td>${list.regdate}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<form>
			<select name="type">

				<option>검색조건</option>
				<option value="t">title</option>
				<option value="c">content</option>
				<option value="w">writer</option>
				<option value="tc">title+content</option>
				<option value="tw">title+writer</option>
				<option value="wc">content+writer</option>
				<option value="twc">title+content+writer</option>

			</select> 
			<input type="text" name="keyword">
			<button>확인</button>
		</form>

		<div class="col-sm-12 col-md-7" id="paging">
			<div class="dataTables_paginate paging_simple_numbers"
				id="dataTable_paginate">
				<ul class="pagination">
					<c:if test="${maker.prev}">
						<li class="paginate_button page-item"><a class="page-link"
							href="/board/list?page=${maker.start-1}">Previous</a>
						<li>
					</c:if>
					<c:forEach var="maker" begin="${maker.start}" end="${maker.end}">
						<c:if test="${cri.type != null}">
							<li class="paginate_button page-item"><a class="page-link"
								href="/board/list?page=${maker}&type=${cri.type}&keyword=${cri.keyword}">${maker}</a></li>
						</c:if>
						<c:if test="${cri.type == null}">
							<li class="paginate_button page-item"><a class="page-link"
								href="/board/list?page=${maker}">${maker}</a></li>
						</c:if>
					</c:forEach>
					<c:if test="${maker.next}">
						<li class="paginate_button page-item"><a class="page-link"
							href="/board/list?page=${maker.end+1}">Next</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
	</div>
</body>
<script>	
	if(${type eq "success"}){
		alert("success");
	}
</script>
</html>
