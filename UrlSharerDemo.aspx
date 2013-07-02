<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="UrlSharerDemo.aspx.cs" Inherits="OnlineUtilities.UrlSharerDemo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="Styles/bootstrap.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="form-inline" id="url-info-form" action="">
        <input type="text" placeholder="url" id="urlInfoUrlTextBox" class="input-xxlarge"
            type="url" required />
        <button type="button" class="btn" id="fetchUrlInfo">
            Info</button><img src="/images/ajax-loader.gif" id="loading-indicator" style="display: none;
                margin-left: 10px" />
    </div>
    <p>
    </p>
    <div class="thumbnail clearfix" id="urlInfoBox" style="display: none">
        <div class="pull-left span2" id="url-info-image-box">
            <img id="urlInfoBoxThumbnailImage" src="http://placehold.it/320x200" alt="ALT NAME"
                style='margin-right: 10px' width="100" height="100">
            <div class="pagination pagination-centered">
                <ul>
                    <li><a href="#" id="url-info-box-prev-image"><</a></li>
                    <li><a href="#" id="url-info-box-next-image">></a></li>
                </ul>
            </div>
        </div>
        <div class="caption" class="pull-left">
            <h4>
                <a href="#" id="urlInfoBoxTitle">Luis Felipe Kaufmann</a>
            </h4>
            <small id="urlInfoBoxDescripton"></small>
        </div>
    </div>
    <script type="text/javascript" src="Scripts/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="Scripts/bootstrap.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            // Add the page method call as an onclick handler for the div.
            var urlInfo;
            var currentImage;
            $("#url-info-box-prev-image").click(function () {
                if (currentImage > 0) {
                    currentImage--;
                    updatePager();
                    $("#urlInfoBoxThumbnailImage").attr("src", urlInfo.Images[currentImage]);
                }
            });
            $("#url-info-box-next-image").click(function () {
                if (currentImage < urlInfo.Images.length - 1) {
                    currentImage++;
                    updatePager();
                    $("#urlInfoBoxThumbnailImage").attr("src", urlInfo.Images[currentImage]);
                }
            });

            function updatePager() {
                if (currentImage <= 0) {
                    $("#url-info-box-prev-image").parent().addClass("previous disabled");
                } else {
                    $("#url-info-box-prev-image").parent().removeClass();
                }
                if (currentImage >= urlInfo.Images.length - 1) {
                    $("#url-info-box-next-image").parent().addClass("previous disabled");
                } else {
                    $("#url-info-box-next-image").parent().removeClass();
                }
            }

            $("#fetchUrlInfo").click(function () {
                //$("#urlInfoBox").hide();
                var url = $("#urlInfoUrlTextBox").val();
                if (url.length <= 0) return;
                $('#loading-indicator').show();
                //alert(url);
                $.ajax({
                    type: "POST",
                    timeout: 80000,
                    url: "UrlSharerDemo.aspx/GetUrlInfo",
                    data: JSON.stringify({ "url": url }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (msg) {
                        $("#urlInfoBox").show();
                        urlInfo = msg.d;
                        currentImage = 0;
                        updatePager();
                        if (msg.d.Images.length == 0) {
                            $("#url-info-image-box").hide();
                        }
                        else {
                            $("#url-info-image-box").show();
                        }
                        $("#urlInfoBoxThumbnailImage").attr("src", msg.d.Images[0]);
                        $("#urlInfoBoxTitle").attr("href", url).html(msg.d.Title);
                        $("#urlInfoBoxDescripton").html(msg.d.Description);
                        $('#loading-indicator').hide();
                        $('#urlInfoBox').show();

                    },
                    error: function (jqXHR, textStatus) {
                        $('#loading-indicator').hide();
                        if (textStatus == 'timeout') {
                            alert('Failed from timeout');
                        }
                    }


                });
            });
        });
    </script>
</asp:Content>
