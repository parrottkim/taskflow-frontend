// Keep this version aligned with firebase_core_web's
// supportedFirebaseJsSdkVersion in pubspec.lock.
import * as firebaseCore from "https://www.gstatic.com/firebasejs/12.17.0/firebase-app.js";
import * as firebaseRemoteConfig from "https://www.gstatic.com/firebasejs/12.17.0/firebase-remote-config.js";

// FlutterFire skips its runtime script injection when these modules exist.
// Loading them here avoids inline scripts that violate the production CSP.
window.firebase_core = firebaseCore;
window.firebase_remote_config = firebaseRemoteConfig;

const flutterBootstrap = document.createElement("script");
flutterBootstrap.src = "flutter_bootstrap.js";
flutterBootstrap.async = true;
document.body.appendChild(flutterBootstrap);
