
import UIKit

class ResultVC: UIViewController {
    
    var score: Int?
    var totalScore: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        setupViews()
    }
    @objc func continueBtnAction() {
        guard let sc = score, let tc = totalScore else { return }
        let s = sc * 100 / tc
        if s<80{
            let d=MsgImpVC()
            self.navigationController?.pushViewController(d, animated: true)
        }
        else {
            let m=DriveVC()
            self.navigationController?.pushViewController(m, animated: true)
        }
    }
    func showRating() {
        var rating = ""
        var color = UIColor.black
        guard let sc = score, let tc = totalScore else { return }
        let s = sc * 100 / tc
        if s < 10 {
            rating = "Poor"
            color = UIColor(red:0.18, green:0.12, blue:0.18, alpha:1.0)//purple
            lblRating.textColor=UIColor.white
            lblTitle.textColor=UIColor.white
            lblScore.textColor=UIColor.white
        }  else if s < 40 {
            rating = "Average"
            color = UIColor(red:0.88, green:0.07, blue:0.00, alpha:1.0)//red
            lblRating.textColor=UIColor.white
            lblTitle.textColor=UIColor.white
            lblScore.textColor=UIColor.white
        } else if s < 60 {
            rating = "Good"
            lblTitle.textColor=UIColor.black
            color = UIColor(red:0.97, green:0.70, blue:0.17, alpha:1.0)//darker yellow
        } else if s < 80 {
            rating = "Excellent"
            color = UIColor(red:0.99, green:0.96, blue:0.63, alpha:1.0)//light yellow
        } else if s <= 100 {
            rating = "Outstanding!"
            color = UIColor(red:0.66, green:0.90, blue:0.73, alpha:1.0)//blue
        }
        lblRating.text = "\(rating)"
        self.view.backgroundColor=color
    }
    
   
    
    func setupViews() {
        self.view.addSubview(lblTitle)
        lblTitle.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive=true
        lblTitle.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive=true
        lblTitle.widthAnchor.constraint(equalToConstant: 250).isActive=true
        lblTitle.heightAnchor.constraint(equalToConstant: 80).isActive=true
        
        self.view.addSubview(lblScore)
        lblScore.topAnchor.constraint(equalTo: lblTitle.bottomAnchor, constant: 5).isActive=true
        lblScore.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive=true
        lblScore.widthAnchor.constraint(equalToConstant: 150).isActive=true
        lblScore.heightAnchor.constraint(equalToConstant: 60).isActive=true
        lblScore.text = "\(score!) / \(totalScore!)"
        
        self.view.addSubview(lblRating)
        lblRating.topAnchor.constraint(equalTo: lblScore.bottomAnchor, constant: 60).isActive=true
        lblRating.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive=true
        lblRating.widthAnchor.constraint(equalToConstant: 150).isActive=true
        lblRating.heightAnchor.constraint(equalToConstant: 60).isActive=true
        showRating()
        self.view.addSubview(continueBtn)
        continueBtn.heightAnchor.constraint(equalToConstant: 50).isActive=true
        continueBtn.widthAnchor.constraint(equalToConstant: 150).isActive=true
        continueBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive=true
        continueBtn.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0).isActive=true
    }
    
    let lblTitle: UILabel = {
        let lbl=UILabel()
        lbl.text="Your Score"
        lbl.textColor=UIColor.darkGray
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 46)
        lbl.numberOfLines=2
        lbl.translatesAutoresizingMaskIntoConstraints=false
        return lbl
    }()
    
    let lblScore: UILabel = {
        let lbl=UILabel()
        lbl.text="0 / 0"
        lbl.textColor=UIColor.black
        lbl.textAlignment = .center
        lbl.font = UIFont.boldSystemFont(ofSize: 24)
        lbl.translatesAutoresizingMaskIntoConstraints=false
        return lbl
    }()
    
    let lblRating: UILabel = {
        let lbl=UILabel()
        lbl.text="Good"
        lbl.textColor=UIColor.black
        lbl.textAlignment = .center
        lbl.font = UIFont.boldSystemFont(ofSize: 24)
        lbl.translatesAutoresizingMaskIntoConstraints=false
        return lbl
    }()
    let continueBtn: UIButton = {
        let btn=UIButton()
        btn.setTitle("Continue", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.backgroundColor=UIColor(red:0.88, green:0.07, blue:0.00, alpha:1.0)
        btn.layer.cornerRadius=5
        btn.layer.masksToBounds=true
        btn.translatesAutoresizingMaskIntoConstraints=false
        btn.addTarget(self, action: #selector(continueBtnAction), for: .touchUpInside)
        return btn
    }()
}
