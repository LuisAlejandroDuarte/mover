﻿
using Microsoft.Extensions.DependencyInjection;
using Mover.Presenter.Carroceria.Get.ByIdClase;
using Mover.Presenter.Categoria.Get.All;
using Mover.Presenter.Clase.Get.ByIdCategoria;
using Mover.Presenter.CondicionVehiculo;
using Mover.Presenter.ConductorAutorizado.Crear;
using Mover.Presenter.ConductorAutorizado.Editar;
using Mover.Presenter.ConductorAutorizado.Eliminar;
using Mover.Presenter.ConductorAutorizado.ListByUser;
using Mover.Presenter.Dispositivo.Crear;
using Mover.Presenter.Dispositivo.Get.ByDeviceId;
using Mover.Presenter.Dispositivo.Get.ByToken;
using Mover.Presenter.Equipo.Crear;
using Mover.Presenter.Equipo.Editar;
using Mover.Presenter.Equipo.Eliminar;
using Mover.Presenter.Equipo.ListByUser;
using Mover.Presenter.EstadoOferta;
using Mover.Presenter.EstadoVehiculo;
using Mover.Presenter.Georeferencia.Ciudad.Get.ByIDepartamento;
using Mover.Presenter.Georeferencia.Departamento.Get.ByIdPais;
using Mover.Presenter.Georeferencia.Pais.Get.ByCoidgo;
using Mover.Presenter.Login;
using Mover.Presenter.Marca.Get.ByIdClase;
using Mover.Presenter.Modelo.Get.All;
using Mover.Presenter.MultimediaVehiculo.Crear;
using Mover.Presenter.MultimediaVehiculo.Eliminar;
using Mover.Presenter.MultimediaVehiculo.Listar;
using Mover.Presenter.Oferta.Crear;
using Mover.Presenter.Oferta.Editar;
using Mover.Presenter.Oferta.Eliminar;
using Mover.Presenter.Oferta.ListaByUser;
using Mover.Presenter.ParametrosVehiculo;
using Mover.Presenter.Referencia.Get.ByIdMarca;
using Mover.Presenter.TipoIdentificacion.Listar;
using Mover.Presenter.Ubicacion.Crear;
using Mover.Presenter.Ubicacion.Editar;
using Mover.Presenter.User.Crear;
using Mover.Presenter.User.Get.ById;
using Mover.Presenter.Vehiculo.Crear;
using Mover.Presenter.Vehiculo.Editar;
using Mover.Presenter.Vehiculo.Eliminar;
using Mover.Presenter.Vehiculo.ListByOferta;
using Mover.Presenter.ZonaTransporter;
using Mover.UseCasesPorts.Carroceria.Get.ByIdClase;
using Mover.UseCasesPorts.Categoria.Get.All;
using Mover.UseCasesPorts.Clase.Get.ByIdCategoria;
using Mover.UseCasesPorts.CondicionVehiculo;
using Mover.UseCasesPorts.ConductorAutorizado.Crear;
using Mover.UseCasesPorts.ConductorAutorizado.Editar;
using Mover.UseCasesPorts.ConductorAutorizado.Eliminar;
using Mover.UseCasesPorts.ConductorAutorizado.ListaByUser;
using Mover.UseCasesPorts.Dispositivos.Crear;
using Mover.UseCasesPorts.Dispositivos.Get.ByDeviceId;
using Mover.UseCasesPorts.Dispositivos.Get.ByToken;
using Mover.UseCasesPorts.Equipo.Crear;
using Mover.UseCasesPorts.Equipo.Editar;
using Mover.UseCasesPorts.Equipo.Eliminar;
using Mover.UseCasesPorts.Equipo.ListaByUser;
using Mover.UseCasesPorts.EstadoOferta;
using Mover.UseCasesPorts.EstadoVehiculo;
using Mover.UseCasesPorts.Georeferencia.Ciudad.Get.ByIdDepartamento;
using Mover.UseCasesPorts.Georeferencia.Departamento.Get.ByIdPais;
using Mover.UseCasesPorts.Georeferencia.Pais.Get.ByCodigo;
using Mover.UseCasesPorts.Login;
using Mover.UseCasesPorts.Marca.Get.ByIdClase;
using Mover.UseCasesPorts.Modelo.Get.All;
using Mover.UseCasesPorts.Multimedia.Crear;
using Mover.UseCasesPorts.Multimedia.Eliminar;
using Mover.UseCasesPorts.Multimedia.Lista;
using Mover.UseCasesPorts.Oferta.Crear;
using Mover.UseCasesPorts.Oferta.Editar;
using Mover.UseCasesPorts.Oferta.Eliminar;
using Mover.UseCasesPorts.Oferta.ListaByUser;
using Mover.UseCasesPorts.ParametrosVehiculo;
using Mover.UseCasesPorts.Referencia.Get.ByIdMarca;
using Mover.UseCasesPorts.TipoIdentificacion.Listar;
using Mover.UseCasesPorts.Ubicacion.Crear;
using Mover.UseCasesPorts.Ubicacion.Editar;
using Mover.UseCasesPorts.User.Crear;
using Mover.UseCasesPorts.User.Get.ById;
using Mover.UseCasesPorts.Vehiculo.Crear;
using Mover.UseCasesPorts.Vehiculo.Editar;
using Mover.UseCasesPorts.Vehiculo.Eliminar;
using Mover.UseCasesPorts.Vehiculo.ListByOferta;
using Mover.UseCasesPorts.ZonaTransporter;



