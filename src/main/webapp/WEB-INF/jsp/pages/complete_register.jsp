<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<%
    String type = request.getParameter("type");
%>
<head>
    <meta charset="ISO-8859-1">
    <title>Completar registro</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.8.1/flowbite.min.css" rel="stylesheet"/>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="icon" href="<%=request.getContextPath()%>/images/icon-5.png" type="image/x-icon">

</head>

<body>


<div class="h-screen w-full flex flex-col">
    <div class="h-full flex flex-col bg-gray-200 px-24 justify-center w-full">
        <jsp:include page="../components/register/register_steper.jsp"/>

        <% if ("Doctor".equals(type)) { %>
        <jsp:include page="../components/register/register_doctor.jsp"/>
        <% } else if ("Patient".equals(type)) { %>
        <jsp:include page="../components/register/register_patient.jsp"/>
        <% } %>

    </div>

</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.8.1/flowbite.min.js"></script>
</body>

