# MultiDegreeLikeButton

[![CI Status](https://img.shields.io/travis/RichGreenTea/MultiDegreeLikeButton.svg?style=flat)](https://travis-ci.org/nukotsuka/MultiDegreeLikeButton)
[![Version](https://img.shields.io/cocoapods/v/MultiDegreeLikeButton.svg?style=flat)](https://cocoapods.org/pods/MultiDegreeLikeButton)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License](https://img.shields.io/cocoapods/l/MultiDegreeLikeButton.svg?style=flat)](https://cocoapods.org/pods/MultiDegreeLikeButton)
[![Platform](https://img.shields.io/cocoapods/p/MultiDegreeLikeButton.svg?style=flat)](https://cocoapods.org/pods/MultiDegreeLikeButton)

**MultiDegreeLikeButton** is a "like button" which expresses the degree of like by changing the size.
The button gradually expands while the user is tapping. And if the button is 3D touched, it immediately expands.

|Long press|3D touch|
|-|-|
|<img src="https://user-images.githubusercontent.com/33661144/47263807-a904f680-d543-11e8-8e9c-228953ece40d.gif" width="300">|<img src="https://user-images.githubusercontent.com/33661144/47263815-d5207780-d543-11e8-945b-5a874047b6b3.gif" width="300">|


## Requirements

- iOS 10.0+
- Xcode 10.0+
- Swift 4.0+

## Installation


### CocoaPods
MultiDegreeLikeButton is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'MultiDegreeLikeButton'
```

### Carthage

If you’re using [Carthage](https://github.com/Carthage/Carthage), simply add
MisterFusion to your `Cartfile`:

```
github 'nukotsuka/MultiDegreeLikeButton'
```

## Usage
### Basic
```swift
let heartButton = MultiDegreeLikeButton(imageStyle: .heart)
heartButton.completion = { _, degree in
    // do something
}

view.addSubview(heartButton)
```

### Custom
```swift
let smileButton = MultiDegreeLikeButton(
    imageStyle: .custom(defaultImage: "smile_default", tappedImage: "smile_tapped"), 
    size: CGSize(width: 48, height: 48)
)
// custom properties
smileButton.likeDegree = 10
smileButton.durationLongPress = 5.0
smileButton.duration3DTouch = 0.5
smileButton.durationShrink = 0.5
smileButton.delayBeforeShrink = 0.1
smileButton.threshold3DTouch = 5.0
smileButton.completion = { button, degree in
    button.isEnabled = false
    // do something
}

view.addSubview(smileButton)
```

**Properties**
- `isEnabled: Bool`: if this value is false, `completion` is not called, but animation works.
- `likeDegree: Int`: the degree of like, and this value is used for expanding scale of the button.
- `durationLongPress: Double`: the duration of expanding animation while tapping the button.
- `duration3DTouch: Double`: the duration of expanding animation while 3D touching the button.
- `durationShrink: Double`: the duration of shrinking animation after end of tap.
- `delayBeforeShrink: Double`: the delay from the end of tap until shrinking starts.
- `threshold3DTouch: CGFloat`: the threshold at which 3D touch starts.
- `completionWithLikeDegree: ((MultiDegreeLikeButton, Int) -> Void)?`: the callback function called after tap finishes. `Int` argument indicates the degree of like based on the time the user was tapping, and the range is from 1 to `likeDegree`. 


## Author

nukotsuka, [@nukotsuka](https://twitter.com/nukotsuka)

## License

MultiDegreeLikeButton is available under the MIT license. See the LICENSE file for more info.
