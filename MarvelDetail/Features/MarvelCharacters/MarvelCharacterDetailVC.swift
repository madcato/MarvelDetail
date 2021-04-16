//
//  MarvelCharacterDetailVC.swift
//  MarvelDetail
//
//  Created by Daniel Vela on 14/4/21.
//

import UIKit
import WebKit

class MarvelCharacterDetailVC: UIViewController {
    static let segueId = "detail"
    var character: Marvel.CharacterDto!

    @IBOutlet weak var webView: WKWebView!

    internal var activityIndicator = UIActivityIndicatorView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureActivityInCenter(of: view)
        startActivity()
        guard let url = URL(string: character.detailURL()) else {
            fatalError("Invalid URL")
        }
        webView.navigationDelegate = self
        webView.load(URLRequest(url: url))
    }
}

// MARK: - Webview delegate

extension MarvelCharacterDetailVC: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        stopActivity()
    }
}

// MARK: - Activity indicator

extension MarvelCharacterDetailVC: ActivityProtocol {
}
