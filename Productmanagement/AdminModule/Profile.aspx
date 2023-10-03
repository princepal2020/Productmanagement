<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Productmanagement.AdminModule.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../style.css" rel="stylesheet" />

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="content">
        <div class="row">
            <div class="col-sm-5 col-6 py-3 mx-auto">
                <h4 class="page-title">My Profile</h4>
            </div>

            <div class="col-sm-5 col-6 text-right m-b-30  py-3">
                <asp:LinkButton ID="btn_edit" runat="server" OnClick="btn_edit_Click" class="btn btn-primary btn-rounded"><i class="fa fa-plus"></i>Edit Profile</asp:LinkButton>
            </div>
        </div>
        <div class="card-box profile-header">
            <div class="row">
                <div class="col-md-12">
                    <div class="profile-view">
                        <div class="profile-img-wrap">
                            <div class="profile-img">
                                <a href="#">
                                    <img class="avatar" src="assets/img/doctor-03.jpg" runat="server" id="image" alt=""></a>
                            </div>
                        </div>
                        <div class="profile-basic">
                            <div class="row">
                                <div class="col-md-5">
                                    <div class="profile-info-left">

                                        <ul class="personal-info">
                                            <li>
                                                <span class="title">User Name :</span>
                                                <span class="text" runat="server" id="husername"></span>
                                            </li>
                                            <li>
                                                <span class="title">User Id :</span>
                                                <span class="text" runat="server" id="userid"></span>
                                            </li>


                                            <li>
                                                <span class="title">User Role :</span>
                                                <span class="text" runat="server" id="usertype"></span>
                                            </li>
                                            <li>
                                                <span class="title">Birthday  :</span>
                                                <span class="text" runat="server" id="dob"></span>
                                            </li>
                                            <li>
                                                <span class="title">Gender:</span>
                                                <span class="text" runat="server" id="gender"></span>
                                            </li>
                                            <li>
                                                <span class="title">Aadhar No:</span>
                                                <span class="text" runat="server" id="sadharrno"></span>
                                            </li>
                                            <li>
                                                <span class="title">Pan No:</span>
                                                <span class="text" runat="server" id="spanno"></span>
                                            </li>
                                             <li>
                                            <span class="title">GSTIN No:</span>
                                            <span class="text" runat="server" id="sgstiono"></span>
                                        </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col-md-7">
                                    <ul class="personal-info">
                                        <li>
                                            <span class="title">Mobile No:</span>
                                            <span class="text" runat="server" id="amobile"></span>
                                        </li>
                                        <li>
                                            <span class="title">Email Id :</span>
                                            <span class="text" runat="server" id="aemail"></span>
                                        </li>

                                        <li>
                                            <span class="title">Address:</span>
                                            <span class="text" runat="server" id="address"></span>
                                        </li>
                                        <li>
                                            <span class="title">State:</span>
                                            <span class="text" runat="server" id="State"></span>
                                        </li>
                                        <li>
                                            <span class="title">District :</span>
                                            <span class="text" runat="server" id="District"></span>
                                        </li>
                                        <li>
                                            <span class="title">Pin Code :</span>
                                            <span class="text" runat="server" id="pincode"></span>
                                        </li>
                                        <li>
                                            <span class="title">City :</span>
                                            <span class="text" runat="server" id="Scity"></span>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="exampleModalLive1" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="exampleModalLiveLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                </div>
                <div class="modal-body">
                    <div class="content" id="editprofile">
                        <div class="row">
                            <div class="col-sm-12">
                                <h4 class="page-title">Edit Profile</h4>
                            </div>
                        </div>
                        <for>
                            <div class="card-box">
                                <h3 class="card-title">Basic Informations</h3>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="profile-img-wrap">
                                            <img class="inline-block" src="../AdminModule/assets/images/user.jpg" runat="server" alt="user" id="profile_image">
                                            
                                            <div class="fileupload btn">

                                                <asp:FileUpload runat="server" Style="padding: 0px!important; width: 94%; line-height: normal" onchange="loadFile(event)" ID="file" />

                                            </div>

                                        </div>
                                        <div class="profile-basic">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">

                                                        <label class="focus-label">User Id</label>
                                                        <asp:Label runat="server" ID="lbluserid" class="form-control " placeholder="Enter Name .."></asp:Label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">

                                                        <label class="focus-label">Name</label>
                                                        <asp:TextBox runat="server" ID="txtname" class="form-control " placeholder="Enter Name .."></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group ">
                                                        <label class="focus-label">Mobile No</label>

                                                        <asp:TextBox runat="server" ID="txtmobile" class="form-control " onkeypress="return number(event)" MaxLength="10" placeholder="Enter Mobile No .."></asp:TextBox>

                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group ">
                                                        <label class="focus-label">Email Id</label>
                                                        <div class="cal-icon">
                                                            <asp:TextBox runat="server" ID="txtemail" class="form-control " placeholder="Enter Email id .."></asp:TextBox>


                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card-box">
                                <h3 class="card-title">Contact Informations</h3>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group ">
                                            <label class="focus-label">Address</label>

                                            <asp:TextBox runat="server" ID="txtaddress" class="form-control " placeholder="Enter Address .."></asp:TextBox>

                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group ">
                                            <label class="focus-label">State</label>
                                            <asp:DropDownList ID="dd_state" runat="server" OnSelectedIndexChanged="dd_state_SelectedIndexChanged" AutoPostBack="true" class="form-control "></asp:DropDownList>

                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group ">
                                            <label class="focus-label">District</label>
                                            <asp:DropDownList ID="dd_district" runat="server" class="form-control "></asp:DropDownList>
                                        </div>

                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group ">
                                            <label class="focus-label">City</label>
                                            <asp:TextBox runat="server" ID="txtcity" class="form-control " placeholder="Enter City .."></asp:TextBox>

                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group ">
                                            <label class="focus-label">Pin Code </label>

                                            <asp:TextBox runat="server" ID="txtpincode" MaxLength="6" onkeypress="return number(event)" class="form-control " placeholder="Enter Pin Code .."></asp:TextBox>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="text-center m-t-20">
                                <asp:Button runat="server" ID="btn_save" class="btn btn-primary submit-btn" Text="Save" OnClick="btn_save_Click" />
                            </div>
                        </for>
                    </div>
                </div>
            </div>
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
                                            
                                            <button type="button" style="" runat="server"  id="okdefault"  class="btn btn-dark mx-auto mt-4"  data-dismiss="modal">Ok</button>
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
                                            <button type="button" style=""  class="btn btn-dark mx-auto mt-4" data-dismiss="modal">Ok</button>
                                           
                                            <br />
                                        </div>
                                    </div>
                                </div>
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
        // Get references to the HTML elements
        function toggleFileUpload() {
            var fileUpload = document.getElementById('<%= file.ClientID %>'); // Get the FileUpload control by its ClientID
            if (fileUpload.style.display === 'none' || fileUpload.style.display === '') {
                fileUpload.style.display = 'block'; // Show the control
            } else {
                fileUpload.style.display = 'none'; // Hide the control
            }
        }

    </script>



</asp:Content>
