import 'package:app_movie/domain/entity/media.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final media = ModalRoute.of(context)!.settings.arguments as Media;
    return Scaffold(
      appBar: AppBar(title: Text(media.name ?? '')),
      body: Column(
        children: [
          Image.asset(
            'lib/ui/assets/images/imagem-teste.png',
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          ),
          const Text('Titulo'),
          const Text('Sub titulo'),
          const Text('Descrição'),
          Row(
            children: [
              Container(
                color: Colors.blue,
                width: 150,
                height: 46,
                margin: const EdgeInsets.only(right: 10),
                child: const Text('Assista'),
              ),
              Container(
                color: Colors.green,
                width: 150,
                height: 46,
                margin: const EdgeInsets.only(right: 10),
                child: const Text('Minha lista'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
