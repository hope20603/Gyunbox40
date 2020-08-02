<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Vue.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Gyunbox40.Vue.About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .app-about{width:95%; background-color:#ffffff; margin:10px auto; padding:10px; box-sizing:border-box; margin-bottom:30px;}
        .app-about .section_info {min-height:300px;}
        .app-about .section_info li{width:100%; height:30px; line-height:30px;}
    </style>
    <div id="app" class="app-about">
        <div class="section_info">
            <ul>
                <li>안녕하세요.</li>
                <li>또그램은 사용자가 자주 사용하는 번호들을 저장해</li>
                <li>두고 관리 할수 있는 웹사이트 입니다.</li>
                <li>또한 약간의 확률계산을 통해서 <span style="font-weight:bold;">행운의 번호</span>도 제공하고 있습니다.</li>
                <li>회원가입 및 이용은 모두 <span style="font-weight:bold;">무료</span>로 하실 수 있습니다.</li>
                <li>사이트 내 광고로 운영되고 있기 때문에, 보기 불편하시더라도 </li>
                <li>이해 부탁드립니다.</li>
                <li></li>
                <li><span style="font-weight:bold;">대박</span>나세요! 감사합니다.</li>
            </ul>
        </div>
        <div id="disqus_thread"></div>
                <script>

                    /**
                    *  RECOMMENDED CONFIGURATION VARIABLES: EDIT AND UNCOMMENT THE SECTION BELOW TO INSERT DYNAMIC VALUES FROM YOUR PLATFORM OR CMS.
                    *  LEARN WHY DEFINING THESE VARIABLES IS IMPORTANT: https://disqus.com/admin/universalcode/#configuration-variables*/
                    /*
                    var disqus_config = function () {
                    this.page.url = PAGE_URL;  // Replace PAGE_URL with your page's canonical URL variable
                    this.page.identifier = PAGE_IDENTIFIER; // Replace PAGE_IDENTIFIER with your page's unique identifier variable
                    };
                    */
                    (function () { // DON'T EDIT BELOW THIS LINE
                        var d = document, s = d.createElement('script');
                        s.src = 'https://ddogram.disqus.com/embed.js';
                        s.setAttribute('data-timestamp', +new Date());
                        (d.head || d.body).appendChild(s);
                    })();
                </script>
                <noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>

            </div>
    </div>
</asp:Content>
