import Foundation

var note1 = Note(message: "Building native iOS applications requires access to Apple's build tools, which only run on a Mac. Because of this, Visual Studio 2019 must connect to a network-accessible Mac to build Xamarin.iOS applications.", lockStatus: .locked)

var note2 = Note(message: "Visual Studio 2019's Pair to Mac feature discovers, connects to, authenticates with, and remembers Mac build hosts so that Windows-based iOS developers can work productively.", lockStatus: .unlocked)

var note3 = Note(message: "Pair to Mac uses these credentials to create a new SSH connection to the Mac. If it succeeds, a key is added to the authorized_keys file on the Mac. Subsequent connections to the same Mac will login automatically.", lockStatus: .locked)

var notesArray: [Note] = [note1, note2, note3]

