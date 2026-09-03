<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thêm Sản phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4" style="max-width: 600px;">
    <h3 class="mb-3 text-primary">Thêm Sản phẩm mới</h3>
    <form action="<c:url value='/admin/product/add'/>" method="post">
        <div class="mb-3">
            <label class="form-label">Tên sản phẩm:</label>
            <input type="text" name="productName" class="form-control" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Giá bán:</label>
            <input type="number" step="0.01" name="price" class="form-control" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Danh mục:</label>
            <select name="categoryId" class="form-select" required>
                <c:forEach items="${categories}" var="c">
                    <option value="${c.id}">${c.name}</option>
                </c:forEach>
            </select>
        </div>
        <div class="mb-3">
            <label class="form-label">URL Hình ảnh:</label>
            <input type="text" name="images" class="form-control" placeholder="https://link-anh.com/image.jpg">
        </div>
        <div class="mb-3">
            <label class="form-label">Mô tả:</label>
            <textarea name="description" class="form-control" rows="3"></textarea>
        </div>
        <button type="submit" class="btn btn-success w-100">Lưu Sản phẩm</button>
        <a href="<c:url value='/admin/products'/>" class="btn btn-secondary w-100 mt-2">Hủy</a>
    </form>
</div>
</body>
</html>