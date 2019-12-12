import UIKit

class AuthentificationViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func onBoardSeen(_ sender: FAButton) {
        UserDefaults.standard.set(true, forKey: "isSeen")
    }
    
}
