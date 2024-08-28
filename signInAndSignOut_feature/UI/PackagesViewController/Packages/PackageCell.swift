import UIKit

class PackageCell: UITableViewCell {
    
    // MARK: - IBOutlets -
    @IBOutlet weak var packageNameLabel: UILabel!
    @IBOutlet weak var imageback: UIImageView!{
        didSet{
            imageback.isUserInteractionEnabled = true
            let backImageTap = UITapGestureRecognizer(target: self, action: #selector(imagePicker))
            imageback.addGestureRecognizer(backImageTap)
        }
    }
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var actionButton: UIButton!
    
    // MARK: - Variables-
    private var delegate: PackagesDelegates?
    private var indexPath: IndexPath?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        updateCellUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15))
    }
    
    // MARK: - OBJ -
    @objc func imagePicker(){
        let imagePickerAlter = UIAlertController(title: "Choose an Image", message: "Select image from", preferredStyle: .actionSheet)
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { (action) in
            /// Code
        }
        let photoAction = UIAlertAction(title: "Photos", style: .default) { (action) in
            /// Code
            }
        let cencleAction = UIAlertAction(title: "Cencle", style: .cancel)
        imagePickerAlter.addAction(cameraAction)
        imagePickerAlter.addAction(photoAction)
        imagePickerAlter.addAction(cencleAction)
      
        
    }
    
    // MARK: Methods
    func updateData(for package: Packages) {
        packageNameLabel.text = package.title
        imageback.image = UIImage(named: package.image ?? "")
    }
    
    private func updateCellUI() {
        containerView.layer.cornerRadius = 15
        containerView.layer.masksToBounds = true
        containerView.layer.borderWidth = 1
        
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOpacity = 0.3
        contentView.layer.shadowOffset = CGSize(width: 0, height: 2)
        contentView.layer.shadowRadius = 4
        contentView.layer.masksToBounds = false
        contentView.backgroundColor = .clear
    }
    
    // MARK: - IBAction -
    @IBAction func actionButtonTapped(_ sender: UIButton) {
        delegate?.didShowAlert(for: indexPath)
    }
    
}

extension PackageCell: bindingDataDelegate{
    func didSetDelegates(_ delegate: PackagesDelegates, with indexpath: IndexPath?) {
        self.delegate = delegate
        self.indexPath = indexpath
    }
}

extension PackageCell: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
}
