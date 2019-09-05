import UIKit

class NoteDetailVC: UIViewController {

    @IBOutlet weak var textView: UITextView!

    var note: Note!
    var index: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = note.message
    }
    
    @IBAction func lockButtonPressed(_ sender: Any) {
        notesArray[index].lockStatus = lockStatusFlipper(note.lockStatus)
        navigationController?.popViewController(animated: true)
    }
    
}
