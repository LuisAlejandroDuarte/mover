using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

using System.Reflection;


using Mover.Entities.Interfaces;
using Mover.Entities.Interfaces.Categoria.Get.All;
using Mover.Entities.Interfaces.ConductorAutorizado.Crear;
using Mover.Entities.Interfaces.ConductorAutorizado.Editar;
using Mover.Entities.Interfaces.ConductorAutorizado.Eliminar;
using Mover.Entities.Interfaces.ConductorAutorizado.ListarByUser;
using Mover.Entities.Interfaces.Dispositivos.Crear;
using Mover.Entities.Interfaces.Dispositivos.Get.ByDeviceId;
using Mover.Entities.Interfaces.Dispositivos.Get.ByToken;
using Mover.Entities.Interfaces.Equipo.Crear;
using Mover.Entities.Interfaces.Equipo.Editar;
using Mover.Entities.Interfaces.Equipo.Eliminar;
using Mover.Entities.Interfaces.Equipo.ListarByUser;
using Mover.Entities.Interfaces.Login;
using Mover.Entities.Interfaces.Multimedia.AzureBlob;
using Mover.Entities.Interfaces.Multimedia.Crear;
using Mover.Entities.Interfaces.Multimedia.Eliminar;
using Mover.Entities.Interfaces.Multimedia.Listar;
using Mover.Entities.Interfaces.Oferta.Crear;
using Mover.Entities.Interfaces.Oferta.Editar;
using Mover.Entities.Interfaces.Oferta.Eliminar;
using Mover.Entities.Interfaces.Oferta.ListaByUser;
using Mover.Entities.Interfaces.TipoIdentificacion.Listar;
using Mover.Entities.Interfaces.User.Crear;
using Mover.Entities.Interfaces.User.Get.ById;
using Mover.Entities.Interfaces.Vehiculo.Crear;
using Mover.Entities.Interfaces.Vehiculo.Editar;
using Mover.Entities.Interfaces.Vehiculo.Eliminar;
using Mover.Entities.Interfaces.Vehiculo.ListaByOferta;
using Mover.Repositories.EFCore.AzureBlob;
using Mover.Repositories.EFCore.DataContext;
using Mover.Repositories.EFCore.Repositories;
using Mover.Repositories.EFCore.Repositories.Categoria.Get.All;
using Mover.Repositories.EFCore.Repositories.Conductor.Crear;
using Mover.Repositories.EFCore.Repositories.Conductor.Eliminar;
using Mover.Repositories.EFCore.Repositories.Conductor.ListaByUser;
using Mover.Repositories.EFCore.Repositories.ConductorAutorizado.Editar;
using Mover.Repositories.EFCore.Repositories.Dispositivos.crear;
using Mover.Repositories.EFCore.Repositories.Dispositivos.Get.ByDeviceId;
using Mover.Repositories.EFCore.Repositories.Dispositivos.Get.ByToken;
using Mover.Repositories.EFCore.Repositories.Equipo.Crear;
using Mover.Repositories.EFCore.Repositories.Equipo.Editar;
using Mover.Repositories.EFCore.Repositories.Equipo.Eliminar;
using Mover.Repositories.EFCore.Repositories.Equipo.ListaByUser;
using Mover.Repositories.EFCore.Repositories.Login;
using Mover.Repositories.EFCore.Repositories.MultimediaVehiculo.Crear;
using Mover.Repositories.EFCore.Repositories.MultimediaVehiculo.Eliminar;
using Mover.Repositories.EFCore.Repositories.MultimediaVehiculo.Listar;
using Mover.Repositories.EFCore.Repositories.Oferta.Crear;
using Mover.Repositories.EFCore.Repositories.Oferta.Editar;
using Mover.Repositories.EFCore.Repositories.Oferta.Eliminar;
using Mover.Repositories.EFCore.Repositories.Oferta.ListaByUser;
using Mover.Repositories.EFCore.Repositories.TipoIdentificacion.Listar;
using Mover.Repositories.EFCore.Repositories.User.Crear;
using Mover.Repositories.EFCore.Repositories.User.Get.ById;
using Mover.Repositories.EFCore.Repositories.Vehiculo.Crear;
using Mover.Repositories.EFCore.Repositories.Vehiculo.Editar;
using Mover.Repositories.EFCore.Repositories.Vehiculo.Eliminar;
using Mover.Repositories.EFCore.Repositories.Vehiculo.ListByOferta;
using Mover.Entities.Interfaces.Clase.Get.ByIdCategoria;
using Mover.Repositories.EFCore.Repositories.Clase.Get.ByIdCategoria;
using Mover.Entities.Interfaces.Ubicacion.Crear;
using Mover.Repositories.EFCore.Repositories.Ubicacion.Crear;
using Mover.Entities.Interfaces.Ubicacion.Editar;
using Mover.Repositories.EFCore.Repositories.Ubicacion.Editar;
using Mover.Entities.Interfaces.Carroceria.Get.ByIdClase;
using Mover.Repositories.EFCore.Repositories.Carroceria.Get.ByIdClase;
using Mover.Entities.Interfaces.Marca.Get.ByIdClase;
using Mover.Repositories.EFCore.Repositories.Marca.Get.ByIdClase;
using Mover.Entities.Interfaces.Referencia.Get.ByIdMarca;
using Mover.Repositories.EFCore.Repositories.Referencia.Get.ByIdMarca;
using Mover.Entities.Interfaces.Modelo.Gett.All;
using Mover.Repositories.EFCore.Modelos.Get.All;
using Mover.Entities.Interfaces.CondicionVehiculo;
using Mover.Entities.Interfaces.EstadoVehiculo;
using Mover.Repositories.EFCore.CondicionesVehiculo;
using Mover.Repositories.EFCore.EstadosVehiculo;

