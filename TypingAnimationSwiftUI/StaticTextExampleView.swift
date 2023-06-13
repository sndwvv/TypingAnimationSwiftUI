//
//  StaticTextExampleView.swift
//  TypingAnimationSwiftUI
//
//  Created by Songyee Park on 2023/06/13.
//

import SwiftUI

struct StaticTextExampleView: View {
	
	let fullText: String = Constants.quotes.first ?? "Hello, World!"
	let settings = TypingTextSettings(
		typingSpeed: 0.04,
		backspaceSpeed: 0.01,
		delaySeconds: 1.0,
		isBackspaceEnabled: false,
		isHapticsEnabled: false
	)
	
	var body: some View {
		VStack {
			TypingTextView(
				text: fullText,
				settings: settings
			) {
				// animation complete
			}
			.font(.system(size: 12, weight: .heavy))
			.foregroundColor(.primary)
		}
	}

}

struct StaticTextExampleView_Previews: PreviewProvider {
    static var previews: some View {
        StaticTextExampleView()
    }
}
