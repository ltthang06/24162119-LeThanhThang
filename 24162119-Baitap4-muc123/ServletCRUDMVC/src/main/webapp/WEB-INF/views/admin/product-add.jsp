<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<div class="card shadow-sm mx-auto mt-3" style="max-width: 600px;">
    <div class="card-header bg-primary text-white">
        <h4 class="m-0 fw-bold">Thêm Sản phẩm mới</h4>
    </div>
    <div class="card-body">

        <c:if test="${not empty error}">
            <div class="alert alert-danger py-2 small mb-3" role="alert">
                ${error}
            </div>
        </c:if>

        <form action="<c:url value='/admin/product/add'/>" method="post" enctype="multipart/form-data" class="needs-validation" novalidate>
            <div class="mb-3">
                <label class="form-label fw-bold">Tên sản phẩm (*):</label>
                <input type="text" name="productName" value="${product.productName}" class="form-control" placeholder="Nhập tên sản phẩm..." required>
                <div class="invalid-feedback">Tên sản phẩm không được để trống.</div>
            </div>

            <div class="mb-3">
                <label class="form-label fw-bold">Giá bán (VNĐ) (*):</label>
                <input type="number" step="any" min="1" name="price" value="${product.price}" class="form-control" placeholder="Nhập giá bán..." required>
                <div class="invalid-feedback">Giá bán phải lớn hơn 0.</div>
            </div>

            <div class="mb-3">
                <label class="form-label fw-bold">Danh mục (*):</label>
                <select name="categoryId" class="form-select" required>
                    <option value="">-- Chọn danh mục --</option>
                    <c:forEach items="${categories}" var="c">
                        <option value="${c.id}" ${product.category.id == c.id ? 'selected' : ''}>${c.name}</option>
                    </c:forEach>
                </select>
                <div class="invalid-feedback">Vui lòng chọn danh mục cho sản phẩm.</div>
            </div>

            <div class="mb-3">
                <label class="form-label fw-bold">Ảnh đại diện (*):</label>
                <input type="file" name="images" class="form-control" accept="image/*" required>
                <div class="invalid-feedback">Vui lòng chọn file ảnh sản phẩm.</div>
            </div>

            <div class="mb-3">
                <label class="form-label fw-bold">Mô tả:</label>
                <textarea name="description" class="form-control" rows="3" placeholder="Nhập mô tả sản phẩm...">${product.description}</textarea>
            </div>

            <button type="submit" class="btn btn-success w-100 fw-bold">Lưu Sản phẩm</button>
            <a href="<c:url value='/admin/products'/>" class="btn btn-secondary w-100 mt-2">Hủy</a>
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