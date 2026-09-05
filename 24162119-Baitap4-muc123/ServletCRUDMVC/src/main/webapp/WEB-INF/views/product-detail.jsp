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

<div class="container my-4">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h4 class="fw-bold text-primary m-0"><i class="bi bi-info-circle me-2"></i>Chi tiết sản phẩm</h4>
        <a href="<c:url value='/product'/>" class="btn btn-outline-primary btn-sm">
            <i class="bi bi-grid me-1"></i>Tất cả sản phẩm
        </a>
    </div>

    <div class="card shadow border-0 p-4">
        <div class="row">
            <div class="col-md-5">
                <c:choose>
                    <c:when test="${not empty product.images}">
                        <c:choose>
                            <c:when test="${product.images.startsWith('http')}">
                                <c:set var="detailImgUrl" value="${product.images}" />
                            </c:when>
                            <c:otherwise>
                                <c:url value="/image" var="detailImgUrl">
                                    <c:param name="fname" value="${product.images}" />
                                </c:url>
                            </c:otherwise>
                        </c:choose>
                        <img src="${detailImgUrl}" 
                             class="img-fluid rounded border w-100" 
                             style="max-height: 380px; object-fit: cover;" 
                             alt="${product.productName}"
                             onerror="this.onerror=null; this.src='https://placehold.co/380x380?text=No+Image';">
                    </c:when>
                    <c:otherwise>
                        <img src="https://placehold.co/380x380?text=No+Image" class="img-fluid rounded border w-100" alt="No Image">
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="col-md-7 d-flex flex-column">
                <h2 class="fw-bold text-dark">${product.productName}</h2>
                <h3 class="text-danger fw-bold my-3">
                    <fmt:formatNumber value="${product.price}" pattern="#,###"/> VNĐ
                </h3>
                <p class="fs-6"><strong>Danh mục:</strong> <span class="badge bg-info text-dark">${product.category.name}</span></p>
                <p class="fs-6 text-muted"><strong>Mô tả chi tiết:</strong> ${product.description}</p>
                <div class="mt-auto pt-3">
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