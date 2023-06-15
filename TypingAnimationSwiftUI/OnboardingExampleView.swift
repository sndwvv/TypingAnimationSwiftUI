//
//  OnboardingExampleView.swift
//  TypingAnimationSwiftUI
//
//  Created by Songyee Park on 2023/06/15.
//

import SwiftUI

struct OnboardingExampleView: View {
	
	@State var name: String = ""
	@State var showNamePromptText: Bool = false
	@State var showNameTextField: Bool = false
	@State var becomeFirstResponder: Bool = false
	
	var body: some View {
		ZStack {
			VStack(spacing: 4) {
				marcusGreetingView
				
				if showNamePromptText {
					namePromptTextView
				}
				
				if showNameTextField {
					nameTextField
				}
			}
		}
	}
	
	var marcusGreetingView: some View {
		let greetingText = "Greetings, I am Marcus."
		let settings = TypingTextSettings(
			typingSpeed: 0.05,
			style: .medium,
			isHapticsEnabled: true)
		
		return TypingTextView(text: greetingText,
					   settings: settings) {
			withAnimation(.easeInOut) {
				showNamePromptText = true
			}
		}
	}
	
	var namePromptTextView: some View {
		let promptText = "What is your name?"
		let settings = TypingTextSettings(
			typingSpeed: 0.05,
			style: .medium,
			isHapticsEnabled: true)
		
		return TypingTextView(text: promptText,
					   settings: settings) {
			withAnimation(.easeInOut) {
				showNameTextField = true
			}
		}
	}
	
	var nameTextField: some View {
		return OnboardingTextField(becomeFirstResponder: $becomeFirstResponder)
			.multilineTextAlignment(.center)
			.frame(height: 50)
			.padding(.horizontal, 50)
			.onAppear {
				withAnimation(.easeInOut) {
					becomeFirstResponder = true
				}
			}
	}
}

struct OnboardingExampleView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingExampleView()
    }
}

// MARK: OnboardingTextField

struct OnboardingTextField: UIViewRepresentable {
	typealias UIViewType = UITextField

	@Binding var becomeFirstResponder: Bool

	func makeUIView(context: Context) -> UITextField {
		let textField = UITextField()
		textField.textAlignment = .center
		return textField
	}
	
	func updateUIView(_ textField: UITextField, context: Context) {
		if self.becomeFirstResponder {
			DispatchQueue.main.async {
				textField.becomeFirstResponder()
				self.becomeFirstResponder = false
			}
		}
	}
}
