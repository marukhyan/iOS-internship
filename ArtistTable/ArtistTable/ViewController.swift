//
//  ViewController.swift
//  ArtistTable
//
//  Created by David Marukhyan on 08.11.21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var actorsTableView: UITableView!
    var actorManager = ActorManager()
    var actors:[Actor]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        actorsTableView.delegate = self
        actorsTableView.dataSource = self
        actorsTableView.separatorStyle = .none
        actors = actorManager.generateActors()
    }
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return actors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = actorsTableView.dequeueReusableCell(withIdentifier: "ActorCell") as! ActorsTableViewCell
        let customActor = actors[indexPath.row]
        cell.actorName.text = customActor.actorName
        cell.actorImage.image = customActor.image
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let secondVC = storyBoard.instantiateViewController(identifier: "ActorVCID") as! ActorBioViewController
        secondVC.actor = actors[indexPath.row]
        navigationController?.pushViewController(secondVC, animated: true)
    }
}
