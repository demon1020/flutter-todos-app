part of todo;

class CustomCard extends StatelessWidget {
  final Todo? todo;

  CustomCard({required this.todo,});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextStyle title_style = TextStyle(fontWeight: FontWeight.bold, fontSize: size.longestSide * 0.03);
    TextStyle desc_style = TextStyle(fontWeight: FontWeight.bold, fontSize: size.longestSide * 0.02);

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Container(
        height: size.height * 0.12,
        alignment: Alignment.center,
        child: ListTile(
          title: Text(
            todo!.title,
            style: title_style,
          ),
          subtitle: Text(
            todo!.description,
            style: desc_style,
          ),
          trailing: IconButton(
            iconSize: size.longestSide * 0.05,
            icon: Icon(Icons.delete),
            color: Color(0xFF8D1313),
            onPressed: () {
              Provider.of<TodosProvider>(context, listen: false).removeTodo(todo!);
            },
          ),
        ),
      ),
    );
  }
}
