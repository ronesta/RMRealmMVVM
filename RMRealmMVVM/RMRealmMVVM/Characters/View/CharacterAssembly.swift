//
//  CharacterAssembly.swift
//  RMRealmMVVM
//
//  Created by Ибрагим Габибли on 30.01.2025.
//

import Foundation
import UIKit

struct CharacterAssembly {
    func build() -> UIViewController {
        let viewController = CharacterViewController()
        let tableViewDataSource = CharacterTableViewDataSource()
        let storageManager = StorageManager()
        let networkManager = NetworkManager()

        let characterViewModel = CharacterViewModel(
            networkManager: networkManager,
            storageManager: storageManager
        )

        viewController.tableViewDataSource = tableViewDataSource
        viewController.viewModel = characterViewModel

        tableViewDataSource.viewModel = characterViewModel
        tableViewDataSource.storageManager = storageManager

        let navigationController = UINavigationController(rootViewController: viewController)
        return navigationController
    }
}
