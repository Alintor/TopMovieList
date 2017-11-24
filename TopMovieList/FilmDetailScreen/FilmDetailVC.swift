

import UIKit
import Kingfisher

class FilmDetailVC: UIViewController {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var yearLbl: UILabel!
    @IBOutlet weak var ratingLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var filmImageView: UIImageView!
    
    var film:Film!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
    }
    
    func configureView() {
        navigationItem.title = film.localizedName
        nameLbl.text = film.name
        yearLbl.text = String(film.year)
        ratingLbl.text = String(film.rating)
        descriptionLbl.text = film.desc
        filmImageView.kf.indicatorType = .activity
        filmImageView.kf.setImage(with: film.imageURL)
    }

}
