//
//  ViewController.swift
//  WebApp
//
//  Created by Euijae Hong on 17/10/2018.
//  Copyright © 2018 DIDDANG. All rights reserved.
//

import UIKit
import WebKit



class ViewController: UIViewController {
    
    
    let url = URL(string:"https://www.connectvalue.net")
    
    @IBOutlet weak var wkWebView: WKWebView!
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var forwardButton: UIBarButtonItem!


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    
        setupViews()
   
    }

    @IBAction func backButtonAction(_ sender: UIBarButtonItem) {
        
        wkWebView.goBack()
        
    }
    
    @IBAction func forwardButtonAction(_ sender: UIBarButtonItem) {
        
        wkWebView.goForward()
    }
}



extension ViewController : WKNavigationDelegate {
    
    
    fileprivate func setupViews() {
        
        let request = URLRequest(url: url!)
        wkWebView.navigationDelegate = self
        wkWebView.allowsBackForwardNavigationGestures = true
        wkWebView.load(request)
        
        
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        
        
        
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        backButton.isEnabled = webView.canGoBack
        forwardButton.isEnabled = webView.canGoForward
        
    }
    
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print(error.localizedDescription)
    }
    
    
    
}

