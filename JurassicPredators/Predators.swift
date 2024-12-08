//
//  Predators.swift
//  JurassicPredators
//
//  Created by Olha Pelypets on 07/12/2024.
//

import Foundation

class Predators {
    var apexPredators: [ApexPredatorModel] = []
    var allApexPredators: [ApexPredatorModel] = []

    init() {
        devodePredatorsData()
    }

    func devodePredatorsData() {
        if let url = Bundle.main.url(
            forResource: "jpapexpredators", withExtension: "json")
        {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                allApexPredators =
                    try decoder
                    .decode([ApexPredatorModel].self, from: data)
                apexPredators = allApexPredators
            } catch {
                print("Error of decoding JSON data: \(error)")
            }
        }
    }

    func search(for searchTerm: String) -> [ApexPredatorModel] {
        if searchTerm.isEmpty {
            return apexPredators
        } else {
            return apexPredators.filter {
                predator in
                predator.name
                    .localizedCaseInsensitiveContains(searchTerm)
            }
        }
    }

    func sort(by alphabetical: Bool) {
        apexPredators.sort { pred1, pred2 in
            if alphabetical {
                pred1.name < pred2.name
            } else {
                pred1.id < pred2.id
            }
        }
    }

    func filter(by type: PredatorType) {
        if type == .all {
            apexPredators = allApexPredators
        } else {
            apexPredators = allApexPredators.filter { predator in
                predator.type == type
            }
        }
    }
}
