<%@ Page Title="" Language="C#" MasterPageFile="~/SallerPanel/SallerMaster.Master" AutoEventWireup="true" CodeBehind="ProductSellList.aspx.cs" Inherits="Productmanagement.SallerPanel.ProductSellList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../assets/css/all.css" rel="stylesheet" />
    <link href="../assets/css/tailwind.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main class="h-full overflow-y-auto">
        <div class="container  grid">
            <!-- New Table -->
            <div class="w-full overflow-hidden rounded-lg shadow-xs py-5">
                <div class="w-full">
                    <h6 class="card-title text-bold">Product Selling List </h6>
                    <div class="row">
                        <div class="col-sm-4 py-1">
                            <asp:TextBox placeholder="Search Here....!!" CssClass="form-control " ID="txtsearch" AutoPostBack="true" runat="server" />
                        </div>
                        <div class="col-sm-4">
                            <asp:Button ID="btn_search" runat="server" CssClass="btn btn-primary" Text="Search" />
                        </div>
                    </div>
                    <div class="table-responsive" style="overflow-x: scroll">
                        <table class="datatable table table-stripped">
                            <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                                <HeaderTemplate>
                                    <thead>
                                        <tr class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800">
                                            <th>Sl/No</th>
                                            <th>Product Image </th>
                                            <th>Product Code</th>
                                            <th>Brand Name</th>

                                            <th>MRP</th>

                                            <th>Price</th>
                                            <th>Discount</th>


                                            <th>Product Details</th>
                                            <th>Catogery</th>



                                            <th>Sub Catogery</th>
                                            <th>Size </th>
                                            <th>Sell
                                            </th>
                                        </tr>
                                    </thead>
                                </HeaderTemplate>


                                <ItemTemplate>
                                    <tbody>
                                        <tr class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800">
                                            <td>
                                                <asp:Label ID="Label3" runat="server" Text='<%# Container.ItemIndex+1 %>'></asp:Label></td>
                                            <td>
                                                <asp:Image ID="pimage1" runat="server" Height="50" Width="50" Style="border-radius: 100%" class="object-cover w-full h-full rounded-full mx-auto" ImageUrl='<%# Eval("Product_Image1")%>' alt="" loading="lazy" />

                                            </td>
                                            <td>

                                                <asp:Label ID="lblproduct_code" runat="server" Text='<%# Eval("ProductCode") %>'></asp:Label>
                                                <asp:Label ID="lblstockId" Visible="false" runat="server" Text='<%# Eval("SellerStockid") %>'></asp:Label>

                                            </td>

                                            <td>
                                                <asp:Label ID="lblbrand" runat="server" Text='<%# Eval("BrandName") %>'></asp:Label>
                                                <asp:Label ID="lblquantity" runat="server" Visible="false" Text='<%# Eval("Quantity") %>'></asp:Label>
                                            </td>

                                            <td>
                                                <asp:Label ID="lblmrp" runat="server" Text='<%# string.Format("{0:n2}", Eval("MRP"))%>'></asp:Label>
                                            </td>

                                            <td>
                                                <asp:Label ID="lblsell" runat="server" Text='<%# string.Format("{0:n2}", Eval("Sell_Price"))%>'></asp:Label>&nbsp;&nbsp;
                                            </td>

                                            <td>
                                                <asp:Label ID="lbldiscount" runat="server" Text='<%# string.Format("{0:n2}", Eval("Sdiscount"))%>'></asp:Label>&nbsp;&nbsp;
                                            </td>
                                            <td>
                                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("Product_details") %>'></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("CatogeryName") %>'></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="Label6" runat="server" Text='<%# Eval("SubCatogeryName") %>'></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("SizeName") %>'></asp:Label>
                                            </td>
                                            <td>
                                                <asp:LinkButton ID="btn_reorder" runat="server" CssClass="btn btn-success" CommandName="Sell" CommandArgument='<%# Eval("Stockid") %>'> Sell </asp:LinkButton>
                                            </td>

                                        </tr>
                                    </tbody>
                                </ItemTemplate>



                            </asp:Repeater>
                        </table>
                        <div style="overflow: hidden;">
                            <asp:Repeater ID="rptPaging" runat="server" OnItemCommand="rptPaging_ItemCommand1">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnPage" CssClass="btn btn-defaut" Style="color: black" CommandName="Page" CommandArgument="<%# Container.DataItem %>" runat="server" ForeColor="White" Font-Bold="True"><%# Container.DataItem %></asp:LinkButton>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="myModal" class="modal fade" role="dialog">
                                    <div class="modal-dialog">
                                        <div class="modal-content" style="border-radius: 5px 5px; margin-top: 10rem">
                                            <!-- Modal content goes here -->
                                            <img src="../AdminModule/assets/images/ezgif-1-272e67e4b5.gif" />
                                            <h1 style="text-align: center; font-weight: 600; font-size: 25px; margin-top: -50px">Good job!</h1>
                                            <%-- <i class="fa-solid fa-circle-check fa-beat fa-2xl" style="color: #70c021";></i>--%>
                                            <h6 style="text-align: center; font-weight: 400; font-size: 18px; margin-top: 15px" runat="server" id="txtmassage"></h6>
                                            <button type="button" style="" class="btn btn-dark mx-auto mt-4" id="btn_ok" data-dismiss="modal">Ok</button>
                                            <br />
                                        </div>
                                    </div>
                                </div>
                                <div id="myModal1" class="modal fade" role="dialog">
                                    <div class="modal-dialog">
                                        <div class="modal-content" style="border-radius: 5px 5px; margin-top: 10rem">
                                            <!-- Modal content goes here -->
                                            <img src="../AdminModule/assets/images/Error3.gif" />
                                            <h1 style="text-align: center; font-weight: 600; font-size: 25px; margin-top: -50px">Oops!!</h1>
                                            <%-- <i class="fa-solid fa-circle-check fa-beat fa-2xl" style="color: #70c021";></i>--%>
                                            <h6 runat="server" id="hmassage" style="text-align:  center; font-weight: 400; font-size: 18px; margin-top: 15px">Somthing is wrong</h6>
                                            <button type="button" style="" class="btn btn-dark mx-auto mt-4" data-dismiss="modal">Ok</button>
                                            <br />
                                        </div>
                                    </div>
                                </div>
        <div id="exampleModalLive" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="exampleModalLiveLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header" style="background-color:#343a40">
                                                <h5 class="modal-title" id="exampleModalLiveLabel" style="font-weight: 600; font-size: 15px;color:white">Customer Details:</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" style="color:white">&times;</span></button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="row">
                                                    <div class="col-sm-10 mx-auto">
                                                        <div class="form-group">
                                                            
                                                            <asp:Label ID="lblstockid" Visible="false" runat="server" CssClass="form-control"></asp:Label>
                                                        </div>
                                                    </div>
                                                 
                                                    <div class="col-sm-10 mx-auto">
                                                        <div class="form-group">
                                                            <label class="floating-label" for="password">Product Code</label>
                                                            <asp:Label ID="txtproductcode"   runat="server" CssClass="form-control"></asp:Label>
                                                           
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-10 mx-auto">
                                                        <div class="form-group">
                                                            <label class="floating-label" for="password">Name :</label>
                                                 
                                                                 <asp:TextBox ID="txtname"       class="form-control" placeholder="" runat="server">
                                                            </asp:TextBox>
                                                            
                                                         
                                                           
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-10 mx-auto">
                                                        <div class="form-group">

                                                            <label class="floating-label" for="password">Mobile No :</label>
                                                            <asp:TextBox ID="txtmobile"  MaxLength="10" onkeypress="return number(event)" class="form-control" placeholder="" runat="server"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-10 mx-auto">
                                                        <div class="form-group">

                                                            <label class="floating-label" for="password">Quantity :</label>
                                                            <asp:TextBox ID="txtquantity" TextMode="Number" class="form-control" placeholder="" runat="server"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>



                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn  btn-danger" data-dismiss="modal">Cencel</button>
                                                <asp:Button ID="btn_submit"  Text="Submit" OnClick="btn_submit_Click" runat="server"  class="btn  btn-success"></asp:Button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
    </main>
    <script>
        function number(e) {
            isIE = document.all ? 1 : 0;
            keyEntry = !isIE ? e.which : event.keyCode;
            // Allow digits (0-9), the decimal point (.), and the minus sign (-)
            if (
                (keyEntry >= 48 && keyEntry <= 57) || // Digits 0-9
                keyEntry === 46 || // Decimal point (.)
                (keyEntry === 45 && e.target.value.indexOf('-') === -1 && e.target.selectionStart === 0) // Minus sign (-) at the beginning
            ) {
                return true;
            } else {
                e.preventDefault();
                return false;
            }
        }
    </script>
</asp:Content>
