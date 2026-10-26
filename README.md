# NetPulse

Ultra-light live network speed meter and data-usage tracker for Android.
Written in plain Java, **zero third-party dependencies**.

## Features
- Live download / upload speed as a **status-bar icon** (a real notification icon, placed by the system, never overlaps other icons), updated every 1-3 seconds
- Icon styles: Dual (download + upload in two rows) or Big number (value over unit)
- Speed type: Download, Upload, Both or Total; Bytes or Bits
- Customise the icon: font, text size, bold, arrows, row order, hide when idle, refresh rate
- Live preview of the icon inside the app
- Keeps running after the app is swiped from recents; restarts itself after boot or if the system stops it
- Sleeps completely when there is no network (no polling, no wake locks)
- Data usage: today / this billing cycle, 30-day chart, per-app breakdown (Mobile / Wi-Fi)
- Monthly data-plan limit with alerts at 80% and 100%
- Fixed icon text size: B / KB / MB always draw at the size you chose
- Optional "Force colour" overlay: speed text in your accent colour over the status bar
- Built-in speed test (ping, download, upload) with a live speedometer
- Accent colour themes (app and notification shade): fixed colours, Heat (follows speed), Rainbow, Custom hue

## Requirements
- Android 8.0 (API 26) or newer
- Pure Java, no native libraries: one APK runs on both 32-bit and 64-bit phones
- Build: Android Studio / AndroidIDE, SDK platform 34, JDK 17, AGP 8.2.2

## Build
Open the folder as a project and run `assembleDebug` (or use *Build > Build APK*).

## Permissions (and why)
| Permission | Why |
|---|---|
| `ACCESS_NETWORK_STATE` | Know when a network appears / disappears |
| `POST_NOTIFICATIONS` | Show the speed icon in the status bar |
| `FOREGROUND_SERVICE` (+ special use) | Keep the meter alive in the background |
| `RECEIVE_BOOT_COMPLETED` | Start after the phone boots |
| `REQUEST_IGNORE_BATTERY_OPTIMIZATIONS` | Stop the system from killing the meter |
| `INTERNET` | Only for the in-app Speed Test (runs when you press Start) |
| `SYSTEM_ALERT_WINDOW` | Optional: coloured speed text over the status bar |
| `PACKAGE_USAGE_STATS` | Read Android's own data-usage statistics |
| `QUERY_ALL_PACKAGES` | Show app names and icons in the per-app list |

`INTERNET` is used only by the Speed Test, which sends/receives anonymous test data. No analytics, no tracking.
See [PRIVACY.md](PRIVACY.md).

## Setup on the phone
Allow Notifications, allow Usage access, set Battery to *Unrestricted*, and turn
Autostart ON if your phone has that setting.

## License
[MIT](LICENSE) (c) 2026 Razibul Islam.

## Disclaimer
Provided "as is", without warranty. Speed and usage numbers come from the
Android system and may differ slightly from your carrier's billing.
