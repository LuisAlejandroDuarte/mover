using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Mover.Controllers;
using Mover.Presenter;
using Mover.Repositories.EFCore;
using Mover.UseCases;

namespace Mover.IoC
{
    public static class DependecyContainer
    {
        public static IServiceCollection AddMoverDependencies(this IServiceCollection services, IConfiguration configuration)
        {
            services.AddRepositories(configuration);
            services.AddUseCasesServices(configuration);
            services.AddPresenters();
            services.AddHttpContext();

            return services;
        }
    }
}
