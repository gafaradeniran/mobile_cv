import 'package:flutter/material.dart';
import 'package:mobile_cv/widgets/button.dart';
import 'package:mobile_cv/menu_screens/edit_details.dart';
import 'package:mobile_cv/constants/styles.dart';

class Homepage extends StatelessWidget {
  final String fullName;
  final String slackName;
  final String githubHandle;
  final String bio;
  final String hobbies;
  final String skills;
  const Homepage({
    super.key,
    this.fullName = 'Adeniran Gafar O.',
    this.slackName = 'Gafar Adeniran',
    this.githubHandle = '@gafaradeniran',
    this.bio =
        'I am a Mobile App Developer (Flutter/Dart). I have good problem solving skils and I am always ready to learn more',
    this.hobbies = 'Coding, reading and travelling',
    this.skills = 'HTML, CSS, JavaScript',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mobile CV App'),
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text('Curriculum Vitae', style: headerStyle),
              ),
              const SizedBox(height: 15),
              ListTile(
                title: const Text('Full Name', style: cvHeader),
                subtitle: Text(fullName, style: cvBody),
                leading: const Icon(Icons.person),
              ),
              ListTile(
                title: const Text('Slack Name', style: cvHeader),
                subtitle: Text(slackName, style: cvBody),
                leading: const Icon(Icons.chat),
              ),
              ListTile(
                title: const Text('GitHub Handle', style: cvHeader),
                subtitle: Text(githubHandle, style: cvBody),
                leading: const Icon(Icons.code),
              ),
              const Divider(),
              const Text(
                'Bio',
                style: cvHeader,
              ),
              Text(bio, style: cvBody, softWrap: true),
              const Divider(),
              const Text('Hobbies', style: cvHeader),
              Text(hobbies, style: cvBody, softWrap: true),
              const Divider(),
              const Text('Skills', style: cvHeader),
              Text(skills, style: cvBody, softWrap: true),
              const Divider(),
              const SizedBox(height: 20),
              Center(
                child: SizedBox(
                    width: 200,
                    height: 45,
                    child: button(
                        'Edit CV',
                        const Icon(
                          Icons.edit,
                          color: Colors.white,
                        ), () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => EditDetails(
                                  fullName: fullName,
                                  slackName: slackName,
                                  githubHandle: githubHandle,
                                  bio: bio,
                                  hobbies: hobbies,
                                  skills: skills)));
                    })),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
