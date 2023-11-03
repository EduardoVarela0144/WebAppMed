
<div class="carousel-inner">
    <jsp:include page="./carousel_header_item.jsp">
        <jsp:param name="active" value="active"/>
        <jsp:param name="title" value="Agenda una cita"/>
        <jsp:param name="button_title" value="Citas"/>
        <jsp:param name="image_name" value="citas.png"/>
        <jsp:param name="href" value="/doctors"/>
    </jsp:include>
    <jsp:include page="./carousel_header_item.jsp">
        <jsp:param name="title" value="Conoce a nuestros doctores"/>
        <jsp:param name="button_title" value="Doctores"/>
        <jsp:param name="image_name" value="doctor.png"/>
        <jsp:param name="href" value="/doctors"/>

    </jsp:include>
    <jsp:include page="./carousel_header_item.jsp">
        <jsp:param name="title" value="Conoce las opiniones de nuestros clientes"/>
        <jsp:param name="button_title" value="Opiniones"/>
        <jsp:param name="image_name" value="clients.png"/>
        <jsp:param name="href" value="/clients"/>


    </jsp:include>
</div>