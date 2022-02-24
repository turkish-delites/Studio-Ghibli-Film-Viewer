//
//  MovieInfo.swift
//  Studio Ghibli Film Viewer
//
//  Created by Evan Bakkal on 2/24/22.
//

import Foundation

struct MovieInfo: Decodable {
    let title: String
    let original_title: String
    let description: String
    let release_date: String
    let image: String
}
