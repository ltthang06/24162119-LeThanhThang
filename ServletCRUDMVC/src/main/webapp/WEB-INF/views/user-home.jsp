<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Trang chủ - Sản phẩm mới nhất</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
</head>
<body>

<div class="container my-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h3 class="text-primary fw-bold mb-0"><i class="bi bi-fire text-danger me-2"></i>10 Sản phẩm mới nhất</h3>
        <a href="<c:url value='/product'/>" class="btn btn-outline-primary btn-sm">
            Tất cả sản phẩm <i class="bi bi-arrow-right ms-1"></i>
        </a>
    </div>

    <div class="row">
        <c:forEach items="${top10Products}" var="p">
            <div class="col-md-3 mb-4">
                <div class="card h-100 shadow-sm border-0">
                    <c:choose>
                        <c:when test="${not empty p.images}">
                            <img src="${p.images.startsWith('http') ? p.images : pageContext.request.contextPath.concat('/uploads/').concat(p.images)}" 
                                 class="card-img-top" 
                                 style="height: 200px; object-fit: cover;" 
                                 alt="${p.productName}">
                        </c:when>
                        <c:otherwise>
                            <img src="https://via.placeholder.com/200x200?text=No+Image" 
                                 class="card-img-top" 
                                 style="height: 200px; object-fit: cover;" 
                                 alt="No Image">
                        </c:otherwise>
                    </c:choose>
                    
                    <div class="card-body d-flex flex-column">
                        <h6 class="card-title text-truncate fw-bold">${p.productName}</h6>
                        <p class="card-text text-danger fw-bold fs-5 my-2">
                            <fmt:formatNumber value="${p.price}" pattern="#,###"/> VNĐ
                        </p>
                        <p class="card-text text-muted small text-truncate mb-3">${p.description}</p>
                        <a href="<c:url value='/product/detail?id=${p.productId}'/>" class="btn btn-outline-primary btn-sm mt-auto w-100">
                            <i class="bi bi-eye me-1"></i>Xem chi tiết
                        </a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

</body>
</html>