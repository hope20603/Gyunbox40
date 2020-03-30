using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using GyunboxCore.Services;
using GyunboxCore.Models;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Http;
using GyunboxCore.Models.DotNetNote;

namespace GyunboxCore
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddControllersWithViews();
            services.AddSingleton<InfoService>();

            //[DI(Dependency Injection)] 서비스 등록
            services.AddSingleton<CopyrightService>();

            //[DI(Dependency Injection)] 서비스 등록
            //services.AddTransient<ICopyrightService, CopyrightService>();
            services.AddSingleton<ICopyrightService, CopyrightService>();
            services.AddSingleton<IInfoService, InfoService>();

            //[DNN][!] Configuration 개체주입:
            // IConfiguratino 또는 IConfigurationRoot에 Configuration 개체 전달
            // appsettings.json 파일의 데이터베이스 연결 문자열을 리파지터리 클래스에서 사용할 수 있도록 설정
            services.AddSingleton<IConfiguration>(Configuration);

            //[Tech] 기술목록
            services.AddTransient<ITechRepository, TechRepository>();

            //[CommunityCamp] 모듈 서비스 등록
            services.AddTransient<ICommunityCampJoinMemberRepository, CommunityCampJoinMemberRepository>();

            //컴트롤러 실행시 자동으로 NoteRepository클래스의 인스턴스를 생성해주는 역할을 한다.
            services.AddTransient<INoteRepository, NoteRepository>();

            //NoteCommentRepository 클래스 생성자에 데이터베이스 연결 문자열을 전송하는 방식을 사용
            services.AddSingleton<INoteCommentRepository>(new NoteCommentRepository(Configuration["ConnectionString:DefaultConnection"]));

            //services.AddAuthentication("CookieAuthentication")
            //     .AddCookie("CookieAuthentication", config =>
            //     {
            //         config.Cookie.Name = "UserLoginCookie";
            //         config.LoginPath = "/Home/Login";
            //     });

            // services.AddControllersWithViews();

            // [DNN] TempData[] 개체 사용
            services.AddMemoryCache();
            services.AddSession();

            //[MVC] MVC추가 및 JSON랜더링 옵션 지정
            services.AddMvc();
                 
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Home/Error");
            }
            app.UseStaticFiles();

            app.UseRouting();

            app.UseAuthorization();

            //[DNN] TempData 개체 사용
            app.UseSession();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllerRoute(
                    name: "default",
                    pattern: "{controller=Home}/{action=Index}/{id?}");
            });


        }
    }
}
