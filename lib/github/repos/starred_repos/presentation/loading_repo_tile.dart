import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingRepoTile extends StatelessWidget {
  const LoadingRepoTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Shimmer.fromColors(
        baseColor: Colors.grey.shade400,
        highlightColor: Colors.grey.shade300,
        child: ListTile(
          leading: Container(
            width: 50,
            color: Colors.grey,
          ),
          title: const TextShimmers(width: 100),
          subtitle: const TextShimmers(width: 250),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.star_border),
              Text(
                '',
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TextShimmers extends StatelessWidget {
  final double width;
  const TextShimmers({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        height: 14,
        width: width,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}
