

import UIKit

class FilmCell: UITableViewCell {

    @IBOutlet weak var localizedNameLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var ratingLbl: UILabel!
    
    func configure(film:Film) {
        localizedNameLbl.text = film.localizedName
        nameLbl.text = film.name
        ratingLbl.text = String(film.rating)
    }
}

extension FilmCell {
    static var reuseIdentifier: String {
        return String(describing: FilmCell.self)
        
    }
    static var nib: UINib {
        return UINib(nibName: String(describing: FilmCell.self), bundle: nil)
    }
}
