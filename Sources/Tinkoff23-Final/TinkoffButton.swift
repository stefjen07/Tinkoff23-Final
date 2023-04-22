//
//  File.swift
//  
//
//  Created by Евгений on 22.04.23.
//

import UIKit

public enum TinkoffButtonStyle {
	case plain
	case filled
}

public class TinkoffButton: UIButton {
	private let style: TinkoffButtonStyle

	public override var isHighlighted: Bool {
		didSet {
			if style == .filled {
				backgroundColor = isHighlighted ? TinkoffColors.highlightedButtonBackground : TinkoffColors.buttonBackground
			}
		}
	}

	func setup() {
		var contentInsets: NSDirectionalEdgeInsets
		switch style {
		case .plain:
			contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
		case .filled:
			contentInsets = .init(top: 13, leading: 16, bottom: 13, trailing: 16)
		}

		if #available(iOS 15.0, *) {
			var configuration = UIButton.Configuration.plain()
			configuration.contentInsets = contentInsets
			self.configuration = configuration
		} else {
			self.contentEdgeInsets = .init(top: contentInsets.top, left: contentInsets.leading, bottom: contentInsets.bottom, right: contentInsets.trailing)
		}

		if style == .filled {
			self.backgroundColor = TinkoffColors.buttonBackground
			self.layer.cornerRadius = 12
		}


		self.setTitleColor(TinkoffColors.buttonText, for: .normal)
		self.titleLabel?.font = TinkoffFonts.button
	}

	public init(style: TinkoffButtonStyle) {
		self.style = style
		super.init(frame: .zero)

		setup()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
