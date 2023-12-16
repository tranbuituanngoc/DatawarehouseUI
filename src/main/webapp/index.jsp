<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="model.Provinces" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page import="dao.ProvincesDimDAO" %>
<%@ page import="model.Mart" %>
<%@ page import="java.sql.Timestamp" %><%--
  Created by IntelliJ IDEA.
  User: Alshie
  Date: 12/15/2023
  Time: 9:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Dự báo thời tiết hàng giờ tại Hồ Chí Minh - Nhiệt độ thay đổi trong 24h</title>
    <meta name="description"
          content="Thông tin thời tiết theo giờ tại Hồ Chí Minh. Tình hình nhiệt độ, độ ẩm không khí thay đổi trong 24 giờ tới ở Hồ Chí Minh"/>
    <meta name="keywords" content="thời tiết, dự báo thời tiết, thời tiết Hồ Chí Minh theo giờ"/>
    <meta name="robots" content="index, follow"/>
    <meta name='robots' content='max-image-preview:large'/>
    <link rel="canonical" href="https://thoitiet.vn/ho-chi-minh/theo-gio">
    <meta property="fb:pages" content="109224270998756"/>
    <meta property="fb:app_id" content="1879359212516687"/>
    <meta property="og:image" content="https://data.thoitiet.vn/weather/2021/10/18/thoi-tiet-Tp-HCM.jpg"/>
    <meta property="og:image:width" content="1200"/>
    <meta property="og:image:height" content="628"/>
    <meta property="og:image:type" content="image/jpeg"/>
    <meta property="og:title" content="Dự báo thời tiết hàng giờ tại Hồ Chí Minh - Nhiệt độ thay đổi trong 24h"/>
    <meta property="og:url" content="https://thoitiet.vn/ho-chi-minh/theo-gio"/>
    <meta property="og:type" content="website"/>
    <meta property="og:title_name" content="Dự báo thời tiết hàng giờ tại Hồ Chí Minh - Nhiệt độ thay đổi trong 24h"/>
    <meta property="og:description"
          content="Thông tin thời tiết theo giờ tại Hồ Chí Minh. Tình hình nhiệt độ, độ ẩm không khí thay đổi trong 24 giờ tới ở Hồ Chí Minh"/>
    <meta name="twitter:card" content="summary_large_image"/>

    <link rel="apple-touch-icon" sizes="57x57" href="/icons/apple-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="/icons/apple-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="/icons/apple-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="/icons/apple-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="/icons/apple-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="/icons/apple-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="/icons/apple-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="/icons/apple-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="/icons/apple-icon-180x180.png">
    <link rel="icon" type="image/png" sizes="192x192" href="/icons/android-icon-192x192.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/icons/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="96x96" href="/icons/favicon-96x96.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/icons/favicon-16x16.png">
    <link rel="manifest" href="/icons/manifest.json">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="/icons/ms-icon-144x144.png">
    <meta name="theme-color" content="#ffffff">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,400;0,600;0,700;1,400;1,600;1,700&display=swap"
          rel="stylesheet">
    <link href="/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>

    <link rel="stylesheet" href="/lib/bootstrap-icons/bootstrap-icons.css"/>

    <link href="/css/card.css" rel="stylesheet"/>

    <link rel="stylesheet" href="/css/site.css?v=hwgjZ-Xb4qI98fSjzItoHFH9oxBvX0a9oMx9yRAtiFs"/>
    <script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-5437093769370767"
            crossorigin="anonymous"></script>

</head>

<body>

