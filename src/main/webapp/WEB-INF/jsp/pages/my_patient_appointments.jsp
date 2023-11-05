<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>

<head>
    <meta charset="ISO-8859-1">
    <title>Mis citas</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <jsp:include page="../components/general/template_styles.jsp"/>

</head>

<body>

<div class="py-4">
    <jsp:include page="../components/dashboard/dashboard_navbar.jsp"/>

    <div class="client_section layout_padding">

        <div class="container mt-4 p-4">
            <div class="flex items-center justify-between">
                <h1>Mis citas Médicas</h1>
            </div>

            <c:choose>
                <c:when test="${empty listAppointments}">
                    <p>No hay citas médicas registradas.</p>
                </c:when>
                <c:otherwise>
                    <div class="row">
                        <c:forEach var="appointment" items="${listAppointments}" >
                            <div class="col-md-4">
                                <div class="card mb-4">
                                    <div class="card-body">
                                        <p class="card-text">Doctor: ${appointment.id_doctor.name} ${appointment.id_doctor.ape_pat} ${appointment.id_doctor.ape_mat}</p>
                                        <p class="card-text">Fecha de Cita: ${appointment.appointment_date}</p>
                                        <p class="card-text">Horario: ${appointment.hourStart} - ${appointment.hourEnd} </p>
                                        <div class=" flex items-end justify-end">
                                            <button class=" text-white rounded-md">
                                                <a class="hover:text-white bg-red-500 py-2 px-2" href="deleteAppointmentPatient/${appointment.id_appointments}">Cancelar cita</a>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>


    <jsp:include page="../components/general/footer.jsp"/>

</div>

<jsp:include page="../components/general/template_scripts.jsp"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.8.1/flowbite.min.js"></script>
</body>

