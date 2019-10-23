import 'package:flutter/material.dart'; 
import 'package:flutter/rendering.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
    title: 'Lista de Produtos de Limpeza',
    home: ListaProduto(),
    );
}
}
class ListaProdutoLimpezaState extends State<ListaProduto>{
  final _suggestions = <String>
    ["Pano Multiuso", "Detergente", "Rodo Limpa Vidros", "Água Sanitária", "Alvejantes", "Papel Higiênico", "Sacos de Lixo", "Toalhas Descartáveis", "Sabonete Líquido", "Álcool"];
  final Set<String> _saved = Set<String>();
  final _biggerFont = const TextStyle(fontSize: 18.0);
  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Produtos de Limpeza'),
      ),
      body: buildSuggestions(),
  );
 }
  Widget buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i){
        if (i.isOdd) return Divider();
        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          return null;
        }
        return _buildRow(_suggestions[index]);
      });
  }
  Widget _buildRow(String x){
    final bool alreadySaved = _saved.contains(x);
    return ListTile(
      title: Text(x, style: _biggerFont
      ),
      trailing: Icon(
        alreadySaved ? Icons.check_box : Icons.check_box_outline_blank,
        color: alreadySaved ? Colors.pinkAccent : null,
      ),
      onTap: () {
        setState((){
          if (alreadySaved) {
             _saved.remove(x);
        } else {
             _saved.add(x);
           }
        });
      }
    );
  }
}
class ListaProduto extends StatefulWidget {
  @override 
  ListaProdutoLimpezaState createState() => ListaProdutoLimpezaState();
}