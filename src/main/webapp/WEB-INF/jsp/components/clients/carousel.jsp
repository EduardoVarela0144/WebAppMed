<div id="my_slider" class="carousel slide" data-ride="carousel">
    <div class="carousel-inner">

        <jsp:include page="./carousel_item.jsp">
            <jsp:param name="active" value="active"/>
            <jsp:param name="user" value="Mar&iacute;a L&oacute;pez P&eacute;rez"/>
            <jsp:param name="opinion"
                       value="Esta p&aacute;gina m&eacute;dica ha sido un recurso invaluable para m&iacute; y mi familia. Nos ha ayudado a encontrar especialistas de confianza y a gestionar nuestras citas m&eacute;dicas de manera eficiente. La informaci&oacute;n proporcionada es detallada y confiable. &iexcl;Altamente recomendada!"/>
            <jsp:param name="image_name" value="Maria"/>
        </jsp:include>

        <jsp:include page="./carousel_item.jsp">
            <jsp:param name="user" value="Carlos Rodr&iacute;guez Gonz&aacute;lez"/>
            <jsp:param name="opinion"
                       value="Aunque la p&aacute;gina tiene informaci&oacute;n &uacute;til, he tenido problemas con la usabilidad. La interfaz es complicada de navegar y a veces la b&uacute;squeda de m&eacute;dicos no es precisa. Ser&iacute;a genial si mejoraran la experiencia del usuario."/>
            <jsp:param name="image_name" value="Carlos"/>
        </jsp:include>

        <jsp:include page="./carousel_item.jsp">
            <jsp:param name="user" value="Laura Mart&iacute;nez"/>
            <jsp:param name="opinion"
                       value="He encontrado a trav&eacute;s de esta p&aacute;gina m&eacute;dica a un incre&iacute;ble m&eacute;dico que ha cambiado mi vida. Su atenci&oacute;n y conocimientos son excepcionales. La funci&oacute;n de b&uacute;squeda me permiti&oacute; encontrarlo f&aacute;cilmente. &iexcl;Gracias por esta herramienta!"/>
            <jsp:param name="image_name" value="Laura"/>
        </jsp:include>




    </div>
    <a class="carousel-control-prev" href="#my_slider" role="button" data-slide="prev">
        <i class="fa fa-long-arrow-left" style="font-size:24px; padding-top: 4px;"></i>
    </a>
    <a class="carousel-control-next" href="#my_slider" role="button" data-slide="next">
        <i class="fa fa-long-arrow-right" style="font-size:24px; padding-top: 4px;"></i>
    </a>
</div>