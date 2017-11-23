

import Foundation
import SwiftyJSON

struct DataProvider {
    
    private static func parseFilms(json: JSON) -> [Film]{
        guard let  json = json["films"].array else{
            return []
        }
        return json.flatMap(Film.init)
    }
    
    static func getFilms(completion: @escaping ([Film]) -> Void){
        let path = Bundle.main.path(forResource: "films", ofType: "json")
        let jsonData = try! Data(contentsOf: URL(fileURLWithPath: path!))
        let films: [Film] = parseFilms(json: JSON(jsonData))
        completion(films)
        
    }
    
}
