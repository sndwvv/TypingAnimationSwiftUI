//
//  LoginTypingTextStyle.swift
//  TypingAnimationSwiftUI
//
//  Created by Songyee Park on 2023/06/13.
//

import SwiftUI

struct LoginTypingTextStyle: ViewModifier {
	func body(content: Content) -> some View {
		content
			.font(.system(size: 20, weight: .bold))
			.foregroundColor(.accentColor)
			.multilineTextAlignment(.center)
			.lineLimit(nil)
	}
}
