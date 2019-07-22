
import UIKit
import CoreMotion
class DriveVC: UIViewController {
    var window: UIWindow?
    var score : Double = 2.9
    var motionManager: CMMotionManager!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title="Driving"
        self.view.backgroundColor=UIColor(red:0.66, green:0.90, blue:0.73, alpha:1.0)
        motionManager=CMMotionManager()
        if motionManager.isAccelerometerAvailable{
            motionManager.accelerometerUpdateInterval=0.01
            motionManager.startAccelerometerUpdates(to: .main)
            {
                [weak self] (data, error) in
                guard let data=data, error == nil else
                {
                    return
                }
                let speed=atan2(data.acceleration.x, data.acceleration.y)//pulled from online physics formulae
                if speed>10
                {
                    self?.score -= 5
                }
            }
        }
        setupViews()
    }
    @objc func btnGetStartedAction() {
        score -= 30
        exit(0);
    }
     func saveButtonClick(sender: AnyObject) {
        let defaults = UserDefaults.standard
        defaults.set(score, forKey: "score")
        defaults.synchronize()
        }
    func setupViews() {
        self.view.addSubview(lblTitle)
        lblTitle.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 150).isActive=true
        lblTitle.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive=true
        lblTitle.widthAnchor.constraint(equalToConstant: 250).isActive=true
        lblTitle.heightAnchor.constraint(equalToConstant: 80).isActive=true
        self.view.addSubview(btnGetStarted)
        btnGetStarted.heightAnchor.constraint(equalToConstant: 50).isActive=true
        btnGetStarted.widthAnchor.constraint(equalToConstant: 150).isActive=true
        btnGetStarted.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive=true
        btnGetStarted.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0).isActive=true
    }
    
    let lblTitle: UILabel = {
        let lbl=UILabel()
        lbl.text="DriveSafe! Don't use your phone."
        lbl.textColor=UIColor.darkGray
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 23)
        lbl.numberOfLines=2
        lbl.translatesAutoresizingMaskIntoConstraints=false
        return lbl
    }()//700401
    
    let btnGetStarted: UIButton = {
        let btn=UIButton()
        btn.setTitle("Click to Exit", for: .normal)
        btn.setTitleColor(UIColor.darkGray, for: .normal)
        btn.backgroundColor=UIColor(red:0.99, green:0.96, blue:0.63, alpha:1.0)

        btn.layer.cornerRadius=5
        btn.layer.masksToBounds=true
        btn.translatesAutoresizingMaskIntoConstraints=false
        btn.addTarget(self, action: #selector(btnGetStartedAction), for: .touchUpInside)
        return btn
    }()
}








