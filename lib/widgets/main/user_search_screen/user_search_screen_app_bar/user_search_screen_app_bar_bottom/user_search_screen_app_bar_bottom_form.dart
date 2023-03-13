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
  State<UserSearchAppBarBottomForm> createState() =>
      _UserSearchAppBarBottomFormState();
}

class _UserSearchAppBarBottomFormState
    extends State<UserSearchAppBarBottomForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();

    super.dispose();
  }

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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextFormField(
              enabled: !widget.loading,
              controller: _textEditingController,
              validator: _queryValidator,
              decoration: InputDecoration(
                labelText: 'Search query',
                fillColor:
                    Theme.of(context).colorScheme.onPrimary.withOpacity(0.15),
                errorStyle: TextStyle(
                  color:
                      Theme.of(context).colorScheme.onPrimary.withOpacity(0.9),
                ),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context)
                        .colorScheme
                        .onPrimary
                        .withOpacity(0.3),
                  ),
                ),
                errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context)
                        .colorScheme
                        .onPrimary
                        .withOpacity(0.5),
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context)
                        .colorScheme
                        .onPrimary
                        .withOpacity(0.8),
                  ),
                ),
                focusedErrorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                labelStyle: TextStyle(
                  color:
                      Theme.of(context).colorScheme.onPrimary.withOpacity(0.5),
                ),
                floatingLabelStyle: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                helperText: 'Emails, phone numbers or usernames.',
              ),
            ),
          ),
          const SizedBox(
            width: 16.0,
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
