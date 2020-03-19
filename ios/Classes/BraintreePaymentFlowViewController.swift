//
//  BraintreePaymentFlowViewController.swift
//  flutter_braintree
//
//  Created by Thomas Murray on 18/03/2020.
//

import UIKit
import Braintree

class BraintreePaymentFlowViewController: UIViewController, BTViewControllerPresentingDelegate {

    func paymentDriver(_ driver: Any, requestsPresentationOf viewController: UIViewController) {
        viewController.present(viewController, animated: true, completion: nil)
    }

    func paymentDriver(_ driver: Any, requestsDismissalOf viewController: UIViewController) {
        viewController.dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        // Do any additional setup after loading the view.
    }

   // This allows you to initialise your custom UIViewController without a nib or bundle.
    convenience init() {
        self.init(nibName:nil, bundle:nil)
    }

    // This extends the superclass.
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        print("*** loaded")
    }

    // This is also necessary when extending the superclass.
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented") // or see Roman Sausarnes's answer
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
