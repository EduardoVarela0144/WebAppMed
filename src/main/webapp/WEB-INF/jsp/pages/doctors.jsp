<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>

<head>
    <meta charset="ISO-8859-1">
    <title>Doctores</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <jsp:include page="../components/general/template_styles.jsp"/>

</head>

<body>

<div class="py-4">
    <jsp:include page="../components/dashboard/dashboard_navbar.jsp"/>

        <div class="client_section layout_padding">

        <div class="container mt-4 p-4">
            <div class="row">
                <c:forEach var="user" items="${listDoctors}">
                    <div class="col-lg-4 col-md-6 col-sm-12">
                        <jsp:include page="../components/doctors/doctors_cards.jsp">
                            <jsp:param name="id" value="${user.id_user}" />
                            <jsp:param name="name" value="${user.name}" />
                            <jsp:param name="ape_pat" value="${user.ape_pat}" />
                            <jsp:param name="ape_mat" value="${user.ape_mat}" />
                            <jsp:param name="email" value="${user.email}" />
                            <jsp:param name="phone" value="${user.id_doctor.clinic_number}" />
                            <jsp:param name="address" value="${user.id_doctor.clinic_address}" />
                            <jsp:param name="cost" value="${user.id_doctor.cost}" />
                            <jsp:param name="speciality" value="${user.id_doctor.specialties.name}" />
                        </jsp:include>
                        <br/>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>

    <jsp:include page="../components/general/footer.jsp"/>

</div>

<jsp:include page="../components/general/template_scripts.jsp"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.8.1/flowbite.min.js"></script>
</body>
