<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>File Upload Demo</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="p-4 bg-light">
<div class="container" style="max-width: 600px;">
    
    <div class="card p-3 mb-3 shadow-sm">
        <h5>Servlet Multipart (Dùng file Constant.DIR)</h5>
        <form method="post" action="<c:url value='/multiPartServlet'/>" enctype="multipart/form-data">
            <div class="mb-2">
                <input type="file" name="multiPartServlet" class="form-control"/>
            </div>
            <button type="submit" class="btn btn-primary btn-sm">Upload File</button>
        </form>
    </div>

</div>
</body>
</html>