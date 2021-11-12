//
//  ActorData.swift
//  ArtistTable
//
//  Created by David Marukhyan on 09.11.21.
//

import Foundation
import UIKit

final class Actor {
    let actorName: String
    let actorBio: String
    let image: UIImage
    
    init(actorName: String, actorBio: String) {
        self.actorName = actorName
        self.image = UIImage(named: actorName)!
        self.actorBio = actorBio
    }
}

final class ActorManager {
    
    private let data = [
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
    
    func generateActors() -> [Actor] {
        
        var actors:[Actor] = []
        
        for (name, bio) in data {
            let actor = Actor(actorName: name, actorBio: bio)
            actors.append(actor)
        }
        
        return actors
    }
}
