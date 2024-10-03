import 'package:frontend/presentation/screens/Ubicacion/destino_screen.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/screens/screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/selecttypeuser',
      builder: (context, state) => const SelectTypeUser(),
    ),

    GoRoute(
      path: '/listOfertas',
      builder: (context, state) => const ClientScreen(ListOfertas(), "Ofertas"),
    ),

    GoRoute(
        path: '/categorias',
        builder: (context, state) => const CategoriasScreen()),

    GoRoute(
      path: '/clases/:categoryId',
      builder: (context, state) {
        final categoryId = state.pathParameters['categoryId'];
        if (categoryId == null) {
          throw Exception('categoryId es null');
        }
        return ClaseScreen(categoriaId: int.parse(categoryId));
      },
    ),

    GoRoute(
      path: '/carroceria/:claseId',
      builder: (context, state) {
        final claseId = state.pathParameters['claseId'];
        if (claseId == null) {
          throw Exception('claseId es null');
        }
        return CarroceriaScreen(claseId: int.parse(claseId));
      },
    ),

    GoRoute(
      path: '/marca/:claseId',
      builder: (context, state) {
        final claseId = state.pathParameters['claseId'];
        if (claseId == null) {
          throw Exception('claseId es null');
        }
        return MarcaScreen(claseId: int.parse(claseId));
      },
    ),

    GoRoute(
      path: '/referencia/:marcaId',
      builder: (context, state) {
        final marcaId = state.pathParameters['marcaId'];
        if (marcaId == null) {
          throw Exception('marcaId es null');
        }
        return ReferenciaScreen(marcaId: int.parse(marcaId));
      },
    ),

    GoRoute(
      path: '/modelo',
      builder: (context, state) {
        return const ModeloScreen();
      },
    ),

    GoRoute(
      path: '/placa',
      builder: (context, state) {
        return const PlacaScreen();
      },
    ),

    GoRoute(
      path: '/condicionvehiculo',
      builder: (context, state) {
        return const CondicionVehiculoScreen();
      },
    ),

    GoRoute(
      path: '/estadovehiculo',
      builder: (context, state) {
        return const EstadoVehiculoScreen();
      },
    ),

    GoRoute(
      path: '/parametrosvehiculo',
      builder: (context, state) {
        return const ParametrosVehiculoScreen();
      },
    ),

    GoRoute(
      path: '/addvehiclephoto',
      builder: (context, state) {
        return const AddVehiclePhotoScreen();
      },
    ),

    GoRoute(
      path: '/zonatransporter',
      builder: (context, state) {
        return const ZonaTransporterScreen();
      },
    ),

    GoRoute(
      path: '/addOferta',
      builder: (context, state) => const AddOfertScreen(),
    ),
    GoRoute(
      path: '/listServicios',
      builder: (context, state) => const ListServicios(),
    ),

    GoRoute(
      path: '/ubicacionorigen',
      builder: (context, state) => const OrigenScreen(),
    ),

    GoRoute(
      path: '/ubicaciondestino',
      builder: (context, state) => const DestinoScreen(),
    ),

    // Agrega más rutas aquí
  ],
);
