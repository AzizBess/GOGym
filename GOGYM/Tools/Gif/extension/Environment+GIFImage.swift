//
//  File.swift
//  
//
//  Created by Igor Ferreira on 05/04/2022.
////  Source Code: https://github.com/igorcferreira/GIFImage

import SwiftUI

struct GIFImageEnvironment: EnvironmentKey {
    static var defaultValue: ImageLoader = {
        return ImageLoader()
    }()
}

extension EnvironmentValues {
    var imageLoader: ImageLoader {
        get { self[GIFImageEnvironment.self] }
        set { self[GIFImageEnvironment.self] = newValue }
    }
}
