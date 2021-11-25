//
//  ViewController.swift
//  PhotoLibrary
//
//  Created by David Marukhyan on 23.11.21.
//

import UIKit

struct APIResponse: Codable {
    let total: Int
    let totalPages: Int
    let results: [Result]
    
    enum CodingKeys: String, CodingKey {
        case total
        case totalPages = "total_pages"
        case results
    }
}

struct Result: Codable {
    let id: String
    let urls: URLS
}

struct URLS: Codable {
    let regular: String
}

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    let cache = NSCache<NSString, UIImage>()
    var results: [Result] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        searchBar.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        self.hideKeyboardWhenTappedAround()
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            UIView.animate(withDuration: 0.1, animations: { () -> Void in
                if self.view.frame.origin.y == 0 {
                    self.view.frame.origin.y -= keyboardSize.height
                    self.view.layoutIfNeeded()
                }
            })
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        self.view.frame.origin.y = 0
        
    }
    
    func getPhotos(query: String) {
        let urlLink = "https://api.unsplash.com/search/photos?page=1&per_page=100&query=\(query)&client_id=w5vn5RieDFIIxWk_EEbUPOHzpOqIkVlBTHM2vrZi0PI"
        
        guard let url = URL(string: urlLink) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else { return }
            do {
                let json = try JSONDecoder().decode(APIResponse.self, from: data)
                
                DispatchQueue.main.async {
                    self.results = json.results
                    self.collectionView.reloadData()
                }
            }
            catch {
                print(error)
            }
        }.resume()
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return results.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let imageURL = results[indexPath.row].urls.regular
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
        
        if let image = cache.object(forKey: imageURL as NSString) {
            cell.imageView.image = image
            
        } else if let url = URL(string: imageURL) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else {return}
                DispatchQueue.main.async {
                    if let image = UIImage(data: data) {
                        self.cache.setObject(image, forKey: imageURL as NSString)
                        cell.imageView.image = image
                    } else {
                        cell.imageView.image = nil
                    }
                }
            }.resume()
        }
        return cell
    }
}

extension ViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchBar.text {
            results = []
            collectionView.reloadData()
            getPhotos(query: text)
        }
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
