<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<% String currentURL = request.getRequestURI(); %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<div class="header_section">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <sec:authorize access="not hasRole('ROLE_PATIENT')">

            <div class="logo"><a href="<%=request.getContextPath()%>/"><img src="<%=request.getContextPath()%>/images/logo.png"></a></div>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon">${auth.fullName.substring(0, 1)}</span>
            </button>
        </sec:authorize>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item <%= currentURL.endsWith("home.jsp") || currentURL.endsWith("/")  ? "active" : "" %>">
                    <a class="nav-link" href="home">Inicio</a>
                </li>
                <li class="nav-item <%= currentURL.endsWith("health.jsp") ? "active" : "" %>">
                    <a class="nav-link" href="health">Salud</a>
                </li>
                <li class="nav-item <%= currentURL.endsWith("medicine.jsp") ? "active" : "" %>">
                    <a class="nav-link" href="medicine">Medicina</a>
                </li>
                <li class="nav-item <%= currentURL.endsWith("news.jsp") ? "active" : "" %>">
                    <a class="nav-link" href="news">Noticias</a>
                </li>
                <li class="nav-item <%= currentURL.endsWith("clients.jsp") ? "active" : "" %>">
                    <a class="nav-link" href="clients">Clientes</a>
                </li>
                <sec:authorize access="!isAuthenticated()">
                    <li class="nav-item <%= currentURL.endsWith("register.jsp") ? "active" : "" %>">
                        <a class="nav-link" href="signUp">Registro</a>
                    </li>
                </sec:authorize>

                <sec:authorize access="isAuthenticated()">

                    <sec:authorize access="hasRole('ROLE_PATIENT')">
                        <li class="nav-item <%= currentURL.endsWith("doctors.jsp") ? "active" : "" %>">
                            <a class="nav-link" href="doctors">Doctores</a>
                        </li>
                    </sec:authorize>

                    <sec:authorize  access="not hasRole('ROLE_ADMIN')">

                        <li class="nav-item <%= currentURL.endsWith("medicines.jsp") ? "active" : "" %>">
                            <a class="nav-link" href="medicines">Medicinas</a>
                        </li>
                        <li class="nav-item <%= currentURL.endsWith("cart.jsp") ? "active" : "" %>">
                            <a class="nav-link" href="user_cart">Carrito</a>
                        </li>
                    </sec:authorize>

                </sec:authorize>


                <sec:authorize access="hasRole('ROLE_ADMIN')">
                    <li class="nav-item <%= currentURL.endsWith("dashboard.jsp") ? "active" : "" %>">
                        <a class="nav-link" href="dashboard">Dashboard</a>
                    </li>
                </sec:authorize>

                <sec:authorize access="!isAuthenticated()">
                    <li class="nav-item <%= currentURL.endsWith("login.jsp") ? "active" : "" %>">
                        <a class="nav-link" href="login">Login</a>
                    </li>
                </sec:authorize>

                <sec:authorize access="hasRole('ROLE_DOCTOR')">
                    <li class="nav-item <%= currentURL.endsWith("appointments.jsp") ? "active" : "" %>">
                        <a class="nav-link" href="appointments">Citas</a>
                    </li>
                </sec:authorize>

                <sec:authorize access="hasRole('ROLE_PATIENT')">
                    <li class="nav-item <%= currentURL.endsWith("my_patient_appointments.jsp") ? "active" : "" %>">
                        <a class="nav-link" href="<%=request.getContextPath()%>/my_appointments">Mis citas</a>
                    </li>
                </sec:authorize>

                <sec:authorize access="isAuthenticated()">

                    <li class="nav-item <%= currentURL.endsWith("login.jsp") ? "active" : "" %>">
                        <a class="nav-link" href="logout">Logout</a>
                    </li>
                </sec:authorize>

            </ul>
        </div>
    </nav>

    <div id="main_slider" class="carousel slide" data-ride="carousel">
        <jsp:include page="./carousel_header.jsp"/>


        <a class="carousel-control-prev" href="#main_slider" role="button" data-slide="prev">
            <i class="fa fa-long-arrow-left" style="font-size:24px; padding-top: 4px;"></i>
        </a>
        <a class="carousel-control-next" href="#main_slider" role="button" data-slide="next">
            <i class="fa fa-long-arrow-right" style="font-size:24px; padding-top: 4px;"></i>
        </a>
    </div>

</div>