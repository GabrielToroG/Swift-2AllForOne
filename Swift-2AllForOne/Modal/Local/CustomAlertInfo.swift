//
//  CustomAlertInfo.swift
//  Swift-2AllForOne
//
//  Created by Gabriel Toro on 13-10-22.
//

import Foundation
import UIKit

class CustomAlertInfo {
    
    var stateImage: UIImage?
    var stateColor: UIColor?
    var containerViewBG: UIColor?
    var image: UIImage?
    var title: String?
    var description: String?
    var buttonText: String?
    var buttonBG: UIColor?
    
    init(stateImage: UIImage? = nil, stateColor: UIColor? = nil, containerViewBG: UIColor? = nil, image: UIImage? = nil, title: String? = nil, description: String? = nil, buttonText: String? = nil, buttonBG: UIColor? = nil) {
        self.stateImage = stateImage
        self.stateColor = stateColor
        self.containerViewBG = containerViewBG
        self.image = image
        self.title = title
        self.description = description
        self.buttonText = buttonText
        self.buttonBG = buttonBG
    }
}
