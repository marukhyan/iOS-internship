//
//  ActorsList.swift
//  ArtistTable
//
//  Created by David Marukhyan on 08.11.21.
//

import UIKit

class ActorsList: UITableViewCell {

    @IBOutlet weak var actorImage: UIImageView!
    @IBOutlet weak var actorName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
