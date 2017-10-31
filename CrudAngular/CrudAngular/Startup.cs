using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(CrudAngular.Startup))]
namespace CrudAngular
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
