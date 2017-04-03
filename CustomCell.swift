//
//  customCell.swift
//  deleteThis
//
//  Created by Rohan Lokesh Sharma on 02/04/17.
//  Copyright © 2017 webarch. All rights reserved.
//

import Foundation
import UIKit
class CustomCell:UICollectionViewCell {
    
    
    override var isHighlighted: Bool {
        didSet{
            iconImage.tintColor = isHighlighted ? UIColor.white : UIColor.gray
            self.backgroundColor = isHighlighted ? .gray : .white
            titleLabel.textColor = isHighlighted ? .white : .black
        }
    }
    override var isSelected: Bool{
        didSet{
            
            iconImage.tintColor = isSelected ? UIColor.white : UIColor.gray
            self.backgroundColor = isSelected ? .gray : .white
            titleLabel.textColor = isSelected ? .white : .black
            
        }
    }
    
    
    let iconImage:UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false;
        view.contentMode = .scaleAspectFill
        view.layer.masksToBounds = true
        return view;
    }()
    let titleLabel:UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view;
    }()
    
    override init(frame:CGRect){
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        
        addSubview(iconImage)
        addSubview(titleLabel)
        
        iconImage.leftAnchor.constraint(equalTo: leftAnchor,constant:16).isActive = true
        iconImage.heightAnchor.constraint(equalToConstant: 20).isActive = true
        iconImage.widthAnchor.constraint(equalToConstant: 20).isActive = true
        iconImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        iconImage.image = #imageLiteral(resourceName: "settings").withRenderingMode(.alwaysTemplate)
        iconImage.tintColor = .gray
        
        titleLabel.leftAnchor.constraint(equalTo: iconImage.rightAnchor,constant:20).isActive = true
        titleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        titleLabel.text = "Settings"
        
    }
    
}
