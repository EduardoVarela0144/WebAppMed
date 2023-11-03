<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    String user = request.getParameter("User");
    String url = "/completePatientAccount/" + user ;
%>

<h2 class="font-bold text-2xl mb-12">Terminar registro como paciente</h2>
<%--@elvariable id="patient" type=""--%>
<form:form action="<%= url %>" method="post" modelAttribute="patient">
    <div class="grid gap-4 mb-4 sm:grid-cols-2">
        <div>
            <label for="address" class="block mb-2 text-sm font-medium text-gray-900 ">Dirección</label>
            <form:input
                    path="address" type="text" name="address" id="address"
                    class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-teal-600 focus:border-teal-600 block w-full p-2.5"
                    placeholder="Escribe tu dirección paciente" required=""/>
        </div>

        <div>
            <label for="phone_number"
                   class="block mb-2 text-sm font-medium text-gray-900 ">Número de teléfono</label>
            <form:input
                    path="phone_number" type="text" name="phone_number" id="phone_number"
                    class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-teal-600 focus:border-teal-600 block w-full p-2.5"
                    placeholder="+ 52" required=""/>
        </div>


    </div>
    <div class="items-center space-y-4 sm:flex sm:space-y-0 sm:space-x-4">
        <button type="submit"
                class="w-full sm:w-auto justify-center text-white inline-flex bg-teal-700 hover:bg-teal-800 focus:ring-4 focus:outline-none focus:ring-teal-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center">
            Concluir registro
        </button>
    </div>
</form:form>


