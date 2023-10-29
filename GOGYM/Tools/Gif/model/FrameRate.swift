//
//  File.swift
//  
//
//  Created by Igor Ferreira on 06/04/2022.
////  Source Code: https://github.com/igorcferreira/GIFImage

import Foundation

public enum FrameRate {
    case dynamic
    case limited(fps: Int)
    case `static`(fps: Int)
}
