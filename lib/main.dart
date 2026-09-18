import 'package:flutter/material.dart';
import "../models/incidentes.dart";
import "../screens/central_de_incidentes.dart";
//Kauan - https://share.gemini.google/846ClN6vmRok

//Lista de Incidentes
final List<Incidente> listaIncidentes = [
  Incidente(
    id: 'INC-1001',
    titulo: 'negação de serviço',
    tipo: TipodeIncidente.ddos,
    severidade: Severidade.critico,
    status: StatusIncidente.emAndamento,
    dataAbertura: DateTime.now().subtract(const Duration(minutes: 25)),
    responsavel: 'Fabio',
  ),
  Incidente(
    id: 'INC-1002',
    titulo: 'força bruta',
    tipo: TipodeIncidente.acessoNaoAutorizado,
    severidade: Severidade.alto,
    status: StatusIncidente.aberto,
    dataAbertura: DateTime.now().subtract(const Duration(hours: 3)),
    responsavel: null, 
  ),
  Incidente(
    id: 'INC-1003',
    titulo: 'phishing',
    tipo: TipodeIncidente.phishing,
    severidade: Severidade.alto,
    status: StatusIncidente.resolvido,
    dataAbertura: DateTime.now().subtract(const Duration(days: 2)),
    responsavel: 'Thiago',
  ),
  Incidente(
    id: 'INC-1004',
    titulo: 'Trojan',
    tipo: TipodeIncidente.malware,
    severidade: Severidade.medio,
    status: StatusIncidente.emAndamento,
    dataAbertura: DateTime.now().subtract(const Duration(hours: 6)),
    responsavel: 'Carlos',
  ),
  Incidente(
    id: 'INC-1005',
    titulo: 'Certificado prestes a expirar',
    tipo: TipodeIncidente.outro,
    severidade: Severidade.baixo,
    status: StatusIncidente.aberto,
    dataAbertura: DateTime.now().subtract(const Duration(minutes: 50)),
    responsavel: null, 
  ),
  Incidente(
    id: 'INC-1006',
    titulo: 'Sniffing',
    tipo: TipodeIncidente.acessoNaoAutorizado,
    severidade: Severidade.medio,
    status: StatusIncidente.resolvido,
    dataAbertura: DateTime.now().subtract(const Duration(days: 5)),
    responsavel: 'Melissa',
  ),
];


void main() {
  runApp(CentralIncidentesApp(listaIncidentes: listaIncidentes));
}