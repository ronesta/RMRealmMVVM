//
//  CharacterTableViewDataSource.swift
//  RMRealmMVVM
//
//  Created by Ибрагим Габибли on 30.01.2025.
//

import Foundation
import UIKit

final class CharacterTableViewDataSource: NSObject, CharacterDataSourceProtocol {
    var viewModel: CharacterViewModelProtocol?
    var storageManager: StorageManagerProtocol?

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.numberOfCharacters() ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CharacterTableViewCell.id,
            for: indexPath
        ) as? CharacterTableViewCell else {
            return UITableViewCell()
        }

        guard let character = viewModel?.character(at: indexPath.row) else {
            return UITableViewCell()
        }

        guard let imageData = storageManager?.fetchImageData(forCharacterId: character.id),
              let image = UIImage(data: imageData) else {
            return cell
        }

        let viewModel = CharacterCellViewModel(character: character, image: image)

        cell.configure(with: viewModel)

        return cell
    }
}
