<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<div class="contact_section layout_padding margin_90">
    <div class="container">

        <c:if test="${errorMessage}">
            <div class="alert alert-warning alert-dismissible fade show" role="alert">
                <strong>${errorMessage}</strong>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </c:if>

        <c:if test="${message}">
            <div class="alert alert-warning alert-dismissible fade show" role="alert">
                <strong>${message}</strong>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </c:if>


        <h1 class="contact_taital">Nuestros servicios</h1>
        <div class="news_section_2">
            <div class="row">
                <div class="col-md-6">
                    <div class="icon_main">
                        <div class="icon_7">
                            <img src="<%=request.getContextPath()%>/images/icon-7.png">
                        </div>
                        <h4 class="diabetes_text">Diabetes y obesidad</h4>
                    </div>
                    <div class="icon_main">
                        <div class="icon_7">
                            <img src="<%=request.getContextPath()%>/images/icon-5.png">
                        </div>
                        <h4 class="diabetes_text">Obstetricia y ginecología</h4>
                    </div>
                    <div class="icon_main">
                        <div class="icon_7">
                            <img src="<%=request.getContextPath()%>/images/icon-6.png">
                        </div>
                        <h4 class="diabetes_text">Oncología quirúrgica y médica</h4>
                    </div>
                </div>
                <div class="col-md-6" id="register">

                    <%--@elvariable id="user" type=""--%>
                    <form:form action="signUpSaveUser" method="post" modelAttribute="user">

                        <div class="contact_box">
                            <h1 class="book_text">Registro</h1>

                            <form:input type="text" placeholder="Nombre" path="name" id="name" class="Email_text"
                                        required="required"/>
                            <form:input type="text" placeholder="Apellido Paterno" path="ape_pat" id="ape_pat"
                                        class="Email_text" required="required"/>
                            <form:input type="text" placeholder="Apellido Materno" path="ape_mat" id="ape_mat"
                                        class="Email_text" required="required"/>

                            <div class="form-group">
                                <form:select path="gender" id="gender" class="Email_text form-control mt-4 w-4" required="required">
                                    <form:option value="" label="Seleccione un género"/>
                                    <form:option value="Masculino" label="Masculino"/>
                                    <form:option value="Femenino" label="Femenino"/>
                                    <form:option value="Otro" label="Otro"/>
                                </form:select>
                            </div>


                            <form:input type="email" placeholder="Correo electrónico" path="email" id="email" class="Email_text"
                                        required="required"/>
                            <form:input type="password" placeholder="Contraseña" path="password" id="password"
                                        class="Email_text" required="required"/>


                            <div class="form-group">
                                <form:select path="type" id="type" class="Email_text form-control mt-4 w-4" required="required">
                                    <form:option value="" label="Seleccione un rol para tu usuario"/>
                                    <form:option value="Doctor" label="Doctor"/>
                                    <form:option value="Patient" label="Paciente"/>
                                </form:select>
                            </div>

                            <div class="send_bt">
                                <a style="color: white; width: 100%; height: 100%">
                                    <button style="background-color: transparent; color: white; width: 100%; height: 100%"
                                            type="submit">Registrarme
                                    </button>
                                </a>
                            </div>
                        </div>

                    </form:form>

                </div>
            </div>
        </div>
    </div>
</div>
