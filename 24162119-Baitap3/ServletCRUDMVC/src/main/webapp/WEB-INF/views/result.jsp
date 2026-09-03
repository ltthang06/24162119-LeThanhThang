<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Kết quả Upload</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light p-5">
    <div class="container text-center">
        <div class="card p-4 shadow-sm" style="max-width: 500px; margin: auto;">
            <h4 class="text-success mb-3">Thông báo Upload</h4>
            <p class="fs-6">${message}</p>
            <div>
                <a href="javascript:history.back()" class="btn btn-secondary btn-sm">⬅ Quay lại</a>
            </div>
        </div>
    </div>
</body>
</html>