import UIKit



class LaunchViewController: UIViewController {
    
    @IBOutlet weak var progressBarHandler: UIProgressView!
    override func viewDidLoad() {
        super.viewDidLoad()
        startProgressBar()
    }
    
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
        
        
        let loginVC = Storyboards.Main.instantiateViewController(withIdentifier: Identifiers.LOGIN_ID)
        loginVC.modalPresentationStyle = .fullScreen
        present(loginVC, animated: true, completion: nil)
        
        
        /*
        let SignUpVC = Storyboards.Main.instantiateViewController(withIdentifier: Identifiers.SIGNUP_ID)
        SignUpVC.modalPresentationStyle = .fullScreen
        present(SignUpVC, animated: true, completion: nil)*/
    }
}


