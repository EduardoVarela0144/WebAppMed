<!DOCTYPE html>
<html lang="en">
<head>
    <title>Registro</title>
    <jsp:include page="../components/general/template_styles.jsp"/>
</head>
<body>
<!-- header section start -->
<jsp:include page="../components/general/navbar_client.jsp"/>
<!-- header section end -->

<!-- register section start -->
<jsp:include page="../components/register/register_form.jsp"/>
<!-- register section end -->

<!-- footer section start -->
<jsp:include page="../components/general/footer.jsp"/>
<!-- footer section end -->

<!-- Javascript files-->
<jsp:include page="../components/general/template_scripts.jsp"/>


<script>
    const elementoDestino = document.getElementById('register');
    elementoDestino.scrollIntoView({ behavior: 'smooth' });
</script>

</body>
</html>