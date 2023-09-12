<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AddUser.aspx.cs" Inherits="Productmanagement.AdminModule.AddUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="pcoded-content">
        <div class="row">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-header">

                        <div class="row  ">
                            <div class="col-sm-7">
                                <h5>Add User</h5>
                            </div>
                            <div class="col-sm-5 d-flex justify-content-end">
                                <button type="button" class="btn btn-dark " data-toggle="modal" data-target="#exampleModalLive1" style="font-weight: 600;">Add Category<i class="far fa-plus-square fa-lg" style="margin-left: 5px"></i></button>&nbsp; &nbsp;    
                             <button type="button" class="btn btn-dark " data-toggle="modal" data-target="#exampleModalLive" style="font-weight: 600">Add Sub Category<i class="far fa-plus-square fa-lg" style="margin-left: 5px"></i></button>
                            </div>
                        </div>

                    </div>
                    <div class="card-body">
                        <for>
                            <div class="row">


                                 <div class="col-sm-4">
                                    <div class="form-group">
                                        <label class="floating-label" for="password">User Type</label>
                                        <asp:DropDownList ID="dd_usertype" class="mb-3 form-control" runat="server">

                                      
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label class="floating-label" for="password">Name :</label>
                                        <asp:TextBox ID="txtname" class="form-control" placeholder="" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                     <div class="col-sm-4">
                                    <div class="form-group">
                                        <label class="floating-label" for="password">Company Name :</label>
                                        <asp:TextBox ID="txtcompanyname" class="form-control" placeholder="" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                               
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label class="floating-label" for="password">Email Id :</label>
                                        <asp:TextBox ID="txtemail" class="form-control" placeholder="" runat="server"></asp:TextBox>

                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label class="floating-label" for="password">Mobile No</label>
                                        <asp:TextBox ID="txtmobileno" MaxLength="10" class="form-control" onkeypress="return number(event)" placeholder="" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label class="floating-label" for="password">Aadhar No :</label>
                                        <asp:TextBox ID="txtaddharno" class="form-control" onkeypress="return number(event)" placeholder="" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label class="floating-label" for="password">Pancard No :</label>
                                        <asp:TextBox ID="txtpanno" class="form-control" onkeypress="return number(event)" placeholder="" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label class="floating-label" for="password">GSTIN No:</label>
                                        <asp:TextBox ID="txtgstinno" class="form-control" onkeypress="return number(event)" placeholder="" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                   <div class="col-sm-4">
                                    <div class="form-group">
                                        <label class="floating-label" for="password">Password:</label>
                                        <asp:TextBox ID="txtpassword" class="form-control" TextMode="Date" placeholder="" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label class="floating-label" for="password">Date Of Birth:</label>
                                        <asp:TextBox ID="txtdob" class="form-control" TextMode="Date" placeholder="" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label class="floating-label" for="password">Store Name:</label>
                                        <asp:TextBox ID="txtstorename" class="form-control" placeholder="" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label class="floating-label" for="password">Branch Details :</label>
                                        <asp:TextBox ID="txtbrachdetails" class="form-control" onkeypress="return number(event)" placeholder="" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label class="floating-label" for="Email">State  :</label>

                                        <asp:DropDownList ID="dd_state" OnSelectedIndexChanged="dd_state_SelectedIndexChanged" AutoPostBack="true" class="mb-3 form-control" runat="server">
                                           
                                        </asp:DropDownList>
                                    </div>
                                </div>

                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label class="floating-label" for="Text">District : </label>
                                        <asp:DropDownList ID="dd_district" class="mb-3 form-control" runat="server">

                                        
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label class="floating-label" for="password">City :</label>
                                        <asp:TextBox ID="txtcity" class="form-control" onkeypress="return number(event)" placeholder="" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label class="floating-label" for="password">Address :</label>
                                        <asp:TextBox ID="txtaddress" TextMode="MultiLine" class="form-control" placeholder="" runat="server"></asp:TextBox>

                                    </div>
                                </div>

                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label class="floating-label" for="Text">User Image :</label>
                                        <span class="input-group-text">
                                            <asp:FileUpload class="fileupload" ID="fileuserimage" runat="server" />

                                            <%-- <input type="file" id="fileInput" multiple>
                                            <button id="uploadButton">Upload Images</button>--%>
                                        </span>
                                    </div>
                                    <%--<div class="custom-file">
                                            <input type="file" class="custom-file-input" id="inputGroupFile01">
                                            <label class="custom-file-label" for="inputGroupFile01">Choose file</label>
                                        </div>--%>
                                </div>

                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label class="floating-label" for="Text">Aadhar Image Font:</label>
                                        <span class="input-group-text">
                                            <asp:FileUpload class="fileupload" ID="fileadharfont" runat="server" /></span>
                                    </div>
                                    <%--<div class="custom-file">
                                            <input type="file" class="custom-file-input" id="inputGroupFile02">
                                            <label class="custom-file-label" for="inputGroupFile01">Choose file</label>
                                        </div>--%>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label class="floating-label" for="Text">Aadhar Image Back :</label>
                                        <span class="input-group-text">
                                            <asp:FileUpload class="fileupload" ID="fileadharback" runat="server" /></span>
                                    </div>
                                    <%-- <div class="custom-file">
                                            <input type="file" class="custom-file-input" id="inputGroupFile03">
                                            <label class="custom-file-label" for="inputGroupFile01">Choose file</label>
                                        </div>--%>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label class="floating-label" for="Text">Pancard Image :</label>
                                        <span class="input-group-text">
                                            <asp:FileUpload class="fileupload" ID="filepancard" runat="server" /></span>
                                    </div>
                                    <%-- <div class="custom-file">
                                            <input type="file" class="custom-file-input" id="inputGroupFile04">
                                            <label class="custom-file-label" for="inputGroupFile01">Choose file</label>
                                        </div>--%>
                                </div>



                                <div class="col-sm-4">
                                    <div class="form-group mt-4">
                                        <asp:Button ID="btn_reset" runat="server" class="btn  btn-danger" Text="Reset"></asp:Button>
                                        <asp:Button ID="btn_Update" runat="server" Visible="false" OnClick="btn_Update_Click" class="btn  btn-primary" Text="Update"></asp:Button>
                                        <asp:Button ID="btn_submit" Text="Submit"  OnClick="btn_submit_Click" runat="server" class="btn  btn-success"></asp:Button>
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
                                            <button type="button" style="" class="btn btn-dark mx-auto mt-4" id="btn_ok" data-dismiss="modal">Ok</button>
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
<%--                            <div class="row">
                                <div id="preview" runat="server"></div>
                                <div class="col-sm-3">
                                    <div class="card-body" style="padding: 7px">
                                        <div class="card mb-3">
                                            <img class="img-fluid card-img-top" src="assets/images/slider/img-slide-3.jpg" alt="Card image cap" />
                                        </div>
                                    </div>
                                </div>

                            </div>--%>
                    </div>
                </div>

            </div>
        </div>

    </div>
    <script type="text/javascript">
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
