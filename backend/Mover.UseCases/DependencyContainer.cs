
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.IdentityModel.Tokens;
using System.Text;

using Mover.UseCases.Categoria.Get.All;
using Mover.UseCases.ConductorAutorizado.Crear;
using Mover.UseCases.ConductorAutorizado.Editar;
using Mover.UseCases.ConductorAutorizado.Eliminar;
using Mover.UseCases.ConductorAutorizado.ListByUser;
using Mover.UseCases.Equipo.Crear;
using Mover.UseCases.Equipo.Editar;
using Mover.UseCases.Equipo.Eliminar;
using Mover.UseCases.Equipo.ListaByUser;
using Mover.UseCases.Login;
using Mover.UseCases.Login.Settings;
using Mover.UseCases.MultimediaVehiculo.Crear;
using Mover.UseCases.MultimediaVehiculo.Eliminar;
using Mover.UseCases.MultimediaVehiculo.Listar;
using Mover.UseCases.Oferta.Crear;
using Mover.UseCases.Oferta.Editar;
using Mover.UseCases.Oferta.Eliminar;
using Mover.UseCases.Oferta.ListaByUser;
using Mover.UseCases.User.Crear;
using Mover.UseCases.Vehiculo.Crear;
using Mover.UseCases.Vehiculo.Editar;
using Mover.UseCases.Vehiculo.Eliminar;
using Mover.UseCases.Vehiculo.ListByOferta;
using Mover.UseCases.TipoIdentificacion.Listar;
using Mover.UseCases.Dispositivos.crear;
using Mover.UseCases.Dispositivos.Get.ByToken;
using Mover.UseCases.User.Get.ById;
using Mover.UseCases.Dispositivos.Get.ByDeviceId;

using Mover.UseCasesPorts.ConductorAutorizado.Crear;
using Mover.UseCasesPorts.ConductorAutorizado.Editar;
using Mover.UseCasesPorts.ConductorAutorizado.Eliminar;
using Mover.UseCasesPorts.ConductorAutorizado.ListaByUser;
using Mover.UseCasesPorts.Equipo.Crear;
using Mover.UseCasesPorts.Equipo.Editar;
using Mover.UseCasesPorts.Equipo.Eliminar;
using Mover.UseCasesPorts.Equipo.ListaByUser;
using Mover.UseCasesPorts.Login;
using Mover.UseCasesPorts.Multimedia.Crear;
using Mover.UseCasesPorts.Multimedia.Eliminar;
using Mover.UseCasesPorts.Multimedia.Lista;
using Mover.UseCasesPorts.Oferta.Crear;
using Mover.UseCasesPorts.Oferta.Editar;
using Mover.UseCasesPorts.Oferta.Eliminar;
using Mover.UseCasesPorts.Oferta.ListaByUser;
using Mover.UseCasesPorts.User.Crear;
using Mover.UseCasesPorts.Vehiculo.Crear;
using Mover.UseCasesPorts.Vehiculo.Editar;
using Mover.UseCasesPorts.Vehiculo.Eliminar;
using Mover.UseCasesPorts.Vehiculo.ListByOferta;
using Mover.UseCasesPorts.TipoIdentificacion.Listar;
using Mover.UseCasesPorts.Dispositivos.Crear;
using Mover.UseCasesPorts.Dispositivos.Get.ByToken;
using Mover.UseCasesPorts.User.Get.ById;
using Mover.UseCasesPorts.Dispositivos.Get.ByDeviceId;
using Mover.UseCasesPorts.Categoria.Get.All;
using Mover.UseCasesPorts.Clase.Get.ByIdCategoria;
using Mover.UseCases.Clase.Get.ByIdCategoria;
using Mover.UseCases.Ubicacion.Crear;
using Mover.UseCasesPorts.Ubicacion.Crear;
using Mover.UseCasesPorts.Ubicacion.Editar;
using Mover.UseCases.Ubicacion.Editar;
using Mover.UseCasesPorts.Carroceria.Get.ByIdClase;
using Mover.UseCases.Carroceria.ByIdClase;
using Mover.UseCasesPorts.Marca.Get.ByIdClase;
using Mover.UseCases.Marca.ByIdClase;
using Mover.UseCasesPorts.Referencia.Get.ByIdMarca;
using Mover.UseCases.Referencia.Get.ByIdMarca;
using Mover.UseCasesPorts.Modelo.Get.All;
using Mover.UseCases.Modelo.Get.All;
using Mover.UseCasesPorts.CondicionVehiculo;
using Mover.UseCases.CondicionVehiculo;
using Mover.UseCasesPorts.EstadoVehiculo;
using Mover.UseCases.EstadoVehiculo;
using Mover.UseCasesPorts.EstadoOferta;
using Mover.UseCases.EstadoOferta;
using Mover.UseCases.ParametrosVehiculo;
using Mover.UseCases.ZonaTransporter;
using Mover.UseCasesPorts.ZonaTransporter;
using Mover.UseCasesPorts.ParametrosVehiculo;
using Mover.UseCasesPorts.Georeferencia.Pais.Get.ByCodigo;
using Mover.UseCases.Georeferencia.Pais.Get.ByCodigo;
using Mover.UseCasesPorts.Georeferencia.Departamento.Get.ByIdPais;
using Mover.UseCases.Georeferencia.Departamento.Get.ByIdPais;
using Mover.UseCasesPorts.Georeferencia.Ciudad.Get.ByIdDepartamento;
using Mover.UseCases.Georeferencia.Ciudad.Get.ByIdDepartamento;


