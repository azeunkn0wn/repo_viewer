import 'package:flutter/material.dart';
import 'package:repo_viewer/auth/infrastructure/github_authenticator.dart';
import 'package:webview_flutter/webview_flutter.dart';
// WebView platform_imports
// Import for Android features.
// Import for iOS features.
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

class AuthorizationPage extends StatefulWidget {
  final Uri authorizationUrl;
  final void Function(Uri redirectUrl) onAuthorizationCodeRedirectAttempt;
  const AuthorizationPage({
    super.key,
    required this.authorizationUrl,
    required this.onAuthorizationCodeRedirectAttempt,
  });

  @override
  State<AuthorizationPage> createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {
  late final WebViewController _controller;
  final cookieManager = WebViewCookieManager();

  @override
  void initState() {
    super.initState();

    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final WebViewController controller =
        WebViewController.fromPlatformCreationParams(params);

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..clearCache()
      ..clearLocalStorage();

    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    cookieManager.clearCookies();

    _controller
      ..loadRequest(widget.authorizationUrl)
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (navReq) {
            if (navReq.url
                .startsWith(GithubAuthenticator.redirectUrl.toString())) {
              widget.onAuthorizationCodeRedirectAttempt(
                Uri.parse(navReq.url),
              );
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      );

    return Scaffold(
      body: SafeArea(
        child: WebViewWidget(
          controller: _controller,
        ),
      ),
    );
  }
}
