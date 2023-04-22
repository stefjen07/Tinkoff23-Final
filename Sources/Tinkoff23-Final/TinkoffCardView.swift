//
//  TinkoffCardView.swift
//  Test1
//
//  Created by Евгений on 22.04.23.
//

import UIKit

public class TinkoffCardView: UIView {
	// Subviews
	private let stackView: UIStackView = {
		let stackView = UIStackView()
		stackView.axis = .vertical
		return stackView
	}()

	private let contentView = UIView()

	private let contentStackView: UIStackView = {
		let stackView = UIStackView()
		stackView.axis = .vertical
		return stackView
	}()

	private let headerLabel: UILabel = {
		let label = UILabel()
		label.font = TinkoffFonts.header
		label.textColor = TinkoffColors.primaryText
		return label
	}()

	private let subheaderLabel: UILabel = {
		let label = UILabel()
		label.font = TinkoffFonts.subheader
		label.textColor = TinkoffColors.secondaryText
		return label
	}()

	private let imageView: UIImageView = .init(image: UIImage(named: "star"))

	private let button: TinkoffButton = {
		let button = TinkoffButton(style: .filled)
		button.setTitle("Button", for: .normal)
		return button
	}()


	// Applied style
	private let style: TinkoffStyle


	// Initializers
	public init(header: String, subheader: String? = nil, style: TinkoffStyle) {
		self.style = style
		super.init(frame: .zero)

		setup()

		update(header: header)
		update(subheader: subheader)
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
	public func update(header: String) {
		self.headerLabel.text = header
	}

	public func update(subheader: String?) {
		self.subheaderLabel.text = subheader
		self.subheaderLabel.isHidden = subheader == nil
	}

	public func addButton(target: Any?, action: Selector) {
		button.addTarget(target, action: action, for: .primaryActionTriggered)

		stackView.addArrangedSubview(button)
		stackView.addSpacer(18)

		NSLayoutConstraint.activate([
			button.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
			button.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
		])
	}

	// Setup functions
	func addSubviews() {
		addSubview(stackView)

		stackView.addSpacer(18)
		stackView.addArrangedSubview(contentView)
		stackView.addSpacer(8)

		contentView.addSubview(contentStackView)
		contentStackView.addArrangedSubview(headerLabel)
		contentStackView.addSpacer(8)
		contentStackView.addArrangedSubview(subheaderLabel)

		contentView.addSubview(imageView)

		stackView.addSpacer(8)
	}

	func makeConstraints() {
		self.translatesAutoresizingMaskIntoConstraints = false
		stackView.translatesAutoresizingMaskIntoConstraints = false
		contentStackView.translatesAutoresizingMaskIntoConstraints = false
		contentView.translatesAutoresizingMaskIntoConstraints = false
		headerLabel.translatesAutoresizingMaskIntoConstraints = false
		subheaderLabel.translatesAutoresizingMaskIntoConstraints = false
		button.translatesAutoresizingMaskIntoConstraints = false
		imageView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			contentStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
			contentStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			contentStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

			contentView.heightAnchor.constraint(greaterThanOrEqualTo: imageView.heightAnchor, multiplier: 1),

			imageView.leadingAnchor.constraint(equalTo: contentStackView.trailingAnchor),
			imageView.centerYAnchor.constraint(equalTo: contentStackView.centerYAnchor),
			imageView.widthAnchor.constraint(equalToConstant: 40),
			imageView.heightAnchor.constraint(equalToConstant: 40),
			imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
		])

		NSLayoutConstraint.activate([
			stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
			stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
			stackView.topAnchor.constraint(equalTo: self.topAnchor),
			stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
		])
	}

	func setup() {
		backgroundColor = style.backgroundColor
		layer.cornerRadius = 24

		addSubviews()
		makeConstraints()

		update(subheader: nil)
	}
}
