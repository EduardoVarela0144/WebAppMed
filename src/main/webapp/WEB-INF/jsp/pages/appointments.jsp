<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE html>

<head>
    <meta charset="ISO-8859-1">
    <title>Pacientes</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <jsp:include page="../components/general/template_styles.jsp"/>

</head>

<body>

<div class="py-4">
    <jsp:include page="../components/dashboard/dashboard_navbar.jsp"/>

    <div class="client_section layout_padding">

        <div class="container mt-4 p-4">
            <div class="flex items-center justify-between">
                <c:if test="${not empty message}">

                    <div id="toast-success"
                         class="flex items-center w-full max-w-xs p-4 mb-4  rounded-lg shadow text-white bg-gray-800" role="alert">
                        <div class="inline-flex items-center justify-center flex-shrink-0 w-8 h-8  rounded-lg ">
                            <svg class="w-5 h-5 text-teal-300  rotate-45" aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
                                 fill="none" viewBox="0 0 18 20">
                                <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                      d="m9 17 8 2L9 1 1 19l8-2Zm0 0V9"></path>
                            </svg>
                        </div>
                        <div class="ml-3 text-sm font-normal">${message}</div>
                        <button type="button"
                                class="ml-auto -mx-1.5 -my-1.5 bg-white text-gray-400 hover:text-gray-900 rounded-lg focus:ring-2 focus:ring-gray-300 p-1.5 hover:bg-gray-100 inline-flex items-center justify-center h-8 w-8 dark:text-gray-500 dark:hover:text-white dark:bg-gray-800 dark:hover:bg-gray-700"
                                data-dismiss-target="#toast-success" aria-label="Close">
                            <span class="sr-only">Close</span>
                            <svg class="w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none"
                                 viewBox="0 0 14 14">
                                <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                      d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6"></path>
                            </svg>
                        </button>
                    </div>
                </c:if>
                <h1>Lista de Citas Médicas</h1>
            </div>

            <c:choose>
                <c:when test="${empty listAppointments}">
                    <p>No hay citas médicas registradas.</p>
                </c:when>
                <c:otherwise>
                    <div class="row  my-4">
                        <c:forEach var="appointment" items="${listAppointments}" >
                            <div class="col-md-6 ">
                                <div class="card mb-4">
                                    <div class="card-body">
                                        <h5 class="card-title">Cita ID: ${appointment.id_appointments}</h5>
                                        <p class="card-text">Doctor: ${appointment.id_doctor.name} ${appointment.id_doctor.ape_pat} ${appointment.id_doctor.ape_mat}</p>
                                        <p class="card-text">Paciente: ${appointment.id_patient.name} ${appointment.id_patient.ape_pat} ${appointment.id_patient.ape_mat}</p>
                                        <p class="card-text">Fecha de Cita: ${appointment.appointment_date}</p>
                                        <p class="card-text">Hora: ${appointment.hourStart} - ${appointment.hourEnd}</p>
                                        <div class=" flex items-end justify-end">
                                            <button class=" text-white rounded-md ">
                                                <a class="hover:text-white bg-red-500 py-2 px-2" href="/deleteAppointmentDoctor/${appointment.id_appointments}">Cancelar cita</a>
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

