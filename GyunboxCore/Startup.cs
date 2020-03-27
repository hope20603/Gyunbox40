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

            //[DI(Dependency Injection)] ���� ���
            services.AddSingleton<CopyrightService>();

            //[DI(Dependency Injection)] ���� ���
            //services.AddTransient<ICopyrightService, CopyrightService>();
            services.AddSingleton<ICopyrightService, CopyrightService>();
            services.AddSingleton<IInfoService, InfoService>();

            //[DNN][!] Configuration ��ü����:
            // IConfiguratino �Ǵ� IConfigurationRoot�� Configuration ��ü ����
            // appsettings.json ������ �����ͺ��̽� ���� ���ڿ��� �������͸� Ŭ�������� ����� �� �ֵ��� ����
            services.AddSingleton<IConfiguration>(Configuration);

            //[Tech] ������
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
