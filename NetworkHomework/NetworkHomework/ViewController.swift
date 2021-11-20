//
//  ViewController.swift
//  NetworkHomework
//
//  Created by David Marukhyan on 19.11.21.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextView!
    @IBOutlet weak var requestButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func requstTaped(_ sender: Any) {
        getData(from: "https://developer.o2.cz/mobility/sandbox/api/info")
    }
    
    private func getData(from url: String){
        let session = URLSession(configuration: .default)
        let result = NSMutableAttributedString()
        session.dataTask(with: URL(string: url)!) { data, response, error in
            
            let object = try! JSONSerialization.jsonObject(with: data!, options: .fragmentsAllowed)
            let dict = object as! [String: String]
            let sortedKeys = Array(dict.keys).sorted(by: <)
            for key in sortedKeys {
                
                let keyatribute = NSAttributedString(string: "\"" + key + "\": ", attributes: [.foregroundColor: UIColor.red])
                result.append(keyatribute)
                
                let valueatribute = NSAttributedString(string: "\"" + dict[key]!  + "\"\n", attributes: [.foregroundColor: UIColor.green])
                result.append(valueatribute)
            }
            
            DispatchQueue.main.async {
                self.textField.attributedText = result
            }
        }.resume()
    }
}
