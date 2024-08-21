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
    override func viewWillAppear(_ animated: Bool){
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    private func directToLoginScreen(){
        
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = windowScene.windows.first else {
            return
        }
        
        let loginVC = Storyboards.Main.instantiateViewController(withIdentifier: Identifiers.LOGIN_ID)
        loginVC.modalPresentationStyle = .fullScreen
        
        // Create a snapshot of the current window
        let snapshot = window.snapshotView(afterScreenUpdates: true)
        loginVC.view.addSubview(snapshot ?? UIView())
        
        window.rootViewController = loginVC
        window.makeKeyAndVisible()

        // Animate the transition
        UIView.transition(with: snapshot ?? UIView(), duration: 0.5, options: .transitionCrossDissolve, animations: {
            snapshot?.alpha = 0
        }) { _ in
            snapshot?.removeFromSuperview()
        }
        
        
        
        /* previus code
        let loginVC = Storyboards.Main.instantiateViewController(withIdentifier: Identifiers.LOGIN_ID)
        self.navigationController?.pushViewController(loginVC, animated: true)
        */
        
        
        
        /*
        let SignUpVC = Storyboards.Main.instantiateViewController(withIdentifier: Identifiers.SIGNUP_ID)
        SignUpVC.modalPresentationStyle = .fullScreen
        present(SignUpVC, animated: true, completion: nil)*/
    }
}


