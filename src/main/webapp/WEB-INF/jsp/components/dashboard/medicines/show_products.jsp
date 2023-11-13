<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<section>

    <c:if test="${not empty message}">

        <div id="toast-success" class="flex items-center w-full max-w-xs p-4 mb-4  rounded-lg shadow text-white bg-gray-800" role="alert">
            <div class="inline-flex items-center justify-center flex-shrink-0 w-8 h-8  rounded-lg ">
                <svg class="w-5 h-5 text-teal-300  rotate-45" aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
                     fill="none" viewBox="0 0 18 20">
                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                          d="m9 17 8 2L9 1 1 19l8-2Zm0 0V9"></path>
                </svg>
            </div>
            <div class="ml-3 text-sm font-normal">${message}</div>
            <button type="button" class="ml-auto -mx-1.5 -my-1.5 bg-white text-gray-400 hover:text-gray-900 rounded-lg focus:ring-2 focus:ring-gray-300 p-1.5 hover:bg-gray-100 inline-flex items-center justify-center h-8 w-8 dark:text-gray-500 dark:hover:text-white dark:bg-gray-800 dark:hover:bg-gray-700" data-dismiss-target="#toast-success" aria-label="Close">
                <span class="sr-only">Close</span>
                <svg class="w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 14">
                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6"></path>
                </svg>
            </button>
        </div>
    </c:if>

    <div class="mx-auto max-w-screen-2xl ">
        <div class="bg-white  relative shadow-md sm:rounded-lg overflow-hidden">
            <div class="flex flex-col md:flex-row items-stretch md:items-center md:space-x-3 space-y-3 md:space-y-0 justify-between mx-4 py-4 ">

                <div class="w-full md:w-auto flex flex-col md:flex-row space-y-2 md:space-y-0 items-stretch md:items-center justify-end md:space-x-3 flex-shrink-0">
                    <button type="button" id="createProductButton" data-modal-toggle="createProductModal"
                            class="flex items-center justify-center text-white bg-teal-300 hover:bg-teal-300 focus:ring-4 focus:ring-teal-300 font-medium rounded-lg text-sm px-4 py-2 ">
                        <svg class="h-3.5 w-3.5 mr-1.5 -ml-1" fill="currentColor" viewbox="0 0 20 20"
                             xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
                            <path clip-rule="evenodd" fill-rule="evenodd"
                                  d="M10 3a1 1 0 011 1v5h5a1 1 0 110 2h-5v5a1 1 0 11-2 0v-5H4a1 1 0 110-2h5V4a1 1 0 011-1z"></path>
                        </svg>
                        Agregar medicina
                    </button>

                </div>
            </div>
            <div class="overflow-x-auto">
                <table class="w-full text-sm text-left text-gray-500">
                    <thead class="text-xs text-gray-700 uppercase bg-gray-50">
                    <tr>
                        <th scope="col" class="p-4">Nombre</th>
                        <th scope="col" class="p-4">Precio</th>
                        <th scope="col" class="p-4">Descripción</th>
                        <th scope="col" class="p-4">Stock</th>
                        <th scope="col" class="p-4">Imagen</th>
                        <th scope="col" class="p-4">Acciones</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="product" items="${listProducts}">

                        <tr class="border-b  hover:bg-gray-100">

                            <th scope="row" class="px-4 py-3 font-medium text-gray-900 whitespace-nowrap ">
                                <div class="flex items-center mr-3">
                                        ${product.name}
                                </div>
                            </th>

                            <th scope="row" class="px-4 py-3 font-medium text-gray-900 whitespace-nowrap">
                                <div class="flex items-center mr-3 max-w-xs overflow-hidden">
                                    <div class="truncate">
                                            ${product.price}
                                    </div>
                                </div>
                            </th>

                            <th scope="row" class="px-4 py-3 font-medium text-gray-900 whitespace-nowrap">
                                <div class="flex items-center mr-3 max-w-xs overflow-hidden">
                                    <div class="truncate">
                                            ${product.description}
                                    </div>
                                </div>
                            </th>

                            <th scope="row" class="px-4 py-3 font-medium text-gray-900 whitespace-nowrap">
                                <div class="flex items-center mr-3 max-w-xs overflow-hidden">
                                    <div class="truncate">
                                            ${product.stock}
                                    </div>
                                </div>
                            </th>

                            <th scope="row" class="px-4 py-3 font-medium text-gray-900 whitespace-nowrap">
                                <div class="flex items-center mr-3 max-w-xs overflow-hidden">
                                    <div class="truncate">
                                        <img src="${product.url_image}" width="50" height="50" />
                                    </div>
                                </div>
                            </th>



                            <td class="px-4 py-3 font-medium text-gray-900 whitespace-nowrap ">
                                <div class="flex items-center space-x-4">
                                    <button  id=${product.id_product} onclick="edit_element(this.id)" type="button" data-drawer-target="drawer-update-product"
                                             data-drawer-show="drawer-update-product"
                                             aria-controls="drawer-update-product"
                                             class="py-2 px-3 flex items-center text-sm font-medium text-center text-white bg-black rounded-lg hover:bg-black focus:ring-4 focus:outline-none focus:ring-gray-300">
                                        <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 mr-2 -ml-0.5"
                                             viewbox="0 0 20 20" fill="currentColor" aria-hidden="true">
                                            <path d="M17.414 2.586a2 2 0 00-2.828 0L7 10.172V13h2.828l7.586-7.586a2 2 0 000-2.828z"></path>
                                            <path fill-rule="evenodd"
                                                  d="M2 6a2 2 0 012-2h4a1 1 0 010 2H4v10h10v-4a1 1 0 112 0v4a2 2 0 01-2 2H4a2 2 0 01-2-2V6z"
                                                  clip-rule="evenodd"></path>
                                        </svg>
                                        Editar
                                    </button>

                                    <button id=${product.id_product} onclick="delete_element(this.id)"
                                            type="button" data-modal-target="delete-modal"
                                            data-modal-toggle="delete-modal"

                                            class="flex items-center text-red-700 hover:text-white border border-red-700 hover:bg-red-800 focus:ring-4 focus:outline-none focus:ring-red-300 font-medium rounded-lg text-sm px-3 py-2 text-center ">
                                        <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 mr-2 -ml-0.5"
                                             viewbox="0 0 20 20" fill="currentColor" aria-hidden="true">
                                            <path fill-rule="evenodd"
                                                  d="M9 2a1 1 0 00-.894.553L7.382 4H4a1 1 0 000 2v10a2 2 0 002 2h8a2 2 0 002-2V6a1 1 0 100-2h-3.382l-.724-1.447A1 1 0 0011 2H9zM7 8a1 1 0 012 0v6a1 1 0 11-2 0V8zm5-1a1 1 0 00-1 1v6a1 1 0 102 0V8a1 1 0 00-1-1z"
                                                  clip-rule="evenodd"></path>
                                        </svg>
                                        Eliminar
                                    </button>
                                </div>
                            </td>

                        </tr>

                    </c:forEach>

                    </tbody>
                </table>
            </div>
        </div>
    </div>
</section>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
    function delete_element(idButton) {
        var button = document.getElementById("delete_button_1");
        button.href = "deleteProduct/" + idButton;
    }
    function edit_element(idButton) {
        var button = document.getElementById("delete_button_2");
        button.href = "deleteProduct/" + idButton;

        var url = "api/products/" + idButton;

        $.ajax({
            type: "GET",
            url: url,
            dataType: "json",
            success: function(data) {
                 var image = document.getElementById("image");
                 image.src =  data.url_image;
                document.getElementById("id_product").value = data.id_product;
                document.getElementById("edit_description").value = data.description;
                document.getElementById("edit_price").value = data.price;
                document.getElementById("edit_url_image").value = data.url_image;
                document.getElementById("edit_stock").value = data.stock;
                document.getElementById("edit_name").value = data.name;
            },
            error: function() {
                console.error("Error al llamar al servicio REST.");
            }
        });

    }

</script>


