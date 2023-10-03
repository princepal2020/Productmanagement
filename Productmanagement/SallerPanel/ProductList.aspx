<%@ Page Title="" Language="C#" MasterPageFile="~/SallerPanel/SallerMaster.Master" AutoEventWireup="true" CodeBehind="ProductList.aspx.cs" Inherits="SallerPanel.SallerPanel.ProductList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../assets/css/all.css" rel="stylesheet" />
    <link href="../assets/css/tailwind.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main class="h-full overflow-y-auto">
        <div class="container  grid">
            <!-- New Table -->
            <div class="w-full overflow-hidden rounded-lg shadow-xs py-5">
                <div class="w-full">
                    <h6 class="card-title text-bold">Product List</h6>
                    <div class="row">
                        <div class="col-sm-4 py-1">
                            <asp:TextBox placeholder="Search Here....!!" CssClass="form-control " ID="txtsearch" OnTextChanged="btn_search_Click" AutoPostBack="true" runat="server" />
                        </div>
                        <div class="col-sm-4">
                            <asp:Button ID="btn_search" runat="server" CssClass="btn btn-primary" OnClick="btn_search_Click" Text="Search" />
                        </div>
                    </div>
                    <div class="table-responsive" style="overflow-x: scroll">
                        <table class="datatable table table-stripped">
                            <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                                <HeaderTemplate>
                                    <thead>
                                        <tr class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800">
                                            <th>Sl/No</th>
                                            <th>Images</th>
                                            <th>Product Name</th>
                                            <th>Brand Name</th>
                                            <th>MRP</th>
                                            <th>Discount(Rs/%)</th>
                                            <th>Price</th>

                                            <th>Product Code</th>
                                            <th>Products Serial No :</th>
                                            <th>Size  :</th>

                                            <th>Order</th>
                                        </tr>
                                    </thead>
                                </HeaderTemplate>


                                <ItemTemplate>
                                    <tbody>
                                        <tr class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800">
                                            <td>
                                                <asp:Label ID="Label5" runat="server" Text='<%# Container.ItemIndex+1 %>'></asp:Label></td>
                                            <td>
                                                <asp:Image ID="pimage1" runat="server" Height="50" Width="50" Style="border-radius: 100%" class="object-cover w-full h-full rounded-full mx-auto" ImageUrl='<%# Eval("Product_Image1")%>' alt="" loading="lazy" />
                                            </td>
                                            <td>
                                                <asp:Label ID="lblproduct_name" runat="server" Text='<%# Eval("Product_Name") %>'></asp:Label>
                                                <asp:Label ID="lblstockid" Visible="false" runat="server" Text='<%# Eval("stid") %>'></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblbrand" runat="server" Text='<%# Eval("Brand_Name") %>'></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblmarp" runat="server" Text='<%# string.Format("{0:n2}", Eval("ProductMRP"))%>'></asp:Label>
                                                <asp:Label ID="lbltaxttype" Visible="false" runat="server" Text='<%# string.Format("{0:n2}",Eval("IGST"))%>'></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="lbldiscount" runat="server" Text='<%# string.Format("{0:n2}", Eval("Discount "))%>'></asp:Label>
                                                <asp:Label ID="lbldiscounttype" Visible="false" runat="server" Text='<%# Eval("DistCountType")%>'></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblsellprice" runat="server" Text='<%# string.Format("{0:n2}", Eval("SellPrice"))%>'></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblproducts" runat="server" Text='<%# Eval("Product_code") %>'></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblserialno" runat="server" Text='<%# Eval("Product_serial_No") %>'></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("SizeName") %>'></asp:Label>
                                            </td>
                                            <td>
                                                <asp:LinkButton ID="btn_addstock" CssClass="btn btn-success" runat="server" CommandName="AddStock" CommandArgument='<%# Eval("stid") %>'>Buy Now </asp:LinkButton><%--&nbsp;<i class="fa fa-shopping-cart"></i>--%>
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
                        <div id="exampleModalLive1" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="exampleModalLiveLabel" aria-hidden="true">
                            <div class="modal-dialog modal-lg" role="document">
                                <div class="modal-content">
                                    <div class="modal-header" style="background-color: #343a40">
                                        <h5 class="modal-title" id="exampleModalLiveLabel1" style="font-weight: 600; font-size: 15px; color: white">Order Now </h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" style="color: white">&times;</span></button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="row">

                                            <div class="col-sm-6 mx-auto">
                                                <div class="form-group">
                                                    <label class="floating-label" for="password">Price :</label>
                                                    <asp:TextBox oninput="CalculateFunction();" ID="lblprice" class="form-control" runat="server"></asp:TextBox>
                                                    <asp:Label ID="lblstockid" Visible="false" class="form-control" runat="server"></asp:Label>
                                                </div>
                                            </div>

                                            <div class="col-sm-6 mx-auto">
                                                <div class="form-group">
                                                    <label class="floating-label" for="password">Tax :</label>
                                                    <asp:Label ID="lbltax" class="form-control" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                             <div class="col-sm-6 mx-auto">
                                                <div class="form-group">
                                                    <label class="floating-label" for="password">Payment Mode :</label>
                                                    <asp:DropDownList ID="dd_paymentmode" OnSelectedIndexChanged="dd_paymentmode_SelectedIndexChanged" AutoPostBack="true" runat="server" CssClass="form-control">
                                                        <asp:ListItem Value="0">
                                                            Select Payment Mode 
                                                        </asp:ListItem> 
                                                        <asp:ListItem Value="1">
                                                            Online Mode 
                                                        </asp:ListItem>
                                                         <asp:ListItem Value="2">
                                                            Offline Mode 
                                                        </asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="col-sm-6 mx-auto">
                                                <div class="form-group">
                                                    <label class="floating-label" for="password">Disconut :</label>
                                                    <asp:Label ID="lbldiscount" class="form-control" runat="server"></asp:Label>
                                                </div>
                                            </div>

                                            <div class="col-sm-6 mx-auto">
                                                <div class="form-group">
                                                    <label class="floating-label"  for="password">Total Quntity  :</label>
                                                    <asp:TextBox ID="txtquntity" TextMode="Number" oninput="CalculateFunction();" class="form-control" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                                     <div class="col-sm-6 mx-auto">
                                                        <div class="form-group">
                                                            <label class="floating-label" for="password">Total Amount  :</label>
                                                          
                                                             <asp:TextBox ID="lblTotalamount"  class="form-control" runat="server"></asp:TextBox>
                                                        </div>

                                                    </div>
                                            
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="row">
                                           
                                                    <div class="col-sm-12">
                                                        <div class="form-group">

                                                            <label class="floating-label" id="Payment" visible="false" runat="server" for="password">Payment Recived :</label>



                                                            <asp:FileUpload runat="server" Visible="false" class="form-control" Style="line-height: normal" onchange="loadFile(event)" ID="file" />
                                                        </div>
                                                    </div>

                                                    <div class="col-sm-12">
                                                        <div class="form-group">
                                                            <button type="button" class="btn  btn-danger" data-dismiss="modal">Cencel</button>
                                                            <asp:Button ID="btn_order" Text="Order Now" OnClick="btn_order_Click" runat="server" class="btn  btn-success"></asp:Button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="row">

                                                    <div class="col-sm-12 mx-auto">
                                                        <div class="form-group">
                                                            <img class="inline-block" visible="false" src="../AdminModule/assets/images/user.jpg" style="height: 200px!important; width: 100%!important" runat="server" alt="user" id="profile_image">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>



                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                    </div>
                                </div>
                            </div>
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
                                            <h6 style="text-align: center; font-weight: 400; font-size: 18px; margin-top: 15px">Somthing is wrong</h6>
                                            <button type="button" style="" class="btn btn-dark mx-auto mt-4" data-dismiss="modal">Ok</button>
                                            <br />
                                        </div>
                                    </div>
                                </div>
    </main>

    <script type="text/javascript">
        $(document).ready(function () {
            debugger
            var A = parseFloat(document.getElementById('<%= lblprice.ClientID %>').value);
            document.getElementById('<%= lblTotalamount.ClientID %>').value = A;

        })
        document.getElementById('<%= lblprice.ClientID %>').readOnly = true;
        document.getElementById('<%= lblTotalamount.ClientID %>').readOnly = true;
        function CalculateFunction() {
            debugger
            var A = parseFloat(document.getElementById('<%= lblprice.ClientID %>').value);
           var B = parseFloat(document.getElementById('<%= txtquntity.ClientID %>').value);
           if (!isNaN(A) && isNaN(B)) {
               document.getElementById('<%= lblTotalamount.ClientID %>').value = A;
            }
            else if (isNaN(A) && !isNaN(B)) {
                document.getElementById('<%= lblTotalamount.ClientID %>').value = B;
            }
            else {
                var C = A * B;
               document.getElementById('<%= lblTotalamount.ClientID %>').value = C.toFixed(2);;
           }
       }
        var loadFile = function (event) {
            var image = document.getElementById('<%= profile_image.ClientID%>');
            image.src = URL.createObjectURL(event.target.files[0]);
        };

        var m1;
        var f1 = document.getElementById("file");
        f1.addEventListener("change", function (e) {
            m1 = new FileReader();
            m1.onload = function (e) {
                v1.src = e.target.result;
            };
            m1.readAsDataURL(this.files[0]);
        });
    </script>
     <script src="../AdminModule/assets/js/jquery.min.js"></script>
</asp:Content>
