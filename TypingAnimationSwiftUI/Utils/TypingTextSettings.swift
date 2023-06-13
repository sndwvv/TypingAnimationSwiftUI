//
//  TypingTextSettings.swift
//  TypingAnimationSwiftUI
//
//  Created by Songyee Park on 2023/06/13.
//

struct TypingTextSettings {
	
	let typingSpeed: Double
	let backspaceSpeed: Double
	let delaySeconds: Double
	let style: TypingTextStyle
	let isBackspaceEnabled: Bool
	let isHapticsEnabled: Bool

	init(typingSpeed: Double = 0.05,
		 backspaceSpeed: Double = 0.02,
		 delaySeconds: Double = 3.0,
		 style: TypingTextStyle = .plain,
		 isBackspaceEnabled: Bool = false,
		 isHapticsEnabled: Bool = false)
	{
		self.typingSpeed = typingSpeed
		self.backspaceSpeed = backspaceSpeed
		self.delaySeconds = delaySeconds
		self.style = style
		self.isBackspaceEnabled = isBackspaceEnabled
		self.isHapticsEnabled = isHapticsEnabled
	}
	
}

