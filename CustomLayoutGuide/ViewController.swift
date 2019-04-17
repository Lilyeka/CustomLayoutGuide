//
//  ViewController.swift
//  CustomLayoutGuide
//
//  Created by Лилия Левина on 16/04/2019.
//  Copyright © 2019 Лилия Левина. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var guides: [UILayoutGuide]?
    let views = [UIView(),UIView(),UIView(),UIView()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        views[0].backgroundColor = .green
        views[0].translatesAutoresizingMaskIntoConstraints = false
        views[1].backgroundColor = .red
        views[1].translatesAutoresizingMaskIntoConstraints = false
        views[2].backgroundColor = UIColor(red: 1, green: 0.4, blue: 1, alpha: 1)
        views[2].translatesAutoresizingMaskIntoConstraints = false
        views[3].backgroundColor = .blue
        views[3].translatesAutoresizingMaskIntoConstraints = false
        
        constrainWithUILayoutGuide()
        //constrainWithUIStackView()
    }
    
    func constrainWithUILayoutGuide() {
        guides = [UILayoutGuide(), UILayoutGuide(), UILayoutGuide()]
        
        for guide in guides! {
            self.view.addLayoutGuide(guide)
        }
        
        for v in views {
            self.view.addSubview(v)
        }
        
        let marg = self.view.layoutMarginsGuide
        let safe = self.view.safeAreaLayoutGuide
        // view's left and right edges, their heights, and the top of the first view
        // and the bottom of the last view
        NSLayoutConstraint.activate([
            views[0].topAnchor.constraint(equalTo: safe.topAnchor),
            views[3].bottomAnchor.constraint(equalTo: safe.bottomAnchor),
            views[0].leadingAnchor.constraint(equalTo: marg.leadingAnchor),
            views[1].leadingAnchor.constraint(equalTo: marg.leadingAnchor),
            views[2].leadingAnchor.constraint(equalTo: marg.leadingAnchor),
            views[3].leadingAnchor.constraint(equalTo: marg.leadingAnchor),
            views[0].trailingAnchor.constraint(equalTo: marg.trailingAnchor),
            views[1].trailingAnchor.constraint(equalTo: marg.trailingAnchor),
            views[2].trailingAnchor.constraint(equalTo: marg.trailingAnchor),
            views[3].trailingAnchor.constraint(equalTo: marg.trailingAnchor),
            views[0].heightAnchor.constraint(equalToConstant: 20),
            views[1].heightAnchor.constraint(equalToConstant: 20),
            views[2].heightAnchor.constraint(equalToConstant: 20),
            views[3].heightAnchor.constraint(equalToConstant: 20),
            ])
        
        // question of how we will determine the vertical position of the two middle views;
        // they must move in such a way that they are always equidistant from their vertical neighbors
        NSLayoutConstraint.activate([
            // guide left is arbitrary, let's say superview margin
            guides![0].leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            guides![1].leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            guides![2].leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            // guide widths are arbitrary, let's say 10
            guides![0].widthAnchor.constraint(equalToConstant: 10),
            guides![1].widthAnchor.constraint(equalToConstant: 10),
            guides![2].widthAnchor.constraint(equalToConstant: 10),
            // bottom of each view is top of following guide
            views[0].bottomAnchor.constraint(equalTo: guides![0].topAnchor),
            views[1].bottomAnchor.constraint(equalTo: guides![1].topAnchor),
            views[2].bottomAnchor.constraint(equalTo: guides![2].topAnchor),
            // top of each view is bottom of preceding guide
            views[1].topAnchor.constraint(equalTo: guides![0].bottomAnchor),
            views[2].topAnchor.constraint(equalTo: guides![1].bottomAnchor),
            views[3].topAnchor.constraint(equalTo: guides![2].bottomAnchor),
            // guide heights are equal!
            guides![1].heightAnchor.constraint(equalTo:guides![0].heightAnchor),
            guides![2].heightAnchor.constraint(equalTo:guides![0].heightAnchor),
        ])
    }
    
    func constrainWithUIStackView() {
        NSLayoutConstraint.activate([
            views[0].heightAnchor.constraint(equalToConstant: 20),
            views[1].heightAnchor.constraint(equalToConstant: 20),
            views[2].heightAnchor.constraint(equalToConstant: 20),
            views[3].heightAnchor.constraint(equalToConstant: 20),
        ])
        
        // give the stack view arranged subviews
        let sv = UIStackView(arrangedSubviews: views)
        // configure the stack view
        sv.axis = .vertical
        sv.alignment = .fill
        sv.distribution = .equalSpacing
        // constrain the stack view
        sv.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(sv)
        let marg = self.view.layoutMarginsGuide
        let safe = self.view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            sv.topAnchor.constraint(equalTo:safe.topAnchor),
            sv.leadingAnchor.constraint(equalTo:marg.leadingAnchor),
            sv.trailingAnchor.constraint(equalTo:marg.trailingAnchor),
            sv.bottomAnchor.constraint(equalTo:safe.bottomAnchor),
        ])
    }


}

