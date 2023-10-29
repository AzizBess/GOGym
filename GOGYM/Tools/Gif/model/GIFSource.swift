//
//  File.swift
//  
//
//  Created by Igor Ferreira on 29/10/2020.
////  Source Code: https://github.com/igorcferreira/GIFImage

import Foundation

public enum GIFSource: Equatable {
    case remote(url: URL)
    case local(filePath: String)
    case `static`(data: Data)
}
