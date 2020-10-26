//
//  ContactViewController.swift
//  1026_DesafioTabBar
//
//  Created by Jorge Roberto on 26/10/20.
//

import UIKit

class ContactViewController: UIViewController {
    var arrayInfo = ["Entre em contato pelo telefone | (11) 4858-4000", "Entre em contato pelo email | contato@digitalhouse.com", "Entre em contato pelo nosso site | https://www.digitalhouse.com/", "Avalie o App"]
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        title = "Contact"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension ContactViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row == 1){
            guard let url = URL(string: "mailto:jorgercj@dcomp.ufs.br") else { return }
            UIApplication.shared.open(url)
        }
        if(indexPath.row == 2){
            guard let url = URL(string: "https://www.digitalhouse.com/") else { return }
            UIApplication.shared.open(url)
        }
    }
}

extension ContactViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayInfo.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactTableViewCell") as! ContactTableViewCell
        cell.setup(info: arrayInfo[indexPath.row])
        return cell
    }
    
    
}
