//
//  FALoadingButton.swift
//  Fitness
//
//  Created by Amine BEN ZAGGAGH on 1/8/20.
//  Copyright © 2020 Amine BEN ZAGGAGH. All rights reserved.
//

import UIKit

@IBDesignable
class FALoadingButton: FAButton {
    
    @IBInspectable var title: String = "Loading Button"
    
    var loadingView = UIView()

    var isLoading : Bool = false {
        didSet {
            if isLoading {
                self.isUserInteractionEnabled = false
                
                let activityIndicator = UIActivityIndicatorView(style: .large)
                    activityIndicator.startAnimating()
//                    activityIndicator.color = UIColor.white
                    activityIndicator.hidesWhenStopped = false
                    
                loadingView = activityIndicator
                
                self.backgroundColor = .clear
                self.setTitle("", for: .normal)
                    
                addSubview(loadingView)
                
            } else {
                
                self.isUserInteractionEnabled = true
                
                self.backgroundColor = #colorLiteral(red: 0.2196078431, green: 0.337254902, blue: 0.5921568627, alpha: 1)
                self.setTitle(title, for: .normal)
                
                loadingView.isHidden = true
                
                
            }
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        loadingView.center = CGPoint(x: bounds.size.width / 2,
                                     y: bounds.size.height / 2)
        
    }
    
}


//    open var isLoading: Bool = false {
//        didSet {
//            if isLoading {
//                self.isUserInteractionEnabled = false
//                if loadingView == nil {
////                    UIActivityIndicatorView(style: .white)
//                    let activityIndicator = UIActivityIndicatorView(style: .medium)
//                    activityIndicator.startAnimating()
//                    activityIndicator.hidesWhenStopped = false
//                    loadingView = activityIndicator
//                    addSubview(loadingView!)
//                }
//                loadingView?.isHidden = false
//                titleLabel?.layer.opacity = 0
//                imageView?.isHidden = true
//            }
//            else {
//                if !self.state.contains(.disabled) {
//                    isUserInteractionEnabled = true
//                }
//                loadingView?.isHidden = true
//                titleLabel?.layer.opacity = 1
//                imageView?.isHidden = false
//            }
//            update()
//        }
//    }
