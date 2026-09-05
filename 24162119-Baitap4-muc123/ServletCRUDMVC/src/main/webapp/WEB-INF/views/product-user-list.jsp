<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tất cả sản phẩm</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
</head>
<body>

<div class="container my-4">
    <h3 class="mb-4 text-primary fw-bold">
        <i class="bi bi-box-seam me-2"></i>Tất cả sản phẩm
    </h3>

    <div class="row">
        <c:forEach items="${productList}" var="p">
            <div class="col-md-4 mb-4">
                <div class="card h-100 shadow-sm border-0">
                    <c:choose>
                        <c:when test="${not empty p.images}">
                            <c:choose>
                                <c:when test="${p.images.startsWith('http')}">
                                    <c:set var="userListImgUrl" value="${p.images}" />
                                </c:when>
                                <c:otherwise>
                                    <c:url value="/image" var="userListImgUrl">
                                        <c:param name="fname" value="${p.images}" />
                                    </c:url>
                                </c:otherwise>
                            </c:choose>
                            <img src="${userListImgUrl}" 
                                 class="card-img-top" 
                                 style="height: 220px; object-fit: cover;" 
                                 alt="${p.productName}"
                                 onerror="this.onerror=null; this.src='https://placehold.co/200x200?text=No+Image';">
                        </c:when>
                        <c:otherwise>
                            <img src="https://placehold.co/200x200?text=No+Image" 
                                 class="card-img-top" 
                                 style="height: 220px; object-fit: cover;" 
                                 alt="No Image">
                        </c:otherwise>
                    </c:choose>
                    
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

    <c:if test="${not empty maxPage && maxPage > 1}">
        <nav class="mt-4">
          <ul class="pagination justify-content-center">
            <c:forEach begin="1" end="${maxPage}" var="i">
                <li class="page-item ${currentPage == i ? 'active' : ''}">
                    <a class="page-link" href="<c:url value='/product?page=${i}'/>">${i}</a>
                </li>
            </c:forEach>
          </ul>
        </nav>
    </c:if>
</div>

</body>
</html>