import 'package:flutter/material.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    super.key,
    required this.text,
    required this.icon,
    this.press,
    required this.isComingSoon,
  });

  final String text;
  final IconData icon;
  final VoidCallback? press;
  final bool isComingSoon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      trailing: isComingSoon?
          Text("Coming soon...",
          style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.grey),
          )
          :const Icon(Icons.arrow_forward_ios_rounded),
      onTap: press,
    );
  }
}
