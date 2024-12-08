//
//  ApexPredatorModel.swift
//  JurassicPredators
//
//  Created by Olha Pelypets on 07/12/2024.
//

import Foundation
import MapKit
import SwiftUI

struct ApexPredatorModel: Decodable, Identifiable {
    let id: Int
    let name: String
    let type: PredatorType
    let latitude: Double
    let longitude: Double
    let movies: [String]
    let movieScenes: [MovieSceneModel]
    let link: String

    var image: String {
        name.lowercased().replacingOccurrences(of: " ", with: "")
    }

    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: latitude,
            longitude: longitude)
    }

    struct MovieSceneModel: Decodable, Identifiable {
        let id: Int
        let movie: String
        let sceneDescription: String
    }
}

enum PredatorType: String, Decodable, CaseIterable, Identifiable {
    var id: PredatorType {
        self
    }

    case all
    case land
    case air
    case sea

    var background: Color {
        switch self {
        case .land:
            .brown
        case .air:
            .teal
        case .sea:
            .blue
        case .all:
            .white
        }
    }

    var icon: String {
        switch self {
        case .land:
            "leaf.fill"
        case .air:
            "wind"
        case .sea:
            "drop.fill"
        case .all:
            "square.stack.3d.up.fill"
        }
    }
}
