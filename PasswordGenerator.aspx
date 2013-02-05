<%@ Page Title="Password Generator" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="PasswordGenerator.aspx.cs" Inherits="RajLab.PasswordGenerator" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        Simple random password generator generates random passwords using following character
        a..A, A..Z,0..9. Please select number of passwords you want to generated and password
        length</div>
    <table class="style1">
        <tr>
            <td width="150" style="font-weight: bold">
                Number Of Passwords
            </td>
            <td width="150">
                <asp:TextBox ID="txtNoOfPasswords" runat="server" Text="5" ValidationGroup="btnGenerate"></asp:TextBox>
            </td>
            <td style="font-style: italic">
                <asp:RangeValidator ID="RangeValidator1" ControlToValidate="txtNoOfPasswords" MinimumValue="1"
                    MaximumValue="100" runat="server" ErrorMessage="Minimum No Of Passwords:1, Maximum No Of Passwords: 100"
                    ForeColor="red" ValidationGroup="btnGenerate" Type="Integer"></asp:RangeValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtNoOfPasswords"
                    runat="server" ErrorMessage="*" ForeColor="red" ValidationGroup="btnGenerate"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td width="150" style="font-weight: bold">
                Password Length
            </td>
            <td width="150">
                <asp:TextBox ID="txtBoxPasswordLength" runat="server" Text="5" ValidationGroup="btnGenerate"></asp:TextBox>
            </td>
            <td style="font-style: italic">
                <asp:RangeValidator ID="RangeValidator2" ControlToValidate="txtBoxPasswordLength"
                    MinimumValue="1" MaximumValue="10" runat="server" ErrorMessage="Minimum Password Length:1, Maximum Password Length: 10"
                    ForeColor="red" Display="Dynamic" ValidationGroup="btnGenerate" Type="Integer"></asp:RangeValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtBoxPasswordLength"
                    runat="server" ErrorMessage="*" ForeColor="red" Display="Dynamic" ValidationGroup="btnGenerate"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
            <td>
                <asp:Button ID="btnGenerate" runat="server" OnClick="btnGenerate_Click" Text="Generate"
                    ValidationGroup="btnGenerate" />
            </td>
        </tr>
    </table>
    <asp:PlaceHolder ID="passwordsPlaceHolder" runat="server"></asp:PlaceHolder>
</asp:Content>
