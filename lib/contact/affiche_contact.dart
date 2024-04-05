import 'package:flutter/material.dart';
import 'package:mon_projet/contact/data.dart';

class Mescontacts extends StatefulWidget {
  const Mescontacts({super.key});

  @override
  State<Mescontacts> createState() => _MescontactsState();
}

class _MescontactsState extends State<Mescontacts> {
  //List<dynamic> contacts = [];
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _prenomController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _numeroController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //contacts = getContact();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void afficheMessage(bool result) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          if (result) {
            Navigator.of(context).pop();
            return Dialog(
              shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: Container(
                padding: const EdgeInsets.all(5),
                height: 50,
                child: const Center(
                  child: Text(
                    "Contact bien enregitré",
                    style: TextStyle(color: Colors.green),
                  ),
                ),
              ),
            );
          } else {
            return Dialog(
              shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Container(
                height: 50,
                child: const Center(
                  child: Text(
                    "Erreur dans les donnnes",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            );
          }
        });
    // Navigator.of(context).pop();
  }

  void afficheContact(contact) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape:
                BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: SizedBox(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: Table(
                    border: TableBorder.all(),
                    defaultColumnWidth: const FixedColumnWidth(150),
                    children: [
                      TableRow(children: [
                        const TableCell(
                            child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Nom'),
                        )),
                        TableCell(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(contact['nom']),
                        ))
                      ]),
                      TableRow(children: [
                        const TableCell(
                            child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Prenom'),
                        )),
                        TableCell(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(contact['prenom']),
                        ))
                      ]),
                      TableRow(children: [
                        const TableCell(
                            child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Numero'),
                        )),
                        TableCell(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(contact['numero']),
                        ))
                      ]),
                      TableRow(children: [
                        const TableCell(
                            child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Email'),
                        )),
                        TableCell(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(contact['email']),
                        ))
                      ]),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  void afficheForm() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: AlertDialog(
              title: const Center(child: Text("Nouveau contact")),
              content: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15)),
                height: 400,
                width: 300,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: _nomController,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.person_2_sharp,
                            color: Colors.blue,
                          ),
                          enabledBorder:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          hintText: 'Nom'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: _prenomController,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.blue,
                          ),
                          enabledBorder:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          hintText: 'Prenom'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.blue,
                          ),
                          enabledBorder:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          hintText: 'Email'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: _numeroController,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Colors.blue,
                          ),
                          enabledBorder:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          hintText: 'Numero'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () async {
                            final data = [
                              _nomController.text,
                              _prenomController.text,
                              _emailController.text,
                              _numeroController.text
                            ];
                            final result = await postContact(data);
                            afficheMessage(result);
                          },
                          child: const Text(
                            'Enregistrer',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        TextButton(
                          onPressed: () => {Navigator.of(context).pop()},
                          child: const Text('Annuler',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.red)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 15, 0, 10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: TextButton(
                onPressed: afficheForm,
                child: const Text('Ajouter un contact')),
          ),
          Expanded(
            child: FutureBuilder<List<dynamic>>(
              future: getContact(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<dynamic> contacts = snapshot.data!;
                  return ListView.builder(
                    itemCount: contacts.length,
                    itemBuilder: (context, index) {
                      final contact = contacts[index];
                      return Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromRGBO(238, 238, 238, 1))),
                        child: GestureDetector(
                          onTap: () => afficheContact(contact),
                          child: ListTile(
                            leading: Text(
                              contact['nom'],
                              style: const TextStyle(fontSize: 15),
                            ),
                            title: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 6),
                              child: Text(contact['prenom']),
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () async {
                                final confirmed = await showDialog<bool>(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text('Delete contact?'),
                                    content: const Text(
                                        'Are you sure you want to delete this contact?'),
                                    actions: [
                                      TextButton(
                                        child: const Text('Cancel'),
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                      ),
                                      TextButton(
                                        child: const Text('Delete'),
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                      ),
                                    ],
                                  ),
                                );

                                if (confirmed == true) {
                                  await deleleContact(contact['id'].toString());
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text(
                                      'Contact supprimer avec succes',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.amber),
                                    ),
                                    duration: Duration(seconds: 3),
                                  ));
                                  // Refresh the contact list after deletion
                                  setState(() {});
                                }
                              },
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
