<%@ Page Title="GUID Generator" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GuidGenerator.aspx.cs" Inherits="RajLab.GuidGenerator" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <span>GUIDs are usually stored as 128-bit values, and are commonly displayed as 32 hexadecimal digits with groups separated by hyphens, such as 21EC2020-3AEA-1069-A2DD-08002B30309D</span>
    <br />
    <br />
    <table class="style1">
        <tr>
            <td width="150" style="font-weight: bold">
                Number Of Guids
            </td>
            <td width="150">
                <asp:TextBox ID="txtNoOfGuids" runat="server" Text="1" ValidationGroup="btnGenerate" ></asp:TextBox>
            </td>
            <td style="font-style: italic">
                <asp:RangeValidator ID="RangeValidator1" ControlToValidate="txtNoOfGuids" MinimumValue="1"
                    MaximumValue="10" runat="server" ErrorMessage="Minimum No Of GUIDs:1, Maximum No Of GUIDs: 10"
                    ForeColor="red"  ValidationGroup="btnGenerate" Type="Integer" ></asp:RangeValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtNoOfGuids"
                    runat="server" ErrorMessage="*" ForeColor="red"  ValidationGroup="btnGenerate" ></asp:RequiredFieldValidator>
            </td>
        </tr>
        

        <tr>
            <td>
                &nbsp;
            </td>
            <td>
                <asp:Button ID="btnGenerate" runat="server" OnClick="btnGenerate_Click" Text="Generate" ValidationGroup="btnGenerate" />

            </td>
        </tr>
    </table>
    <asp:PlaceHolder ID="placeHolder" runat="server"></asp:PlaceHolder>
</asp:Content>

