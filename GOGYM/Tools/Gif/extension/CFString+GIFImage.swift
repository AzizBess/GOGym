//
//  File.swift
//  
//
//  Created by Igor Ferreira on 05/04/2022.
////  Source Code: https://github.com/igorcferreira/GIFImage

import Foundation
import ImageIO

extension CFString {
    var asKey: UnsafeMutableRawPointer {
        return Unmanaged.passUnretained(self).toOpaque()
    }
}
