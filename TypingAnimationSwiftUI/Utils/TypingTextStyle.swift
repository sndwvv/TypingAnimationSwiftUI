//
//  TypingTextStyle.swift
//  TypingAnimationSwiftUI
//
//  Created by Songyee Park on 2023/06/13.
//

import SwiftUI

enum TypingTextStyle {
	case plain
	case medium

	func modifier() -> some ViewModifier {
		switch self {
		case .medium:
			return AnyViewModifier(LoginTypingTextStyle())
		default:
			return AnyViewModifier(EmptyModifier())
		}
	}
}
