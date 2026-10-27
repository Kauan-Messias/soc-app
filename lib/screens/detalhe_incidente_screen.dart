import 'package:flutter/material.dart';
import '../models/incidente.dart';

class DetalheIncidenteScreen extends StatefulWidget {
  final Incidente incidente;

  const DetalheIncidenteScreen({
    super.key,
    required this.incidente,
  });

  @override
  State<DetalheIncidenteScreen> createState() => _DetalheIncidenteScreenState();
}

class _DetalheIncidenteScreenState extends State<DetalheIncidenteScreen> {
  late StatusIncidente _statusSelecionado;

  @override
  void initState() {
    super.initState();
    _statusSelecionado = widget.incidente.status;
  }

  @override
  Widget build(BuildContext context) {
    final incidente = widget.incidente;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhe — Analista'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              incidente.titulo,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              '#${incidente.id} · ${incidente.tipo}',
              style: TextStyle(color: Colors.grey.shade600),
            ),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 8),
            const Text(
              'Descrição do Incidente',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 4),
            Text(incidente.descricao ?? 'Sem descrição detalhada.'),
            const SizedBox(height: 16),
            if (incidente.ipRelacionado != null) ...[
              const Text(
                'IP Relacionado',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 4),
              Text(incidente.ipRelacionado!),
              const SizedBox(height: 16),
            ],
            const Divider(),
            const SizedBox(height: 16),
            const Text(
              'Alterar Status do Incidente',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              children: StatusIncidente.values.map((status) {
                return ChoiceChip(
                  label: Text(status.texto),
                  selected: _statusSelecionado == status,
                  onSelected: (selected) {
                    if (selected) {
                      setState(() {
                        _statusSelecionado = status;
                      });
                    }
                  },
                );
              }).toList(),
            ),
            //const SizedBox(32),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, _statusSelecionado);
                },
                child: const Text('Salvar atualização'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}