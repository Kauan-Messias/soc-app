import "package:flutter/material.dart";
import "../models/incidente.dart";
//import "../widgets/incidente_card.dart";
import 'lista_incidentes_screen.dart';

class CentralIncidentesApp extends StatelessWidget {
  final List<Incidente> listaIncidentes;

  const CentralIncidentesApp({
    super.key,
    required this.listaIncidentes
    });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Central de Incidentes',
      theme: ThemeData.dark(),
      home: const ListaIncidentesScreen(),
    );
  }
}