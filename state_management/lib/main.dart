import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/color_shared_state.dart';
import 'package:state_management/keranjang_shared_state.dart';
import 'package:state_management/saldo_shared_state.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: _StateExample(),
  ));
}
// void main() {
//   runApp(());
// }

class _StateExample extends StatefulWidget {
  const _StateExample({Key? key}) : super(key: key);

  @override
  State<_StateExample> createState() => __StateExampleState();
}

class __StateExampleState extends State<_StateExample> {
  TextStyle myTextStyle =
      TextStyle(color: Colors.white, fontWeight: FontWeight.w500);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ColorState(),
        ),
        ChangeNotifierProvider(
          create: (context) => SaldoState(),
        ),
        ChangeNotifierProvider(
          create: (context) => SaldoState1(),
        ),
        ChangeNotifierProvider(
          create: (context) => SaldoState2(),
        ),
        ChangeNotifierProvider(
          create: (context) => KeranjangState(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.grey[900],
          title: Consumer<ColorState>(
              builder: (context, colorstate, child) => Text(
                    "State Management",
                    style: TextStyle(color: colorstate.getColor),
                  )),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Text Tidak Berganti"),
                SizedBox(
                  height: 10,
                ),
                Consumer2<ColorState, SaldoState>(
                  builder: (context, colorstate, saldostate, child) =>
                      Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: colorstate.getColor),
                    child: Center(
                      child: Text(
                        "${saldostate.getSaldo}",
                        style: myTextStyle,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("DeepPurple"),
                    Consumer<ColorState>(
                      builder: (context, colorstate, child) => Switch(
                          value: colorstate.getisOrange,
                          onChanged: ((value) {
                            colorstate.setColor = value;
                          })),
                    ),
                    Text("DeepOrange")
                  ],
                ),
                SizedBox(
                  height: 20,
                ),

                Consumer<ColorState>(
                  builder: (context, colorstate, child) => Consumer<
                          KeranjangState>(
                      builder: (context, keranjangstate, child) => Card(
                            color: colorstate.getColor,
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: 50,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Telur (500) * ${keranjangstate.getQty}",
                                    style: myTextStyle,
                                  ),
                                  Text(
                                    "${keranjangstate.getQty * 500}",
                                    style: myTextStyle,
                                  ),
                                  Consumer3<ColorState, SaldoState,
                                      KeranjangState>(
                                    builder: ((context, colorstate, saldostate,
                                            keranjangstate, child) =>
                                        IconButton(
                                            onPressed: () {
                                              if (saldostate.getSaldo > 0) {
                                                saldostate.kurangiSaldo(500);
                                                keranjangstate
                                                    .tambahkeranjang();
                                              }
                                            },
                                            icon: Icon(
                                                Icons.shopping_cart_outlined))),
                                  ),
                                ],
                              ),
                            ),
                          )),
                ),

                SizedBox(
                  height: 20,
                ),

                // //BATAS SUCI ////

                Consumer2<ColorState, SaldoState1>(
                  builder: (context, colorstate, saldostate1, child) =>
                      Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: colorstate.getColor),
                    child: Center(
                      child: Text(
                        "${saldostate1.getSaldo1}",
                        style: myTextStyle,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("DeepPurple"),
                    Consumer<ColorState>(
                      builder: (context, colorstate, child) => Switch(
                          value: colorstate.getisOrange,
                          onChanged: ((value) {
                            colorstate.setColor = value;
                          })),
                    ),
                    Text("DeepOrange")
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Consumer<ColorState>(
                    builder: (context, colorstate, child) => Consumer<
                            KeranjangState1>(
                        builder: (context, keranjangstate1, child) => Card(
                              color: colorstate.getColor,
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                height: 50,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "Telur (500) x ${keranjangstate1.getQty1}",
                                      style: myTextStyle,
                                    ),
                                    Text(
                                      "${keranjangstate1.getQty1 * 500}",
                                      style: myTextStyle,
                                    ),
                                    Consumer3<ColorState, SaldoState1,
                                        KeranjangState1>(
                                      builder: ((context,
                                              colorstate,
                                              saldostate1,
                                              KeranjangState1,
                                              child) =>
                                          IconButton(
                                              onPressed: () {
                                                if (saldostate1.getSaldo1 > 0) {
                                                  saldostate1.kurangiSaldo(500);
                                                  keranjangstate1
                                                      .tambahkeranjang();
                                                }
                                              },
                                              icon: Icon(Icons
                                                  .shopping_cart_outlined))),
                                    ),
                                  ],
                                ),
                              ),
                            ))),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
        // floatingActionButton: Consumer3<ColorState, SaldoState, KeranjangState>(
        //   builder: ((context, colorstate, saldostate, keranjangstate, child) =>
        //       FloatingActionButton(
        //         backgroundColor: colorstate.getColor,
        //         onPressed: () {
        //           if (saldostate.getSaldo > 0) {
        //             saldostate.kurangiSaldo(500);
        //             keranjangstate.tambahkeranjang();
        //           }
        //         },
        //         child: Icon(Icons.shopping_cart_outlined),
        //       )),
        // ),
      ),
    );
  }
}
