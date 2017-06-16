import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rentlio = RentlioApi(apikey: "your_apikey")
        
        rentlio.getUser(
            done: {
                res in
                if let json = res.json {
                    print(json)
                }
            }
        )
    }
    
}
