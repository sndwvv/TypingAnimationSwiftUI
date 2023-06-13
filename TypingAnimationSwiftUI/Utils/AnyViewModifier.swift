//
//  AnyViewModifier.swift
//  TypingAnimationSwiftUI
//
//  Created by Songyee Park on 2023/06/13.
//

import SwiftUI

struct AnyViewModifier: ViewModifier {
	private let modifier: (AnyView) -> AnyView

	init<Modifier: ViewModifier>(_ modifier: Modifier) {
		self.modifier = { view in AnyView(view.modifier(modifier)) }
	}

	func body(content: Content) -> some View {
		modifier(AnyView(content))
	}
}
