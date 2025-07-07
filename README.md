# expo-any-confetti

A confetti animation module for React Native using Expo that provides beautiful particle effects for celebrations and achievements.

<p align="center">
  <img src="./confetti.gif" alt="Confetti Animation Demo" width="300" />
</p>

## Features

- 🎉 Beautiful confetti animations
- 🎨 Customizable colors
- 📏 Multiple sizes (large and small)
- ⚡ Configurable intensity
- 🎯 Precise control over start/stop timing
- 🍎 iOS native implementation using Swift

## Installation

### For managed Expo projects

```bash
npx expo install expo-any-confetti
```

### For bare React Native projects

First, ensure you have [installed and configured the `expo` package](https://docs.expo.dev/bare/installing-expo-modules/).

```bash
npx expo install expo-any-confetti
```

#### Configure for iOS

Run `npx pod-install` after installing the npm package.

## Usage

**Important:** The `ExpoAnyConfettiView` component should be wrapped by a View with the desired size (e.g., `flex: 1`) to define the confetti animation area.

```tsx
import React, { useState } from "react";
import { View, Button } from "react-native";
import { ExpoAnyConfettiView } from "expo-any-confetti";

export default function App() {
  const [isStarted, setIsStarted] = useState(false);

  return (
    <View style={{ flex: 1, justifyContent: "center", alignItems: "center" }}>
      <Button
        title={isStarted ? "Stop Confetti" : "Start Confetti"}
        onPress={() => setIsStarted(!isStarted)}
      />

      {/* Wrap ExpoAnyConfettiView in a View with desired size */}
      <View style={{ flex: 1, width: "100%" }}>
        <ExpoAnyConfettiView
          confettiColors={[
            "#ff0000",
            "#00ff00",
            "#0000ff",
            "#ffff00",
            "#ff00ff",
          ]}
          style="large"
          intensity={0.8}
          isStarted={isStarted}
          onConfettiStart={() => console.log("Confetti started!")}
          onConfettiStop={() => console.log("Confetti stopped!")}
        />
      </View>
    </View>
  );
}
```

## Props

| Prop              | Type                 | Default     | Description                                       |
| ----------------- | -------------------- | ----------- | ------------------------------------------------- |
| `confettiColors`  | `string[]`           | `undefined` | Array of hex color strings for confetti particles |
| `style`           | `'large' \| 'small'` | `'large'`   | Size of confetti particles                        |
| `intensity`       | `number`             | `1.0`       | Intensity of the confetti animation (0.0 to 1.0)  |
| `isStarted`       | `boolean`            | `false`     | Whether the confetti animation is active          |
| `beginAtTimeZero` | `boolean`            | `false`     | Whether to begin animation at time zero           |
| `onConfettiStart` | `() => void`         | `undefined` | Callback when confetti starts                     |
| `onConfettiStop`  | `() => void`         | `undefined` | Callback when confetti stops                      |

## Platform Support

- ✅ iOS
- ❌ Android

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## Credits

This module uses confetti animation code from [Any-Distance](https://github.com/Any-Distance). Special thanks to their team for the beautiful confetti implementation.

## License

MIT
