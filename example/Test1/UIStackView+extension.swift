//
//  UIStackView+extension.swift
//  Test1
//
//  Created by Евгений on 22.04.23.
//

import UIKit

extension UIStackView {
	func addSpacer(_ size: CGFloat) {
		let spacer = UIView()
		NSLayoutConstraint.activate([
			(axis == .vertical ? spacer.heightAnchor : spacer.widthAnchor)
				.constraint(equalToConstant: size)
		])
		addArrangedSubview(spacer)
	}

	func removeLastArrangedSubview() {
		if let subview = self.arrangedSubviews.last {
			self.removeArrangedSubview(subview)
		}
	}

	func removeAllArrangedSubviews() {
		let removedSubviews = arrangedSubviews.reduce([]) { (allSubviews, subview) -> [UIView] in
			self.removeArrangedSubview(subview)
			return allSubviews + [subview]
		}
		NSLayoutConstraint.deactivate(removedSubviews.flatMap({ $0.constraints }))
		removedSubviews.forEach({ $0.removeFromSuperview() })
	}
}
