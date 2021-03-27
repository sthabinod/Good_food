
<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="New_Online_Good_Food._Default" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent"  runat="server">

    <div style="margin-top:50px;" id="page-top">
      

        <!-- Portfolio Section-->
        <section class="page-section portfolio" id="portfolio">
            <div class="container">
           
                <!-- Portfolio Grid Items-->
                <div class="row justify-content-center" style="margin-top:-80px;">
            
                    <!-- Portfolio Item 2-->
                    <div class="col-md-4 col-lg-4 mb-5">
                       <div class="card" style="width: 18rem; ">
                            <div class="card-body">
                                <h5 class="card-title">Total Orders</h5>
                                    <p class="card-text">Total: <asp:DropDownList CssClass="dropdown-toggle drop" style="border:none;-webkit-appearance: none;
   background-color: #FFF;
   border: medium none;
   color: #555555;
   font-family: inherit;
   outline: medium none;
   overflow: hidden;
   padding: 0;
   text-overflow: ellipsis;
   white-space: nowrap;
   width: 10em;
   height: 2em;" Enabled="false" ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="COUNT(ADDRESS_ID)" DataValueField="COUNT(ADDRESS_ID)">
                                      </asp:DropDownList></p>
                                    <a href="Order%20Activity" class="btn btn-primary">Visit Order Activity</a>
                            </div>
                        </div>
                    </div>
                    <!-- Portfolio Item 3-->
                    <div class="col-md-4 col-lg-4 mb-5">
                       
                       <div class="card" style="width: 18rem; ">
                            <div class="card-body">
                                <h5 class="card-title">Total Dishes</h5>
                                    <p class="card-text">Total: <asp:DropDownList CssClass="dropdown-toggle drop" style="border:none;-webkit-appearance: none;
   background-color: #FFF;
   border: medium none;
   color: #555555;
   font-family: inherit;
   outline: medium none;
   overflow: hidden;
   padding: 0;
   text-overflow: ellipsis;
   white-space: nowrap;
   width: 10em;
   height: 2em;" Enabled="false" ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="COUNT(dish_code)" DataValueField="COUNT(dish_code)">
                                      </asp:DropDownList></p>
                                    <a href="Food%20Search" class="btn btn-primary">Visit Dish Filter</a>
                            </div>
                        </div> 
                       
                    </div>
                    <!-- Portfolio Item 4-->
                    <div class="col-md-4 col-lg-4 mb-5 mb-lg-0">
           <div class="card" style="width: 18rem; top: 0px; left: 0px;">
                            <div class="card-body">
                                <h5 class="card-title">Total Customers</h5>
                                    <p class="card-text">Total: <asp:DropDownList CssClass="dropdown-toggle drop" style="border:none;-webkit-appearance: none;
   background-color: #FFF;
   border: medium none;
   color: #555555;
   font-family: inherit;
   outline: medium none;
   overflow: hidden;
   padding: 0;
   text-overflow: ellipsis;
   white-space: nowrap;
   width: 10em;
   height: 2em;" Enabled="false" ID="DropDownList3" runat="server" DataSourceID="SqlDataSource3" DataTextField="COUNT(customer_id)" DataValueField="COUNT(customer_id)">
                                      </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select sum(order_unit) as &quot;Ordered Dish&quot; , d.dish_name  from dish_order do
join dish d on d.dish_code = do.dish_code
group by d.dish_name"></asp:SqlDataSource>
                                        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select sum(line_total) as &quot;Line total&quot; , d.another_name  from dish_order do
