
import UIKit

class ViewController: UIViewController {
    
    var window: UIWindow?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title="Quiz"
        self.view.backgroundColor=UIColor(red:0.99, green:0.96, blue:0.69, alpha:1.0)
        
        setupViews()
    }
    
    @objc func btnGetStartedAction() {
        let v=QuizVC()
        self.navigationController?.pushViewController(v, animated: true)
    }
    @objc func btnGetStartedAction2() {
        let d=StatsVC()
        self.navigationController?.pushViewController(d, animated: true)

    }
    
    func setupViews() {
        self.view.addSubview(lblTitle)
        lblTitle.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 150).isActive=true
        lblTitle.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive=true
        lblTitle.widthAnchor.constraint(equalToConstant: 250).isActive=true
        lblTitle.heightAnchor.constraint(equalToConstant: 80).isActive=true
        self.view.addSubview(lblBody)
        lblBody.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 250).isActive=true
        lblBody.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive=true
        lblBody.widthAnchor.constraint(equalToConstant: 250).isActive=true
        lblBody.heightAnchor.constraint(equalToConstant: 80).isActive=true
        self.view.addSubview(btnGetStarted)
        btnGetStarted.heightAnchor.constraint(equalToConstant: 50).isActive=true
        btnGetStarted.widthAnchor.constraint(equalToConstant: 150).isActive=true
        btnGetStarted.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive=true
        btnGetStarted.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0).isActive=true
        self.view.addSubview(btnGetStarted2)
        btnGetStarted2.heightAnchor.constraint(equalToConstant: 50).isActive=true
        btnGetStarted2.widthAnchor.constraint(equalToConstant: 150).isActive=true
        btnGetStarted2.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive=true
        btnGetStarted2.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 80).isActive=true
    }
    
    let lblTitle: UILabel = {
        let lbl=UILabel()
        lbl.text="DriveSafe"
        lbl.textColor=UIColor(red:0.18, green:0.12, blue:0.18, alpha:1.0)
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 46)
        lbl.numberOfLines=2
        lbl.translatesAutoresizingMaskIntoConstraints=false
        return lbl
    }()//700401
    let lblBody: UILabel = {
        let lbl=UILabel()
        lbl.text="Are you planning to drive now?"
        lbl.textColor=UIColor(red:0.18, green:0.12, blue:0.18, alpha:1.0)
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 23)
        lbl.numberOfLines=2
        lbl.translatesAutoresizingMaskIntoConstraints=false
        return lbl
    }()
    let btnGetStarted: UIButton = {
        let btn=UIButton()
        btn.setTitle("Yes", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.backgroundColor=UIColor(red:0.88, green:0.07, blue:0.00, alpha:1.0)
        btn.layer.cornerRadius=5
        btn.layer.masksToBounds=true
        btn.translatesAutoresizingMaskIntoConstraints=false
        btn.addTarget(self, action: #selector(btnGetStartedAction), for: .touchUpInside)
        return btn
    }()
    let btnGetStarted2: UIButton = {
        let btn=UIButton()
        btn.setTitle("No", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.backgroundColor=UIColor(red:0.88, green:0.07, blue:0.00, alpha:1.0)
        btn.layer.cornerRadius=5
        btn.layer.masksToBounds=true
        btn.translatesAutoresizingMaskIntoConstraints=false
        btn.addTarget(self, action: #selector(btnGetStartedAction2), for: .touchUpInside)
        return btn
    }()
}








