<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quên mật khẩu</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { 
            background-color: #f8f9fa; 
            display: flex; 
            align-items: center; 
            justify-content: center; 
            min-height: 100vh; 
            margin: 0; 
        }
        .forgot-card { 
            width: 100%; 
            max-width: 420px; 
            padding: 30px; 
            border-radius: 10px; 
            background: #fff; 
            box-shadow: 0 4px 15px rgba(0,0,0,0.1); 
        }
    </style>
</head>
<body>

<div class="forgot-card">
    <h4 class="text-center mb-2 text-primary fw-bold">QUÊN MẬT KHẨU</h4>
    <p class="text-muted text-center small mb-3">Nhập email để nhận mã OTP đặt lại mật khẩu</p>

    <c:if test="${not empty alert}">
        <div class="alert alert-danger py-2 text-center small mb-3" role="alert">
            ${alert}
        </div>
    </c:if>

    <form action="${pageContext.request.contextPath}/forgot-password" method="post" class="needs-validation" novalidate>
        <div class="mb-3">
            <label class="form-label fw-semibold">Email đăng ký:</label>
            <input type="email" name="email" class="form-control" required placeholder="nhapemail@gmail.com">
            <div class="invalid-feedback">Vui lòng nhập đúng định dạng email.</div>
        </div>
        <button type="submit" class="btn btn-primary w-100 py-2">Gửi mã OTP</button>
    </form>

    <div class="text-center mt-3 small">
        <a href="${pageContext.request.contextPath}/login" class="text-decoration-none fw-bold">Quay lại đăng nhập</a>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
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