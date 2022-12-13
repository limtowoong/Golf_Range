<%@ page import="java.sql.*" %>
<%@ page import="DB.DBConnect" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sql="select teacher_code, teacher_name, class_name, "
			+ "to_char(class_price, 'L999,999'), "
			+ "substr(teach_resist_date,1,4)||'년'||substr(teach_resist_date,5,2)||'월' "
			+ "||substr(teach_resist_date,7,2)||'일' "
			+ "from tbl_teacher_202201";

	Connection conn = DBConnect.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/style.css">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="layout/header.jsp"/>
<jsp:include page="layout/nav.jsp"/>
<section class="section">
	<div>강사조회</div>
	<table class="table_line">
		<tr>
			<th>강사코드</th>
			<th>강사명</th>
			<th>강의명</th>
			<th>수강료</th>
			<th>강사자격취득일</th>
		</tr>
		<%
			while(rs.next()) {
		%>
		<tr align="center">
		  <td><%= rs.getString(1) %></td>
		  <td><%= rs.getString(2) %></td>
		  <td><%= rs.getString(3) %></td>
		  <td><%= rs.getString(4) %></td>
		  <td><%= rs.getString(5) %></td>
		<%
			}
		%>
		</tr>
	</table>
</section>
<jsp:include page="layout/footer.jsp"/>
</body>
</html>