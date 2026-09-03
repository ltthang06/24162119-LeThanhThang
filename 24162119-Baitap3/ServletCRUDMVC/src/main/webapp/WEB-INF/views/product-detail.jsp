<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chi tiết sản phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
</head>
<body class="bg-light">

<div class="navbar navbar-dark bg-primary px-4 mb-4 shadow-sm">
    <a class="navbar-brand fw-bold" href="<c:url value='/home'/>">
        <i class="bi bi-shop me-2"></i>Cửa Hàng Online
    </a>
    <div class="d-flex align-items-center">
        <a href="<c:url value='/home'/>" class="btn btn-outline-light btn-sm me-3">Trang chủ</a>
        <a href="<c:url value='/product'/>" class="btn btn-outline-light btn-sm me-3">Tất cả sản phẩm</a>
    </div>
</div>

<div class="container mt-4">
    <div class="card shadow border-0 p-4">
        <div class="row">
            <div class="col-md-5">
                <c:if test="${not empty product.images}">
                    <img src="${product.images}" class="img-fluid rounded border w-100" style="max-height: 380px; object-fit: cover;">
                </c:if>
                <c:if test="${empty product.images}">
                    <img src="https://via.placeholder.com/380x380?text=No+Image" class="img-fluid rounded border w-100">
                </c:if>
            </div>
            <div class="col-md-7 d-flex flex-column">
                <h2 class="fw-bold text-dark">${product.productName}</h2>
                <h3 class="text-danger fw-bold my-3">
                    <fmt:formatNumber value="${product.price}" pattern="#,###"/> VNĐ
                </h3>
                <p class="fs-6"><strong>Danh mục:</strong> <span class="badge bg-info text-dark">${product.category.name}</span></p>
                <p class="fs-6 text-muted"><strong>Mô tả chi tiết:</strong> ${product.description}</p>
                <div class="mt-auto">
                    <a href="javascript:history.back()" class="btn btn-secondary me-2">
                        <i class="bi bi-arrow-left me-1"></i>Quay lại
                    </a>
                    <button class="btn btn-success"><i class="bi bi-cart-plus me-1"></i>Thêm vào giỏ hàng</button>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>