//
//  ViewController.swift
//  Custom Action Sheet
//
//  Created by Rohan Lokesh Sharma on 03/04/17.
//  Copyright © 2017 webarch. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let custom  = menu()
    
    lazy var sample:UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 200, width: self.view.frame.width, height: 40));
        label.text = "Sample View"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 30)
        return label;
    }()
    
    

    override func viewDidLoad() {
        custom.vc = self;
        view.addSubview(sample)
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(doSomething)))
    }
    
    func doSomething(){
        custom.addmenu()
    }

   
    
    func clicked(button:String){
        
        print("clicked \(button)")
    }

}

