import 'package:flutter/material.dart';
import 'package:frontend/domain/domain.dart';
import 'package:go_router/go_router.dart';
import 'package:frontend/presentation/screens/screen.dart';

import '../../../../utils/storage/storagex.dart';

class MainVehiculoScreen extends StatefulWidget {
  const MainVehiculoScreen({super.key});

  @override
  MainVehiculoScreenState createState() => MainVehiculoScreenState();
}

class MainVehiculoScreenState extends State<MainVehiculoScreen> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();
  VehiculoStorage vehiculoStorage = VehiculoStorage();
  MultimediaVehiculoListStorage multimediaVehiculoListStorage =
      MultimediaVehiculoListStorage();
  List<Widget>? fullScreenList;
  Vehiculo? vehiculo;

  final List<String> fullLabels = [
    'Categoría',
    'Clase',
    'Carrocería',
    'Marca',
    'Referencia',
    'Modelo',
    'Placa',
    'Condición',
    'Estado',
    'Parámetros',
    'Foto',
    'Finalizar',
  ];
  List<Widget> activeScreens = [];
  List<String> activeLabels = [];

  List<int> activeIndices = [];
  int index0 = 0;
  int index1 = 0;
  int index2 = 0;

  @override
  void initState() {
    super.initState();
    fullScreenList = [
      CategoriasScreen(onCategoriaSelected: handleCategoriaTap),
      ClaseScreen(onClaseSelected: handleClaseTap),
      CarroceriaScreen(onCarroceriaSelected: handleCarroceriaTap),
      MarcaScreen(onMarcaSelected: handleMarcaTap),
      ReferenciaScreen(onReferenciaSelected: handleReferenciaTap),
      ModeloScreen(onModeloSelected: handleModeloTap),
      PlacaScreen(onPlacaSelected: handlePlaca),
      CondicionVehiculoScreen(
          onCondicionVehiculoSelected: handleCondicionVehiculo),
      EstadoVehiculoScreen(onSelectedEstado: handleEstadoVehiculo),
      ParametrosVehiculoScreen(
          onParametrosVehiculoSelected: handleParametrosVehiculo),
      AddVehiclePhotoScreen(onAddVehiclePhotoSelected: handleAddVehiclePhoto),
      SalvarVehiculoScreen(
        onClicSaveVehiculo: handleSaveVehiculo,
      )
    ];
    // Inicializamos con solo la primera pantalla y el siguiente ítem.
    activeScreens = [CategoriasScreen(onCategoriaSelected: handleCategoriaTap)];
    activeLabels = [fullLabels[0], fullLabels[1]];
    activeIndices = [0, 1];
  }

  void handleCategoriaTap(int? index) {
    setState(() {
      if (activeIndices.length == 2 &&
          activeIndices[0] == 0 &&
          activeIndices[1] == 1) {
        activeIndices = [];
        activeScreens = [];
        activeLabels = [];
        activeScreens = [fullScreenList![1]];
        activeLabels = [fullLabels[0], fullLabels[1], fullLabels[2]];
        activeIndices = [0, 1, 2];
        _currentIndex = 1;
        _pageController.jumpToPage(1);
      }
    });
  }

  void handleClaseTap(int? index) {
    setState(() {
      activeIndices = [];
      activeScreens = [];
      activeLabels = [];
      activeScreens = [fullScreenList![2]];
      activeLabels = [fullLabels[1], fullLabels[2], fullLabels[3]];
      activeIndices = [1, 2, 3];
      _currentIndex = 1;
      _pageController.jumpToPage(1);
    });
  }

  void handleCarroceriaTap(int? index) {
    setState(() {
      activeIndices = [];
      activeScreens = [];
      activeLabels = [];
      activeScreens = [fullScreenList![3]];
      activeLabels = [fullLabels[2], fullLabels[3], fullLabels[4]];
      activeIndices = [2, 3, 4];
      _currentIndex = 1;
      _pageController.jumpToPage(1);
    });
  }

  void handleMarcaTap(int? index) {
    setState(() {
      activeIndices = [];
      activeScreens = [];
      activeLabels = [];
      activeScreens = [fullScreenList![4]];
      activeLabels = [fullLabels[3], fullLabels[4], fullLabels[5]];
      activeIndices = [3, 4, 5];
      _currentIndex = 1;
      _pageController.jumpToPage(1);
    });
  }

  void handleReferenciaTap(int? index) {
    setState(() {
      activeIndices = [];
      activeScreens = [];
      activeLabels = [];
      activeScreens = [fullScreenList![5]];
      activeLabels = [fullLabels[4], fullLabels[5], fullLabels[6]];
      activeIndices = [4, 5, 6];
      _currentIndex = 1;
      _pageController.jumpToPage(1);
    });
  }

  void handleModeloTap(int? index) {
    setState(() {
      activeIndices = [];
      activeScreens = [];
      activeLabels = [];
      activeScreens = [fullScreenList![6]];
      activeLabels = [fullLabels[5], fullLabels[6], fullLabels[7]];
      activeIndices = [5, 6, 7];
      _currentIndex = 1;
      _pageController.jumpToPage(1);
    });
  }

  void handlePlaca() {
    setState(() {
      activeIndices = [];
      activeScreens = [];
      activeLabels = [];
      activeScreens = [fullScreenList![7]];
      activeLabels = [fullLabels[6], fullLabels[7], fullLabels[8]];
      activeIndices = [6, 7, 8];
      _currentIndex = 1;
      _pageController.jumpToPage(1);
    });
  }

  void handleCondicionVehiculo() {
    setState(() {
      activeIndices = [];
      activeScreens = [];
      activeLabels = [];
      activeScreens = [fullScreenList![8]];
      activeLabels = [fullLabels[7], fullLabels[8], fullLabels[9]];
      activeIndices = [7, 8, 9];
      _currentIndex = 1;
      _pageController.jumpToPage(1);
    });
  }

  void handleEstadoVehiculo() {
    setState(() {
      activeIndices = [];
      activeScreens = [];
      activeLabels = [];
      activeScreens = [fullScreenList![9]];
      activeLabels = [fullLabels[8], fullLabels[9], fullLabels[10]];
      activeIndices = [8, 9, 10];
      _currentIndex = 1;
      _pageController.jumpToPage(1);
    });
  }

  void handleParametrosVehiculo() {
    setState(() {
      activeIndices = [];
      activeScreens = [];
      activeLabels = [];
      activeScreens = [fullScreenList![10]];
      activeLabels = [fullLabels[9], fullLabels[10], fullLabels[11]];
      activeIndices = [9, 10, 11];
      _currentIndex = 1;
      _pageController.jumpToPage(1);
    });
  }

  void handleAddVehiclePhoto() {
    setState(() {
      activeIndices = [];
      activeScreens = [];
      activeLabels = [];
      activeScreens = [fullScreenList![11]];
      activeLabels = [fullLabels[10], fullLabels[11]];
      activeIndices = [10, 11];
      _currentIndex = 1;
      _pageController.jumpToPage(1);
    });
  }

  void handleSaveVehiculo() {
    context.pushReplacement('/mainoferta', extra: {'initialIndex': 2});
  }

  void _onTabTapped(int index) async {
    Vehiculo? vehiculo = await vehiculoStorage.get();
    List<MultimediaVehiculo?>? listMultimediaVehiculo =
        await multimediaVehiculoListStorage.getList();

    if (vehiculo != null) {
      // Verificamos si el índice seleccionado es 1 (Clase) y la categoría es null
      if (index == 1 &&
          vehiculo.categoriaId == null &&
          activeIndices.length == 2) {
        // Si la categoría es null, no se permite avanzar y se redirige a la página de categoría (índice 0)
        setState(() {
          _pageController.jumpToPage(0);
        });
        return;
      }
      if (activeIndices.length == 3) {
        if (activeIndices[2] == 3 &&
            vehiculo.carroceriaId == null &&
            index == 2) {
          setState(() {
            _pageController.jumpToPage(0);
          });
          return;
        }
      }

      if (activeIndices.length == 3) {
        if (activeIndices[2] == 4 && vehiculo.marcaId == null && index == 2) {
          setState(() {
            _pageController.jumpToPage(0);
          });
          return;
        }
      }

      if (activeIndices.length == 3) {
        if (activeIndices[2] == 5 &&
            vehiculo.referenciaId == null &&
            index == 2) {
          setState(() {
            _pageController.jumpToPage(0);
          });
          return;
        }
      }

      if (activeIndices.length == 3) {
        if (activeIndices[2] == 6 && vehiculo.modeloId == null && index == 2) {
          setState(() {
            _pageController.jumpToPage(0);
          });
          return;
        }
      }

      if (activeIndices.length == 3) {
        if (activeIndices[2] == 7 && vehiculo.placa == '' && index == 2) {
          setState(() {
            _pageController.jumpToPage(0);
          });
          return;
        }
      }

      if (activeIndices.length == 3) {
        if (activeIndices[2] == 8 &&
            vehiculo.condicionVehiculoId == null &&
            index == 2) {
          setState(() {
            _pageController.jumpToPage(0);
          });
          return;
        }
      }
      if (activeIndices.length == 3) {
        if (activeIndices[2] == 9 &&
            vehiculo.estadoVehiculoId == null &&
            index == 2) {
          setState(() {
            _pageController.jumpToPage(0);
          });
          return;
        }
      }

//  'Placa',
//     'Condición',
//     'Estado',
//     'Parámetros',
//     'Foto',

      if (index == 2 && activeIndices[2] == 2 && vehiculo.claseId == null) {
        setState(() {
          _pageController.jumpToPage(0);
        });
        return;
      }

      setState(() {
        _currentIndex = index;

        // Condiciones adicionales después de validar categoriaId
        if (activeIndices.length == 2 &&
            index == 0 &&
            activeIndices[0] == 0 &&
            activeIndices[1] == 1) {
          return;
        }

        if (activeIndices.length == 3 &&
            index == 2 &&
            activeIndices[2] == 11 &&
            listMultimediaVehiculo.isEmpty) {
          _pageController.jumpToPage(1);
          _currentIndex = 1;
          return;
        }

        if (activeIndices.length == 2 &&
            index == 0 &&
            activeIndices[0] == 10 &&
            activeIndices[1] == 11) {
          activeIndices = [];
          activeScreens = [];
          activeLabels = [];
          activeScreens = [fullScreenList![10]];
          activeLabels = [fullLabels[9], fullLabels[10], fullLabels[11]];
          activeIndices = [9, 10, 11];

          _pageController.jumpToPage(1);
          _currentIndex = 1;
          return;
        }

        if (activeIndices.length == 2 &&
            index == 1 &&
            activeIndices[0] == 10 &&
            activeIndices[1] == 11) {
          return;
        }

        if (activeIndices.length == 2 &&
            index == 1 &&
            activeIndices[0] == 0 &&
            activeIndices[1] == 1) {
          activeIndices = [];
          activeScreens = [];
          activeLabels = [];
          activeScreens = [fullScreenList![1]];
          activeLabels = [fullLabels[0], fullLabels[1], fullLabels[2]];
          activeIndices = [0, 1, 2];

          _pageController.jumpToPage(1);
          _currentIndex = 1;
          return;
        }

        if (activeIndices.length == 3 && index == 1) {
          return;
        }

        if (activeIndices.length == 2 &&
            index == 0 &&
            activeIndices[0] == 10 &&
            activeIndices[1] == 11) {
          return;
        }

        if (index == 0 && activeIndices.length == 3 && activeIndices[0] == 0) {
          activeScreens = [];
          activeLabels = [];
          activeIndices = [];

          activeScreens = [
            CategoriasScreen(onCategoriaSelected: handleCategoriaTap)
          ];
          activeLabels = [fullLabels[0], fullLabels[1]];
          activeIndices = [0, 1];
          _pageController.jumpToPage(0);
          _currentIndex = 0;
          return;
        }

        if (activeIndices.length == 3 && index == 0) {
          index0 = activeIndices[0];
          index1 = activeIndices[1];
          index2 = activeIndices[2];
          activeIndices = [];
          activeScreens = [];
          activeLabels = [];
          activeIndices = [index0 - 1, index1 - 1, index2 - 1];
          activeScreens = [fullScreenList![index1 - 1]];
          activeLabels = [
            fullLabels[index0 - 1],
            fullLabels[index1 - 1],
            fullLabels[index2 - 1]
          ];
          _pageController.jumpToPage(1);
          _currentIndex = 1;
          return;
        }
        if (activeIndices.length == 3) {
          if (activeIndices[2] == 11) {
            activeIndices = [];
            activeScreens = [];
            activeLabels = [];
            activeScreens = [fullScreenList![11]];
            activeLabels = [fullLabels[10], fullLabels[11]];
            activeIndices = [10, 11];

            _pageController.jumpToPage(1);
            _currentIndex = 1;
            return;
          }
        }

        if (activeIndices.length == 3 && index == 2) {
          index0 = activeIndices[0];
          index1 = activeIndices[1];
          index2 = activeIndices[2];
          activeIndices = [];
          activeScreens = [];
          activeLabels = [];
          activeIndices = [index0 + 1, index1 + 1, index2 + 1];
          activeScreens = [fullScreenList![index1 + 1]];
          activeLabels = [
            fullLabels[index0 + 1],
            fullLabels[index1 + 1],
            fullLabels[index2 + 1]
          ];
        }
        _pageController.jumpToPage(1);
        _currentIndex = 1;
        // Resto de la lógica
      });
    }
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
        physics:
            const NeverScrollableScrollPhysics(), // Deshabilita el swipe manual entre páginas
        children: activeScreens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 3,
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        selectedItemColor: Colors.blue, // Cambia a tu color preferido
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
        unselectedLabelStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
              fontSize: 14,
              color: Colors.grey,
            ),
        items: List.generate(activeLabels.length, (index) {
          if (activeLabels.length == 3) {
            return BottomNavigationBarItem(
              icon: (index == 0)
                  ? const Icon(Icons.arrow_left_outlined, size: 34)
                  : (index == 1)
                      ? const Icon(Icons.circle_rounded, size: 24)
                      : const Icon(Icons.arrow_right_outlined, size: 34),
              label: activeLabels[index],
            );
          } else {
            if (activeIndices[0] == 0 && activeIndices[1] == 1) {
              return BottomNavigationBarItem(
                icon: (index == 0)
                    ? const Icon(Icons.circle, size: 34)
                    : const Icon(Icons.arrow_right_outlined, size: 34),
                label: activeLabels[index],
              );
            } else {
              return BottomNavigationBarItem(
                icon: (index == 0)
                    ? const Icon(Icons.arrow_left_outlined, size: 34)
                    : const Icon(Icons.note_add_outlined, size: 34),
                label: activeLabels[index],
              );
            }
          }
        }),
      ),
    );
  }
}
