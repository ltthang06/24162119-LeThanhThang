<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thông tin cá nhân</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-7">
            <div class="card shadow-sm border-0">
                <div class="card-header bg-primary text-white text-center py-3">
                    <h4 class="mb-0 fw-bold">CẬP NHẬT THÔNG TIN PROFILE</h4>
                </div>
                <div class="card-body p-4">

                    <c:if test="${not empty message}">
                        <div class="alert alert-success alert-dismissible fade show" role="alert">
                            ${message}
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    </c:if>
                    <c:if test="${not empty error}">
                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                            ${error}
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    </c:if>

                    <!-- Thêm class needs-validation và novalidate -->
                    <form action="${pageContext.request.contextPath}/user/profile" 
                          method="post" enctype="multipart/form-data" class="needs-validation" novalidate>
                          
                        <div class="text-center mb-4">
                            <c:choose>
                                <c:when test="${not empty user.avatar}">
                                    <c:choose>
                                        <c:when test="${user.avatar.startsWith('http')}">
                                            <c:set var="imgSrc" value="${user.avatar}" />
                                        </c:when>
                                        <c:otherwise>
                                            <c:set var="imgSrc" value="${pageContext.request.contextPath}/image?fname=${user.avatar}" />
                                        </c:otherwise>
                                    </c:choose>
                                    
                                    <img src="${imgSrc}" 
                                         class="rounded-circle img-thumbnail shadow-sm" 
                                         style="width: 140px; height: 140px; object-fit: cover;"
                                         onerror="this.onerror=null; this.src='https://placehold.co/140';" />
                                </c:when>
                                <c:otherwise>
                                    <img src="https://placehold.co/140" 
                                         class="rounded-circle img-thumbnail shadow-sm" 
                                         style="width: 140px; height: 140px; object-fit: cover;" 
                                         alt="Avatar">
                                </c:otherwise>
                            </c:choose>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-bold">Tên đăng nhập:</label>
                            <input type="text" class="form-control bg-light" value="${user.userName}" readonly>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-bold">Email:</label>
                            <input type="email" class="form-control bg-light" value="${user.email}" readonly>
                        </div>

                        <div class="mb-3">
                            <label for="fullname" class="form-label fw-bold">Họ và tên (*):</label>
                            <input type="text" class="form-control" id="fullname" name="fullname" value="${user.fullName}" required placeholder="Nhập họ và tên">
                            <div class="invalid-feedback">Họ và tên không được để trống.</div>
                        </div>

                        <div class="mb-3">
                            <label for="phone" class="form-label fw-bold">Số điện thoại (*):</label>
                            <input type="text" class="form-control" id="phone" name="phone" value="${user.phone}" required pattern="[0-9]{10}" placeholder="Nhập 10 chữ số">
                            <div class="invalid-feedback">Số điện thoại phải chứa chính xác 10 chữ số.</div>
                        </div>

                        <div class="mb-4">
                            <label for="avatar" class="form-label fw-bold">Đổi ảnh đại diện:</label>
                            <input type="file" class="form-control" id="avatar" name="avatar" accept="image/*">
                        </div>

                        <div class="d-grid">
                            <button type="submit" class="btn btn-primary btn-block fw-bold py-2">Lưu thay đổi</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
// Kích hoạt hiển thị lỗi Bootstrap 5 Client-side
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
</body>
</html>