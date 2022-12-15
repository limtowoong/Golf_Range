<div align="center">

# 강의 리스트

<br>

</div>

![image](https://user-images.githubusercontent.com/104752202/207214864-49777e6f-2c65-4445-a5f8-8bf99aa0b74f.png)

<br>

```javascript
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
```

<br>

<div align="center">

`to_char(class_price, 'L999,999')`

L을 사용하여 수강료에 ₩(원화 기호)를 붙이고 단위를 표시하기 위해 , (콤마)를 넣었습니다.   
그리고 9를 6번 사용하여 10만자리 까지 표시 하였습니다.

<br><br>

`substr(teach_resist_date,1,4)||'년'||`   
`substr(teach_resist_date,5,2)||'월'||`   
`substr(teach_resist_date,7,2)||'일'`

teach_resist_date는 date 형식이기 때문에 to_char 대신   
3개의 substr을 사용하여 YYYY년MM월DD일을 각각 따로 표현해야 합니다.

<br><br>

</div>

```javascript
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
```

<br>

<div align="center">

rs.getString을 사용하여 위에 sql문을 1번 부터 5번 까지 조회하고   
조회된 값을 while문으로 반복하여 테이블을 채웁니다.

<br><br>

# 수강신청

</div>

![image](https://user-images.githubusercontent.com/104752202/207217858-a8483f5f-3ac3-460f-ba23-052c5efca1c3.png)

<br>

## 유효성 검사

```javascript
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
```

```javascript
<option value="none">회원명</option>
<option value="none">강의신청</option>
```

<br>

<div align="center">

유효성 검사를 하는 코드입니다.   

`if(document.data.class_name.value=="none")`

위와 같은 경우는 option에서 '회원명'이나 '강의신청'을 선택하면    
option에서 value값을 none으로 줘서 focus와 alert를 실행됩니다.

</div>

<br><br>

## 회원명

</div>

```javascript
function VD(code) {
    document.data.c_no.value = code;
    document.data.class_name.value = "none";
    document.data.tuition.value="";
}
```
```javascript
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
```

<br>

<div align="center">

옵션에서 선택한 value 값을 this.value로 가져와서 자바스크립트 함수에서 회원번호 value 값에 넣어줍니다.    
그 후 강의명과 강의료를 초기화 시킵니다.

</div>

<br><br>

## 

```javascript
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
```

<br>

<div align="center">

회원번호가 없으면 alert를 출력하고 강의명에 0번째를 띄어주고 오류가 없도록 true값을 강제로 박아줍니다.

회원번호가 있으면 강사코드에 맞는 금액을 지급하고 만약에 회원번호에 앞자리가 2이면    
수강료를 50% 할인 앞자리가 2가 아니면 기본 수강료 지급

</div>

<br><br>

```javascript
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

```

<br>

<div align="center">

rs2.next()를 사용하여 option을 반복 실행한다. 

</div>

<br>

## 버튼

```javascript
function reload() {
    alert("정보를 지우고 처음부터 다시 입력합니다!");
    document.data.reset();
    data.resist_month.focus();
}
```

<br>

<div align="center">
    리셋시키고 포커스를 맞춥니다.
</div>

<br><br>

```javascript
<tr>
    <td colspan="2" align="center">
        <input type="submit" value="수강신청">
        <input type="button" value="다시쓰기" onclick="reload()">
    </td>
</tr>
```

<br>

<div align="center">
    다시쓰기 버튼을 클릭 시 function에서 reload()가 실행됩니다.
</div>

<br><br>

---
