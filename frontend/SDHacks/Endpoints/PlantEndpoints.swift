//
//  Plant.swift
//  SDHacks
//
//  Created by Harin Wu on 2021-02-20.
//

import Foundation

public var endpoint = "http://sdhacks2021.wl.r.appspot.com/"

struct PlantEndpoints {
    static func getPlantsInGroup(plotID: Int) -> [PlantType] {
        var plantList = [PlantType]()
        let semaphore = DispatchSemaphore (value: 0)
        
        var request = URLRequest(url: URL(string: endpoint + "plant/" + String(plotID))!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                semaphore.signal()
                return
            }
//             print(String(data: data, encoding: .utf8)!)
            do {
                plantList = try JSONDecoder().decode([PlantType].self, from: data)
                // print(plantList)
            } catch let error {
                print(error)
            }
            semaphore.signal()
        }
        
        task.resume()
        semaphore.wait()
        
        return plantList
    }
}
