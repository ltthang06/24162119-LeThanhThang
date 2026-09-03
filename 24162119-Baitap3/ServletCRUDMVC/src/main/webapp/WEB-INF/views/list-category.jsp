<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quản lý danh mục</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <style>
        body { background-color: #f8f9fa; }
        .top-header { background-color: #007bff; color: white; height: 50px; }
        .sidebar { background-color: #007bff; min-height: calc(100vh - 50px); color: white; }
        .sidebar-user { text-align: center; padding: 20px 10px; }
        .sidebar-avatar { width: 80px; height: 80px; border-radius: 50%; object-fit: cover; border: 3px solid #fff; }
        .sidebar-menu a { color: white; text-decoration: none; padding: 12px 20px; display: block; font-weight: 500; }
        .sidebar-menu a:hover, .sidebar-menu a.active { background-color: #0056b3; }
        .sidebar-sub-menu a { padding-left: 35px; font-size: 0.9rem; background-color: #0069d9; }
        .sidebar-sub-menu a:hover { background-color: #0056b3; }
    </style>
</head>
<body>

<div class="top-header d-flex justify-content-between align-items-center px-4">
    <h4 class="m-0 fw-bold">Dashboard</h4>
    <div>
        <span>Xin chào <b>${sessionScope.account.fullName != null ? sessionScope.account.fullName : sessionScope.account.userName}</b></span>
        <a href="<c:url value='/logout'/>" class="btn btn-danger btn-sm ms-3">Đăng xuất</a>
    </div>
</div>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-2 p-0 sidebar">
            <div class="sidebar-user">
                <img src="https://via.placeholder.com/80" class="sidebar-avatar mb-2" alt="Avatar">
                <h6>Bạn là Admin</h6>
            </div>
            <div class="sidebar-menu">
                <a href="<c:url value='/admin/category/list'/>" class="active"><i class="bi bi-speedometer2 me-2"></i>Dashboard</a>
                <a href="<c:url value='/admin/category/list'/>"><i class="bi bi-folder me-2"></i>Quản lý Danh mục</a>
                <div class="sidebar-sub-menu">
                    <a href="<c:url value='/admin/category/add'/>">— Thêm danh mục mới</a>
                    <a href="<c:url value='/admin/category/list'/>" class="fw-bold">— Danh sách danh mục</a>
                </div>
                <a href="<c:url value='/admin/products'/>"><i class="bi bi-box-seam me-2"></i>Quản lý Sản phẩm</a>
                <div class="sidebar-sub-menu">
                    <a href="<c:url value='/admin/product/add'/>">— Thêm sản phẩm mới</a>
                    <a href="<c:url value='/admin/products'/>">— Danh sách sản phẩm</a>
                </div>
            </div>
        </div>

        <div class="col-md-10 p-4">
            <h2 class="text-danger m-0">Quản lý danh mục</h2>
            <p class="text-muted">Nơi bạn có thể quản lý danh mục của mình</p>
            
            <div class="card shadow-sm mt-3">
                <div class="card-header bg-light d-flex justify-content-between align-items-center">
                    <h6 class="m-0 fw-bold">Danh sách danh mục</h6>
                    <c:if test="${sessionScope.account.roleid == 1}">
                        <a href="<c:url value='/admin/category/add'/>" class="btn btn-primary btn-sm">+ Thêm danh mục mới</a>
                    </c:if>
                </div>
                <div class="card-body p-0">
                    <table class="table table-bordered table-striped align-middle m-0">
                        <thead class="table-light">
                            <tr>
                                <th style="width: 70px;" class="text-center">STT</th>
                                <th style="width: 150px;" class="text-center">Hình ảnh</th>
                                <th>Tên danh mục</th>
                                <c:if test="${sessionScope.account.roleid == 1}">
                                    <th style="width: 150px;" class="text-center">Hành động</th>
                                </c:if>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${cateList}" var="cate" varStatus="STT">
                                <tr>
                                    <td class="text-center">${STT.index + 1}</td>
                                    <c:url value="/image?fname=${cate.icon}" var="imgUrl"></c:url>
                                    <td class="text-center">
                                        <img height="70" width="90" src="${imgUrl}" class="rounded border" style="object-fit: cover;" />
                                    </td>
                                    <td>${cate.name}</td>
                                    <c:if test="${sessionScope.account.roleid == 1}">
                                        <td class="text-center">
                                            <a href="<c:url value='/admin/category/edit?id=${cate.id}'/>" class="text-decoration-none me-2">Sửa</a> | 
                                            <a href="<c:url value='/admin/category/delete?id=${cate.id}'/>" class="text-danger text-decoration-none ms-2" onclick="return confirm('Bạn có muốn xóa?');">Xóa</a>
                                        </td>
                                    </c:if>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>