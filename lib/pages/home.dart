import 'package:flutter/material.dart';




class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {

  var _userToDo;
  List todoList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    todoList.addAll(['Buy Milk', 'Купить картошку','Купить масло','Купить хлеб']);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Список дел'),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body:
      ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (BuildContext context, int index){
            return Dismissible(
                key: Key(todoList[index]),
                child: Container(
                  child: Card(
                    child: ListTile(
                        title: Text(todoList[index]),
                        trailing: IconButton(
                          icon: Icon(Icons.delete_sweep, size: 20, color: Colors.deepOrange),
                          onPressed: (){
                            setState(() {
                              todoList.removeAt(index);
                            });
                          },
                        )
                    ),
                    margin: EdgeInsets.only(top: 20),

                    color: Colors.grey[200],

                  ),
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                ),
              onDismissed: (direction){
                  // if(direction == DismissDirection.endToStart)
                setState(() {
                  todoList.removeAt(index);
                });
              },
            );
          }
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        onPressed: (){
          showDialog(context: context, builder: (BuildContext  context){
            return AlertDialog(
              title: Text('Добавить элемент'),
              content: TextField(
                onChanged: (String value){
                  _userToDo = value;
                },

              ),
              actions: [
                ElevatedButton(
                  onPressed: (){
                    setState(() {
                      todoList.add(_userToDo);
                    });
                    Navigator.of(context).pop();
                  },
                  child: Text('Добавить')),
              ],
            );
          });
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        )

      ),
    );
  }
}
