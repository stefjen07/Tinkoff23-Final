//
//  ExampleTinkoffListItem.swift
//  Test1
//
//  Created by Евгений on 22.04.23.
//

import UIKit
import Tinkoff23_Final

class ExampleTinkoffListItem: TinkoffListItem {
	var image: UIImage? {
		UIImage(named: "star")
	}

	var title: String {
		"Title"
	}
	var description: String {
		"Description"
	}
	var isClosable: Bool {
		true
	}
}
