<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="OrderList.aspx.cs" Inherits="Productmanagement.AdminModule.OrderList" %>
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
                    <h6 class="card-title text-bold">Order List</h6>
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
                            <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand" OnItemDataBound="Repeater1_ItemDataBound">
                                <HeaderTemplate>
                                    <thead>
                                        <tr class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800">
                                            <th>Sl/No</th>
                                            <th>Order Id </th>
                                            <th>Payment Received</th>
                                            <th>Qunatity</th>
                                            <th>Price</th>
                                            <th>Total Amount</th>
                                            <th>Status</th>
                                            <th>Order Date</th>

                                          

                                            <th>Approve/Cancel</th>
                                        </tr>
                                    </thead>
                                </HeaderTemplate>


                                <ItemTemplate>
                                    <tbody>
                                        <tr class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800">
                                            <td>
                                                <asp:Label ID="Label5" runat="server" Text='<%# Container.ItemIndex+1 %>'></asp:Label></td>
                                           
                                            <td>
                                                <asp:Label ID="lblproduct_name" runat="server" Text='<%# Eval("Order_Id") %>'></asp:Label>
                                                <asp:Label ID="lblstockid" Visible="false" runat="server" Text='<%# Eval("StockId") %>'></asp:Label>
                                               
                                            </td>
                                            <td  CssClass="">
                                               <asp:ImageButton ID="btn_image" runat="server"   Style="border-radius:50%;height:50px;width:50px;" ImageUrl='<%# Eval("PaymentIamge") %>'/>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblbrand" runat="server" Text='<%# Eval("Qunatity") %>'></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblmarp" runat="server" Text='<%# string.Format("{0:n2}", Eval("PRICE"))%>'></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="lbldiscount" runat="server" Text='<%# string.Format("{0:n2}", Eval("Total_Amount "))%>'></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblstatus" Style="border-radius:3px 4px;text-align:center;" runat="server" Text='<%#  Eval("Status")%>'></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblproducts" runat="server" Text='<%# Eval("Order_Date") %>'></asp:Label>
                                            </td>
                                           
                                          
                                            <td>
                                                <asp:LinkButton ID="btn_approve" CssClass="btn btn-default" runat="server" CommandName="approve" CommandArgument='<%# Eval("Order_Id") %>'><img src="../assets/img/icons8-approve-48%20(1).png" / width="25" height="25"></asp:LinkButton><%--&nbsp;<i class="fa fa-shopping-cart"></i>--%>
                                                <asp:LinkButton ID="btn_cancel" CssClass="btn btn-default" runat="server" CommandName="ordercancel" CommandArgument='<%# Eval("Order_Id") %>'><img src="../assets/img/icons8-cancel-48.png" / width="25" height="25"></asp:LinkButton><%--&nbsp;<i class="fa fa-shopping-cart"></i>--%>
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
                                    <h5 class="modal-title" id="exampleModalLiveLabel2" style="font-weight: 600;color:white; font-size: 15px">Conformation</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" style="color: white">&times;</span></button>
                                </div>
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="col-sm-8 mx-auto">
                                            <div class="form-group">
                                                <img src="../AdminModule/assets/images/giphy.gif" height="100" width="100" class="mx-5" />
                                                <asp:Label ID="lblmassege" runat="server" Visible="false"></asp:Label>
                                                <h4 style="font-size: 16px; text-align: center; font-weight: 600" runat="server" id="heading">Are you sure you want to cancel order </h4>
                                            </div>
                                        </div>
                                        
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-dark" data-dismiss="modal">Close</button>
                                    <asp:Button ID="btn_cancel1"  OnClick="btn_cancel_Click" CssClass="btn btn-danger" Visible="false" Text="Cancel"  runat="server" />
                                    <asp:Button ID="btn_approve" CssClass="btn btn-success"  OnClick="btn_approve_Click" Visible="false" Text="Approve"  runat="server" />
                                </div>
                            </div>
                        </div>
                    </div>
</asp:Content>

