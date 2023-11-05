<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="createProductModal" tabindex="-1" aria-hidden="true"
     class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 justify-center items-center w-full md:inset-0 h-[calc(100%-1rem)] md:h-full">
    <div class="relative p-4 w-full max-w-3xl h-full md:h-auto">
        <!-- Modal content -->
        <div class="relative p-4 bg-white rounded-lg shadow  sm:p-5">
            <!-- Modal header -->
            <div class="flex justify-between items-center pb-4 mb-4 rounded-t border-b sm:mb-5 ">
                <h3 class="text-lg font-semibold">Agregar horario</h3>
                <button type="button"
                        class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center "
                        data-modal-toggle="createProductModal">
                    <svg aria-hidden="true" class="w-5 h-5" fill="currentColor" viewbox="0 0 20 20"
                         xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd"
                              d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
                              clip-rule="evenodd"></path>
                    </svg>
                    <span class="sr-only">Close modal</span>
                </button>
            </div>
            <!-- Modal body -->
            <%--@elvariable id="schedule" type=""--%>
            <form:form action="saveScheduleDoctor" method="post" modelAttribute="schedule">
                <div class="grid gap-4 mb-4 sm:grid-cols-2">

                    <div class="sm:col-span-2">
                        <label for="date_schedule" class="block mb-2 text-sm font-medium text-gray-900 ">Fecha del horario de atención</label>
                        <div class="relative">
                            <div class="absolute inset-y-0 left-0 flex items-center pl-3.5 pointer-events-none">
                                <svg class="w-4 h-4 text-gray-500" aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
                                     fill="currentColor" viewBox="0 0 20 20">
                                    <path d="M20 4a2 2 0 0 0-2-2h-2V1a1 1 0 0 0-2 0v1h-3V1a1 1 0 0 0-2 0v1H6V1a1 1 0 0 0-2 0v1H2a2 2 0 0 0-2 2v2h20V4ZM0 18a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2V8H0v10Zm5-8h10a1 1 0 0 1 0 2H5a1 1 0 0 1 0-2Z"/>
                                </svg>
                            </div>


                            <input datepicker name="date_schedule" path="date_schedule" id="date_schedule"
                                   type="text"
                                   class="bg-gray-50 border  border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-black focus:border-black block w-full pl-10 p-2.5"
                                   placeholder="Seleccionar fecha" required="true" />
                        </div>

                    </div>

                    <div>
                        <label for="hourStart" class="block mb-2 text-sm font-medium text-gray-900 ">Horario de
                            entrada</label>
                        <form:input type="time" path="hourStart" id="hourStart"
                                    class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-black focus:border-black block w-full p-2.5"
                                    required="true"/>
                    </div>

                    <div>
                        <label for="hourEnd" class="block mb-2 text-sm font-medium text-gray-900 ">Horario de
                            Salida</label>
                        <form:input type="time" path="hourEnd" id="hourEnd"
                                    class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-black focus:border-black block w-full p-2.5"
                                    required="true"/>
                    </div>

                    <form:hidden  path="id_doctor" id="id_doctor" value="${auth.userId}"
                                class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-black focus:border-black block w-full p-2.5"
                                required="true"/>



                </div>
                <div class="items-center space-y-4 sm:flex sm:space-y-0 sm:space-x-4">
                    <button type="submit"
                            class="w-full sm:w-auto justify-center text-white inline-flex bg-teal-300 hover:bg-teal-300 focus:ring-4 focus:outline-none focus:ring-teal-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center">
                        Agregar horario
                    </button>
                    <button data-modal-toggle="createProductModal" type="button"
                            class="w-full justify-center sm:w-auto text-gray-500 inline-flex items-center bg-white hover:bg-gray-100 focus:ring-4 focus:outline-none focus:ring-gray-300 rounded-lg border border-gray-200 text-sm font-medium px-5 py-2.5 hover:text-gray-900 focus:z-10">
                        <svg class="mr-1 -ml-1 w-5 h-5" fill="currentColor" viewbox="0 0 20 20"
                             xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd"
                                  d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
                                  clip-rule="evenodd"></path>
                        </svg>
                        Cancelar
                    </button>
                </div>
            </form:form>
        </div>
    </div>
</div>

