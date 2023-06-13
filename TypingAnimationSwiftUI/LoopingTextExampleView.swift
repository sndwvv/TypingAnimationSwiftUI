//
//  LoopingTextExampleView.swift
//  TypingAnimationSwiftUI
//
//  Created by Songyee Park on 2023/06/13.
//

import SwiftUI

struct LoopingTextExampleView: View {
	
	let texts = Constants.quotes
	let settings = TypingTextSettings(
		typingSpeed: 0.04,
		backspaceSpeed: 0.01,
		delaySeconds: 1.0,
		style: .medium,
		isBackspaceEnabled: true,
		isHapticsEnabled: true
	)
	
	@State private var currentTypingIndex = 0
	
    var body: some View {
        VStack {
			TypingTextView(
				text: texts[currentTypingIndex % texts.count],
				settings: settings) {
				
					// Completion Block
					// Go to next text when the animation finishes
					currentTypingIndex += 1
				}
				.id(currentTypingIndex)
				.frame(maxWidth: .infinity, maxHeight: .infinity)
				.padding(.horizontal)
        }
    }
	
}

struct LoopingTextExampleView_Previews: PreviewProvider {
    static var previews: some View {
		LoopingTextExampleView()
    }
}
