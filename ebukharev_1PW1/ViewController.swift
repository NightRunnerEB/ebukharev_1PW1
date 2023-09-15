//
//  ViewController.swift
//  ebukharev_1PW1
//
//  Created by Евгений Бухарев on 15.09.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var button: UIButton!
    @IBOutlet var views: [UIView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func buttonWasPressed(_ sender: Any) {
        var colors = getUniqueColors(count: views.count)
        for view in views {
            UIView.animate(
            withDuration: 1,
            animations: {
                view.backgroundColor = colors.popFirst()
                view.layer.cornerRadius = .random(in: 0...25)
            },
            completion: { [weak self] _ in
            self?.button.isEnabled = true
            }
            )
        }
    }
    
    func getUniqueColors(count: Int) -> Set<UIColor>{
        var set = Set<UIColor>()
        while set.count < count {
        set.insert(
        UIColor(
         red: .random(in: 0...1),
         green: .random(in: 0...1),
         blue: .random(in: 0...1),
         alpha: 1
        )
        )
        }
        return set
    }

}

