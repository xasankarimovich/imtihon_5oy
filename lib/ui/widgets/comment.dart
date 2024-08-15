import 'package:flutter/material.dart';

class AnimatedTextField extends StatefulWidget {
  const AnimatedTextField({super.key});

  @override
  State<AnimatedTextField> createState() => _AnimatedTextFieldState();
}

class _AnimatedTextFieldState extends State<AnimatedTextField> {
  bool _isExpanded = false;
  String _enteredText = '';
  final TextEditingController commentController = TextEditingController();

  void _toggleExpansion() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  void _submitComment() {
    setState(() {
      _enteredText = commentController.text;
      commentController.clear();
      _isExpanded = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          CircleAvatar(
            maxRadius: 30,
            child: IconButton(
              onPressed: _toggleExpansion,
              icon: const Icon(
                Icons.add,
                size: 30,
              ),
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: _isExpanded ? 100 : 0,
            curve: Curves.easeInOut,
            child: _isExpanded
                ? TextField(
              controller: commentController,
              maxLines: 10,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            )
                : null,
          ),
          if (_isExpanded)
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: FilledButton(
                onPressed: _submitComment,
                child: Text("Komment Qo'shish"),
              ),
            ),
          if (_enteredText.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                _enteredText,
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
            ),
        ],
      ),
    );
  }
}
