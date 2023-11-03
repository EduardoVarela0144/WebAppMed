<%
    String active = request.getParameter("active");
    String user = request.getParameter("user");
    String opinion = request.getParameter("opinion");
    String image_name = request.getParameter("image_name");

%>

<div class="carousel-item  <%= active %>">
    <div class="container">
        <h1 class="client_taital">Lo que los pacientes dicen</h1>
        <p class="client_text">Los mejores m&eacute;dicos especialistas a tu alcance</p>
        <div class="client_section_2">
            <div class="client_left">
                <div style="height: 550px; padding: 30px">
                    <img src="images/<%= image_name %>.jpeg" class="client_img" style="width: 100%; height: 100%; object-fit: cover;">
                </div>
            </div>
            <div class="client_right">
                <h3 class="distracted_text"><%= user %>
                </h3>
                <p class="lorem_text"><%= opinion %>
                </p>
                <div class="quote_icon"><img src="images/quote-icon.png"></div>
            </div>
        </div>
    </div>
</div>