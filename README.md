# TypingAnimationSwiftUI
Add a typewriter style of animation to a SwiftUI Text, with customizable settings (typing speed, backspacing, haptic feedback).

## Preview
https://github.com/sndwvv/TypingAnimationSwiftUI/assets/108448821/1281e058-eb13-4744-901a-f5078490f1a2

## Implementation

Simply initialize the TypingTextView with a text string:
```swift
TypingTextView(text: "Hello, World!")
```

Adjust settings as needed. 
Make use of the completion block to do something after the animation is complete.

```swift
let fullText = "Hello, World!"
let settings = TypingTextSettings(
  typingSpeed: 0.04,
  backspaceSpeed: 0.01,
  delaySeconds: 1.0,
  isBackspaceEnabled: false,
  isHapticsEnabled: false
)
```

```swift
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
```

| TypingTextSetting  | Description |
| ------------- | ------------- |
| typingSpeed  | Adjusts typing speed |
| backspaceSpeed  | Adjust backspacing / reverse typing speed  |
| delaySeconds | Adds a delay after backspacing is complete |
| style | TypingTextStyle: add styling using one of the pre-made ViewModifiers |
| isBackspaceEnabled | If true, text is fully typed then backspaced / removed |
| isHapticsEnabled | Adds a haptic feedback every time a character is added or removed |

Pass an array of texts and have it loop continuously (refer to LoopingTextExample.swift)

```swift
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
          // Go to next text when the animation finishes
          currentTypingIndex += 1
        }
        .id(currentTypingIndex)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.horizontal)
        }
      }
}
```

## Styling

Add modifiers to the end as usual: 
```swift
TypingTextView(text: "Hello World")
  .foregroundColor(.brown)
  .font(.system(size: 20, weight: .bold))
```

Or create your own modifier and add to the settings as the TypingTextStyle:
```swift
enum TypingTextStyle {
  case plain
  case medium
  // add more
  
  func modifier() -> some ViewModifier {
    switch self {
      case .medium:
        return AnyViewModifier(MediumTypingTextStyle())
      default:
        return AnyViewModifier(EmptyModifier())
      }
    }
}
```
## Upcoming
* macOS compatibitlity

