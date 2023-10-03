<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UserList.aspx.cs" Inherits="Productmanagement.AdminModule.UserList" %>

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

                    <div class="card-body">
                        <div class="row">
                            <div class="col-sm-8">
                                <div class="row" style="margin-bottom:3px;margin-left:10px">
                                    <asp:TextBox placeholder="Search Here....!!" CssClass="form-control col-sm-4" ID="txtsearch" OnTextChanged="btn_search_Click" AutoPostBack="true" runat="server" />
                                    &nbsp;  &nbsp;
                           <asp:Button ID="btn_search" runat="server" CssClass="btn btn-secondary col-sm-2" OnClick="btn_search_Click" Text="Search" />

                                </div>

                            </div>
                            <div class="col-sm-4">
                                <asp:Button ID="btn_excel" Text="Export Excel" runat="server" class="btn btn-success" OnClick="btn_excel_Click" />
                                <a class="btn btn-dark" href="../AdminModule/AddUser.aspx" style="font-weight: 600;">Add User <i class="far fa-plus-square fa-lg" style="margin-left: 5px"></i></a>

                            </div>
                        </div>


                        <asp:GridView ID="grid_userlist" AutoGenerateColumns="False" Width="100%" AllowPaging="true" OnPageIndexChanging="grid_userlist_PageIndexChanging" PageSize="100" runat="server" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" OnRowDeleting="grid_userlist_RowDeleting" OnRowEditing="grid_userlist_RowEditing" OnRowUpdating="grid_userlist_RowUpdating">
                            <AlternatingRowStyle BackColor="#F7F7F7" />
                            <Columns>
                                <asp:TemplateField HeaderText="Status">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="CheckBox1" runat="server" />
                                    </ItemTemplate>

                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Profile Image">
                                    <ItemTemplate>
                                        <asp:Image ID="Image1" Height="50" Width="50" runat="server" ImageUrl='<%# Eval("User_Image") %>' />
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="10%" />
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="10%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="UserId">
                                    <ItemTemplate>
                                        <asp:Label ID="lbluserid" runat="server" Text='<%# Eval("UserId") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="15%" />
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="15%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Name">
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("UserName") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="15%" />
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="15%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Mobile No">
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("Mobile_No") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="15%" />
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="15%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Email Id">
                                    <ItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("Email_id") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="15%" />
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="15%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Action">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="btn_view" runat="server"  CommandName="Update"><i style="color:#373a3c!important" class="fas fa-eye fa-lg"></i></asp:LinkButton>
                                        <asp:LinkButton ID="btn_edit" CommandName="Edit" runat="server"><i style="color:#373a3c!important" class="fas fa-edit fa-lg"></i></asp:LinkButton>
                                        <asp:LinkButton ID="btn_delete" CommandName="Delete" runat="server"><i style="color:#373a3c!important" class="fas fa-trash fa-lg"></i></asp:LinkButton>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="15%" />
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="15%" />
                                </asp:TemplateField>
                            </Columns>
                            <FooterStyle BackColor="#B5C7DE" ForeColor="#343a40" />
                            <HeaderStyle BackColor="#343a40" Font-Bold="True" ForeColor="#F7F7F7" />
                            <PagerStyle BackColor="#E7E7FF" ForeColor="#343a40" HorizontalAlign="Right" />
                            <RowStyle BackColor="#E7E7FF" ForeColor="#343a40" />
                            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                            <SortedAscendingCellStyle BackColor="#F4F4FD" />
                            <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                            <SortedDescendingCellStyle BackColor="#D8D8F0" />
                            <SortedDescendingHeaderStyle BackColor="#3E3277" />

                        </asp:GridView>
                    </div>

                </div>
                <div id="exampleModalLive1" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="exampleModalLiveLabel" aria-hidden="true">
                    <div class="modal-dialog modal-xl" role="document">
                        <div class="modal-content">
                            <div class="modal-header" style="background-color:#343a40">
                                <h5 class="modal-title" id="exampleModalLiveLabel1" style="font-weight: 600; font-size: 15px; color:white">User Details </h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" style="color:white">&times;</span></button>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-sm-4 mx-auto">
                                        <div class="form-group">
                                            <label class="floating-label" for="password"><b>User Id :</b></label>
                                            <asp:Label ID="lbluserid" class="label" runat="server"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="col-sm-4 mx-auto">
                                        <div class="form-group">
                                            <label class="floating-label" for="password"><b>Name :</b></label>
                                            <asp:Label ID="lblName" runat="server" Text="Label"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="col-sm-4 mx-auto">
                                        <div class="form-group">
                                            <label class="floating-label" for="password"><b>Mobile No :</b></label>
                                            <asp:Label ID="lblmobileno" runat="server" Text="Label"></asp:Label>
                                        </div>
                                    </div>

                                    <div class="col-sm-4 mx-auto">
                                        <div class="form-group">
                                            <label class="floating-label" for="password"><b>Email Id :</b></label>
                                            <asp:Label ID="lblemailid" runat="server" Text="Label"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="col-sm-4 mx-auto">
                                        <div class="form-group">
                                            <label class="floating-label" for="password"><b>Aadhar No  :</b></label>
                                            <asp:Label ID="lblaadharno" runat="server" Text="Label"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="col-sm-4 mx-auto">
                                        <div class="form-group">
                                            <label class="floating-label" for="password"><b>Pan No :</b></label>
                                            <asp:Label ID="lblpanno" runat="server" Text="Label"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="col-sm-4 mx-auto">
                                        <div class="form-group">
                                            <label class="floating-label" for="password"><b>GSTIN No:</b></label>
                                            <asp:Label ID="lblGstin_no" runat="server" Text="Label"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="col-sm-4 mx-auto">
                                        <div class="form-group">
                                            <label class="floating-label" for="password"><b>DOB :</b></label>
                                            <asp:Label ID="lbldob" runat="server" Text="Label"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="col-sm-4 mx-auto">
                                        <div class="form-group">
                                            <label class="floating-label" for="password"><b>Company Name :</b></label>
                                            <asp:Label ID="lblcompanyname" runat="server" Text="Label"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="col-sm-4 mx-auto">
                                        <div class="form-group">
                                            <label class="floating-label" for="password"><b>Password :</b></label>
                                            <asp:Label ID="lblpassword" runat="server" Text="Label"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="col-sm-4 mx-auto">
                                        <div class="form-group">
                                            <label class="floating-label" for="password"><b>State :</b></label>
                                            <asp:Label ID="lblstate" runat="server" Text="Label"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="col-sm-4 mx-auto">
                                        <div class="form-group">
                                            <label class="floating-label" for="password"><b>District :</b></label>
                                            <asp:Label ID="lbldistrict" runat="server" Text="Label"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="col-sm-4 mx-auto">
                                        <div class="form-group">
                                            <label class="floating-label" for="password"><b>City  :</b></label>
                                            <asp:Label ID="lblcity" runat="server" Text="Label"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="col-sm-4 mx-auto">
                                        <div class="form-group">
                                            <label class="floating-label" for="password"><b>Address :</b></label>
                                            <asp:Label ID="lbladdres" runat="server" Text="Label"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="col-sm-4 mx-auto">
                                        <div class="form-group">
                                            <label class="floating-label" for="password"><b>Store Name :</b></label>
                                            <asp:Label ID="lblstore" runat="server" Text="Label"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="col-sm-4 ">
                                        <div class="form-group">
                                            <label class="floating-label" for="password"><b>Branch Details :</b></label>
                                            <asp:Label ID="lblbranch" runat="server" Text="Label"></asp:Label>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-sm-3 mx-auto">
                                        <div class="form-group">
                                            <label class="floating-label" for="password"><b>User Image:</b></label><br />
                                            <img class="image" src="#" height="150" style="border-radius: 4px 4px" width="200" runat="server" id="userimg" />
                                        </div>
                                    </div>
                                    <div class="col-sm-3 mx-auto">
                                        <div class="form-group">
                                            <label class="floating-label" for="password"><b>Aadhar Fornt Image:</b></label><br />
                                            <img class="circle" src="#" height="150" style="border-radius: 4px 4px" width="200" runat="server" id="adharfornt" />
                                        </div>
                                    </div>
                                    <div class="col-sm-3 mx-auto">
                                        <div class="form-group">
                                            <label class="floating-label" for="password"><b>Aadhar Back Image:</b></label><br />
                                            <img class="circle" src="#" height="150" width="200" runat="server" id="adharback" />
                                        </div>
                                    </div>
                                    <div class="col-sm-3 mx-auto">
                                        <div class="form-group">
                                            <label class="floating-label" for="password"><b>Pan Card Iamge :</b></label><br />
                                            <img class="circle" src="#" height="150" width="200" runat="server" id="panimg" />
                                        </div>
                                    </div>
                                </div>

                            </div>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-dark" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="exampleModalLive2" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="exampleModalLiveLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header" style="background-color:#343a40">
                                <h5 class="modal-title" id="exampleModalLiveLabel2" style="font-weight: 600; font-size: 15px"></h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" style="color:white">&times;</span></button>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-sm-8 mx-auto">
                                        <div class="form-group">
                                            <img src="assets/images/giphy.gif" height="100" width="100" style="margin-left: 35%" />
                                            <asp:Label ID="lblmassege" runat="server" Visible="false"></asp:Label>
                                            <h4 style="font-size: 16px; text-align: center; font-weight: 600">Are you sure you want to delete?</h4>
                                        </div>
                                    </div>

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


</asp:Content>
