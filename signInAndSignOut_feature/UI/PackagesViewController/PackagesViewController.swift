import UIKit

class PackagesViewController: BaseViewController {
    
    // MARK: - IBOutlet -
    @IBOutlet weak var tableViewPackages: UITableView!
    
    // MARK: - Variables -
    var packagesArr = [Packages]()
    var currentImage: UIImageView?
    
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
        tableViewPackages.register(UINib(nibName: "PackageCell", bundle: nil), forCellReuseIdentifier: Identifiers.PACKAGESC_CELL_ID)
        packagesArr.append(Packages(title: "21 Days Umrah Package", image: "image_1"))
        packagesArr.append(Packages(title: "41 Days Umrah Package", image: "image_2"))
        packagesArr.append(Packages(title: "61 Days Umrah Package", image: "image_3"))
        packagesArr.append(Packages(title: "81 Days Umrah Package", image: "image_4"))
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
        let cell = tableViewPackages.dequeueReusableCell(withIdentifier: Identifiers.PACKAGESC_CELL_ID, for: indexPath) as! PackageCell
        cell.updateData(for: packagesArr[indexPath.row])
        cell.didSetDelegates(self, with: indexPath)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}


extension PackagesViewController: PackagesDelegates{
    
    func didEdit(for indexpath: IndexPath?) {
        let alert = UIAlertController(title: StringContants.EDIT_TITLE, message: StringContants.NEW_TITLE_MASSEGE, preferredStyle: .alert)
        alert.addTextField { textField in
            textField.text = self.packagesArr[indexpath!.row].title
        }
        
        let saveAction = UIAlertAction(title: StringContants.SAVE_TITLE, style: .default) { _ in
            if let newTitle = alert.textFields?.first?.text, !newTitle.isEmpty {
                self.packagesArr[indexpath!.row].title = newTitle
                self.tableViewPackages.reloadData()
                
            }
        }
        let cancelAction = UIAlertAction(title: StringContants.CENCLE_TITLE, style: .cancel, handler: nil)
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
    func didDelete(for indexpath: IndexPath?) {
        packagesArr.remove(at: indexpath?.row ?? 0)
        tableViewPackages.deleteRows(at: [IndexPath(row: indexpath?.row ?? 0, section: 0)], with: .automatic)
        tableViewPackages.reloadData()
    }
    
    func didShowAlert(for indexpath: IndexPath?) {
        let actionSheet = UIAlertController(title: "Actions", message: StringContants.CHOOSE_MASSEGE, preferredStyle: .actionSheet)
        
        let editAction = UIAlertAction(title: StringContants.EDIT_TITLE, style: .default) { action in
            self.didEdit(for: indexpath)
        }
        
        let deleteAction = UIAlertAction(title: StringContants.DEL_TITLE, style: .destructive) { [self] action in
            self.didDelete(for: indexpath)
        }
        
        let cancelAction = UIAlertAction(title: StringContants.CENCLE_TITLE, style: .cancel, handler: nil)
        
        actionSheet.addAction(editAction)
        actionSheet.addAction(deleteAction)
        actionSheet.addAction(cancelAction)
        self.present(actionSheet, animated: true, completion: nil)
        
    }
    
}
extension PackagesViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func didImagePicker(imagePackage: UIImageView) {
        currentImage = imagePackage
        let imagePickerAlter = UIAlertController(title: "Choose an Image", message: "Select image from", preferredStyle: .actionSheet)
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { (action) in
            /// Code
            self.showImagePicker(selectedSource: .camera)
        }
        let photoAction = UIAlertAction(title: "Photos", style: .default) { (action) in
            /// Code
            self.showImagePicker(selectedSource: .photoLibrary)
        }
        let cencleAction = UIAlertAction(title: "Cencle", style: .cancel)
        imagePickerAlter.addAction(cameraAction)
        imagePickerAlter.addAction(photoAction)
        imagePickerAlter.addAction(cencleAction)
        self.present(imagePickerAlter, animated: true, completion: nil)
        
    }
    
    func showImagePicker(selectedSource : UIImagePickerController.SourceType){
        guard UIImagePickerController.isSourceTypeAvailable(selectedSource) else{
            print("No image source found")
            return
        }
        let imagepickerController = UIImagePickerController()
        imagepickerController.delegate = self
        imagepickerController.sourceType = selectedSource
        imagepickerController.allowsEditing = false
        self.present(imagepickerController, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            // access here
            if let imagePackage = self.currentImage {
                imagePackage.image = selectedImage
            }
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
}


