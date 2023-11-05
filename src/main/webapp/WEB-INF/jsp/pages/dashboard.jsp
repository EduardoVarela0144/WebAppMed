<%@ page contentType="text/html; charset=UTF-8" %>

<%
    String componente = request.getParameter("page");
%>
<!DOCTYPE html>

<head>
    <title>Dashboard</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.8.1/flowbite.min.css" rel="stylesheet"/>
    <script src="https://cdn.tailwindcss.com"></script>
    <jsp:include page="../components/general/template_styles.jsp"/>
    <link rel="icon" href="<%=request.getContextPath()%>/images/icon-5.png" type="image/x-icon">
</head>

<body>

<div class="hidden md:block">
    <jsp:include page="../components/dashboard/dashboard_navbar.jsp"/>

    <jsp:include page="../components/dashboard/dashboard_aside.jsp"/>


    <div class="p-4 sm:ml-64">
        <div class="p-4  mt-14">

            <% if ("doctors".equals(componente)) { %>
            <jsp:include page="../components/dashboard/doctors/main.jsp"/>
            <% } else if ("specialities".equals(componente)) { %>
            <jsp:include page="../components/dashboard/specialities/main.jsp"/>
            <% } else if ("patients".equals(componente)) { %>
            <jsp:include page="../components/dashboard/patients/main.jsp"/>
            <% } else if ("payments".equals(componente)) { %>
            <jsp:include page="../components/dashboard/payments/main.jsp"/>
            <% } else if ("appointments".equals(componente)) { %>
            <jsp:include page="../components/dashboard/appointments/main.jsp"/>
            <% } else if ("schedules".equals(componente)) { %>
            <jsp:include page="../components/dashboard/schedules/main.jsp"/>
            <% } else if ("users".equals(componente)) { %>
            <jsp:include page="../components/dashboard/users/main.jsp"/>
            <% } else if ("products".equals(componente)) { %>
            <jsp:include page="../components/dashboard/medicines/main.jsp"/>
            <% } else { %>
            <jsp:include page="../components/dashboard/dashboard_welcome.jsp"/>
            <% } %>

        </div>

    </div>

</div>

<div class="md:hidden block  h-screen flex flex-col items-center justify-center px-6 bg-black">
    <img class="mb-8 ml-12" src="<%=request.getContextPath()%>/images/logo.png">
    <p class="text-center font-bold text-2xl text-white" >Para poder utilizar el dashboard de Nurgo debes de acceder desde una computadora</p>
</div>



<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.8.1/datepicker.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.8.1/flowbite.min.js"></script>

</body>

