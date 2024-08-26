import UIKit

class PackagesViewController: BaseViewController {

    // MARK: - IBOutlet -
    @IBOutlet weak var tableViewPackages: UITableView!
    // MARK: - Variables -
    var packagesArr = [Packages]()
    // MARK: - Life Cycle -
    override func viewDidLoad() {
        super.viewDidLoad()

        updateDataArr()
        
    }
    
    // MARK: - Helper Methods -
    
    private func updateDataArr(){
        tableViewPackages.register(UINib(nibName: "PackageCell", bundle: nil), forCellReuseIdentifier: "packagecell")
        packagesArr.append(Packages(title: "21 Days Umrah Package", image: "packageImage"))
        packagesArr.append(Packages(title: "41 Days Umrah Package", image: "packageImage"))
        packagesArr.append(Packages(title: "61 Days Umrah Package", image: "packageImage"))
        packagesArr.append(Packages(title: "81 Days Umrah Package", image: "packageImage"))
        
    }
    private func deleteCell(at index: Int) {
        packagesArr.remove(at: index)
        tableViewPackages.deleteRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
    }
    
    private func presentEditAlert(at index: Int) {
        let alert = UIAlertController(title: "Edit Title", message: "Enter new title", preferredStyle: .alert)
        alert.addTextField { textField in
            textField.text = self.packagesArr[index].title
        }
        let saveAction = UIAlertAction(title: "Save", style: .default) { _ in
            if let newTitle = alert.textFields?.first?.text, !newTitle.isEmpty {
                self.packagesArr[index].title = newTitle
                self.tableViewPackages.reloadRows(at: [IndexPath(row: index, section: 0)], with: .automatic)

            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
}

extension PackagesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return packagesArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewPackages.dequeueReusableCell(withIdentifier: "packagecell", for: indexPath) as! PackageCell
        cell.updateData(for: packagesArr[indexPath.row])
        return cell
    }
    
    // Adding editing style for deletion
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deleteCell(at: indexPath.row)
        }
    }
    
    // Handling row selection
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presentEditAlert(at: indexPath.row)
    }
}
