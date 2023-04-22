//
//  File.swift
//  
//
//  Created by Евгений on 22.04.23.
//

import UIKit

public protocol TinkoffListItem {
	var image: UIImage? { get }
	var title: String { get }
	var description: String { get }
	var isClosable: Bool { get }
}
