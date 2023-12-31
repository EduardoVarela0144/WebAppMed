<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%--@elvariable id="pathImage" type=""--%>
<form:form action="savePathImage?page=path" method="post" modelAttribute="pathImage" id="drawer-update-product"
           class="fixed top-0 left-0 z-40 w-full h-screen max-w-3xl p-4 overflow-y-auto transition-transform -translate-x-full bg-white"
           tabindex="-1" aria-labelledby="drawer-update-product-label" aria-hidden="false"  enctype="multipart/form-data">
    <h5 id="drawer-label"
        class="inline-flex items-center mb-6 text-sm font-semibold text-gray-500 uppercase">Actualizar path</h5>
    <button type="button" data-drawer-dismiss="drawer-update-product" aria-controls="drawer-update-product"
            class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 absolute top-2.5 right-2.5 inline-flex items-center">
        <svg aria-hidden="true" class="w-5 h-5" fill="currentColor" viewbox="0 0 20 20"
             xmlns="http://www.w3.org/2000/svg">
            <path fill-rule="evenodd"
                  d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
                  clip-rule="evenodd"></path>
        </svg>
        <span class="sr-only">Close menu</span>
    </button>

    <div class="grid gap-4 mb-4 sm:grid-cols-2">

        <form:hidden path="id_path" id="id_path" class="form-control input-sm" />

        <div class="sm:col-span-2">
            <label for="path_image" class="block mb-2 text-sm font-medium text-gray-900 ">Path</label>
            <form:input type="text" path="path_image" id="path_image"

                        class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-black focus:border-black block w-full  p-2.5"
                        placeholder="Escribe el path" required="true"/>
        </div>

    </div>

    <div class="grid grid-cols-2 gap-4 mt-6 sm:w-1/2">
        <button type="submit"
                class="text-white bg-teal-300 hover:bg-teal-300 focus:ring-4 focus:outline-none focus:ring-teal-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center">
            Actualizar path
        </button>
    </div>
</form:form>
