//
//  File.swift
//  
//
//  Created by Евгений on 22.04.23.
//

import UIKit

public class TinkoffItemCardView: UIView {
	// Subviews
	private let listItemView: TinkoffListItemView
	private let closeButton: UIButton = {
		let button = UIButton()
		button.setImage(UIImage(named: "close"), for: .normal)
		return button
	}()


	// Applied style
	private let style: TinkoffStyle


	// Initializers
	public init(style: TinkoffStyle) {
		self.style = style
		listItemView = TinkoffListItemView(offset: 0, style: .row)
		super.init(frame: .zero)

		setup()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}


	public override func layoutSubviews() {
		super.layoutSubviews()

		if let shadow = style.mainShadow {
			apply(shadow: shadow)
		}
	}


	// Update methods

	public func update(with item: TinkoffListItem) {
		listItemView.update(with: item)
	}

	public func addCloseButton() {

	}

	// Setup functions
	func makeConstraints() {
		backgroundColor = style.backgroundColor
		layer.cornerRadius = 24

		NSLayoutConstraint.activate([
			listItemView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
			listItemView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
			listItemView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
			listItemView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
		])
	}

	func setup() {
		addSubview(listItemView)
		makeConstraints()
	}
}
