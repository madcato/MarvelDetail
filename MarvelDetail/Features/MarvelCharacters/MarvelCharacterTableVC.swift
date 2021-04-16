//
//  MarvelCharacterTableVC.swift
//  MarvelDetail
//
//  Created by Daniel Vela on 14/4/21.
//

import UIKit

class MarvelCharacterTableVC: UITableViewController {

    internal var activityIndicator = UIActivityIndicatorView()

    private var service = MarvelService()
    private var data: [Marvel.CharacterDto] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        configureActivityInCenter(of: view)
        loadData()
    }

    private func loadData() {
        startActivity()
        service.listCharacters { result in
            DispatchQueue.main.async {
                self.stopActivity()
                switch result {
                case let .success(characters):
                    self.data = characters
                    self.tableView.reloadData()
                case let .failure(error):
                    self.showAlert(error.localizedDescription)
                    print("\(error.localizedDescription)")
                }
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MarvelTableViewCell.kCellId,
                                                       for: indexPath) as? MarvelTableViewCell else {
            fatalError("Invalid MarvelTableViewCell.kCellId. Is the cell defined in the table?")
        }
        guard let character = data.item(at: indexPath.row) else {
            fatalError("Invalid index data for table data")
        }

        cell.setCharacter(character)

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: MarvelCharacterDetailVC.segueId, sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == MarvelCharacterDetailVC.segueId {
            guard let indexPath = tableView.indexPathForSelectedRow,
                  let character = data.item(at: indexPath.row),
                  let detailController = segue.destination as? MarvelCharacterDetailVC else {
                fatalError("Invalid index data for selected cell")
            }
            detailController.character = character
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
}

// MARK: - Activity indicator

extension MarvelCharacterTableVC: ActivityProtocol {
}
