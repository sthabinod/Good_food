<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Food.aspx.cs" Inherits="New_Online_Good_Food.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;LOYALTY&quot; WHERE &quot;LOYALTY_ID&quot; = :LOYALTY_ID" InsertCommand="INSERT INTO &quot;LOYALTY&quot; (&quot;LOYALTY_ID&quot;, &quot;LOYALTY_POINTS&quot;, &quot;END_DATE&quot;) VALUES (:LOYALTY_ID, :LOYALTY_POINTS, :END_DATE)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;LOYALTY&quot;" UpdateCommand="UPDATE &quot;LOYALTY&quot; SET &quot;LOYALTY_POINTS&quot; = :LOYALTY_POINTS, &quot;END_DATE&quot; = :END_DATE WHERE &quot;LOYALTY_ID&quot; = :LOYALTY_ID">
    <DeleteParameters>
        <asp:Parameter Name="LOYALTY_ID" Type="Decimal" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="LOYALTY_ID" Type="Decimal" />
        <asp:Parameter Name="LOYALTY_POINTS" Type="Decimal" />
        <asp:Parameter Name="END_DATE" Type="DateTime" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="LOYALTY_POINTS" Type="Decimal" />
        <asp:Parameter Name="END_DATE" Type="DateTime" />
        <asp:Parameter Name="LOYALTY_ID" Type="Decimal" />
    </UpdateParameters>
</asp:SqlDataSource>
    
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;DISH&quot; WHERE &quot;DISH_CODE&quot; = :DISH_CODE" InsertCommand="INSERT INTO &quot;DISH&quot; (&quot;DISH_CODE&quot;, &quot;DISH_NAME&quot;, &quot;ANOTHER_NAME&quot;, &quot;DISH_RATE&quot;, &quot;LOYALTY_ID&quot;) VALUES (:DISH_CODE, :DISH_NAME, :ANOTHER_NAME, :DISH_RATE, :LOYALTY_ID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;DISH&quot;" UpdateCommand="UPDATE &quot;DISH&quot; SET &quot;DISH_NAME&quot; = :DISH_NAME, &quot;ANOTHER_NAME&quot; = :ANOTHER_NAME, &quot;DISH_RATE&quot; = :DISH_RATE, &quot;LOYALTY_ID&quot; = :LOYALTY_ID WHERE &quot;DISH_CODE&quot; = :DISH_CODE">
        <DeleteParameters>
            <asp:Parameter Name="DISH_CODE" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="DISH_CODE" Type="String" />
            <asp:Parameter Name="DISH_NAME" Type="String" />
            <asp:Parameter Name="ANOTHER_NAME" Type="String" />
            <asp:Parameter Name="DISH_RATE" Type="Decimal" />
            <asp:Parameter Name="LOYALTY_ID" Type="Decimal" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="DISH_NAME" Type="String" />
            <asp:Parameter Name="ANOTHER_NAME" Type="String" />
            <asp:Parameter Name="DISH_RATE" Type="Decimal" />
            <asp:Parameter Name="LOYALTY_ID" Type="Decimal" />
            <asp:Parameter Name="DISH_CODE" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:FormView style="margin-top:70px;" ID="FormView2" runat="server" DataKeyNames="DISH_CODE" DataSourceID="SqlDataSource2">
        <EditItemTemplate>
            DISH_CODE:
            <asp:Label ID="DISH_CODELabel1" runat="server" Text='<%# Eval("DISH_CODE") %>' />
            <br />
            DISH_NAME:
            <asp:TextBox ID="DISH_NAMETextBox" runat="server" Text='<%# Bind("DISH_NAME") %>' />
            <br />
            ANOTHER_NAME:
            <asp:TextBox ID="ANOTHER_NAMETextBox" runat="server" Text='<%# Bind("ANOTHER_NAME") %>' />
            <br />
            DISH_RATE:
            <asp:TextBox ID="DISH_RATETextBox" runat="server" Text='<%# Bind("DISH_RATE") %>' />
            <br />
            LOYALTY_ID:
            <asp:TextBox ID="LOYALTY_IDTextBox" runat="server" Text='<%# Bind("LOYALTY_ID") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            Dish code
            <asp:TextBox  ID="DISH_CODETextBox" style="margin-left:20px;" runat="server" Text='<%# Bind("DISH_CODE") %>' />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DISH_CODETextBox" ErrorMessage="Dish code is required." ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            Dish name
            <asp:TextBox style="margin-top:30px;margin-left:13px" ID="DISH_NAMETextBox" runat="server" Text='<%# Bind("DISH_NAME") %>' />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DISH_NAMETextBox" ErrorMessage="Dish code is required." ForeColor="#FF3300"></asp:RequiredFieldValidator>
            <br />
            Local name
            <asp:TextBox style="margin-top:30px;margin-left:9px;" ID="ANOTHER_NAMETextBox" runat="server" Text='<%# Bind("ANOTHER_NAME") %>' />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ANOTHER_NAMETextBox" ErrorMessage="Local name is required." ForeColor="#FF3300"></asp:RequiredFieldValidator>
            <br />
            Dish rate
            <asp:TextBox style="margin-top:30px; margin-left:22px;" ID="DISH_RATETextBox" runat="server" Text='<%# Bind("DISH_RATE") %>' />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DISH_RATETextBox" ErrorMessage="Dish rate is required." ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            Loyalty
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource3" DataTextField="LOYALTY_POINTS" DataValueField="LOYALTY_ID">
            </asp:DropDownList>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" cssClass="btn btn-success"  CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" cssClass="btn btn-warning" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
           
           
            
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" cssClass="btn btn-success" Text="Add Dish" />
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;LOYALTY_ID&quot;, &quot;LOYALTY_POINTS&quot; FROM &quot;LOYALTY&quot;"></asp:SqlDataSource>
    <asp:GridView ID="GridView1" CssClass="table table-striped table-dark" style="margin-top:50px; " runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="DISH_CODE" DataSourceID="SqlDataSource2" Height="319px" Width="1150px">
        <Columns >
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="DISH_CODE" HeaderText="DISH_CODE" ReadOnly="True" SortExpression="DISH_CODE" >
            </asp:BoundField>
            <asp:BoundField DataField="DISH_NAME" HeaderText="DISH_NAME" SortExpression="DISH_NAME" >
            </asp:BoundField>
            <asp:BoundField DataField="ANOTHER_NAME" HeaderText="ANOTHER_NAME" SortExpression="ANOTHER_NAME" >
            </asp:BoundField>
            <asp:BoundField DataField="DISH_RATE" HeaderText="DISH_RATE" SortExpression="DISH_RATE" />
            <asp:BoundField DataField="LOYALTY_ID" HeaderText="LOYALTY_ID" SortExpression="LOYALTY_ID" />
        </Columns>
</asp:GridView>

    <br />
    <br />

</asp:Content>
