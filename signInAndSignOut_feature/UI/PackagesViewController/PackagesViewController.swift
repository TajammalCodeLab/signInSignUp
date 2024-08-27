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
    // MARK: - OVERRIDE FUNCTION -
    override func viewWillAppear(_ animated: Bool){
        self.navigationController?.navigationBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    // MARK: - IBAction -
    
    @IBAction func directTodashboardbtn(_ sender: Any) {
        directTodashboard()
    }
    
    // MARK: - Methods -
    private func updateDataArr() {
        tableViewPackages.register(UINib(nibName: "PackageCell", bundle: nil), forCellReuseIdentifier: "packagecell")
        packagesArr.append(Packages(title: "21 Days Umrah Package", image: "packageImage"))
        packagesArr.append(Packages(title: "41 Days Umrah Package", image: "packageImage"))
        packagesArr.append(Packages(title: "61 Days Umrah Package", image: "packageImage"))
        packagesArr.append(Packages(title: "81 Days Umrah Package", image: "packageImage"))
    }
    private func directTodashboard(){
        self.popBack()
    }
}
// MARK: - Extensions-
extension PackagesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return packagesArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewPackages.dequeueReusableCell(withIdentifier: "packagecell", for: indexPath) as! PackageCell
        cell.updateData(for: packagesArr[indexPath.row])
        cell.didSetDelegates(self, with: indexPath)
        return cell
    }
    /*
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            didDelete(for: indexPath) // Pass the entire IndexPath
        }
    }*/
}

extension PackagesViewController: PackagesDelegates{
    
    func didEdit(for indexpath: IndexPath?) {
        let alert = UIAlertController(title: "Edit Title", message: "Enter new title", preferredStyle: .alert)
        alert.addTextField { textField in
            textField.text = self.packagesArr[indexpath!.row].title
        }
        let saveAction = UIAlertAction(title: "Save", style: .default) { _ in
            if let newTitle = alert.textFields?.first?.text, !newTitle.isEmpty {
                self.packagesArr[indexpath!.row].title = newTitle
                self.tableViewPackages.reloadRows(at: [IndexPath(row: indexpath!.row, section: 0)], with: .automatic)
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func didDelete(for indexpath: IndexPath?) {
        packagesArr.remove(at: indexpath!.row)
        tableViewPackages.deleteRows(at: [IndexPath(row: indexpath!.row, section: 0)], with: .automatic)
    }
}


