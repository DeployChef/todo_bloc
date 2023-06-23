import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/home/bloc/home_bloc.dart';
import 'package:todo_bloc/services/auth.dart';
import 'package:todo_bloc/services/todo.dart';
import 'package:todo_bloc/todos/todos.dart';

class HomePage extends StatelessWidget {
  final usernameField = TextEditingController();
  final passwordField = TextEditingController();

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login todo"),
      ),
      body: BlocProvider(
        create: (context) => HomeBloc(
          RepositoryProvider.of<AuthService>(context),
          RepositoryProvider.of<TodoService>(context),
        )..add(RegisterServiceEvent()),
        child: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state is SuccessfullLoginState) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => TodosPage(state.username),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is HomeInitial) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    TextField(
                      controller: usernameField,
                      decoration: const InputDecoration(
                        labelText: "Username ",
                      ),
                    ),
                    TextField(
                      controller: passwordField,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: "Password",
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => BlocProvider.of<HomeBloc>(context).add(LoginEvent(usernameField.text, passwordField.text)),
                      child: Text("Login"),
                    ),
                  ],
                ),
              );
            }

            return Container();
          },
        ),
      ),
    );
  }
}
