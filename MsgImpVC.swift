//
//  MIVC
//  DriveSafe
//
//  Created by Gayatri  Rajan on 7/20/19.
//  Copyright © 2019 Gayatri  Rajan. All rights reserved.
//

import UIKit
import MessageUI


class MsgImpVC: UIViewController, MFMessageComposeViewControllerDelegate {
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title="Impaired"
        self.view.backgroundColor=UIColor(red:0.88, green:0.07, blue:0.00, alpha:1.0)
        
        setupViews()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBOutlet weak var random: UILabel!
    // @IBAction func sendMessageButtonAction(_ sender: Any) {
    // displayMessageInterface()
    //}
    
    func displayMessageInterface() {
        
        let composeVC = MFMessageComposeViewController()
        composeVC.messageComposeDelegate = self
        
        // Configure the fields of the interface.
        composeVC.recipients = ["5137046116"]
        composeVC.body = "I just completed the DriveSafe quiz, and I may be driving-impaired. What should I do next?"
        
        // Present the view controller modally.
        if MFMessageComposeViewController.canSendText() {
            self.present(composeVC, animated: true, completion: nil)
        } else {
            print("Can't send messages.")
        }
    }//app endpoint
    @objc func sendMsg() {
        displayMessageInterface()
        
    }
    func setupViews() {

        self.view.addSubview(lblBody)
        lblBody.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 250).isActive=true
        lblBody.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive=true
        lblBody.widthAnchor.constraint(equalToConstant: 250).isActive=true
        lblBody.heightAnchor.constraint(equalToConstant: 80).isActive=true
        self.view.addSubview(clicker)
        clicker.heightAnchor.constraint(equalToConstant: 50).isActive=true
        clicker.widthAnchor.constraint(equalToConstant: 150).isActive=true
        clicker.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive=true
        clicker.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0).isActive=true
            }
    
    
    let lblBody: UILabel = {
        let lbl=UILabel()
        lbl.text="You may be impaired."
        lbl.textColor=UIColor.darkGray
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 23)
        lbl.numberOfLines=2
        lbl.translatesAutoresizingMaskIntoConstraints=false
        return lbl
    }()
    let clicker: UIButton = {
        let btn=UIButton()
        btn.setTitle("Send a message.", for: .normal)
        btn.setTitleColor(UIColor(red:0.88, green:0.07, blue:0.00, alpha:1.0), for: .normal)
        btn.backgroundColor=UIColor.white
        btn.layer.cornerRadius=5
        btn.layer.masksToBounds=true
        btn.translatesAutoresizingMaskIntoConstraints=false
        btn.addTarget(self, action: #selector(sendMsg), for: .touchUpInside)
        return btn
    }()
}
