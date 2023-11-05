<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE html>

<head>
    <title>Pacientes</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <jsp:include page="../../../components/general/template_styles.jsp"/>

</head>

<body>

<div class="py-4">
    <jsp:include page="../../../components/dashboard/dashboard_navbar.jsp"/>

    <div class="client_section layout_padding">

        <div class="container mt-4 p-4">
            <!-- Start block -->
            <jsp:include page="./show_schedules.jsp"/>
            <!-- End block -->

            <jsp:include page="./add_schedule.jsp"/>

            <!-- drawer component -->
            <jsp:include page="./edit_schedule.jsp"/>

            <!-- Delete Modal -->
            <jsp:include page="./delete_schedule.jsp"/>
        </div>
    </div>


    <jsp:include page="../../../components/general/footer.jsp"/>

</div>

<jsp:include page="../../../components/general/template_scripts.jsp"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.8.1/flowbite.min.js"></script>

</body>