<nav class="navbar sticky-top navbar-expand-md pb-1 bg-white navbar-light">
    <div class="container" style="position:relative">
        <a class="navbar-brand logo" href="/">
            <img src="/img/logo-header.png" class="img-fluid d-none d-md-block"/>
            <img src="/img/logo-mobile.png" class="img-fluid d-block d-md-none"/>
        </a>
        <ul class="navbar-nav ml-auto menu">
            <li class="nav-item dropdown has-megamenu">
                    <span class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" aria-haspopup="true"
                          aria-expanded="false" style="cursor:pointer">
                        <i class="bi bi-pin-map"></i>
                        Tỉnh - Thành phố
                    </span>
                <div class="dropdown-menu megamenu rounded-0" role="menu">
                    <div class="row">
                        <%
                            Map<String, ArrayList<Provinces>> areaMap = (Map<String, ArrayList<Provinces>>) request.getAttribute("areaMap");
                            for (String s : areaMap.keySet()) {
                        %>
                        <div class="col-6 col-md-3">
                            <div class="col-megamenu">
                                <h6 class="title"><%=s%>
                                </h6>
                                <ul class="mega-submenu">
                                    <%
                                        for (Provinces province : areaMap.get(s)) {
                                    %>
                                    <li>
                                        <a href="/thoitiet?province=<%=province.getLink()%>"
                                           title="<%=province.getName()%>>">
                                            <i class="bi bi-arrow-right-short"></i>
                                            <%=province.getName()%>
                                        </a>
                                    </li>
                                    <%
                                        }
                                    %>
                                </ul>
                            </div>
                            <!-- col-megamenu.// -->
                        </div>
                        <%
                            }
                        %>>
                        <!-- end col-3 -->
                    </div>
                    <!-- end row -->
                </div>
                <!-- dropdown-mega-menu.// -->

        </ul>
    </div>
    </div>
