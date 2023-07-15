# 🕸️ Spiderversify your SwiftUI views!

Inspired by the distinctive visual style of the animation "Spider-Man: Spider-Verse series" by Sony Pictures,
<br> `Spiderversify` brings a Spider-Verse like glitching effect to your SwiftUI views.

<br>

<p align="leading">
  <img src="https://github.com/Jager-yoo/Spiderversify/assets/71127966/2999354c-a30f-42ef-979f-83977819dbed" width="250"/>
  <img src="https://github.com/Jager-yoo/Spiderversify/assets/71127966/45bb7348-a2f7-4e3e-9977-bf418140ad0d" width="250"/>
  <img src="https://github.com/Jager-yoo/Spiderversify/assets/71127966/e006dc74-96d0-4a44-9f38-10d9b4887141" width="250"/>
</p>

The Spiderversify library requires `iOS 15.0`, macOS 12.0, watchOS 8.0, or tvOS 15.0 and higher.
<br> Enjoy bringing a bit of the Spider-Verse into your apps!

<br>

## - How to use Spiderversify

To apply `Spiderversify` to your SwiftUI views, you simply add the `.spiderversify` view modifier.
<br> Here is an example:

<br>

```swift
import SwiftUI
import Spiderversify

struct ContentView: View {

  @State private var glitching = false

  var body: some View {
    Text("Spiderversify")
      .spiderversify($glitching, duration: 2, glitchInterval: 0.12) // ⬅️ 🕸️
      .font(.title)
      .onTapGesture {
        glitching = true
      }
  }
}
```

<br>

## - Parameter Details

- `on`: A Binding<Bool> that controls whether the glitch effect is active.
- `duration`: The duration of the glitch effect animation.
- `glitchInterval`: The interval at which the glitch effect changes. (default value: 0.12 sec)

Please note that both duration and glitchInterval are specified in `seconds`.

<br>

## - Installation

Spiderversify supports [Swift Package Manager](https://www.swift.org/package-manager/).

Navigate to `File` menu at the top of Xcode -> Select `Add Packages...`.
Enter "https://github.com/Jager-yoo/Spiderversify.git" in the Package URL field to install it.

<br>

## - License

This library is released under the MIT license. See [LICENSE](https://github.com/Jager-yoo/Spiderversify/blob/main/LICENSE) for details.
