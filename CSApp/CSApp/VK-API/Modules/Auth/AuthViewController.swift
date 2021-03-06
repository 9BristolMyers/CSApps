//
//  AuthViewController.swift
//  CSApp
//
//  Created by Владимир Рузавин on 11/12/21.
//

import Foundation
import WebKit

class AuthViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet weak var webView: WKWebView! {
        didSet{
            webView.navigationDelegate = self
        }
    }
      
    //extension ViewController: WKNavigationDelegate {
       override func viewDidLoad() {
           super.viewDidLoad()
           
           if !Session.shared.token.isEmpty, Session.shared.userId > 0 {
               performSegue(withIdentifier: "showTabBarSegue", sender: nil)
           }
           
           authorizeToVKAPI()
       }
                
            func authorizeToVKAPI() {
                
                var urlComponents = URLComponents()
                        urlComponents.scheme = "https"
                        urlComponents.host = "oauth.vk.com"
                        urlComponents.path = "/authorize"
                        urlComponents.queryItems = [
                            URLQueryItem(name: "client_id", value: "1234567"),
                            URLQueryItem(name: "display", value: "mobile"),
                            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
                            URLQueryItem(name: "scope", value: "262150"),
                            URLQueryItem(name: "response_type", value: "token"),
                            URLQueryItem(name: "v", value: "5.68")
                        ]
                        
                        let request = URLRequest(url: urlComponents.url!)
                        
                        webView.load(request)
            }

        func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
            
            guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment  else {
                       decisionHandler(.allow)
                       return
                   }
            
            print(url)
                 
            let params = fragment
                             .components(separatedBy: "&")
                             .map { $0.components(separatedBy: "=") }
                             .reduce([String: String]()) { result, param in
                                 var dict = result
                                 let key = param[0]
                                 let value = param[1]
                                 dict[key] = value
                                 return dict
                         }
    
    guard let token = params["access_token"], let userId = params["user_id"] else { return }
            
            print(token)
            
            Session.shared.token = token
            Session.shared.userId = Int(userId) ?? 0
            
            performSegue(withIdentifier: "showTabBarSegue", sender: nil)
            
            decisionHandler(.cansel)
        }
}
