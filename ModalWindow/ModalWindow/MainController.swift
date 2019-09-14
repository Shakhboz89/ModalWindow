//
//  MainController.swift
//  ModalWindow
//
//  Created by MacBook on 9/14/19.
//  Copyright © 2019 Shakhboz. All rights reserved.
//

import UIKit
import SafariServices

class MainController: UIViewController {
    
    let aboutLabel: UILabel = {
        let label = UILabel()
        let attributedText = NSMutableAttributedString(string: "Hi! Here you can see how presents another view controller as a modal window.\n\nAfter 3 seconds you'll see the window.\n\nThank you.", attributes: [.foregroundColor: UIColor.white])
        label.font = UIFont(name: "futura", size: 17)
        label.attributedText = attributedText
        label.numberOfLines = 0
        return label
    }()
    
    let gitHubButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "github").withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(handleOpenLink), for: .touchUpInside)
        button.clipsToBounds = true
        return button
    }()
    
    @objc fileprivate func handleOpenLink() {
        //        print("Open link")
        showSavariVC(for: "https://github.com/Shakhboz89")
    }
    
    func showSavariVC(for url: String) {
        guard let url = URL(string: url) else { return }
        
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .gray
        
        view.addSubview(aboutLabel)
        aboutLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 20, left: 30, bottom: 0, right: 30))
        
        view.addSubview(gitHubButton)
        gitHubButton.anchor(top: aboutLabel.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 10, left: 0, bottom: 10, right: 0))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.performSegue(withIdentifier: "PresentModalView", sender: self)
            self.present(ModalController(), animated: true)
        }
    }
}
