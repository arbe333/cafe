//
//  WebViewController.swift
//  cafe
//
//  Created by arbe on 2020/12/24.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    var url = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let url = URL(string: url) {
            let request = URLRequest(url: url)
            webView.load(request)
        }
        
        // Do any additional setup after loading the view.
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
