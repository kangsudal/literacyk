import 'package:flutter/material.dart';

class SigninView extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final String? email;
  final String? password;
  SigninView({super.key, this.email, this.password});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 50,
        ),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Spacer(),
              Text('당신의 건강 도우미'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '리터러시',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    child: Text(
                      'K',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height:16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: '이메일',
                  hintText: 'example@kangsudal.com',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height:8),
              TextFormField(
                decoration: InputDecoration(
                  labelText: '비밀번호',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text('비밀번호 재설정하기'),
                  )
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    '로그인',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('계정이 없으신가요? '),
                  TextButton(
                    style: ButtonStyle(
                      padding:
                          WidgetStateProperty.all<EdgeInsets>(EdgeInsets.zero),
                    ),
                    onPressed: () {},
                    child: Text(' 회원가입 하기'),
                  ),
                ],
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
