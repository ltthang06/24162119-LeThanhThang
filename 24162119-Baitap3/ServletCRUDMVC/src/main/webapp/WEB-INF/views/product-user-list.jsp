<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tất cả sản phẩm</title>
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
        <span class="text-white me-3">Xin chào, <b>${sessionScope.account.fullName != null ? sessionScope.account.fullName : sessionScope.account.userName}</b></span>
        <a href="<c:url value='/logout'/>" class="btn btn-danger btn-sm">Đăng xuất</a>
    </div>
</div>

<div class="container">
    <h3 class="mb-4 text-primary fw-bold"><i class="bi bi-box-seam me-2"></i>Tất cả sản phẩm</h3>
    <div class="row">
        <c:forEach items="${productList}" var="p">
            <div class="col-md-4 mb-4">
                <div class="card h-100 shadow-sm border-0">
                    <c:if test="${not empty p.images}">
                        <img src="${p.images}" class="card-img-top" style="height: 220px; object-fit: cover;" alt="${p.productName}">
                    </c:if>
                    <c:if test="${empty p.images}">
                        <img src="https://via.placeholder.com/200x200?text=No+Image" class="card-img-top" style="height: 220px; object-fit: cover;">
                    </c:if>
                    <div class="card-body d-flex flex-column">
                        <h5 class="card-title text-truncate fw-bold">${p.productName}</h5>
                        <p class="card-text text-danger fw-bold fs-5 my-2">
                            <fmt:formatNumber value="${p.price}" pattern="#,###"/> VNĐ
                        </p>
                        <a href="<c:url value='/product/detail?id=${p.productId}'/>" class="btn btn-outline-primary btn-sm mt-auto w-100">
                            <i class="bi bi-eye me-1"></i>Xem chi tiết
                        </a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

    <nav class="mt-4">
      <ul class="pagination justify-content-center">
        <c:forEach begin="1" end="${maxPage}" var="i">
            <li class="page-item ${currentPage == i ? 'active' : ''}">
                <a class="page-link" href="<c:url value='/product?page=${i}'/>">${i}</a>
            </li>
        </c:forEach>
      </ul>
    </nav>
</div>

</body>
</html>