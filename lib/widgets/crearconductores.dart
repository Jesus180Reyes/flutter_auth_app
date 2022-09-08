import 'package:flutter/material.dart';
import 'package:node_app_frontend/helpers/alerta.dart';
import 'package:node_app_frontend/helpers/custom_button.dart';
import 'package:node_app_frontend/helpers/success_dialog.dart';
import 'package:node_app_frontend/helpers/title_widget.dart';
import 'package:node_app_frontend/providers/login_provider.dart';
import 'package:node_app_frontend/widgets/form_widget.dart';
import 'package:provider/provider.dart';

class CrearConductoresWidgets extends StatelessWidget {
  const CrearConductoresWidgets({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<LoginProvider>(context);
    final nameController = TextEditingController();
    final rnpController = TextEditingController();
    final vehicleController = TextEditingController();
    final plateController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          const TitleWidget(title: "Crear Un nuevo conductor"),
          FormWidget(
            title: "Ingresa el nombre",
            hintText: "Nombre",
            controller: nameController,
            textInputType: TextInputType.name,
          ),
          FormWidget(
            title: "Ingresa el RNP",
            hintText: "RNP",
            controller: rnpController,
            textInputType: TextInputType.number,
          ),
          FormWidget(
            title: "Ingresa el Vehiculo",
            hintText: "Vehiculo",
            controller: vehicleController,
            textInputType: TextInputType.number,
          ),
          FormWidget(
            title: "Ingresa la Placa del Vehiculo",
            hintText: "Placa del Vehiculo",
            controller: plateController,
            textInputType: TextInputType.number,
          ),
          const SizedBox(height: 15),
          CustomButton(
            onPressed: () async {
              final isCreateConductorOk = await authProvider.createConductor(
                rnp: rnpController.text.trim(),
                nombre: nameController.text.trim(),
                vehiculo: vehicleController.text.trim(),
                plate: plateController.text.trim(),
              );
              if (isCreateConductorOk != true) {
                return alerta(
                    context: context,
                    titulo: "Error",
                    subtitulo: isCreateConductorOk);
              }
              successAlert(context, "Conductor Creado Correctamente");
            },
            title: "Registrar Conductor",
          ),
        ],
      ),
    );
  }
}
