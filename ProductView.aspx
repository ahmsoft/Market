<%@ Page Title="" Language="VB" MasterPageFile="~/MainStore.master" AutoEventWireup="false" CodeFile="ProductView.aspx.vb" Inherits="ProductView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
                <div class="banner">
            <div class="w3l_banner_nav_right">
                <nav class="navbar nav_bottom">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header nav_2">
                        <button type="button" class="navbar-toggle collapsed navbar-toggle1" data-toggle="collapse" data-target="#bs-megadropdown-tabs">
                            <span class="sr-only">تعویض ناوبری</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div>
                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
                        <ul class="nav navbar-nav nav_1">
                            <asp:Label runat="server" ID="lblMenuCat" />
                        </ul>
                    </div>
                    <!-- /.navbar-collapse -->
                </nav>
            </div>
            <div class="w3l_banner_nav_left">
                <section class="slider">
                    <div class="flexslider" dir="ltr">
                        <ul class="slides">
                            <li>
                                <div class="w3l_banner_nav_left_banner ">
                                    <h3 style="justify-content: center;">فروش انواع فایل<span>پژوهشی و تحقیقاتی</span>با فرمت استاندارد بصورت تخصصی</h3>
                                    <div class="more">
                                        <a href="/Market" class="button--saqui button--round-l button--text-thick" data-text="Shop now">فروشگاه در حال حاضر</a>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="w3l_banner_nav_left_banner1">
                                    <h3 style="justify-content: center;">فروش انواع فایل<span>مهندسی و علوم پایه</span>مقالات و داده‌های معتبر</h3>
                                    <div class="more">
                                        <a href="/Market" class="button--saqui button--round-l button--text-thick" data-text="Shop now">فروشگاه در حال حاضر</a>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="w3l_banner_nav_left_banner2">
                                    <h3 style="justify-content: center;">فروش انواع فایل<i>مقالات ترجمه شده روان</i>آماده‌ی استفاده در پژوهش شما</h3>
                                    <div class="more">
                                        <a href="/Market" class="button--saqui button--round-l button--text-thick" data-text="Shop now">فروشگاه در حال حاضر</a>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </section>
                <!-- flexSlider -->
                <link rel="stylesheet" href="/StoreComponents/css/flexslider.css" type="text/css" media="screen" property="" />
                <script defer src="/StoreComponents/js/jquery.flexslider.js"></script>
                <script type="text/javascript">
                    $(window).load(function () {
                        $('.flexslider').flexslider({
                            animation: "slide",
                            start: function (slider) {
                                $('body').removeClass('loading');
                            }
                        });
                    });
                </script>
                <!-- //flexSlider -->
            </div>
            <div class="clearfix"></div>
        </div>

    <div class="w3ls_w3l_banner_nav_left_grid">
        <h3>جزئیات محصول </h3>
        <br />
        <div class="clearfix"></div>
        <asp:LinqDataSource ID="DataSourceProducts" runat="server" ContextTypeName="LinqDBClassesDataContext" EntityTypeName="" OrderBy="IDP desc" TableName="Products" Where="IDP == @IDP">
            <WhereParameters>
                <asp:RouteParameter Name="IDP" RouteKey="ProductID" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
        <center>
           <asp:ListView ID="ListViewProducts" runat="server" DataSourceID="DataSourceProducts" DataKeyNames="IDP" GroupItemCount="3">
            <AlternatingItemTemplate>


            </AlternatingItemTemplate>
            <EditItemTemplate>

            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server">
                    <tr>
                        <td>در حال حاضر این محصول موجود نیست.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <EmptyItemTemplate>
                <td runat="server" />
            </EmptyItemTemplate>
            <GroupTemplate>
                <tr id="itemPlaceholderContainer" runat="server">
                    <td id="itemPlaceholder" runat="server"></td>
                </tr>
            </GroupTemplate>
            <InsertItemTemplate>

            </InsertItemTemplate>
            <ItemTemplate>
                <td runat="server">               
                </td>
                <div class="col-md-12 w3ls_w3l_banner_right">
                    <div class="hover14 column">
                        <div class="agile_top_brand_right_grid w3l_agile_top_brand_right_grid">
                            <div class="agile_top_brand_right_grid_pos">
                                <img src="/StoreComponents/images/offer.png" alt=" " class="img-responsive" />
                            </div>
                            <div class="agile_top_brand_right_grid1">
                                <figure>
                                    <div class="snipcart-item block">
                                        <div class="snipcart-thumb">
                                                <a href='/Products/<%# Eval("CatName").ToString.Replace(" ", "-")%>/<%# Eval("Name").ToString.Replace(" ", "-")%>/<%# Eval("IDP").ToString() %>'>
                                                <img src='<%# Eval("Pic") %>' alt='<%# Eval("Description") %>' class="img-responsive" /></a>
                                            <p>
                                                شماره محصول: <%# Eval("IDP") %><br />
                                                نام: <%# Eval("Name") %><br />
                                                نوع: <%# Eval("Brand") %><br />
                                                فرمت: <%# Eval("Model") %> <br />
                                                امتیاز: <%# Eval("Rank") %> از 10<br />
                                                توضیح: <%# Eval("Description") %>
                                            </p>
                                            <h4>تومان <%# Eval("Price") %> <span>تومان <%# Eval("Price") + 1000 %></span></h4>
                                        </div>
                                        <div class="snipcart-details">
                                                <a href="<% Server.MapPath("/Buying") %>/Buying" onclick="<%# Session("Buying") = Session("Buying") + Eval("Name").ToString() %>" style="border-radius:4px 4px 4px 4px;width: 40%;" class="btn btn-danger hvr-sweep-to-left my-cart-btn" data-id='<%# Eval("IDP").ToString %>' data-name='<%# Eval("Name").ToString %>' data-summary='<%# Eval("Description").ToString %>' data-price='<%# Eval("Price").ToString %>' data-quantity="1" data-image='<%# Eval("Pic").ToString %>'>خرید</a>
                                                <button onclick="<%# Session("Buying") = Session("Buying") + Eval("Name").ToString() %>" style="width: 40%;" class="btn btn-default my-cart-btn" data-id='<%# Eval("IDP").ToString %>' data-name='<%# Eval("Name").ToString %>' data-summary='<%# Eval("Description").ToString %>' data-price='<%# Eval("Price").ToString %>' data-quantity="1" data-image='<%# Eval("Pic").ToString %>'>افزودن</button>
                                        </div>
                                    </div>
                                </figure>
                            </div>
                        </div>
                    </div>
                </div>

            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="groupPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr id="groupPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;"></td>
                    </tr>
                </table>

            </LayoutTemplate>
            <SelectedItemTemplate>

            </SelectedItemTemplate>
        </asp:ListView> 
            </center>
    </div>
    <!-- //newsletter -->
    <!-- footer -->
    <!-- //footer -->
    <!-- Bootstrap Core JavaScript -->
    <script src="/StoreComponents/js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function () {
            $(".dropdown").hover(
                function () {
                    $('.dropdown-menu', this).stop(true, true).slideDown("fast");
                    $(this).toggleClass('open');
                },
                function () {
                    $('.dropdown-menu', this).stop(true, true).slideUp("fast");
                    $(this).toggleClass('open');
                }
            );
        });
    </script>
    <!-- here stars scrolling icon -->
    <script type="text/javascript">
        $(document).ready(function () {

            $().UItoTop({ easingType: 'easeOutQuart' });

        });
    </script>
    <!-- //here ends scrolling icon -->
    <script type='text/javascript' src="/StoreComponents/js/jquery.mycart.js"></script>
</asp:Content>
