<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    String user = request.getParameter("User");
    String url = "/completeDoctorAccount/" + user ;
%>

<h2 class="font-bold text-2xl mb-12">Terminar registro como doctor</h2>

<%--@elvariable id="doctor" type=""--%>
<form:form action="<%= url %>" method="post" modelAttribute="doctor">
    <div class="grid gap-4 mb-4 sm:grid-cols-2">
        <div>
            <label for="clinic_address" class="block mb-2 text-sm font-medium text-gray-900 ">Dirección de la
                clínica</label>
            <form:input type="text" path="clinic_address" id="clinic_address"
                        class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-teal-600 focus:border-teal-600 block w-full p-2.5"
                        placeholder="Escribe la dirección de la clínica" required="true"/>
        </div>

        <div>
            <label for="clinic_number"
                   class="block mb-2 text-sm font-medium text-gray-900 ">Número de teléfono de la clínica</label>
            <form:input type="text" path="clinic_number" id="clinic_number"
                        class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-teal-600 focus:border-teal-600 block w-full p-2.5"
                        placeholder="+ 52" required="true"/>
        </div>

        <div>
            <label for="specialties" class="block mb-2 text-sm font-medium text-gray-900 ">Especialidad</label>
            <form:select type="text" path="specialties" id="specialties"
                         class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-teal-500 focus:border-teal-500 block w-full p-2.5">
                <option selected="">Selecciona una especialidad</option>
                <c:forEach var="speciality" items="${listSpecialties}">
                    <option value=${speciality.id_speciality}>${speciality.name}</option>
                </c:forEach>
            </form:select>
        </div>

        <div>
            <label for="cost"
                   class="block mb-2 text-sm font-medium text-gray-900 ">Costo de la consulta</label>
            <form:input type="number" path="cost" id="cost"
                        class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-teal-600 focus:border-teal-600 block w-full p-2.5"
                        placeholder="$ MXN" required="true"/>
        </div>


    </div>
    <div class="items-center space-y-4 sm:flex sm:space-y-0 sm:space-x-4">
        <button type="submit"
                class="w-full sm:w-auto justify-center text-white inline-flex bg-teal-700 hover:bg-teal-800 focus:ring-4 focus:outline-none focus:ring-teal-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center">
            Concluir registro
        </button>

    </div>
</form:form>
