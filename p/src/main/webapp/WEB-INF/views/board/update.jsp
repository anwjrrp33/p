<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<h1> Update Page </h1>

<form method="post">
	<input type="text" name='bno' value="${vo.bno}" readonly="readonly">
	<input type="text" name="title" value="${vo.title}">
	<input type="text" name="content" value="${vo.content}">
	<input type="text" name="writer" value="${vo.writer}" readonly="readonly">
	<button>Btn</button>
</form>
</body>
</html>