<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Stock_Manage.aspx.cs" Inherits="Productmanagement.AdminModule.Stock_Manage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        th {
            text-align: CENTER;
        }
      
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="pcoded-content">
        <div class="row">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-header">
                        <div class="row  ">
                            <div class="col-sm-5">
                                <h5 style="font-weight: 600; font-size: 20px">Stocks Manage</h5>
                            </div>
                            <div class="col-sm-7 d-flex justify-content-end">
                                <button type="button" class="btn btn-dark " data-toggle="modal" data-target="#exampleModalLive1" style="font-weight: 600;">Add  Tax Type<i class="far fa-plus-square fa-lg" style="margin-left: 5px"></i></button>&nbsp; &nbsp;    
                                <button type="button" class="btn btn-dark " data-toggle="modal" data-target="#exampleModalLive" style="font-weight: 600;">Add Product Size<i class="far fa-plus-square fa-lg" style="margin-left: 5px"></i></button>&nbsp; &nbsp;    

                                <a class="btn btn-dark " href="../AdminModule/AddProducts.aspx" style="font-weight: 600;">Add Product <i class="far fa-plus-square fa-lg" style="margin-left: 5px"></i></a>

                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <for>
                            <div class="row">

                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label class="floating-label" for="Email">Product Code  :</label>

                                        <%--                                        <asp:TextBox ID="txtbarcode1" class="form-control" placeholder="" runat="server"></asp:TextBox>--%>
                                        <asp:Label ID="lblproductcode" runat="server" CssClass="form-control"></asp:Label>

                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label class="floating-label" for="Email">Product Name  :</label>

                                        <%--                                        <asp:TextBox ID="txtbarcode1" class="form-control" placeholder="" runat="server"></asp:TextBox>--%>
                                        <asp:Label ID="lblproductsname" runat="server" CssClass="form-control"></asp:Label>

                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label class="floating-label" for="Email">Brade Name  :</label>

                                        <%--                                        <asp:TextBox ID="txtbarcode1" class="form-control" placeholder="" runat="server"></asp:TextBox>--%>
                                        <asp:Label ID="lblbradename" runat="server" CssClass="form-control"></asp:Label>

                                    </div>
                                </div>
                                <div id="exampleModalLive1" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="exampleModalLiveLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header" style="background-color:#343a40">
                                                <h5 class="modal-title" id="exampleModalLiveLabel1" style="font-weight: 600; font-size: 15px;color:white">Add Quntity  </h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" style="color:white">&times;</span></button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="row">
                                                    <div class="col-sm-10 mx-auto">
                                                        <div class="form-group">
                                                            <label class="floating-label" for="password"> Stock Id :</label>
                                                            <asp:TextBox ID="txtcgst" oninput="myFunction()" class="form-control" placeholder="" runat="server"></asp:TextBox>
                                                        </div>

                                                    </div>
                                                    <div class="col-sm-10 mx-auto">
                                                        <div class="form-group">
                                                            <label class="floating-label" for="password">SGST </label>
                                                            <asp:TextBox ID="txtsgst" oninput="myFunction()" class="form-control" placeholder="" runat="server"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-10 mx-auto">
                                                        <div class="form-group">
                                                            <label class="floating-label" for="password">IGST :</label>
                                                            <asp:Label ID="lbligstc" class="form-control" placeholder="" runat="server"></asp:Label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn  btn-danger" data-dismiss="modal">Cencel</button>
                                                <asp:Button ID="btn_gsttype" OnClick="btn_gsttype_Click" Text="Submit" runat="server" class="btn  btn-success"></asp:Button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label class="floating-label" for="Text">MRP : </label>
                                        <asp:TextBox ID="txtmrp" onkeypress="return number(event)" class="form-control" placeholder="" runat="server"></asp:TextBox>

                                    </div>
                                </div>
                                <div id="exampleModalLive" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="exampleModalLiveLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header" style="background-color:#343a40">
                                                <h5 class="modal-title" id="exampleModalLiveLabel" style="font-weight: 600; font-size: 15px;color:white">Add  Product Size :</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" style="color:white">&times;</span></button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="row">
                                                    <div class="col-sm-10 mx-auto">
                                                        <div class="form-group">
                                                            <label class="floating-label" for="password">Product Size :</label>
                                                            <asp:TextBox ID="txtproductsize" runat="server" CssClass="form-control"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-10 mx-auto">
                                                        <div class="form-group">
                                                            <label class="floating-label" for="password">Product Discription  :</label>
                                                            <asp:TextBox ID="txtdecription" class="form-control" placeholder="" runat="server"></asp:TextBox>
                                                        </div>
                                                    </div>

                                                </div>



                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn  btn-danger" data-dismiss="modal">Cencel</button>
                                                <asp:Button ID="btn_sizeSave" Text="Submit" OnClick="btn_sizeSave_Click" runat="server" class="btn  btn-success"></asp:Button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="modalquntity" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="exampleModalLiveLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLiveLabel2" style="font-weight: 600; font-size: 15px">Add  Quntity :</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="row">
                                                    <div class="col-sm-10 mx-auto">
                                                        <div class="form-group">
                                                            <label class="floating-label" for="password">Stock ID :</label>
                                                            <asp:TextBox ID="txtproductcode" runat="server" CssClass="form-control"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-10 mx-auto">
                                                        <div class="form-group">
                                                            <label class="floating-label" for="password">Quntity  :</label>
                                                            <asp:TextBox ID="txtquntityadd" class="form-control" placeholder="" runat="server"></asp:TextBox>
                                                        </div>
                                                    </div>

                                                </div>



                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn  btn-danger" data-dismiss="modal">Cencel</button>
                                                <asp:Button ID="btn_quntity" Text="Submit" OnClick="btn_quntity_Click" runat="server" class="btn  btn-success"></asp:Button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label class="floating-label" for="password">Purchase Price :</label>
                                        <asp:TextBox ID="txtpurchase" oninput="CalculateFunction()" onkeypress="return number(event)" class="form-control" placeholder="" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label class="floating-label" for="password">Sales Price:</label>
                                        <asp:TextBox ID="txtsallprice" class="form-control" oninput="CalculateFunction()" placeholder="" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label class="floating-label" for="password">Product Quantity :</label>
                                        <asp:TextBox ID="txtQuantity" class="form-control" placeholder="" runat="server"></asp:TextBox>

                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label class="floating-label" for="password">Discount</label>
                                        <div class="input-group-prepend">
                                            <asp:TextBox ID="txtdiscount" oninput="CalculateFunction()" class="form-control" onkeypress="return number(event)" placeholder="" runat="server"></asp:TextBox>
                                            <asp:DropDownList ID="dd_discounttype" class="mb-3 form-control" runat="server" Width="100px">
                                                <asp:ListItem Value="1">PER
                                                </asp:ListItem>
                                                <asp:ListItem Value="2">RS</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>

                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label class="floating-label" for="password">Tax Type</label>
                                        <asp:DropDownList ID="dd_taxtype" oninput="CalculateFunction()" OnSelectedIndexChanged="dd_taxtype_SelectedIndexChanged" AutoPostBack="true" class="mb-3 form-control" runat="server">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label class="floating-label" for="Text">CGST:</label>
                                        <asp:Label ID="lblcgst" class="form-control" runat="server"></asp:Label>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label class="floating-label" for="Text">SGST:</label>
                                        <asp:Label ID="lblsgst" class="form-control" runat="server"></asp:Label>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label class="floating-label" for="Text">IGST:</label>
                                        <asp:Label ID="lbligst" class="form-control" runat="server"></asp:Label>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label class="floating-label" for="password">Products Size :</label>
                                        <asp:DropDownList ID="dd_psize" class="mb-3 form-control" runat="server">
                                        </asp:DropDownList>
                                    </div>
                                </div>

                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label class="floating-label" for="Text">Manufacturer Date:</label>

                                        <asp:TextBox ID="txtmfg" class="form-control" TextMode="Date" placeholder="" runat="server"></asp:TextBox>

                                        <%-- <input type="file" id="fileInput" multiple>
                                            <button id="uploadButton">Upload Images</button>--%>
                                    </div>
                                    <%--<div class="custom-file">
                                            <input type="file" class="custom-file-input" id="inputGroupFile01">
                                            <label class="custom-file-label" for="inputGroupFile01">Choose file</label>
                                        </div>--%>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label class="floating-label" for="Text">Expire Date :</label>
                                        <asp:TextBox ID="txtexpire" TextMode="Date" class="form-control" placeholder="" runat="server"></asp:TextBox>
                                    </div>
                                    <%--<div class="custom-file">
                                            <input type="file" class="custom-file-input" id="inputGroupFile02">
                                            <label class="custom-file-label" for="inputGroupFile01">Choose file</label>
                                        </div>--%>
                                </div>



                                <div class="col-sm-4">
                                    <div class="form-group mt-4">
                                        <asp:Button ID="btn_reset" runat="server" class="btn  btn-danger" Text="Reset"></asp:Button>
                                        <asp:Button ID="btn_submit" Text="Submit" OnClick="btn_submit_Click" runat="server" class="btn  btn-success"></asp:Button>
                                    </div>
                                </div>
                                <div id="myModal" class="modal fade" role="dialog">
                                    <div class="modal-dialog">
                                        <div class="modal-content" style="border-radius: 5px 5px; margin-top: 10rem">
                                            <!-- Modal content goes here -->
                                            <img src="assets/images/ezgif-1-272e67e4b5.gif" />
                                            <h1 style="text-align: center; font-weight: 600; font-size: 25px; margin-top: -50px">Good job!</h1>
                                            <%-- <i class="fa-solid fa-circle-check fa-beat fa-2xl" style="color: #70c021";></i>--%>
                                            <h6 style="text-align: center; font-weight: 400; font-size: 18px; margin-top: 15px" runat="server" id="txtmassage"></h6>
                                            <button type="button" style="" class="btn btn-dark mx-auto mt-4" data-dismiss="modal">Ok</button>
                                            <br />
                                        </div>
                                    </div>
                                </div>
                                <div id="myModal1" class="modal fade" role="dialog">
                                    <div class="modal-dialog">
                                        <div class="modal-content" style="border-radius: 5px 5px; margin-top: 10rem">
                                            <!-- Modal content goes here -->
                                            <img src="assets/images/Error3.gif" />
                                            <h1 style="text-align: center; font-weight: 600; font-size: 25px; margin-top: -50px">Oops!!</h1>
                                            <%-- <i class="fa-solid fa-circle-check fa-beat fa-2xl" style="color: #70c021";></i>--%>
                                            <h6 style="text-align: center; font-weight: 400; font-size: 18px; margin-top: 15px">Somthing is wrong</h6>
                                            <button type="button" style="" class="btn btn-dark mx-auto mt-4" data-dismiss="modal">Ok</button>
                                            <br />
                                        </div>
                                    </div>
                                </div>
                            </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <div class="pcoded-content">
        <div class="row">
            <div class="col-sm-12">
                <div class="card">

                    <div class="card-body">
                        <div class="row">
                            <div class="col-sm-8">
                                <div class="row mx-auto py-1">
                                     <asp:TextBox placeholder="Search Here....!!" CssClass="form-control col-sm-4" ID="txtsearch" OnTextChanged="btn_search_Click" AutoPostBack="true" runat="server" />
                                &nbsp;  &nbsp;
                            <asp:Button ID="btn_search" runat="server" CssClass="btn btn-secondary col-sm-2" OnClick="btn_search_Click" Text="Search" />

                                </div>
                               
                            </div>
                            <div class="col-sm-4 mx-auto">
                                 <div class="row mx-auto py-1">
                                <asp:Button ID="btn_excel" Text="Export Excel" runat="server" class="btn btn-success" OnClick="btn_excel_Click" />
