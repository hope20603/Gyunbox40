<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Vue.Master" AutoEventWireup="true" CodeBehind="StoresMap.aspx.cs" Inherits="Gyunbox40.Vue.StoresMap" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* 팝업 느낌으로 가봅시다.. */
        .header{display:none;}
        .master_footer{display:none;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="app" class="app-maps">
        <div class="store_info_wrap">
            <div class="btn_wrap">
                <a href="stores.aspx?seq=<%=seq%>">
                    <img src="../images/icon/icons8-multiply-50.png" class="icon-h50" alt="닫기"/>
                </a>
            </div>
            <div class="store_info">
                <div class="info_title"><%=store_name%></div>
                <div class="info_address"><%=store_add%></div>
                <div class="info_win">
                    <img src="../images/icon/icons8-medal-first-place-64.png" alt="승리횟수" class="icon-small" />
                    <span class="sp_win"><%=win_cnt%></span>
                </div>
            </div>
        </div>
        <div class="map_wrap">
            <div id="map" style="width: 100%; height: 400px;"></div>
        </div>
    </div>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=04eded61fa45e57f42ac4edd834508fe&libraries=services"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=04eded61fa45e57f42ac4edd834508fe"></script>
    <script type="text/javascript">
        var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
        var options = { //지도를 생성할 때 필요한 기본 옵션
            center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
            level: 3 //지도의 레벨(확대, 축소 정도)
        };

        // 지도를 생성합니다
        var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

        // 주소-좌표 변환 객체를 생성합니다
        var geocoder = new kakao.maps.services.Geocoder();

        // 주소로 좌표를 검색합니다
        geocoder.addressSearch('<%=store_add%>', function (result, status) {

            // 정상적으로 검색이 완료됐으면 
            if (status === kakao.maps.services.Status.OK) {

                var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                // 결과값으로 받은 위치를 마커로 표시합니다
                var marker = new kakao.maps.Marker({
                    map: map,
                    position: coords
                });

                // 인포윈도우로 장소에 대한 설명을 표시합니다
                var infowindow = new kakao.maps.InfoWindow({
                    content: '<div style="width:150px;text-align:center;padding:6px 0;"><div style="font-weight: bold;"><%=store_name%></div><div>1등당첨횟수 : <%=win_cnt%></div></div>'
                });
                infowindow.open(map, marker);

                // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                map.setCenter(coords);
            }
        });    

    </script>
</asp:Content>
