//
//  ViewController.swift
//  NYTimesDemo
//
//  Created by Gajula Ravi Kiran on 27/02/2022.
//

import UIKit

class ViewController: BaseViewController {
    @IBOutlet weak var homeTableView: UITableView!
    var viewModel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        initHomeTableView()
        self.title = "New York Times"
    }

}

//MARK: Register TableView Cells
extension ViewController {
    private func registerHomeTableViewCell() {
        homeTableView.register(UINib(nibName: HomeTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: HomeTableViewCell.identifier)
    }
    
    private func initHomeTableView() {
        registerHomeTableViewCell()
        homeTableView.dataSource = self
        homeTableView.delegate = self
    }
}

extension ViewController {
    
    func navigateToDetails() {
        let vc = ArticlesListViewViewController.instantiate()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

/*extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as? HomeTableViewCell
        else { return UITableViewCell() }
        let title = viewModel.rowTitleForIndex(indexPath: indexPath)
        cell.leftLabel.text = title
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = UIColor.lightGray
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.font = UIFont.boldSystemFont(ofSize: 16.0)
        header.textLabel?.textColor = .black
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.sectionTitle(section: section)
    }
}*/
