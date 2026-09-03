<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<div class="d-flex justify-content-between align-items-center mb-3">
    <div>
        <h2 class="text-danger m-0">Quản lý danh mục</h2>
        <p class="text-muted m-0">Nơi bạn có thể quản lý danh mục của mình</p>
    </div>
</div>

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