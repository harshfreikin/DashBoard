import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../constants.dart';
import '../responsive.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> with SingleTickerProviderStateMixin {
  late FocusNode _focusNode;
  late TextEditingController _controller;
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _controller = TextEditingController();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
        if (_isFocused) {
          _animationController.forward();
        } else {
          _animationController.reverse();
        }
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);
    final double searchHeight = isMobile ? 45.0 : 50.0;
    final double iconSize = isMobile ? 20.0 : 24.0;
    final double borderRadius = isMobile ? 15.0 : 20.0;
    
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: searchHeight,
      decoration: BoxDecoration(
        color: _isFocused ? Colors.white : Colors.grey[100],
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: _isFocused ? [
          BoxShadow(
            color: Colors.deepPurple.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ] : null,
        border: _isFocused ? Border.all(
          color: Colors.deepPurple.withOpacity(0.3),
          width: 1.5,
        ) : null,
      ),
      child: TextField(
        controller: _controller,
        focusNode: _focusNode,
        style: TextStyle(
          fontSize: isMobile ? 14.0 : 16.0,
          color: Colors.grey[800],
        ),
        decoration: InputDecoration(
          hintText: "Search...",
          hintStyle: TextStyle(
            color: Colors.grey[400],
            fontSize: isMobile ? 14.0 : 16.0,
          ),
          prefixIcon: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: Icon(
              Icons.search,
              key: ValueKey<bool>(_isFocused),
              color: _isFocused ? Colors.deepPurple : Colors.grey[400],
              size: iconSize,
            ),
          ),
          suffixIcon: _controller.text.isNotEmpty
              ? IconButton(
                  icon: Icon(
                    Icons.clear,
                    color: Colors.grey[400],
                    size: iconSize,
                  ),
                  onPressed: () {
                    _controller.clear();
                  },
                )
              : null,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: isMobile ? 16.0 : 20.0,
            vertical: isMobile ? 12.0 : 14.0,
          ),
        ),
        onChanged: (value) {
          setState(() {});
        },
      ),
    );
  }
}
