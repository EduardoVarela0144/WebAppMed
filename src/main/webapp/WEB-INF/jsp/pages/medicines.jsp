<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE html>

<head>
    <title>Medicinas</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <jsp:include page="../components/general/template_styles.jsp"/>

</head>

<body>

<div class="py-4">
    <jsp:include page="../components/dashboard/dashboard_navbar.jsp"/>

    <div class="client_section layout_padding">

        <div class="container mt-4 p-4">

            <div class="row">

                <c:forEach var="medicine" items="${listMedicines}">
                    <div class="col-lg-4 col-md-6 col-sm-12">
                        <jsp:include page="../components/medicines/medicines_card.jsp">
                            <jsp:param name="id_product" value="${medicine.id_product}" />
                            <jsp:param name="description" value="${medicine.description}" />
                            <jsp:param name="name" value="${medicine.name}" />
                            <jsp:param name="price" value="${medicine.price}" />
                            <jsp:param name="stock" value="${medicine.stock}" />
                            <jsp:param name="url_image" value="${medicine.url_image}" />
                        </jsp:include>
                        <br/>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>

    <jsp:include page="../components/general/footer.jsp"/>

</div>

<jsp:include page="../components/general/template_scripts.jsp"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.8.1/flowbite.min.js"></script>
</body>
