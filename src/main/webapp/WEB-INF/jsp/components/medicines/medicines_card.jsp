<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
    String id_product = request.getParameter("id_product");
    String description = request.getParameter("description");
    String name = request.getParameter("name");
    String price = request.getParameter("price");
    String stock = request.getParameter("stock");
    String url_image = request.getParameter("url_image");
%>

<%--@elvariable id="product" type=""--%>
<form:form action="saveCartProduct" method="post" modelAttribute="product">
    <div class="card  w-full">
        <img src="<%= url_image %>" class="card-img-top" alt="<%= name %>">
        <div class="card-body">
            <h5 class="card-title"><%= name %></h5>
            <p class="card-text"><%= description %></p>
            <p class="card-text">Price: $<%= price %> MXN</p>
            <p class="card-text">Stock: <%= stock %></p>
            <div class="input-group py-4">
            <span class="input-group-btn">
                <button class="bg-red-500 w-12 h-full text-white" type="button" onclick="decrement(<%= id_product %>, <%= stock %>)">-</button>
            </span>
                <form:hidden path="unitary_price" value="<%= price %>"  />
                <form:hidden path="id_product" value="<%= id_product%>"  />
                <form:input path="quantity"  type="number" id="<%= id_product %>" name="quantity-<%= id_product %>" value="0" min="0" max="<%= stock %>" class="form-control text-center"/>
                <span class="input-group-btn">
                <button type="button" class="bg-green-500 h-full w-12 text-white"  onclick="increment(<%= id_product %>, <%= stock %>)">+</button>
            </span>
            </div>
            <button type="submit" class="w-full justify-center text-white inline-flex bg-teal-300 hover:bg-teal-300 focus:ring-4 focus:outline-none focus:ring-teal-300 hover:border-teal-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center" onclick="return validateQuantity(<%= id_product %>)">
                Agregar al Carrito
            </button>

        </div>
    </div>
</form:form>

<script type="text/javascript">
    function increment(productId, maxStock) {
        var quantityInput = document.getElementById(productId);
        var currentQuantity = parseInt(quantityInput.value, 10);

        if (currentQuantity < maxStock) {
            quantityInput.value = currentQuantity + 1;
        }
    }

    function decrement(productId, maxStock) {
        var quantityInput = document.getElementById("quantity-" + productId);
        var currentQuantity = parseInt(quantityInput.value, 10);

        if (currentQuantity > 0) {
            quantityInput.value = currentQuantity - 1;
        }
    }

    function validateQuantity(productId) {
        var quantityInput = document.getElementById(productId);
        var currentQuantity = parseInt(quantityInput.value, 10);

        if (currentQuantity === 0) {
            alert("La cantidad no puede ser 0. Por favor, elija una cantidad válida.");
            return false; // Evita que el formulario se envíe
        }
        return true; // Permite que el formulario se envíe
    }
</script>
