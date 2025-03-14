﻿<%@ Page Title="" Language="C#" MasterPageFile="~/SallerPanel/SallerMaster.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="SallerPanel.SallerPanel.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <link href="../assets/css/all.css" rel="stylesheet" />
    <link href="../assets/css/tailwind.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main class="h-full overflow-y-auto">
                <div class="container px-6 mx-auto grid">
                    <h2 class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200">
                        Dashboard
                    </h2>
                    <!-- CTA -->
                
                    <!-- Cards -->
                     <div class="flex flex-col md:flex-row">
                          <div class="main-content flex-1 bg-gray-100 mt-12 md:mt-2 pb-24 md:pb-5">
                       <div class="flex flex-wrap">
                <div class="w-full md:w-1/2 xl:w-1/3 p-6">
                    <!--Metric Card-->
                    <div class="bg-gradient-to-b from-green-200 to-green-100 border-b-4 border-green-600 rounded-lg shadow-xl p-5">
                        <div class="flex flex-row items-center">
                            <div class="flex-shrink pr-4">
                                <div class="rounded-full p-5 bg-green-600"><i class="fa fa-user-plus fa-2x fa-inverse"></i></div>
                            </div>
                            <div class="flex-1 text-right md:text-center">
                                <h5 class="font-bold uppercase text-gray-600">Total Customers</h5>
                                <h3 class="font-bold text-3xl" runat="server" id="totalcustomer"> 0<span class="text-green-500"><i class="fas fa-caret-up"></i></span></h3>
                            </div>
                        </div>
                    </div>
                    <!--/Metric Card-->
                </div>
               
                <div class="w-full md:w-1/2 xl:w-1/3 p-6">
                    <!--Metric Card-->
                    <div class="bg-gradient-to-b from-yellow-200 to-yellow-100 border-b-4 border-yellow-600 rounded-lg shadow-xl p-5">
                        <div class="flex flex-row items-center">
                            <div class="flex-shrink pr-4">
                                <div class="rounded-full p-5 bg-yellow-600"><i class="fas fa-cart-plus fa-2x fa-inverse"></i></div>
                            </div>
                            <div class="flex-1 text-right md:text-center">
                                <h5 class="font-bold uppercase text-gray-600">Total Sell</h5>
                                <h3 class="font-bold text-3xl" runat="server" id="totalsell">0 <span class="text-yellow-600"><i class="fas fa-caret-up"></i></span></h3>
                            </div>
                        </div>
                    </div>
                    <!--/Metric Card-->
                </div>
                <div class="w-full md:w-1/2 xl:w-1/3 p-6">
                    <!--Metric Card-->
                    <div class="bg-gradient-to-b from-blue-200 to-blue-100 border-b-4 border-blue-500 rounded-lg shadow-xl p-5">
                        <div class="flex flex-row items-center">
                            <div class="flex-shrink pr-4">
                                <div class="rounded-full p-5 bg-blue-600"><i class="fas fa-server fa-2x fa-inverse"></i></div>
                            </div>
                            <div class="flex-1 text-right md:text-center">
                                <h5 class="font-bold uppercase text-gray-600">Total Items</h5>
                                <h3 class="font-bold text-3xl"  runat="server" id="totalitem">0 </h3>
                            </div>
                        </div>
                    </div>
                    <!--/Metric Card-->
                </div>
            <%--    <div class="w-full md:w-1/2 xl:w-1/3 p-6">
                    <!--Metric Card-->
                    <div class="bg-gradient-to-b from-indigo-200 to-indigo-100 border-b-4 border-indigo-500 rounded-lg shadow-xl p-5">
                        <div class="flex flex-row items-center">
                            <div class="flex-shrink pr-4">
                                <div class="rounded-full p-5 bg-indigo-600"><i class="fas fa-tasks fa-2x fa-inverse"></i></div>
                            </div>
                            <div class="flex-1 text-right md:text-center">
                                <h5 class="font-bold uppercase text-gray-600">To Do List</h5>
                                <h3 class="font-bold text-3xl">7 tasks</h3>
                            </div>
                        </div>
                    </div>
                    <!--/Metric Card-->
                </div>
                <div class="w-full md:w-1/2 xl:w-1/3 p-6">
                    <!--Metric Card-->
                    <div class="bg-gradient-to-b from-red-200 to-red-100 border-b-4 border-red-500 rounded-lg shadow-xl p-5">
                        <div class="flex flex-row items-center">
                            <div class="flex-shrink pr-4">
                                <div class="rounded-full p-5 bg-red-600"><i class="fas fa-inbox fa-2x fa-inverse"></i></div>
                            </div>
                            <div class="flex-1 text-right md:text-center">
                                <h5 class="font-bold uppercase text-gray-600">Issues</h5>
                                <h3 class="font-bold text-3xl">3 <span class="text-red-500"><i class="fas fa-caret-up"></i></span></h3>
                            </div>
                        </div>
                    </div>
                    <!--/Metric Card-->
                </div>
                            <div class="w-full md:w-1/2 xl:w-1/3 p-6">
                    <!--Metric Card-->
                    <div class="bg-gradient-to-b from-pink-200 to-pink-100 border-b-4 border-pink-500 rounded-lg shadow-xl p-5">
                        <div class="flex flex-row items-center">
                            <div class="flex-shrink pr-4">
                                <div class="rounded-full p-5 bg-pink-600"><i class="fas fa-users fa-2x fa-inverse"></i></div>
                            </div>
                            <div class="flex-1 text-right md:text-center">
                                <h5 class="font-bold uppercase text-gray-600">Total Supplier </h5>
                                <h3 class="font-bold text-3xl">249 <span class="text-pink-500"><i class="fas fa-exchange-alt"></i></span></h3>
                            </div>
                        </div>
                    </div>
                    <!--/Metric Card-->
                </div>--%>
            </div>
                              </div>
                         </div>
                    
                  
                    <!-- New Table -->
                    <div class="w-full overflow-hidden rounded-lg shadow-xs">
                        <div class="w-full overflow-x-auto">
                            <table class="w-full whitespace-no-wrap">
                                <thead>
                                    <tr class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800">
                                        <th class="px-4 py-3">Client</th>
                                        <th class="px-4 py-3">Amount</th>
                                        <th class="px-4 py-3">Status</th>
                                        <th class="px-4 py-3">Date</th>
                                    </tr>
                                </thead>
                                <tbody class="bg-white divide-y dark:divide-gray-700 dark:bg-gray-800">
                                    <tr class="text-gray-700 dark:text-gray-400">
                                        <td class="px-4 py-3">
                                            <div class="flex items-center text-sm">
                                                <!-- Avatar with inset shadow -->
                                                <div class="relative hidden w-8 h-8 mr-3 rounded-full md:block">
                                                    <img class="object-cover w-full h-full rounded-full"
                                                         src="https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&ixid=eyJhcHBfaWQiOjE3Nzg0fQ"
                                                         alt=""
                                                         loading="lazy" />
                                                    <div class="absolute inset-0 rounded-full shadow-inner"
                                                         aria-hidden="true"></div>
                                                </div>
                                                <div>
                                                    <p class="font-semibold">Hans Burger</p>
                                                    <p class="text-xs text-gray-600 dark:text-gray-400">
                                                        10x Developer
                                                    </p>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="px-4 py-3 text-sm">
                                            $ 863.45
                                        </td>
                                        <td class="px-4 py-3 text-xs">
                                            <span class="px-2 py-1 font-semibold leading-tight text-green-700 bg-green-100 rounded-full dark:bg-green-700 dark:text-green-100">
                                                Approved
                                            </span>
                                        </td>
                                        <td class="px-4 py-3 text-sm">
                                            6/10/2020
                                        </td>
                                    </tr>

                                    <tr class="text-gray-700 dark:text-gray-400">
                                        <td class="px-4 py-3">
                                            <div class="flex items-center text-sm">
                                                <!-- Avatar with inset shadow -->
                                                <div class="relative hidden w-8 h-8 mr-3 rounded-full md:block">
                                                    <img class="object-cover w-full h-full rounded-full"
                                                         src="https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&facepad=3&fit=facearea&s=707b9c33066bf8808c934c8ab394dff6"
                                                         alt=""
                                                         loading="lazy" />
                                                    <div class="absolute inset-0 rounded-full shadow-inner"
                                                         aria-hidden="true"></div>
                                                </div>
                                                <div>
                                                    <p class="font-semibold">Jolina Angelie</p>
                                                    <p class="text-xs text-gray-600 dark:text-gray-400">
                                                        Unemployed
                                                    </p>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="px-4 py-3 text-sm">
                                            $ 369.95
                                        </td>
                                        <td class="px-4 py-3 text-xs">
                                            <span class="px-2 py-1 font-semibold leading-tight text-orange-700 bg-orange-100 rounded-full dark:text-white dark:bg-orange-600">
                                                Pending
                                            </span>
                                        </td>
                                        <td class="px-4 py-3 text-sm">
                                            6/10/2020
                                        </td>
                                    </tr>

                                    <tr class="text-gray-700 dark:text-gray-400">
                                        <td class="px-4 py-3">
                                            <div class="flex items-center text-sm">
                                                <!-- Avatar with inset shadow -->
                                                <div class="relative hidden w-8 h-8 mr-3 rounded-full md:block">
                                                    <img class="object-cover w-full h-full rounded-full"
                                                         src="https://images.unsplash.com/photo-1551069613-1904dbdcda11?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&ixid=eyJhcHBfaWQiOjE3Nzg0fQ"
                                                         alt=""
                                                         loading="lazy" />
                                                    <div class="absolute inset-0 rounded-full shadow-inner"
                                                         aria-hidden="true"></div>
                                                </div>
                                                <div>
                                                    <p class="font-semibold">Sarah Curry</p>
                                                    <p class="text-xs text-gray-600 dark:text-gray-400">
                                                        Designer
                                                    </p>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="px-4 py-3 text-sm">
                                            $ 86.00
                                        </td>
                                        <td class="px-4 py-3 text-xs">
                                            <span class="px-2 py-1 font-semibold leading-tight text-red-700 bg-red-100 rounded-full dark:text-red-100 dark:bg-red-700">
                                                Denied
                                            </span>
                                        </td>
                                        <td class="px-4 py-3 text-sm">
                                            6/10/2020
                                        </td>
                                    </tr>

                                    <tr class="text-gray-700 dark:text-gray-400">
                                        <td class="px-4 py-3">
                                            <div class="flex items-center text-sm">
                                                <!-- Avatar with inset shadow -->
                                                <div class="relative hidden w-8 h-8 mr-3 rounded-full md:block">
                                                    <img class="object-cover w-full h-full rounded-full"
                                                         src="https://images.unsplash.com/photo-1551006917-3b4c078c47c9?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&ixid=eyJhcHBfaWQiOjE3Nzg0fQ"
                                                         alt=""
                                                         loading="lazy" />
                                                    <div class="absolute inset-0 rounded-full shadow-inner"
                                                         aria-hidden="true"></div>
                                                </div>
                                                <div>
                                                    <p class="font-semibold">Rulia Joberts</p>
                                                    <p class="text-xs text-gray-600 dark:text-gray-400">
                                                        Actress
                                                    </p>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="px-4 py-3 text-sm">
                                            $ 1276.45
                                        </td>
                                        <td class="px-4 py-3 text-xs">
                                            <span class="px-2 py-1 font-semibold leading-tight text-green-700 bg-green-100 rounded-full dark:bg-green-700 dark:text-green-100">
                                                Approved
                                            </span>
                                        </td>
                                        <td class="px-4 py-3 text-sm">
                                            6/10/2020
                                        </td>
                                    </tr>

                                    <tr class="text-gray-700 dark:text-gray-400">
                                        <td class="px-4 py-3">
                                            <div class="flex items-center text-sm">
                                                <!-- Avatar with inset shadow -->
                                                <div class="relative hidden w-8 h-8 mr-3 rounded-full md:block">
                                                    <img class="object-cover w-full h-full rounded-full"
                                                         src="https://images.unsplash.com/photo-1546456073-6712f79251bb?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&ixid=eyJhcHBfaWQiOjE3Nzg0fQ"
                                                         alt=""
                                                         loading="lazy" />
                                                    <div class="absolute inset-0 rounded-full shadow-inner"
                                                         aria-hidden="true"></div>
                                                </div>
                                                <div>
                                                    <p class="font-semibold">Wenzel Dashington</p>
                                                    <p class="text-xs text-gray-600 dark:text-gray-400">
                                                        Actor
                                                    </p>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="px-4 py-3 text-sm">
                                            $ 863.45
                                        </td>
                                        <td class="px-4 py-3 text-xs">
                                            <span class="px-2 py-1 font-semibold leading-tight text-gray-700 bg-gray-100 rounded-full dark:text-gray-100 dark:bg-gray-700">
                                                Expired
                                            </span>
                                        </td>
                                        <td class="px-4 py-3 text-sm">
                                            6/10/2020
                                        </td>
                                    </tr>

                                    <tr class="text-gray-700 dark:text-gray-400">
                                        <td class="px-4 py-3">
                                            <div class="flex items-center text-sm">
                                                <!-- Avatar with inset shadow -->
                                                <div class="relative hidden w-8 h-8 mr-3 rounded-full md:block">
                                                    <img class="object-cover w-full h-full rounded-full"
                                                         src="https://images.unsplash.com/photo-1502720705749-871143f0e671?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&s=b8377ca9f985d80264279f277f3a67f5"
                                                         alt=""
                                                         loading="lazy" />
                                                    <div class="absolute inset-0 rounded-full shadow-inner"
                                                         aria-hidden="true"></div>
                                                </div>
                                                <div>
                                                    <p class="font-semibold">Dave Li</p>
                                                    <p class="text-xs text-gray-600 dark:text-gray-400">
                                                        Influencer
                                                    </p>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="px-4 py-3 text-sm">
                                            $ 863.45
                                        </td>
                                        <td class="px-4 py-3 text-xs">
                                            <span class="px-2 py-1 font-semibold leading-tight text-green-700 bg-green-100 rounded-full dark:bg-green-700 dark:text-green-100">
                                                Approved
                                            </span>
                                        </td>
                                        <td class="px-4 py-3 text-sm">
                                            6/10/2020
                                        </td>
                                    </tr>

                                    <tr class="text-gray-700 dark:text-gray-400">
                                        <td class="px-4 py-3">
                                            <div class="flex items-center text-sm">
                                                <!-- Avatar with inset shadow -->
                                                <div class="relative hidden w-8 h-8 mr-3 rounded-full md:block">
                                                    <img class="object-cover w-full h-full rounded-full"
                                                         src="https://images.unsplash.com/photo-1531746020798-e6953c6e8e04?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&ixid=eyJhcHBfaWQiOjE3Nzg0fQ"
                                                         alt=""
                                                         loading="lazy" />
                                                    <div class="absolute inset-0 rounded-full shadow-inner"
                                                         aria-hidden="true"></div>
                                                </div>
                                                <div>
                                                    <p class="font-semibold">Maria Ramovic</p>
                                                    <p class="text-xs text-gray-600 dark:text-gray-400">
                                                        Runner
                                                    </p>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="px-4 py-3 text-sm">
                                            $ 863.45
                                        </td>
                                        <td class="px-4 py-3 text-xs">
                                            <span class="px-2 py-1 font-semibold leading-tight text-green-700 bg-green-100 rounded-full dark:bg-green-700 dark:text-green-100">
                                                Approved
                                            </span>
                                        </td>
                                        <td class="px-4 py-3 text-sm">
                                            6/10/2020
                                        </td>
                                    </tr>

                                    <tr class="text-gray-700 dark:text-gray-400">
                                        <td class="px-4 py-3">
                                            <div class="flex items-center text-sm">
                                                <!-- Avatar with inset shadow -->
                                                <div class="relative hidden w-8 h-8 mr-3 rounded-full md:block">
                                                    <img class="object-cover w-full h-full rounded-full"
                                                         src="https://images.unsplash.com/photo-1566411520896-01e7ca4726af?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&ixid=eyJhcHBfaWQiOjE3Nzg0fQ"
                                                         alt=""
                                                         loading="lazy" />
                                                    <div class="absolute inset-0 rounded-full shadow-inner"
                                                         aria-hidden="true"></div>
                                                </div>
                                                <div>
                                                    <p class="font-semibold">Hitney Wouston</p>
                                                    <p class="text-xs text-gray-600 dark:text-gray-400">
                                                        Singer
                                                    </p>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="px-4 py-3 text-sm">
                                            $ 863.45
                                        </td>
                                        <td class="px-4 py-3 text-xs">
                                            <span class="px-2 py-1 font-semibold leading-tight text-green-700 bg-green-100 rounded-full dark:bg-green-700 dark:text-green-100">
                                                Approved
                                            </span>
                                        </td>
                                        <td class="px-4 py-3 text-sm">
                                            6/10/2020
                                        </td>
                                    </tr>

                                    <tr class="text-gray-700 dark:text-gray-400">
                                        <td class="px-4 py-3">
                                            <div class="flex items-center text-sm">
                                                <!-- Avatar with inset shadow -->
                                                <div class="relative hidden w-8 h-8 mr-3 rounded-full md:block">
                                                    <img class="object-cover w-full h-full rounded-full"
                                                         src="https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&ixid=eyJhcHBfaWQiOjE3Nzg0fQ"
                                                         alt=""
                                                         loading="lazy" />
                                                    <div class="absolute inset-0 rounded-full shadow-inner"
                                                         aria-hidden="true"></div>
                                                </div>
                                                <div>
                                                    <p class="font-semibold">Hans Burger</p>
                                                    <p class="text-xs text-gray-600 dark:text-gray-400">
                                                        10x Developer
                                                    </p>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="px-4 py-3 text-sm">
                                            $ 863.45
                                        </td>
                                        <td class="px-4 py-3 text-xs">
                                            <span class="px-2 py-1 font-semibold leading-tight text-green-700 bg-green-100 rounded-full dark:bg-green-700 dark:text-green-100">
                                                Approved
                                            </span>
                                        </td>
                                        <td class="px-4 py-3 text-sm">
                                            6/10/2020
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="grid px-4 py-3 text-xs font-semibold tracking-wide text-gray-500 uppercase border-t dark:border-gray-700 bg-gray-50 sm:grid-cols-9 dark:text-gray-400 dark:bg-gray-800">
                            <span class="flex items-center col-span-3">
                                Showing 21-30 of 100
                            </span>
                            <span class="col-span-2"></span>
                            <!-- Pagination -->
                            
                        </div>
                    </div>

                    <!-- Charts -->
                    <h2 class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200">
                        Charts
                    </h2>
                    <div class="grid gap-6 mb-8 md:grid-cols-2">
                        <div class="min-w-0 p-4 bg-white rounded-lg shadow-xs dark:bg-gray-800">
                            <h4 class="mb-4 font-semibold text-gray-800 dark:text-gray-300">
                                Revenue
                            </h4>
                            <canvas id="pie"></canvas>
                            <div class="flex justify-center mt-4 space-x-3 text-sm text-gray-600 dark:text-gray-400">
                                <!-- Chart legend -->
                                <div class="flex items-center">
                                    <span class="inline-block w-3 h-3 mr-1 bg-blue-500 rounded-full"></span>
                                    <span>Shirts</span>
                                </div>
                                <div class="flex items-center">
                                    <span class="inline-block w-3 h-3 mr-1 bg-teal-600 rounded-full"></span>
                                    <span>Shoes</span>
                                </div>
                                <div class="flex items-center">
                                    <span class="inline-block w-3 h-3 mr-1 bg-purple-600 rounded-full"></span>
                                    <span>Bags</span>
                                </div>
                            </div>
                        </div>
                        <div class="min-w-0 p-4 bg-white rounded-lg shadow-xs dark:bg-gray-800">
                            <h4 class="mb-4 font-semibold text-gray-800 dark:text-gray-300">
                                Traffic
                            </h4>
                            <canvas id="line"></canvas>
                            <div class="flex justify-center mt-4 space-x-3 text-sm text-gray-600 dark:text-gray-400">
                                <!-- Chart legend -->
                                <div class="flex items-center">
                                    <span class="inline-block w-3 h-3 mr-1 bg-teal-600 rounded-full"></span>
                                    <span>Organic</span>
                                </div>
                                <div class="flex items-center">
                                    <span class="inline-block w-3 h-3 mr-1 bg-purple-600 rounded-full"></span>
                                    <span>Paid</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
</asp:Content>
