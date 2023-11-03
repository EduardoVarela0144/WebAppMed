<!DOCTYPE html>
<html lang="es">
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<head>
    <title>Clientes</title>
    <jsp:include page="../components/general/template_styles.jsp"/>
</head>
<body>

<!-- header section start -->
<jsp:include page="../components/general/navbar_client.jsp"/>
<!-- header section end -->

<!-- client section start -->
<jsp:include page="../components/clients/clients_opinions.jsp"/>
<!-- client section end -->

<!-- footer section start -->
<jsp:include page="../components/general/footer.jsp"/>
<!-- footer section end -->

<jsp:include page="../components/general/template_scripts.jsp"/>

</body>
</html>