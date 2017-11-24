

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


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension FilmsListVC: FilmsListView {
    func setData(data: [FilmsListViewData]) {
        self.data = data
        tableView.reloadData()
    }
}

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
