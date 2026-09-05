<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<div class="card shadow-sm mx-auto mt-3" style="max-width: 600px;">
    <div class="card-header bg-warning text-dark">
        <h4 class="m-0 fw-bold">Chỉnh sửa Sản phẩm</h4>
    </div>
    <div class="card-body">

        <c:if test="${not empty error}">
            <div class="alert alert-danger py-2 small mb-3" role="alert">
                ${error}
            </div>
        </c:if>

        <form action="<c:url value='/admin/product/edit'/>" method="post" enctype="multipart/form-data" class="needs-validation" novalidate>
            <input type="hidden" name="productId" value="${product.productId != null ? product.productId : product.id}">
            
            <div class="mb-3">
                <label class="form-label fw-bold">Tên sản phẩm (*):</label>
                <input type="text" name="productName" value="${product.productName}" class="form-control" required>
                <div class="invalid-feedback">Tên sản phẩm không được để trống.</div>
            </div>

            <div class="mb-3">
                <label class="form-label fw-bold">Giá bán (VNĐ) (*):</label>
                <input type="number" step="any" min="1" name="price" 
                       value="<fmt:formatNumber value='${product.price}' groupingUsed='false'/>" 
                       class="form-control" required>
                <div class="invalid-feedback">Giá bán phải lớn hơn 0.</div>
            </div>

            <div class="mb-3">
                <label class="form-label fw-bold">Danh mục (*):</label>
                <select name="categoryId" class="form-select" required>
                    <c:forEach items="${categories}" var="c">
                        <option value="${c.id}" ${c.id == product.category.id ? 'selected' : ''}>
                            ${c.name}
                        </option>
                    </c:forEach>
                </select>
            </div>

            <div class="mb-3">
                <label class="form-label fw-bold">Ảnh hiện tại:</label>
                <div>
                    <c:choose>
                        <c:when test="${not empty product.images}">
                            <img src="${pageContext.request.contextPath}/image?fname=${product.images}" class="rounded border mb-2" style="width: 80px; height: 80px; object-fit: cover;" alt="Image">
                        </c:when>
                        <c:otherwise>
                            <div class="text-muted fst-italic mb-2">Chưa có ảnh</div>
                        </c:otherwise>
                    </c:choose>
                </div>
                
                <label class="form-label fw-bold mt-2">Chọn ảnh mới (không bắt buộc):</label>
                <input type="file" name="images" class="form-control" accept="image/*">
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