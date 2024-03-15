//
//  ViewController.swift
//  table_emoji
//
//  Created by Anastasia Tochilova  on 11.03.2024.
//

import UIKit

class EmojiViewController: UIViewController {

    // MARK: - Properties

    private let emojiTableView = UITableView()
    private var dataSource = ["😀", "😎", "🚀", "🎉", "🌈", "🍕", "🎸", "📱", "🍦", "🌟"]

    // MARK: - Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraint()
        setupUI()
    }

    // MARK: - UI Setup

    private func setupConstraint() {
        view.addSubview(emojiTableView)
        emojiTableView.translatesAutoresizingMaskIntoConstraints = false
        emojiTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        emojiTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        emojiTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        emojiTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    private func setupUI() {
        title = "Adding"
        let addButton = UIBarButtonItem(
            image: UIImage(systemName: "plus.app"),
            style: .plain,
            target: self, action: #selector(addButtonTapped)
        )
        navigationItem.rightBarButtonItem = addButton
        emojiTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        emojiTableView.dataSource = self
    }
    

    // MARK: - Actions
    @objc private func addButtonTapped() {
        let alertController = UIAlertController(title: "Add text", message: nil, preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.placeholder = "Enter text"
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let addAction = UIAlertAction(title: "Done", style: .default) { [weak self] _ in
            guard let textField = alertController.textFields?.first, let newValue = textField.text, !newValue.isEmpty else {
                return
            }
            self?.addValue(newValue)
        }
        alertController.addAction(addAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
    
    // MARK: - Helper Methods
    private func addValue(_ value: String) {
        dataSource.append(value)
        emojiTableView.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension EmojiViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        guard dataSource.count - 1 >= indexPath.row else { return cell }
        guard dataSource.indices.contains(indexPath.row) else { return cell }
        cell.textLabel?.text = dataSource[indexPath.row]
        return cell
    }
}
