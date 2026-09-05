<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><sitemesh:write property="title"/></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <style>
        body { background-color: #f8f9fa; }
        .sidebar { background-color: #007bff; min-height: 100vh; color: white; }
        .sidebar-user { text-align: center; padding: 20px 10px; }
        .sidebar-avatar { width: 80px; height: 80px; border-radius: 50%; object-fit: cover; border: 3px solid #fff; transition: transform 0.2s; }
        .sidebar-avatar:hover { transform: scale(1.05); }
        .sidebar-menu a { color: white; text-decoration: none; padding: 12px 20px; display: block; font-weight: 500; }
        .sidebar-menu a:hover, .sidebar-menu a.active { background-color: #0056b3; }
        .sidebar-sub-menu a { padding-left: 35px; font-size: 0.9rem; background-color: #0069d9; }
        .sidebar-sub-menu a:hover { background-color: #0056b3; }
    </style>
    <sitemesh:write property="head"/>
</head>
<body>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-2 p-0 sidebar">
            <div class="sidebar-user">
                <a href="<c:url value='/user/profile'/>" title="Chỉnh sửa Profile Admin">
                    <c:choose>
                        <c:when test="${not empty sessionScope.account.avatar}">
                            <!-- Đã sửa thành /image?fname= để gọi Servlet đọc từ D:\upload\category -->
                            <c:url value="/image?fname=${sessionScope.account.avatar}" var="adminAvatarUrl" />
                            <img src="${adminAvatarUrl}" 
                                 class="sidebar-avatar mb-2" 
                                 alt="Avatar"
                                 onerror="this.onerror=null; this.src='https://placehold.co/80';">
                        </c:when>
                        <c:otherwise>
                            <img src="https://placehold.co/80" class="sidebar-avatar mb-2" alt="No Avatar">
                        </c:otherwise>
                    </c:choose>
                </a>
                <h6>${sessionScope.account.fullName != null ? sessionScope.account.fullName : sessionScope.account.userName}</h6>
                <small class="text-white-50">(Admin)</small>
            </div>
            
            <div class="sidebar-menu">
                <a href="<c:url value='/admin/category/list'/>"><i class="bi bi-speedometer2 me-2"></i>Dashboard</a>
                <a href="<c:url value='/admin/category/list'/>"><i class="bi bi-folder me-2"></i>Quản lý Danh mục</a>
                <div class="sidebar-sub-menu">
                    <a href="<c:url value='/admin/category/add'/>">— Thêm danh mục mới</a>
                    <a href="<c:url value='/admin/category/list'/>">— Danh sách danh mục</a>
                </div>
                <a href="<c:url value='/admin/products'/>"><i class="bi bi-box-seam me-2"></i>Quản lý Sản phẩm</a>
                <div class="sidebar-sub-menu">
                    <a href="<c:url value='/admin/product/add'/>">— Thêm sản phẩm mới</a>
                    <a href="<c:url value='/admin/products'/>">— Danh sách sản phẩm</a>
                </div>
            </div>
        </div>

        <div class="col-md-10 p-4">
            <div class="d-flex justify-content-end align-items-center pb-2 mb-3 border-bottom">
                <span class="me-3">Xin chào, <b>${sessionScope.account.fullName != null ? sessionScope.account.fullName : sessionScope.account.userName}</b></span>
                <a href="<c:url value='/logout'/>" class="btn btn-outline-danger btn-sm">Đăng xuất</a>
            </div>
            <sitemesh:write property="body"/>
        </div>
    </div>
</div>

</body>
</html>