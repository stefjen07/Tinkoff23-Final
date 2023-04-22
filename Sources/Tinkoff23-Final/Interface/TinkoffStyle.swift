//
//  TinkoffStyle.swift
//  Test1
//
//  Created by Евгений on 22.04.23.
//

import UIKit

public enum TinkoffStyle {
	case primary
	case secondary

	var backgroundColor: UIColor? {
		switch self {
		case .primary:
			return TinkoffColors.primaryBackground
		case .secondary:
			return TinkoffColors.secondaryBackground
		}
	}

	var mainShadow: TinkoffShadow? {
		switch self {
		case .primary:
			return .medium
		case .secondary:
			return nil
		}
	}
}
