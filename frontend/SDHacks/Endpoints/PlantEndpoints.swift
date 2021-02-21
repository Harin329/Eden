//
//  Plant.swift
//  SDHacks
//
//  Created by Harin Wu on 2021-02-20.
//

import Foundation

public var endpoint = "http://sdhacks2021.wl.r.appspot.com/"
//public var endpoint = "http://iamgroot.space/"


struct PlantEndpoints {
    static func createContribution(contribution: ContributionType) -> Int  {
            print("Creating contribution!!")
            let encoder = JSONEncoder()
            
            let semaphore = DispatchSemaphore (value: 0)
            
            let jsonData = try? encoder.encode(contribution)
            
            var request = URLRequest(url: URL(string: endpoint + "contribution")!,timeoutInterval: Double.infinity)
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            request.httpMethod = "POST"
            request.httpBody = jsonData
            
//            var contributionID = 0
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data else {
                    print(String(describing: error))
                    semaphore.signal()
                    return
                }
                 print(String(data: data, encoding: .utf8)!)
                do{
                    let jsonResponse = try JSONSerialization.jsonObject(with:data, options: [])
                    let jsonArray = jsonResponse as? [String: Any]
//                    contributionID = jsonArray!["id"] as? Int ?? 0
                    // print(groupID)
                } catch let parsingError {
                    print("Error", parsingError)
                }
                semaphore.signal()
            }
            
            task.resume()
            semaphore.wait()
            
            return 1
        }
    
    static func getAllGardens() -> [GardenType] {
        var gardenList = [GardenType]()
        let semaphore = DispatchSemaphore (value: 0)

        var request = URLRequest(url: URL(string: endpoint + "garden")!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                semaphore.signal()
                return
            }
//             print(String(data: data, encoding: .utf8)!)
            do {
                gardenList = try JSONDecoder().decode([GardenType].self, from: data)
                // print(plantList)
            } catch let error {
                print(error)
            }
            semaphore.signal()
        }

        task.resume()
        semaphore.wait()

        return gardenList
    }
    
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
