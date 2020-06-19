//
//  ViewController.swift
//  UrlSession_Ex
//
//  Created by Karem on 6/18/20.
//  Copyright © 2020 Karem. All rights reserved.
//

 
import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    //MARK:- Outlets
    @IBOutlet weak var dataTableView: UITableView!
    
    //MARK:- Variables
     let url = URL(string: "https://jsonplaceholder.typicode.com/users")
     let postUrl = URL(string: "https://jsonplaceholder.typicode.com/users")
    
     var userData: [User] = []
 

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    //MARK:- Api call Buttons
    @IBAction func getApiCall(_ sender: Any) {
        
        
        //call it by url session
        let session = URLSession.shared
        session.dataTask(with: url!) { (data, response, err) in
           
            if let data = data{
                do{
                    let parsedData = try JSONDecoder().decode([User].self, from: data)
                    self.userData = parsedData

                    //UIKit isn't thread safe so we have to update ui in the main thread as the clousres takes another threads to work ion
                    DispatchQueue.main.async {
                        self.dataTableView.reloadData()
                    }
                    print(parsedData)
                }catch {
                    print(error)
                }
                
            }
        }.resume()
        

    }
    
    
    ///MARK:- Post Api
    @IBAction func postApiCall(_ sender: Any) {
        
        var request = URLRequest(url: postUrl!)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "post"

     
        let newPost = DataModel(name: "Karim", city: "Cairo", age: 100)
        let encodedBody = try! JSONEncoder().encode(newPost)
        request.httpBody = encodedBody
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, err) in

            if let data = data {
                do {
                    let json = try JSONDecoder().decode(DataModel.self, from: data)
                    print("***\(json)")
                }catch {
                    print(error)
                }
            }
        }.resume()
        
    }
}

//MARK:- TableView DataSource & Delegates
extension ViewController {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        userData.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = userData[indexPath.row].email
        return cell
    
    
    }
    
}

