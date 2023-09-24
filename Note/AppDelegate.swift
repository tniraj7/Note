import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: makeNoteVC())
        window?.makeKeyAndVisible()
        return true
    }
    
    func makeNoteVC() -> NotesListViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController: NotesListViewController = storyboard.instantiateViewController(identifier: "NotesListViewController")
        { coder in
            let biometricAuthenticationManager = BiometricAuthenticationManager()
            let viewController = NotesListViewController(coder: coder, biometricAuthenticationManager: biometricAuthenticationManager)
            return viewController
        }
        return viewController
    }
}
