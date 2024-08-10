<%@ page import="com.real_estate.model.User"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%
HttpSession sessionObjprop = request.getSession(false);
User userObjprop = (sessionObjprop != null) ? (User) sessionObjprop.getAttribute("user") : null;

if (userObjprop == null || !"admin".equals(userObjprop.getRole())) {
        response.sendRedirect(request.getContextPath() + "/property");
        return;
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Add Property</title>
<link rel="stylesheet" type="text/css"
        href="<%=request.getContextPath()%>/css/style.css">
<script
        src="https://cdn.tiny.cloud/1/73elflzg7e3qjz8vl4ro753xpuqk9r6a8p7b86zkf5qopvm5/tinymce/7/tinymce.min.js"
        referrerpolicy="origin"></script>
<script>
  tinymce.init({
    selector: 'textarea',
    plugins: 'anchor autolink charmap codesample emoticons image link lists media searchreplace table visualblocks wordcount checklist mediaembed casechange export formatpainter pageembed linkchecker a11ychecker tinymcespellchecker permanentpen powerpaste advtable advcode editimage advtemplate ai mentions tinycomments tableofcontents footnotes mergetags autocorrect typography inlinecss markdown',
    toolbar: 'undo redo | blocks fontfamily fontsize | bold italic underline strikethrough | link image media table mergetags | addcomment showcomments | spellcheckdialog a11ycheck typography | align lineheight | checklist numlist bullist indent outdent | emoticons charmap | removeformat',
    tinycomments_mode: 'embedded',
    tinycomments_author: 'Author name',
    mergetags_list: [
      { value: 'First.Name', title: 'First Name' },
      { value: 'Email', title: 'Email' },
    ],
    ai_request: (request, respondWith) => respondWith.string(() => Promise.reject("See docs to implement AI Assistant")),
  });
</script>
</head>
<body>
        <%@ include file="header/header.jsp"%>
        <h1 class="add-property-header">Add Property</h1>
        <div class="add-property-form-container">
                <form class="add-property-form"
                        action="${pageContext.request.contextPath}/property" method="post"
                        enctype="multipart/form-data">
                        Name: <input type="text" name="name" required><br>
                        Location: <input type="text" name="location" required><br>
                        Price: <input type="number" step="0.01" name="price" required><br>
                        Image: <input type="file" name="image" accept="image/*" required><br>
                        Description:<br>
                        <textarea name="description" id="editor"></textarea>
                        <br>
                        <button class="btn btn-primary" type="submit">Add Property</button>
                </form>
        </div>
        <%@ include file="footer/footer.jsp"%>
</body>
</html>
