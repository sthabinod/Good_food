 <%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Order Activity.aspx.cs" Inherits="New_Online_Good_Food.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;DISH&quot; WHERE &quot;DISH_CODE&quot; = :DISH_CODE" InsertCommand="INSERT INTO &quot;DISH&quot; (&quot;DISH_CODE&quot;, &quot;DISH_NAME&quot;, &quot;ANOTHER_NAME&quot;, &quot;DISH_RATE&quot;, &quot;LOYALTY_ID&quot;) VALUES (:DISH_CODE, :DISH_NAME, :ANOTHER_NAME, :DISH_RATE, :LOYALTY_ID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT  r.name,d.dish_name
from  address
join customer c on c.delivery_id = address.address_id
join orders o on o.customer_id = c.customer_id
join dish_order do on do.order_id = o.order_id
join dish d on d.dish_code = do.dish_code
join dish_restaurant dr on dr.dish_code = d.dish_code 
join restaurant r on r.registration_number= dr.restaurant_registration_number" UpdateCommand="UPDATE &quot;DISH&quot; SET &quot;DISH_NAME&quot; = :DISH_NAME, &quot;ANOTHER_NAME&quot; = :ANOTHER_NAME, &quot;DISH_RATE&quot; = :DISH_RATE, &quot;LOYALTY_ID&quot; = :LOYALTY_ID WHERE &quot;DISH_CODE&quot; = :DISH_CODE">
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
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select order_id, delivery_time from orders"></asp:SqlDataSource>
    
    <asp:SqlDataSource ID="OrderActivity" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select * from 
(
select dr.restaurant_registration_number as &quot;Registration Number&quot;, r.name as &quot;Restaurant Name&quot;,count(do.dish_code) as &quot;No. of dishes ordered&quot;, to_char(&quot;date&quot;,'Month') as &quot;Month&quot;
from bill b
join bill_order bo on bo.bill_id = b.sn
join orders o on o.order_id = bo.order_id
join dish_order do on do.order_id = o.order_id
join dish d on d.dish_code = do.dish_code
join dish_restaurant dr on dr.dish_code = d.dish_code
join restaurant r on r.registration_number= dr.restaurant_registration_number
where to_char(&quot;date&quot;,'Mon') = :mnth
group by dr.restaurant_registration_number, r.name, to_char(&quot;date&quot;,'Month')
order by count(do.dish_code)
desc)
where rownum &lt; 6">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList2" Name="mnth" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:DropDownList ID="DropDownList2" style="border-style: none; border-color: inherit; border-width: medium; margin-top:60px; background:#32CD32; padding-left:20px; color:white; height:40px; width:300px; " runat="server" DataSourceID="Date" DataTextField="TO_CHAR(&quot;DATE&quot;,'MON')" DataValueField="TO_CHAR(&quot;DATE&quot;,'MON')" AutoPostBack="True">
    </asp:DropDownList>
    <asp:SqlDataSource ID="Date" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select distinct to_char(&quot;date&quot;,'Mon'), extract(month from &quot;date&quot;) from bill order by extract(month from &quot;date&quot;)"></asp:SqlDataSource>
    <asp:GridView CssClass="table table-striped table-dark" style="margin-top:50px;"  ID="GridView2" runat="server" DataSourceID="OrderActivity" AllowSorting="True">
    </asp:GridView>

    <br />
    <br />

</asp:Content>
