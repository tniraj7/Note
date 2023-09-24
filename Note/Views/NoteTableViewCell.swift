import UIKit

class NoteTableViewCell: UITableViewCell {

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var lockImageView: UIImageView!
    
    func configureCell(note: Note) {
        if note.lockStatus == .locked {
            lockImageView.isHidden = false
            messageLabel.text = "This note is locked, unlock to read"
        } else {
            messageLabel.text = note.message
            lockImageView.isHidden = true
        }
    }
}
