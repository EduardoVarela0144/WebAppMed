<%@ page contentType="text/html; charset=UTF-8" %>

<%
    String componente = request.getParameter("page");
%>
<!DOCTYPE html>

<head>
    <title>403</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.8.1/flowbite.min.css" rel="stylesheet"/>
    <script src="https://cdn.tailwindcss.com"></script>
    <jsp:include page="../components/general/template_styles.jsp"/>
    <link rel="icon" href="<%=request.getContextPath()%>/images/icon-5.png" type="image/x-icon">
</head>

<body>


<div class="  h-screen flex flex-col items-center justify-center px-6 bg-black">
    <img class="mb-8 ml-12" src="<%=request.getContextPath()%>/images/logo.png">
    <p class="text-center font-bold text-2xl text-white" >No estás autorizado para entrar a esta página con tu Rol actual</p>
</div>



<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.8.1/datepicker.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.8.1/flowbite.min.js"></script>

</body>

