<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--@elvariable id="payment" type=""--%>
<form:form action="/saveAppointmentPayment?page=payments" method="post" modelAttribute="payment" id="drawer-update-product"
           class="fixed top-0 left-0 z-40 w-full h-screen max-w-3xl p-4 overflow-y-auto transition-transform -translate-x-full bg-white"
           tabindex="-1" aria-labelledby="drawer-update-product-label" aria-hidden="false">
    <h5 id="drawer-label"
        class="inline-flex items-center mb-6 text-sm font-semibold text-gray-500 uppercase">Actualizar cita</h5>
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

    <div class="grid gap-4 mb-4 sm:grid-cols-1">
        <form:hidden path="id_payments" id="edit_id_payments" class="form-control input-sm" />



        <div>
            <label for="total" class="block mb-2 text-sm font-medium text-gray-900 ">Total</label>
            <form:input type="number" path="total" id="edit_total"

                        class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-black focus:border-black block w-full p-2.5"
                        placeholder="Escribe el total de la consulta" required="true"/>
        </div>


        <div>
            <label for="appointments" class="block mb-2 text-sm font-medium text-gray-900 ">Cita</label>
            <form:select type="text" path="appointments" id="edit_appointments"
                         class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-black focus:border-black block w-full p-2.5">
                <option selected="" value=0 >Selecciona el ID de la cita</option>
                <c:forEach var="appointment" items="${listAppointments}">
                    <option value=${appointment.id_appointments}>${appointment.id_appointments}</option>
                </c:forEach>
            </form:select>
        </div>


    </div>

    <div class="grid grid-cols-2 gap-4 mt-6 sm:w-1/2">
        <button type="submit"
                class="text-white bg-teal-300 hover:bg-teal-300 focus:ring-4 focus:outline-none focus:ring-teal-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center">
            Actualizar cita
        </button>
        <a  type="button"  id="delete_button_2" href=""
            class="text-red-600 inline-flex justify-center items-center hover:text-white border border-red-600 hover:bg-red-600 focus:ring-4 focus:outline-none focus:ring-red-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center">
            <svg aria-hidden="true" class="w-5 h-5 mr-1 -ml-1" fill="currentColor" viewbox="0 0 20 20"
                 xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd"
                      d="M9 2a1 1 0 00-.894.553L7.382 4H4a1 1 0 000 2v10a2 2 0 002 2h8a2 2 0 002-2V6a1 1 0 100-2h-3.382l-.724-1.447A1 1 0 0011 2H9zM7 8a1 1 0 012 0v6a1 1 0 11-2 0V8zm5-1a1 1 0 00-1 1v6a1 1 0 102 0V8a1 1 0 00-1-1z"
                      clip-rule="evenodd"></path>
            </svg>
            Eliminar
        </a>
    </div>
</form:form>
