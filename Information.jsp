<%@ page import = "DB.DBConnect" %>
<%@ page import = "java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sql = "select to_char(to_date(c.RESIST_MONTH,'yyyymm'),'yyyy\"년\"mm\"월\"'), "
			+ "c.c_no, m.c_name, t.class_name, c.class_area, "
			+ "to_char(c.tuition, 'L999,999'), m.grade "
			+ "from tbl_class_202201 c, tbl_member_202201 m, tbl_teacher_202201 t "
			+ "where c.c_no = m.c_no and t.teacher_code = c.teacher_code"; 


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
	<div>회원정보조회</div>
<table class="table_line">
	<tr>
		<th>수강월</th>
		<th>회원번호</th>
		<th>회원명</th>
		<th>강의명</th>
		<th>강의장소</th>
		<th>수강료</th>
		<th>등급</th>
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
		<td><%= rs.getString(6) %></td>
		<td><%= rs.getString(7) %></td>
	</tr>
	<%
		}
	%>
</table>
</section>
<jsp:include page="layout/footer.jsp"/>
</body>
</html>