namespace Mover.UseCases
{
    public static class DependencyContainer
    {
        public static IServiceCollection AddUseCasesServices(this IServiceCollection services, IConfiguration configuration)
        {
            services.Configure<JwtSettings>(configuration.GetSection("JwtSettings"));
            services.AddTransient<ILoginInPutPort, LoginInteractor>();

            #region Georeferencia

            #region Pais
                services.AddTransient<IGetPaisByCodigoInPutPort, GetPaisByCodigoInteractor>();
            #endregion
            #region Departamento
                services.AddTransient<IGetDepartamentoByIdPaisInPutPort, GetDepartamentoByIdPaisInteractor>();
            #endregion
            #region Ciudad
                services.AddTransient<IGetCiudadByIdDepartamentoInPutPort, GetCiudadByIdDepartamentoInteractor>();
            #endregion

            #endregion


            //USer
            services.AddTransient<IGetUserByIdInPutPort, GetUserByIdInteractor>();
            services.AddTransient<IUserCrearInPutPort, CrearUserInteractor>();                             
 
            //TIPO_IDENTIFIFACION
            services.AddTransient<ITipoIdentificaionInPutPort, ListarTipoIdentificacionInteractor>();

            //Modelo

            services.AddTransient<IGetAllModeloInPutPort, GetAllModeloInteractor>();

            //Ubicacion
            services.AddTransient<ICrearUbicacionInPutPort, CrearUbicacionInteractor>();
            services.AddTransient<IEditarUbicacionInPutPort, EditarUbicacionInteractor>();

            //Dispositivos
            services.AddTransient<ICrearDispositivoInPutPort, CrearDispositivoInteractor>();
            services.AddTransient<IDispositivoGetByTokenInPutPort, GetDispositivoByTokenInteractor>();
            services.AddTransient<IDispositivoGetByDeviceIdInPutPort, GetDispositivoByDeviceIdInteractor>();

            //Categoria
            services.AddTransient<IGetAllCategoriaInPutPort, GetAllCategoriaInteractor>();

            //Carroceria
            services.AddTransient<IGetCarroceriaByIdClaseInPutPort, GetCarroceriaByIdClaseInteractor>();

            //Marca
            services.AddTransient<IGetMarcaByIdClaseInPutPort, GetMarcaByIdClaseInteractor>();

            //CondicionVehiculo
            services.AddTransient <IGetAllCondicionVehiculoInPutPort, GetAllCondicionVehiculoInteractor>();

            //EstadoVehiculo
            services.AddTransient<IGetAllEstadoVehiculoInPutPort, GetAllEstadoVehiculoInteractor>();

            //Referencia
            services.AddTransient<IGetReferenciaByIdMarcaInPutPort, GetReferenciaByIdMarcaInteractor>();



            //EstadoOferta
            services.AddScoped<IGetAllEstadoOfertaInPutPort, GetAllEstadoOfertaInteractor>();

            //ZonaTransporter
            services.AddScoped<IGetAllZonaTransporterInPutPort, GetAllZonaTransporterInteractor>();

            //ParametrosVehiculo
            services.AddScoped<IGetAllParametrosVehiculoInPutPort, GetAllParametrosVehiculoInteractor>();

            //Clase
            services.AddTransient<IGetClaseByIdCategoriaInPutPort, GetClaseByIdCategoriaInteractor>();

            //OFERTA
            services.AddTransient<ICrearOfertaInPutPort, CrearOfertaInteractor>();
            services.AddTransient<IEditarOfertaInPutPort, EditarOfertaInteractor>();
            services.AddTransient<IEliminarOfertaInPutPort, EliminarOfertaInteractor>();
            services.AddTransient<IListaOfertaByUserInPutPort, ListaOfertaByUserInteractor>();

            //EQUIPO
            services.AddTransient<ICrearEquipoInPutPort, CrearEquipoInteractor>();
            services.AddTransient<IEditarEquipoInPutPort, EditarEquipoInteractor>();
            services.AddTransient<IEliminarEquipoInPutPort, EliminarEquipoInteractor>();
            services.AddTransient<IListaEquipoByUserInPutPort, ListaEquipoByUserInteractor>();

            //CONDUCTOR
            services.AddTransient<ICrearConductorInPutPort, CrearConductorInteractor>();
            services.AddTransient<IEditarConductorInPutPort, EditarConductorInteractor>();
            services.AddTransient<IEliminarConductorInPutPort, EliminarConductorInteractor>();
            services.AddTransient<IListaConductorByUserInPutPort, ListConductorByUserInteractor>();


            //VEHICULO
            services.AddTransient<ICrearVehiculoInPutPort, CrearVehiculoInteractor>();
            services.AddTransient<IEditarVehiculoInPutPort, EditarVehiculoInteractor>();
            services.AddTransient<IEliminarVehiculoInPutPort, EliminarVehiculoInteractor>();
            services.AddTransient<IListaVehiculoByOfertaInPutPort, ListaVehiculoByOfertaInteractor>();

            //MULTIMEDIA
            services.AddTransient<IMultimediaVehiculoInPutPort, CrearMultimediaVehiculoInteractor>();
            services.AddTransient<IEliminarMultiemdiaVehiculoInPutPort, EliminarMultimediaVehiculoInteractor>();
            services.AddTransient<IListaMultimediaVehiculoInPutPort, ListarMultimediaVehiculoInteractor>();


            

            services.AddAuthentication(options =>
            {
                options.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;

            }).AddJwtBearer(options =>
            {
                options.TokenValidationParameters = new TokenValidationParameters
                {
                    ValidateIssuerSigningKey = true,
                    ValidateIssuer = true,
                    ValidateAudience = true,
                    ValidateLifetime = true,
                    ClockSkew = TimeSpan.Zero,
                    ValidIssuer = configuration["JwtSettings:Issuer"],
                    ValidAudience = configuration["JwtSettings:Audience"],
                    IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(configuration["JwtSettings:Key"]!))
                };
            });

            return services;
        }
    }
}
