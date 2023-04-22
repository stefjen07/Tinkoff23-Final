//
//  TestView.swift
//  Tinkoff23-TestApp
//
//  Created by Евгений on 22.04.23.
//

import UIKit
import Tinkoff23_Final

class TestView: UIView {
	private let scrollView = {
		let scrollView = UIScrollView()
		scrollView.showsVerticalScrollIndicator = false
		return scrollView
	}()
	
	private let stackView = {
		let stackView = UIStackView()
		stackView.axis = .vertical
		return stackView
	}()

	let tinkoffVerticalList = TinkoffVerticalListView(header: "Header", style: .primary)
	let tinkoffHorizontalList = TinkoffHorizontalListView(header: "Header")
	let tinkoffCard = TinkoffCardView(header: "Header", subheader: "Subheader", style: .primary)
	let tinkoffItemCard = TinkoffItemCardView(style: .primary)

	@objc func testCallback() {
		print("Hello")
	}

	func loadTestData() {
		tinkoffVerticalList.update(items: [
			ExampleTinkoffListItem(),
			ExampleTinkoffListItem(),
			ExampleTinkoffListItem(),
		])
		tinkoffVerticalList.addPrimaryButton(target: self, action: #selector(testCallback))


		tinkoffHorizontalList.update(items: [
			ExampleTinkoffListItem(),
			ExampleTinkoffListItem(),
			ExampleTinkoffListItem(),
		])
		tinkoffHorizontalList.addPrimaryButton(target: self, action: #selector(testCallback))


		tinkoffCard.addButton(target: self, action: #selector(testCallback))


		tinkoffItemCard.update(with: ExampleTinkoffListItem())
	}

	func setup() {
		self.addSubview(scrollView)
		scrollView.addSubview(stackView)

		stackView.addArrangedSubview(tinkoffVerticalList)
		stackView.addSpacer(15)
		stackView.addArrangedSubview(tinkoffHorizontalList)
		stackView.addSpacer(15)
		stackView.addArrangedSubview(tinkoffCard)
		stackView.addSpacer(15)
		stackView.addArrangedSubview(tinkoffItemCard)
		stackView.addSpacer(15)

		self.translatesAutoresizingMaskIntoConstraints = false
		scrollView.translatesAutoresizingMaskIntoConstraints = false
		stackView.translatesAutoresizingMaskIntoConstraints = false
		self.backgroundColor = .white

		NSLayoutConstraint.activate([
			scrollView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor),
			scrollView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor),
			scrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
			scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),

			stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20),
			stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
			stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -40),
			stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
			stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -20)
		])

		loadTestData()
	}

	init() {
		super.init(frame: .zero)

		self.backgroundColor = .white

		setup()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
