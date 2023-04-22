//
//  TinkoffListItemView.swift
//  Test1
//
//  Created by Евгений on 22.04.23.
//

import UIKit

public enum TinkoffListItemStyle {
	case row
	case square
}

public class TinkoffListItemView: UIView {
	// Subviews
	private let imageView = {
		let imageView = UIImageView(frame: .zero)
		return imageView
	}()
	private let titleLabel = {
		let label = UILabel()
		label.textColor = TinkoffColors.primaryText
		label.font = TinkoffFonts.title
		return label
	}()
	private let descriptionLabel = {
		let label = UILabel()
		label.textColor = TinkoffColors.secondaryText
		label.font = TinkoffFonts.description
		return label
	}()


	// Initializers
	public init(style: TinkoffListItemStyle) {
		super.init(frame: .zero)

		setup(style: style)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}


	// Update method
	public func update(with item: TinkoffListItem) {
		imageView.image = item.image
		titleLabel.text = item.title
		descriptionLabel.text = item.description
	}


	//Setup functions
	func addSubviews() {
		addSubview(imageView)
		addSubview(titleLabel)
		addSubview(descriptionLabel)
	}

	func makeConstraints(style: TinkoffListItemStyle) {
		switch style {
		case .row:
			NSLayoutConstraint.activate([
				imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
				imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
				imageView.widthAnchor.constraint(equalToConstant: 40),
				imageView.heightAnchor.constraint(equalToConstant: 40),
				imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),

				titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 20),
				titleLabel.topAnchor.constraint(equalTo: imageView.topAnchor),
				descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
				descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
				descriptionLabel.bottomAnchor.constraint(equalTo: imageView.bottomAnchor),
				titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
				descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor)
			])
		case .square:
			NSLayoutConstraint.activate([
				self.widthAnchor.constraint(equalToConstant: 140),
				self.heightAnchor.constraint(equalToConstant: 140),

				imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
				imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
				imageView.widthAnchor.constraint(equalToConstant: 40),
				imageView.heightAnchor.constraint(equalToConstant: 40),

				titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),

				descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
				descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
				descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
				descriptionLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12)
			])
		}

	}

	func setup(style: TinkoffListItemStyle) {
		translatesAutoresizingMaskIntoConstraints = false
		imageView.translatesAutoresizingMaskIntoConstraints = false
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
		descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
		addSubviews()

		if style == .square {
			layer.cornerRadius = 12
			backgroundColor = TinkoffColors.buttonBackground
		}
		
		makeConstraints(style: style)
	}
}
