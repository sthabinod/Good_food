<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Customer.aspx.cs" Inherits="New_Online_Good_Food.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;CUSTOMER&quot; WHERE &quot;CUSTOMER_ID&quot; = :CUSTOMER_ID" InsertCommand="INSERT INTO &quot;CUSTOMER&quot; (&quot;CUSTOMER_ID&quot;, &quot;GENDER&quot;, &quot;DELIVERY_ID&quot;, &quot;FULL_NAME&quot;, &quot;PHONE_NUMBER&quot;, &quot;EMAIL_ADDRESS&quot;) VALUES (:CUSTOMER_ID, :GENDER, :DELIVERY_ID, :FULL_NAME, :PHONE_NUMBER, :EMAIL_ADDRESS)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;CUSTOMER&quot;" UpdateCommand="UPDATE &quot;CUSTOMER&quot; SET &quot;GENDER&quot; = :GENDER, &quot;DELIVERY_ID&quot; = :DELIVERY_ID, &quot;FULL_NAME&quot; = :FULL_NAME, &quot;PHONE_NUMBER&quot; = :PHONE_NUMBER, &quot;EMAIL_ADDRESS&quot; = :EMAIL_ADDRESS WHERE &quot;CUSTOMER_ID&quot; = :CUSTOMER_ID">
    <DeleteParameters>
        <asp:Parameter Name="CUSTOMER_ID" Type="Decimal" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="CUSTOMER_ID" Type="Decimal" />
        <asp:Parameter Name="GENDER" Type="String" />
        <asp:Parameter Name="DELIVERY_ID" Type="String" />
        <asp:Parameter Name="FULL_NAME" Type="String" />
        <asp:Parameter Name="PHONE_NUMBER" Type="String" />
        <asp:Parameter Name="EMAIL_ADDRESS" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="GENDER" Type="String" />
        <asp:Parameter Name="DELIVERY_ID" Type="String" />
        <asp:Parameter Name="FULL_NAME" Type="String" />
        <asp:Parameter Name="PHONE_NUMBER" Type="String" />
        <asp:Parameter Name="EMAIL_ADDRESS" Type="String" />
        <asp:Parameter Name="CUSTOMER_ID" Type="Decimal" />
    </UpdateParameters>
</asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;ADDRESS_ID&quot;, &quot;CITY&quot; FROM &quot;ADDRESS&quot;"></asp:SqlDataSource>
    <asp:FormView ID="FormView1" runat="server" style="margin-top:40px; margin-bottom: 22px;" DataKeyNames="CUSTOMER_ID" DataSourceID="SqlDataSource1" Width="204px">
      
        <EditItemTemplate>
            CUSTOMER_ID:
            <asp:Label ID="CUSTOMER_IDLabel1" runat="server" Text='<%# Eval("CUSTOMER_ID") %>' />
            <br />
            GENDER:
            <asp:TextBox ID="GENDERTextBox" runat="server" Text='<%# Bind("GENDER") %>' />
            <br />
            DELIVERY_ID:
            <asp:TextBox ID="DELIVERY_IDTextBox" runat="server" Text='<%# Bind("DELIVERY_ID") %>' />
            <br />
            FULL_NAME:
            <asp:TextBox ID="FULL_NAMETextBox" runat="server" Text='<%# Bind("FULL_NAME") %>' />
            <br />
            PHONE_NUMBER:
            <asp:TextBox ID="PHONE_NUMBERTextBox" runat="server" Text='<%# Bind("PHONE_NUMBER") %>' />
            <br />
            EMAIL_ADDRESS:
            <asp:TextBox ID="EMAIL_ADDRESSTextBox" runat="server" Text='<%# Bind("EMAIL_ADDRESS") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
      
        <InsertItemTemplate>
            <label style="margin-right:40px;">Customer Id</label>
            <asp:TextBox ID="CUSTOMER_IDTextBox" runat="server" Text='<%# Bind("CUSTOMER_ID") %>' />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="CUSTOMER_IDTextBox" ErrorMessage="Custome Id is required." ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
             <label style="margin-right:74px;">Gender</label>
            <asp:TextBox ID="GENDERTextBox" runat="server" Text='<%# Bind("GENDER") %>' />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="GENDERTextBox" ErrorMessage="Gender is required." ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
             <label style="margin-right:32px;">Delivery Point</label><label><asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" Height="30px" Width="183px" DataTextField="CITY" DataValueField="ADDRESS_ID" SelectedValue='<%# Bind("delivery_id") %>'>
            </asp:DropDownList>
            </label>
