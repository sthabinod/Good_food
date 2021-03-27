<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Address.aspx.cs" Inherits="New_Online_Good_Food.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;ADDRESS&quot; WHERE &quot;ADDRESS_ID&quot; = :ADDRESS_ID" InsertCommand="INSERT INTO &quot;ADDRESS&quot; (&quot;ADDRESS_ID&quot;, &quot;LONGITUDE&quot;, &quot;LATITUDE&quot;, &quot;CITY&quot;, &quot;STREET&quot;) VALUES (:ADDRESS_ID, :LONGITUDE, :LATITUDE, :CITY, :STREET)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;ADDRESS&quot;" UpdateCommand="UPDATE &quot;ADDRESS&quot; SET &quot;LONGITUDE&quot; = :LONGITUDE, &quot;LATITUDE&quot; = :LATITUDE, &quot;CITY&quot; = :CITY, &quot;STREET&quot; = :STREET WHERE &quot;ADDRESS_ID&quot; = :ADDRESS_ID">
    <DeleteParameters>
        <asp:Parameter Name="ADDRESS_ID" Type="String" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="ADDRESS_ID" Type="String" />
        <asp:Parameter Name="LONGITUDE" Type="String" />
        <asp:Parameter Name="LATITUDE" Type="String" />
        <asp:Parameter Name="CITY" Type="String" />
        <asp:Parameter Name="STREET" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="LONGITUDE" Type="String" />
        <asp:Parameter Name="LATITUDE" Type="String" />
        <asp:Parameter Name="CITY" Type="String" />
        <asp:Parameter Name="STREET" Type="String" />
        <asp:Parameter Name="ADDRESS_ID" Type="String" />
    </UpdateParameters>
</asp:SqlDataSource>
    <asp:FormView ID="FormView1" runat="server" style="margin-top:40px;" DataKeyNames="ADDRESS_ID" DataSourceID="SqlDataSource1">
      
        <EditItemTemplate>
            ADDRESS_ID:
            <asp:Label ID="ADDRESS_IDLabel1" runat="server" Text='<%# Eval("ADDRESS_ID") %>' />
            <br />
            LONGITUDE:
            <asp:TextBox ID="LONGITUDETextBox" runat="server" Text='<%# Bind("LONGITUDE") %>' />
            <br />
            LATITUDE:
            <asp:TextBox ID="LATITUDETextBox" runat="server" Text='<%# Bind("LATITUDE") %>' />
            <br />
            CITY:
            <asp:TextBox ID="CITYTextBox" runat="server" Text='<%# Bind("CITY") %>' />
            <br />
            STREET:
            <asp:TextBox ID="STREETTextBox" runat="server" Text='<%# Bind("STREET") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
      
        <InsertItemTemplate>
            <label style="margin-right:38px;">Address Id</label>
            <asp:TextBox ID="ADDRESS_IDTextBox" runat="server" Text='<%# Bind("ADDRESS_ID") %>' />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ADDRESS_IDTextBox" ErrorMessage="Address Code requried." ForeColor="Red"></asp:RequiredFieldValidator>
            <br />

            <label style="margin-right:40px;">Longitude</label>
            <asp:TextBox ID="LONGITUDETextBox" runat="server" Text='<%# Bind("LONGITUDE") %>' />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="LONGITUDETextBox" ErrorMessage="Longitude is required." ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
             
            <label style="margin-right:55px;">Latitude</label>
            <asp:TextBox ID="LATITUDETextBox" runat="server" Text='<%# Bind("LATITUDE") %>' />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="LATITUDETextBox" ErrorMessage="Latitude is required." ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <label style="margin-right:89px;">City</label><asp:TextBox ID="CITYTextBox" runat="server" Text='<%# Bind("CITY") %>' />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="CITYTextBox" ErrorMessage="City is required." ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <label style="margin-right:71px;">Street</label>
            <asp:TextBox ID="STREETTextBox" runat="server" Text='<%# Bind("STREET") %>' />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="STREETTextBox" ErrorMessage="Street field is required." ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CssClass="btn btn-primary" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CssClass="btn btn-warning"  CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
           

          
        
         
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" CssClass="btn btn-success" Text="Add New Address" />
        </ItemTemplate>
    </asp:FormView>
    <asp:GridView ID="GridView1" CssClass="table table-striped table-dark" style="margin-top:50px; " runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ADDRESS_ID" DataSourceID="SqlDataSource1" Height="319px" Width="1150px">
        <Columns >
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="ADDRESS_ID" HeaderText="Address Code" ReadOnly="True" SortExpression="ADDRESS_ID" >
            <HeaderStyle ForeColor="#009933" />
            </asp:BoundField>
            <asp:BoundField DataField="LONGITUDE" HeaderText="Longitude" SortExpression="LONGITUDE" >
            <HeaderStyle ForeColor="#009933" />
            </asp:BoundField>
            <asp:BoundField DataField="LATITUDE" HeaderText="Latitude" SortExpression="LATITUDE" >
            <HeaderStyle ForeColor="#009933" />
            </asp:BoundField>
            <asp:BoundField DataField="CITY" HeaderText="City" SortExpression="CITY" >
            <HeaderStyle ForeColor="#009933" />
            </asp:BoundField>
            <asp:BoundField DataField="STREET" HeaderText="Street" SortExpression="STREET" >
            <HeaderStyle ForeColor="#009933" />
            </asp:BoundField>
        </Columns>
</asp:GridView>

    <br />
    <br />

</asp:Content>
