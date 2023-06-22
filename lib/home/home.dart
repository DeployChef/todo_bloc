import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/home/bloc/home_bloc.dart';

class LoginPage extends StatelessWidget {
  final usernameField = TextEditingController();
  final passwordField = TextEditingController();

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login todo"),
      ),
      body: BlocProvider(
        create: (context) => HomeBloc(),
        child: BlocBuilder<HomeBloc, HomeState>(
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
