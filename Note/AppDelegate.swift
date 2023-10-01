import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navigationController: UINavigationController?
    var storyboard: UIStoryboard?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        storyboard = UIStoryboard(name: "Main", bundle: nil)
        navigationController = UINavigationController(rootViewController: makeNoteVC())
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }
    
    func makeNoteVC() -> NotesListViewController {

        let viewController: NotesListViewController = storyboard?
            .instantiateViewController(identifier: "NotesListViewController") as! NotesListViewController
        let biometricAuthenticationManager = BiometricAuthenticationManager()
        
        viewController.didSelectNote = { [weak self] indexPath in
            guard let self = self else { return }
            if notesArray[indexPath.row].lockStatus == .locked {
                Task {
                    let authResult = try await biometricAuthenticationManager
                        .authenticateBiometrics(policy: .deviceOwnerAuthenticationWithBiometrics)
                     
                     if authResult {
                         let lockStatus = notesArray[indexPath.row].lockStatus
                         notesArray[indexPath.row].lockStatus = lockStatusFlipper(lockStatus)
                         DispatchQueue.main.async {
                             let noteDetailVC = self.makeNotesDetailViewController(for: indexPath)
                             self.navigationController?.pushViewController(noteDetailVC, animated: true)
                         }
                     }
                }
            } else {
                let noteDetailVC = self.makeNotesDetailViewController(for: indexPath)
                navigationController?.pushViewController(noteDetailVC, animated: true)
            }
        }
        return viewController
    }
    
    func makeNotesDetailViewController(for indexPath: IndexPath) -> NoteDetailVC {
        let noteDetailVC = storyboard?.instantiateViewController(withIdentifier: "NoteDetailVC") as! NoteDetailVC
        noteDetailVC.note = notesArray[indexPath.row]
        noteDetailVC.index = indexPath.row
        return noteDetailVC
    }
}
