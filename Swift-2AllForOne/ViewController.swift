//
//  ViewController.swift
//  Swift-2AllForOne
//
//  Created by Gabriel Toro on 13-10-22.
//

import UIKit
import GooglePlaces
import RUTValidator

class ViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak var testbutton: PrimaryButton!
    
    
    // MARK: - Variables
    private var placesClient: GMSPlacesClient!
    var count = 1
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        testbutton.button.addTarget(self, action: #selector(buttonPressed), for: .touchDown)
        
        cylicClosure {
            switch count {
            case 1:
                print("print 1")
            case 3:
                print("print 3")
            default:
                print("print 5")
            }
            count = count + 2
        }
    }
    
    func cylicClosure(completionHandler: () -> ()) {
        completionHandler()
        print("print 2")
        completionHandler()
        print("print 4")
        completionHandler()
    }
    
    func closureSum(completionHandler: (Int, Int) -> ()) {
        completionHandler(2, 4)
    }
    @objc func buttonPressed() {
        testbutton.button.changeColor()
    }
}
