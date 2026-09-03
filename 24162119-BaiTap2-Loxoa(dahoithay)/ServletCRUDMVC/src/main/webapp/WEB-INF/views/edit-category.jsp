<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chỉnh sửa danh mục</title>
</head>
<body>

<c:url value="/admin/category/edit" var="edit"></c:url>
<form role="form" action="${edit}" method="post" enctype="multipart/form-data">
    <input name="id" value="${category.id}" hidden="">
    <div class="form-group">
        <label>Tên danh sách:</label> 
        <input type="text" class="form-control" value="${category.name}" name="name" />
    </div>
    <div class="form-group">
        <c:url value="/image?fname=${category.icon}" var="imgUrl"></c:url>
        <img class="img-responsive" width="100px" src="${imgUrl}" alt="">
        <br>
        <label>Ảnh đại diện</label> 
        <input type="file" name="icon" value="${category.icon}" />
    </div>
    <button type="submit" class="btn btn-default">Chỉnh sửa</button>
    <button type="reset" class="btn btn-primary">Khôi phục</button>
</form>

</body>
</html>