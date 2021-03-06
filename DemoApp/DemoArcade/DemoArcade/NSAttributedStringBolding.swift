//
//  NSAttributedStringViewController.swift
//  DemoArcade
//
//  Created by Jonathan Rasmusson Work Pro on 2020-03-26.
//  Copyright © 2020 Rasmusson Software Consulting. All rights reserved.
//

import UIKit

class NSAttributedStringBolding: UIViewController {

    lazy var label: UILabel = {
        let label = makeLabel()
        label.attributedText = makeText()
        return label
    }()
    
    func makeText() -> NSAttributedString {
        var plainTextAttributes = [NSAttributedString.Key: AnyObject]()
        plainTextAttributes[.font] = UIFont.preferredFont(forTextStyle: .body)

        var boldTextAttributes = [NSAttributedString.Key: AnyObject]()
        boldTextAttributes[.font] = UIFont.preferredFont(forTextStyle: .body).withTraits(traits: [.traitBold]) // extension

        let text = NSMutableAttributedString(string: "Please", attributes: plainTextAttributes)
        text.append(NSAttributedString(string: " stay on this screen ", attributes: boldTextAttributes))
        text.append(NSAttributedString(string: "while we activate your service. This process may take a few minutes.", attributes: plainTextAttributes))

        return text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        navigationItem.title = "Bolding"
        
        let stackView = makeVerticalStackView()
        stackView.addArrangedSubview(label)
        
        view.addSubview(stackView)
        
        stackView.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 1).isActive = true
        stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1).isActive = true
        view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1).isActive = true
    }
    
}
