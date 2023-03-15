import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:repo_viewer/github/core/domain/github_repo.dart';

class RepoDetailPage extends StatefulWidget {
  final GithubRepo repo;
  const RepoDetailPage({super.key, required this.repo});

  @override
  State<RepoDetailPage> createState() => _RepoDetailPageState();
}

class _RepoDetailPageState extends State<RepoDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Hero(
              tag: widget.repo.fullName,
              child: CircleAvatar(
                radius: 16,
                backgroundImage: CachedNetworkImageProvider(
                  widget.repo.owner.avatarUrlSmall,
                ),
                backgroundColor: Colors.transparent,
              ),
            ),
            const SizedBox(width: 8.0),
            Flexible(
              child: Text(
                widget.repo.name,
              ),
            )
          ],
        ),
      ),
    );
  }
}
