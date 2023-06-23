import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  //const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const int max_contagem = 10;
  int contagem = 0;

  void btn_inc() {
    setState(() {
      //atualiza tela inteira
      contagem++;
    });
  }

  void btn_dec() {
    setState(() {
      //atualiza tela inteira
      contagem--;
    });
  }

  bool get isEmpty => contagem <= 0;

  bool get isFull => contagem >= max_contagem;

  String atualiza_Texto() {
    if (isFull) {
      return 'Lotado!!!';
    } else if (isEmpty) {
      return 'Está vazio\nPode entrar';
    } else {
      return 'Pode entrar!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            //image: AssetImage('assets/bg/salao-para-casamento.jpg'),
            image: AssetImage('assets/bg/salao2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 98),
              child: Stack(
                children: [
                  Text(
                    atualiza_Texto(),
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w700,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 2
                        ..color = Colors.white,
                    ),
                  ),
                  Text(
                    atualiza_Texto(),
                    style: TextStyle(
                      color: isFull ? Colors.red : Colors.black,
                      fontSize: 42,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Text(
                '$contagem',
                style: TextStyle(
                  color: isFull ? Colors.red : Colors.white,
                  fontSize: 100,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //BUTTON SAIU
                TextButton(
                  onPressed: isEmpty ? null : btn_dec,
                  style: TextButton.styleFrom(
                    backgroundColor:
                        isEmpty ? Colors.white.withOpacity(0.4) : Colors.white,
                    fixedSize: const Size(100, 100),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)),
                    foregroundColor: Colors.black,
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Image(
                            image: AssetImage('assets/icon/del-24.png')),
                        Text('Saiu',
                            style: TextStyle(
                              color: isEmpty
                                  ? Colors.black.withOpacity(0.4)
                                  : Colors.black,
                              fontSize: 16,
                            ))
                      ]),
                ),
                const SizedBox(
                  width: 32,
                ),
                //BUTTON ENTROU
                TextButton(
                  onPressed: isFull ? null : btn_inc,
                  style: TextButton.styleFrom(
                    backgroundColor:
                        isFull ? Colors.white.withOpacity(0.4) : Colors.white,
                    fixedSize: const Size(100, 100),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)),
                    foregroundColor: Colors.black,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Image(
                          image: AssetImage(
                              'assets/icon/icons8-adicionar-24.png')),
                      Text('Entrou',
                          style: TextStyle(
                            color: isFull
                                ? Colors.black.withOpacity(0.4)
                                : Colors.black,
                            fontSize: 16,
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
