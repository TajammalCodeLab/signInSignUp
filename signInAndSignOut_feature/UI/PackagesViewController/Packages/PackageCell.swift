import UIKit

class PackageCell: UITableViewCell {

    @IBOutlet weak var packageNameLabel: UILabel!
    
    @IBOutlet weak var imageback: UIImageView!
    
    
    @IBOutlet weak var actionButton: UIButton! // Connect this to your button in the XIB

    var editAction: (() -> Void)?
    var deleteAction: (() -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        updateCellUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16))
    }
    

    func updateData(for data:Packages) {
        packageNameLabel.text = data.title
        imageback.image = UIImage(named: data.image ?? "")
    }
    
    
    
    private func updateCellUI() {
        self.contentView.layer.cornerRadius = 15
        self.contentView.layer.masksToBounds = true
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOpacity = 0.3
        contentView.layer.shadowOffset = CGSize(width: 0, height: 2)
        contentView.layer.shadowRadius = 4
    }

    @IBAction func actionButtonTapped(_ sender: UIButton) {
        showActionSheet()
    }

    private func showActionSheet() {
        guard let parentVC = self.parentViewController else { return }

        let actionSheet = UIAlertController(title: "Actions", message: "Choose an option", preferredStyle: .actionSheet)

        let editAction = UIAlertAction(title: "Edit Title", style: .default) { _ in
            self.editAction?()
        }

        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { _ in
            self.deleteAction?()
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

        actionSheet.addAction(editAction)
        actionSheet.addAction(deleteAction)
        actionSheet.addAction(cancelAction)

        parentVC.present(actionSheet, animated: true, completion: nil)
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
