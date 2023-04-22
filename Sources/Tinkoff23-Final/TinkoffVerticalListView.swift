//
//  File.swift
//  
//
//  Created by Евгений on 22.04.23.
//

import UIKit

public class TinkoffVerticalListView: UIView {
	// Subviews
	private let stackView: UIStackView = {
		let stackView = UIStackView()
		stackView.axis = .vertical
		return stackView
	}()

	private let headerView: UIView = .init()

	private let headerLabel: UILabel = {
		let label = UILabel()
		label.font = TinkoffFonts.header
		label.textColor = TinkoffColors.primaryText
		return label
	}()

	let secondaryButton: TinkoffButton = {
		let button = TinkoffButton(style: .plain)
		button.setTitle("Button", for: .normal)
		return button
	}()

	private let listStackView = {
		let stackView = UIStackView()
		stackView.axis = .vertical
		return stackView
	}()

	private let primaryButton: TinkoffButton = {
		let button = TinkoffButton(style: .filled)
		button.setTitle("Button", for: .normal)
		return button
	}()


	// Applied style
	private let style: TinkoffStyle


	// Initializers
	public init(header: String, style: TinkoffStyle) {
		self.style = style
		super.init(frame: .zero)

		setup()
		update(header: header)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}


	// Update methods
	public func update(header: String) {
		self.headerLabel.text = header
	}

	public func update(items: [TinkoffListItem]) {
		self.listStackView.removeAllArrangedSubviews()

		items.forEach { item in
			let view = TinkoffListItemView(style: .row)
			view.update(with: item)
			self.listStackView.addArrangedSubview(view)
		}
	}

	public func addPrimaryButton(target: Any?, action: Selector) {
		primaryButton.addTarget(target, action: action, for: .primaryActionTriggered)

		stackView.removeLastArrangedSubview()
		stackView.addSpacer(8)
		stackView.addArrangedSubview(primaryButton)
		stackView.addSpacer(18)

		NSLayoutConstraint.activate([
			primaryButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 20),
			primaryButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -20),
		])
	}


	public override func layoutSubviews() {
		super.layoutSubviews()

		if let shadow = style.mainShadow {
			apply(shadow: shadow)
		}
	}


	// Setup functions
	func addSubviews() {
		addSubview(stackView)

		headerView.addSubview(headerLabel)
		headerView.addSubview(secondaryButton)

		stackView.addSpacer(18)
		stackView.addArrangedSubview(headerView)
		stackView.addSpacer(8)
		stackView.addArrangedSubview(listStackView)
		stackView.addSpacer(8)
	}

	func makeConstraints() {
		self.translatesAutoresizingMaskIntoConstraints = false
		stackView.translatesAutoresizingMaskIntoConstraints = false
		headerLabel.translatesAutoresizingMaskIntoConstraints = false
		listStackView.translatesAutoresizingMaskIntoConstraints = false
		primaryButton.translatesAutoresizingMaskIntoConstraints = false
		secondaryButton.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			headerLabel.topAnchor.constraint(equalTo: headerView.topAnchor),
			headerLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 20),
			headerLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor),

			secondaryButton.leadingAnchor.constraint(equalTo: headerLabel.trailingAnchor, constant: 8),
			secondaryButton.topAnchor.constraint(equalTo: headerView.topAnchor),
			secondaryButton.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -20),
			secondaryButton.bottomAnchor.constraint(equalTo: headerView.bottomAnchor),

			listStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
			listStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
		])

		NSLayoutConstraint.activate([
			stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
			stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
			stackView.topAnchor.constraint(equalTo: self.topAnchor),
			stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
		])
	}

	func setup() {
		backgroundColor = style.backgroundColor
		layer.cornerRadius = 24

		addSubviews()
		makeConstraints()
	}
}
