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
        <h5 class="fw-bold text-primary mb-3">Servlet Multipart (Dùng file Constant.DIR)</h5>

        <c:if test="${not empty message}">
            <div class="alert alert-danger py-2 small mb-3" role="alert">
                ${message}
            </div>
        </c:if>

        <form method="post" action="<c:url value='/multiPartServlet'/>" enctype="multipart/form-data" class="needs-validation" novalidate>
            <div class="mb-3">
                <label class="form-label fw-semibold">Chọn file upload (*):</label>
                <input type="file" name="multiPartServlet" class="form-control" required />
                <div class="invalid-feedback">Vui lòng chọn 1 file trước khi bấm Upload.</div>
            </div>
            <button type="submit" class="btn btn-primary btn-sm px-3 fw-bold">Upload File</button>
        </form>
    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
(function () {
  'use strict'
  var forms = document.querySelectorAll('.needs-validation')
  Array.prototype.slice.call(forms).forEach(function (form) {
    form.addEventListener('submit', function (event) {
      if (!form.checkValidity()) {
        event.preventDefault()
        event.stopPropagation()
      }
      form.classList.add('was-validated')
    }, false)
  })
})()
</script>
</body>
</html>