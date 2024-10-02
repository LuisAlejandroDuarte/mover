using Microsoft.Extensions.DependencyInjection;


namespace Mover.Controllers
{
    public static class DependencyContainer
    {
        public static IServiceCollection AddHttpContext(this IServiceCollection services)
        {

            services.AddHttpContextAccessor();
          

            return services;

        }
    }
}