namespace Mover.Presenter
{
    public static class DependecyContainer
    {
        public static IServiceCollection AddPresenters(this IServiceCollection services)
        {
            services.AddScoped<ILoginOutPutPort, LoginPresenter>();

            #region Georeferencia
            #region Pais
                services.AddScoped<IGetPaisByCodigoOutPutPort, GetPaisByCodigoPresenter>();
            #endregion

            #region Departamento
                services.AddScoped<IGetDepartamentoByIdPaisOutPutPort, GetDepartamentoByIdPaisPresenter>();
            #endregion

            #region Ciudad
                services.AddScoped<IGetCiudadByIdDepartamentoOutPutPort, GetCiudadByIdDepartamentoPresenter>();
            #endregion

            #endregion


            //User
            services.AddScoped<IUserCrearOutPutPort, UserCrearPresenter>();
            services.AddScoped<IGetUserByIdOutPutPort, GetUserByIdPresenter>();


            //TIPO_IDENTIFIFACION            
            services.AddScoped<ITipoIdentificaionOutPutPort, ListarTipoIdentificacionPresenter>();

            //Modelo
            services.AddScoped<IGetAllModeloOutPutPort, GetAllModeloPresenter>();

            //Ubicacion

            services.AddScoped<ICrearUbicacionOutPutPort, CrearUbicacionPresenter>();
            services.AddScoped<IEditarUbicacionOutPutPort, EditarUbicacionPresenter>();
            //Categoria
            services.AddScoped<IGetAllCategoriaOutPutPort, GetAllCategoriaPresenter>();

            //Clase
            services.AddScoped<IGetClaseByIdCategoriaOutPutPort, GetClaseByIdCategoriaPresenter>();

            //Carroceria
            services.AddScoped<IGetCarroceriaByIdClaseOutPutPort, GetCarroceriaByIdClasePresenter>();

            //Marca
            services.AddScoped<IGetMarcaByIdClaseOutPutPort, GetMarcaByIdClasePresenter>();

            //CondicionVehiculo
            services.AddScoped<IGetAllCondicionVehiculoOutPutPort, GetAllCondicionVehiculoPresenter>();

            //EstadoVehiculo
            services.AddScoped<IGetAllEstadoVehiculoOutPutPort, GetAllEstadoVehiculoPresenter>();

            //EstadiOferta
            services.AddScoped<IGetAllEstadoOfertaOutPutPort, GetAllEstadoOfertaPresenter>();

            //ZonaTransporter
            services.AddScoped<IGetAllZonaTransporterOutPutPort, GetAllZonaTransporterPresenter>();

            //ParametrosVehiculo
            services.AddScoped<IGetAllParametrosVehiculoOutPutPort, GetAllParametrosVehiculoPresenter>();

            //Referencia
            services.AddScoped<IGetReferenciaByIdMarcaOutPutPort, GetReferenciaByIdMarcaPresenter>();

            //Dispositivos
            services.AddScoped<ICrearDispositivoOutPutPort, CrearDispositivoPresenter>();
            services.AddScoped<IDispositivoGetByTokenOutPutPort, GetByTokenDispositivoPresenter>();
            services.AddScoped<IDispositivoGetByDeviceIdOutPutPort, GetByDeviceIdDispositivoPresenter>();

            //OFERTA
            services.AddScoped<ICrearOfertaOutPutPort, CrearOfertaPresenter>();
            services.AddScoped<IEditarOfertaOutPutPort, EditarOfertaPresenter>();
            services.AddScoped<IEliminarOfertaOutPutPort, EliminarOfertaPresenter>();
            services.AddScoped<IListaOfertaByUserOutPutPort, ListaOfertaByUserPresenter>();

            //EQUIPO
            services.AddScoped<ICrearEquipoOutPutPort, CrearEquipoPresenter>();
            services.AddScoped<IEditarEquipoOutPutPort, EditarEquipoPresenter>();
            services.AddScoped<IEliminarEquipoOutPutPort, EliminarEquipoPresenter>();
            services.AddScoped<IListaEquipoByUserOutPutPort, ListEquipoByUserPresenter>();

            //CONDUCTOR
            services.AddScoped<ICrearConductorOutPutPort, CrearConductorPresenter>();
            services.AddScoped<IEditarConductorOutPutPort, EditarConductorPresenter>();
            services.AddScoped<IEliminarConductorOutPutPort, EliminarConductorPresenter>();
            services.AddScoped<IListaConductorByUserOutPutPort, ListConductorByUserPresenter>();

            services.AddScoped<IMultimediaVehiculoOutPutPort, CrearMultimediaVehiculoPresenter>();
            services.AddScoped<IEliminarMultimediaVehiculoOutPutPort, EliminarMultimediaVehiculoPresenter>();
            services.AddScoped<IListaMultimediaVehiculoOutPutPort, LisatrMultimediaVehiculoPresenter>();

            services.AddScoped<ICrearVehiculoOutPutPort, CrearVehiculoPresenter>();
            services.AddScoped<IEditarVehiculoOutPutPort, EditarVehiculoPresenter>();
            services.AddScoped<IEliminarVehiculoOutPutPort, EliminarVehiculoPresenter>();
            services.AddScoped<IListaVehiculoByOfertaOutPutPort, ListaVehiculoByOfertaPresenter>();

            return services;
        }
    }
}
