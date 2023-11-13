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

            <div class="overflow-x-auto">
                <table class="w-full text-sm text-left text-gray-500">
                    <thead class="text-xs text-gray-700 uppercase bg-gray-50">
                    <tr>
                        <th scope="col" class="p-4">Id</th>
                        <th scope="col" class="p-4">Path</th>
                        <th scope="col" class="p-4">Acciones</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="pi" items="${listPaths}">

                        <tr class="border-b  hover:bg-gray-100">


                            <th scope="row" class="px-4 py-3 font-medium text-gray-900 whitespace-nowrap ">
                                <div class="flex items-center mr-3">
                                        ${pi.id_path}
                                </div>
                            </th>

                            <th scope="row" class="px-4 py-3 font-medium text-gray-900 whitespace-nowrap ">
                                <div class="flex items-center mr-3">
                                        ${pi.path_image}
                                </div>
                            </th>



                            <td class="px-4 py-3 font-medium text-gray-900 whitespace-nowrap ">
                                <div class="flex items-center space-x-4">
                                    <button  id=${pi.id_path} onclick="edit_element(this.id)" type="button" data-drawer-target="drawer-update-product"
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

    function edit_element(idButton) {


        var url = "api/path/" + idButton;

        $.ajax({
            type: "GET",
            url: url,
            dataType: "json",
            success: function(data) {

                document.getElementById("id_path").value = data.id_path;
                document.getElementById("path_image").value = data.path_image;

            },
            error: function() {
                console.error("Error al llamar al servicio REST.");
            }
        });

    }

</script>


