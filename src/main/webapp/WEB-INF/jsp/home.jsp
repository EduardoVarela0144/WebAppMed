<!DOCTYPE html>
<html lang="en">

<head>
    <title>Inicio</title>
    <jsp:include page="./components/general/template_styles.jsp"/>
</head>

<body>
<!-- header section start -->
<jsp:include page="components/general/navbar_client.jsp"/>
<!-- header section end -->

<!-- health section start -->
<jsp:include page="components/health/health_info.jsp"/>
<!-- health section end -->

<!-- knowledge section end -->
<jsp:include page="components/medicine/video_info.jsp"/>
<!-- knowledge section end -->

<!-- news section start -->
<jsp:include page="components/news/services_info.jsp"/>
<!-- news section end -->

<!-- contact section start -->
<div class="contact_section layout_padding">
    <jsp:include page="components/clients/carousel.jsp"/>

</div>
<!-- contact section end -->

<!-- footer section start -->
<jsp:include page="components/general/footer.jsp"/>
<!-- footer section end -->

<jsp:include page="components/general/template_scripts.jsp"/>

<script>
    document.querySelector('a[href="#miFooter"]').addEventListener('click', function(e) {
        e.preventDefault();
        document.querySelector('#miFooter').scrollIntoView({ behavior: 'smooth' });
    });
</script>


</body>

</html>