<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<c:if test="${pageContext.request.method=='POST'}">
<c:catch var="exception">
<sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver"
url="jdbc:mysql://localhost:3306/mahendra" user="root" password="root"
scope="session" />
<sql:update dataSource="${dataSource}" var="updatedTable">
INSERT INTO tips (firstname,lastname,salary,tonus) VALUES (?, ?, ?, ?)
<sql:param value="${param.Title}" />
<sql:param value="${param.type}" />
<sql:param value="${param.Dcp}" />
<sql:param value="${param.bonus}" />
</sql:update>
<c:if test="${updatedTable>=1}">
<font size="5" color='green'> Congratulations ! Data inserted
successfully.</font>
</c:if>
</c:catch>
<c:if test="${exception!=null}">
<c:out value="Unable to insert data in database." />
</c:if>
</c:if>
</body>
</html>