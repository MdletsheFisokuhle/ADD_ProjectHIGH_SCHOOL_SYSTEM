using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(HIGH_SCHOOL_SYSTEM.Startup))]
namespace HIGH_SCHOOL_SYSTEM
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
