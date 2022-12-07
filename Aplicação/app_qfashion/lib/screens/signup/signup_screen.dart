import 'package:app_qfashion/helpers/validators.dart';
import 'package:app_qfashion/models/user_data.dart';
import 'package:app_qfashion/models/user_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldKey = GlobalKey<ScaffoldMessengerState>();

  final UserData userData = UserData(email: '', password: '', confirmPassword: '', name: '', id: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Criar Conta'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: Consumer<UserManager>(
              builder: (_, userManager, __){
                return ListView(
                  padding: const EdgeInsets.all(16),
                  shrinkWrap: true,
                  children: <Widget>[
                    TextFormField(
                      decoration: const InputDecoration(hintText: 'Nome Completo'),
                      enabled: !userManager.loading,
                      validator: (name){
                        if(name!.isEmpty)
                          return 'Campo Obrigatório';
                        else if (name.trim().split(' ').length <= 1)
                          return 'Preencha com seu nome completo';
                        return null;
                      },
                      onSaved: (name) => userData.name = name!,
                    ),
                    const SizedBox(height: 16,),
                    TextFormField(
                      decoration: const InputDecoration(hintText: 'E-mail'),
                      keyboardType: TextInputType.emailAddress,
                      validator: (email){
                        enabled: !userManager.loading;
                        if(email!.isEmpty)
                          return 'Campo Obrigatório';
                        else if (!emailValid(email))
                          return 'E-mail inválido';
                        return null;
                      },
                      onSaved: (email) => userData.email = email!,
                    ),
                    const SizedBox(height: 16,),
                    TextFormField(
                      decoration: const InputDecoration(hintText: 'Senha'),
                      obscureText: true,
                      enabled: !userManager.loading,
                      validator: (pass){
                        if(pass!.isEmpty)
                          return 'Campo Obrigatório';
                        else if(pass.length < 6)
                          return 'Senha muito curta';
                        return null;
                      },
                      onSaved: (pass) => userData.password = pass!,
                    ),
                    const SizedBox(height: 16,),
                    TextFormField(
                      decoration: const InputDecoration(hintText: 'Repita a Senha'),
                      obscureText: true,
                      enabled: !userManager.loading,
                      validator: (pass){
                        if(pass!.isEmpty)
                          return 'Campo Obrigatório';
                        else if(pass.length < 6)
                          return 'Senha muito curta';
                        return null;
                      },
                      onSaved: (pass) => userData.confirmPassword = pass!,
                    ),
                    const SizedBox(height: 16,),
                    SizedBox(
                      height: 44,
                      child: ElevatedButton(
                        onPressed: userManager.loading ? null : (){
                          if(formKey.currentState!.validate()){
                            formKey.currentState!.save();
                            if(userData.password != userData.confirmPassword){
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: const Text('As senhas não são iguais'),
                                    backgroundColor: Colors.red,
                                  )
                              );
                              return;
                            }
                            userManager.signUp(
                                user: userData,
                                onFail: (e){
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('Falha ao Cadastrar: $e'
                                        ),
                                        backgroundColor: Colors.red,
                                      )
                                  );
                                },
                                onSuccess: (){
                                  Navigator.of(context).pop();
                                }
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).primaryColor),
                        child: userManager.loading ?
                        CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Colors.white),
                        )
                        : const Text(
                            'Criar Conta',
                            style: TextStyle(
                                fontSize: 18
                            )
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
