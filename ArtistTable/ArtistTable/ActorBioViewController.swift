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
    
    var actorBios = ["Jim Carry": "James Eugene Carrey (born January 17, 1962)[2] is a Canadian-American actor, comedian, writer, and producer. Known for his energetic slapstick performances,[3] Carrey first gained recognition in 1990, after landing a recurring role in the American sketch comedy television series In Living Color (1990–1994)",
                     "Johnny Depp": "John Christopher Depp II (born June 9, 1963) is an American actor, producer, and musician. He is the recipient of various accolades, including a Golden Globe Award and a Screen Actors Guild Award, in addition to nominations for three Academy Awards and two British Academy Film Awards.",
                     "Al Pacino": "Alfredo James Pacino; born April 25, 1940) is an American actor and filmmaker. Throughout his career spanning over five decades, he has received numerous accolades, including an Academy Award, two Tony Awards, and two Primetime Emmy Awards, making him one of the few performers to have achieved the Triple Crown of Acting.",
                     "Tom Hanks": "Thomas Jeffrey Hanks was born in Concord, California, to Janet Marylyn (Frager), a hospital worker, and Amos Mefford Hanks, an itinerant cook. His mother's family, originally surnamed \"Fraga\", was entirely Portuguese, while his father was of mostly English ancestry.",
                     "Samuel L. Jackson": "Samuel Leroy Jackson (born December 21, 1948) is an American actor and producer. Widely regarded as one of the most popular actors of his generation, the films in which he has appeared have collectively grossed over $27 billion worldwide, making him the highest-grossing actor of all time (when cameo appearances are excluded).",
                     "Will Smith": "Willard Carroll Smith Jr. (born September 25, 1968) is an American actor, rapper, and film producer. Smith has been nominated for five Golden Globe Awards and two Academy Awards, and has won four Grammy Awards. During the late 1980s, he achieved modest fame as a rapper under the name the Fresh Prince.",
                     "Robert De Niro": "Robert Anthony De Niro Jr. (/də ˈnɪəroʊ/ də NEER-oh, Italian: [de ˈniːro]; born August 17, 1943) is an American actor, producer, and director. He is particularly known for his nine collaborations with filmmaker Martin Scorsese, and is the recipient of various accolades, including two Academy Awards, a Golden Globe Award, the Cecil B. DeMille Award, and a Screen Actors Guild Life Achievement Award.",
                     "Scarlett Johansson": "Scarlett Ingrid Johansson was born on November 22, 1984 in Manhattan, New York City, New York. Her mother, Melanie Sloan is from a Jewish family from the Bronx and her father, Karsten Johansson is a Danish-born architect from Copenhagen"
    ]
    
    @IBOutlet weak var actorBioImage: UIImageView!
    @IBOutlet weak var actorBioText: UITextView!
    override func viewDidLoad() {
        //title = actors[index?]
        //actorBioImage.image = UIImage(named: actors[index!])
        super.viewDidLoad()
        actorBioText.text = actorBios[text]
        actorBioImage.image = img
    }
    

}
