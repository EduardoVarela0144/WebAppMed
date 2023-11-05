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
                <h3 class="text-lg font-semibold">Agregar usuario</h3>
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
            <%--@elvariable id="user" type=""--%>
            <form:form action="saveUser?page=users" method="post" modelAttribute="user"
                       onsubmit="return validateForm()">
                <div class="grid gap-4 mb-4 sm:grid-cols-2">
                    <div>
                        <label for="name" class="block mb-2 text-sm font-medium text-gray-900 ">Nombre</label>
                        <form:input type="text" path="name" id="name"
                                    class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-black focus:border-black block w-full p-2.5"
                                    placeholder="Escribe el nombre del usuario" required="true"/>
                    </div>

                    <div>
                        <label for="ape_pat" class="block mb-2 text-sm font-medium text-gray-900 ">Apellido
                            paterno</label>
                        <form:input type="text" path="ape_pat" id="ape_pat"
                                    class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-black focus:border-black block w-full p-2.5"
                                    placeholder="Escribe el apellido paterno" required="true"/>
                    </div>

                    <div>
                        <label for="ape_mat" class="block mb-2 text-sm font-medium text-gray-900 ">Apellido
                            materno</label>
                        <form:input type="text" path="ape_mat" id="ape_mat"
                                    class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-black focus:border-black block w-full p-2.5"
                                    placeholder="Escribe el apellido materno" required="true"/>
                    </div>

                    <div>
                        <label for="gender" class="block mb-2 text-sm font-medium text-gray-900 ">Género</label>
                        <form:select type="text" path="gender" id="gender"
                                     class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-black focus:border-black block w-full p-2.5">
                            <option selected="">Selecciona un género</option>
                            <option value="Hombre">Hombre</option>
                            <option value="Mujer">Mujer</option>
                            <option value="Otro">Otro</option>
                        </form:select>
                    </div>

                    <div>
                        <label for="email" class="block mb-2 text-sm font-medium text-gray-900 ">Correo
                            electrónico</label>
                        <form:input type="text" path="email" id="email"
                                    class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-black focus:border-black block w-full p-2.5"
                                    placeholder="Escribe el correo electrónico" required="true"/>
                    </div>

                    <div>
                        <label for="password" class="block mb-2 text-sm font-medium text-gray-900 ">Contraseña</label>
                        <form:input type="text" path="password" id="password"
                                    class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-black focus:border-black block w-full p-2.5"
                                    placeholder="Escribe la contraseña" required="true"/>
                    </div>


                    <div>
                        <label for="id_doctor" class="block mb-2 text-sm font-medium text-gray-900 ">Doctor</label>
                        <form:select type="text" path="id_doctor" id="id_doctor"
                                     class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-black focus:border-black block w-full p-2.5">
                            <option selected="" value=0 >Selecciona el ID del doctor</option>
                            <c:forEach var="doctor" items="${listDoctors}">
                                <option value=${doctor.id_doctor}>${doctor.id_doctor}</option>
                            </c:forEach>
                        </form:select>
                    </div>

                    <div>
                        <label for="id_patient" class="block mb-2 text-sm font-medium text-gray-900 ">Paciente</label>
                        <form:select type="text" path="id_patient" id="id_patient"
                                     class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-black focus:border-black block w-full p-2.5">
                            <option selected="" value=0 >Selecciona el ID del paciente</option>
                            <c:forEach var="patient" items="${listPatients}">
                                <option value=${patient.id_patient}>${patient.id_patient}</option>
                            </c:forEach>
                        </form:select>
                    </div>


                </div>
                <div class="items-center space-y-4 sm:flex sm:space-y-0 sm:space-x-4">
                    <button type="submit"
                            class="w-full sm:w-auto justify-center text-white inline-flex bg-teal-300 hover:bg-teal-300 focus:ring-4 focus:outline-none focus:ring-teal-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center">
                        Agregar usuario
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

<script>
    function validateForm() {
        var doctorSelect = document.getElementById("id_doctor");
        var patientSelect = document.getElementById("id_patient");
        var genderSelect = document.getElementById("gender");

        if (doctorSelect.value !== "0" && patientSelect.value !== "0") {
            alert("Tu usuario solo puede tener un rol paciente o doctor pero no ambos");
            return false;
        }

        if (doctorSelect.value === "0" && patientSelect.value === "0") {
            alert("Tu usuario debe tener al menos un rol");
            return false;
        }

        if (genderSelect.value === "" || genderSelect.value === "Selecciona un género") {
            alert("No puedes dejar el campo de género vacío");
            return false;
        }

        return true;
    }

</script>
