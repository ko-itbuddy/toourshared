﻿<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void BtnLogin_Click(object sender, EventArgs e)
    {
        MemberDao member = new MemberDao();

        Member mem = new Member();

        mem.Mem_id = mem_id.Text;
        mem.Mem_pw = mem_pw.Text;

        int check = member.Login(mem);


        if (Session["mem_id"] == null)
        {
            if (mem_id.Text.Equals("") || mem_pw.Text.Equals(""))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "displayalertmessage", "alert('아이디와 비밀번호를 입력해주세요.');", true);
            }
            else
            {

                if (check == 1)
                {
                    Session["mem_id"] = mem.Mem_id;
                    Session.Timeout = 100;
                    Response.Redirect("/test02.aspx");
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "displayalertmessage", "alert('아이디와, 비밀번호를 다시한번 확인해주세요.');", true);
                    mem_id.Text = "";
                    mem_pw.Text = "";


                }
            }
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["mem_id"]!= null)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "displayalertmessage", "alert('이미 로그인 되어있습니다.');", true);
        }
    }
</script>
 <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>TO OUR SHARED : 로그인</title>

    <!-- Font -->
    <link href="https://fonts.googleapis.com/css?family=Mansalva|Nanum+Gothic|Nanum+Myeongjo|Noto+Sans+KR|Lora|Jua&display=swap" rel="stylesheet">

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <!-- JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<style>
        body {
            margin: 0;
            padding: 0;
            list-style: none;

            line-height: 1;

            /* 전체 배경색 */
            background-color: #00b9f1;
            background-repeat: no-repeat;
        }

        .topnavUl {
            margin: 0;
            padding: 0;

            list-style: none;
            text-decoration: none;

            font-size: 20px;
            font-family: '맑은고딕';
        }

        .topnavLi {
            margin: 0;
            padding: 0;

            list-style: none;
            text-decoration: none;

            font-size: 20px;
            font-family: '맑은고딕';
        }

        .topnavLi ul,
        li {
            list-style: none;
            text-decoration: none;
            padding: 0;
            margin: 0;
        }

        a {
            color: white;
            text-decoration: none;
        }

        #nav {
            z-index: 99999;
            position: absolute;
            width: 100%;
            /* absolute는 부피를 못잡으니까 width 100% */
            overflow: hidden;
            font-size: 25px;

            transition-duration: 0.5s;
            position: fixed;

        }

        #nav:hover {
            height: 250px;
            transition: background .5s;
            background-color: rgba(249, 192, 12, 0.95);
        }

        #nav>ul {
            text-align: center;
            font-family: 'Mansalva', cursive;
            font-size: 25px;
        }

        #nav>ul>li {
            display: inline-block;
            position: relative;

            padding: 0px 50px;
        }

        #nav>ul>li>a {
            display: block;
            padding: 30px 15px 20px;
            line-height: 30px;
            transition: color 0.9s;
            transition: background 0.4s;

            /* 부트스트랩 적용 후 nav 효과 적용이 되는걸 방지하기 위해 */
            text-decoration: none;


            /* 상단 메뉴 글씨 색 */
            color: white;
        }

        #nav>ul>li:hover>a {
            /* 메뉴에 마우스 올렸을 때 발생할 스타일(1Depth) */
            transition: border .5s;
            border-bottom: 3px solid #ff7473;

        }

        #nav ul ul {
            /*display: none;*/
            position: absolute;
            width: 100%;
            /* absolute는 부피를 가질 수 없다 */
            margin: 0px -50px;
        }

        #nav ul ul a {
            /* 2Depth li Style */
            display: block;
            line-height: 40px;
            font-size: 14px;
            color: white;
        }

        #nav ul ul a:hover {
            /* SubMenu 마우스 올렸을 때 발생할 스타일 */
            font-weight: bold;

            /* 부트스트랩 적용 후 nav 효과 적용이 되는걸 방지하기 위해 */
            text-decoration: none;
        }

        #nav li:hover ul {
            display: block;
        }

        #nav li:nth-child(1) ul {
            left: 0;
            width: 100%;
        }

        .nav-logo {
            /* 웹 사이트 좌측 상단에 위치한 로고 div style */
        }

        .nav-logo-item {
            font-family: 'Mansalva', cursive;
            font-size: 25px;
            transition-duration: .5s;
        }

        .nav-logo-item:hover {
            transition-duration: .5s;
            font-size: 28px;
            color: white;

            /* 부트스트랩 적용 후 텍스트에 적용되는 효과 방지를 위해 */
            text-decoration: none;
        }

        .nav-log-area {
            /* 로그인, 로그아웃 영역 */
            width: 150px;
            height: 40px;

            padding-bottom: 5px;
            border: 2px solid white;
            border-radius: 15px;

            transition: .5s;

        }

        .nav-log-item {
            font-size: 20px;
            border: none;
            outline: none;
            cursor: pointer;

            margin-top: 8px;
            color: white;
            background-color: transparent;
        }

        /* 창 크기 조절 시 nav display none 설정 */
        @media only screen and (max-width: 1600px) {
            .topnav {
                display: none;
            }

            .topnav>ul>li>.nav-logo>.nav-logo-item {
                float: left;
                display: block;
            }
        }

        .main {
            width: 100%;
            height: 100%;
            padding-top: 100px;
        }

        .title {
            padding: 150px 0px 70px;
            text-align: center;
        }

        .titleItem {
            cursor: default;
            color: #eee;
            font-size: 50px;
            font-family: 'Mansalva', cursive;
        }

        .body {
            width: 100%;
            height: 620px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .area1 {
            width: 600px;
            height: 200px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .area1 .ID input {
            width: 400px;
            height: 50px;
            padding: 10px;
            font-size: 13px;
            color: rgba(0, 0, 0, 0.7);
            border: none;
            outline: none;
            border-bottom: 0.5px solid rgba(0, 0, 0, 0.3);
        }

        .area1 .PW input {
            width: 400px;
            height: 50px;
            padding: 10px;
            font-size: 13px;
            color: rgba(0, 0, 0, 0.7);
            border: none;
            outline: none;
        }

        .LOGINBTNitem {
            width: 400px;
            height: 50px;
            font-size: 13px;
            border: none;
            outline: none;
            color: white;
            background-color: orange;
            transition-duration: .5s;
        }

        .LOGINBTNitem:hover {
            transition-duration: .5s;
            background-color: darkorange;
        }

        .area2 {
            width: 400px;
            height: 400px;
            display: flex;
            flex-direction: row;
            justify-content: flex-end;
            align-items: center;
        }

        #FindID
        {
            background-color: #00b9f1;
            color: white;
            font-size: 14px;
            text-decoration: none;
            outline : none;
        }

        #FindPW
        {
            background-color: #00b9f1;
            color: white;
            font-size: 14px;
            text-decoration: none;
            outline : none;

        }

        .findLine {
            width: 0.5px;
            height: 13px;
            border-right: 1px solid black;
            margin-top: 6px;
        }

        .area3 {
            width: 400px;
            height: 400px;
            padding: 50px 0px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .joinText {
            padding-top: 200px;
        }

        .joinText span {
            cursor: default;
            color: white;
            font-size: 13px;
        }

        .joinBtn {
            padding-top: 3px;
        }

        .joinBtnItem {
            width: 400px;
            height: 50px;
            color: #fff;
            font-size: 13px;
            border: none;
            outline: none;
            background-color: orange;
            transition-duration: .5s;
        }

        .joinBtnItem:hover {
            transition-duration: .5s;
            background-color: darkorange;
        }

        .footer {
            width: 100%;
            height: 250px;
            background-color: #272625;
        }

    </style>
    <script>
        /* scroll할 때 발생할 이벤트 */
        window.onscroll = function() {
            scrollFunction();
        }

        function scrollFunction() {
            var nav = $("nav");
            var v_scroll = $(window).scrollTop();

            if (v_scroll >= 20) {
                document.getElementById("nav").style.background = "rgba(249, 192, 12, 0.95)";
            } else if (v_scroll <= 0) {
                document.getElementById("nav").style.background = "";
            }
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
       <div id="nav" class="topnav">
        <ul class="topnavUl">
            <li class="topnavLi">
                <div class="nav-logo">
                    <a href="#" class="nav-logo-item">To Our Shared</a>
                </div>
            </li>
            <li class="topnavLi">
                <a href="#">소개</a>
                <ul>
                    <li><a href="#">TOUPLE</a></li>
                    <li><a href="#">서브메뉴1-2</a></li>
                    <li><a href="#">서브메뉴1-3</a></li>
                </ul>
            </li>
            <li class="topnavLi">
                <a href="#">메뉴 2</a>
                <ul>
                    <li><a href="#">서브메뉴2-1</a></li>
                    <li><a href="#">서브메뉴2-2</a></li>
                    <li><a href="#">서브메뉴2-3</a></li>
                </ul>
            </li>
            <li class="topnavLi">
                <a href="#">메뉴 3</a>
                <ul>
                    <li><a href="#">서브메뉴3-1</a></li>
                    <li><a href="#">서브메뉴3-2</a></li>
                    <li><a href="#">서브메뉴3-3</a></li>
                </ul>
            </li>
            <li class="topnavLi">
                <a href="#">커뮤니티</a>
                <ul>
                    <li><a href="#">자유게시판</a></li>
                    <li><a href="#">리뷰게시판</a></li>
                </ul>
            </li>
            <li class="topnavLi">
                <a href="#">고객센터</a>
                <ul>
                    <li><a href="#">도움말</a></li>
                    <li><a href="#">건의사항</a></li>
                </ul>
            </li>
            <li class="topnavLi">
                <div class="nav-log">
                    <a href="#">
                        <div class="nav-log-area">
                            <input type="button" value="로그인" class="nav-log-item">
                        </div>
                    </a>
                </div>
            </li>
        </ul>
    </div>

    <!-- main 영역 -->
    <div class="main">
        <div class="title">
            <div class="titleItem">
                To Our Shared
            </div>
        </div>
        <div class="body">
            <!-- 아이디 및 패스워드 입력, 로그인 버튼-->
            <div class="area1">
                <div class="ID">
                    <asp:TextBox ID="mem_id" runat="server" placeholder="아이디" maxlength="15"></asp:TextBox>
                </div>
                <div class="PW">
                    <asp:TextBox ID="mem_pw" runat="server" placeholder="비밀번호" maxlength="20" TextMode="Password"></asp:TextBox>
                </div>
                <div class="LOGINBTN">
                    <asp:Button ID="BtnLogin" runat="server" Text="로그인"  CssClass="LOGINBTNitem" OnClick="BtnLogin_Click" />
                </div>
            </div>

            <!-- 아이디 비밀번호 찾기 -->
            <div class="area2">
                <div class="findID">
                    <asp:Button ID="FindID" runat="server" Text="아이디찾기" BorderStyle="None" />
                </div>
                <!-- 구분선 -->
                <div class="findLine"></div>
                <div class="findPW">
                    <asp:Button ID="FindPW" runat="server" Text="비밀번호찾기" BorderStyle="None"/>
                </div>
            </div>

            <!-- 회원가입 버튼-->
            <div class="area3">
                <div class="joinText">
                    <span>아직 회원이 아니신가요?</span>
                </div>
                <div class="joinBtn">
                    <a href="#">
                        <asp:Button ID="JoinBtn" runat="server" Text="회원가입" class="joinBtnItem" />
                    </a>
                </div>
            </div>
        </div>
    </div>

    <!-- footer 영역 -->
    <div class="footer">
        a
    </div>
        </form>
</body>

</html>