</nav>
<main class="weather-day">
    <section class="section-container section-wheather">
        <div class="container">
            <div class="row p-lg-5">
                <!--Danh sách thành phố, điểm đến, núi-->
                <div class="col-8 col-custom m-auto">
                    <%
                        ArrayList<Mart> data = (ArrayList<Mart>) request.getAttribute("mart");
                        if(data!=null){
                            String prov = data.get(0).getProvince().getName();
                            String link = data.get(0).getProvince().getLink();
                    %>
                    <div class="card card-list-weather rounded-0">
                        <div class="card-header d-flex flex-column flex-sm-row justify-content-between header-thoi-tiet-ngay">
                            <h1 class="card-title">
                                <a href="/thoitiet?province=<%=link%>">
                                    Dự báo thời tiết <%=prov%> theo giờ
                                </a>
                            </h1>
                            <div class="share-button">
                                <div class="fb-like" data-href="/thoitiet?province=<%=link%>" data-width=""
                                     data-layout="button" data-action="like" data-size="small" data-share="true"></div>
                            </div>

                        </div>
                        <div class="card-body pb-0 pt-0">
                            <%
                                }
                                for (Mart m : data) {

                            %>
                            <details class="weather-day">
                                <summary class="weather-summary" data-toggle="collapse"
                                         data-target="#detail-<%=m.getTime()%>"
                                         aria-expanded="false" aria-controls="detail-<%=m.getDate().toString()%>">
                                    <div class="weather-summary-content">
                                        <div class="weather-summary-title">
                                            <h2 class="summary-day">
                                                <span><%=m.getTime()%></span>

                                            </h2>
                                            <div class="summary-temperature">
                                                    <span class="summary-temperature-min">
                                                   <%=m.getLow_temp()%>°C
                                                </span>
                                                <span class="summary-temperature-max">
                                                    /
                                                    <span class="summary-temperature-max-value" title="Cảm thấy như">
                                                        <%=m.getHigh_temp()%>°C
                                                    </span>
                                                    </span>
                                            </div>
                                            <div class="summary-description">
                                                <span class="summary-description-detail">
                                                    Mưa nhẹ
                                                </span>
                                            </div>
                                            <div class="summary-humidity">
                                                    <span class="summary-icon">
                                                    <i class="bi bi-droplet"></i>
                                                </span>
                                                <span>
                                                    <%=m.getHumidity()%>%
                                                </span>
                                            </div>
                                            <div class="summary-speed">
                                                    <span class="summary-icon">
                                                    <svg class="WeatherDetailsListItem--icon--NgMGn Icon--icon--2AbGu Icon--darkTheme--2U1o8"
                                                         set="current-conditions" name="wind" theme="dark"
                                                         data-testid="Icon" aria-hidden="true" role="img"
                                                         viewBox="0 0 24 24"><title>Wind</title><path
                                                            d="M6 8.67h5.354c1.457 0 2.234-1.158 2.234-2.222S12.687 4.4 11.354 4.4c-.564 0-1.023.208-1.366.488M3 11.67h15.54c1.457 0 2.235-1.158 2.235-2.222S19.873 7.4 18.54 7.4c-.747 0-1.311.365-1.663.78M6 15.4h9.389c1.457 0 2.234 1.159 2.234 2.223 0 1.064-.901 2.048-2.234 2.048a2.153 2.153 0 0 1-1.63-.742"
                                                            stroke-width="2" stroke="currentColor"
                                                            stroke-linecap="round" fill="none"></path></svg>
                                                </span>
                                                <span>
                                                    <%=m.getWind_spd()%> km/giờ
                                                </span>
                                            </div>
                                        </div>
                                        <span class="weather-summary-toggle">
                                            <i class="bi bi-chevron-down"></i>
                                        </span>
                                    </div>
                                </summary>
                                <div class="weather-content" id="detail-<%=m.getTime()%>">
                                    <div class="d-flex flex-wrap justify-content-between weather-detail weather-detail-cac-ngay mt-2">
                                        <div class="d-flex weather-content-item">
                                            <div class="avatar">
                                                <div class="avatar-img rounded-circle">
                                                    <svg class="WeatherDetailsListItem--icon--NgMGn Icon--icon--2AbGu Icon--darkTheme--2U1o8"
                                                         set="current-conditions" name="uv" theme="dark"
                                                         data-testid="Icon" aria-hidden="true" role="img"
                                                         viewBox="0 0 24 24"><title>UV Level</title>
                                                        <path d="M7.4 5.598a.784.784 0 0 1 .25-.92c.335-.256.824-.197 1.02.062.066.063.066.063.08.085l2.406 3.152-.626.238a3.983 3.983 0 0 0-1.097.633l-.522.424L7.4 5.598zm4.539 2.358c-.21 0-.418.017-.625.05l-.664.106.09-.666.438-3.266c.013-.072.013-.072.012-.057a.783.783 0 0 1 .666-.616.78.78 0 0 1 .872.639l.006.038.507 3.933-.662-.108a3.957 3.957 0 0 0-.64-.053zm-7.781 3.19l.026-.004 3.934-.507-.108.662a3.98 3.98 0 0 0-.003 1.266l.105.664-.665-.09-3.265-.439a.784.784 0 0 1-.676-.679c-.054-.42.238-.809.63-.869l.022-.004zm11.504-.617a3.98 3.98 0 0 0-.632-1.097l-.425-.522.623-.256 3.056-1.256a.787.787 0 0 1 .916.253c.256.337.199.817-.104 1.063l-.045.037-3.151 2.405-.238-.627zm-1.205-1.672a3.984 3.984 0 0 0-1.095-.637l-.626-.24.41-.532 2.008-2.602c.059-.07.059-.07.046-.052a.78.78 0 0 1 1.306.227c.076.185.079.39.02.54l-.021.06-1.528 3.662-.52-.426zM4.595 7.793c.162-.387.611-.58.971-.441.017.004.017.004.055.02L9.283 8.9l-.425.52a3.985 3.985 0 0 0-.636 1.094l-.24.627-3.144-2.425a.784.784 0 0 1-.243-.924zm14.443 7.367c.054.045.054.045.044.04a.784.784 0 0 1 .199.884c-.163.386-.61.58-.964.443-.024-.006-.024-.006-.062-.022l-3.662-1.529.426-.52a3.98 3.98 0 0 0 .636-1.094l.241-.626 3.142 2.424zm1.332-3.303c.053.422-.239.809-.63.87l-.035.006-3.945.508.108-.662a3.999 3.999 0 0 0 .003-1.266l-.105-.663.665.09 3.272.44c.068.012.068.012.052.01a.784.784 0 0 1 .615.667zm-3.894 6.421c.024.068.024.068.017.053a.786.786 0 0 1-.27.87c-.332.25-.816.194-1.047-.091-.022-.023-.022-.023-.05-.058l-2.406-3.154.626-.237a3.977 3.977 0 0 0 1.097-.632l.523-.425 1.51 3.674zm-8.26-4.932c.151.397.365.767.633 1.097l.424.522-.622.256-3.054 1.255a.787.787 0 0 1-.92-.25.781.781 0 0 1-.154-.58c.027-.199.127-.379.227-.452.045-.046.045-.046.075-.069l3.153-2.406.238.627zm3.723 2.572c.209 0 .417-.016.625-.049l.662-.103-.089.664-.438 3.26-.012.062a.785.785 0 0 1-.666.618c-.048.005-.048.005-.101.006-.386 0-.714-.28-.764-.612-.01-.043-.01-.043-.014-.072l-.507-3.934.662.108c.213.035.427.052.642.052zM7.366 18.27l.006-.015L8.9 14.592l.52.426a3.99 3.99 0 0 0 1.094.636l.626.241-.41.531-2.012 2.609-.04.046a.788.788 0 0 1-.886.2.787.787 0 0 1-.428-1.011z"></path>
                                                        <path d="M11.911 14.322a2.411 2.411 0 1 0 0-4.822 2.411 2.411 0 0 0 0 4.822zm0 2a4.411 4.411 0 1 1 0-8.822 4.411 4.411 0 0 1 0 8.822z"></path>
                                                    </svg>
                                                </div>
                                            </div>
                                            <div class="flex-1 pt-1 ml-2">
                                                <h6 class="fw-bold mb-1">Chỉ số UV</h6>
                                                <div class="d-flex ml-auto align-items-center">
                                                        <span class="op-8 fw-bold">
                                                        <%=m.getUvIndex()%>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="d-flex weather-content-item">
                                            <div class="avatar">
                                                <div class="avatar-img rounded-circle">
                                                    <svg class="WeatherDetailsListItem--icon--NgMGn Icon--icon--2AbGu Icon--darkTheme--2U1o8"
                                                         set="current-conditions" name="visibility" theme="dark"
                                                         data-testid="Icon" aria-hidden="true" role="img" width="1024"
                                                         height="1024" viewBox="0 0 1024 1024"><title>Visibility</title>
                                                        <path d="M491.856 879.808c-60.48-5.056-110.848-25.184-171.328-55.424-120.96-55.424-216.704-146.112-292.256-256.96-25.248-40.352-30.24-80.64 0-126.016 80.608-115.872 186.464-211.68 317.472-272.096 110.816-50.4 226.752-50.4 337.664 0 136 60.48 241.824 156.224 317.44 282.208 15.104 25.216 25.12 65.504 10.048 85.728-105.792 191.424-256.992 367.84-519.04 342.56zm292.256-377.92c0-151.168-120.96-272.064-272.096-272.064-146.144 0-272.128 126.016-272.128 272.064 0 151.232 120.96 277.216 272.128 277.216 151.104-.032 272.096-125.984 272.096-277.216z"></path>
                                                        <path d="M789.808 500.416c0 156.896-125.472 287.52-282.336 282.336-156.864 0-282.336-130.656-282.336-287.488 0-146.4 130.656-277.12 282.336-277.12 156.896-.032 287.584 125.376 282.336 282.272zM512.752 348.832c-83.68 0-151.584 67.968-151.584 151.584 0 88.864 67.968 156.896 151.584 156.896 83.648 0 156.832-73.216 156.832-156.896-5.184-83.648-73.152-151.584-156.832-151.584z"></path>
                                                    </svg>
                                                </div>
                                            </div>
                                            <div class="flex-1 pt-1 ml-2">
                                                <h6 class="fw-bold mb-1">Tầm nhìn</h6>
                                                <div class="d-flex ml-auto align-items-center">
                                                        <span class="op-8 fw-bold">
                                                        <%=m.getVisibility()%> km
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="d-flex weather-content-item">
                                            <div class="avatar">
                                                <div class="avatar-img rounded-circle">
                                                    <svg class="WeatherDetailsListItem--icon--NgMGn Icon--icon--2AbGu Icon--darkTheme--2U1o8"
                                                         set="current-conditions" name="pressure" theme="dark"
                                                         data-testid="Icon" aria-hidden="true" role="img"
                                                         viewBox="0 0 24 24"><title>Pressure</title>
                                                        <path d="M8.462 18.293l-.29-.002c-.6-.004-1.043-.007-1.259-.007-1.119 0-1.182-1.015-.34-1.734l.196-.164.508-.425 1.543-1.292c1.014-.846 1.74-1.45 2.073-1.723.735-.601 1.305-.596 2.033.022.387.329.959.805 2.207 1.841a377.936 377.936 0 0 1 2.18 1.816c.796.67.742 1.66-.295 1.66h-2.382v1.77c0 .83-.393 1.223-1.258 1.223h-2.994c-.809 0-1.258-.42-1.258-1.207v-1.773l-.664-.005zm0-12.807l-.29.002c-.6.004-1.043.006-1.259.006-1.119 0-1.182 1.016-.34 1.734l.196.164.508.426 1.543 1.29a348.68 348.68 0 0 0 2.073 1.724c.735.601 1.305.596 2.033-.022.387-.328.959-.805 2.207-1.84a377.937 377.937 0 0 0 2.18-1.817c.796-.67.742-1.659-.295-1.659h-2.382v-1.77c0-.832-.393-1.224-1.258-1.224h-2.994c-.809 0-1.258.42-1.258 1.207V5.48l-.664.005z"></path>
                                                    </svg>
                                                </div>
                                            </div>
                                            <div class="flex-1 pt-1 ml-2">
                                                <h6 class="fw-bold mb-1">Áp suất</h6>
                                                <div class="d-flex ml-auto align-items-center">
                                                    <h3 class="op-8 fw-bold"><%=m.getPressure()%> mb</h3>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="d-flex weather-content-item weather-content-item-description">
                                            <div class="flex-1 pt-1 ml-2">
                                                    <span>
                                                    <%=m.getStatus()%>>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </details>
                            <%
                                }
                            %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

