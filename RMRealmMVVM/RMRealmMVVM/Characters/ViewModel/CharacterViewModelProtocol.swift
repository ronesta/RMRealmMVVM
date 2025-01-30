//
//  CharacterViewModelProtocol.swift
//  RMRealmMVVM
//
//  Created by Ибрагим Габибли on 30.01.2025.
//

import Foundation

protocol CharacterViewModelProtocol {
    var characters: Observable<[RealmCharacter]> { get set }

    func getCharacters()
    func numberOfCharacters() -> Int
    func character(at index: Int) -> RealmCharacter
}
