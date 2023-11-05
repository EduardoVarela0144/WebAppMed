<%
    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String ape_pat = request.getParameter("ape_pat");
    String ape_mat = request.getParameter("ape_mat");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String address = request.getParameter("address");
    String cost = request.getParameter("cost");
    String speciality = request.getParameter("speciality");

%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>


<div class="max-w-sm p-6 bg-white border border-gray-200 rounded-lg shadow h-96">
    <div class="flex-col flex-1 h-1/3">
        <h5 class="text-2xl font-bold tracking-tight text-gray-900">
            <h2 class="font-bold text-2xl text-center"><%= name %> <%= ape_pat %> <%= ape_mat %></h2>
        </h5>
        <p class="text-center italic">Médico especialista en <%= speciality %> </p>
    </div>
    <div class="space-y-2  flex-col flex-1 h-1/3">
        <div>
            <p class="text-gray-700 text-xs"> Correo electrónico </p>
            <p class="text-xs"> <%= email %> </p>
        </div>
        <div>
            <p class="text-gray-700 text-xs"> Número telefónico del consultorio </p>
            <p class="text-xs"> <%= phone %> </p>
        </div>
        <div>
            <p class="text-gray-700 text-xs"> Dirección del consultorio </p>
            <p class="text-xs"> <%= address %> </p>
        </div>
    </div>
    <div class="flex flex-row justify-between items-center  flex-col flex-1 h-1/3">
        <a href="doctor/<%=id%> "
           class="inline-flex items-center px-3 py-2 text-sm font-medium text-center hover:text-white text-white bg-teal-300 rounded-lg hover:bg-teal-400 focus:ring-4 focus:outline-none focus:ring-teal-300 my-4">
            Agendar cita
            <svg class="w-3.5 h-3.5 ml-2" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none"
                 viewBox="0 0 14 10">
                <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                      d="M1 5h12m0 0L9 1m4 4L9 9"></path>
            </svg>
        </a>
        <div>
            <p class="font-normal text-gray-700 text-xs">Precio de la consulta </p>
            <p class="text-center">
                $ <%= cost %> MXN
            </p>
        </div>
    </div>
</div>

