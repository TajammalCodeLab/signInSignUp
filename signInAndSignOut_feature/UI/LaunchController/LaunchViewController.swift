import UIKit



class LaunchViewController: BaseViewController {
    
    
    // MARK: - OUTLETS @IBOutlet -
    @IBOutlet weak var progressBarHandler: UIProgressView!
    
    // MARK: - Life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        startProgressBar()
    }
    
    
    
    
    // MARK: - OVERRIDE FUNCTION -
    override func viewWillAppear(_ animated: Bool){
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    
    
    // MARK: - METHODS -
    
    private func startProgressBar(){
        self.progressBarHandler.layer.sublayers?.forEach {$0.removeAllAnimations()}
        progressBarHandler.setProgress(3.0, animated: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3){
            self.progressBarHandler.setProgress(0.0, animated: false)
            self.progressBarHandler.layer.sublayers?.forEach {$0.removeAllAnimations()}
            self.directToLoginScreen()
        }
    }
    
    
    private func directToLoginScreen(){
        if UserDefaults.standard.bool(forKey: "IsLogin") == true{
            let vc = self.main.instantiateViewController(identifier: Identifiers.DASHBOARD_ID)
            self.navigationController?.pushViewController(vc, animated: false)
        }
        else{
            let vc = self.main.instantiateViewController(identifier: Identifiers.LOGIN_ID)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}


