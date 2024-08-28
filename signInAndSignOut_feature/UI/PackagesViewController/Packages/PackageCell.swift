import UIKit

class PackageCell: UITableViewCell {
    
    // MARK: - IBOutlets -
    @IBOutlet weak var packageNameLabel: UILabel!
    @IBOutlet weak var imageback: UIImageView!
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
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16))
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

    // MARK: - EXTEMSION -
extension PackageCell: bindingDataDelegate{
    func didSetDelegates(_ delegate: PackagesDelegates, with indexpath: IndexPath?) {
        self.delegate = delegate
        self.indexPath = indexpath
    }
    
    
}
