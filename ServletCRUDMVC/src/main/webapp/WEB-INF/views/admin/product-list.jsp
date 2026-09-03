<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<div class="d-flex justify-content-between align-items-center mb-2">
    <div>
        <h2 class="text-danger m-0">Quản lý sản phẩm</h2>
        <p class="text-muted m-0">Nơi bạn có thể quản lý các sản phẩm trong cửa hàng</p>
    </div>
    <a href="<c:url value='/admin/product/add'/>" class="btn btn-success">+ Thêm sản phẩm mới</a>
</div>

<div class="card shadow-sm mt-3">
    <div class="card-header bg-light">
        <h6 class="m-0 fw-bold">Danh sách sản phẩm</h6>
    </div>
    <div class="card-body p-0">
        <table class="table table-bordered table-striped align-middle m-0">
            <thead class="table-light">
                <tr>
                    <th style="width: 50px;" class="text-center">STT</th>
                    <th style="width: 100px;" class="text-center">Hình ảnh</th>
                    <th>Tên sản phẩm</th>
                    <th>Giá (VNĐ)</th>
                    <th>Danh mục</th>
                    <th>Mô tả</th>
                    <th style="width: 130px;" class="text-center">Thao tác</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${productList}" var="p" varStatus="loop">
                    <tr>
                        <td class="text-center">${loop.index + 1}</td>
                        <td class="text-center">
                            <c:if test="${not empty p.images}">
                                <img src="${p.images}" style="width: 70px; height: 70px; object-fit: cover;" class="rounded border"/>
                            </c:if>
                        </td>
                        <td><strong>${p.productName}</strong></td>
                        <td class="text-danger fw-bold"><fmt:formatNumber value="${p.price}" pattern="#,###"/> VNĐ</td>
                        <td><span class="badge bg-info text-dark">${p.category.name}</span></td>
                        <td>${p.description}</td>
                        <td class="text-center">
                            <a href="<c:url value='/admin/product/edit?id=${p.productId}'/>" class="btn btn-warning btn-sm">Sửa</a>
                            <a href="<c:url value='/admin/product/delete?id=${p.productId}'/>" class="btn btn-danger btn-sm" onclick="return confirm('Bạn có chắc chắn muốn xóa?')">Xóa</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>