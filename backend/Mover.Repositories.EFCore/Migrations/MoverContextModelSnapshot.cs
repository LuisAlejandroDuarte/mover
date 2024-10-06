﻿// <auto-generated />
using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using Mover.Repositories.EFCore.DataContext;

#nullable disable

namespace Mover.Repositories.EFCore.Migrations
{
    [DbContext(typeof(MoverContext))]
    partial class MoverContextModelSnapshot : ModelSnapshot
    {
        protected override void BuildModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "7.0.9")
                .HasAnnotation("Relational:MaxIdentifierLength", 128);

            SqlServerModelBuilderExtensions.UseIdentityColumns(modelBuilder);

            modelBuilder.Entity("Mover.Entities.POCOEntities.ConductorAutorizado", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<string>("Apellido")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Correo")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Direccion")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<int>("Estado")
                        .HasColumnType("int");

                    b.Property<string>("Identificacion")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Nombre")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<int>("UserId")
                        .HasColumnType("int");

                    b.HasKey("Id");

                    b.HasIndex("UserId");

                    b.ToTable("ConductorAutorizado");
                });

            modelBuilder.Entity("Mover.Entities.POCOEntities.Dispositivos", b =>
                {
                    b.Property<int?>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int?>("Id"));

                    b.Property<bool?>("Activo")
                        .HasColumnType("bit");

                    b.Property<DateTime?>("FechaRegistro")
                        .HasColumnType("datetime2");

                    b.Property<string>("Modelo")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("TokenNotificacion")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<DateTime?>("UltimaConexion")
                        .HasColumnType("datetime2");

                    b.Property<string>("UniqueDeviceId")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<int>("UserId")
                        .HasColumnType("int");

                    b.HasKey("Id");

                    b.HasIndex("UserId");

                    b.ToTable("Dispositivos");
                });

            modelBuilder.Entity("Mover.Entities.POCOEntities.Equipo", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<int>("Estado")
                        .HasColumnType("int");

                    b.Property<int>("IdColor")
                        .HasColumnType("int");

                    b.Property<int>("IdLinea")
                        .HasColumnType("int");

                    b.Property<int>("IdMarca")
                        .HasColumnType("int");

                    b.Property<int>("IdModelo")
                        .HasColumnType("int");

                    b.Property<int>("IdTipoCarroceria")
                        .HasColumnType("int");

                    b.Property<string>("LinkLicenciaConduccion")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("LinkSoat")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("LinkTecnomecanica")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("PlacasSemirremolque")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("PlacasVehiculo")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<int>("UserId")
                        .HasColumnType("int");

                    b.HasKey("Id");

                    b.HasIndex("UserId");

                    b.ToTable("Equipo");
                });

            modelBuilder.Entity("Mover.Entities.POCOEntities.EstadoOferta", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<string>("Nombre")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.ToTable("EstadoOferta");
                });

            modelBuilder.Entity("Mover.Entities.POCOEntities.EstadoUsuario", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<string>("Nombre")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.ToTable("EstadoUsuario");
                });

            modelBuilder.Entity("Mover.Entities.POCOEntities.Georeferencia.Ciudad", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<string>("Codigo")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<int>("DepartamentoId")
                        .HasColumnType("int");

                    b.Property<string>("Nombre")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.HasIndex("DepartamentoId");

                    b.ToTable("Ciudad");
                });

            modelBuilder.Entity("Mover.Entities.POCOEntities.Georeferencia.Departamento", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<string>("Codigo")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Nombre")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<int>("PaisId")
                        .HasColumnType("int");

                    b.HasKey("Id");

                    b.HasIndex("PaisId");

                    b.ToTable("Departamento");
                });

            modelBuilder.Entity("Mover.Entities.POCOEntities.Georeferencia.Pais", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<string>("Codigo")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Nombre")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.ToTable("Pais");
                });

            modelBuilder.Entity("Mover.Entities.POCOEntities.MultimediaVehiculo", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<string>("Link")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<int>("Multimedia")
                        .HasColumnType("int");

                    b.Property<int>("VehiculoId")
                        .HasColumnType("int");

                    b.HasKey("Id");

                    b.HasIndex("VehiculoId");

                    b.ToTable("MultimediaVehiculo");
                });

            modelBuilder.Entity("Mover.Entities.POCOEntities.Oferta", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<int>("EstadoOfertaId")
                        .HasColumnType("int");

                    b.Property<string>("NombreEntrega")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("NombreRecibe")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Observaciones")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<decimal?>("Precio")
                        .HasColumnType("decimal(18,2)");

                    b.Property<int>("UbicacionDestinoId")
                        .HasColumnType("int");

                    b.Property<int>("UbicacionOrigenId")
                        .HasColumnType("int");

                    b.Property<int>("UserId")
                        .HasColumnType("int");

                    b.Property<int>("ZonaTransporterId")
                        .HasColumnType("int");

                    b.HasKey("Id");

                    b.HasIndex("EstadoOfertaId");

                    b.HasIndex("UbicacionDestinoId");

                    b.HasIndex("UbicacionOrigenId");

                    b.HasIndex("UserId");

                    b.HasIndex("ZonaTransporterId");

                    b.ToTable("Oferta");
                });

            modelBuilder.Entity("Mover.Entities.POCOEntities.TipoIdentificacion", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<string>("Nombre")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Sigla")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.ToTable("TipoIdentificacion");
                });

            modelBuilder.Entity("Mover.Entities.POCOEntities.TipoUser", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<string>("Nombre")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.ToTable("TipoUser");
                });

            modelBuilder.Entity("Mover.Entities.POCOEntities.Titulos", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<string>("Nombre")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Relacion")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Tabla")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.ToTable("Titulos");
                });

            modelBuilder.Entity("Mover.Entities.POCOEntities.Ubicacion", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<int>("CiudadId")
                        .HasColumnType("int");

                    b.Property<string>("Direccion")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("DispositivoId")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<int?>("DispositivosId")
                        .HasColumnType("int");

                    b.Property<DateTime?>("FechaHora")
                        .HasColumnType("datetime2");

                    b.Property<string>("Latitud")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Longitud")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<int?>("Precision")
                        .HasColumnType("int");

                    b.HasKey("Id");

                    b.HasIndex("CiudadId");

                    b.HasIndex("DispositivosId");

                    b.ToTable("Ubicacion");
                });

            modelBuilder.Entity("Mover.Entities.POCOEntities.User", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<string>("Apellido")
                        .IsRequired()
                        .HasMaxLength(100)
                        .HasColumnType("nvarchar(100)");

                    b.Property<string>("Direccion")
                        .IsRequired()
                        .HasMaxLength(200)
                        .HasColumnType("nvarchar(200)");

                    b.Property<string>("Email")
                        .IsRequired()
                        .HasMaxLength(100)
                        .HasColumnType("nvarchar(100)");

                    b.Property<int?>("EstadoUsuarioId")
                        .HasColumnType("int");

                    b.Property<string>("Identificacion")
                        .IsRequired()
                        .HasMaxLength(50)
                        .HasColumnType("nvarchar(50)");

                    b.Property<string>("Nombre")
                        .IsRequired()
                        .HasMaxLength(100)
                        .HasColumnType("nvarchar(100)");

                    b.Property<string>("Password")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Telefono")
                        .IsRequired()
                        .HasMaxLength(50)
                        .HasColumnType("nvarchar(50)");

                    b.Property<int?>("TipoIdentificacionId")
                        .HasColumnType("int");

                    b.Property<int?>("TipoUserId")
                        .HasColumnType("int");

                    b.Property<DateTime?>("UltimaSesion")
                        .HasColumnType("datetime2");

                    b.Property<string>("UserName")
                        .IsRequired()
                        .HasMaxLength(100)
                        .HasColumnType("nvarchar(100)");

                    b.HasKey("Id");

                    b.HasIndex("EstadoUsuarioId");

                    b.HasIndex("TipoIdentificacionId");

                    b.HasIndex("TipoUserId");

                    b.ToTable("Users");
                });

            modelBuilder.Entity("Mover.Entities.POCOEntities.Vehiculos.Carroceria", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<int?>("ClaseId")
                        .HasColumnType("int");

                    b.Property<string>("Descripcion")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Nombre")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.HasIndex("ClaseId");

                    b.ToTable("Carroceria");
                });

            modelBuilder.Entity("Mover.Entities.POCOEntities.Vehiculos.Categoria", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<string>("Nombre")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.ToTable("Categoria");
                });

            modelBuilder.Entity("Mover.Entities.POCOEntities.Vehiculos.Clase", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<int?>("CategoriaId")
                        .HasColumnType("int");

                    b.Property<string>("Descripcion")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Nombre")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.HasIndex("CategoriaId");

                    b.ToTable("Clase");
                });

            modelBuilder.Entity("Mover.Entities.POCOEntities.Vehiculos.ClaseMarca", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<int>("ClaseId")
                        .HasColumnType("int");

                    b.Property<int>("MarcaId")
                        .HasColumnType("int");

                    b.HasKey("Id");

                    b.HasIndex("ClaseId");

                    b.HasIndex("MarcaId");

                    b.ToTable("ClaseMarca");
                });

            modelBuilder.Entity("Mover.Entities.POCOEntities.Vehiculos.CondicionVehiculo", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<string>("Nombre")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.ToTable("CondicionVehiculo");
                });

            modelBuilder.Entity("Mover.Entities.POCOEntities.Vehiculos.EstadoVehiculo", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<string>("Nombre")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.ToTable("EstadoVehiculo");
                });

            modelBuilder.Entity("Mover.Entities.POCOEntities.Vehiculos.Marca", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<string>("Descripcion")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Nombre")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.ToTable("Marca");
                });

            modelBuilder.Entity("Mover.Entities.POCOEntities.Vehiculos.Modelo", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<string>("Nombre")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.ToTable("Modelo");
                });

            modelBuilder.Entity("Mover.Entities.POCOEntities.Vehiculos.ParametrosVehiculo", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<string>("Nombre")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.ToTable("ParametrosVehiculo");
                });

            modelBuilder.Entity("Mover.Entities.POCOEntities.Vehiculos.ParametrosVehiculoVehiculo", b =>
                {
                    b.Property<int>("VehiculoId")
                        .HasColumnType("int");

                    b.Property<int>("ParametrosVehiculoId")
                        .HasColumnType("int");

                    b.Property<bool>("Value")
                        .HasColumnType("bit");

                    b.HasKey("VehiculoId", "ParametrosVehiculoId");

                    b.HasIndex("ParametrosVehiculoId");

                    b.ToTable("ParametrosVehiculoVehiculo");
                });

            modelBuilder.Entity("Mover.Entities.POCOEntities.Vehiculos.Referencia", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<string>("Descripcion")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int?>("MarcaId")
                        .HasColumnType("int");

                    b.Property<string>("Nombre")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.HasIndex("MarcaId");

                    b.ToTable("Referencia");
                });

            modelBuilder.Entity("Mover.Entities.POCOEntities.Vehiculos.Vehiculo", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<int>("CarroceriaId")
                        .HasColumnType("int");

                    b.Property<int>("CondicionVehiculoId")
                        .HasColumnType("int");

                    b.Property<int>("EstadoVehiculoId")
                        .HasColumnType("int");

                    b.Property<int>("ModeloId")
                        .HasColumnType("int");

                    b.Property<string>("Observacion")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<int>("OfertaId")
                        .HasColumnType("int");

                    b.Property<string>("Placa")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<int>("ReferenciaId")
                        .HasColumnType("int");

                    b.HasKey("Id");

                    b.HasIndex("CarroceriaId");

                    b.HasIndex("CondicionVehiculoId");

                    b.HasIndex("EstadoVehiculoId");

                    b.HasIndex("ModeloId");

                    b.HasIndex("OfertaId");

                    b.HasIndex("ReferenciaId");

                    b.ToTable("Vehiculo");
                });

            modelBuilder.Entity("Mover.Entities.POCOEntities.ZonaTransporter", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<string>("Nombre")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.ToTable("ZonaTransporter");
                });

            modelBuilder.Entity("Mover.Entities.POCOEntities.ConductorAutorizado", b =>
                {
                    b.HasOne("Mover.Entities.POCOEntities.User", "User")
                        .WithMany("ListConductorAutorizado")
                        .HasForeignKey("UserId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("User");
                });

            modelBuilder.Entity("Mover.Entities.POCOEntities.Dispositivos", b =>
                {
                    b.HasOne("Mover.Entities.POCOEntities.User", "User")
                        .WithMany()
                        .HasForeignKey("UserId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("User");
                });

            modelBuilder.Entity("Mover.Entities.POCOEntities.Equipo", b =>
                {
                    b.HasOne("Mover.Entities.POCOEntities.User", "User")
                        .WithMany("ListEquipos")
                        .HasForeignKey("UserId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("User");
                });

            modelBuilder.Entity("Mover.Entities.POCOEntities.Georeferencia.Ciudad", b =>
                {
                    b.HasOne("Mover.Entities.POCOEntities.Georeferencia.Departamento", "Departamento")
                        .WithMany()
                        .HasForeignKey("DepartamentoId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Departamento");
                });

            modelBuilder.Entity("Mover.Entities.POCOEntities.Georeferencia.Departamento", b =>
                {
                    b.HasOne("Mover.Entities.POCOEntities.Georeferencia.Pais", "Pais")
                        .WithMany()
                        .HasForeignKey("PaisId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Pais");
                });

            modelBuilder.Entity("Mover.Entities.POCOEntities.MultimediaVehiculo", b =>
                {
                    b.HasOne("Mover.Entities.POCOEntities.Vehiculos.Vehiculo", null)
                        .WithMany("MultimediaVehiculos")
                        .HasForeignKey("VehiculoId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("Mover.Entities.POCOEntities.Oferta", b =>
                {
                    b.HasOne("Mover.Entities.POCOEntities.EstadoOferta", "EstadoOferta")
                        .WithMany()
                        .HasForeignKey("EstadoOfertaId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("Mover.Entities.POCOEntities.Ubicacion", "UbicacionDestino")
                        .WithMany()
                        .HasForeignKey("UbicacionDestinoId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("Mover.Entities.POCOEntities.Ubicacion", "UbicacionOrigen")
                        .WithMany()
                        .HasForeignKey("UbicacionOrigenId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("Mover.Entities.POCOEntities.User", "User")
                        .WithMany()
                        .HasForeignKey("UserId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("Mover.Entities.POCOEntities.ZonaTransporter", "ZonaTransporter")
                        .WithMany()
                        .HasForeignKey("ZonaTransporterId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("EstadoOferta");

                    b.Navigation("UbicacionDestino");

                    b.Navigation("UbicacionOrigen");

                    b.Navigation("User");

                    b.Navigation("ZonaTransporter");
                });

            modelBuilder.Entity("Mover.Entities.POCOEntities.Ubicacion", b =>
                {
                    b.HasOne("Mover.Entities.POCOEntities.Georeferencia.Ciudad", "Ciudad")
                        .WithMany()
                        .HasForeignKey("CiudadId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("Mover.Entities.POCOEntities.Dispositivos", "Dispositivos")
                        .WithMany()
                        .HasForeignKey("DispositivosId");

                    b.Navigation("Ciudad");

                    b.Navigation("Dispositivos");
                });

            modelBuilder.Entity("Mover.Entities.POCOEntities.User", b =>
                {
                    b.HasOne("Mover.Entities.POCOEntities.EstadoUsuario", "EstadoUsuario")
                        .WithMany()
                        .HasForeignKey("EstadoUsuarioId");

                    b.HasOne("Mover.Entities.POCOEntities.TipoIdentificacion", "TipoIdentificacion")
                        .WithMany()
                        .HasForeignKey("TipoIdentificacionId");

                    b.HasOne("Mover.Entities.POCOEntities.TipoUser", "TipoUser")
                        .WithMany()
                        .HasForeignKey("TipoUserId");

                    b.Navigation("EstadoUsuario");

                    b.Navigation("TipoIdentificacion");

                    b.Navigation("TipoUser");
                });

            modelBuilder.Entity("Mover.Entities.POCOEntities.Vehiculos.Carroceria", b =>
                {
                    b.HasOne("Mover.Entities.POCOEntities.Vehiculos.Clase", "Clase")
                        .WithMany()
                        .HasForeignKey("ClaseId");

                    b.Navigation("Clase");
                });

            modelBuilder.Entity("Mover.Entities.POCOEntities.Vehiculos.Clase", b =>
                {
                    b.HasOne("Mover.Entities.POCOEntities.Vehiculos.Categoria", "Categoria")
                        .WithMany()
                        .HasForeignKey("CategoriaId");

                    b.Navigation("Categoria");
                });

            modelBuilder.Entity("Mover.Entities.POCOEntities.Vehiculos.ClaseMarca", b =>
                {
                    b.HasOne("Mover.Entities.POCOEntities.Vehiculos.Clase", "Clase")
                        .WithMany("ClaseMarca")
                        .HasForeignKey("ClaseId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("Mover.Entities.POCOEntities.Vehiculos.Marca", "Marca")
                        .WithMany("ClaseMarca")
                        .HasForeignKey("MarcaId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Clase");

                    b.Navigation("Marca");
                });

            modelBuilder.Entity("Mover.Entities.POCOEntities.Vehiculos.ParametrosVehiculoVehiculo", b =>
                {
                    b.HasOne("Mover.Entities.POCOEntities.Vehiculos.ParametrosVehiculo", "ParametrosVehiculo")
                        .WithMany("ParametrosVehiculoVehiculo")
                        .HasForeignKey("ParametrosVehiculoId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("Mover.Entities.POCOEntities.Vehiculos.Vehiculo", "Vehiculo")
                        .WithMany("ParametrosVehiculoVehiculo")
                        .HasForeignKey("VehiculoId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("ParametrosVehiculo");

                    b.Navigation("Vehiculo");
                });

            modelBuilder.Entity("Mover.Entities.POCOEntities.Vehiculos.Referencia", b =>
                {
                    b.HasOne("Mover.Entities.POCOEntities.Vehiculos.Marca", "Marca")
                        .WithMany()
                        .HasForeignKey("MarcaId");

                    b.Navigation("Marca");
                });

            modelBuilder.Entity("Mover.Entities.POCOEntities.Vehiculos.Vehiculo", b =>
                {
                    b.HasOne("Mover.Entities.POCOEntities.Vehiculos.Carroceria", "Carroceria")
                        .WithMany()
                        .HasForeignKey("CarroceriaId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("Mover.Entities.POCOEntities.Vehiculos.CondicionVehiculo", "CondicionVehiculo")
                        .WithMany()
                        .HasForeignKey("CondicionVehiculoId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("Mover.Entities.POCOEntities.Vehiculos.EstadoVehiculo", "EstadoVehiculo")
                        .WithMany()
                        .HasForeignKey("EstadoVehiculoId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("Mover.Entities.POCOEntities.Vehiculos.Modelo", "Modelo")
                        .WithMany()
                        .HasForeignKey("ModeloId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("Mover.Entities.POCOEntities.Oferta", "Oferta")
                        .WithMany("ListVehiculo")
                        .HasForeignKey("OfertaId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("Mover.Entities.POCOEntities.Vehiculos.Referencia", "Referencia")
                        .WithMany()
                        .HasForeignKey("ReferenciaId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Carroceria");

                    b.Navigation("CondicionVehiculo");

                    b.Navigation("EstadoVehiculo");

                    b.Navigation("Modelo");

                    b.Navigation("Oferta");

                    b.Navigation("Referencia");
                });

            modelBuilder.Entity("Mover.Entities.POCOEntities.Oferta", b =>
                {
                    b.Navigation("ListVehiculo");
                });

            modelBuilder.Entity("Mover.Entities.POCOEntities.User", b =>
                {
                    b.Navigation("ListConductorAutorizado");

                    b.Navigation("ListEquipos");
                });

            modelBuilder.Entity("Mover.Entities.POCOEntities.Vehiculos.Clase", b =>
                {
                    b.Navigation("ClaseMarca");
                });

            modelBuilder.Entity("Mover.Entities.POCOEntities.Vehiculos.Marca", b =>
                {
                    b.Navigation("ClaseMarca");
                });

            modelBuilder.Entity("Mover.Entities.POCOEntities.Vehiculos.ParametrosVehiculo", b =>
                {
                    b.Navigation("ParametrosVehiculoVehiculo");
                });

            modelBuilder.Entity("Mover.Entities.POCOEntities.Vehiculos.Vehiculo", b =>
                {
                    b.Navigation("MultimediaVehiculos");

                    b.Navigation("ParametrosVehiculoVehiculo");
                });
#pragma warning restore 612, 618
        }
    }
}
