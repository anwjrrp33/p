<%@include file="/WEB-INF/views/board/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- In Board List -->
<div class="card-body">
	<div class="table-responsive">
		<table class="table table-bordered" id="dataTable" width="100%"
			cellspacing="0">
			<thead>
				<tr>
					<th>Bno</th>
					<th>Title</th>
					<th>Writer</th>
					<th>Regdate</th>
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
</div>

<!-- paging -->
<div class="card-footer small text-muted">
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

<script>

	if(${type eq "success"}){
		alert("success");
	}
	
	
</script>
<%@include file="/WEB-INF/views/board/footer.jsp"%>