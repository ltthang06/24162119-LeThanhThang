<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Xác thực OTP</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light d-flex align-items-center justify-content-center" style="min-height: 100vh;">

<div class="card p-4 shadow-sm" style="width: 360px;">
    <h4 class="text-center mb-3 text-primary">XÁC THỰC OTP</h4>
    
    <c:if test="${not empty alert}">
        <div class="alert alert-danger p-2 text-center" role="alert">${alert}</div>
    </c:if>

    <p class="text-muted text-center small">Mã OTP đã được gửi về Email của bạn. Vui lòng nhập để kích hoạt tài khoản:</p>

    <form action="<c:url value='/verify-code'/>" method="post">
        <div class="mb-3">
            <input type="text" name="otp" class="form-control text-center" placeholder="Nhập mã 6 số OTP" required>
        </div>
        <button type="submit" class="btn btn-primary w-100">Kích hoạt tài khoản</button>
    </form>
</div>

</body>
</html>