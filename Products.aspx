<%@ Page Title="" Language="VB" MasterPageFile="~/MainStore.master" AutoEventWireup="false" CodeFile="Products.aspx.vb" Inherits="Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <link href="/Lamonte/styles/PageNavi.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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

    <div class="w3ls_w3l_banner_nav_left_grid" style="margin-bottom:200px;">
        <h3>محصولات گروه انتخابی </h3>
        <br />
        <div class="clearfix"></div>
        <asp:LinqDataSource ID="DataSourceProducts" runat="server" ContextTypeName="LinqDBClassesDataContext" EntityTypeName="" OrderBy="IDP desc" TableName="Products" Where="IDCat == @IDCat">
            <WhereParameters>
                <asp:RouteParameter Name="IDCat" RouteKey="IDCat" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
        <asp:ListView ID="ListViewProducts" runat="server" DataSourceID="DataSourceProducts" DataKeyNames="IDP">
            <AlternatingItemTemplate>
                <div class="col-md-3 w3ls_w3l_banner_right">
                    <div class="hover14 column">
                        <div class="agile_top_brand_right_grid w3l_agile_top_brand_right_grid">
                            <div class="agile_top_brand_right_grid_pos">
                                <img src="/StoreComponents/images/offer.png" alt=" " class="img-responsive" />
                            </div>
                            <div class="agile_top_brand_right_grid1">
                                <figure>
                                    <div class="snipcart-item block">
                                            <a href='/Products/<%# Eval("CatName").ToString.Replace(" ", "-")%>/<%# Eval("Name").ToString.Replace(" ", "-")%>/<%# Eval("IDP").ToString() %>'>
                                        <div class="snipcart-thumb">
                                                <img src='<%# Eval("Pic") %>' alt='<%# Eval("Description") %>' class="img-responsive" /></a>
                                            <p>
                                                نام: <%# Eval("Name") %><br />
                                                توضیح: <%# Eval("Description") %>
                                            </p>
                                            <h4>تومان <%# Eval("Price") %> <span>تومان <%# Eval("Price") + 1000 %></span></h4>
                                        </div>
                                        <div class="snipcart-details">
                                                <a href="buying" onclick="<%# Session("Buying") = Session("Buying") + Eval("Name").ToString() %>" style="border-radius:4px 4px 4px 4px;width: 40%;" class="btn btn-danger hvr-sweep-to-left my-cart-btn" data-id='<%# Eval("IDP").ToString %>' data-name='<%# Eval("Name").ToString %>' data-summary='<%# Eval("Description").ToString %>' data-price='<%# Eval("Price").ToString %>' data-quantity="1" data-image='<%# Eval("Pic").ToString %>'>خرید</a>
                                                <button onclick="<%# Session("Buying") = Session("Buying") + Eval("Name").ToString() %>" style="width: 40%;" class="btn btn-default my-cart-btn" data-id='<%# Eval("IDP").ToString %>' data-name='<%# Eval("Name").ToString %>' data-summary='<%# Eval("Description").ToString %>' data-price='<%# Eval("Price").ToString %>' data-quantity="1" data-image='<%# Eval("Pic").ToString %>'>افزودن</button>
                                    </div>
                                </figure>
                            </div>
                        </div>
                    </div>
                </div>


            </AlternatingItemTemplate>
            <EditItemTemplate>

            </EditItemTemplate>
            <EmptyDataTemplate>
                <center>
                <table style="text-align:center;">
                    <tr>
                        <td><p class="alert alert-danger" style="text-align:center;">درحال حاضر برای این گروه محصول (<%# Page.RouteData.Values("CatName").ToString() %>)، آیتمی جهت فروش وجود ندارد.</p></td>
                    </tr>
                </table>
                </center>
            </EmptyDataTemplate>
            <InsertItemTemplate>

            </InsertItemTemplate>
            <ItemTemplate>
                <div class="col-md-3 w3ls_w3l_banner_right">
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
                                                نام: <%# Eval("Name") %><br />
                                                توضیح: <%# Eval("Description") %>
                                            </p>
                                            <h4>تومان <%# Eval("Price") %> <span>تومان <%# Eval("Price") + 1000 %></span></h4>
                                        </div>
                                        <div class="snipcart-details">
                                                <a href="buying" onclick="<%# Session("Buying") = Session("Buying") + Eval("Name").ToString() %>" style="border-radius:4px 4px 4px 4px;width: 40%;" class="btn btn-danger hvr-sweep-to-left my-cart-btn" data-id='<%# Eval("IDP").ToString %>' data-name='<%# Eval("Name").ToString %>' data-summary='<%# Eval("Description").ToString %>' data-price='<%# Eval("Price").ToString %>' data-quantity="1" data-image='<%# Eval("Pic").ToString %>'>خرید</a>
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
                <table runat="server" border="0" style="">
                    <tr runat="server" id="itemPlaceholderContainer">
                        <td runat="server" id="itemPlaceholder"></td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>

            </SelectedItemTemplate>
        </asp:ListView>
    </div>
    <div> </div>
    <div class="pagenavi">
        <asp:DataPager ID="DataPager" runat="server" PagedControlID="ListViewProducts" QueryStringField="PageID" PageSize="4">
            <Fields>
                <asp:NumericPagerField CurrentPageLabelCssClass="current" NextPageText=">" PreviousPageText="<" ButtonCount="10" />
            </Fields>
        </asp:DataPager>
    </div>
    <br />
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

