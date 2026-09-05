<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đăng nhập</title>
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
        .login-card { 
            width: 100%; 
            max-width: 400px; 
            padding: 30px; 
            border-radius: 10px; 
            background: #fff; 
            box-shadow: 0 4px 15px rgba(0,0,0,0.1); 
        }
    </style>
</head>
<body>

<div class="login-card">
    <h3 class="text-center mb-4 text-primary fw-bold">ĐĂNG NHẬP</h3>

    <c:if test="${not empty alert}">
        <div class="alert alert-danger py-2 text-center" role="alert">
            ${alert}
        </div>
    </c:if>

    <form action="${pageContext.request.contextPath}/login" method="post" class="needs-validation" novalidate>
        <div class="mb-3">
            <label class="form-label fw-semibold">Tài khoản:</label>
            <input type="text" name="username" class="form-control" required placeholder="Nhập tài khoản">
            <div class="invalid-feedback">Vui lòng nhập tên tài khoản.</div>
        </div>
        
        <div class="mb-3">
            <label class="form-label fw-semibold">Mật khẩu:</label>
            <input type="password" name="password" class="form-control" required placeholder="Nhập mật khẩu">
            <div class="invalid-feedback">Vui lòng nhập mật khẩu.</div>
        </div>
        
        <div class="mb-3 form-check d-flex justify-content-between align-items-center">
            <div>
                <input type="checkbox" name="remember" class="form-check-input" id="remember">
                <label class="form-check-label" for="remember">Ghi nhớ đăng nhập</label>
            </div>
            <a href="${pageContext.request.contextPath}/forgot-password" class="text-decoration-none small">Quên mật khẩu?</a>
        </div>

        <button type="submit" class="btn btn-primary w-100 py-2">Đăng nhập</button>
    </form>

    <div class="text-center mt-3 small">
        <span>Chưa có tài khoản? </span>
        <a href="${pageContext.request.contextPath}/register" class="text-decoration-none fw-bold">Đăng ký ngay</a>
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