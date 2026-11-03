import 'package:flutter/material.dart';
import '../models/incidente.dart';

class NovoIncidenteScreen extends StatefulWidget {
  final int proximoNumeroId;

  const NovoIncidenteScreen({super.key, required this.proximoNumeroId});

  @override
  State<NovoIncidenteScreen> createState() => _NovoIncidenteScreenState();
}

class _NovoIncidenteScreenState extends State<NovoIncidenteScreen> {
  final _formKey = GlobalKey<FormState>();
  final _tituloController = TextEditingController();
  final _descricaoController = TextEditingController();
  final _ipController = TextEditingController();

  String _tipoSelecionado = 'Outro';
  Severidade _severidadeSelecionada = Severidade.medio;

  @override
  void dispose() {
    _tituloController.dispose();
    _descricaoController.dispose();
    _ipController.dispose();
    super.dispose();
  }

  String? _validarTitulo(String? valor) {
    if (valor == null || valor.trim().isEmpty) {
      return 'Este campo é obrigatório.';
    }
    if (valor.trim().length < 5) {
      return 'O título tem pelo menos 5 caracteres.';
    }
    return null;
  }

  String? _validarDescricao(String? valor) {
    if (valor == null || valor.trim().isEmpty) {
      return 'Este campo é obrigatório.';
    }
    if (valor.trim().length < 20) {
      return 'A descrição deve ter pelo menos 20 caracteres.';
    }
    return null;
  }

  String? _validarIp(String? valor) {
    if (valor == null || valor.trim().isEmpty) {
      return null;
    }

    final partes = valor.trim().split('.');
    if (partes.length != 4) {
      return 'Cada número do IP vai de 0 a 255.';
    }

    for (var parte in partes) {
      final numero = int.tryParse(parte);
      if (numero == null || numero < 0 || numero > 255) {
        return 'Cada número do IP vai de 0 a 255.';
      }
      if (parte.length > 1 && parte.startsWith('0')) {
        return 'Cada número do IP vai de 0 a 255.';
      }
    }

    return null;
  }

  void _criarIncidente() {
    if (_formKey.currentState!.validate()) {
      final novoIncidente = Incidente(
        id: 'INC-${widget.proximoNumeroId}',
        titulo: _tituloController.text.trim(),
        tipo: _tipoSelecionado,
        severidade: _severidadeSelecionada,
        status: StatusIncidente.aberto,
        abertoEm: DateTime.now(), 
        descricao: _descricaoController.text.trim(),
        ipRelacionado: _ipController.text.trim().isEmpty ? null : _ipController.text.trim(),
      );

      Navigator.pop(context, novoIncidente);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Novo incidente')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Campo Título
            TextFormField(
              controller: _tituloController,
              decoration: const InputDecoration(
                labelText: 'Título',
                errorMaxLines: 2,
              ),
              validator: _validarTitulo,
            ),
            const SizedBox(height: 16),

            // Seção Tipo (ChoiceChip)
            const Text('Tipo', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: [
                'Phishing',
                'Malware',
                'DDoS',
                'Acesso não autorizado',
                'Outro',
              ].map((tipo) {
                return ChoiceChip(
                  label: Text(tipo),
                  selected: _tipoSelecionado == tipo,
                  onSelected: (_) {
                    setState(() {
                      _tipoSelecionado = tipo;
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 16),

            // Seção Severidade (ChoiceChip)
            const Text('Severidade', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: Severidade.values.map((sev) {
                String textoSev = '';
                switch (sev) {
                  case Severidade.critico:
                    textoSev = 'Crítico';
                    break;
                  case Severidade.alto:
                    textoSev = 'Alto';
                    break;
                  case Severidade.medio:
                    textoSev = 'Médio';
                    break;
                  case Severidade.baixo:
                    textoSev = 'Baixo';
                    break;
                }
                return ChoiceChip(
                  label: Text(textoSev),
                  selected: _severidadeSelecionada == sev,
                  onSelected: (_) {
                    setState(() {
                      _severidadeSelecionada = sev;
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 16),

            // Campo Descrição
            TextFormField(
              controller: _descricaoController,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: 'Descrição',
                errorMaxLines: 2,
              ),
              validator: _validarDescricao,
            ),
            const SizedBox(height: 16),

            // Campo IP Relacionado
            TextFormField(
              controller: _ipController,
              decoration: const InputDecoration(
                labelText: 'IP relacionado (opcional)',
                errorMaxLines: 2,
              ),
              validator: _validarIp,
            ),
            const SizedBox(height: 24),

            // Botão Criar Incidente
            ElevatedButton(
              onPressed: _criarIncidente,
              child: const Text('Criar incidente'),
            ),
            const SizedBox(height: 8),

            // Botão Cancelar
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar'),
            ),
          ],
        ),
      ),
    );
  }
}