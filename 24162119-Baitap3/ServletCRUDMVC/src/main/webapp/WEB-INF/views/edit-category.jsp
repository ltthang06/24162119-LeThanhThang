<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chỉnh sửa danh mục</title>
    <style>
        body { font-family: Arial, sans-serif; display:flex; justify-content:center; align-items:center; height:100vh; margin:0; background:#f4f6f9; }
        .box { width: 340px; padding: 25px; background: #fff; border-radius: 8px; box-shadow: 0 4px 10px rgba(0,0,0,0.1); }
        .form-group { margin-bottom: 15px; }
        .form-group label { display: block; margin-bottom: 5px; font-weight: bold; }
        .form-group input[type="text"], .form-group input[type="file"] { width: 100%; padding: 8px; box-sizing: border-box; border:1px solid #ccc; border-radius:4px; }
        .img-preview { width: 80px; height: 80px; object-fit: cover; border-radius: 4px; border: 1px solid #ddd; margin-bottom: 10px; display: block; }
        .no-image { font-size: 13px; color: #888; font-style: italic; margin-bottom: 10px; }
        .btn-group { display: flex; gap: 10px; }
        .btn { flex: 1; padding: 10px; color: white; border: none; border-radius: 4px; cursor: pointer; font-size: 14px; text-align: center; text-decoration: none; }
        .btn-submit { background: #007bff; }
        .btn-submit:hover { background: #0056b3; }
        .btn-cancel { background: #6c757d; }
        .btn-cancel:hover { background: #5a6268; }
    </style>
</head>
<body>
    <div class="box">
        <h2 style="text-align: center; margin-top: 0;">CHỈNH SỬA DANH MỤC</h2>
        
        <form action="${pageContext.request.contextPath}/admin/category/edit" method="post" enctype="multipart/form-data">
            <input type="hidden" name="id" value="${category.id}">

            <div class="form-group">
                <label>Tên danh mục:</label>
                <input type="text" name="name" value="${category.name}" required>
            </div>

            <div class="form-group">
                <label>Ảnh hiện tại:</label>
                <c:choose>
                    <c:when test="${not empty category.icon}">
                        <img src="${pageContext.request.contextPath}/image?fname=${category.icon}" class="img-preview" alt="Icon">
                    </c:when>
                    <c:otherwise>
                        <div class="no-image">Chưa có ảnh danh mục</div>
                    </c:otherwise>
                </c:choose>
                
                <label>Chọn ảnh mới:</label>
                <input type="file" name="icon">
            </div>

            <div class="btn-group">
                <button type="submit" class="btn btn-submit">Chỉnh sửa</button>
                <a href="${pageContext.request.contextPath}/admin/category/list" class="btn btn-cancel">Hủy bỏ</a>
            </div>
        </form>
    </div>
</body>
</html>