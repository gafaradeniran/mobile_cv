import 'package:flutter/material.dart';
import 'package:mobile_cv/widgets/button.dart';
import 'package:mobile_cv/menu_screens/home.dart';
import 'package:mobile_cv/constants/styles.dart';

class EditDetails extends StatefulWidget {
  const EditDetails(
      {super.key,
      required this.fullName,
      required this.slackName,
      required this.githubHandle,
      required this.bio,
      required this.hobbies,
      required this.skills});
  final String fullName;
  final String slackName;
  final String githubHandle;
  final String bio;
  final String hobbies;
  final String skills;

  @override
  State<EditDetails> createState() => _EditDetailsState();
}

class _EditDetailsState extends State<EditDetails> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController slackNameController = TextEditingController();
  TextEditingController githubHandleController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController hobbiesController = TextEditingController();
  TextEditingController skillsController = TextEditingController();

  @override
  void initState() {
    fullNameController.text = widget.fullName;
    slackNameController.text = widget.slackName;
    githubHandleController.text = widget.githubHandle;
    bioController.text = widget.bio;
    hobbiesController.text = widget.hobbies;
    skillsController.text = widget.skills;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    fullNameController.dispose();
    slackNameController.dispose();
    githubHandleController.dispose();
    bioController.dispose();
    hobbiesController.dispose();
    skillsController.dispose();
  }

  final snackBar = const SnackBar(
    content: Text(
      'CV updated successfully',
      style: cvBody,
    ),
    duration: Duration(seconds: 2),
    elevation: 1,
  );

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit CV', style: headerStyle),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: fullNameController,
                decoration: const InputDecoration(
                    labelText: 'Full Name', hintStyle: cvHeader),
              ),
              TextFormField(
                controller: slackNameController,
                decoration: const InputDecoration(
                    labelText: 'Slack Name', hintStyle: cvHeader),
              ),
              TextFormField(
                controller: githubHandleController,
                decoration: const InputDecoration(
                    labelText: 'GitHub Handle', hintStyle: cvHeader),
              ),
              TextFormField(
                controller: bioController,
                maxLines: 4,
                decoration: const InputDecoration(
                    labelText: 'Bio', hintStyle: cvHeader),
              ),
              TextFormField(
                controller: hobbiesController,
                decoration: const InputDecoration(
                    labelText: 'Hobbies', hintStyle: cvHeader),
              ),
              TextFormField(
                controller: skillsController,
                decoration: const InputDecoration(
                    labelText: 'Skills', hintStyle: cvHeader),
                maxLines: 2,
              ),
              SizedBox(height: height * 0.035),
              Center(
                child: button(
                    'Update CV', const Icon(Icons.update, color: Colors.white),
                    () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => Homepage(
                                fullName: fullNameController.text,
                                slackName: slackNameController.text,
                                githubHandle: githubHandleController.text,
                                bio: bioController.text,
                                hobbies: hobbiesController.text,
                                skills: skillsController.text,
                              ))).then((value) =>
                      ScaffoldMessenger.of(context).showSnackBar(snackBar));
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
