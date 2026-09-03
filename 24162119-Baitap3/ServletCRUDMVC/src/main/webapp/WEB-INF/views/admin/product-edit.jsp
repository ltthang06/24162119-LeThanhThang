<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cập nhật Sản phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4" style="max-width: 600px;">
    <h3 class="mb-3 text-warning">Chỉnh sửa Sản phẩm</h3>
    <form action="<c:url value='/admin/product/edit'/>" method="post">
        <input type="hidden" name="productId" value="${product.productId}">
        
        <div class="mb-3">
            <label class="form-label">Tên sản phẩm:</label>
            <input type="text" name="productName" value="${product.productName}" class="form-control" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Giá bán:</label>
            <input type="number" step="any" name="price" 
                   value="<fmt:formatNumber value='${product.price}' groupingUsed='false'/>" 
                   class="form-control" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Danh mục:</label>
            <select name="categoryId" class="form-select" required>
                <c:forEach items="${categories}" var="c">
                    <option value="${c.id}" ${c.id == product.category.id ? 'selected' : ''}>
                        ${c.name}
                    </option>
                </c:forEach>
            </select>
        </div>
        <div class="mb-3">
            <label class="form-label">URL Hình ảnh:</label>
            <input type="text" name="images" value="${product.images}" class="form-control">
        </div>
        <div class="mb-3">
            <label class="form-label">Mô tả:</label>
            <textarea name="description" class="form-control" rows="3">${product.description}</textarea>
        </div>
        <button type="submit" class="btn btn-warning w-100">Cập nhật</button>
        <a href="<c:url value='/admin/products'/>" class="btn btn-secondary w-100 mt-2">Hủy</a>
    </form>
</div>
</body>
</html>S