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

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllerRoute(
                    name: "default",
                    pattern: "{controller=Home}/{action=Index}/{id?}");
            });
        }
    }
}
