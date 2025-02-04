import 'package:flutter/material.dart';
import 'package:frontend/domain/domain.dart';

import '../../../utils/storage/storagex.dart';
import '../screen.dart';

class MainOfertaScreen extends StatefulWidget {
  final int initialIndex; // Parámetro para índice inicial

  const MainOfertaScreen({super.key, this.initialIndex = 0});

  @override
  MainOfertaScreenState createState() => MainOfertaScreenState();
}

class MainOfertaScreenState extends State<MainOfertaScreen> {
  late int _currentIndex;
  Oferta? oferta;
  List<Vehiculo?>? listVehiculo;
  OfertaStorage ofertaStorage = OfertaStorage();
  VehiculoListStorage vehiculoListStorage = VehiculoListStorage();
  UbicacionDestinoStorage ubicacionOrigenStorage = UbicacionDestinoStorage();
  UbicacionDestinoStorage ubicacionDestinoStorage = UbicacionDestinoStorage();
  Ubicacion? ubicacionOrigen;
  Ubicacion? ubicacionDestino;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex; // Inicializar con índice recibido
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  void _onTabTapped(int index) async {
    oferta = await ofertaStorage.get();
    listVehiculo = await vehiculoListStorage.getList();
    ubicacionOrigen = await ubicacionOrigenStorage.get();
    ubicacionDestino = await ubicacionDestinoStorage.get();
    if ((index == 1 && oferta?.zonaTransporterId == null) ||
        ((index == 2 || index == 3) && (listVehiculo?.isEmpty ?? true)) ||
        (index == 3 && ubicacionOrigen == null)) return;

    if (index == 4 &&
        ((listVehiculo?.isEmpty ?? true) ||
            ubicacionOrigen == null ||
            ubicacionDestino == null)) return;

    setState(() {
      _currentIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          ZonaTransporterScreen(
              onZonaTransporterSelected: () => _onTabTapped(1)),
          const ListVehiculoScreen(),
          OrigenScreen(onOrigenScreenSelected: () => _onTabTapped(3)),
          DestinoScreen(onDestinoScreenSelected: () => _onTabTapped(4)),
          const PrecioOfertaScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        selectedLabelStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
        unselectedLabelStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
              fontSize: 14,
              color: Colors.grey,
            ),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.place),
            label: 'Modo Servicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.car_crash),
            label: 'Vehiculos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Origen',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: 'Destino',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.save_as_rounded),
            label: 'Guardar',
          ),
        ],
      ),
    );
  }
}
