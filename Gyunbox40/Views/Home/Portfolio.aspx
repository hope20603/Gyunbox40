<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Portfolio.aspx.cs" Inherits="Gyunbox40.Views.Home.About" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section class="content">
        <section class="potfolio-section cfixed">
            <div class="container" >
                <h2 class="location">포트폴리오</h2>
                <!--
                    모바일일 경우에는 설명과 사진을 모두 width 100으로 잡고 진행
                    태블릿과 피씨는 동일한 디자인으로 가고
                    디자인은 index 페이지의 work를 따서 진행
                --->
                <div class="sub-section potfolio">
                    <!--  start : 프로젝트 단위로 반복 -->
                    <div class="list_item_num">
                        <span class="sp_num c1 w1">Project 1</span>
                        <span class="sp_time"><time datetime="2016-01-01">2014.04~2014.08</time></span>
                    </div>
                    <div class="list_item cfixed">
                        <img src="/images/project-images/po1-s.png" />
                        <div class="info">
                            <ul>
                                <li class="lf">구분</li><li class="rf">신규 페이지 개발</li>
                                <li class="lf">프로젝트명</li><li class="rf">휴양림 예약 연동 사이트 개발</li>
                                <li class="lf">작업기간</li><li class="rf">4달</li>
                                <li class="lf">사용기술</li><li class="rf">ASP.NET MVC, JAVASCRIPT, JQUERY ,DB2</li>
                            </ul>
                        </div>
                    </div>
                    <!--  end : 프로젝트 단위로 반복 -->
                    <hr class="divider" />

                    <!--  start : 프로젝트 단위로 반복 -->
                    <div class="list_item_num">
                        <span class="sp_num c1 w1">Project 2</span>
                        <span class="sp_time"><time datetime="2016-01-01">2014.09~2014.11</time></span>
                    </div>
                    <div class="list_item cfixed">
                        <img src="/images/project-images/po2-s.png" />
                        <div class="info">
                            <ul>
                                <li class="lf">구분</li><li class="rf">홈페이지 리뉴얼</li>
                                <li class="lf">프로젝트명</li><li class="rf">한진그룹 임직원몰 리뉴얼</li>
                                <li class="lf">작업기간</li><li class="rf">3달</li>
                                <li class="lf">사용기술</li><li class="rf">ASP.NET MVC, JAVASCRIPT, JQUERY, XML ,DB2</li>
                            </ul>
                        </div>
                    </div>
                    <!--  end : 프로젝트 단위로 반복 -->
                    <hr class="divider" />

                    <!--  start : 프로젝트 단위로 반복 -->
                    <div class="list_item_num">
                        <span class="sp_num c1 w1">Project 3</span>
                        <span class="sp_time"><time datetime="2016-01-01">2014.12~2015.02</time></span>
                    </div>
                    <div class="list_item cfixed">
                        <img src="/images/project-images/po3-s.png" />
                        <div class="info">
                            <ul>
                                <li class="lf">구분</li><li class="rf">신규페이지 개발</li>
                                <li class="lf">프로젝트명</li><li class="rf">칼팍 호텔예약시스템 개발</li>
                                <li class="lf">작업기간</li><li class="rf">2달</li>
                                <li class="lf">사용기술</li><li class="rf">ASP.NET MVC, JAVASCRIPT, JQUERY, XML, DB2</li>
                            </ul>
                        </div>
                    </div>
                    <!--  end : 프로젝트 단위로 반복 -->
                    <hr class="divider" />

                    <!--  start : 프로젝트 단위로 반복 -->
                    <div class="list_item_num">
                        <span class="sp_num c1 w1">Project 4</span>
                        <span class="sp_time"><time datetime="2016-01-01">2015.03~2015.04</time></span>
                    </div>
                    <div class="list_item cfixed">
                        <img src="/images/project-images/po4-s.png" />
                        <div class="info">
                            <ul>
                                <li class="lf">구분</li><li class="rf">홈페이지 리뉴얼</li>
                                <li class="lf">프로젝트명</li><li class="rf">한진관광 영문사이트 리뉴얼</li>
                                <li class="lf">작업기간</li><li class="rf">1달</li>
                                <li class="lf">사용기술</li><li class="rf">ASP.NET MVC, JAVASCRIPT, JQUERY, XML, DB2</li>
                            </ul>
                        </div>
                    </div>
                    <!--  end : 프로젝트 단위로 반복 -->
                    <hr class="divider" />

                    <!--  start : 프로젝트 단위로 반복 -->
                    <div class="list_item_num">
                        <span class="sp_num c1 w1">Project 5</span>
                        <span class="sp_time"><time datetime="2016-01-01">2015.05~2015.06</time></span>
                    </div>
                    <div class="list_item cfixed">
                        <img src="/images/project-images/po5-s.png" />
                        <div class="info">
                            <ul>
                                <li class="lf">구분</li><li class="rf">신규페이지 개발</li>
                                <li class="lf">프로젝트명</li><li class="rf">한진관광 국내그룹항공권 판매 시스템 개발 </li>
                                <li class="lf">작업기간</li><li class="rf">1달</li>
                                <li class="lf">사용기술</li><li class="rf">ASP.NET MVC, JAVASCRIPT, JQUERY, XML, DB2</li>
                            </ul>
                        </div>
                    </div>
                    <!--  end : 프로젝트 단위로 반복 -->
                    <hr class="divider" />

                    <!--  start : 프로젝트 단위로 반복 -->
                    <div class="list_item_num">
                        <span class="sp_num c1 w1">Project 6</span>
                        <span class="sp_time"><time datetime="2016-01-01">2015.07~2015.09</time></span>
                    </div>
                    <div class="list_item cfixed">
                        <img src="/images/project-images/po6-s.png" />
                        <div class="info">
                            <ul>
                                <li class="lf">구분</li><li class="rf">신규 페이지 개발, API연동</li>
                                <li class="lf">프로젝트명</li><li class="rf">농협 NH여행 상품 연동 API 개발</li>
                                <li class="lf">작업기간</li><li class="rf">2달</li>
                                <li class="lf">사용기술</li><li class="rf">ASP.NET MVC, JAVASCRIPT, JQUERY, XML, ORACLE</li>
                            </ul>
                        </div>
                    </div>
                    <!--  end : 프로젝트 단위로 반복 -->
                    <hr class="divider" />

                    <!--  start : 프로젝트 단위로 반복 -->
                    <div class="list_item_num">
                        <span class="sp_num c1 w1">Project 7</span>
                        <span class="sp_time"><time datetime="2016-01-01">2015.10 ~ 2016.01</time></span>
                    </div>
                    <div class="list_item cfixed">
                        <img src="/images/project-images/po7-s.png" />
                        <div class="info">
                            <ul>
                                <li class="lf">구분</li><li class="rf">신규 페이지 개발, API연동</li>
                                <li class="lf">프로젝트명</li><li class="rf">신한카드 상품 연동 API 개발</li>
                                <li class="lf">작업기간</li><li class="rf">3달</li>
                                <li class="lf">사용기술</li><li class="rf">ASP.NET MVC, ASP, JAVASCRIPT, JQUERY ,XML, ORACLE</li>
                            </ul>
                        </div>
                    </div>
                    <!--  end : 프로젝트 단위로 반복 -->
                    <hr class="divider" />

                    <!--  start : 프로젝트 단위로 반복 -->
                    <div class="list_item_num">
                        <span class="sp_num c1 w1">Project 8</span>
                        <span class="sp_time"><time datetime="2016-01-01">2016.02 ~ 2016.03</time></span>
                    </div>
                    <div class="list_item cfixed">
                        <img src="/images/project-images/po8-s.png" />
                        <div class="info">
                            <ul>
                                <li class="lf">구분</li><li class="rf">신규 페이지 개발, API연동</li>
                                <li class="lf">프로젝트명</li><li class="rf">투어캐빈 상품 연동 API 개발</li>
                                <li class="lf">작업기간</li><li class="rf">1달</li>
                                <li class="lf">사용기술</li><li class="rf">ASP.NET MVC, ASP, JAVASCRIPT, JQUERY ,XML</li>
                            </ul>
                        </div>
                    </div>
                    <!--  end : 프로젝트 단위로 반복 -->
                    <hr class="divider" />

                    <!--  start : 프로젝트 단위로 반복 -->
                    <div class="list_item_num">
                        <span class="sp_num c1 w1">Project 9</span>
                        <span class="sp_time"><time datetime="2016-01-01">2016.04 ~ 2016.05</time></span>
                    </div>
                    <div class="list_item cfixed">
                        <img src="/images/project-images/po9-s.png" />
                        <div class="info">
                            <ul>
                                <li class="lf">구분</li><li class="rf">신규 페이지 개발, API연동</li>
                                <li class="lf">프로젝트명</li><li class="rf">이지웰페어 상품 연동 API 개발</li>
                                <li class="lf">작업기간</li><li class="rf">2달</li>
                                <li class="lf">사용기술</li><li class="rf">ASP.NET MVC, ASP, JAVASCRIPT, JQUERY ,XML ,ORACLE</li>
                            </ul>
                        </div>
                    </div>
                    <!--  end : 프로젝트 단위로 반복 -->
                    <hr class="divider" />

                    <!--  start : 프로젝트 단위로 반복 -->
                    <div class="list_item_num">
                        <span class="sp_num c1 w1">Project 10</span>
                        <span class="sp_time"><time datetime="2016-01-01">2016.06 ~ 2016.08</time></span>
                    </div>
                    <div class="list_item cfixed">
                        <img src="/images/project-images/po10-s.png" />
                        <div class="info">
                            <ul>
                                <li class="lf">구분</li><li class="rf">홈페이지 부분 리뉴얼</li>
                                <li class="lf">프로젝트명</li><li class="rf">한진관광 서브메인 페이지 리뉴얼 및 관리자 페이지 개발</li>
                                <li class="lf">작업기간</li><li class="rf">2달</li>
                                <li class="lf">사용기술</li><li class="rf">ASP.NET MVC, JAVASCRIPT, JQUERY ,XML ,ORACLE</li>
                            </ul>
                        </div>
                    </div>
                    <!--  end : 프로젝트 단위로 반복 -->
                    <hr class="divider" />


                    <!--  start : 프로젝트 단위로 반복 -->
                    <div class="list_item_num">
                        <span class="sp_num c1 w1">Project 11</span>
                        <span class="sp_time"><time datetime="2016-01-01">2016.09 ~ 2016.10</time></span>
                    </div>
                    <div class="list_item cfixed">
                        <img src="/images/project-images/po11-s.png" />
                        <div class="info">
                            <ul>
                                <li class="lf">구분</li><li class="rf">홈페이지 부분 리뉴얼</li>
                                <li class="lf">프로젝트명</li><li class="rf">칼팍 멤버십 가입 시스템 개발</li>
                                <li class="lf">작업기간</li><li class="rf">1달</li>
                                <li class="lf">사용기술</li><li class="rf">ASP.NET MVC, JAVASCRIPT, JQUERY ,XML ,ORACLE</li>
                            </ul>
                        </div>
                    </div>
                    <!--  end : 프로젝트 단위로 반복 -->
                    <hr class="divider" />

                    <!--  start : 프로젝트 단위로 반복 -->
                    <div class="list_item_num">
                        <span class="sp_num c1 w1">Project 12</span>
                        <span class="sp_time"><time datetime="2016-01-01">2016.11 ~ 2017.01</time></span>
                    </div>
                    <div class="list_item cfixed">
                        <img src="/images/project-images/po12-s.png" />
                        <div class="info">
                            <ul>
                                <li class="lf">구분</li><li class="rf">제휴사 부분 리뉴얼</li>
                                <li class="lf">프로젝트명</li><li class="rf">11번가 웹, 모바일 상품 연동 API 리뉴얼</li>
                                <li class="lf">작업기간</li><li class="rf">2달</li>
                                <li class="lf">사용기술</li><li class="rf">ASP.NET MVC, JAVASCRIPT, JQUERY ,XML ,ORACLE</li>
                            </ul>
                        </div>
                    </div>
                    <!--  end : 프로젝트 단위로 반복 -->
                    <hr class="divider" />

                    <!--  start : 프로젝트 단위로 반복 -->
                    <div class="list_item_num">
                        <span class="sp_num c1 w1">Project 13</span>
                        <span class="sp_time"><time datetime="2016-01-01">2017.02 ~ 2017.04</time></span>
                    </div>
                    <div class="list_item cfixed">
                        <img src="/images/project-images/po13-s.png" />
                        <div class="info">
                            <ul>
                                <li class="lf">구분</li><li class="rf">제휴사 부분 리뉴얼</li>
                                <li class="lf">프로젝트명</li><li class="rf">삼성카드 임직원몰 리뉴얼 및 신규 임직원몰 추가</li>
                                <li class="lf">작업기간</li><li class="rf">2달</li>
                                <li class="lf">사용기술</li><li class="rf">ASP.NET MVC, JAVASCRIPT, JQUERY ,XML ,ORACLE</li>
                            </ul>
                        </div>
                    </div>
                    <!--  end : 프로젝트 단위로 반복 -->
                    <hr class="divider" />

                    <!--  start : 프로젝트 단위로 반복 -->
                    <div class="list_item_num">
                        <span class="sp_num c1 w1">Project 14</span>
                        <span class="sp_time"><time datetime="2016-01-01">2017.02 ~ 2017.09</time></span>
                    </div>
                    <div class="list_item cfixed">
                        <img src="/images/project-images/po14-s.png" />
                        <div class="info">
                            <ul>
                                <li class="lf">구분</li><li class="rf">제휴사 신규 개발</li>
                                <li class="lf">프로젝트명</li><li class="rf">CJMall 웹, 모바일 상품 연동 API 개발</li>
                                <li class="lf">작업기간</li><li class="rf">7달</li>
                                <li class="lf">사용기술</li><li class="rf">ASP.NET MVC, JAVASCRIPT, JQUERY ,XML ,ORACLE</li>
                            </ul>
                        </div>
                    </div>
                    <!--  end : 프로젝트 단위로 반복 -->
                    <hr class="divider" />

                    <!--  start : 프로젝트 단위로 반복 -->
                    <div class="list_item_num">
                        <span class="sp_num c1 w1">Project 15</span>
                        <span class="sp_time"><time datetime="2016-01-01">2017.03 ~ 2017.09</time></span>
                    </div>
                    <div class="list_item cfixed">
                        <img src="/images/project-images/po15-s.png" />
                        <div class="info">
                            <ul>
                                <li class="lf">구분</li><li class="rf">제휴사 신규 개발</li>
                                <li class="lf">프로젝트명</li><li class="rf">현대카드 상품 연동 API 개발</li>
                                <li class="lf">작업기간</li><li class="rf">6달</li>
                                <li class="lf">사용기술</li><li class="rf">ASP.NET MVC, JAVASCRIPT, JQUERY ,XML ,ORACLE</li>
                            </ul>
                        </div>
                    </div>
                    <!--  end : 프로젝트 단위로 반복 -->
                    <hr class="divider" />

                    <!--  start : 프로젝트 단위로 반복 -->
                    <div class="list_item_num">
                        <span class="sp_num c1 w1">Project 16</span>
                        <span class="sp_time"><time datetime="2016-01-01">2017.12 ~ 2018.02</time></span>
                    </div>
                    <div class="list_item cfixed">
                        <img src="/images/project-images/po16-s.png" />
                        <div class="info">
                            <ul>
                                <li class="lf">구분</li><li class="rf">제휴사 부분 리뉴얼</li>
                                <li class="lf">프로젝트명</li><li class="rf">현대카드 모바일 페이지 입점 개발</li>
                                <li class="lf">작업기간</li><li class="rf">2달</li>
                                <li class="lf">사용기술</li><li class="rf">ASP.NET MVC, JAVASCRIPT, JQUERY ,XML ,ORACLE</li>
                            </ul>
                        </div>
                    </div>
                    <!--  end : 프로젝트 단위로 반복 -->
                    <hr class="divider" />

                    <!--  start : 프로젝트 단위로 반복 -->
                    <div class="list_item_num">
                        <span class="sp_num c1 w1">Project 17</span>
                        <span class="sp_time"><time datetime="2016-01-01">2017.10 ~ 2017.11</time></span>
                    </div>
                    <div class="list_item cfixed">
                        <img src="/images/project-images/po17-s.png" />
                        <div class="info">
                            <ul>
                                <li class="lf">구분</li><li class="rf">신규 페이지 개발</li>
                                <li class="lf">프로젝트명</li><li class="rf">평창올림픽 호텔예약페이지 개발</li>
                                <li class="lf">작업기간</li><li class="rf">1달</li>
                                <li class="lf">사용기술</li><li class="rf">ASP.NET MVC, JAVASCRIPT, JQUERY ,XML ,ORACLE</li>
                            </ul>
                        </div>
                    </div>
                    <!--  end : 프로젝트 단위로 반복 -->
                    <hr class="divider" />

                    <!--  start : 프로젝트 단위로 반복 -->
                    <div class="list_item_num">
                        <span class="sp_num c1 w1">Project 18</span>
                        <span class="sp_time"><time datetime="2016-01-01">2017.12 ~ 2018.02</time></span>
                    </div>
                    <div class="list_item cfixed">
                        <img src="/images/project-images/po18-s.png" />
                        <div class="info">
                            <ul>
                                <li class="lf">구분</li><li class="rf">제휴사 전체 리뉴얼</li>
                                <li class="lf">프로젝트명</li><li class="rf">비씨카드 입점 페이지 리뉴얼</li>
                                <li class="lf">작업기간</li><li class="rf">2달</li>
                                <li class="lf">사용기술</li><li class="rf">ASP.NET MVC, JAVASCRIPT, JQUERY ,XML ,ORACLE</li>
                            </ul>
                        </div>
                    </div>
                    <!--  end : 프로젝트 단위로 반복 -->
                    <hr class="divider" />

                     <!--  start : 프로젝트 단위로 반복 -->
                    <div class="list_item_num">
                        <span class="sp_num c1 w1">Project 19</span>
                        <span class="sp_time"><time datetime="2016-01-01">2017.12 ~ 2018.02</time></span>
                    </div>
                    <div class="list_item cfixed">
                        <img src="/images/project-images/po19-s.png" />
                        <div class="info">
                            <ul>
                                <li class="lf">구분</li><li class="rf">제휴사 전체 리뉴얼</li>
                                <li class="lf">프로젝트명</li><li class="rf">비씨카드 모바일 입점 페이지 리뉴얼</li>
                                <li class="lf">작업기간</li><li class="rf">2달</li>
                                <li class="lf">사용기술</li><li class="rf">ASP.NET MVC, JAVASCRIPT, JQUERY ,XML ,ORACLE</li>
                            </ul>
                        </div>
                    </div>
                    <!--  end : 프로젝트 단위로 반복 -->
                    <hr class="divider" />

                    <!--  start : 프로젝트 단위로 반복 -->
                    <div class="list_item_num">
                        <span class="sp_num c1 w1">Project 20</span>
                        <span class="sp_time"><time datetime="2016-01-01">2018.03 ~ 2018.03</time></span>
                    </div>
                    <div class="list_item cfixed">
                        <img src="/images/project-images/po20-s.png" />
                        <div class="info">
                            <ul>
                                <li class="lf">구분</li><li class="rf">제휴사 부분 리뉴얼</li>
                                <li class="lf">프로젝트명</li><li class="rf">대한항공 입점 페이지 리뉴얼</li>
                                <li class="lf">작업기간</li><li class="rf">1달</li>
                                <li class="lf">사용기술</li><li class="rf">ASP.NET MVC, JAVASCRIPT, JQUERY ,XML ,ORACLE</li>
                            </ul>
                        </div>
                    </div>
                    <!--  end : 프로젝트 단위로 반복 -->
                    <hr class="divider" />

                    <!--  start : 프로젝트 단위로 반복 -->
                    <div class="list_item_num">
                        <span class="sp_num c1 w1">Project 21</span>
                        <span class="sp_time"><time datetime="2016-01-01">2018.04 ~ 2018.04 </time></span>
                    </div>
                    <div class="list_item cfixed">
                        <img src="/images/project-images/po21-s.png" />
                        <div class="info">
                            <ul>
                                <li class="lf">구분</li><li class="rf">제휴사 전체 리뉴얼</li>
                                <li class="lf">프로젝트명</li><li class="rf">옥션 API연동 개발</li>
                                <li class="lf">작업기간</li><li class="rf">1달</li>
                                <li class="lf">사용기술</li><li class="rf">ASP.NET MVC, JAVASCRIPT, JQUERY ,XML ,ORACLE</li>
                            </ul>
                        </div>
                    </div>
                    <!--  end : 프로젝트 단위로 반복 -->
                    <hr class="divider" />

                    <!--  start : 프로젝트 단위로 반복 -->
                    <div class="list_item_num">
                        <span class="sp_num c1 w1">Project 22</span>
                        <span class="sp_time"><time datetime="2016-01-01">2018.08 ~ 2018.11</time></span>
                    </div>
                    <div class="list_item cfixed">
                        <img src="/images/project-images/po22-s.png" />
                        <div class="info">
                            <ul>
                                <li class="lf">구분</li><li class="rf">CRM 도입</li>
                                <li class="lf">프로젝트명</li><li class="rf">한진관광 CRM 도입에 따른 웹사이트 개발 </li>
                                <li class="lf">작업기간</li><li class="rf">3달</li>
                                <li class="lf">사용기술</li><li class="rf">ASP.NET MVC, JAVASCRIPT, JQUERY ,XML ,ORACLE</li>
                            </ul>
                        </div>
                    </div>
                   
                </div>
            </div>
        </section>
    </section>
    <script type="text/javascript">
        //width에 맞는 이미지로 교체
        $(function () {
            var $imgs = $(".list_item > img");
            replaceWidth = 600;
            function imgSize() {
                $imgs.each(function () {
                    if (window.innerWidth >= replaceWidth) {
                        $(this).attr("src", $(this).attr("src").replace("-s", "-big"));
                    } else {
                        $(this).attr("src", $(this).attr("src").replace("-big", "-s"));
                    }
                });
            }

            $(window).resize(function () {
                imgSize();
            });
           imgSize();
            
        });
    </script>
</asp:Content>
