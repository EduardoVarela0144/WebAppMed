<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="footer_section layout_padding" id="miFooter">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-sm-6">
                <div class="footer_logo"><a href="/"><img src="<%=request.getContextPath()%>/images/footer-logo.png"></a></div>
                <h1 class="adderss_text">Contacto</h1>
                <div class="map_icon"><img src="<%=request.getContextPath()%>/images/map-icon.png"><span
                        class="paddlin_left_0">Santa Cruz Xoxocotlán</span>
                </div>
                <div class="map_icon"><img src="<%=request.getContextPath()%>/images/call-icon.png"><span
                        class="paddlin_left_0">+52 951 678 7845</span>
                </div>
                <div class="map_icon"><img src="<%=request.getContextPath()%>/images/mail-icon.png"><span
                        class="paddlin_left_0">0144@ulsaoaxaca.edu.mx</span></div>
            </div>
            <div class="col-lg-3 col-sm-6">
                <h1 class="adderss_text">Doctores</h1>
                <div class="hiphop_text_1">En Nurgo, estamos dedicados a conectar a nuestros usuarios con los mejores
                    especialistas médicos a nivel local y nacional.
                </div>
            </div>
            <div class="col-lg-3 col-sm-6">
                <h1 class="adderss_text">Citas</h1>
                <div class="Useful_text">Contamos con uno de los mejores sistemas de citas para que encuentres a tu
                    doctor ideal
                </div>
            </div>
            <div class="col-lg-3 col-sm-6">
                <h1 class="adderss_text">Boletín</h1>
                <input type="text" class="Enter_text" placeholder="Ingresa tu email" name="Enter your Emil">
                <div class="subscribe_bt"><a href="/signUp">Suscribirme</a></div>
                <div class="social_icon">
                    <ul>
                        <li><a href="#"><img src="<%=request.getContextPath()%>/images/fb-icon.png"></a></li>
                        <li><a href="#"><img src="<%=request.getContextPath()%>/images/twitter-icon.png"></a></li>
                        <li><a href="#"><img src="<%=request.getContextPath()%>/images/linkedin-icon.png"></a></li>
                        <li><a href="#"><img src="<%=request.getContextPath()%>/images/instagram-icon.png"></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- copyright section start -->
<div class="copyright_section">
    <div class="container">
        <p class="copyright_text">2023 Todos los derechos reservados. Diseñado por <a href="https://www.linkedin.com/in/eduardo-varela-h/">Eduardo
            Varela Hern&aacutendez</a></p>
    </div>
</div>