<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/style.css">
<title>Insert title here</title>
<script type="text/javascript">
	function checkValue() {
		if(!document.data.resist_month.value){
			alert("수강월을 입력하지 않았습니다.");
			data.resist_month.focus();
			return false;
		}else if(document.data.c_name.value=="none"){
			alert("회원명이 선택되지 않았습니다.");
			data.c_name.focus();
			return false;
		}else if(!document.data.class_area.value){
			alert("강의장소가 입력하지 않았습니다.");
			data.class_area.focus();
			return false;
		}else if(document.data.class_name.value=="none"){
			alert("강의명이 선택되지 않았습니다.");
			data.class_name.focus();
			return false;
		}
		alert("수강신청이 정상적으로 완료되었습니다!");
	}
	
	function checkName(Name) {
		document.data.c_no.value = Name;
	}
	
	function checkClass(Class) {
	      var price = 0;

	      if(Class==100)
	         price=100000;
	      else if(Class==200)
	         price=200000;
	      else if(Class==300)
	         price=300000;
	      else if(Class==400)
	         price=400000;
	      
	      if(document.data.c_no.value.charAt(0)=='2'){
	         price = price/2;
	         document.data.tuition.value = price;
	      }else{
	         document.data.tuition.value = price;
	      }
	   
	}
	
	function checkRE() {
		alert("정보를 지우고 처음부터 다시 입력합니다!");
		document.data.reset();
		data.resist_month.focus();
	}
</script>
</head>
<body>
<jsp:include page="layout/header.jsp"/>
<jsp:include page="layout/nav.jsp"/>
<section class="section">
	<h2>수강신청</h2>
<form name="data" action="insert1_p.jsp" onsubmit="return checkValue()">
	<table>
		<tr>
			<th>수강월</th>
			<td><input type="text" name="resist_month">
			2022년03월 예)202203</td>
		</tr>
		<tr>
			<th>회원명</th>
			<td>
			
				<select name="c_name" onchange="checkName(this.value)">
					<option value="none">회원명</option>
                    <option value="10001">홍길동</option>
                    <option value="10002">장발장</option>
                    <option value="10003">임꺽정</option>
                    <option value="20001">성춘향</option>
                    <option value="20002">이몽룡</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>회원번호</th>
			<td><input type="text" name="c_no" readonly>
			예)10001</td>
		</tr>
		<tr>
			<th>강의장소</th>
			<td><input type="text" name="class_area"></td>
		</tr>
		<tr>
			<th>강의명</th>
			<td>
				<select name="class_name" onchange="checkClass(this.value)">
					<option value="none">강의신청</option>
                    <option value="100">초급반</option>
                    <option value="200">중급반</option>
                    <option value="300">고급반</option>
                    <option value="400">심화반</option>
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
				<input type="button" value="다시쓰기" onclick="checkRE()">
			</td>
		</tr>
	</table>
</form>
</section>
<jsp:include page="layout/footer.jsp"/>
</body>
</html>
