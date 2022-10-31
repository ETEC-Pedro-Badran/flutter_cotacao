import 'package:flutter/material.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final moedas = ['DOLAR','EURO',"LIBRA"];
  var moeda = 'DOLAR';



  @override
  Widget build(BuildContext context) {
    final moedasDMI = moedas.map((e) => DropdownMenuItem(child: Text(e), value: e,),).toList();
    
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Cotação")),
        body: Column(
          children: [
            Row(
              children:  [
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(label: Text("Valor")),
                  ),
                ),

                DropdownButton(
                  value: moeda,
                  items: moedasDMI, onChanged:(value) {
                    setState(() {
                      moeda = value!;
                    });
                      
                },)

              ],
            )
          ],
        )
      
    );
  }
}