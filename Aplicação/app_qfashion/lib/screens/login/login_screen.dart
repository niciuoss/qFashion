import 'package:flutter/material.dart';

import '../../helpers/validators.dart';

class LoginScreen extends StatelessWidget {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entrar'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: ListView(
              padding: const EdgeInsets.all(16),
              shrinkWrap: true,
              children: <Widget>[
                TextFormField(
                  controller: emailController,
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
                    onPressed: (){
                      if(formKey.currentState!.validate()){
                        print(emailController.text);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).primaryColor),
                    child: const Text(
                      'Entrar',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      )

    );

  }
}
