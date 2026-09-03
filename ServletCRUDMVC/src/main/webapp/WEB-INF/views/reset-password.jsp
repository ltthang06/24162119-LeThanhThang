<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đặt lại mật khẩu</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light d-flex align-items-center justify-content-center" style="min-height: 100vh;">
    <div class="card p-4 shadow-sm" style="width: 380px;">
        <h4 class="text-center mb-3">ĐẶT LẠI MẬT KHẨU</h4>
        
        <form action="${pageContext.request.contextPath}/reset-password" method="post">
            <div class="mb-3">
                <label class="form-label">Mật khẩu mới:</label>
                <input type="password" name="password" class="form-control" required placeholder="Nhập mật khẩu mới">
            </div>
            <button type="submit" class="btn btn-primary w-100">Cập nhật mật khẩu</button>
        </form>
    </div>
</body>
</html>