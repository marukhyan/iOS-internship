//
//  ViewController.swift
//  PhotoLibrary
//
//  Created by David Marukhyan on 23.11.21.
//

import UIKit

struct APIResponse: Codable {
    let total: Int
    let total_pages: Int
    let results: [Result]
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
    
    var results: [Result] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        searchBar.delegate = self
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
        cell.setup(with: imageURL)
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
