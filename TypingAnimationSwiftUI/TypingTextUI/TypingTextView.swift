//
//  TypingTextView.swift
//  TypingAnimationSwiftUI
//
//  Created by Songyee Park on 2023/06/13.
//

import SwiftUI
import Combine

struct TypingTextView: View {
	
	let text: String
	let settings: TypingTextSettings
	let completion: (() -> Void)?

	@State private var displayText = ""
	@State private var timer: AnyCancellable?
	@State private var isTyping = true
	@State private var isDelaying = false
	
	init(text: String,
		 settings: TypingTextSettings = TypingTextSettings(),
		 completion: (() -> Void)? = nil)
	{
		self.text = text
		self.settings = settings
		self.completion = completion
	}

	var body: some View {
		Text(displayText)
			.modifier(settings.style.modifier())
			.onAppear(perform: startTyping)
			.onDisappear(perform: cancelTyping)
	}
	
	private func startTyping() {
		isTyping = true
		isDelaying = false
		startTimer(with: settings.typingSpeed, action: appendNextCharacter)
	}
	
	private func cancelTyping() {
		timer?.cancel()
	}
	
	private func startBackspacing() {
		if settings.isBackspaceEnabled {
			isTyping = false
			isDelaying = false
			startTimer(with: settings.backspaceSpeed, action: removeLastCharacter)
		} else {
			cancelTyping()
			completion?()
		}
	}
	
	private func startDelayBeforeBackspacing() {
		if settings.isBackspaceEnabled {
			isDelaying = true
			DispatchQueue.main.asyncAfter(deadline: .now() + settings.delaySeconds, execute: startBackspacing)
		} else {
			cancelTyping()
			completion?()
		}
	}
	
	private func startTimer(with interval: Double, action: @escaping () -> Void) {
		timer = Timer.publish(every: interval, on: .main, in: .common)
			.autoconnect()
			.sink { _ in
				action()
			}
	}
	
	private func appendNextCharacter() {
		if displayText.count < text.count {
			appendCharacterAtCurrentIndex()
			if settings.isHapticsEnabled {
				generateHapticFeedbackIfEnabled(with: .light)
			}
		} else {
			cancelTyping()
			startDelayBeforeBackspacing()
		}
	}
	
	private func appendCharacterAtCurrentIndex() {
		let index = text.index(text.startIndex, offsetBy: displayText.count)
		displayText.append(text[index])
	}
	
	private func removeLastCharacter() {
		if displayText.count > 0 {
			displayText.removeLast()
			generateHapticFeedbackIfEnabled(with: .soft)
		} else {
			cancelTyping()
			completion?()
		}
	}
	
	private func generateHapticFeedbackIfEnabled(with style: UIImpactFeedbackGenerator.FeedbackStyle) {
		if settings.isHapticsEnabled {
			UIImpactFeedbackGenerator(style: style).impactOccurred()
		}
	}
}


struct TypingText_Previews: PreviewProvider {
	static var previews: some View {
		TypingTextView(text: "Hello World")
			.foregroundColor(.brown)
			.font(.system(size: 20, weight: .bold))
	}
}
