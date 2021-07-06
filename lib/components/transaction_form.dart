import 'package:flutter/material.dart';


class TransactionForm extends StatelessWidget {

  final titleController = TextEditingController();
  final valueController = TextEditingController();

  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit);

  _submitForm() {
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;

    if(title.isEmpty || value <= 0) {

    }

    onSubmit(title,value);
  }

  @override
  Widget build(BuildContext context) {
    return           Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              onSubmitted: (value) => _submitForm(),  
              decoration: InputDecoration(
                labelText: 'Título',
              ),
            ),
            TextField(
              controller: valueController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (value) => _submitForm(),
              decoration: InputDecoration(
                labelText: 'Valor (R\$)',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton(
                  onPressed: _submitForm ,
                  child: Text('Nova Transação'),
                  textColor: Colors.purple,
                ),
              ],
            )
          ],
        ),
      ),
    )
    ;
  }
}
