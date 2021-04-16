//
//  ActivityProtocol.swift
//  MarvelDetail
//
//  Created by Daniel Vela on 16/4/21.
//

import UIKit

protocol ActivityProtocol {
    var activityIndicator: UIActivityIndicatorView { get }
}

extension ActivityProtocol {
    func configureActivityInCenter(of view: UIView) {
        view.addSubview(activityIndicator)
        activityIndicator.stopAnimating()
        activityIndicator.style = .large
        activityIndicator.hidesWhenStopped = true
        activityIndicator.center = view.convert(view.center, from: view.superview)
    }

    func startActivity() {
        activityIndicator.startAnimating()
    }

    func stopActivity() {
        activityIndicator.stopAnimating()
    }
}
