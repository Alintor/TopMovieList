

import UIKit

class FilmsListVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var data = [FilmsListViewData]()
    let presenter = FilmsListPresenter()

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.attachView(view: self)
        presenter.getFilms()
        tableView.register(FilmCell.nib, forCellReuseIdentifier: FilmCell.reuseIdentifier)
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == String(describing: FilmDetailVC.self) {
            if let filmDetailVC = segue.destination as? FilmDetailVC,
                let film = sender as? Film {
                filmDetailVC.film = film
            }
        }
    }

}

//MARK: - FilmsListView implementation
extension FilmsListVC: FilmsListView {
    func setData(data: [FilmsListViewData]) {
        self.data = data
        tableView.reloadData()
    }
}

//MARK: - UITableViewDataSource implementation
extension FilmsListVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].films.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return data[section].year
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let film = data[indexPath.section].films[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: FilmCell.reuseIdentifier, for: indexPath) as! FilmCell
        cell.configure(film: film)
        return cell
    }
}

//MARK: - UITableViewDelegate implementation
extension FilmsListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let film = data[indexPath.section].films[indexPath.row]
        performSegue(withIdentifier: String(describing: FilmDetailVC.self), sender: film)
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = Constants.Colors.darkColor
        if let headerView = view as? UITableViewHeaderFooterView {
            headerView.textLabel?.textColor = Constants.Colors.whiteColor
        }
    }
}
