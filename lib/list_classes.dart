import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/class.dart';
import 'confs/routes.dart';

class ListClasses extends StatefulWidget {
  const ListClasses({super.key});

  @override
  State<ListClasses> createState() => _ListClassesState();
}

class _ListClassesState extends State<ListClasses> {
  var classes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Minhas aulas"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(ADD_CLASS_PAGE);
                  Future future =
                      Navigator.of(context).pushNamed(ADD_CLASS_PAGE);
                  future.then((myClass) {
                    if (myClass != null) {
                      setState(() {
                        classes.add(myClass);
                      });
                    }
                  });
                },
                icon: const Icon(Icons.add_circle))
          ],
        ),
        body: ListView.separated(
            itemBuilder: (context, index) => buildItem(classes[index]),
            separatorBuilder: (context, index) => const Divider(height: 1),
            itemCount: classes.length));
  }

  Widget buildItem(MyClass myClass) => ListTile(
      leading: const Icon(Icons.favorite_outline),
      // leading: myClass.like
      //     ? const Icon(Icons.favorite)
      //     : const Icon(Icons.favorite_outline),
      title: Text(myClass.name),
      subtitle: Text(myClass.dayOfWeek),
      trailing: Text(myClass.local)
      // onLongPress: () {
      //   setState(() {
      //     myClass.like = !myClass.like;
      //   });
      // },
      );
}
