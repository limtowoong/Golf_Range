<%@page import="javax.xml.transform.Result"%>
<%@ page import="java.sql.*" %>
<%@ page import="DB.DBConnect" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sql="select c_no, c_name from tbl_member_202201";
	String sql2 = "select teacher_code, class_name from tbl_teacher_202201";

	Connection conn = DBConnect.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	PreparedStatement pstmt2 = conn.prepareStatement(sql2);
	ResultSet rs = pstmt.executeQuery();
	ResultSet rs2 = pstmt2.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/style.css">
<title>Insert title here</title>
<script type="text/javascript">
	function checkValue() {
		if(!document.data.resist_month.value) {
			alert("수강월이 입력되지 않았습니다!");
			data.resist_month.focus();
			return false;
		} else if(document.data.c_name.value=="none") {
			alert("회원명을 선택되지 않았습니다!");
			data.c_name.focus();
			return false;
		} else if(!document.data.class_area.value) {
			alert("강의장소를 입력되지 않았습니다!");
			data.class_area.focus();
			return false;
		} else if(document.data.class_name.value=="none") {
			alert("강의명을 선택되지 않았습니다!");
			data.class_name.focus();
			return false;
		}
		alert("수강신청이 정상적으로 완료되었습니다!");
		return true;
	}
	function reload() {
		alert("정보를 지우고 처음부터 다시 입력합니다!");
			document.data.reset();
			data.resist_month.focus();
	}
	function VD(code) {
		document.data.c_no.value = code;
		document.data.class_name.value = "none";
		document.data.tuition.value="";
	}
	function CT(tcode) {
		var mbr = document.data.c_no.value;
		if(!mbr) {
			alert("회원명을 먼저 선택하세요.");
			document.data.class_name[0].selected = true;
			document.data.c_name.focus();
		}else {
			var salePrice = 0;
			switch(tcode) {
				case "100":
					salePrice = 100000;
					break;
				case "200":
					salePrice = 200000;
					break;
				case "300":
					salePrice = 300000;
					break;
				case "400":
					salePrice = 400000;
					break;
			}
			if(mbr.charAt(0)=='2') {
				alert("수강료가 50% 할인 되었습니다.");
				salePrice = salePrice / 2;
			}
			document.data.tuition.value = salePrice;
		}
	}
</script>
</head>
<body>
<jsp:include page="layout/header.jsp"/>
<jsp:include page="layout/nav.jsp"/>
<section class="section">
	<div>수강신청</div>
<form name="data" action="Application_p.jsp" method="post" onsubmit="return checkValue()">
	<table class="table_line">
		<tr>
			<th>수강월</th>
			<td>
				<input type="text" name="resist_month">
				2022년03월 예)202203
			</td>
		</tr>
		<tr>
			<th>회원명</th>
			<td>
				<select name="c_name" onchange="VD(this.value)">
					<option value="none">회원명</option>
					<%
						while(rs.next()) {
					%>
		<option value="<%=rs.getString("c_no")%>"><%=rs.getString("c_name")%></option>
					<%
						}
					%>
				</select>
			</td>
		</tr>
		<tr>
			<th>회원번호</th>
			<td>
				<input type="text" name="c_no" readonly>
				예)10001
			</td>
		</tr>
		<tr>
			<th>강의장소</th>
			<td><input type="text" name="class_area">
		</tr>
		<tr>
			<th>강의명</th>
			<td>
				<select name="class_name" onchange="CT(this.value)">
					<option value="none">강의신청</option>
					<%
						while(rs2.next()) {
					%>
		<option value="<%=rs2.getString("teacher_code")%>"><%=rs2.getString("class_name")%></option>
					<%
						}
					%>
				</select>
			</td>
		</tr>
		<tr>
			<th>수강료</th>
			<td><input type="text" name="tuition" readonly>원</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="수강신청">
				<input type="button" value="다시쓰기" onclick="reload()">
			</td>
		</tr>
	</table>
</form>
</section>
<jsp:include page="layout/footer.jsp"/>
</body>
</html>