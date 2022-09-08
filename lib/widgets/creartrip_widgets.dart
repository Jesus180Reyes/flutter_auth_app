import 'package:flutter/material.dart';
import 'package:node_app_frontend/helpers/alerta.dart';
import 'package:node_app_frontend/helpers/custom_button.dart';
import 'package:node_app_frontend/helpers/success_dialog.dart';
import 'package:node_app_frontend/helpers/title_widget.dart';
import 'package:node_app_frontend/providers/login_provider.dart';
import 'package:node_app_frontend/widgets/form_widget.dart';
import 'package:provider/provider.dart';

class CrearTripWidgets extends StatefulWidget {
  const CrearTripWidgets({
    Key? key,
  }) : super(key: key);

  @override
  State<CrearTripWidgets> createState() => _CrearTripWidgetsState();
}

class _CrearTripWidgetsState extends State<CrearTripWidgets> {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<LoginProvider>(context);
    final driversProvider = Provider.of<LoginProvider>(context).conductores;
    final origenController = TextEditingController();
    final destinoController = TextEditingController();
    final cargamentoController = TextEditingController();
    final conductorController = TextEditingController();

    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      margin: const EdgeInsets.only(top: 15),
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const TitleWidget(title: "Crear un nuevo viaje"),
          FormWidget(
            title: "Ingresa el Origen",
            hintText: "Origen",
            controller: origenController,
            textInputType: TextInputType.text,
          ),
          FormWidget(
            title: "Ingresa el Destino",
            hintText: "Destino",
            controller: destinoController,
            textInputType: TextInputType.text,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.black, width: 1),
            ),
            child: DropdownButtonFormField<dynamic>(
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(10),
                border: InputBorder.none,
              ),
              hint: const Text(
                'Conductor',
                style: TextStyle(fontSize: 20),
              ),
              icon: const Icon(Icons.person, color: Colors.orange),
              items: driversProvider!
                  .map(
                    (e) => DropdownMenuItem(
                      child: Text(e.nombre),
                      value: e.uid,
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                conductorController.text = value!;
              },
            ),
          ),
          FormWidget(
            title: "Cargamento",
            hintText: "Conductor",
            controller: cargamentoController,
            textInputType: TextInputType.text,
          ),
          const SizedBox(height: 10),
          CustomButton(
            onPressed: () async {
              final isTripOk = await authProvider.createTrip(
                origen: origenController.text.trim(),
                destino: destinoController.text.trim(),
                conductor: conductorController.text.trim(),
                cargamento: cargamentoController.text.trim(),
              );

              if (isTripOk != true) {
                return alerta(
                    context: context, titulo: "Error", subtitulo: isTripOk);
              }
              successAlert(context, "El Reporte se realizo exitosamente");
            },
            title: "Crear Viaje",
          ),
          const SizedBox(height: 15)
        ],
      ),
    );
  }
}