</div>
                            </div>
                        </div>


                        <asp:GridView ID="grid_Stoklist" AutoGenerateColumns="False" OnRowCommand="grid_Stoklist_RowCommand" Width="100%" runat="server" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
                            <AlternatingRowStyle BackColor="#F7F7F7" />
                            <Columns>

                                <asp:TemplateField HeaderText="Product Code">
                                    <ItemTemplate>
                                        <asp:Label ID="lblproductcode" runat="server" Text='<%# Eval("ProductCode") %>'></asp:Label>
                                     
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="10%" />
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="10%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Sell Price">
                                    <ItemTemplate>
                                        <asp:Label ID="lblsellprice" runat="server" Text='<%#string.Format("{0:n2}", Eval("SellPrice")) %>'></asp:Label>

                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="15%" />
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="15%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Quantity">
                                    <ItemTemplate>
                                        <asp:Label ID="lblQuantity" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label>
                                        <asp:LinkButton ID="btn_quntity" CommandName="quntityupdate" CommandArgument='<%# Eval("stid") %>' runat="server"><i class="far fa-plus-square fa-lg" style="margin-left: 5px"></i></asp:LinkButton>
                                        &nbsp; &nbsp;    

                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="15%" />
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="15%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Size Name">
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("SizeName") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="15%" />
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="15%" />
                                </asp:TemplateField>

                                <%--                                <asp:TemplateField HeaderText="Action">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="btn_view" runat="server" CommandName="Update"><i class="fas fa-eye fa-lg"></i></asp:LinkButton>
                                        <asp:LinkButton ID="btn_edit" CommandName="Edit" runat="server"><i class="fas fa-edit fa-lg"></i></asp:LinkButton>
                                        <asp:LinkButton ID="btn_delete" CommandName="Delete" runat="server"><i class="fas fa-trash fa-lg"></i></asp:LinkButton>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="15%" />
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="15%" />
                                </asp:TemplateField>--%>
                            </Columns>
                            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                            <SortedAscendingCellStyle BackColor="#F4F4FD" />
                            <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                            <SortedDescendingCellStyle BackColor="#D8D8F0" />
                            <SortedDescendingHeaderStyle BackColor="#3E3277" />

                        </asp:GridView>
                    </div>

                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        document.getElementById('<%=txtsallprice.ClientID%>').readOnly = true;
        document.getElementById('<%=txtproductcode.ClientID%>').readOnly = true;
        function CalculateFunction() {
            debugger
            var PurchasePrice = parseFloat(document.getElementById('<%= txtpurchase.ClientID %>').value);
            var Discount = parseFloat(document.getElementById('<%= txtdiscount.ClientID %>').value);
            var TaxType = document.getElementById('<%= dd_taxtype.ClientID %>');
            var selectedOption = TaxType.options[TaxType.selectedIndex];
            var Tax = parseFloat(selectedOption.text);
            var discountType = document.getElementById('<%= dd_discounttype.ClientID %>').value;
            var taxVal = document.getElementById('<%= dd_taxtype.ClientID %>').value;

            var C = 0;
            var SalesPrice = 0;
            if (discountType == '1') {
                C = PurchasePrice - ((PurchasePrice * Discount) / 100);
                SalesPrice = C + ((C * Tax) / 100)
            }

            else if (discountType == '2') {
                C = PurchasePrice - Discount;
                SalesPrice = C + ((C * Tax) / 100)
            }
            else {
                C = 0;
            }
            if (!isNaN(PurchasePrice) && isNaN(Discount) && isNaN(Tax)) {
                parseFloat(document.getElementById('<%= txtsallprice.ClientID %>').value = PurchasePrice);
            }
            if (isNaN(PurchasePrice) && !isNaN(Discount) && isNaN(Tax)) {
                parseFloat(document.getElementById('<%= txtsallprice.ClientID %>').value = 0);
            }
            if (isNaN(PurchasePrice) && isNaN(Discount) && !isNaN(Tax)) {
                parseFloat(document.getElementById('<%= txtsallprice.ClientID %>').value = 0);
            }
            if (isNaN(PurchasePrice) && !isNaN(Discount) && !isNaN(Tax)) {
                parseFloat(document.getElementById('<%= txtsallprice.ClientID %>').value = 0);
            }
            if (!isNaN(PurchasePrice) && isNaN(Discount) && !isNaN(Tax)) {
                SalesPrice = PurchasePrice + ((PurchasePrice * Tax) / 100)
                parseFloat(document.getElementById('<%= txtsallprice.ClientID %>').value = SalesPrice);
            }

            if (!isNaN(PurchasePrice) && !isNaN(Discount) && isNaN(Tax)) {
                parseFloat(document.getElementById('<%= txtsallprice.ClientID %>').value = C);
            }
            if (!isNaN(PurchasePrice) && !isNaN(Discount) && !isNaN(Tax)) {
                parseFloat(document.getElementById('<%= txtsallprice.ClientID %>').value = SalesPrice);
            }

        }
        function myFunction() {

            var A = parseFloat(document.getElementById('<%= txtcgst.ClientID %>').value);
            var B = parseFloat(document.getElementById('<%= txtsgst.ClientID %>').value);
            if (!isNaN(A) && isNaN(B)) {
                document.getElementById('<%= lbligstc.ClientID %>').value = A;
            }
            else if (isNaN(B) && !isNaN(B)) {
                document.getElementById('<%= lbligstc.ClientID %>').value = B;
            }
            else {
                var C = A + B;
                document.getElementById('<%= lbligstc.ClientID %>').value = C;
            }

        }
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
       // debugger
       ////function calculateSum() {
       ////    var textbox1Value = parseFloat(document.getElementById('textbox1').value) || 0; // Get the value from textbox1, default to 0 if not a valid number.
       ////    var textbox2Value = parseFloat(document.getElementById('textbox2').value) || 0; // Get the value from textbox2, default to 0 if not a valid 


       ////    var sum = textbox1Value + textbox2Value; // Calculate the sum.

       ////    document.getElementById('resultTextbox').value = sum; // Set the result in the third textbox.
       ////}
       ////$(document).ready(function () {
       ////    $("#txtcgst").on("input", function () {
       ////        var productPrice = $("#txtsgst").val();
       ////        var productCount = $(this).val();
       ////        var totalPrice = productPrice + productCount;
       ////        $("#txtigst").val(totalPrice.toFixed(2));
       ////    });
       ////});
    </script>
    <script src="AdminModule/assets/js/jquery.min.js"></script>
</asp:Content>
