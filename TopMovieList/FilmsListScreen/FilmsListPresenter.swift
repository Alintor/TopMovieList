

import Foundation

struct FilmsListViewData {
    let year:String
    let films:[Film]
}

protocol FilmsListView: NSObjectProtocol {
    func setData(data:[FilmsListViewData])
}

class FilmsListPresenter {
    weak private var view : FilmsListView?
    
    func attachView(view: FilmsListView) {
        self.view = view
    }
    
    func getFilms() {
        DataProvider.getFilms { (films) in
            let years = Set(films.map({ $0.year })).sorted(by: { $0 < $1 })
            var data = [FilmsListViewData]()
            //Group films by year
            for year in years {
                let sortedFilms = films.filter({ $0.year == year }).sorted(by: { $0.rating > $1.rating })
                data.append(FilmsListViewData(year: String(year), films: sortedFilms))
            }
            self.view?.setData(data: data)
        }
    }
}
