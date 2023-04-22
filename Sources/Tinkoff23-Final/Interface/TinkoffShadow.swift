//
//  Shadow.swift
//  Test1
//
//  Created by Евгений on 22.04.23.
//

import UIKit

enum TinkoffShadow {
	case medium

	var color: CGColor {
		switch self {
		case .medium:
			return CGColor(red: 0, green: 0, blue: 0, alpha: 1)
		}
	}

	var offset: CGSize {
		switch self {
		case .medium:
			return CGSize(width: 0, height: 6)
		}
	}

	var radius: CGFloat {
		switch self {
		case .medium:
			return 17
		}
	}

	var spread: CGFloat {
		switch self {
		case .medium:
			return 10
		}
	}

	var opacity: Float {
		switch self {
		case .medium:
			return 0.12
		}
	}
}

extension UIView {
	func apply(shadow: TinkoffShadow) {
		self.layer.shadowColor = shadow.color
		self.layer.shadowOffset = shadow.offset
		self.layer.shadowRadius = shadow.radius
		self.layer.shadowOpacity = shadow.opacity
		let rect = bounds.insetBy(dx: -shadow.spread, dy: -shadow.spread)
		self.layer.shadowPath = UIBezierPath(rect: rect).cgPath
	}
}
