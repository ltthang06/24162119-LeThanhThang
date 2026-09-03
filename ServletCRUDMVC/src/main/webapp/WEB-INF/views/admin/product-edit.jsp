<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<div class="card shadow-sm mx-auto" style="max-width: 600px;">
    <div class="card-header bg-warning text-dark">
        <h4 class="m-0">Chỉnh sửa Sản phẩm</h4>
    </div>
    <div class="card-body">
        <form action="<c:url value='/admin/product/edit'/>" method="post">
            <input type="hidden" name="productId" value="${product.productId}">
            
            <div class="mb-3">
                <label class="form-label fw-bold">Tên sản phẩm:</label>
                <input type="text" name="productName" value="${product.productName}" class="form-control" required>
            </div>
            <div class="mb-3">
                <label class="form-label fw-bold">Giá bán:</label>
                <input type="number" step="any" name="price" 
                       value="<fmt:formatNumber value='${product.price}' groupingUsed='false'/>" 
                       class="form-control" required>
            </div>
            <div class="mb-3">
                <label class="form-label fw-bold">Danh mục:</label>
                <select name="categoryId" class="form-select" required>
                    <c:forEach items="${categories}" var="c">
                        <option value="${c.id}" ${c.id == product.category.id ? 'selected' : ''}>
                            ${c.name}
                        </option>
                    </c:forEach>
                </select>
            </div>
            <div class="mb-3">
                <label class="form-label fw-bold">URL Hình ảnh:</label>
                <input type="text" name="images" value="${product.images}" class="form-control">
            </div>
            <div class="mb-3">
                <label class="form-label fw-bold">Mô tả:</label>
                <textarea name="description" class="form-control" rows="3">${product.description}</textarea>
            </div>
            <button type="submit" class="btn btn-warning w-100 fw-bold">Cập nhật</button>
            <a href="<c:url value='/admin/products'/>" class="btn btn-secondary w-100 mt-2">Hủy</a>
        </form>
    </div>
</div>