&nbsp;<br />
            <label style="margin-right:58px;">Full Name</label><asp:TextBox ID="FULL_NAMETextBox" runat="server" Text='<%# Bind("FULL_NAME") %>' />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="FULL_NAMETextBox" ErrorMessage="Fullname is required." ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <label style="margin-right:18px;">Phone Number</label>
            <asp:TextBox ID="PHONE_NUMBERTextBox" runat="server" Text='<%# Bind("PHONE_NUMBER") %>' />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="PHONE_NUMBERTextBox" ErrorMessage="Phone number is required." ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <label style="margin-right:24px;">Email Address</label>
            <asp:TextBox ID="EMAIL_ADDRESSTextBox" runat="server" Text='<%# Bind("EMAIL_ADDRESS") %>' />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="EMAIL_ADDRESSTextBox" ErrorMessage="Email Address is required." ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <asp:LinkButton style="margin-top:20px;" ID="InsertButton" runat="server" CssClass="btn btn-primary" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton style="margin-top:20px;" ID="InsertCancelButton" runat="server" cssClass="btn btn-warning" CausesValidation="False"  CommandName="Cancel" Text="Cancel" />
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;ADDRESS_ID&quot;, &quot;CITY&quot;, &quot;STREET&quot; FROM &quot;ADDRESS&quot;"></asp:SqlDataSource>
        </InsertItemTemplate>
        <ItemTemplate>
          <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CssClass="btn btn-success" CommandName="New" Text="Add New Customer" />
        </ItemTemplate>
    </asp:FormView>
    <asp:GridView ID="GridView1" CssClass="table table-striped table-dark" style="margin-top:50px; " runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="CUSTOMER_ID" DataSourceID="SqlDataSource1" Height="319px" Width="1150px">
        <Columns >
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="CUSTOMER_ID" HeaderText="Customer Id" ReadOnly="True" SortExpression="CUSTOMER_ID" >
            <HeaderStyle ForeColor="#009933" />
            </asp:BoundField>
            <asp:BoundField DataField="GENDER" HeaderText="Gender" SortExpression="GENDER" >
            <HeaderStyle ForeColor="#009933" />
            </asp:BoundField>
            <asp:BoundField DataField="FULL_NAME" HeaderText="Full name" SortExpression="FULL_NAME" >
            <HeaderStyle ForeColor="#009933" />
            </asp:BoundField>
            <asp:BoundField DataField="PHONE_NUMBER" HeaderText="Phone Number" SortExpression="PHONE_NUMBER" >
            <HeaderStyle ForeColor="#009933" />
            </asp:BoundField>
            <asp:BoundField DataField="EMAIL_ADDRESS" HeaderText="Email Address" SortExpression="EMAIL_ADDRESS" >
            <HeaderStyle ForeColor="#009933" />
            </asp:BoundField>
            <asp:BoundField DataField="DELIVERY_ID" HeaderText="Address Code" SortExpression="DELIVERY_ID" >
            <HeaderStyle ForeColor="#009933" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="Address">
                <ItemTemplate>
                    <asp:DropDownList ID="DropDownList2" runat="server" Enabled="False" DataSourceID="SqlDataSource3" DataTextField="CITY" DataValueField="ADDRESS_ID" SelectedValue='<%# Bind("DELIVERY_ID") %>' AutoPostBack="True">
                    </asp:DropDownList>
                </ItemTemplate>
                <HeaderStyle ForeColor="#009933" />
            </asp:TemplateField>
        </Columns>
</asp:GridView>

    <br />
    <br />

</asp:Content>
