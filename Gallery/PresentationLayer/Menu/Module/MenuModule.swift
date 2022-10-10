//
//  MenuModule.swift
//  Gallery
//
//  Created by Kate Bekkerman on 20/09/2022.
//  Copyright © 2022 katebekk. All rights reserved.
//

import Foundation

protocol MenuModule {
    var moduleOutput: MenuModuleOutput? { get set }
}

protocol MenuModuleOutput: AnyObject {
}
