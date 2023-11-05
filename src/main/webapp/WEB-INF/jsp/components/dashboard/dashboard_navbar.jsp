<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String currentURL = request.getRequestURI(); %>


<nav class="fixed top-0 z-10 w-full bg-white border-b border-gray-200">
    <div class="max-w-screen-xl flex flex-wrap items-center justify-between mx-auto p-4">
        <a href="home" class="flex items-center">
            <img src="<%=request.getContextPath()%>/images/logo.png">

        </a>
        <div class="flex items-center md:order-2">
            <div class="hidden md:flex mr-2">
                <sec:authorize access="hasRole('ROLE_DOCTOR')">
                    <p class="font-bold ">Bienvenido, Dr. ${auth.fullName}</p>
                </sec:authorize>
                <sec:authorize access="hasRole('ROLE_ADMIN')">
                    <p class="font-bold ">Bienvenido, Admin. ${auth.fullName}</p>
                </sec:authorize>
                <sec:authorize access="hasRole('ROLE_PATIENT')">
                    <p class="font-bold ">Bienvenido, Paciente ${auth.fullName}</p>
                </sec:authorize>
            </div>
            <button type="button"
                    class="flex mr-3 text-sm bg-gray-800 rounded-full md:mr-0 focus:ring-4 focus:ring-gray-300 "
                    id="user-menu-button" aria-expanded="false" data-dropdown-toggle="user-dropdown"
                    data-dropdown-placement="bottom">
                <span class="sr-only">Open user menu</span>
                <div class="relative inline-flex items-center justify-center w-10 h-10 overflow-hidden bg-teal-300 rounded-full">

                    <span class="font-medium text-white ">${auth.fullName.substring(0, 1)}</span>
                </div>
            </button>
            <!-- Dropdown menu -->
            <div class="z-50 hidden my-4 text-base list-none bg-white divide-y divide-gray-100 rounded-lg shadow "
                 id="user-dropdown">
                <div class="px-4 py-3">
                    <span class="block text-sm text-gray-900 ">
                        <sec:authentication property="principal.username"/>
                    </span>
                    <span class="block text-sm  text-gray-500 truncate "> ${auth.fullName}
                    </span>
                </div>
                <ul class="py-2" aria-labelledby="user-menu-button">
                    <li>
                        <a href="logout"
                           class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 hover:text-red-500 ">Cerrar sesión</a>
                    </li>

                </ul>
            </div>
            <button data-collapse-toggle="navbar-user" type="button"
                    class="inline-flex items-center p-2 w-10 h-10 justify-center text-sm text-gray-500 rounded-lg md:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200"
                    aria-controls="navbar-user" aria-expanded="false">
                <span class="sr-only">Open main menu</span>
                <svg class="w-5 h-5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none"
                     viewBox="0 0 17 14">
                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                          d="M1 1h15M1 7h15M1 13h15"/>
                </svg>
            </button>
        </div>
        <div class="items-center justify-between hidden w-full md:flex md:w-auto md:order-1" id="navbar-user">
            <ul class="flex flex-col font-medium p-4 md:p-0 mt-4 border border-gray-100 rounded-lg bg-gray-50 md:flex-row md:space-x-8 md:mt-0 md:border-0 md:bg-white">
                    <li>
                        <a href="home"
                           class="block py-2 pl-3 pr-4 text-gray-900 rounded hover:bg-gray-100 md:hover:bg-transparent md:hover:text-gray-300 md:p-0">Inicio</a>
                    </li>
                    <li>
                        <a href="health"
                           class="block py-2 pl-3 pr-4 text-gray-900 rounded hover:bg-gray-100 md:hover:bg-transparent md:hover:text-gray-300 md:p-0">Salud</a>
                    </li>
                    <li>
                        <a href="news"
                           class="block py-2 pl-3 pr-4 text-gray-900 rounded hover:bg-gray-100 md:hover:bg-transparent md:hover:text-gray-300 md:p-0">Noticias</a>
                    </li>
                    <li>
                        <a href="clients"
                           class="block py-2 pl-3 pr-4 text-gray-900 rounded hover:bg-gray-100 md:hover:bg-transparent md:hover:text-gray-300 md:p-0">Clientes</a>
                    </li>

                    <sec:authorize access="hasRole('ROLE_PATIENT')">
                        <li>
                            <a href="doctors"
                               class="block py-2 pl-3 pr-4 <%= currentURL.endsWith("doctors.jsp") ? "text-teal-300" : "text-gray-900" %> rounded hover:bg-gray-100 md:hover:bg-transparent md:hover:text-gray-300 md:p-0">Doctores</a>
                        </li>
                    </sec:authorize>

                    <sec:authorize access="not hasRole('ROLE_ADMIN')">

                        <li>
                            <a href="medicines"
                               class="block py-2 pl-3 pr-4 <%= currentURL.endsWith("medicines.jsp") ? "text-teal-300" : "text-gray-900" %> rounded hover:bg-gray-100 md:hover:bg-transparent md:hover:text-gray-300 md:p-0">Medicinas</a>
                        </li>
                        <li>
                            <a href="user_cart"
                               class="block py-2 pl-3 pr-4 <%= currentURL.endsWith("cart.jsp") ? "text-teal-300" : "text-gray-900" %>  rounded hover:bg-gray-100 md:hover:bg-transparent md:hover:text-gray-300 md:p-0 ">Carrito</a>
                        </li>
                    </sec:authorize>

                    <sec:authorize access="hasRole('ROLE_ADMIN')">
                        <li>
                            <a href="dashboard"
                               class="block py-2 pl-3 pr-4 <%= currentURL.endsWith("dashboard.jsp") ? "text-teal-300" : "text-gray-900" %>  rounded hover:bg-gray-100 md:hover:bg-transparent md:hover:text-gray-300 md:p-0 ">Dashboard</a>
                        </li>
                    </sec:authorize>

                    <sec:authorize access="hasRole('ROLE_DOCTOR')">
                        <li>
                            <a href="appointments"
                               class="block py-2 pl-3 pr-4 <%= currentURL.endsWith("appointments.jsp") ? "text-teal-300" : "text-gray-900" %>  rounded hover:bg-gray-100 md:hover:bg-transparent md:hover:text-gray-300 md:p-0 ">Citas</a>
                        </li>
                        <li>
                            <a href="my_schedules_doctor"
                               class="block py-2 pl-3 pr-4 <%= currentURL.endsWith("main.jsp") ? "text-teal-300" : "text-gray-900" %>  rounded hover:bg-gray-100 md:hover:bg-transparent md:hover:text-gray-300 md:p-0 ">Mis horarios</a>
                        </li>
                    </sec:authorize>

                    <sec:authorize access="hasRole('ROLE_PATIENT')">
                        <li>
                            <a href="<%=request.getContextPath()%>/my_appointments"
                               class="block py-2 pl-3 pr-4 <%= currentURL.endsWith("my_patient_appointments.jsp") ? "text-teal-300" : "text-gray-900" %>  rounded hover:bg-gray-100 md:hover:bg-transparent md:hover:text-gray-300 md:p-0 ">Mis
                                citas</a>
                        </li>
                    </sec:authorize>
                </ul>
        </div>
    </div>
</nav>
