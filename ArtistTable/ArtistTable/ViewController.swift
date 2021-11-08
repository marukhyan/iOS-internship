//
//  ViewController.swift
//  ArtistTable
//
//  Created by David Marukhyan on 08.11.21.
//

import UIKit

class ViewController: UIViewController {

    var actors = ["Jim Carry", "Johnny Depp", "Al Pacino", "Tom Hanks", "Samuel L. Jackson", "Will Smith", "Robert De Niro", "Scarlett Johansson"]
    
    @IBOutlet weak var actorsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        actorsTableView.delegate = self
        actorsTableView.dataSource = self
        
        actorsTableView.separatorStyle = .none
            
    }
   
}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return actors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = actorsTableView.dequeueReusableCell(withIdentifier: "ActorCell") as! ActorsList
        let actor = actors[indexPath.row]
        cell.actorName.text = actor
        cell.actorImage.image = UIImage(named: actor)
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let secondVC = storyBoard.instantiateViewController(identifier: "ActorVCID") as! ActorBioViewController
        navigationController?.pushViewController(secondVC, animated: true)
        secondVC.img = UIImage(named: actors[indexPath.row])!
        secondVC.text = actors[indexPath.row]
    }
}
