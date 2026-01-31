import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {
    func application(_ application: NSApplication, open urls: [URL]) {
        for url in urls {
            // Rewrite prefix
            var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
            components?.scheme = "https"
            guard let httpsURL = components?.url else { continue }

            // Launch in Chrome
            let chromePath = "/Applications/Google Chrome.app"
            if FileManager.default.fileExists(atPath: chromePath) {
                NSWorkspace.shared.open(
                    [httpsURL],
                    withApplicationAt: URL(fileURLWithPath: chromePath),
                    configuration: NSWorkspace.OpenConfiguration()
                )
            } else {
                let alert = NSAlert()
                alert.messageText = "Google Chrome Helper Failed"
                alert.informativeText = "Chrome doesn't appear to be installed at \(chromePath)"
                alert.alertStyle = .critical
                alert.addButton(withTitle: "OK")
                alert.runModal()
            }
        }
        
        // Quit after handling
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            NSApplication.shared.terminate(nil)
        }
    }
}

let app = NSApplication.shared
let delegate = AppDelegate()
app.delegate = delegate
app.run()