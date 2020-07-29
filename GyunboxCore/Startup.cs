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
        public Startup(IConfiguration configuration, Microsoft.AspNetCore.Hosting.IHostingEnvironment env)
        {
            Configuration = configuration;
            var builder = new ConfigurationBuilder()
                .SetBasePath(env.ContentRootPath)
                .AddJsonFile("appsettings.json", optional: true, reloadOnChange: true)
                .AddJsonFile($"appsettings.{env.EnvironmentName}.json", optional: true)
                .AddJsonFile(
                    $"Settings\\DotNetNoteSettings.json", optional: true)
                .AddEnvironmentVariables();
            Configuration = builder.Build();
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

            //[CommunityCamp] ��� ���� ���
            services.AddTransient<ICommunityCampJoinMemberRepository, CommunityCampJoinMemberRepository>();

            //��Ʈ�ѷ� ����� �ڵ����� NoteRepositoryŬ������ �ν��Ͻ��� �������ִ� ������ �Ѵ�.
            services.AddTransient<INoteRepository, NoteRepository>();

            //��Ʈ�ѷ� ����� �ڵ����� NoteRepositoryŬ������ �ν��Ͻ��� �������ִ� ������ �Ѵ�.
            services.AddTransient<INoteRepository, NoteRepository>();

            //NoteCommentRepository Ŭ���� �����ڿ� �����ͺ��̽� ���� ���ڿ��� �����ϴ� ����� ���
            services.AddSingleton<INoteCommentRepository>(new NoteCommentRepository(Configuration["ConnectionStrings:DefaultConnection"]));
            //NoteCommentRepository: INoteCommentRepository

            //services.AddAuthentication("CookieAuthentication")
            //     .AddCookie("CookieAuthentication", config =>
            //     {
            //         config.Cookie.Name = "UserLoginCookie";
            //         config.LoginPath = "/Home/Login";
            //     });

            // services.AddControllersWithViews();

            // [DNN] TempData[] ��ü ���
            services.AddMemoryCache();
            services.AddSession();


            //[User][9] Policy ����
            services.AddAuthorization(options =>
            {
                // Users Role�� ������, Users Policy �ο�
                options.AddPolicy(
                    "Users", policy => policy.RequireRole("Users"));
                // Users Role�� �ְ� UserId�� "Admin"�̸� "Administrators" �ο�
                options.AddPolicy(
                    "Administrators",
                        policy => policy
                            .RequireRole("Users")
                            .RequireClaim("UserId", // ��ҹ��� ����
                                Configuration
                                    .GetSection("DotNetNoteSettings")
                                    .GetSection("SiteAdmin").Value)
                            );
            });

            //[MVC] MVC�߰� �� JSON������ �ɼ� ����
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

            //[DNN] TempData ��ü ���
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