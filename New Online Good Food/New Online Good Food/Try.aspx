
 <%@ Page Title="About" Language="C#" AutoEventWireup="true" CodeBehind="Try.aspx.cs" Inherits="New_Online_Good_Food.Try" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select * from 
(
select dr.restaurant_registration_number, r.name as &quot;Restaurant Name&quot;,count(do.dish_code) as &quot;No. of dishes ordered&quot;, to_char(&quot;date&quot;,'Month')
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
                <asp:ControlParameter ControlID="DropDownList1" Name="mnth" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="TO_CHAR(&quot;DATE&quot;,'MON')" DataValueField="TO_CHAR(&quot;DATE&quot;,'MON')">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select distinct to_char(&quot;date&quot;,'Mon'), extract(month from &quot;date&quot;) from bill order by extract(month from &quot;date&quot;)"></asp:SqlDataSource>
    </form>
</body>
</html>
