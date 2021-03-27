<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Restaurant.aspx.cs" Inherits="New_Online_Good_Food.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;RESTAURANT&quot; WHERE &quot;REGISTRATION_NUMBER&quot; = :REGISTRATION_NUMBER" InsertCommand="INSERT INTO &quot;RESTAURANT&quot; (&quot;REGISTRATION_NUMBER&quot;, &quot;NAME&quot;, &quot;PHONE_NUMBER&quot;, &quot;REGISTERED_DATE&quot;) VALUES (:REGISTRATION_NUMBER, :NAME, :PHONE_NUMBER, :REGISTERED_DATE)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;RESTAURANT&quot;" UpdateCommand="UPDATE &quot;RESTAURANT&quot; SET &quot;NAME&quot; = :NAME, &quot;PHONE_NUMBER&quot; = :PHONE_NUMBER, &quot;REGISTERED_DATE&quot; = :REGISTERED_DATE WHERE &quot;REGISTRATION_NUMBER&quot; = :REGISTRATION_NUMBER">
    <DeleteParameters>
        <asp:Parameter Name="REGISTRATION_NUMBER" Type="String" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="REGISTRATION_NUMBER" Type="String" />
        <asp:Parameter Name="NAME" Type="String" />
        <asp:Parameter Name="PHONE_NUMBER" Type="String" />
        <asp:Parameter Name="REGISTERED_DATE" Type="DateTime" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="NAME" Type="String" />
        <asp:Parameter Name="PHONE_NUMBER" Type="String" />
        <asp:Parameter Name="REGISTERED_DATE" Type="DateTime" />
        <asp:Parameter Name="REGISTRATION_NUMBER" Type="String" />
    </UpdateParameters>
</asp:SqlDataSource>
    <asp:FormView ID="FormView1" runat="server" style="margin-top:40px;" DataKeyNames="REGISTRATION_NUMBER" DataSourceID="SqlDataSource1">
      
        <EditItemTemplate>
            REGISTRATION_NUMBER:
            <asp:Label ID="REGISTRATION_NUMBERLabel1" runat="server" Text='<%# Eval("REGISTRATION_NUMBER") %>' />
            <br />
            NAME:
            <asp:TextBox ID="NAMETextBox" runat="server" Text='<%# Bind("NAME") %>' />
            <br />
            PHONE_NUMBER:
            <asp:TextBox ID="PHONE_NUMBERTextBox" runat="server" Text='<%# Bind("PHONE_NUMBER") %>' />
            <br />
            REGISTERED_DATE:
            <asp:TextBox ID="REGISTERED_DATETextBox" runat="server" Text='<%# Bind("REGISTERED_DATE") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
      
        <InsertItemTemplate>
            <label style="margin-right:29px;">Registration Number</label>
            <asp:TextBox ID="REGISTRATION_NUMBERTextBox" runat="server" Text='<%# Bind("REGISTRATION_NUMBER") %>' />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="REGISTRATION_NUMBERTextBox" ErrorMessage="Registration Number is required." ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
             
            <label style="margin-right:135px;">Name</label>&nbsp;<asp:TextBox ID="NAMETextBox" runat="server" Text='<%# Bind("NAME") %>' />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="NAMETextBox" ErrorMessage="Restaurant Name is required." ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <label style="margin-right:70px;">Phone Number</label>
             <asp:TextBox ID="PHONE_NUMBERTextBox" runat="server" Text='<%# Bind("PHONE_NUMBER") %>' />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="PHONE_NUMBERTextBox" ErrorMessage="Phone Number is required." ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <label style="margin-right:63px;">Registered Date</label>
            <asp:TextBox ID="REGISTERED_DATETextBox" runat="server" Text='<%# Bind("REGISTERED_DATE") %>' />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="REGISTERED_DATETextBox" ErrorMessage="Registered Date is required." ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
                        <br />
                        
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CssClass="btn btn-primary" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" cssClass="btn btn-warning"  CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
           
           
           
            <br />

            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CssClass="btn btn-success" CommandName="New" Text="Add New Restaurant" />
        </ItemTemplate>
    </asp:FormView>
    <asp:GridView ID="GridView1" CssClass="table table-striped table-dark" style="margin-top:50px; " runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="REGISTRATION_NUMBER" DataSourceID="SqlDataSource1" Height="319px" Width="1150px">
        <Columns >
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="REGISTRATION_NUMBER" HeaderText="Registration Number" ReadOnly="True" SortExpression="REGISTRATION_NUMBER" >
            <HeaderStyle ForeColor="#009933" />
            </asp:BoundField>
            <asp:BoundField DataField="NAME" HeaderText="Name" SortExpression="NAME" >
            <HeaderStyle ForeColor="#009933" />
            </asp:BoundField>
            <asp:BoundField DataField="PHONE_NUMBER" HeaderText="Phone Number" SortExpression="PHONE_NUMBER" >
            <HeaderStyle ForeColor="#009933" />
            </asp:BoundField>
            <asp:BoundField DataField="REGISTERED_DATE" HeaderText="Registered Date" SortExpression="REGISTERED_DATE" >
            <HeaderStyle ForeColor="#009933" />
            </asp:BoundField>
        </Columns>
</asp:GridView>

    <br />
    <br />

</asp:Content>
