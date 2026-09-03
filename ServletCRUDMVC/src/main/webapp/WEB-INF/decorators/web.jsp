<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><sitemesh:write property="title"/></title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <sitemesh:write property="head"/>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary mb-4 shadow-sm">
        <div class="container">
            <a class="navbar-brand fw-bold" href="${pageContext.request.contextPath}/home">
                <i class="bi bi-shop me-2"></i>TRANG CHỦ
            </a>
            
            <div class="navbar-nav ms-auto d-flex align-items-center">
                <c:if test="${not empty sessionScope.account}">
                    <!-- Tên User (Chỉ hiển thị chữ, không gắn link) -->
                    <span class="text-white fw-semibold me-2">
                        Xin chào, ${sessionScope.account.fullName != null ? sessionScope.account.fullName : sessionScope.account.userName}
                    </span>
                    
                    <a href="${pageContext.request.contextPath}/user/profile" class="me-3" title="Chỉnh sửa Profile">
                        <c:choose>
                            <c:when test="${not empty sessionScope.account.avatar}">
                                <c:choose>
                                    <c:when test="${sessionScope.account.avatar.startsWith('http')}">
                                        <c:set var="avatarUrl" value="${sessionScope.account.avatar}" />
                                    </c:when>
                                    <c:otherwise>
                                        <c:url value="/uploads/${sessionScope.account.avatar}" var="avatarUrl" />
                                    </c:otherwise>
                                </c:choose>
                                <img src="${avatarUrl}" 
                                     class="rounded-circle border border-2 border-white shadow-sm" 
                                     style="width: 38px; height: 38px; object-fit: cover;" 
                                     alt="Avatar"
                                     onerror="this.onerror=null; this.src='https://via.placeholder.com/150';">
                            </c:when>
                            <c:otherwise>
                                <img src="https://via.placeholder.com/150" 
                                     class="rounded-circle border border-2 border-white shadow-sm" 
                                     style="width: 38px; height: 38px; object-fit: cover;" 
                                     alt="No Avatar">
                            </c:otherwise>
                        </c:choose>
                    </a>

                    <a class="btn btn-outline-light btn-sm" href="${pageContext.request.contextPath}/logout">Đăng xuất</a>
                </c:if>

                <c:if test="${empty sessionScope.account}">
                    <a class="btn btn-outline-light btn-sm me-2" href="${pageContext.request.contextPath}/login">Đăng nhập</a>
                    <a class="btn btn-warning btn-sm" href="${pageContext.request.contextPath}/register">Đăng ký</a>
                </c:if>
            </div>
        </div>
    </nav>

    <div class="container">
        <sitemesh:write property="body"/>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>