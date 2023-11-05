<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--@elvariable id="user" type=""--%>
<form:form action="editSaveUser" method="post" modelAttribute="user" id="drawer-update-product"
           onsubmit="return validateFormEdit();"
           class="fixed  top-0 left-0 z-40 w-full h-screen max-w-3xl p-4 overflow-y-auto transition-transform -translate-x-full bg-white"
           tabindex="-1" aria-labelledby="drawer-update-product-label" aria-hidden="true" >
    <h5 id="drawer-label"
        class="inline-flex items-center mb-6 text-sm font-semibold text-gray-500 uppercase">Actualizar usuario</h5>
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

        <form:hidden path="id_user" id="id_user" class="form-control input-sm"/>

        <div>
            <label for="name" class="block mb-2 text-sm font-medium text-gray-900 ">Nombre</label>
            <form:input type="text" path="name" id="name_edit"
                        class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-black focus:border-black block w-full p-2.5"
                        placeholder="Escribe el nombre del usuario" required="true"/>
        </div>

        <div>
            <label for="ape_pat" class="block mb-2 text-sm font-medium text-gray-900 ">Apellido
                paterno</label>
            <form:input type="text" path="ape_pat" id="ape_pat_edit"
                        class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-black focus:border-black block w-full p-2.5"
                        placeholder="Escribe el apellido paterno" required="true"/>
        </div>

        <div>
            <label for="ape_mat" class="block mb-2 text-sm font-medium text-gray-900 ">Apellido
                materno</label>
            <form:input type="text" path="ape_mat" id="ape_mat_edit"
                        class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-black focus:border-black block w-full p-2.5"
                        placeholder="Escribe el apellido materno" required="true"/>
        </div>

        <div>
            <label for="gender" class="block mb-2 text-sm font-medium text-gray-900 ">Género</label>
            <form:select type="text" path="gender" id="gender_edit"
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
            <form:input type="text" path="email" id="email_edit"
                        class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-black focus:border-black block w-full p-2.5"
                        placeholder="Escribe el correo electrónico" required="true"/>
        </div>

        <div>
            <label for="password" class="block mb-2 text-sm font-medium text-gray-900 ">Contraseña</label>
            <form:input type="text" path="password" id="password_edit"
                        class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-black focus:border-black block w-full p-2.5"
                        placeholder="Escribe la contraseña" required="true"/>
        </div>


        <div>
            <label for="id_doctor" class="block mb-2 text-sm font-medium text-gray-900 ">Doctor</label>
            <form:select type="text" path="id_doctor" id="id_doctor_edit"
                         class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-black focus:border-black block w-full p-2.5">
                <option selected="" value=0>Selecciona el ID del doctor</option>
                <c:forEach var="doctor" items="${listDoctors}">
                    <option value=${doctor.id_doctor}>${doctor.id_doctor}</option>
                </c:forEach>
            </form:select>
        </div>

        <div>
            <label for="id_patient" class="block mb-2 text-sm font-medium text-gray-900 ">Paciente</label>
            <form:select type="text" path="id_patient" id="id_patient_edit"
                         class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-black focus:border-black block w-full p-2.5">
                <option  value=0>Selecciona el ID del paciente</option>
                <c:forEach var="patient" items="${listPatients}">
                    <option value=${patient.id_patient}>${patient.id_patient}</option>
                </c:forEach>
            </form:select>


        </div>


    </div>


    <div class="grid grid-cols-2 gap-4 mt-6 sm:w-1/2">
        <button type="submit"
                class="text-white bg-teal-300 hover:bg-teal-300 focus:ring-4 focus:outline-none focus:ring-teal-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center">
            Actualizar usuario
        </button>
        <a type="button" id="delete_button_2" href=""
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

<script>
    function validateFormEdit() {
        var doctorSelect = document.getElementById("id_doctor_edit");
        var patientSelect = document.getElementById("id_patient_edit");
        var genderSelect = document.getElementById("gender_edit");

        var selectedDoctor = doctorSelect.value;
        var selectedPatient = patientSelect.value;
        var selectedGender = genderSelect.value;

        if (selectedDoctor === "0" && selectedPatient === "0") {
            alert("Tu usuario debe tener al menos un rol");
            return false;
        }

        if (selectedDoctor !== "0" && selectedPatient !== "0") {
            alert("Tu usuario solo puede tener un rol paciente o doctor pero no ambos");
            return false;
        }

        if (selectedGender === "" || selectedGender === "Selecciona un género") {
            alert("No puedes dejar el campo de género vacío");
            return false;
        }

        return true;
    }

</script>

