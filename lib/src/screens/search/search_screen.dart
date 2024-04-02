import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_camer/src/models/job/job.dart';
import 'package:job_camer/src/repositories/job_repository.dart';
import 'package:job_camer/src/screens/job/components/job_tile_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _searchController = TextEditingController();

  final String _query = "";
  final List<Job> _jobs = [];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _search();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rechercher un emploi"),
      ),
      body: Column(
        children: [
          CupertinoSearchTextField(
            controller: _searchController,
            placeholder: "Rechercher..",
            suffixIcon: const Icon(Icons.send_outlined),
            onSuffixTap: _search,
            onChanged: _instantSearch,
          ),
          const SizedBox(height: 16),
          Expanded(
            child: _jobs.isEmpty
                ? const Center(child: Text("Aucun job"))
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        ..._jobs.map((e) => JobTileCard(job: e)),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  void _search() {
    _getSearch(_searchController.text);
  }

  void _instantSearch(String value) {
    _getSearch(value);
  }

  void _getSearch(String q) {
    JobRepository.searchJobs(q).then((value) {
      setState(() {
        _jobs.clear();
        _jobs.addAll(value);
      });
    });
  }
}
