import 'package:flutter/material.dart';

class UserSearchAppBarBottomForm extends StatefulWidget {
  final void Function(String) onSearchQuery;
  final bool loading;

  const UserSearchAppBarBottomForm({
    Key? key,
    required this.onSearchQuery,
    required this.loading,
  }) : super(key: key);

  @override
  State<UserSearchAppBarBottomForm> createState() => _UserSearchAppBarBottomFormState();
}

class _UserSearchAppBarBottomFormState extends State<UserSearchAppBarBottomForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _textEditingController = TextEditingController();

  void _onSearchPressed() {
    if (_formKey.currentState == null) {
      return;
    } else if (!_formKey.currentState!.validate()) {
      return;
    } else {
      widget.onSearchQuery(_textEditingController.text);
    }
  }

  String? _queryValidator(final String? query) {
    if (query == null || query.isEmpty) {
      return "A query must not be empty!";
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              enabled: !widget.loading,
              controller: _textEditingController,
              validator: _queryValidator,
              decoration: const InputDecoration(
                labelText: 'Search query',
                helperText: 'Emails, phone numbers or usernames.',
              ),
            ),
          ),
          const SizedBox(
            width: 8.0,
          ),
          IconButton(
            onPressed: widget.loading ? null : _onSearchPressed,
            icon: const Icon(Icons.search),
          ),
        ],
      ),
    );
  }
}