<%
    String active = request.getParameter("active");
    String title = request.getParameter("title");
    String button_title = request.getParameter("button_title");
    String image_name = request.getParameter("image_name");
    String href = request.getParameter("href");

%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<%@page contentType="text/html" pageEncoding="UTF-8" %>

<div class="carousel-item <%= active %>">
    <div class="banner_section">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h1 class="banner_taital">Nurgo <br><span style="color: #151515;">Tu mejor opción</span></h1>
                    <p class="banner_text"><%= title %>
                    </p>

                        <div class="btn_main">
                            <div class="more_bt"><a href="#miFooter">Contacto</a></div>

                            <div class="contact_bt"><a href="<%= href %>"><%= button_title %>
                            </a></div>
                        </div>


                </div>
                <div class="col-md-6">
                    <div class="image_1"
                         style="height: 400px; display: flex; justify-content: center; align-items: center;">
                        <img src="<%=request.getContextPath()%>/images/<%= image_name %>"
                             style="width: 100%; height: 100%; object-fit: cover; object-position: center top;"/>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>