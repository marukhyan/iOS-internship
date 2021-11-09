//
//  ViewController.swift
//  ArtistTable
//
//  Created by David Marukhyan on 08.11.21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var actorsTableView: UITableView!
    var actors = arrayWithActorsData()
    
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
        let cell = actorsTableView.dequeueReusableCell(withIdentifier: "ActorCell") as! ActorsTableViewCell
        cell.actorName.text = actors[indexPath.row].actorName
        cell.actorImage.image = actors[indexPath.row].image
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let secondVC = storyBoard.instantiateViewController(identifier: "ActorVCID") as! ActorBioViewController
        navigationController?.pushViewController(secondVC, animated: true)
        secondVC.actor = actors[indexPath.row]
    }
}
