<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đăng ký tài khoản</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #f8f9fa; display: flex; align-items: center; justify-content: center; min-height: 100vh; margin: 0; }
        .register-card { width: 100%; max-width: 450px; padding: 30px; border-radius: 10px; background: #fff; box-shadow: 0 4px 15px rgba(0,0,0,0.1); }
    </style>
</head>
<body>

<div class="register-card">
    <h3 class="text-center mb-4 text-primary fw-bold">ĐĂNG KÝ TÀI KHOẢN</h3>

    <c:if test="${not empty alert}">
        <div class="alert alert-danger p-2 text-center small mb-3" role="alert">
            ${alert}
        </div>
    </c:if>

    <form action="<c:url value='/register'/>" method="post" class="needs-validation" novalidate>
        <div class="mb-3">
            <label class="form-label fw-semibold">Tên tài khoản (*):</label>
            <input type="text" name="username" class="form-control" required placeholder="Nhập tên đăng nhập">
            <div class="invalid-feedback">Vui lòng nhập tên tài khoản.</div>
        </div>

        <div class="mb-3">
            <label class="form-label fw-semibold">Mật khẩu (*):</label>
            <input type="password" name="password" class="form-control" required minlength="6" placeholder="Tối thiểu 6 ký tự">
            <div class="invalid-feedback">Mật khẩu tối thiểu phải từ 6 ký tự trở lên.</div>
        </div>

        <div class="mb-3">
            <label class="form-label fw-semibold">Họ và tên:</label>
            <input type="text" name="fullname" class="form-control" placeholder="Nhập họ tên">
        </div>

        <div class="mb-3">
            <label class="form-label fw-semibold">Email (*):</label>
            <input type="email" name="email" class="form-control" required placeholder="example@gmail.com">
            <div class="invalid-feedback">Vui lòng nhập đúng định dạng Email.</div>
        </div>

        <div class="mb-3">
            <label class="form-label fw-semibold">Số điện thoại:</label>
            <input type="text" name="phone" class="form-control" pattern="[0-9]{10}" placeholder="Gồm 10 chữ số">
            <div class="invalid-feedback">Số điện thoại phải bao gồm đúng 10 chữ số.</div>
        </div>

        <button type="submit" class="btn btn-primary w-100 py-2 mt-2 fw-bold">Đăng ký ngay</button>
    </form>

    <div class="text-center mt-3 small">
        <span>Đã có tài khoản? </span>
        <a href="<c:url value='/login'/>" class="text-decoration-none fw-bold">Đăng nhập</a>
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

</body>
</html>