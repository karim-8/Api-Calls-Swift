//
//  UsersRepository.swift
//  UrlSession_Ex
//
//  Created by Karem on 6/19/20.
//  Copyright © 2020 Karem. All rights reserved.
//

import Foundation

class UserRepo {
    
    let url = URL(string: "https://jsonplaceholder.typicode.com/users")
     let postUrl = URL(string: "https://jsonplaceholder.typicode.com/users")
    
//
//    func fetchUserData () -> {
//
//
//        //call it by url session
//         let session = URLSession.shared
//         session.dataTask(with: url!) { (data, response, err) in
//
//             if let data = data{
//                 do{
//                     let parsedData = try JSONDecoder().decode([User].self, from: data)
//                     self.userData = parsedData
//
//                     //UIKit isn't thread safe so we have to update ui in the main thread as the clousres takes another threads to work ion
////                     DispatchQueue.main.async {
////                         self.dataTableView.reloadData()
////                     }
//                     print(parsedData)
//                 }catch {
//                     print(error)
//                 }
//
//             }
//         }.resume()
//
//    }
//
}
