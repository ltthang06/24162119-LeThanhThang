<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quên mật khẩu</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light d-flex align-items-center justify-content-center" style="min-height: 100vh;">
    <div class="card p-4 shadow-sm" style="width: 400px;">
        <h4 class="text-center mb-3">QUÊN MẬT KHẨU</h4>
        <p class="text-muted text-center small">Nhập email để nhận mã OTP đặt lại mật khẩu</p>
        
        <form action="${pageContext.request.contextPath}/forgot-password" method="post">
            <div class="mb-3">
                <label class="form-label">Email đăng ký:</label>
                <input type="email" name="email" class="form-control" required placeholder="nhapemail@gmail.com">
            </div>
            <button type="submit" class="btn btn-primary w-100">Gửi mã OTP</button>
        </form>
    </div>
</body>
</html>