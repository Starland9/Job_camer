import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_camer/src/shared/widgets/text_field.dart';

class CreateJobScreen extends StatefulWidget {
  const CreateJobScreen({super.key});

  @override
  State<CreateJobScreen> createState() => _CreateJobScreenState();
}

class _CreateJobScreenState extends State<CreateJobScreen> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Créer un emploi"),
      ),
      body: Form(
          child: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            CustomTexTField(
              hintText: "Titre",
              controller: _titleController,
            ),
            const SizedBox(height: 10),
            CustomTexTField(
                hintText: 'Description', controller: _descriptionController),
            const SizedBox(height: 10),
            CustomTexTField(
                hintText: 'Companie', controller: _descriptionController),
            const SizedBox(height: 10),
            CustomTexTField(
              hintText: 'Compétences',
              controller: _descriptionController,
              maxLines: 5,
            ),
            const SizedBox(height: 10),
            CustomTexTField(
                hintText: 'Date limite', controller: _descriptionController),
            const SizedBox(height: 10),
            const SizedBox(height: 10),
            const SizedBox(height: 20),
            CupertinoButton.filled(
                onPressed: _createJob, child: const Text("Valider "))
          ],
        ),
      )),
    );
  }

  void _createJob() {}
}
