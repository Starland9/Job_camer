import 'package:faker/faker.dart' as fk;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:job_camer/src/models/job/job.dart';
import 'package:job_camer/src/repositories/job_repository.dart';
import 'package:job_camer/src/shared/utils/methods.dart';
import 'package:job_camer/src/shared/widgets/text_field.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:uuid/uuid.dart';

class CreateJobScreen extends StatefulWidget {
  const CreateJobScreen({super.key});

  @override
  State<CreateJobScreen> createState() => _CreateJobScreenState();
}

class _CreateJobScreenState extends State<CreateJobScreen> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _companyController = TextEditingController();
  final _locationController = TextEditingController();
  final _requirementController = TextEditingController();
  final _salaryController = TextEditingController();

  final JobType _type = JobType.fullTime;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _companyController.dispose();
    _locationController.dispose();
    _requirementController.dispose();
    _salaryController.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Créer un emploi"),
        ),
        body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  CustomTexTField(
                    hintText: "Titre",
                    controller: _titleController,
                    validator: ValidationBuilder().required().build(),
                  ),
                  const SizedBox(height: 10),
                  CustomTexTField(
                    hintText: 'Description',
                    controller: _descriptionController,
                    maxLines: 5,
                    validator: ValidationBuilder().required().build(),
                  ),
                  const SizedBox(height: 10),
                  CustomTexTField(
                      hintText: 'Companie',
                      controller: _companyController,
                      validator: ValidationBuilder().required().build()),
                  const SizedBox(height: 10),
                  CustomTexTField(
                    hintText: 'Compétences',
                    controller: _requirementController,
                    maxLines: 5,
                    validator: ValidationBuilder().required().build(),
                  ),
                  const SizedBox(height: 10),
                  CustomTexTField(
                    hintText: 'Localisation',
                    controller: _locationController,
                    validator: ValidationBuilder().required().build(),
                  ),
                  const SizedBox(height: 10),
                  CustomTexTField(
                    hintText: 'Salaire (FCFA)',
                    controller: _salaryController,
                    validator:
                        ValidationBuilder().minLength(5).maxLength(20).build(),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 20),
                  CupertinoButton.filled(
                    onPressed: _createJob,
                    child: const Text("Valider "),
                  )
                ],
              ),
            )),
      ),
    );
  }

  void _createJob() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    context.loaderOverlay.show();
    JobRepository.addJob(
      Job(
        id: const Uuid().v4(),
        title: _titleController.text,
        description: _descriptionController.text,
        company: _companyController.text,
        companyLogo: fk.faker.image.image(keywords: ["company", "job", "tech"]),
        location: _locationController.text,
        salary: _salaryController.text,
        requirements: _requirementController.text,
        type: JobType.fullTime,
      ),
    ).then((value) {
      context.loaderOverlay.hide();
      ToastUtils.showGoodToast("Job créé avec succes ✅");
    });
  }
}
