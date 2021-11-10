//
//  ActorBioViewController.swift
//  ArtistTable
//
//  Created by David Marukhyan on 09.11.21.
//

import UIKit

class ActorBioViewController: UIViewController {
    var actor: Actor!
    
    @IBOutlet weak var actorBioImage: UIImageView!
    @IBOutlet weak var actorBioText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = actor.actorName
        actorBioImage.image = actor.image
        actorBioText.text = actor.actorBio
    }
}
