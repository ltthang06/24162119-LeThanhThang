<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đặt lại mật khẩu</title>
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
        .reset-card { 
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

<div class="reset-card">
    <h4 class="text-center mb-4 text-primary fw-bold">ĐẶT LẠI MẬT KHẨU</h4>

    <c:if test="${not empty alert}">
        <div class="alert alert-danger py-2 text-center small" role="alert">
            ${alert}
        </div>
    </c:if>

    <form action="${pageContext.request.contextPath}/reset-password" method="post" class="needs-validation" novalidate>
        <div class="mb-3">
            <label class="form-label fw-semibold">Mật khẩu mới:</label>
            <input type="password" name="password" class="form-control" required minlength="6" placeholder="Tối thiểu 6 ký tự">
            <div class="invalid-feedback">Mật khẩu mới phải có ít nhất 6 ký tự.</div>
        </div>

        <button type="submit" class="btn btn-primary w-100 py-2 mt-2">Cập nhật mật khẩu</button>
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