namespace Mover.Repositories.EFCore
{
    public static class DependencyContainer
    {
        public static IServiceCollection AddRepositories(this IServiceCollection services, IConfiguration configuration)
        {
            services.AddDbContext<MoverContext>(options =>
                options.UseSqlServer(configuration.GetConnectionString("ConectionString")));            
            services.AddScoped<ILoginRepository, LoginRepository>();


            //User
            services.AddScoped<ICreearUserRepository, CrearUserRepository>();
            services.AddScoped<IGetUserByIdRepository, GetUserByIdRespository>();

            //Categoria 
            services.AddScoped<IGetAllCategoriaRepository, GetAllCategoriaRepository>();

            //Clase
            services.AddScoped<IGetClaseByIdCategoriaRepository, GetClaseByIdCategoriaRepository>();

            //Carroceria
            services.AddScoped<IGetCarroceriaByIdClaseRepository, GetCarroceriaByIdClaseRepository>();


            //Marca
            services.AddScoped<IGetMarcaByIdClaseRepository, GetMarcaByIdClaseRepository>();


            //CondicionVehiculo
            services.AddScoped<IGetAllCondicionVehiculoRepository, GetAllCondicionVehiculoRepository>();

            //EstadoVehiculo
            services.AddScoped<IGetAllEstadoVehiculoRepository, GetAllEstadoVehiculoRepository>();

            //Referencia
            services.AddScoped<IGetReferenciaByIdMarcaRepository, GetReferenciaByIdMarcaRepository>();

            //TIPO_IDENTIFIFACION
            services.AddScoped<IListarTipoIdentificacionRepository, ListarTipoIdentificacionRepository>();

            //TIPO_IDENTIFIFACION
            services.AddScoped<IGetAllModeloRepository, GetAllModeloRepository>();

            //Ubicacion
            services.AddScoped<ICrearUbicacionRepository, CrearUbicacionRepository>();
            services.AddScoped<IEditarUbicacionRepository, EditarUbicacionRepository>();

            //Dispositivos
            services.AddScoped<ICrearDispositivoRepository, CrearDispositivoRepository>();
            services.AddScoped<IGetByTokenDispositivoRepository, GetDispositivoBytokenRepository>();
            services.AddScoped<IGetByDeviceIdDispositivoRepository, GetDispositivoByDeviceIdRepository>();

            //OFERTA
            services.AddScoped<ICrearOfertaRepository, CrearOfertaRepository>();
            services.AddScoped<IEditarOfertaRepository, EditarOfertaRepository>();
            services.AddScoped<IEliminarOfertaRepository, EliminarOfertaRepository>();
            services.AddScoped<IListaOfertaByUserRepository, ListaOfertaByUserRepository>();

            services.AddSingleton<AzureBlobStorage>();
            services.AddScoped<IAzureBlobStorageUpLoadRepository, AzureBlobStorage>();

            services.AddScoped<ICrearMultimediaVehiculoRepository, CrearMultimediaVehiculoRepository>();
            services.AddScoped<IEliminarMultimediaVehiculoRepository, EliminarMultimediaVehiculoRepository>();
            services.AddScoped<IListarMultimediaVehiculoRepository, ListarMultimediaVehiculoRepository>();

       
            //VEHICULO
            services.AddScoped<ICrearVehiculoRepository, CrearVehiculoRepository>();
            services.AddScoped<IEditarVehiculoRepository, EditarVehiculoRepository>();
            services.AddScoped<IEliminarVehiculoRepository, EliminarVehiculoRepository>();
            services.AddScoped<IListaVehiculoByOfertaRepository, ListaVehiculoByOfertaRepository>();

            //EQUIPO
            services.AddScoped<ICrearEquipoRepository, CrearEquipoRepository>();
            services.AddScoped<IEditarEquipoRepository, EditarEquipoRepository>();
            services.AddScoped<IEliminarEquipoRepository, EliminarEquipoRepository>();
            services.AddScoped<IListarEquipoByUserRepository, ListaEquipoByUserRepository>();

            //CONDUCTOR
            services.AddScoped<ICrearConductorRepository, CrearConductorRepository>();
            services.AddScoped<IEditarConductorRepository, EditarConductorRepository>();
            services.AddScoped<IEliminarConductorRepository, EliminarConductorRepository>();
            services.AddScoped<IListarConductorByUserRepository, ListaConductorByUserRepository>();



            services.AddAutoMapper(Assembly.GetExecutingAssembly());
            services.AddScoped<IUnitOfWork, UnitOfWork>();
            return services;
        }
    }
}
