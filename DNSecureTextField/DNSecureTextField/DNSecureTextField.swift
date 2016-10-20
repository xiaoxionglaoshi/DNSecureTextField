//
//  DNSecureTextField.swift
//  DNSecureTextField
//
//  Created by mainone on 16/10/20.
//  Copyright © 2016年 wjn. All rights reserved.
//

import UIKit

class DNSecureTextField: UITextField {
    
    deinit {
        NotificationCenter.default.removeObserver(self.beginEditingObserver)
        NotificationCenter.default.removeObserver(self.endEditingObserver)
    }
    
    fileprivate var password = ""
    fileprivate var beginEditingObserver: AnyObject!
    fileprivate var endEditingObserver: AnyObject!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.awakeFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.isSecureTextEntry = true
        self.beginEditingObserver = NotificationCenter.default.addObserver(forName: NSNotification.Name.UITextFieldTextDidBeginEditing, object: nil, queue: nil, using: { [unowned self](note: Notification!) in
            if self == note.object as! DNSecureTextField && self.isSecureTextEntry {
                self.text = ""
                self.insertText(self.password)
            }
        })
        
        self.endEditingObserver = NotificationCenter.default.addObserver(forName: NSNotification.Name.UITextFieldTextDidEndEditing, object: nil, queue: nil, using: { [unowned self](note:Notification!) in
            if self == note.object as! DNSecureTextField {
                self.password = self.text!
            }
        })
    }
    
    override var isSecureTextEntry: Bool {
        get {
            return super.isSecureTextEntry
        }
        set {
            self.resignFirstResponder()
            super.isSecureTextEntry = newValue
            self.becomeFirstResponder()
        }
    }
}
