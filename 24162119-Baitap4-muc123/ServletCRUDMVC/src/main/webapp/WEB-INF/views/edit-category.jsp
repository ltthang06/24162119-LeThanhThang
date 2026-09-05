<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<h2 class="text-warning m-0">CHỈNH SỬA DANH MỤC</h2>
<p class="text-muted">Cập nhật thông tin cho danh mục sản phẩm</p>

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

        <form action="${pageContext.request.contextPath}/admin/category/edit" method="post" enctype="multipart/form-data" class="needs-validation" novalidate>
            <input type="hidden" name="id" value="${category.id}">

            <div class="mb-3">
                <label class="form-label fw-bold">Tên danh mục (*):</label>
                <input type="text" class="form-control" name="name" value="${category.name}" required placeholder="Nhập tên danh mục...">
                <div class="invalid-feedback">Tên danh mục không được để trống.</div>
            </div>

            <div class="mb-3">
                <label class="form-label fw-bold">Ảnh hiện tại:</label>
                <div>
                    <c:choose>
                        <c:when test="${not empty category.icon}">
                            <img src="${pageContext.request.contextPath}/image?fname=${category.icon}" class="rounded border mb-2" style="width: 80px; height: 80px; object-fit: cover;" alt="Icon">
                        </c:when>
                        <c:otherwise>
                            <div class="text-muted fst-italic mb-2">Chưa có ảnh danh mục</div>
                        </c:otherwise>
                    </c:choose>
                </div>
                
                <label class="form-label fw-bold mt-2">Chọn ảnh mới (không bắt buộc):</label>
                <input type="file" class="form-control" name="icon" accept="image/*">
            </div>

            <div class="d-flex gap-2">
                <button type="submit" class="btn btn-primary fw-bold">Chỉnh sửa</button>
                <a href="${pageContext.request.contextPath}/admin/category/list" class="btn btn-secondary">Hủy bỏ</a>
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