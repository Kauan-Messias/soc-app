import 'package:flutter/material.dart';

// Lista de Possibilidades
enum TipodeIncidente {
  phishing("Phishing"),
  malware("Malware"),
  acessoNaoAutorizado("Acesso não Autorizado"),
  ddos("DDoS"),
  outro("Outro");

  final String rotulo;
  const TipodeIncidente(this.rotulo);
}

enum Severidade {
  critico("Crítico", Icons.dangerous, Colors.red),
  alto("Alto", Icons.warning_amber_rounded, Colors.orange),
  medio("Médio", Icons.info_outline, Colors.amber),
  baixo("Baixo", Icons.shield_outlined, Colors.blue);

  final String rotulo;
  final IconData icone;
  final Color cor;

  const Severidade(this.rotulo, this.icone, this.cor);
}

enum StatusIncidente {
  aberto("Aberto", Colors.red),
  emAndamento("Em andamento", Colors.amber),
  resolvido("Resolvido", Colors.green);

  final String rotulo;
  final Color cor;
  const StatusIncidente(this.rotulo, this.cor);

  StatusIncidente get proximo {
    return switch (this) {
      StatusIncidente.aberto => StatusIncidente.emAndamento,
      StatusIncidente.emAndamento => StatusIncidente.resolvido,
      StatusIncidente.resolvido => StatusIncidente.aberto,
    };
  }
}

// Classe de Dados
class Incidente {
  // Declarando Variaveis
  final String id;
  final String titulo;
  final TipodeIncidente tipo;
  final Severidade severidade;
  final StatusIncidente status;
  final DateTime dataAbertura;
  final String? responsavel;

  // Construotr
  const Incidente({
    required this.id,
    required this.titulo,
    required this.tipo,
    required this.severidade,
    required this.status,
    required this.dataAbertura,
    this.responsavel
  });
  
  //Métodos da Classe
  String get tempoDecorrido {
    final diferenca = DateTime.now().difference(dataAbertura);

    if (diferenca.inDays >= 1) {
      return "há ${diferenca.inDays} ${diferenca.inDays == 1 ? "dia" : "dias"}";
    } else if (diferenca.inHours >= 1) {
      return "há ${diferenca.inHours} h";
    } else {
      final minutos = diferenca.inMinutes;
      return "há ${minutos <= 0 ? 1: minutos} min";
    }
  }
}