<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đăng nhập</title>
    <style>
        body { font-family: Arial, sans-serif; display:flex; justify-content:center; align-items:center; height:100vh; margin:0; background:#f4f6f9; }
        .login-box { width: 320px; padding: 25px; background: #fff; border-radius: 8px; box-shadow: 0 4px 10px rgba(0,0,0,0.1); }
        .form-group { margin-bottom: 15px; }
        .form-group label { display: block; margin-bottom: 5px; font-weight: bold; }
        .form-group input[type="text"], .form-group input[type="password"] { width: 100%; padding: 8px; box-sizing: border-box; border:1px solid #ccc; border-radius:4px; }
        .alert { color: red; margin-bottom: 10px; font-size: 14px; }
        .btn { width: 100%; padding: 10px; background: #007bff; color: white; border: none; border-radius: 4px; cursor: pointer; font-size: 16px; }
        .btn:hover { background: #0056b3; }
        .links-group { display: flex; justify-content: space-between; align-items: center; margin-top: 15px; font-size: 14px; }
        .forgot-link { text-align: right; margin-bottom: 15px; font-size: 14px; }
        .forgot-link a { color: #007bff; text-decoration: none; }
        .forgot-link a:hover { text-decoration: underline; }
    </style>
</head>
<body>
    <div class="login-box">
        <h2 style="text-align: center;">ĐĂNG NHẬP</h2>
        
        <% if (request.getAttribute("alert") != null) { %>
            <div class="alert"><%= request.getAttribute("alert") %></div>
        <% } %>

        <form action="${pageContext.request.contextPath}/login" method="post">
            <div class="form-group">
                <label>Tài khoản:</label>
                <input type="text" name="username" required>
            </div>
            <div class="form-group">
                <label>Mật khẩu:</label>
                <input type="password" name="password" required>
            </div>
            <div class="form-group">
                <input type="checkbox" name="remember" id="remember">
                <label for="remember" style="display:inline; font-weight:normal;">Ghi nhớ đăng nhập</label>
            </div>
            
            <div class="forgot-link">
                <a href="${pageContext.request.contextPath}/forgot-password">Quên mật khẩu?</a>
            </div>

            <button type="submit" class="btn">Đăng nhập</button>
        </form>

        <div style="text-align: center; margin-top: 15px; font-size: 14px;">
            Chưa có tài khoản? <a href="${pageContext.request.contextPath}/register">Đăng ký ngay</a>
        </div>
    </div>
</body>
</html>