<%@ Page Title="" Language="C#" MasterPageFile="~/SiteBlog.Master" AutoEventWireup="true" CodeBehind="Detail.aspx.cs" Inherits="Gyunbox40.Views.DevHome.Board.Detail" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainHeader" runat="server" Visible="false"></asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="WriteHeader" runat="server">
    <header class="blog_header" style="display:none;">
        <h1 class="logo"></h1>
        <nav>
            <ul class="gnb">
                <li class="btn write"><a href="/Views/DevHome/Board/Write.aspx">글쓰기</a></li>
            </ul>
        </nav>
    </header>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="/Content/css/board.css" rel="stylesheet" />
    <div class="board_wrap">
        <div class="board_content">
            <div class="btn_wrap">
                <asp:Button ID="btnList" runat="server" Text="목록" OnClick="btnList_Click" CssClass="btn list" />
                <asp:Button ID="btnModify" runat="server" Text="수정" OnClick="btnModify_Click" CssClass="btn mod" />
                <asp:Button ID="btnDelete" runat="server" Text="삭제" OnClick="btnDelete_Click" CssClass="btn del" />
            </div>
            <div class="content">
                <div class="content_tit">
                    <span class="tit_category">
                        <asp:Literal ID="ltl_category" runat="server"></asp:Literal></span>
                    <span class="tit_post">
                        <asp:Literal ID="ltl_Title" runat="server"></asp:Literal></span>
                    <span class="tit_info">
                        <span class="sp_wrap">
                            <span class="sp_writer">
                                <asp:Literal ID="ltl_writer" runat="server"></asp:Literal></span>
                            <span class="sp_time">
                                <asp:Literal ID="ltl_regDate" runat="server"></asp:Literal></span>
                        </span>
                    </span>
                </div>
                <div class="content_con" style="margin-bottom:50px;">
                    <asp:Literal ID="ltl_Content" runat="server"></asp:Literal>
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
    </div>
</asp:Content>
