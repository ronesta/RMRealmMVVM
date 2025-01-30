//
//  CharacterDataSourceProtocol.swift
//  RMRealmMVVM
//
//  Created by Ибрагим Габибли on 30.01.2025.
//

import Foundation
import UIKit

protocol CharacterDataSourceProtocol: UITableViewDataSource {
    var viewModel: CharacterViewModelProtocol? { get set }
    var storageManager: StorageManagerProtocol? { get set }
}
