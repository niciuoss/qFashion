import 'package:app_qfashion/models/user_manager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:firebase_auth/firebase_auth.dart';
// import 'package:app_qfashion/helpers/firebase_errors.dart';
import 'package:app_qfashion/models/user_data.dart';

import '../../helpers/validators.dart';

class LoginScreen extends StatelessWidget {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldKey = GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Entrar'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: Consumer<UserManager>(
              builder: (_, userManager, __) => ListView(
                  padding: const EdgeInsets.all(16),
                  shrinkWrap: true,
                  children: <Widget>[
                    TextFormField(
                      controller: emailController,
                      enabled: !userManager.loading,
                      decoration: const InputDecoration(hintText: 'E-mail'),
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      validator: (email){
                        if(!emailValid(email!))
                          return 'Email inválido';
                        return null;
                      },
                    ),
                    const SizedBox(height: 16,),
                    TextFormField(
                      controller: passController,
                      enabled: !userManager.loading,
                      decoration: const InputDecoration(hintText: 'Senha'),
                      autocorrect: false,
                      obscureText: true,
                      validator: (pass){
                        if(pass!.isEmpty || pass.length < 6){
                          return 'Senha inválida';
                        } return null;
                      },
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: (){},
                          style: TextButton.styleFrom(padding: EdgeInsets.zero),
                          child: const Text(
                              'Esqueci minha senha'
                          )
                      ),
                    ),
                    const SizedBox(height: 16,),
                    SizedBox(
                      height: 44,
                      child: ElevatedButton(
                        onPressed: userManager.loading ? null : (){
                          if(formKey.currentState!.validate()){
                            userManager.signIn(
                                userData: UserData(
                                    email: emailController.text,
                                    password: passController.text
                                ),
                                onFail: (e){
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('Falha ao Entrar: $e'
                                        ),
                                        backgroundColor: Colors.red,
                                      )
                                  );
                                }
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Theme.of(context).primaryColor),

                        child: userManager.loading ?
                        CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Colors.blueAccent),
                        ) :
                        const Text(
                          'Entrar',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    )
                  ],
                ),
            ),
          ),
        ),
      ),
    );
  }
}
