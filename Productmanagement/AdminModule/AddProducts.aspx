<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AddProducts.aspx.cs" Inherits="Productmanagement.AdminModule.AddProducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../assets/css/all.css" rel="stylesheet" />
    <link href="../assets/css/tailwind.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="pcoded-content">
        <div class="row">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-header">

                        <div class="row  ">
                            <div class="col-sm-7">
                                <h5>Add Products</h5>
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
                                <div class="col-sm-12">
                                    <div class="row">
                                       <div class="col-sm-4">
                                    <div class="form-group">
                                        <label class="floating-label" for="Email">Category  :</label>
                                     
                                        <asp:DropDownList ID="category" OnSelectedIndexChanged="category_SelectedIndexChanged" AutoPostBack="true" class="mb-3 form-control" runat="server">
                                 
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div id="exampleModalLive1" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="exampleModalLiveLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLiveLabel1" style="font-weight: 600; font-size: 15px">Add Category </h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="row">
                                                    <div class="col-sm-10 mx-auto">
                                                        <div class="form-group">
                                                            <label class="floating-label" for="password">Category Name :</label>
                                                            <asp:TextBox ID="txtcategoryname" class="form-control" placeholder="" runat="server"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-10 mx-auto">
                                                        <div class="form-group">
                                                            <label class="floating-label" for="password">Category Description    :</label>
                                                            <asp:TextBox ID="txtDescription" TextMode="MultiLine" class="form-control" placeholder="" runat="server"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn  btn-danger" data-dismiss="modal">Cencel</button>
                                                <asp:Button ID="btn_CSave" Text="Submit" OnClick="btn_CSave_Click" runat="server" class="btn  btn-success"></asp:Button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label class="floating-label" for="Text">Sub Category : </label>
                                        <asp:DropDownList ID="categorysub" class="mb-3 form-control" runat="server">

                                            <asp:ListItem Value="0"> -- Select Sub Category
                                            </asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div id="exampleModalLive" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="exampleModalLiveLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLiveLabel" style="font-weight: 600; font-size: 15px">Add Sub Category :</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="row">
                                                    <div class="col-sm-10 mx-auto">
                                                        <div class="form-group">
                                                            <label class="floating-label" for="password">Category Select :</label>
                                                            <asp:DropDownList ID="dd_seletcategory" class="mb-3 form-control" runat="server">

                                                                <asp:ListItem Value="0">Default select
                                                                </asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-10 mx-auto">
                                                        <div class="form-group">
                                                            <label class="floating-label" for="password">Sub Category  Name   :</label>
                                                            <asp:TextBox ID="txtsubcategoryname" class="form-control" placeholder="" runat="server"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-10 mx-auto">
                                                        <div class="form-group">
                                                            <label class="floating-label" for="password">Sub Category  Description   :</label>
                                                            <asp:TextBox ID="txtsubDescription" class="form-control" placeholder="" runat="server"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>



                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn  btn-danger" data-dismiss="modal">Cencel</button>
                                                <asp:Button ID="btn_sbSave" OnClick="btn_sbSave_Click" Text="Submit" runat="server" class="btn  btn-success"></asp:Button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label class="floating-label" for="password">Product Name :</label>
                                        <asp:TextBox ID="txtproductname" class="form-control" placeholder="" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                              <div class="col-sm-4">
                                    <div class="form-group">
                                        <label class="floating-label" for="password">Barcode:</label>
                                        <asp:TextBox ID="txtbarcode" class="form-control" onkeypress="return number(event)" placeholder="" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label class="floating-label" for="password">Brand Name :</label>
                                        <asp:TextBox ID="txtbrandname" class="form-control" placeholder="" runat="server"></asp:TextBox>

                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label class="floating-label" for="password">Serial No:</label>
                                        <asp:TextBox ID="txtserialno" class="form-control" onkeypress="return number(event)" placeholder="" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                        <div class="col-sm-4">
                                    <div class="form-group">
                                        <label class="floating-label" for="password">HSN Code:</label>
                                        <asp:TextBox ID="txtshncode" class="form-control" onkeypress="return number(event)" placeholder="" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label class="floating-label" for="password">Product Discriptions :</label>
                                        <asp:TextBox ID="txtproductDiscriptions" TextMode="MultiLine" class="form-control" placeholder="" runat="server"></asp:TextBox>

                                    </div>
                                </div>

                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label class="floating-label" for="Text">Product Image :</label>
                                        <span class="input-group-text">
                                            <asp:FileUpload class="fileupload" onchange="loadFile(event)" ID="productimage1" runat="server" />

                                           <%-- <input type="file" id="fileInput" multiple>
                                            <button id="uploadButton">Upload Images</button>--%>
                                        </span>
                                    </div>
                                    <%--<div class="custom-file">
                                            <input type="file" class="custom-file-input" id="inputGroupFile01">
                                            <label class="custom-file-label" for="inputGroupFile01">Choose file</label>
                                        </div>--%>
                                </div>
                                        </div>
                                </div>
                             </div>
                            <div class="row">
                                <div class="col-sm-8">
                                    <div class="row">
                                      
                                

                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label class="floating-label" for="Text">Product Image Second :</label>
                                        <span class="input-group-text">
                                            <asp:FileUpload class="fileupload" ID="productimage2" onchange="loadFile(event)" runat="server" /></span>
                                    </div>
                                    <%--<div class="custom-file">
                                            <input type="file" class="custom-file-input" id="inputGroupFile02">
                                            <label class="custom-file-label" for="inputGroupFile01">Choose file</label>
                                        </div>--%>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label class="floating-label" for="Text">Product Image Third :</label>
                                        <span class="input-group-text">
                                            <asp:FileUpload class="fileupload" ID="productimage3" onchange="loadFile(event)" runat="server" /></span>
                                    </div>
                                    <%-- <div class="custom-file">
                                            <input type="file" class="custom-file-input" id="inputGroupFile03">
                                            <label class="custom-file-label" for="inputGroupFile01">Choose file</label>
                                        </div>--%>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label class="floating-label" for="Text">Product Image Fourth :</label>
                                        <span class="input-group-text">
                                            <asp:FileUpload class="fileupload" ID="productimage4" onchange="loadFile(event)" runat="server" /></span>
                                    </div>
                                    <%-- <div class="custom-file">
                                            <input type="file" class="custom-file-input" id="inputGroupFile04">
                                            <label class="custom-file-label" for="inputGroupFile01">Choose file</label>
                                        </div>--%>
                                </div>

                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label class="floating-label" for="Text">Product Image Fifth :</label>
                                        <span class="input-group-text">
                                            <asp:FileUpload class="fileupload" ID="productimage5" onchange="loadFile(event)" runat="server" /></span>
                                    </div>
                                    <%-- <div class="custom-file">
                                            <input type="file" class="custom-file-input" id="inputGroupFile05">
                                            <label class="custom-file-label"  for="inputGroupFile01">Choose file</label>
                                        </div>--%>
                                </div>

                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label class="floating-label" for="Text">Product Image Six :</label>
                                        <span class="input-group-text">
                                            <asp:FileUpload class="fileupload" ID="productimage6" onchange="loadFile(event)" runat="server" /></span>


                                    </div>
                                    <%--     <div class="custom-file">
                                            <%--<input type="file" class="custom-file-input" id="inputGroupFile06" name="image" multiple="" onchange="image_change">
                                      <label class="custom-file-label" for="inputGroupFile01">Choose file</label>

                                        </div>--%>
                                </div>
                                             <div class="col-sm-6 py-1">
                                    <div class="form-group mt-4">
                                        <asp:Button ID="btn_reset" runat="server" class="btn  btn-danger" Text="Reset"></asp:Button>
                                        <asp:Button ID="btn_addstocks" runat="server" class="btn  btn-primary" Visible="false" OnClick="btn_addstocks_Click" Text="Add Stocks"></asp:Button>
                                        <asp:Button ID="btn_Update" Text="Update" OnClick="btn_Update_Click"  runat="server" class="btn  btn-primary"></asp:Button>
                                        <asp:Button ID="btn_submit" Text="Submit" OnClick="btn_submit_Click" runat="server" class="btn  btn-success"></asp:Button>
                                    </div>
                                </div>
                                    </div>
                                </div>
                            
                                <div class="col-sm-4 mx-auto">
                                    <div class="row">
                                        <div class="row" style="width: 100%">
                                                        <div class="col-sm-12">
                                                            <img src="../assets/img/top-view-perfectly-ordered-fitness-items.jpg" id="output" style="width: 100%; height: 220px" />
                                                            
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
                            </div>
                            
                    </div>
                </div>

            </div>
        </div>

    </div>
    <script type="text/javascript">
        var loadFile = function (event) {
            var image = document.getElementById("output");
            image.src = URL.createObjectURL(event.target.files[0]);
        };

        var m1, m2, m3, m4, m5, m6;
        var f1 = document.getElementById("productimage1");
        var f2 = document.getElementById("productimage2");
        var f3 = document.getElementById("productimage3");
        var f4 = document.getElementById("productimage4");
        var f5 = document.getElementById("productimage5");
        var f6 = document.getElementById("productimage6");
        var v1 = document.getElementById("1");
        f1.addEventListener("change", function (e) {
            m1 = new FileReader();
            m1.onload = function (e) {
                v1.src = e.target.result;
            };
            m1.readAsDataURL(this.files[0]);
        });
        f2.addEventListener("change", function (e) {
            m2 = new FileReader();
            m2.onload = function (e) {
                v1.src = e.target.result;
            };
            m2.readAsDataURL(this.files[0]);
            v1.setAttribute('data-active', 'active');
        });
        f3.addEventListener("change", function (e) {
            m3 = new FileReader();
            m3.onload = function (e) {
                v1.src = e.target.result;
            };
            m3.readAsDataURL(this.files[0]);
        });
        f4.addEventListener("change", function (e) {
            m4 = new FileReader();
            m4.onload = function (e) {
                v1.src = e.target.result;
            };
            m4.readAsDataURL(this.files[0]);
        });
        f5.addEventListener("change", function (e) {
            m5 = new FileReader();
            m5.onload = function (e) {
                v1.src = e.target.result;
            };
            m5.readAsDataURL(this.files[0]);
        });
        f6.addEventListener("change", function (e) {
            m6 = new FileReader();
            m6.onload = function (e) {
                v1.src = e.target.result;
            };
            m6.readAsDataURL(this.files[0]);
        });
    
        var button = document.getElementById("btn_ok");
        debugger
        // Add a click event listener to the button
        button.addEventListener("click", function () {
            // Redirect to the desired URL
            window.location.href = "ProductsList.aspx"; // Replace with the URL you want to redirect to
        });
        document.getElementById('uploadButton').addEventListener('click', function () {
            const fileInput = document.getElementById('fileInput');

            const preview = document.getElementById('preview');

            if (fileInput.files.length > 0) {
                if (fileInput.files.length < 6) {
                    alert('You can upload a maximum of 6 images only.');
                    return;
                }

                for (const file of fileInput.files) {
                    const img = document.createElement('img');
                    img.src = URL.createObjectURL(file);
                    img.style.maxWidth = '200px';
                    img.style.margin = '10px';
                    preview.appendChild(img);
                }
            } else {
                alert('Please select one or more images to upload.');
            }
        });
        //$(ducument).ready(function () {
        //    debugger
        //    $("#fileupload").change(function (e) {
        //        var url = $("#fileupload").val();
        //        var ext = url.substring(url.lastIndexOf('.') + 1).toLowerCase();
        //        if (chooceImg.files && chooceImg.files[0] && (ext == "jpg" || ext == "png" || ext == "jpeg")) {
        //            var reader = new FileReader();
        //            reader.onload = function () {
        //                var output = document.getElementById('pimage');
        //                output.src = reader.result;
        //            }
        //            reader.readAsDataURL(e.target.files[0]);
        //        }
        //    })
        //})
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



    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/js/all.min.js" integrity="sha512-uKQ39gEGiyUJl4AI6L+ekBdGKpGw4xJ55+xyJG7YFlJokPNYegn9KwQ3P8A7aFQAUtUsAQHep+d/lrGqrbPIDQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>



</asp:Content>
