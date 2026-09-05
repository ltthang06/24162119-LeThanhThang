<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<h2 class="text-danger m-0">Thêm danh mục mới</h2>
<p class="text-muted">Nhập thông tin để tạo danh mục sản phẩm mới</p>

<div class="card shadow-sm mt-3" style="max-width: 600px;">
    <div class="card-header bg-light">
        <h6 class="m-0 fw-bold">Thông tin danh mục</h6>
    </div>
    <div class="card-body">

        <c:if test="${not empty alert}">
            <div class="alert alert-danger py-2 small mb-3" role="alert">
                ${alert}
            </div>
        </c:if>

        <form action="${pageContext.request.contextPath}/admin/category/add" method="post" enctype="multipart/form-data" class="needs-validation" novalidate>
            <div class="mb-3">
                <label class="form-label fw-bold">Tên danh mục (*):</label> 
                <input type="text" class="form-control" placeholder="Nhập tên danh mục..." name="name" value="${category.name}" required>
                <div class="invalid-feedback">Tên danh mục không được để trống.</div>
            </div>
            
            <div class="mb-3">
                <label class="form-label fw-bold">Ảnh đại diện (*):</label> 
                <input type="file" class="form-control" name="icon" accept="image/*" required>
                <div class="invalid-feedback">Vui lòng chọn ảnh đại diện cho danh mục.</div>
            </div>
            
            <div class="d-flex gap-2">
                <button type="submit" class="btn btn-primary fw-bold">Thêm danh mục</button>
                <a href="<c:url value='/admin/category/list'/>" class="btn btn-secondary">Hủy</a>
            </div>
        </form>
    </div>
</div>

<script>
(function () {
  'use strict'
  var forms = document.querySelectorAll('.needs-validation')
  Array.prototype.slice.call(forms).forEach(function (form) {
    form.addEventListener('submit', function (event) {
      if (!form.checkValidity()) {
        event.preventDefault()
        event.stopPropagation()
      }
      form.classList.add('was-validated')
    }, false)
  })
})()
</script>