</main>
<script src="/lib/jquery/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"
        integrity="sha384-SR1sx49pcuLnqZUnnPwx6FCym0wLsk5JZuNx2bPPENzswTNFaQU1RDvt3wT4gWFG"
        crossorigin="anonymous"></script>
<script src="/lib/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js" crossorigin="anonymous"></script>
<script src="/js/bootstrap-autocomplete.min.js"></script>

<div class="modal fade" tabindex="-1" id="requestLocalModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>Website cần biết địa điểm của bạn để gợi ý thông tin dự báo thời tiết được chính xác.</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Từ chối</button>
                <button type="button" class="btn btn-primary" onclick="getLocation()">Đồng ý</button>
            </div>
        </div>
    </div>
</div>
<script src="/js/site.js?v=-x9aILkIPryywVnKibGxdP2AziyXdL53OxrXysZHi_w"></script>
<script src="/js/geo.js?v=cvH2dB9EJjIquKHZG_1_XAheDeVwvIrjPbeW2Hj5Ywc"></script>


<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-KVHV391KVM"></script>
<script>
    window.dataLayer = window.dataLayer || [];

    function gtag() {
        dataLayer.push(arguments);
    }

    gtag('js', new Date());

    gtag('config', 'G-KVHV391KVM');
</script>
</body>

</html>