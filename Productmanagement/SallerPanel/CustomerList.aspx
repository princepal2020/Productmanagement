<%@ Page Title="" Language="C#" MasterPageFile="~/SallerPanel/SallerMaster.Master" AutoEventWireup="true" CodeBehind="CustomerList.aspx.cs" Inherits="Productmanagement.SallerPanel.CustomerList" %>
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
                    <h6 class="card-title text-bold">Customer List</h6>
                    <div class="row">
                        <div class="col-sm-4 py-1">
                            <asp:TextBox placeholder="Search Here....!!" CssClass="form-control " ID="txtsearch"  AutoPostBack="true" runat="server" />
                        </div>
                        <div class="col-sm-4">
                            <asp:Button ID="btn_search" runat="server" CssClass="btn btn-primary"  Text="Search" />
                        </div>
                    </div>
                    <div class="table-responsive" style="overflow-x: scroll">
                        <table class="datatable table table-stripped">
                            <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand" >
                                <HeaderTemplate>
                                    <thead>
                                        <tr class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800">
                                            <th>Sl/No</th>
                                            <th>Customer Id </th>
                                            <th>Name</th>
                                            <th>Mobile No </th>
                                            
                                          

                                          

                                            
                                        </tr>
                                    </thead>
                                </HeaderTemplate>


                                <ItemTemplate>
                                    <tbody>
                                        <tr class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800">
                                            <td>
                                                <asp:Label ID="Label5" runat="server" Text='<%# Container.ItemIndex+1 %>'></asp:Label></td>
                                           
                                            <td>
                                                <asp:Label ID="lblproduct_name" runat="server" Text='<%# Eval("Customerid") %>'></asp:Label>
                                               
                                            </td>
                                            <td>
                                                <asp:Label ID="lblbrand" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                            </td>
                                           
                                           
                                           
                                            <td>
                                                <asp:Label ID="lblproducts" runat="server" Text='<%# Eval("Mobil_No") %>'></asp:Label>
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
</asp:Content>
