//
//  CafeTableViewController.swift
//  cafe
//
//  Created by arbe on 2020/12/18.
//

import UIKit

class CafeTableViewController: UITableViewController {
    
    func fetchItems() {
        let urlStr = "https://cafenomad.tw/api/v1.2/cafes"
        
        if let url = URL(string: urlStr) {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            let task = URLSession.shared.dataTask(with: url) { (data, responce, error) in
                if let data = data {
                    do {
                        let searchResponse = try decoder.decode([Cafe].self, from: data)
                        Cafee.shareData = searchResponse
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    } catch {
                        print(error)
                    }
                }
            }
            task.resume()
        }
    }
    
    @IBSegueAction func showDetail(_ coder: NSCoder) -> CafeDetailViewController? {
        guard let row = tableView.indexPathForSelectedRow?.row else { return nil }
        return CafeDetailViewController(coder: coder, cafe: Cafee.shareData[row])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchItems()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Cafee.shareData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cafeCell", for: indexPath)
        
        let cafe = Cafee.shareData[indexPath.row]
        cell.textLabel?.text = cafe.name
        cell.detailTextLabel?.text = cafe.city
        
        return cell
    }
}
