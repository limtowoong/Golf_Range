![image](https://user-images.githubusercontent.com/104752202/207214864-49777e6f-2c65-4445-a5f8-8bf99aa0b74f.png)

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

teach_resist_date는 date 형식이기 때문에 to_char 대신 3개의 substr을 사용하여 YYYY년MM월DD일을 표현해야 합니다.

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

</div>

<br><br>

![image](https://user-images.githubusercontent.com/104752202/207217858-a8483f5f-3ac3-460f-ba23-052c5efca1c3.png)

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



</div>


```javascript
function checkValue() {
    if(document.data.resist_month.value) {
        alert("수강월이 입력되지 않았습니다!");
        data.resist_month.focus();
        return false;
    } else if(document.data.c_name.value=="none") {
        alert("회원명을 선택되지 않았습니다!");
        data.c_name.focus();
        return false;
    } else if(document.data.class_area.value) {
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
