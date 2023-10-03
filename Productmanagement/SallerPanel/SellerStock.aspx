<%@ Page Title="" Language="C#" MasterPageFile="~/SallerPanel/SallerMaster.Master" AutoEventWireup="true" CodeBehind="SellerStock.aspx.cs" Inherits="Productmanagement.SallerPanel.SellerStock" %>

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
                    <h6 class="card-title text-bold">Stock  List</h6>
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
                                            <th>Quantity</th>
                                            <th>MRP</th>
                                            <th>Purchase Price</th>
                                            <th>Fixed Sell Price</th>
                                            <th>HSN Code</th>
                                            <th>Serial_No</th>
                                            <th>Product Details</th>
                                            <th>Catogery</th>



                                            <th>Sub Catogery</th>
                                            <th>Size </th>
                                            <th>
                                                 ReOrder 
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

                                                <asp:Label ID="lblproduct_name" runat="server" Text='<%# Eval("ProductCode") %>'></asp:Label>

                                            </td>
                                           
                                            <td>
                                                <asp:Label ID="lblbrand" runat="server" Text='<%# Eval("BrandName") %>'></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label>
                                            </td>
                                               <td>
                                                <asp:Label ID="lblmrp" runat="server" Text='<%# string.Format("{0:n2}", Eval("MRP"))%>'></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblprice" runat="server" Text='<%# string.Format("{0:n2}", Eval("Price"))%>'></asp:Label>
                                            </td>
                                             <td>
                                                <asp:Label ID="lblsell" runat="server" Text='<%# string.Format("{0:n2}", Eval("Sell_Price"))%>'></asp:Label>&nbsp;&nbsp;
                                                 <asp:LinkButton ID="btn_SetSellPrice" CommandArgument='<%# Eval("SellerStockid") %>' CommandName="profit" runat="server" CssClass="fa fa-edit"></asp:LinkButton>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblstatus" Style="border-radius: 3px 4px; text-align: center;" runat="server" Text='<%#  Eval("Product_HSN_ode")%>'></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblproducts" runat="server" Text='<%# Eval("Product_serial_No") %>'></asp:Label>
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
                                                <asp:LinkButton ID="btn_reorder" runat="server" CssClass="btn btn-success" CommandName="Order" CommandArgument='<%# Eval("Stockid") %>'> Order </asp:LinkButton> 
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
    </main>
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
                <h6 runat="server" id="hmassage" style="text-align: center; font-weight: 400; font-size: 18px; margin-top: 15px">Somthing is wrong</h6>
                <button type="button" style="" class="btn btn-dark mx-auto mt-4" data-dismiss="modal">Ok</button>
                <br />
            </div>
        </div>
    </div>
    <div id="exampleModalLive2" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="exampleModalLiveLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header" style="background-color: #373a3c; color: white">
                    <h5 class="modal-title" id="exampleModalLiveLabel2" style="font-weight: 600; font-size: 15px"></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" style="color: white">&times;</span></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-sm-8 mx-auto">
                            <div class="form-group">
                                <img src="../AdminModule/assets/images/giphy.gif" height="100" width="100" class="mx-5" />
                                <asp:Label ID="lblmassege" runat="server" Visible="false"></asp:Label>
                                <h4 style="font-size: 16px; text-align: center; font-weight: 600">Are you sure you want to cancel order </h4>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-dark" data-dismiss="modal">Close</button>
                    <asp:Button ID="btn_cancel" CssClass="btn btn-danger" runat="server" Text="Delete" />
                </div>
            </div>
        </div>
    </div>
    <div id="exampleModalLive" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="exampleModalLiveLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header" style="background-color:#343a40">
                                                <h5 class="modal-title" id="exampleModalLiveLabel" style="font-weight: 600; font-size: 15px;color:white">Sell Price Fixed:</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" style="color:white">&times;</span></button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="row">
                                                    <div class="col-sm-10 mx-auto">
                                                        <div class="form-group">
                                                            <label class="floating-label" for="password">Purchase Price</label>
                                                            <asp:Label ID="lblstockid" Visible="false" runat="server" CssClass="form-control"></asp:Label>
                                                        </div>
                                                    </div>
                                                 
                                                    <div class="col-sm-10 mx-auto">
                                                        <div class="form-group">
                                                            <label class="floating-label" for="password">MRP</label>
                                                            <asp:TextBox ID="txtmrp"  oninput="CalculateFunction()" runat="server" CssClass="form-control"></asp:TextBox>
                                                           
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-10 mx-auto">
                                                        <div class="form-group">
                                                            <label class="floating-label" for="password">Discount :</label>
                                                            <div class="row mx-auto"">
                                                                 <asp:TextBox ID="txtdiscount" oninput="CalculateFunction()" TextMode="Number" class="form-control col-sm-7" placeholder="" runat="server">
                                                            </asp:TextBox>
                                                            <asp:DropDownList ID="dd_distcountType" oninput="CalculateFunction()" runat="server" CssClass="form-control col-sm-5" >
                                                                <asp:ListItem Value="0">Select</asp:ListItem>
                                                                <asp:ListItem Value="1">PER</asp:ListItem>
                                                                <asp:ListItem Value="2">RS</asp:ListItem>
                                                            </asp:DropDownList>
                                                            </div>
                                                           
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-10 mx-auto">
                                                        <div class="form-group">

                                                            <label class="floating-label" for="password">Sell Price :</label>
                                                            <asp:TextBox ID="txtsellprice" class="form-control" placeholder="" runat="server"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>



                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn  btn-danger" data-dismiss="modal">Cencel</button>
                                                <asp:Button ID="btn_submit"  Text="Submit" runat="server" OnClick="btn_submit_Click" class="btn  btn-success"></asp:Button>
                                            </div>
                                        </div>
                                    </div>
                                </div>

      <script src="../AdminModule/assets/js/jquery.min.js"></script>
    <script>
        document.getElementById('<%= txtsellprice.ClientID %>').readOnly = true;
      

        function CalculateFunction() {
            debugger
          
            var DiscountPrice = parseFloat(document.getElementById('<%= txtdiscount.ClientID %>').value);

            var discountType = document.getElementById('<%= dd_distcountType.ClientID %>').value;

            var mrp = document.getElementById('<%= txtmrp.ClientID %>').value;

            var T = 0, D = 0;
            var total = 0;
            if (discountType == '1') {
                D = (mrp * DiscountPrice) / 100;
                total = mrp - D;
                total.toFixed(4)
            }
            else if (discountType == '2') {
                total = mrp - DiscountPrice;
                total.toFixed(4)
            }
            else {
                total = mrp;
            }

            
            parseFloat(document.getElementById('<%= txtsellprice.ClientID %>').value = total);


            
        }






    </script>
   
</asp:Content>
