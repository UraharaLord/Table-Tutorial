//
//  CustomView.swift
//  strategy-tutorial
//
//  Created by Uriel Rodriguez on 22/05/23.
//

import UIKit

@IBDesignable
class CustomView: UIView {

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        layer.borderColor = borderColor?.cgColor
        layer.borderWidth = borderWidth
        layer.cornerRadius = cornerRadius
    }

    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
            setNeedsLayout()
        }
    }

    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            layer.borderWidth = borderWidth
            setNeedsLayout()
        }
    }

    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
            setNeedsLayout()
        }
    }
}
