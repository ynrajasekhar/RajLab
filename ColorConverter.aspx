<%@ Page Title="Color Converter" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="ColorConverter.aspx.cs" Inherits="RajLab.ColorConverter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <fieldset>
        <legend>RGB to Hex</legend>
        <label for="txtR">
            R:</label>
        <asp:TextBox runat="server" ID="txtR" Width="50" ValidationGroup="btnRGBToHex" />
        <asp:RangeValidator ID="RangeValidator1" ControlToValidate="txtR" MinimumValue="0"
            MaximumValue="255" runat="server" ErrorMessage="0 to 255" ForeColor="red" Type="Integer"
            Display="Dynamic" ValidationGroup="btnRGBToHex"></asp:RangeValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtR"
            runat="server" ErrorMessage="*" ForeColor="red" ValidationGroup="btnRGBToHex"></asp:RequiredFieldValidator>
        <label for="txtG">
            G:
        </label>
        <asp:TextBox runat="server" ID="txtG" Width="50" ValidationGroup="btnRGBToHex" />
        <asp:RangeValidator ID="RangeValidator2" ControlToValidate="txtG" MinimumValue="0"
            MaximumValue="255" runat="server" ErrorMessage="0 to 255" ForeColor="red" Type="Integer"
            Display="Dynamic" ValidationGroup="btnRGBToHex"></asp:RangeValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtG"
            runat="server" ErrorMessage="*" ForeColor="red" ValidationGroup="btnRGBToHex"></asp:RequiredFieldValidator>
        <label for="txtB">
            B:</label>
        <asp:TextBox runat="server" ID="txtB" Width="50" ValidationGroup="btnRGBToHex" />
        <asp:RangeValidator ID="RangeValidator3" ControlToValidate="txtB" MinimumValue="0"
            MaximumValue="255" runat="server" ErrorMessage="0 to 255" ForeColor="red" Type="Integer"
            Display="Dynamic" ValidationGroup="btnRGBToHex"></asp:RangeValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtB"
            runat="server" ErrorMessage="*" ForeColor="red" ValidationGroup="btnRGBToHex"></asp:RequiredFieldValidator>
        <asp:Button runat="server" ID="btnRGBToHex" Text="Convert" OnClick="btnRGBToHex_Click"
            ValidationGroup="btnRGBToHex" />
        <span style="width: 10; height: 10" runat="server" id="spanHexBox">&nbsp;&nbsp;&nbsp;&nbsp;</span>
        <label for="lblHex">
            Hex:
        </label>
        <asp:Label ID="lblHex" runat="server" Text=""></asp:Label>
    </fieldset>
    <fieldset>
        <legend>Hex to RGB</legend>
        <label for="txtHex">
            Hex:</label>
        <asp:TextBox runat="server" ID="txtHex" Width="50" ValidationGroup="btnHexToRGB" />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txtHex"
            runat="server" ErrorMessage="*" ForeColor="red" ValidationGroup="btnHexToRGB"></asp:RequiredFieldValidator>
        <asp:Label ID="lblStatus" runat="server" Text="" ForeColor="Red" Font-Italic="True"
            Visible="False"></asp:Label>
        <asp:Button runat="server" ID="btnHexToRGB" Text="Convert" OnClick="btnHexToRGB_Click"
            ValidationGroup="btnHexToRGB" />
       <span style="width: 10; height: 10" runat="server" id="spanRGBBox">&nbsp;&nbsp;&nbsp;&nbsp;</span>
        <label for="lblR">
            R:</label>
        <asp:Label ID="lblR" runat="server" Text=""></asp:Label>
        <label for="lblG">
            G:</label>
        <asp:Label ID="lblG" runat="server" Text=""></asp:Label>
        <label for="lblB">
            B:</label>
        <asp:Label ID="lblB" runat="server" Text=""></asp:Label>
    </fieldset>
</asp:Content>
