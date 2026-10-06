import 'package:flutter/material.dart';
import "../models/incidentes.dart";

// Classe de Widgets
class IncidenteCard extends StatefulWidget {
  final Incidente incidente;

  const IncidenteCard({super.key, required this.incidente});

  @override
  State<IncidenteCard> createState() => _IncidenteCardState();
}

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
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              "#${widget.incidente.id} · ${widget.incidente.tipo.rotulo}",
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
      ),
    );
  }
}

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