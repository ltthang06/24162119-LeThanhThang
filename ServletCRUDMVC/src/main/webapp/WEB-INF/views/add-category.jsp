<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<h2 class="text-danger m-0">Thêm danh mục mới</h2>
<p class="text-muted">Nhập thông tin để tạo danh mục sản phẩm mới</p>

<div class="card shadow-sm mt-3" style="max-width: 600px;">
    <div class="card-header bg-light">
        <h6 class="m-0 fw-bold">Thông tin danh mục</h6>
    </div>
    <div class="card-body">
        <form role="form" action="add" method="post" enctype="multipart/form-data">
            <div class="mb-3">
                <label class="form-label">Tên danh mục:</label> 
                <input class="form-control" placeholder="Nhập tên danh mục..." name="name" required />
            </div>
            <div class="mb-3">
                <label class="form-label">Ảnh đại diện:</label> 
                <input type="file" class="form-control" name="icon" required />
            </div>
            <div class="d-flex gap-2">
                <button type="submit" class="btn btn-primary">Thêm danh mục</button>
                <a href="<c:url value='/admin/category/list'/>" class="btn btn-secondary">Hủy</a>
            </div>
        </form>
    </div>
</div>