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
                    <div class="row" style="margin-bottom: 5px">
                        <div class="col-sm-4">
                            <%-- <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for names.." title="Type in a name">--%>
                            <asp:TextBox onkeyup="Search_Gridview(this)" placeholder="Search Here....!!" CssClass="form-control col-sm-8" runat="server" />
                        </div>
                        <div class="col-sm-4"></div>
                        <div class="col-sm-4">
                            <a class="btn btn-dark" href="../AdminModule/AddProducts.aspx" style="font-weight: 600; margin-left: 55%;">Add Product <i class="far fa-plus-square fa-lg" style="margin-left: 5px"></i></a>

                        </div>
                    </div>
                    <br />

                    <table class="w-full whitespace-no-wrap" style="overflow-x: scroll; margin-top: -20px" id="myTable">

                        <tbody class="bg-white divide-y dark:divide-gray-700 dark:bg-gray-800">

                            <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                                <HeaderTemplate>


                                    <thead>
                                        <tr class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800">
                                            <th class="px-4 py-3" style="width: 3%; text-align: center">Sl/No</th>
                                            <th class="px-4 py-3" style="width: 15%; text-align: center">Images</th>
                                            <th class="py-3" style="width: 15%; text-align: center">Product Name</th>
                                            <th class="py-3" style="width: 15%; text-align: center">Brand Name</th>
                                            <th class="py-3" style="width: 18%; text-align: center">Product Code</th>
                                            <th class="py-3" style="width: 18%; text-align: center">Products Serial No :</th>
                                            <th class="py-3" style="width: 16%; text-align: center">Manages</th>
                                        </tr>
                                    </thead>

                                </HeaderTemplate>
                                <ItemTemplate>


                                    <tr class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800">
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
                                            <asp:LinkButton ID="btn_delete" runat="server" CommandName="Delete" CommandArgument='<%# Eval("Product_code") %>'><i class="fas fa-trash fa-lg"></i></asp:LinkButton>
                                        </td>
                                    </tr>




                                </ItemTemplate>
                                <FooterTemplate>
                                </FooterTemplate>

                            </asp:Repeater>

                        </tbody>

                    </table>
                    <div style="overflow: hidden;">
                        <asp:Repeater ID="rptPaging" runat="server" OnItemCommand="rptPaging_ItemCommand1">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnPage" CssClass="btn btn-defaut" Style="color:black" CommandName="Page" CommandArgument="<%# Container.DataItem %>" runat="server" ForeColor="White" Font-Bold="True"><%# Container.DataItem %></asp:LinkButton>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                    <div id="exampleModalLive1" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="exampleModalLiveLabel" aria-hidden="true">
                        <div class="modal-dialog modal-xl" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLiveLabel1" style="font-weight: 600; font-size: 15px">Product Details </h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                </div>
                                <div class="modal-body">
                                    <div class="row" style="box-shadow:rgb(128 128 128) 0px 0px 8px 0px;margin-top:-20px">
                                       <div class="col-sm-8">
                                           <div class="row" style="padding-top:20px">
                                        <div class="col-sm-6 mx-auto">
                                            <div class="form-group">
                                                <label class="floating-label" for="password"><b>Product Code:</b></label>
                                                <asp:Label ID="lblproductcode" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="col-sm-6 mx-auto">
                                            <div class="form-group">
                                                <label class="floating-label" for="password"><b>Product Name :</b></label>
                                                <asp:Label ID="lblproductname" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="col-sm-6 mx-auto">
                                            <div class="form-group">
                                                <label class="floating-label" for="password"><b>Brand Name :</b></label>
                                                <asp:Label ID="lblbrandame" runat="server"></asp:Label>
                                            </div>
                                        </div>

                                        <div class="col-sm-6 mx-auto">
                                            <div class="form-group">
                                                <label class="floating-label" for="password"><b>Product HSN Code :</b></label>
                                                <asp:Label ID="lblhsncode" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="col-sm-6 mx-auto">
                                            <div class="form-group">
                                                <label class="floating-label" for="password"><b>Serial No  :</b></label>
                                                <asp:Label ID="lblserialno" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="col-sm-6 mx-auto">
                                            <div class="form-group">
                                                <label class="floating-label" for="password"><b>Product Barcode :</b></label>
                                                <asp:Label ID="lblbarcode" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label class="floating-label" for="password"><b>Product Details:</b></label>
                                                <asp:Label ID="lbldetails" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                     
                                        </div>
                                       
                                           </div>
                                        <div class="col-sm-4">
			
					
					<div class="card-body">
						<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
							<div class="carousel-inner">
								<div class="carousel-item active"> 
									<img class="img-fluid d-block w-100"  runat="server" id="product_image1" height="250" src="#" style="height:250px">
								</div>
								<div class="carousel-item">
									<img class="img-fluid d-block w-100"  runat="server" id="product_image2" height="250" src="#" style="height:250px">
								</div>
                                <div class="carousel-item">
									<img class="img-fluid d-block w-100"  runat="server" id="product_image3" height="250" src="#" style="height:250px">
								</div>
                                <div class="carousel-item">
									<img class="img-fluid d-block w-100"  runat="server" id="product_image4" height="250" src="#" style="height:250px">
								</div>
                                <div class="carousel-item">
									<img class="img-fluid d-block w-100"  runat="server" id="product_image5" height="250" src="#" style="height:250px">
								</div>
                                <div class="carousel-item">
									<img class="img-fluid d-block w-100" runat="server" id="product_image6" height="250" src="#" style="height:250px">
								</div>

							</div>
							<a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev"><span class="carousel-control-prev-icon" aria-hidden="true"></span><span class="sr-only">Previous</span></a>
							<a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next"><span class="carousel-control-next-icon" aria-hidden="true"></span><span class="sr-only">Next</span></a>
						</div>
					</div>
				</div>
		
                                        </div>

                                </div>
                               
                            </div>
                        </div>
                    </div>
                    <div id="exampleModalLive2" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="exampleModalLiveLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLiveLabel2" style="font-weight: 600; font-size: 15px"></h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                </div>
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="col-sm-8 mx-auto">
                                            <div class="form-group">
                                                <img src="assets/images/giphy.gif" height="100" width="100" class="mx-5" />
                                                <asp:Label ID="lblmassege" runat="server" Visible="false"></asp:Label>
                                                <h4 style="font-size: 16px; text-align: center; font-weight: 600">Are you sure you want to delete?</h4>
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


                </div>
            </div>


        </div>

    </main>
    <!DOCTYPE html>



  

    <script type="text/javascript">
        function Search_Gridview(strKey) {
            debugger;
            var strData = strKey.value.toLowerCase().split(" ");
            var tblData = document.getElementById("myTable");
            var rowData;
            for (var i = 1; i < tblData.rows.length; i++) {
                rowData = tblData.rows[i].innerHTML;
                var styleDisplay = 'none';
                for (var j = 0; j < strData.length; j++) {
                    if (rowData.toLowerCase().indexOf(strData[j]) >= 0)
                        styleDisplay = '';
                    else {
                        styleDisplay = 'none';
                        break;
                    }
                }
                tblData.rows[i].style.display = styleDisplay;
            }
        }
    </script>
</asp:Content>
