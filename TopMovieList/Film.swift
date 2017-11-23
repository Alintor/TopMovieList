
import UIKit
import SwiftyJSON

class Film: NSObject {
    let name:String
    let localizedName:String
    let year:Int
    let rating:Double
    let imageURL: URL
    let desc:String
    
    init?(json: JSON) {
        guard
            let name = json["name"].string,
            let localizedName = json["localized_name"].string,
            let year = json["year"].int,
            let rating = json["rating"].double,
            let imageURL = json["image_url"].url,
            let desc = json["description"].string
        else {
            return nil
        }
        self.name = name
        self.localizedName = localizedName
        self.year = year
        self.rating = rating
        self.imageURL = imageURL
        self.desc = desc
    }
}
