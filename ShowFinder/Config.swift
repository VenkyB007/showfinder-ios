import UIKit

enum Config {
    static let name = "Show Finder"
    /// The web app. Change this if the public hostname changes.
    static let startURL = URL(string: "https://showfinder.nikolatesla.co.in")!
    /// Links under this domain stay in the app; everything else opens outside it.
    static let inAppDomain = "nikolatesla.co.in"
    /// The page detects the shell (and its version) from "<token>/<version>" in the user agent.
    static let userAgentToken = "ShowFinderIOS"

    /// Google sign-in handoff: Passport (passport/lib/app-handoff.js, registered in passport/server.js).
    static let authURL = URL(string: "https://auth.nikolatesla.co.in")!
    static let handoffApp = "showfinder"
    static let handoffScheme = "showfinder"

    static let background = UIColor(red: 0x07 / 255.0, green: 0x07 / 255.0, blue: 0x07 / 255.0, alpha: 1)
    static let accent = UIColor(red: 0xD4 / 255.0, green: 0xB0 / 255.0, blue: 0x7A / 255.0, alpha: 1)

    static var version: String { Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? "0" }
}
