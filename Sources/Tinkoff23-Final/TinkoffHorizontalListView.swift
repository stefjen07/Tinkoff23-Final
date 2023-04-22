//
//  TinkoffHorizontalListView.swift
//  Test1
//
//  Created by Евгений on 22.04.23.
//

import UIKit

public class TinkoffHorizontalListView: UIView {
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

	private let listScrollView = {
		let scrollView = UIScrollView()
		scrollView.showsHorizontalScrollIndicator = false
		return scrollView
	}()

	private let listStackView = UIStackView()

	let primaryButton: TinkoffButton = {
		let button = TinkoffButton(style: .filled)
		button.setTitle("Button", for: .normal)
		return button
	}()


	// Initializers
	public init(header: String) {
		super.init(frame: .zero)

		setup()
		update(header: header)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}


	public override func layoutSubviews() {
		super.layoutSubviews()

		if let shadow = TinkoffStyle.primary.mainShadow {
			apply(shadow: shadow)
		}
	}


	// Update methods
	public func update(header: String) {
		self.headerLabel.text = header
	}

	public func update(items: [TinkoffListItem]) {
		self.listStackView.removeAllArrangedSubviews()

		items.forEach { item in
			let view = TinkoffListItemView(style: .square)
			view.update(with: item)
			self.listStackView.addArrangedSubview(view)
			self.listStackView.addSpacer(12)
		}

		self.listStackView.removeLastArrangedSubview()
	}

	public func addPrimaryButton(target: Any?, action: Selector) {
		primaryButton.addTarget(target, action: action, for: .primaryActionTriggered)

		stackView.removeLastArrangedSubview()
		stackView.addSpacer(20)
		stackView.addArrangedSubview(primaryButton)
		stackView.addSpacer(18)

		NSLayoutConstraint.activate([
			primaryButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 20),
			primaryButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -20),
		])
	}

	// Setup functions
	func addSubviews() {
		addSubview(stackView)

		listScrollView.addSubview(listStackView)

		headerView.addSubview(headerLabel)
		headerView.addSubview(secondaryButton)

		stackView.addSpacer(18)
		stackView.addArrangedSubview(headerView)
		stackView.addSpacer(12)
		stackView.addArrangedSubview(listScrollView)
		stackView.addSpacer(18)
	}

	func makeConstraints() {
		self.translatesAutoresizingMaskIntoConstraints = false
		stackView.translatesAutoresizingMaskIntoConstraints = false
		headerLabel.translatesAutoresizingMaskIntoConstraints = false
		listStackView.translatesAutoresizingMaskIntoConstraints = false
		primaryButton.translatesAutoresizingMaskIntoConstraints = false
		secondaryButton.translatesAutoresizingMaskIntoConstraints = false

		stackView.layoutMargins = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)

		NSLayoutConstraint.activate([
			headerLabel.topAnchor.constraint(equalTo: headerView.topAnchor),
			headerLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor),
			headerLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor),

			secondaryButton.leadingAnchor.constraint(equalTo: headerLabel.trailingAnchor, constant: 8),
			secondaryButton.topAnchor.constraint(equalTo: headerView.topAnchor),
			secondaryButton.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -20),
			secondaryButton.bottomAnchor.constraint(equalTo: headerView.bottomAnchor),

			listScrollView.heightAnchor.constraint(equalToConstant: 140),

			listStackView.leadingAnchor.constraint(equalTo: listScrollView.leadingAnchor),
			listStackView.topAnchor.constraint(equalTo: listScrollView.topAnchor),
			listStackView.bottomAnchor.constraint(equalTo: listScrollView.bottomAnchor),
			listStackView.trailingAnchor.constraint(equalTo: listScrollView.trailingAnchor),
		])

		NSLayoutConstraint.activate([
			stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
			stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
			stackView.topAnchor.constraint(equalTo: self.topAnchor),
			stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
		])
	}

	func setup() {
		backgroundColor = TinkoffStyle.primary.backgroundColor
		layer.cornerRadius = 24

		addSubviews()
		makeConstraints()
	}
}
