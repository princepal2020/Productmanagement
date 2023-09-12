<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ProductsList.aspx.cs" Inherits="Productmanagement.AdminModule.ProductsList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../assets/css/all.css" rel="stylesheet" />
    <link href="../assets/css/tailwind.min.css" rel="stylesheet" />
    <style>
        .list {
            margin-left: 10px !important;
        }

        .next {
            margin-left: 10px !important;
        }

        .pagination {
            margin-left: 40%;
            font-size: 16px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main class="h-full overflow-y-auto">
        <div class="container  grid">
            <!-- New Table -->
            <div class="w-full overflow-hidden rounded-lg shadow-xs py-5">
                <div class="w-full overflow-x-auto">
                    <table class="w-full whitespace-no-wrap" style="overflow-x: scroll; overflow-y: scroll" id="myTable">
                        <tbody class="bg-white divide-y dark:divide-gray-700 dark:bg-gray-800">
                            <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                                <HeaderTemplate>



                                    <tr class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800">
                                        <th class="px-4 py-3" style="width: 3%; text-align: center">Sl/No</th>
                                        <th class="px-4 py-3" style="width: 15%; text-align: center">Images</th>
                                        <th class="py-3" style="width: 15%; text-align: center">Product Name</th>
                                        <th class="py-3" style="width: 15%; text-align: center">Brand Name</th>
                                        <th class="py-3" style="width: 18%; text-align: center">Product Code</th>
                                        <th class="py-3" style="width: 18%; text-align: center">Products Serial No :</th>
                                        <th class="py-3" style="width: 16%; text-align: center">Manages</th>
                                    </tr>


                                </HeaderTemplate>
                                <ItemTemplate>


                                    <tr class="text-gray-700 dark:text-gray-400">
                                        <td class="py-3 text-sm" style="width: 3%; text-align: center">
                                            <asp:Label ID="Label5" runat="server" Text='<%# Container.ItemIndex+1 %>'></asp:Label>
                                        </td>
                                        <td class="px-4 py-3" style="width: 15%; text-align: center">
                                            <div class="flex items-center text-sm">
                                                <!-- Avatar with inset shadow -->
                                                <div class="relative w-12 h-12 mr-3 rounded-full md:block mx-auto">

                                                    <asp:Image ID="pimage1" runat="server" class="object-cover w-full h-full rounded-full mx-auto" ImageUrl='<%# Eval("Product_Image1")%>' alt="" loading="lazy" />
                                                </div>

                                            </div>
                                        </td>
                                        <td class="py-3 text-sm" style="width: 15%; text-align: center">
                                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("Product_Name") %>'></asp:Label>
                                        </td>
                                        <td class="py-3 text-sm" style="width: 15%; text-align: center">
                                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("Brand_Name") %>'></asp:Label>
                                        </td>
                                        <td class="py-3 text-sm" style="width: 16%; text-align: center">
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Product_code") %>'></asp:Label>
                                        </td>
                                        <td class="py-3 text-xs" style="width: 16%; text-align: center">
                                            <span class="px-2 py-1 font-semibold leading-tight text-green-700 bg-green-100 rounded-full dark:bg-green-700 dark:text-green-100">
                                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("Product_serial_No") %>'></asp:Label>
                                            </span>
                                        </td>
                                        <td class="py-3 text-sm" style="width: 16%; text-align: center">
                                            <asp:LinkButton ID="btn_view" runat="server" CommandName="Update" CommandArgument='<%# Eval("Product_code") %>'><i class="fas fa-eye fa-lg"></i></asp:LinkButton>&nbsp;&nbsp;
                                            <asp:LinkButton ID="btn_edit" runat="server" CommandName="Edit" CommandArgument='<%# Eval("Product_code") %>'><i class="fas fa-edit fa-lg"></i></asp:LinkButton>&nbsp;&nbsp;
                                            <asp:LinkButton ID="btn_delete" runat="server" CommandName="Delete" CommandArgument='<%# Eval("Product_code") %>' ><i class="fas fa-trash fa-lg"></i></asp:LinkButton>
                                        </td>
                                    </tr>




                                </ItemTemplate>
                                <FooterTemplate>
                                </FooterTemplate>

                            </asp:Repeater>
                        </tbody>
                    </table>
                    <div id="exampleModalLive1" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="exampleModalLiveLabel" aria-hidden="true">
                        <div class="modal-dialog modal-xl" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLiveLabel1" style="font-weight: 600; font-size: 15px">Product Details </h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                </div>
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="col-sm-4 mx-auto">
                                        <div class="form-group">
                                            <label class="floating-label" for="password">Product Code:</label>
                                            <asp:Label ID="lblproductcode" runat="server" Text="Label"></asp:Label>
                                        </div>
                                    </div>
                                        <div class="col-sm-4 mx-auto">
                                            <div class="form-group">
                                                <label class="floating-label" for="password">Product Name :</label>
                                                <asp:Label ID="lblproductname" runat="server" Text="Label"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="col-sm-4 mx-auto">
                                            <div class="form-group">
                                                <label class="floating-label" for="password">Brand Name :</label>
                                                <asp:Label ID="lblbrandame" runat="server" Text="Label"></asp:Label>
                                            </div>
                                    </div>
                                    
                                         <div class="col-sm-4 mx-auto">
                                        <div class="form-group">
                                            <label class="floating-label" for="password">Product HSN Code :</label>
                                            <asp:Label ID="lblhsncode" runat="server" Text="Label"></asp:Label>
                                        </div>
                                    </div>
                                         <div class="col-sm-4 mx-auto">
                                        <div class="form-group">
                                            <label class="floating-label" for="password">Serial No  :</label>
                                            <asp:Label ID="lblserialno" runat="server" Text="Label"></asp:Label>
                                        </div>
                                    </div>
                                         <div class="col-sm-4 mx-auto">
                                        <div class="form-group">
                                            <label class="floating-label" for="password">Product Barcode :</label>
                                            <asp:Label ID="lblbarcode" runat="server" Text="Label"></asp:Label>
                                        </div>
                                    </div>
                                         <div class="col-sm-4 mx-auto">
                                        <div class="form-group">
                                            <label class="floating-label" for="password">Product Details:</label>
                                            <asp:Label ID="lbldetails" runat="server" Text="Label"></asp:Label>
                                        </div>
                                    </div>
                                         <div class="col-sm-4 mx-auto">
                                        <div class="form-group">
                                            <label class="floating-label" for="password">IGST :</label>
                                            <asp:Label ID="Label13" runat="server" Text="Label"></asp:Label>
                                        </div>
                                    </div>
                                         <div class="col-sm-4 mx-auto">
                                        <div class="form-group">
                                            <label class="floating-label" for="password">IGST :</label>
                                            <asp:Label ID="Label14" runat="server" Text="Label"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                 <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
                    <div id="exampleModalLive2" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="exampleModalLiveLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLiveLabel2" style="font-weight: 600; font-size: 15px"> </h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                </div>
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="col-sm-8 mx-auto">
                                        <div class="form-group">
                                        <img src="assets/images/giphy.gif"  height="100" width="100" class="mx-5" />
                                            <asp:Label ID="lblmassege" runat="server" Visible="false"></asp:Label>
                                            <h4  style="font-size:16px;text-align:center;font-weight:600" >Are you sure you want to delete?</h4>
                                        </div>
                                    </div>
                                       <%-- <div class="col-sm-4 mx-auto">
                                            <div class="form-group">
                                                <label class="floating-label" for="password">Product Name :</label>
                                                <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="col-sm-4 mx-auto">
                                            <div class="form-group">
                                                <label class="floating-label" for="password">Brand Name :</label>
                                                <asp:Label ID="Label8" runat="server" Text="Label"></asp:Label>
                                            </div>
                                    </div>
                                    
                                         <div class="col-sm-4 mx-auto">
                                        <div class="form-group">
                                            <label class="floating-label" for="password">Product HSN Code :</label>
                                            <asp:Label ID="Label9" runat="server" Text="Label"></asp:Label>
                                        </div>
                                    </div>
                                         <div class="col-sm-4 mx-auto">
                                        <div class="form-group">
                                            <label class="floating-label" for="password">Serial No  :</label>
                                            <asp:Label ID="Label10" runat="server" Text="Label"></asp:Label>
                                        </div>
                                    </div>
                                         <div class="col-sm-4 mx-auto">
                                        <div class="form-group">
                                            <label class="floating-label" for="password">Product Barcode :</label>
                                            <asp:Label ID="Label11" runat="server" Text="Label"></asp:Label>
                                        </div>
                                    </div>
                                         <div class="col-sm-4 mx-auto">
                                        <div class="form-group">
                                            <label class="floating-label" for="password">Product Details:</label>
                                            <asp:Label ID="Label12" runat="server" Text="Label"></asp:Label>
                                        </div>
                                    </div>
                                         <div class="col-sm-4 mx-auto">
                                        <div class="form-group">
                                            <label class="floating-label" for="password">IGST :</label>
                                            <asp:Label ID="Label15" runat="server" Text="Label"></asp:Label>
                                        </div>
                                    </div>
                                         <div class="col-sm-4 mx-auto">
                                        <div class="form-group">
                                            <label class="floating-label" for="password">IGST :</label>
                                            <asp:Label ID="Label16" runat="server" Text="Label"></asp:Label>
                                        </div>
                                    </div>--%>
                                </div>
                            </div>
                            <div class="modal-footer">
                                 <button type="button" class="btn btn-dark" data-dismiss="modal">Close</button>
                                <asp:Button ID="btn_delete" OnClick="btn_delete_Click" CssClass="btn btn-danger" runat="server" Text="Delete" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="bottom-field">
                    <ul class="pagination">
                        <li class="prev"><a href="#" id="prev">&#139;</a></li>
                        <!-- page number here -->
                        <li class="next"><a href="#" id="next">&#155;</a></li>
                    </ul>
                </div>

            </div>
        </div>


        </div>

    </main>
    <script>


        var tbody = document.querySelector("tbody");
        var pageUl = document.querySelector(".pagination");
        var itemShow = document.querySelector("#itemperpage");
        var tr = tbody.querySelectorAll("tr");
        var emptyBox = [];
        var index = 1;
        var itemPerPage = 8;

        for (let i = 0; i < tr.length - 1; i++) { emptyBox.push(tr[i]); }


        //function giveTrPerPage() {
        //    itemPerPage = Number(this.value);
        //    // console.log(itemPerPage);
        //    displayPage(itemPerPage);
        //    pageGenerator(itemPerPage);
        //    getpagElement(itemPerPage);
        //}
        //itemShow.onchange = giveTrPerPage;
        debugger
        function displayPage(limit) {
            tbody.innerHTML = '';
            for (let i = 0; i < limit; i++) {
                tbody.appendChild(emptyBox[i]);
            }
            const pageNum = pageUl.querySelectorAll('.list');
            pageNum.forEach(n => n.remove());
        }
        displayPage(itemPerPage);

        function pageGenerator(getem) {
            const num_of_tr = emptyBox.length;
            if (num_of_tr <= getem) {
                pageUl.style.display = 'none';
            } else {
                pageUl.style.display = 'flex';
                const num_Of_Page = Math.ceil(num_of_tr / getem);
                for (i = 1; i <= num_Of_Page; i++) {
                    const li = document.createElement('li'); li.className = 'list';
                    const a = document.createElement('a'); a.href = '#'; a.innerText = i;
                    a.setAttribute('data-page', i);
                    li.appendChild(a);
                    pageUl.insertBefore(li, pageUl.querySelector('.next'));
                }
            }
        }
        debugger
        pageGenerator(itemPerPage);
        let pageLink = pageUl.querySelectorAll("a");
        let lastPage = pageLink.length - 2;

        function pageRunner(page, items, lastPage, active) {
            for (button of page) {
                button.onclick = e => {
                    const page_num = e.target.getAttribute('data-page');
                    const page_mover = e.target.getAttribute('id');
                    if (page_num != null) {
                        index = page_num;

                    } else {
                        if (page_mover === "next") {
                            index++;
                            if (index >= lastPage) {
                                index = lastPage;
                            }
                        } else {
                            index--;
                            if (index <= 1) {
                                index = 1;
                            }
                        }
                    }
                    pageMaker(index, items, active);
                }
            }

        }
        var pageLi = pageUl.querySelectorAll('.list'); pageLi[0].classList.add("active");
        pageRunner(pageLink, itemPerPage, lastPage, pageLi);

        function getpagElement(val) {
            let pagelink = pageUl.querySelectorAll("a");
            let lastpage = pagelink.length - 2;
            let pageli = pageUl.querySelectorAll('.list');
            pageli[0].classList.add("active");
            pageRunner(pagelink, val, lastpage, pageli);

        }



        function pageMaker(index, item_per_page, activePage) {
            const start = item_per_page * index;
            const end = start + item_per_page;
            const current_page = emptyBox.slice((start - item_per_page), (end - item_per_page));
            tbody.innerHTML = "";
            for (let j = 0; j < current_page.length; j++) {
                let item = current_page[j];
                tbody.appendChild(item);
            }
            Array.from(activePage).forEach((e) => { e.classList.remove("active"); });
            activePage[index - 1].classList.add("active");
        }





        // search content
        //var search = document.getElementById("search");
        //search.onkeyup = e => {
        //    const text = e.target.value;
        //    for (let i = 0; i < tr.length; i++) {
        //        const matchText = tr[i].querySelectorAll("td")[2].innerText;
        //        if (matchText.toLowerCase().indexOf(text.toLowerCase()) > -1) {
        //            tr[i].style.visibility = "visible";
        //        } else {
        //            tr[i].style.visibility = "collapse";
        //        }
        //    }
        //}
    </script>
</asp:Content>
