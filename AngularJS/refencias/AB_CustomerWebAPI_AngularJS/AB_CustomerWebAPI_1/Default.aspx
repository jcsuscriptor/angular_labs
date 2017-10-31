<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AB_CustomerWebAPI_1._Default" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1>Customers</h1>
                
            </hgroup>
          
        </div>
    </section>
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h3>Get All Customers</h3>
    <input type="button" id="GetallCustomer" value="Display All Customer" />
    <ul id="Customers">
    </ul>
    <hr />
    <h3>Get by CustomerID</h3>
    <input id="txtCustomerID" type="text" /><input id="getCustomer" type="button" value="Get Customer by ID" />
    <ul id="Customer">
    </ul>
    <hr />
    <h3>New Customer</h3>
    <br />
    <input id="txtName" type="text" placeholder="Name" /><br />
    <input id="txtEmail" type="text" placeholder="Email" /><br />
    <input id="Btn_Add" type="button" value="Add" />
    <ul id="NewCustomer">
    </ul>
    <hr />
     <h3>Update Customer</h3>
    <br />
    <input id="CID" type="text" placeholder="Customer ID" /><br />
    <input id="Name" type="text" placeholder="Name" /><br />
    <input id="Email" type="text" placeholder="Email" /><br />
    <input id="updateCustomer" type="button" value="update" />
    <ul id="UpdateCustomerDetail">
    </ul>
    <hr />
    <h3>Delete Customer</h3>
    <input id="txtCustID" type="text" /><input id="deleteCustomer" type="button" value="Delete Customer by ID" />
    <ul id="deleteCustomerDetail">
    </ul>
    <hr />
   
    <script type="text/javascript">
        $('#GetallCustomer').click(function (e) {
            e.preventDefault();
            GetAllCustomers();
        });
        $('#getCustomer').click(function (e) {
            e.preventDefault();
            GetCustomer();
        });
        $('#Btn_Add').click(function (e) {
            e.preventDefault();
            AddCustomer();
        });
        $('#deleteCustomer').click(function (e) {
            e.preventDefault();
            DeleteEmployee();
        });
        $('#updateCustomer').click(function (e) {
            e.preventDefault();
            updateCustomer();
        });
        function GetAllCustomers() {
            jQuery.support.cors = true;
            $.ajax({
                url: '/api/Customers',
                type: 'GET',
                dataType: 'json',
                success: function (customers) {
                    $('#Customers').html('');
                    $.each(customers, function (index, customer) {
                        $('#Customers').append('<li>(' + customer.CustomerID + ') Name=' + customer.Name + ' Email=' + customer.Email + '</li>');
                    });

                },
                error: function (x, y, z) {
                    alert(x + '\n' + y + '\n' + z);
                }
            });
        }
        function GetCustomer() {

            jQuery.support.cors = true;
            var id = $('#txtCustomerID').val();
            if (id.length) {
                $('#Customer').html('');
                $.ajax({
                    url: 'api/Customers/' + id,
                    type: 'GET',
                    dataType: 'json',
                    success: function (customer) {
                        $('#Customer').html('<li>(' + customer.CustomerID + ') Name=' + customer.Name + ' Email=' + customer.Email + '</li>');
                    },
                    error: function (x, y, z) {
                        $('#Customer').html(z);
                        alert(x + '\n' + y + '\n' + z);
                    }
                });
            }
            else { $('#Customer').html('enter CustomerID'); }
        }
        function AddCustomer() {
            jQuery.support.cors = true;
            var customer = {
                Name: $('#txtName').val(),
                Email: $('#txtEmail').val()
            };

            $.ajax({
                url: 'api/Customers',
                type: 'POST',
                data: JSON.stringify(customer),
                contentType: "application/json;charset=utf-8",
                success: function (data) {
                    $('#NewCustomer').html('<li>(' + data.CustomerID + ') Name=' + data.Name + ' Email=' + data.Email + '</li>');
                },
                error: function (x, y, z) {
                    alert(x + '\n' + y + '\n' + z);
                }
            });
        }

        function DeleteEmployee() {
            jQuery.support.cors = true;
            var id = $('#txtCustID').val()

            $.ajax({
                url: 'api/Customers/' + id,
                type: 'DELETE',
                contentType: "application/json;charset=utf-8",
                success: function (data) {
                    if (data.CustomerID == id) $('#deleteCustomerDetail').html("Customer ID " + id + " deleted!!");

                },
                error: function (x, y, z) {
                    alert(x + '\n' + y + '\n' + z);
                }
            });
        }
        function updateCustomer() {
            jQuery.support.cors = true;
            var customer = {
                CustomerID: $('#CID').val(),
                Name: $('#Name').val(),
                Email: $('#Email').val()
            };

            $.ajax({
                url: 'api/Customers',
                type: 'PUT',
                data: JSON.stringify(customer),
                contentType: "application/json;charset=utf-8",
                success: function (data) {
                    $('#UpdateCustomerDetail').html('<li>(' + data.CustomerID + ') Name=' + data.Name + ' Email=' + data.Email + '</li>');
                },
                error: function (x, y, z) {
                    alert(x + '\n' + y + '\n' + z);
                }
            });
        }
    </script>
</asp:Content>
