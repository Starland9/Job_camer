import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rechercher un emploi"),
      ),
      body: Column(
        children: [
          CupertinoSearchTextField(
            placeholder: "Rechercher..",
            suffixIcon: const Icon(Icons.send_outlined),
            onSuffixTap: _search,
          ),
          const Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _search() {}
}
