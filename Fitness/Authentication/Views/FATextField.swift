//
//  FATextField.swift
//  Fitness
//
//  Created by Amine BEN ZAGGAGH on 12/11/19.
//  Copyright © 2019 Amine BEN ZAGGAGH. All rights reserved.
//

import UIKit

class FATextField: UITextField {
    
    
    // self.inputView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.cornerRadius = 12
        
        self.textAlignment = .left
        
        self.allowsEditingTextAttributes = false
        
        self.inputView = UIView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        self.layer.cornerRadius = 12
        
        /// TODO: Set the padding for the UITextFiled
        self.textAlignment = .left
        
        self.allowsEditingTextAttributes = false
        
        self.inputView = UIView()
    }

    override func caretRect(for position: UITextPosition) -> CGRect {
        return CGRect.zero
    }
    
    override func selectionRects(for range: UITextRange) -> [UITextSelectionRect] {
        return []
    }
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        
        if (action == #selector(self.cut(_:))) {
            return false
        } else if (action == #selector(self.paste(_:))) {
            return false
        }

        return super.canPerformAction(action, withSender: sender)
    }
    
    
}
