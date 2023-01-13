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
            create: (context) => ColorState1(),
          ),
          ChangeNotifierProvider(
            create: (context) => ColorState2(),
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
          ChangeNotifierProvider(
            create: (context) => KeranjangState1(),
          ),
          ChangeNotifierProvider(
            create: (context) => KeranjangState2(),
          ),
        ],
        child: Consumer2<ColorState1, ColorState2>(
          builder: (context, colorstate1, colorstate2, child) => Scaffold(
            backgroundColor: colorstate2.getColorThrd,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.grey[900],
              title: Consumer2<ColorState, ColorState1>(
                  builder: (context, colorstate, colorstate1, child) => Text(
                        "State Management",
                        style: TextStyle(color: colorstate.getColor),
                      )),
            ),
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Perkalian"),
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
                      builder: (context, colorstate, child) =>
                          Consumer<KeranjangState>(
                              builder: (context, keranjangstate, child) => Card(
                                    color: colorstate.getColor,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      height: 50,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            "Telur (500) x ${keranjangstate.getQty}",
                                            style: myTextStyle,
                                          ),
                                          Text(
                                            "${keranjangstate.getQty * 500}",
                                            style: myTextStyle,
                                          ),
                                          Consumer3<ColorState, SaldoState,
                                              KeranjangState>(
                                            builder: ((context,
                                                    colorstate,
                                                    saldostate,
                                                    keranjangstate,
                                                    child) =>
                                                IconButton(
                                                    onPressed: () {
                                                      if (saldostate.getSaldo >
                                                          0) {
                                                        saldostate
                                                            .kurangiSaldo(500);
                                                        keranjangstate
                                                            .tambahkeranjang();
                                                      }
                                                    },
                                                    icon: Icon(Icons
                                                        .shopping_cart_outlined))),
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

                    Consumer2<ColorState1, SaldoState1>(
                      builder: (context, colorstate1, saldostate1, child) =>
                          Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: colorstate1.getColorScnd),
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
                        Text("GreenAccent"),
                        Consumer<ColorState1>(
                          builder: (context, colorstate1, child) => Switch(
                              value: colorstate1.getisBlue,
                              onChanged: ((value) {
                                colorstate1.setColorScnd = value;
                              })),
                        ),
                        Text("BlueAccent")
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Consumer<ColorState1>(
                        builder: (context, colorstate1, child) => Consumer<
                                KeranjangState1>(
                            builder: (context, keranjangstate1, child) => Card(
                                  color: colorstate1.getColorScnd,
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    height: 50,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          "Telur (500) + ${keranjangstate1.getQty1}",
                                          style: myTextStyle,
                                        ),
                                        Text(
                                          "${keranjangstate1.getQty1 + 500}",
                                          style: myTextStyle,
                                        ),
                                        Consumer3<ColorState1, SaldoState1,
                                            KeranjangState1>(
                                          builder: ((context,
                                                  colorstate1,
                                                  saldostate1,
                                                  keranjangstate1,
                                                  child) =>
                                              IconButton(
                                                  onPressed: () {
                                                    if (saldostate1.getSaldo1 >
                                                        0) {
                                                      saldostate1
                                                          .kurangiSaldo(500);
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
                      height: 20,
                    ),
                    // //BATAS SUCI II ////

                    Consumer2<ColorState2, SaldoState2>(
                      builder: (context, colorstate2, saldostate2, child) =>
                          Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: colorstate2.getColorThrd),
                        child: Center(
                          child: Text(
                            "${saldostate2.getSaldo2}",
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
                        Text("Red"),
                        Consumer<ColorState2>(
                          builder: (context, colorstate2, child) => Switch(
                              value: colorstate2.getisAmber,
                              onChanged: ((value) {
                                colorstate2.setColorThrd = value;
                              })),
                        ),
                        Text("Amber")
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Consumer<ColorState2>(
                        builder: (context, colorstate2, child) => Consumer<
                                KeranjangState2>(
                            builder: (context, keranjangstate2, child) => Card(
                                  color: colorstate2.getColorThrd,
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    height: 50,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          "Telur (500) - ${keranjangstate2.getQty2}",
                                          style: myTextStyle,
                                        ),
                                        Text(
                                          "${keranjangstate2.getQty2 - 500}",
                                          style: myTextStyle,
                                        ),
                                        Consumer3<ColorState1, SaldoState2,
                                            KeranjangState2>(
                                          builder: ((context,
                                                  colorstate2,
                                                  saldostate2,
                                                  keranjangstate2,
                                                  child) =>
                                              IconButton(
                                                  onPressed: () {
                                                    if (saldostate2.getSaldo2 >
                                                        0) {
                                                      saldostate2
                                                          .kurangiSaldo(500);
                                                      keranjangstate2
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
          ),
        )
        // child: Scaffold(
        //   // backgroundColor: Consumer2<ColorState1, ColorState2>(builder: () ) ,
        //   // backgroundColor: Consumer2<ColorState1,ColorState2> (builder: ((context, colorstate1, colorstate2, child) =>
        //   // back )),

        //   // floatingActionButton: Consumer3<ColorState, SaldoState, KeranjangState>(
        //   //   builder: ((context, colorstate, saldostate, keranjangstate, child) =>
        //   //       FloatingActionButton(
        //   //         backgroundColor: colorstate.getColor,
        //   //         onPressed: () {
        //   //           if (saldostate.getSaldo > 0) {
        //   //             saldostate.kurangiSaldo(500);
        //   //             keranjangstate.tambahkeranjang();
        //   //           }
        //   //         },
        //   //         child: Icon(Icons.shopping_cart_outlined),
        //   //       )),
        //   // ),
        // ),
        );
  }
}
