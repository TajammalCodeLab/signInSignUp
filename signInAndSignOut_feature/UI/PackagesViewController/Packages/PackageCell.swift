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
    
    
    func updateData(for package: Packages) {
            packageNameLabel.text = package.title
        imageback.image = UIImage(named: package.image ?? "") // Assuming the Packages model has an image property
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
    

    @IBAction func actionButtonTapped(_ sender: UIButton) {
        showActionSheet()
    }

    private func showActionSheet() {
        guard let parentVC = self.parentViewController else { return }

        let actionSheet = UIAlertController(title: "Actions", message: "Choose an option", preferredStyle: .actionSheet)

        let editAction = UIAlertAction(title: "Edit Title", style: .default) { action in
            self.delegate?.didEdit(for: self.indexPath)
        }

        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { action in
            self.delegate?.didDelete(for: self.indexPath)
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

        actionSheet.addAction(editAction)
        actionSheet.addAction(deleteAction)
        actionSheet.addAction(cancelAction)

        parentVC.present(actionSheet, animated: true, completion: nil)
    }
}

extension PackageCell: bindingDataDelegate{
    func didSetDelegates(_ delegate: PackagesDelegates, with indexpath: IndexPath?) {
        self.delegate = delegate
        self.indexPath = indexpath
    }
    
    
}
extension UITableViewCell {
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
}
