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
    <h3 class="text-center mb-4 text-primary">ĐĂNG KÝ TÀI KHOẢN</h3>

    <c:if test="${not empty alert}">
        <div class="alert alert-danger p-2 text-center" role="alert">
            ${alert}
        </div>
    </c:if>

    <form action="<c:url value='/register'/>" method="post">
        <div class="mb-3">
            <label class="form-label">Tên tài khoản (*):</label>
            <input type="text" name="username" class="form-control" required placeholder="Nhập tên đăng nhập">
        </div>

        <div class="mb-3">
            <label class="form-label">Mật khẩu (*):</label>
            <input type="password" name="password" class="form-control" required placeholder="Nhập mật khẩu">
        </div>

        <div class="mb-3">
            <label class="form-label">Họ và tên:</label>
            <input type="text" name="fullname" class="form-control" placeholder="Nhập họ tên">
        </div>

        <div class="mb-3">
            <label class="form-label">Email:</label>
            <input type="email" name="email" class="form-control" placeholder="example@gmail.com">
        </div>

        <div class="mb-3">
            <label class="form-label">Số điện thoại:</label>
            <input type="text" name="phone" class="form-control" placeholder="Nhập số điện thoại">
        </div>

        <button type="submit" class="btn btn-primary w-100 py-2 mt-2">Đăng ký ngay</button>
    </form>

    <div class="text-center mt-3">
        <span>Đã có tài khoản? </span>
        <a href="<c:url value='/login'/>" class="text-decoration-none">Đăng nhập</a>
    </div>
</div>

</body>
</html>