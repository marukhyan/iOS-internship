//
//  ActorBioViewController.swift
//  ArtistTable
//
//  Created by David Marukhyan on 09.11.21.
//

import UIKit

class ActorBioViewController: UIViewController {
    var img = UIImage()
    var text = ""
    
   
    
    @IBOutlet weak var actorBioImage: UIImageView!
    @IBOutlet weak var actorBioText: UITextView!
    override func viewDidLoad() {
        //title = actors[index?]
        //actorBioImage.image = UIImage(named: actors[index!])
        super.viewDidLoad()
        actorBioText.text = text
        actorBioImage.image = img
    }
    

}