join dish d on d.dish_code = do.dish_code
group by d.another_name"></asp:SqlDataSource>
                                </p>
                                    <a href="Customer%20Order" class="btn btn-primary">Customer Order Filter</a>
                            </div>
                        </div> 
                      
                    </div>
                  
                </div>
                <div style="margin-top:0px;" class="row justify-content-center" style="margin-top:-30px;">
            
                    <!-- Portfolio Item 2-->
                    <div  class="col-md-6 mb-5">
                         
                      
                        <asp:Chart Width="530px" ID="Chart2" runat="server" DataSourceID="SqlDataSource5">
                            <Series>
                                <asp:Series ChartType="Bar" Name="Series1" XValueMember="ANOTHER_NAME" YValueMembers="Line total">
                                </asp:Series>
                            </Series>
                            <ChartAreas>
                                <asp:ChartArea Name="ChartArea1">
                                </asp:ChartArea>
                            </ChartAreas>
                        </asp:Chart>

                       &nbsp;&nbsp;&nbsp;

                       </div>
                    <div class="col-md-6 mb-5">


                      <asp:Chart Width="470" ID="Chart1" runat="server" DataSourceID="SqlDataSource4" OnLoad="Page_Load">
                            <Series>
                                <asp:Series ChartArea="ChartArea1" ChartType="Pie" CustomProperties="PieLabelStyle=Disabled" Legend="Legend1" Name="Series1" XValueMember="DISH_NAME" YValueMembers="Ordered Dish">
                                    <Points>
                                        <asp:DataPoint YValues="0" />
                                    </Points>
                                    <SmartLabelStyle Enabled="False" />
                                </asp:Series>
                            </Series>
                            <ChartAreas>
                                <asp:ChartArea Name="ChartArea1">
                                </asp:ChartArea>
                            </ChartAreas>
                            <Legends>
                                <asp:Legend Name="Legend1">
                                </asp:Legend>
                            </Legends>
                        </asp:Chart>
               
                        </div>
            </div>
     
                
            </div>
        
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select count(address_id) from address"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select count(dish_code) from dish"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select count(customer_id) from customer"></asp:SqlDataSource>
                  
        <!-- Footer-->
        <footer class="footer text-center">
            <div class="container">
                <div class="row">
                    <!-- Footer Location-->
                    <div class="col-lg-4 mb-5 mb-lg-0">
                        <h4 class="text-uppercase mb-4">Location</h4>
                        <p class="lead mb-0">
                            Main office at Dharan, Nepal
                            <br />
                            Mobile Number: 98918192819
                        </p>
                    </div>
                    <!-- Footer Social Icons-->
                    <div class="col-lg-4 mb-5 mb-lg-0">
                        <h4 class="text-uppercase mb-4">Around the Web</h4>
                        <a class="btn btn-outline-light btn-social mx-1" href="#!"><i class="fab fa-fw fa-facebook-f"></i></a>
                        <a class="btn btn-outline-light btn-social mx-1" href="#!"><i class="fab fa-fw fa-twitter"></i></a>
                        <a class="btn btn-outline-light btn-social mx-1" href="#!"><i class="fab fa-fw fa-linkedin-in"></i></a>
                        <a class="btn btn-outline-light btn-social mx-1" href="#!"><i class="fab fa-fw fa-dribbble"></i></a>
                    </div>
                    <!-- Footer About Text-->
                    <div class="col-lg-4">
                        <h4 class="text-uppercase mb-4">About Good Food</h4>
                        <p class="lead mb-0">
                            Goood Food is online Food Delivery System.
                            </a>
                            .
                        </p>
                    </div>
                </div>
            </div>
        </footer>
        <!-- Copyright Section-->
        <div class="copyright py-4 text-center text-white">
            <div class="container"><small>Designed By © <a href="https://binodshresthaa.com.np/" target="_blank">Binod Shrestha</a> </small></div>
        </div>
        <!-- Scroll to Top Button (Only visible on small and extra-small screen sizes)-->
        <div class="scroll-to-top d-lg-none position-fixed">
            <a class="js-scroll-trigger d-block text-center text-white rounded" href="#page-top"><i class="fa fa-chevron-up"></i></a>
        </div>
     
      
        <!-- Bootstrap core JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Third party plugin JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
        <!-- Contact form JS-->
        <script src="assets/mail/jqBootstrapValidation.js"></script>
        <script src="assets/mail/contact_me.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        </div>

</asp:Content>






























