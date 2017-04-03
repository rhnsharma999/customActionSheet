//
//  slideUpMenu.swift
//  deleteThis
//
//  Created by Rohan Lokesh Sharma on 02/04/17.
//  Copyright © 2017 webarch. All rights reserved.
//

import Foundation
import UIKit
class menu:NSObject {
    
    
    
    var vc:ViewController?
    
    let reuseId = "cell"
    let cellheight:CGFloat = 50
    let menu = ["Home","Settings","Share","Push View Controller","Cancel"]
    let icons = [#imageLiteral(resourceName: "home"),#imageLiteral(resourceName: "settings"),#imageLiteral(resourceName: "share"),#imageLiteral(resourceName: "Stack-104"),#imageLiteral(resourceName: "Cancel Filled-100")]
    
    lazy var cv:UICollectionView = {
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        view.translatesAutoresizingMaskIntoConstraints = false;
        view.delegate = self;
        view.dataSource = self;
        
        view.backgroundColor = .white;
        return view;
    }()
    
    let blackView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
        return view;
    }()
    
    
    
    
    override init(){
        super.init()
        cv.register(CustomCell.self, forCellWithReuseIdentifier: reuseId)
        blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(doSomething)))
        
        if let window = UIApplication.shared.keyWindow{
            
            blackView.frame = window.frame
            blackView.alpha = 0.0
            cv.frame = CGRect(x: 0, y: window.frame.height, width: UIScreen.main.bounds.width, height: cellheight*CGFloat(menu.count))
        }
    }
    
    func addmenu(){
        
        if let window = UIApplication.shared.keyWindow{
            window.addSubview(blackView)
            window.addSubview(cv)
            
            UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseOut, animations: {
                
                
                self.blackView.alpha = 1.0
                self.cv.transform = CGAffineTransform(translationX: 0, y: -self.cv.frame.height)
                if let vc = window.rootViewController{
                    vc.view.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
                }}, completion: nil)
            
        }
    }
    func hideMenu(action:(() -> Void)?){
        if let window = UIApplication.shared.keyWindow{
            UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseOut, animations: {
                self.cv.transform = CGAffineTransform.identity
                self.blackView.alpha = 0.0
                if let vc = window.rootViewController{
                    vc.view.transform = CGAffineTransform.identity
                }
            }, completion: { _ in
                if let action = action{
                    action()
                }
            })
        }
        
    }
    func doSomething(){
        hideMenu(action:nil)
        
    }
    
    
}



extension menu:UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1;
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menu.count;
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseId, for: indexPath) as! CustomCell
        cell.titleLabel.text = menu[indexPath.item]
        cell.iconImage.image = icons[indexPath.item].withRenderingMode(.alwaysTemplate)
        cell.backgroundColor = .white
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cv.frame.width, height: cellheight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        cv.deselectItem(at: indexPath, animated: true)
        hideMenu(action:{self.vc?.clicked(button:self.menu[indexPath.item])})
        
    }
}



