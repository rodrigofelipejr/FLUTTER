import 'package:mobx_sample/pages/login_page.dart';
import 'package:mobx_sample/stores/list_store.dart';
import 'package:mobx_sample/stores/login_store.dart';
import 'package:mobx_sample/widgets/custom_icon_button_widget.dart';
import 'package:mobx_sample/widgets/custom_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ListStore controller = ListStore();
  final TextEditingController controllerText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          margin: const EdgeInsets.fromLTRB(32, 0, 32, 32),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Tarefas',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 32),
                    ),
                    IconButton(
                      icon: Icon(Icons.exit_to_app),
                      color: Colors.white,
                      onPressed: () {
                        // atenção para o liste: false (para que não haja notificação aqui quando houver atualização no provider)
                        Provider.of<LoginStore>(context, listen: false).logout();
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 16,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: <Widget>[
                        Observer(builder: (_) {
                          return CustomTextField(
                            controller: controllerText,
                            hint: 'Tarefa',
                            onChanged: controller.changeNewTodoTitle,
                            suffix: controller.isFormValid
                                ? CustomIconButton(
                                    radius: 32,
                                    iconData: Icons.add,
                                    onTap: () {
                                      controller.addTodo();
                                      controllerText.clear();
                                      // ao terminar de renderizar
                                      // WidgetsBinding.instance.addPostFrameCallback((_) => controllerText.clear());
                                    })
                                : null,
                          );
                        }),
                        const SizedBox(
                          height: 8,
                        ),
                        Expanded(
                          child: Observer(builder: (_) {
                            return ListView.separated(
                              itemCount: controller.todoList.length,
                              itemBuilder: (_, index) {
                                final todo = controller.todoList[index];
                                return Observer(builder: (_) {
                                  return ListTile(
                                    title: Text(
                                      todo.title,
                                      style: TextStyle(
                                        decoration: todo.done ? TextDecoration.lineThrough : null,
                                        color: todo.done ? Colors.grey : Colors.black,
                                      ),
                                    ),
                                    onTap: todo.toogleDone,
                                  );
                                });
                              },
                              separatorBuilder: (_, __) {
                                return Divider();
                              },
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
