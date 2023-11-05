<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Carrito de compras</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <jsp:include page="../components/general/template_styles.jsp"/>
</head>

<body>
<div class="py-4">
    <jsp:include page="../components/dashboard/dashboard_navbar.jsp"/>
    <div class="client_section layout_padding">
        <div class="container mt-4 p-4">
            <div class="flex-col">
                <c:choose>
                    <c:when test="${empty listCart}">
                        <p>El carrito de compras está vacío.</p>
                    </c:when>
                    <c:otherwise>
                        <div class="justify-between flex  w-full">
                            <h3 class="font-bold text-2xl">Total del carrito: $ ${total} MXN </h3>
                            <form action="cleanCart/${id_cart}"
                                  method="post">
                                <button type="submit" class="bg-black text-white px-4 py-2">
                                    Pagar
                                </button>
                            </form>

                        </div>
                        <c:forEach items="${listCart}" var="cartElement">
                            <div class="card mt-3">
                                <div class="card-body flex flex-row justify-between">
                                    <div class=" flex-row flex space-x-4">
                                        <div>
                                            <img src="<%=request.getContextPath()%>/images/${cartElement.id_product.url_image}"
                                                 class="w-24 h-24" alt="${cartElement.id_product.name}">
                                        </div>
                                        <div>
                                            <h5 class="card-title">${cartElement.id_product.name}</h5>
                                            <p class="card-text">Precio
                                                Unitario: ${cartElement.unitary_price}</p>
                                            <p class="card-text">Cantidad: ${cartElement.quantity}</p>
                                        </div>
                                    </div>
                                    <div class="flex-col  items-center justify-center space-y-4">
                                        <div class="flex">
                                            <form action="removeToCart/${cartElement.id_cart_elements}"
                                                  method="post">
                                                <button type="submit" class="bg-black text-white px-4 py-2">
                                                    -
                                                </button>
                                            </form>

                                            <div type="submit" class="border border-1 text-white px-4 text-black items-center justify-center flex">
                                                <p class="text-black">
                                                        ${cartElement.quantity}
                                                </p>
                                            </div>
                                            <form action="addToCart/${cartElement.id_cart_elements}"
                                                  method="post">
                                                <button type="submit" class="bg-teal-300 text-white px-4 py-2">
                                                    +
                                                </button>
                                            </form>
                                        </div>
                                        <form action="deleteCartProduct/${cartElement.id_cart_elements}"
                                              method="get">
                                            <button type="submit" class="bg-red-500 text-white px-4 py-2 w-full">
                                                Eliminar
                                            </button>
                                        </form>
                                    </div>

                                </div>
                            </div>
                        </c:forEach>

                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
    <jsp:include page="../components/general/footer.jsp"/>
</div>
<jsp:include page="../components/general/template_scripts.jsp"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.8.1/flowbite.min.js"></script>
</body>
</html>
