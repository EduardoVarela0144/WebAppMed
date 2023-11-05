<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <title>Inicio de sesión</title>
    <jsp:include page="../components/general/template_styles.jsp"/>
</head>
<body>
<!-- header section start -->
<jsp:include page="../components/general/navbar_client.jsp"/>
<!-- header section end -->

<!-- contact section start -->
<div class="contact_section layout_padding margin_90">
    <div class="container">

        <c:if test="${not empty errorMessage}">
            <div class="alert alert-warning alert-dismissible fade show" role="alert">
                <strong>${errorMessage}</strong>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </c:if>

        <div class="news_section_2">

            <div class="col-md-12" id="login">
                <div class="contact_box">
                    <h1 class="book_text">Inicio de sesión</h1>
                    <form:form action="login" method="post">
                        <input class="Email_text" type="email" name="username" placeholder="Correo electrónico" required>
                        <input class="Email_text" type="password" name="password" placeholder="Contraseña" required>
                        <div class="send_bt">
                            <a style="color: white; width: 100%; height: 100%">
                                <button style="background-color: transparent; color: white; width: 100%; height: 100%"
                                        type="submit">Iniciar sesión
                                </button>
                            </a>
                        </div>
                    </form:form>
                </div>

            </div>
        </div>
    </div>
</div>

<!-- footer section start -->
<jsp:include page="../components/general/footer.jsp"/>
<!-- footer section end -->

<jsp:include page="../components/general/template_scripts.jsp"/>

<script>
    const elementoDestino = document.getElementById('login');
    elementoDestino.scrollIntoView({behavior: 'smooth'});
</script>
</body>
</html>