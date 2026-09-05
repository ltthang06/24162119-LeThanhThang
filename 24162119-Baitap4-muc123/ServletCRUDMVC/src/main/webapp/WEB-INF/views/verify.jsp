<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Xác thực OTP</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light d-flex align-items-center justify-content-center" style="min-height: 100vh;">

<div class="card p-4 shadow-sm" style="width: 380px;">
    <h4 class="text-center mb-3 text-primary fw-bold">XÁC THỰC OTP</h4>
    
    <c:if test="${not empty alert}">
        <div class="alert alert-danger p-2 text-center small" role="alert">${alert}</div>
    </c:if>

    <p class="text-muted text-center small">Mã OTP đã được gửi về Email của bạn. Vui lòng nhập để xác thực:</p>

    <form action="<c:url value='/verify-code'/>" method="post" class="needs-validation" novalidate>
        <div class="mb-3">
            <input type="text" name="otp" class="form-control text-center" placeholder="Nhập mã 6 số OTP" required pattern="[0-9]{6}">
            <div class="invalid-feedback">Vui lòng nhập đúng mã OTP gồm 6 chữ số.</div>
        </div>
        <button type="submit" class="btn btn-primary w-100 py-2">Xác thực</button>
    </form>
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