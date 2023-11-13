<%@page contentType="text/html" pageEncoding="UTF-8" %>
<% String parametro = request.getParameter("page") ;
    if (parametro == null) {
        parametro = "default";
    }
%>

<aside id="logo-sidebar"
       class="fixed top-0 left-0 z-40 w-64 h-screen pt-20 transition-transform -translate-x-full bg-white border-r border-gray-200 sm:translate-x-0"
       aria-label="Sidebar">
    <div class="flex items-center justify-start fixed top-0 w-full p-3">
        <button data-drawer-target="logo-sidebar" data-drawer-toggle="logo-sidebar" aria-controls="logo-sidebar"
                type="button"
                class="inline-flex items-center p-2 text-sm text-gray-500 rounded-lg sm:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200 ">
            <span class="sr-only">Open sidebar</span>
            <svg class="w-6 h-6" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20"
                 xmlns="http://www.w3.org/2000/svg">
                <path clip-rule="evenodd" fill-rule="evenodd"
                      d="M2 4.75A.75.75 0 012.75 4h14.5a.75.75 0 010 1.5H2.75A.75.75 0 012 4.75zm0 10.5a.75.75 0 01.75-.75h7.5a.75.75 0 010 1.5h-7.5a.75.75 0 01-.75-.75zM2 10a.75.75 0 01.75-.75h14.5a.75.75 0 010 1.5H2.75A.75.75 0 012 10z"></path>
            </svg>
        </button>
        <div class="logo"><a href="/eduardo_lpsw-1/home"><img src="<%=request.getContextPath()%>/images/logo.png"></a></div>
    </div>
    <div class="h-full px-3 pb-4 overflow-y-auto bg-white ">

        <ul class="space-y-2 font-medium">
            <li>
                <a href="?page=users"
                   class="flex items-center p-2 <%= parametro.equals("users") ? "text-teal-300" : "text-gray-900" %> rounded-lg  hover:bg-gray-100 hover:text-black ">
                    <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 448 512">
                        <!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                        <path d="M224 256A128 128 0 1 0 224 0a128 128 0 1 0 0 256zm-45.7 48C79.8 304 0 383.8 0 482.3C0 498.7 13.3 512 29.7 512H418.3c16.4 0 29.7-13.3 29.7-29.7C448 383.8 368.2 304 269.7 304H178.3z"/>
                    </svg>
                    <span class="ml-3">Usuarios</span>
                </a>
            </li>
            <li>
                <a href="?page=doctors"
                   class="flex items-center p-2 <%= parametro.equals("doctors") ? "text-teal-300" : "text-gray-900" %> rounded-lg  hover:bg-gray-100 hover:text-black">
                    <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 448 512">
                        <path d="M224 256A128 128 0 1 0 224 0a128 128 0 1 0 0 256zm-96 55.2C54 332.9 0 401.3 0 482.3C0 498.7 13.3 512 29.7 512H418.3c16.4 0 29.7-13.3 29.7-29.7c0-81-54-149.4-128-171.1V362c27.6 7.1 48 32.2 48 62v40c0 8.8-7.2 16-16 16H336c-8.8 0-16-7.2-16-16s7.2-16 16-16V424c0-17.7-14.3-32-32-32s-32 14.3-32 32v24c8.8 0 16 7.2 16 16s-7.2 16-16 16H256c-8.8 0-16-7.2-16-16V424c0-29.8 20.4-54.9 48-62V304.9c-6-.6-12.1-.9-18.3-.9H178.3c-6.2 0-12.3 .3-18.3 .9v65.4c23.1 6.9 40 28.3 40 53.7c0 30.9-25.1 56-56 56s-56-25.1-56-56c0-25.4 16.9-46.8 40-53.7V311.2zM144 448a24 24 0 1 0 0-48 24 24 0 1 0 0 48z"/>
                    </svg>
                    <span class="ml-3">Doctores</span>
                </a>
            </li>
            <li>
                <a href="?page=specialities"
                   class="flex items-center p-2 <%= parametro.equals("specialities") ? "text-teal-300" : "text-gray-900" %> rounded-lg  hover:bg-gray-100  group hover:text-black">
                    <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 576 512">
                        <path d="M142.4 21.9c5.6 16.8-3.5 34.9-20.2 40.5L96 71.1V192c0 53 43 96 96 96s96-43 96-96V71.1l-26.1-8.7c-16.8-5.6-25.8-23.7-20.2-40.5s23.7-25.8 40.5-20.2l26.1 8.7C334.4 19.1 352 43.5 352 71.1V192c0 77.2-54.6 141.6-127.3 156.7C231 404.6 278.4 448 336 448c61.9 0 112-50.1 112-112V265.3c-28.3-12.3-48-40.5-48-73.3c0-44.2 35.8-80 80-80s80 35.8 80 80c0 32.8-19.7 61-48 73.3V336c0 97.2-78.8 176-176 176c-92.9 0-168.9-71.9-175.5-163.1C87.2 334.2 32 269.6 32 192V71.1c0-27.5 17.6-52 43.8-60.7l26.1-8.7c16.8-5.6 34.9 3.5 40.5 20.2zM480 224a32 32 0 1 0 0-64 32 32 0 1 0 0 64z"/>
                    </svg>
                    <span class="flex-1 ml-3 whitespace-nowrap">Especialidades</span>
                </a>
            </li>
            <li>
                <a href="?page=patients"
                   class="flex items-center p-2 <%= parametro.equals("patients") ? "text-teal-300" : "text-gray-900" %> rounded-lg hover:bg-gray-100  group hover:text-black">
                    <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 640 512">
                        <path d="M483.2 9.6L524 64h92c13.3 0 24 10.7 24 24s-10.7 24-24 24H512c-7.6 0-14.7-3.6-19.2-9.6L468.7 70.3l-47 99.9c-3.7 7.8-11.3 13.1-19.9 13.7s-16.9-3.4-21.7-10.6L339.2 112H216c-13.3 0-24-10.7-24-24s10.7-24 24-24H352c8 0 15.5 4 20 10.7l24.4 36.6 45.9-97.5C445.9 6.2 453.2 1 461.6 .1s16.6 2.7 21.6 9.5zM320 160h12.7l20.7 31.1c11.2 16.8 30.6 26.3 50.7 24.8s37.9-13.7 46.5-32L461.9 160H544c53 0 96 43 96 96V480c0 17.7-14.3 32-32 32s-32-14.3-32-32V448H352 320 64v32c0 17.7-14.3 32-32 32s-32-14.3-32-32V96C0 78.3 14.3 64 32 64s32 14.3 32 32V352H288V192c0-17.7 14.3-32 32-32zm-144 0a80 80 0 1 1 0 160 80 80 0 1 1 0-160z"/>
                    </svg>
                    <span class="flex-1 ml-3 whitespace-nowrap">Pacientes</span>
                </a>
            </li>

            <li>
                <a href="?page=appointments"
                   class="flex items-center p-2 <%= parametro.equals("appointments") ? "text-teal-300" : "text-gray-900" %> rounded-lg  hover:bg-gray-100  group hover:text-black">
                    <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 512 512">
                        <path d="M75 75L41 41C25.9 25.9 0 36.6 0 57.9V168c0 13.3 10.7 24 24 24H134.1c21.4 0 32.1-25.9 17-41l-30.8-30.8C155 85.5 203 64 256 64c106 0 192 86 192 192s-86 192-192 192c-40.8 0-78.6-12.7-109.7-34.4c-14.5-10.1-34.4-6.6-44.6 7.9s-6.6 34.4 7.9 44.6C151.2 495 201.7 512 256 512c141.4 0 256-114.6 256-256S397.4 0 256 0C185.3 0 121.3 28.7 75 75zm181 53c-13.3 0-24 10.7-24 24V256c0 6.4 2.5 12.5 7 17l72 72c9.4 9.4 24.6 9.4 33.9 0s9.4-24.6 0-33.9l-65-65V152c0-13.3-10.7-24-24-24z"/>
                    </svg>
                    <span class="flex-1 ml-3 whitespace-nowrap">Citas</span>
                </a>
            </li>
            <li>
                <a href="?page=payments"
                   class="flex items-center p-2 <%= parametro.equals("payments") ? "text-teal-300" : "text-gray-900" %> rounded-lg  hover:bg-gray-100 hover:text-black ">
                    <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 576 512">
                        <path d="M64 64C28.7 64 0 92.7 0 128V384c0 35.3 28.7 64 64 64H512c35.3 0 64-28.7 64-64V128c0-35.3-28.7-64-64-64H64zm64 320H64V320c35.3 0 64 28.7 64 64zM64 192V128h64c0 35.3-28.7 64-64 64zM448 384c0-35.3 28.7-64 64-64v64H448zm64-192c-35.3 0-64-28.7-64-64h64v64zM288 160a96 96 0 1 1 0 192 96 96 0 1 1 0-192z"/>
                    </svg>
                    <span class="flex-1 ml-3 whitespace-nowrap">Pagos de citas</span>
                </a>
            </li>
            <li>
                <a href="?page=schedules"
                   class="flex items-center p-2 <%= parametro.equals("schedules") ? "text-teal-300" : "text-gray-900" %> rounded-lg  hover:bg-gray-100  group hover:text-black">
                    <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 448 512">
                        <path d="M128 0c17.7 0 32 14.3 32 32V64H288V32c0-17.7 14.3-32 32-32s32 14.3 32 32V64h48c26.5 0 48 21.5 48 48v48H0V112C0 85.5 21.5 64 48 64H96V32c0-17.7 14.3-32 32-32zM0 192H448V464c0 26.5-21.5 48-48 48H48c-26.5 0-48-21.5-48-48V192zm64 80v32c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16V272c0-8.8-7.2-16-16-16H80c-8.8 0-16 7.2-16 16zm128 0v32c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16V272c0-8.8-7.2-16-16-16H208c-8.8 0-16 7.2-16 16zm144-16c-8.8 0-16 7.2-16 16v32c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16V272c0-8.8-7.2-16-16-16H336zM64 400v32c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16V400c0-8.8-7.2-16-16-16H80c-8.8 0-16 7.2-16 16zm144-16c-8.8 0-16 7.2-16 16v32c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16V400c0-8.8-7.2-16-16-16H208zm112 16v32c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16V400c0-8.8-7.2-16-16-16H336c-8.8 0-16 7.2-16 16z"/>
                    </svg>
                    <span class="flex-1 ml-3 whitespace-nowrap">Horarios de atención</span>
                </a>
            </li>
            <li>
                <a href="?page=products"
                   class="flex items-center p-2 <%= parametro.equals("products") ? "text-teal-300" : "text-gray-900" %> rounded-lg  hover:bg-gray-100  group hover:text-black">
                    <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 640 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M614.3 247c16.3-25 25.7-54.9 25.7-87C640 71.6 568.4 0 480 0c-32.1 0-61.9 9.4-87 25.7c-7.9 5.2-8.5 16.2-1.8 22.9L591.4 248.8c6.7 6.7 17.8 6.2 22.9-1.8zM567 294.3c7.9-5.2 8.5-16.2 1.8-22.9L368.6 71.2c-6.7-6.7-17.8-6.2-22.9 1.8c-16.3 25-25.7 54.9-25.7 87c0 88.4 71.6 160 160 160c32.1 0 61.9-9.4 87-25.7zM301.5 368H18.5c-9.5 0-16.9 8.2-15 17.5C18.9 457.8 83.1 512 160 512s141.1-54.2 156.5-126.5c2-9.3-5.5-17.5-15-17.5zm0-32c9.5 0 16.9-8.2 15-17.5C301.1 246.2 236.9 192 160 192S18.9 246.2 3.5 318.5c-2 9.3 5.5 17.5 15 17.5H301.5z"/></svg>
                    <span class="flex-1 ml-3 whitespace-nowrap">Medicinas</span>
                </a>
            </li>
            <li class="hidden">
                <a href="?page=path"
                   class="flex items-center p-2 <%= parametro.equals("path") ? "text-teal-300" : "text-gray-900" %> rounded-lg  hover:bg-gray-100  group hover:text-black">
                    <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 512 512">
                        <path d="M75 75L41 41C25.9 25.9 0 36.6 0 57.9V168c0 13.3 10.7 24 24 24H134.1c21.4 0 32.1-25.9 17-41l-30.8-30.8C155 85.5 203 64 256 64c106 0 192 86 192 192s-86 192-192 192c-40.8 0-78.6-12.7-109.7-34.4c-14.5-10.1-34.4-6.6-44.6 7.9s-6.6 34.4 7.9 44.6C151.2 495 201.7 512 256 512c141.4 0 256-114.6 256-256S397.4 0 256 0C185.3 0 121.3 28.7 75 75zm181 53c-13.3 0-24 10.7-24 24V256c0 6.4 2.5 12.5 7 17l72 72c9.4 9.4 24.6 9.4 33.9 0s9.4-24.6 0-33.9l-65-65V152c0-13.3-10.7-24-24-24z"/>
                    </svg>
                    <span class="flex-1 ml-3 whitespace-nowrap">Path</span>
                </a>
            </li>
            <li>
                <a href="logout"
                   class="flex items-center p-2 text-gray-900 rounded-lg hover:bg-gray-100  group hover:text-red-500">
                    <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 512 512">
                        <path d="M377.9 105.9L500.7 228.7c7.2 7.2 11.3 17.1 11.3 27.3s-4.1 20.1-11.3 27.3L377.9 406.1c-6.4 6.4-15 9.9-24 9.9c-18.7 0-33.9-15.2-33.9-33.9l0-62.1-128 0c-17.7 0-32-14.3-32-32l0-64c0-17.7 14.3-32 32-32l128 0 0-62.1c0-18.7 15.2-33.9 33.9-33.9c9 0 17.6 3.6 24 9.9zM160 96L96 96c-17.7 0-32 14.3-32 32l0 256c0 17.7 14.3 32 32 32l64 0c17.7 0 32 14.3 32 32s-14.3 32-32 32l-64 0c-53 0-96-43-96-96L0 128C0 75 43 32 96 32l64 0c17.7 0 32 14.3 32 32s-14.3 32-32 32z"/>
                    </svg>
                    <span class="flex-1 ml-3 whitespace-nowrap">Cerrar sesión</span>
                </a>
            </li>


        </ul>
    </div>
</aside>