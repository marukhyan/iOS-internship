//
//  ViewController.swift
//  ArtistTable
//
//  Created by David Marukhyan on 08.11.21.
//

import UIKit

class ViewController: UIViewController {
    
    var actors = ["Jim Carry", "Johnny Depp", "Al Pacino", "Tom Hanks", "Samuel L. Jackson", "Will Smith", "Robert De Niro", "Scarlett Johansson", "Adam Sandler", "Robert Downey Jr."]
    var actorBios = [
        "Jim Carry": "James Eugene Carrey (born January 17, 1962)[2] is a Canadian-American actor, comedian, writer, and producer. Known for his energetic slapstick performances,[3] Carrey first gained recognition in 1990, after landing a recurring role in the American sketch comedy television series In Living Color (1990–1994)",
        "Johnny Depp": "John Christopher Depp II (born June 9, 1963) is an American actor, producer, and musician. He is the recipient of various accolades, including a Golden Globe Award and a Screen Actors Guild Award, in addition to nominations for three Academy Awards and two British Academy Film Awards.",
        "Al Pacino": "Alfredo James Pacino; born April 25, 1940) is an American actor and filmmaker. Throughout his career spanning over five decades, he has received numerous accolades, including an Academy Award, two Tony Awards, and two Primetime Emmy Awards, making him one of the few performers to have achieved the Triple Crown of Acting.",
        "Tom Hanks": "Thomas Jeffrey Hanks was born in Concord, California, to Janet Marylyn (Frager), a hospital worker, and Amos Mefford Hanks, an itinerant cook. His mother's family, originally surnamed \"Fraga\", was entirely Portuguese, while his father was of mostly English ancestry.",
        "Samuel L. Jackson": "Samuel Leroy Jackson (born December 21, 1948) is an American actor and producer. Widely regarded as one of the most popular actors of his generation, the films in which he has appeared have collectively grossed over $27 billion worldwide, making him the highest-grossing actor of all time (when cameo appearances are excluded).",
        "Will Smith": "Willard Carroll Smith Jr. (born September 25, 1968) is an American actor, rapper, and film producer. Smith has been nominated for five Golden Globe Awards and two Academy Awards, and has won four Grammy Awards. During the late 1980s, he achieved modest fame as a rapper under the name the Fresh Prince.",
        "Robert De Niro": "Robert Anthony De Niro Jr. (/də ˈnɪəroʊ/ də NEER-oh, Italian: [de ˈniːro]; born August 17, 1943) is an American actor, producer, and director. He is particularly known for his nine collaborations with filmmaker Martin Scorsese, and is the recipient of various accolades, including two Academy Awards, a Golden Globe Award, the Cecil B. DeMille Award, and a Screen Actors Guild Life Achievement Award.",
        "Scarlett Johansson": "Scarlett Ingrid Johansson was born on November 22, 1984 in Manhattan, New York City, New York. Her mother, Melanie Sloan is from a Jewish family from the Bronx and her father, Karsten Johansson is a Danish-born architect from Copenhagen",
        "Adam Sandler": "Adam Richard Sandler (born September 9, 1966) is an American actor, comedian, and filmmaker. He was a cast member on Saturday Night Live from 1990 to 1995, before going on to star in many Hollywood films, which have combined to earn more than $2 billion at the box office.",
        "Robert Downey Jr.": "Robert John Downey Jr. (born April 4, 1965)[1] is an American actor and producer. His career has been characterized by critical and popular success in his youth, followed by a period of substance abuse and legal troubles, before a resurgence of commercial success later in his career. "
    ]
    
    
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
        let cell = actorsTableView.dequeueReusableCell(withIdentifier: "ActorCell") as! ActorsTableViewCell
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
        secondVC.text = actorBios[actors[indexPath.row]]!
    }
}
