<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<div class="card shadow-sm mx-auto" style="max-width: 600px;">
    <div class="card-header bg-primary text-white">
        <h4 class="m-0">Thêm Sản phẩm mới</h4>
    </div>
    <div class="card-body">
        <form action="<c:url value='/admin/product/add'/>" method="post">
            <div class="mb-3">
                <label class="form-label fw-bold">Tên sản phẩm:</label>
                <input type="text" name="productName" class="form-control" required>
            </div>
            <div class="mb-3">
                <label class="form-label fw-bold">Giá bán:</label>
                <input type="number" step="0.01" name="price" class="form-control" required>
            </div>
            <div class="mb-3">
                <label class="form-label fw-bold">Danh mục:</label>
                <select name="categoryId" class="form-select" required>
                    <c:forEach items="${categories}" var="c">
                        <option value="${c.id}">${c.name}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="mb-3">
                <label class="form-label fw-bold">URL Hình ảnh:</label>
                <input type="text" name="images" class="form-control" placeholder="https://link-anh.com/image.jpg">
            </div>
            <div class="mb-3">
                <label class="form-label fw-bold">Mô tả:</label>
                <textarea name="description" class="form-control" rows="3"></textarea>
            </div>
            <button type="submit" class="btn btn-success w-100">Lưu Sản phẩm</button>
            <a href="<c:url value='/admin/products'/>" class="btn btn-secondary w-100 mt-2">Hủy</a>
        </form>
    </div>
</div>