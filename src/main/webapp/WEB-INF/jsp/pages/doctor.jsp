<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>

<head>
    <title>Doctor</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.8.1/flowbite.min.css" rel="stylesheet"/>
    <script src="https://cdn.tailwindcss.com"></script>
    <jsp:include page="../components/general/template_styles.jsp"/>

</head>

<body>

<div class="py-4">
    <jsp:include page="../components/dashboard/dashboard_navbar.jsp"/>

    <div class="client_section layout_padding">


        <div class="container mt-4 p-4">
            <div class="row">
                <div class="col-md-6">
                    <h2 class="font-bold text-2xl mb-12">Dr. ${doctor.name} ${doctor.ape_pat} ${doctor.ape_mat}</h2>
                    <p>Nombre del doctor: ${doctor.name}</p>
                    <p>Apellido Paterno: ${doctor.ape_pat}</p>
                    <p>Apellido Materno: ${doctor.ape_mat}</p>
                    <p>Direcci&oacuten de la cl&iacutenica: ${doctor.id_doctor.clinic_address}</p>
                    <p>N&uacutemero de la cl&iacutenica: ${doctor.id_doctor.clinic_number}</p>
                    <p>Especialidad: ${doctor.id_doctor.specialties.name}</p>
                    <p>Costo de la consulta: ${doctor.id_doctor.cost}</p>
                </div>
                <div class="col-md-6">


                    <h2>Seleccionar una cita:</h2>

                    <c:choose>
                        <c:when test="${empty listSchedules}">
                            <p>No hay horarios disponibles.</p>
                        </c:when>
                        <c:otherwise>
                            <div class="row">
                                <c:forEach var="schedule" items="${listSchedules}" >

                                    <%--@elvariable id="appointment" type=""--%>
                                    <form:form class="col-md-4" action="/eduardo_lpsw-1/saveAppointmentFromClient" method="post" modelAttribute="appointment">
                                            <div class="card mb-4">
                                                    <div class="card-body">
                                                        <form:hidden path="id_doctor"  value="${doctor.id_user}" />
                                                        <form:hidden path="id_patient" value="${auth.userId}" />
                                                        <form:hidden path="appointment_date" value="${schedule.date_schedule}" />
                                                        <form:hidden path="hourStart" value="${schedule.hourStart}" />
                                                        <form:hidden path="hourEnd" value="${schedule.hourEnd}" />



                                                        <h5 class="card-title">Fecha: ${schedule.date_schedule}</h5>
                                                        <h6 class="card-subtitle mb-2 text-muted">Hora: ${schedule.hourStart} - ${schedule.hourEnd} </h6>
                                                        <button class="card-link hover:text-teal-300" type="submit"> Seleccionar cita</button>
                                                    </div>
                                            </div>
                                    </form:form>

                                </c:forEach>
                            </div>
                        </c:otherwise>
                    </c:choose>


                </div>
            </div>
        </div>

    </div>

    <jsp:include page="../components/general/footer.jsp"/>

</div>

<jsp:include page="../components/general/template_scripts.jsp"/>

<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.8.1/datepicker.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.8.1/flowbite.min.js"></script>

</body>
</html>
