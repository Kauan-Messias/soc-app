import 'package:flutter/material.dart';
<<<<<<< HEAD
import "../models/incidentes.dart";

// Classe de Widgets
=======
import '../models/incidente.dart';

String textoDaSeveridade(Severidade severidade) {
  switch (severidade) {
    case Severidade.critico:
      return 'Crítico';
    case Severidade.alto:
      return 'Alto';
    case Severidade.medio:
      return 'Médio';
    case Severidade.baixo:
      return 'Baixo';
  }
}

Color corDaSeveridade(Severidade severidade) {
  switch (severidade) {
    case Severidade.critico:
      return Colors.red;
    case Severidade.alto:
      return Colors.orange;
    case Severidade.medio:
      return Colors.amber;
    case Severidade.baixo:
      return Colors.blue;
  }
}

IconData iconeDaSeveridade(Severidade severidade) {
  switch (severidade) {
    case Severidade.critico:
      return Icons.report;
    case Severidade.alto:
      return Icons.warning;
    case Severidade.medio:
      return Icons.info;
    case Severidade.baixo:
      return Icons.low_priority;
  }
}

Color corDoStatus(StatusIncidente status) {
  switch (status) {
    case StatusIncidente.aberto:
      return Colors.red;
    case StatusIncidente.emAndamento:
      return Colors.amber;
    case StatusIncidente.resolvido:
      return Colors.green;
  }
}

>>>>>>> main
class IncidenteCard extends StatefulWidget {
  final Incidente incidente;

  const IncidenteCard({super.key, required this.incidente});

  @override
  State<IncidenteCard> createState() => _IncidenteCardState();
}

<<<<<<< HEAD
  class _IncidenteCardState extends State<IncidenteCard> {
    StatusIncidente _statusAtual = StatusIncidente.aberto;

    @override
    void initState() {
      super.initState();
      _statusAtual = widget.incidente.status;
    }


  @override
  Widget build(BuildContext context) {
    final severidade = widget.incidente.severidade;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      elevation: 2,

      child: Padding(
        padding: const EdgeInsets.all(16.0),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Icon(
                  severidade.icone,
                  color: severidade.cor,
                  size: 24,
                ),
                const SizedBox(width: 12),

                Expanded(
                  child: Text(
                    widget.incidente.titulo,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    )
                  ),
=======
class _IncidenteCardState extends State<IncidenteCard> {
  late StatusIncidente status = widget.incidente.status;

  @override
  Widget build(BuildContext context) {
    final incidente = widget.incidente;
    final corSeveridade = corDaSeveridade(incidente.severidade);
    final corStatus = corDoStatus(status);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Chip(
                  label: Text(
                    textoDaSeveridade(incidente.severidade),
                    style: TextStyle(
                      color: corSeveridade,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  backgroundColor: corSeveridade.withValues(alpha: 0.14),
                  side: BorderSide(color: corSeveridade),
                ),
                Text(
                  incidente.abertoHa,
                  style: TextStyle(color: Colors.grey.shade600),
>>>>>>> main
                ),
              ],
            ),
            const SizedBox(height: 8),
<<<<<<< HEAD
            Text(
              "#${widget.incidente.id} · ${widget.incidente.tipo.rotulo}",
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 13,
              ),
=======
            Row(
              children: [
                Icon(iconeDaSeveridade(incidente.severidade), color: corSeveridade),
                const SizedBox(width: 8),
                Text(
                  incidente.titulo,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              '#${incidente.id} · ${incidente.tipo}',
              style: TextStyle(color: Colors.grey.shade600),
>>>>>>> main
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
<<<<<<< HEAD
                Row(children: [
                    _StatusChip(
                      rotulo: "Severidade: ${severidade.rotulo}",
                      cor: severidade.cor
                    ),
                    const SizedBox(width: 8),
                    _StatusChip(
                      rotulo: _statusAtual.rotulo,
                      cor: _statusAtual.cor,
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _statusAtual = _statusAtual.proximo;
                    });
                  }, 
                  child: Text("Avançar status")
                ),
              ],
            ),
            const Divider(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
                Text(
                  widget.incidente.responsavel ?? "Sem Responsavel",
                  style: TextStyle(
                    fontStyle: widget.incidente.responsavel == null ? FontStyle.italic : FontStyle.normal,
                    color: widget.incidente.responsavel == null ? Colors.grey[500] : Colors.white,
                    fontSize: 13,
                  ),
                ),
                Text( 
                  widget.incidente.tempoDecorrido,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                  ),
                )
              ]
            ),
          ],
        )
=======
                Chip(
                  label: Text(
                    status.texto,
                    style: TextStyle(
                      color: corStatus,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  backgroundColor: Colors.grey.shade200,
                ),
                Text(incidente.responsavel ?? 'Sem responsável'),
              ],
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  status = status.proximo;
                });
              },
              child: const Text('Avançar status'),
            ),
          ],
        ),
>>>>>>> main
      ),
    );
  }
}
<<<<<<< HEAD

class _StatusChip extends StatelessWidget {
  final String rotulo;
  final Color cor;

  const _StatusChip({required this.rotulo, required this.cor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: cor.withValues(alpha: 0.16),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        rotulo,
        style: TextStyle(fontSize: 12, color: cor)
      )
    );
  }
}
=======
>>>>>>> main
