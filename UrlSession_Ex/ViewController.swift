//
//  ViewController.swift
//  UrlSession_Ex
//
//  Created by Karem on 6/18/20.
//  Copyright © 2020 Karem. All rights reserved.
//

/***
 last stop at --> 16:00 kilo logo
 */
import UIKit

class ViewController: UIViewController {
    
    //instantiate url
     let url = URL(string: "https://jsonplaceholder.typicode.com/users")

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    //MARK:- Apic Buttons
    @IBAction func getApiCall(_ sender: Any) {
        
        
        //call it by url session
        let session = URLSession.shared
        session.dataTask(with: url!) { (data, response, err) in
            if let response = response{
                print("*******\(response)")
            }
            ///
            if let data = data{
                do{
                    
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print("*********\(json)")

                }catch {
                    print(error)
                }
                
            }
        }.resume()
        
        
    }
    
    
    ///MARK:- Post Api
    @IBAction func postApiCall(_ sender: Any) {
        var request = URLRequest(url: url!)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "post"

        let paramters = ["name":"karim","age":"125"]
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: paramters, options: []) else {return}
        request.httpBody = httpBody
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, err) in

            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print("***\(json)")
                }catch {
                    print(error)
                }
            }
        }.resume()
        
    }
}

