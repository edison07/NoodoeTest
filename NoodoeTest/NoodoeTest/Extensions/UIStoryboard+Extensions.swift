//
//  UIStoryboardExtension.swift
//  Lightning-rod
//
//  Created by edisonlin on 2020/8/26.
//  Copyright © 2020 pixnet. All rights reserved.
//

import UIKit

enum StoryboardCases: String {
    case main = "Main"
}

protocol Storyboardable: AnyObject {
    static var defaultStoryboardName: String { get }
}

extension Storyboardable where Self: UIViewController {

    static var defaultStoryboardName: String {
        return String(describing: self)
    }

    static func viewController(from storyboard: StoryboardCases) -> Self {
        let storyboard = UIStoryboard(name: storyboard.rawValue, bundle: nil)

        guard let viewController = storyboard.instantiateViewController(withIdentifier: defaultStoryboardName) as? Self else {
            fatalError("Could not instantiate initial storyboard with name: \(defaultStoryboardName)")
        }

        return viewController
    }

    static func initialViewController(from storyboard: StoryboardCases) -> Self {
        let storyboard = UIStoryboard(name: storyboard.rawValue, bundle: nil)

        guard let viewController = storyboard.instantiateInitialViewController() as? Self else {
            fatalError("Could not instantiate initial view controller")
        }

        return viewController
    }

}

extension UIViewController: Storyboardable {}


