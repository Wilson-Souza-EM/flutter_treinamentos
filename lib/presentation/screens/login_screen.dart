
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_treinamento/presentation/bloc/aplication/aplication_bloc.dart';
import 'package:flutter_treinamento/presentation/bloc/aplication/aplication_event.dart';
import 'package:flutter_treinamento/presentation/bloc/login/login_bloc.dart';
import 'package:flutter_treinamento/presentation/bloc/login/login_event.dart';
import 'package:flutter_treinamento/presentation/bloc/login/login_state.dart';

import '../../injector.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usarioController = TextEditingController();
  final _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<LoginBloc>(
        create: (context) => getIt(),
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            if (state.isSucesso) {
              BlocProvider.of<ApplicationBloc>(context).add(
                ApplicationLoginEvent(token: state.token!),
              );
            }
            return Container(
//              color: Colors.black,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _usarioController,
                      decoration: const InputDecoration(
                        labelText: 'Nome',
                        labelStyle: TextStyle(
                          color: Colors.blue,
                          fontSize: 17,
                        ),
                        suffixIcon: Icon(Icons.person_outline),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _senhaController,
                      decoration: const InputDecoration(
                        labelText: 'Senha',
                        labelStyle: TextStyle(
                          color: Colors.blue,
                          fontSize: 17,
                        ),
                        suffixIcon: Icon(Icons.vpn_key),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(

                      color: Colors.blue,
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () => BlocProvider.of<LoginBloc>(context).add(
                          LoginPressedButtonEvent(
                            usuario: _usarioController.text,
                            senha: _senhaController.text,
                          ),
                        ),
                        child: Text('Realizar login', style: TextStyle(color: Colors.white),),
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
