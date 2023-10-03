<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ProductAssign.aspx.cs" Inherits="Productmanagement.AdminModule.ProductAssign" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="pcoded-content">
        <div class="row">
    <div class="col-sm-12">
                <div class="card">
                    <div class="card-header">
                        <h5>Product Assign List </h5>
                    </div>
                    <div class="card-body">
                        <for>
                            <div class="row">
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label class="floating-label" for="Email">Category</label>
                                        <input type="email" class="form-control" id="Email" aria-describedby="emailHelp" value="123">
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label class="floating-label" for="Text">Sub Category</label>
                                        <input type="text" class="form-control" id="Text" placeholder="123">
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label class="floating-label" for="password"></label>
                                        <input type="password" class="form-control" id="password" placeholder="">
                                    </div>
                                </div>
                            </div>
                        </for>
                    </div>
                </div>
            </div>
            </div>
        </div>
</asp:Content>
