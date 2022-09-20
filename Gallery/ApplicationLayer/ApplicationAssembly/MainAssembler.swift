//
//  MainAssembler.swift
//  Gallery
//
//  Created by bekkerman on 12.09.2022.
//

import Swinject
import Foundation

final class MainAssembler {
    static let assembler = Assembler([
        ServiceAssembly(),
        MenuViewAssembly(),
        GalleryAssembly()
    ])

    private init() {
    }
}
