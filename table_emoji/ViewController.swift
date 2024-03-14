//
//  ViewController.swift
//  table_emoji
//
//  Created by Anastasia Tochilova  on 11.03.2024.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Properties

    let tableView = UITableView()
    var emojis = ["😀", "😎", "🚀", "🎉", "🌈", "🍕", "🎸", "📱", "🍦", "🌟"]

    // MARK: - Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupTableView()
    }

    // MARK: - UI Setup

    func setupNavigationBar() {
        self.title = "Adding"
        
        let addButton = UIBarButtonItem(image: UIImage(systemName: "plus.app"), style: .plain, target: self, action: #selector(addButtonTapped))
        
        navigationItem.rightBarButtonItem = addButton
    }

    func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
    }

    // MARK: - Actions

    @objc func addButtonTapped() {
        let alertController = UIAlertController(title: "Add text", message: nil, preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.placeholder = "Enter text"
        }
        
        let addAction = UIAlertAction(title: "Done", style: .default) { [weak self] _ in
            guard let textField = alertController.textFields?.first, let newValue = textField.text, !newValue.isEmpty else {
                return
            }
            self?.addValue(newValue)
        }
        alertController.addAction(addAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    // MARK: - Helper Methods

    func addValue(_ value: String) {
        emojis.append(value)
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojis.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = emojis[indexPath.row]
        return cell
    }
}
