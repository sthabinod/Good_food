<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Food Search.aspx.cs" Inherits="New_Online_Good_Food.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;DISH&quot; WHERE &quot;DISH_CODE&quot; = :DISH_CODE" InsertCommand="INSERT INTO &quot;DISH&quot; (&quot;DISH_CODE&quot;, &quot;DISH_NAME&quot;, &quot;ANOTHER_NAME&quot;, &quot;DISH_RATE&quot;, &quot;LOYALTY_ID&quot;) VALUES (:DISH_CODE, :DISH_NAME, :ANOTHER_NAME, :DISH_RATE, :LOYALTY_ID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT  d.dish_name as &quot;dish&quot;, address.city, address.street, d.dish_rate, do.line_total, r.name,r.phone_number
from  address
join customer c on c.delivery_id = address.address_id
join orders o on o.customer_id = c.customer_id
join dish_order do on do.order_id = o.order_id
join dish d on d.dish_code = do.dish_code
join dish_restaurant dr on dr.dish_code = d.dish_code 
join restaurant r on r.registration_number= dr.restaurant_registration_number where d.dish_code = :dish_code
" UpdateCommand="UPDATE &quot;DISH&quot; SET &quot;DISH_NAME&quot; = :DISH_NAME, &quot;ANOTHER_NAME&quot; = :ANOTHER_NAME, &quot;DISH_RATE&quot; = :DISH_RATE, &quot;LOYALTY_ID&quot; = :LOYALTY_ID WHERE &quot;DISH_CODE&quot; = :DISH_CODE">
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
            <asp:ControlParameter ControlID="DropDownList1" Name="dish_code" PropertyName="SelectedValue" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="DISH_NAME" Type="String" />
            <asp:Parameter Name="ANOTHER_NAME" Type="String" />
            <asp:Parameter Name="DISH_RATE" Type="Decimal" />
            <asp:Parameter Name="LOYALTY_ID" Type="Decimal" />
            <asp:Parameter Name="DISH_CODE" Type="String" />
        </UpdateParameters>
</asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT dish_code, dish_name FROM &quot;DISH&quot;"></asp:SqlDataSource>
    <asp:DropDownList style="margin-top:50px;border:none; background:#32CD32;padding-left:20px;color:white;height:40px;width:300px;" class="dropdown" ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="DISH_NAME" DataValueField="DISH_CODE" AutoPostBack="True">
    </asp:DropDownList>
    <asp:GridView ID="GridView1" CssClass="table table-striped table-dark" style="margin-top:50px; " runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Height="100px" Width="1150px">
        <Columns >
            <asp:BoundField DataField="dish" HeaderText="Dish" SortExpression="dish" >
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
            <asp:BoundField DataField="LINE_TOTAL" HeaderText="Line Total" SortExpression="LINE_TOTAL" >
            <HeaderStyle ForeColor="#00CC00" />
            </asp:BoundField>
            <asp:BoundField DataField="NAME" HeaderText="Restaurant name" SortExpression="NAME" >
            <HeaderStyle ForeColor="#00CC00" />
            </asp:BoundField>
            <asp:BoundField DataField="PHONE_NUMBER" HeaderText="Phone Number" SortExpression="PHONE_NUMBER" >
            <HeaderStyle ForeColor="#00CC00" />
            </asp:BoundField>
        </Columns>
</asp:GridView>

    <br />
    <br />

</asp:Content>
