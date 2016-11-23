using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(CineplexSystem.Startup))]
namespace CineplexSystem
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {

        }
    }
}
