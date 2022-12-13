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

to_char
