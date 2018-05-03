<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<h1> In View Page </h1>
	<input type="text" name='bno' value="${vo.bno}" readonly="readonly">
	<input type="text" name="title" value="${vo.title}" readonly="readonly">
	<input type="text" name="content" value="${vo.content}" readonly="readonly">
	<input type="text" name="writer" value="${vo.writer}" readonly="readonly">
	<button><a href="/board/update?bno=${vo.bno}">UpdateBtn</a></button>
	<form action="/board/delete?bno=${vo.bno}" method="post">
	<button>Delete</button>
	</form>
	
</body>
</html>