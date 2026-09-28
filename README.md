# Show Finder iOS

iPhone shell around the Show Finder web app at `https://showfinder.nikolatesla.co.in`. It's a WKWebView app built the same way as
`kacheri-ios`:

- Sign-in cookies and local storage persist. Links under `nikolatesla.co.in` stay in the app;
  anything else opens in Safari or the matching app, and swiping from the left edge goes back.
- **Google sign-in** runs in the system sign-in sheet (`ASWebAuthenticationSession`), since Google
  refuses web views. The session is handed back through `/app-auth` on Passport (passport/lib/app-handoff.js, registered in passport/server.js).
  The server returns `showfinder://auth?code=…`, and the code + verifier are POSTed to
  `/app-auth/exchange` inside the web view (`SignInHandoff.swift`).
- Booking links (target=_blank) open in Safari.
- The page can recognise the shell by `ShowFinderIOS/<version>` in the user agent.
- No self-update: new builds come through TestFlight, or a fresh sideload.

## Build

Builds run on GitHub's macOS runners (`.github/workflows/ios.yml`). Every push builds an unsigned
`ShowFinder.ipa` (the run's Artifacts), which Sideloadly or AltStore sign with any Apple ID. Publisher
(`D:\apps\publisher`, iOS tab) starts builds and fetches the .ipa.

**Run workflow → testflight** signs and uploads instead, once the repo has the secrets
`APPLE_TEAM_ID`, `ASC_KEY_ID`, `ASC_ISSUER_ID` and `ASC_KEY_P8` (an App Store Connect API key
with the Admin role). The app record in App Store Connect uses bundle ID `in.co.nikolatesla.showfinder`.

On a Mac: `brew install xcodegen && xcodegen generate && open ShowFinder.xcodeproj`.

Bump `MARKETING_VERSION` in `project.yml` for each release. The build number is the CI run number.
