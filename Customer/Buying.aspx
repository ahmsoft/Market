<%@ Page Title="" Language="VB" MasterPageFile="~/MainStore.master" AutoEventWireup="false" CodeFile="Buying.aspx.vb" Inherits="Buying" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div runat="server" id="result">
    </div>
    <script>
        $(document).ready(function () {

            if (typeof (Storage) !== "undefined") {
                if (JSON.parse(localStorage.products).length >0) {
                    var strBuying = localStorage.products;
                    //var strtemp = strBuying.slice(1, strBuying.length-1);
                    var tempStr = JSON.parse(strBuying);
                    //var obj = JSON.parse(tempStr);
                    //alert(tempStr.length);
                    //alert(tempStr[0].name)
                    var bodys = "<div><center><table width='100%' border='3'><tr><td style='text-align: center;'>" + "تصویر" + "</td><td style='text-align: center;'>" + "شماره محصول" + "</td><td style='text-align: center;'>" + "نام" + "</td><td style='text-align: center;'>" + "توضیح" + "</td><td style='text-align: center;'>" + "تعداد" + "</td><td style='text-align: center;'>" + "قیمت" + "</td></tr>";
                    var i = 0;
                    while (i < tempStr.length) {
                        bodys = bodys + "<tr><td style='text-align: center;'><img src=" + tempStr[i].image + "></td><td style='text-align: center;'>" + tempStr[i].id + "</td><td style='text-align: center;'>" + tempStr[i].name + "</td><td style='text-align: center;'>" + tempStr[i].summary + "</td><td style='text-align: center;'>" + tempStr[i].quantity + "</td><td style='text-align: center;'>" + tempStr[i].price + "</td></tr>";
                        $("#ContentPlaceHolder1_OrderItem").val($("#ContentPlaceHolder1_OrderItem").val() + tempStr[i].id + "-" + tempStr[i].price + "-" + tempStr[i].quantity + ";");
                        i++;
                    }
                    bodys = bodys + "</table></center></div>";
                    document.getElementById("ContentPlaceHolder1_result").innerHTML = bodys;
                }
                else {
                    $('#BoxInfo').hide();
                    document.getElementById("ContentPlaceHolder1_result").innerHTML = "<div style='text-align: center; margin:10px;' class='alert alert-danger' role='alert' >سبد خرید شما خالی است</div>";
                }

            }
            else {
                document.getElementById("ContentPlaceHolder1_result").innerHTML = "متاسفانه مرورگر شما از امکانات سایت ما پشتیبانی نمی‌کند";
            }
        });
    </script>
    <input type="text" hidden="hidden" runat="server" id="OrderItem" />
    <!-- SELECT2 EXAMPLE -->
    <div class="box box-default" id="BoxInfo">
        <div class="box-header with-border">
            <h3 class="box-title">اطلاعات ارسال</h3>

            <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
            </div>
        </div>
        <!-- /.box-header -->
        <div class="box-body">
            <div class="row">
                <div class="col-md-6">
                    <!-- /.form-group -->
                    <br />
                    <label for="txtNameAndFamily">نام و نام خانوادگی</label><span style="color: red;">*</span>
                    <div class="input-group">
                        <div class="input-group-addon">
                            <i class="fa fa-user"></i>
                        </div>
                        <asp:TextBox ID="txtNameAndFamily" placeholder="به عنوان مثال: امیرحسن مروجی." runat="server" type="Text" required="required" class="form-control" data-inputmask='"mask": ""' data-mask />
                    </div>
                    <!-- /.form-group -->
                    <br />
                    <!-- /.input group -->
                    <label for="txtMobile">تلفن همراه</label><span style="color: red;">*</span>
                    <div class="input-group">
                        <div class="input-group-addon">
                            <i class="fa fa-mobile-phone"></i>
                        </div>
                        <asp:TextBox ID="txtMobile" placeholder="به عنوان مثال: 09391815029" runat="server" type="text" required="required" class="form-control" data-inputmask='"mask": "09999999999"' data-mask />
                    </div>
                    <!-- /.form-group -->
                </div>
                <!-- /.col -->

                <div class="col-md-6">
                    <br />
                    <!-- /.input group -->
                    <label for="txtEmail">پست الکترونیک</label><span style="color: red;">*</span>
                    <div class="input-group">
                        <div class="input-group-addon">
                            <i class="fa fa-envelope"></i>
                        </div>
                        <asp:TextBox ID="txtEmail" placeholder="به عنوان مثال: ah.moravveji.edu@gmail.com" runat="server" type="Email" required="required" class="form-control" data-inputmask='"mask": ""' data-mask />
                    </div>
                    <!-- /.form-group -->
                    <br />
                    <label for="txtAddress">آدرس</label>
                    <div class="input-group">
                        <div class="input-group-addon">
                            <i class="fa fa-location-arrow"></i>
                        </div>
                        <asp:TextBox ID="txtAddress" placeholder="به عنوان مثال: مشهد - خیابان صیاد شیرازی - صیاد شیرازی 18 - پلاک 32 واحد 3." runat="server" type="text" class="form-control" data-inputmask='"mask": ""' data-mask />
                    </div>
                    <!-- /.input group -->
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /.box-body -->
        <div class="box-footer" style="text-align: center;">
            <asp:Label  runat="server" style="margin:auto;font-size:15px;border-radius: 6px 6px 6px 6px;padding:8px 8px 8px 8px;" CssClass="label-success" id="lblRequest"  Visible="false"/>
            <asp:Button runat="server" CssClass="btn-success" ID="btnSave" Text="ثبت سفارش" />
        </div>
    </div>
    <!-- /.box -->


</asp:Content>

