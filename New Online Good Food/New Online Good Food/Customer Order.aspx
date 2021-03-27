<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Customer Order.aspx.cs" Inherits="New_Online_Good_Food.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;DISH&quot; WHERE &quot;DISH_CODE&quot; = :DISH_CODE" InsertCommand="INSERT INTO &quot;DISH&quot; (&quot;DISH_CODE&quot;, &quot;DISH_NAME&quot;, &quot;ANOTHER_NAME&quot;, &quot;DISH_RATE&quot;, &quot;LOYALTY_ID&quot;) VALUES (:DISH_CODE, :DISH_NAME, :ANOTHER_NAME, :DISH_RATE, :LOYALTY_ID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT c.full_name as &quot;Customer&quot;, d.dish_name as &quot;dish&quot;, address.city, address.street, d.dish_rate, do.line_total from  address
join customer c on c.delivery_id = address.address_id
join orders o on o.customer_id = c.customer_id
join dish_order do on do.order_id = o.order_id
join dish d on d.dish_code = do.dish_code where  C.CUSTOMER_ID = :CUSTOMER" UpdateCommand="UPDATE &quot;DISH&quot; SET &quot;DISH_NAME&quot; = :DISH_NAME, &quot;ANOTHER_NAME&quot; = :ANOTHER_NAME, &quot;DISH_RATE&quot; = :DISH_RATE, &quot;LOYALTY_ID&quot; = :LOYALTY_ID WHERE &quot;DISH_CODE&quot; = :DISH_CODE">
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
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="CUSTOMER" PropertyName="SelectedValue" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="DISH_NAME" Type="String" />
            <asp:Parameter Name="ANOTHER_NAME" Type="String" />
            <asp:Parameter Name="DISH_RATE" Type="Decimal" />
            <asp:Parameter Name="LOYALTY_ID" Type="Decimal" />
            <asp:Parameter Name="DISH_CODE" Type="String" />
        </UpdateParameters>
</asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT customer_id, full_name from customer"></asp:SqlDataSource>
    <asp:DropDownList style="margin-top:50px;border:none; background:#32CD32;padding-left:20px;color:white;height:40px;width:300px;" class="dropdown" ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="FULL_NAME" DataValueField="CUSTOMER_ID" AutoPostBack="True">
    </asp:DropDownList>
 
    <asp:GridView ID="GridView1" CssClass="table table-striped table-dark" style="margin-top:50px; " runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Height="100px" Width="1150px">
        <Columns >
            <asp:BoundField DataField="Customer" HeaderText="Customer" SortExpression="Customer" >
            <HeaderStyle ForeColor="#00CC00" />
            </asp:BoundField>
            <asp:BoundField DataField="dish" HeaderText="Dish" SortExpression="dish" ApplyFormatInEditMode="True" >
            <HeaderStyle ForeColor="#00CC00" />
            </asp:BoundField>
            <asp:BoundField DataField="CITY" HeaderText="City" SortExpression="CITY" >
            <HeaderStyle ForeColor="#00CC00" />
            </asp:BoundField>
            <asp:BoundField DataField="STREET" HeaderText="Street" SortExpression="STREET" >
            <HeaderStyle ForeColor="#00CC00" />
            </asp:BoundField>
            <asp:BoundField DataField="DISH_RATE" HeaderText="Dish Rate" SortExpression="DISH_RATE" >
            <HeaderStyle ForeColor="#00CC00" />
            </asp:BoundField>
            <asp:BoundField DataField="LINE_TOTAL" HeaderText="Line total" SortExpression="LINE_TOTAL" >
            <HeaderStyle ForeColor="#00CC00" />
            </asp:BoundField>
        </Columns>
</asp:GridView>

    <br />
    <br />

</asp:Content>
