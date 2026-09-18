import "package:flutter/material.dart";
import "../models/incidentes.dart";
import "../widgets/incidente_card.dart";

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
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Central de Incidentes'),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 8),
          children: listaIncidentes
          .map((incidente) => IncidenteCard(incidente: incidente))
          .toList(),
        )
      ),
    );
  }
}