# expo-any-confetti

A Swift native confetti animation module for React Native using Expo that provides beautiful particle effects for celebrations and achievements.

<p align="center">
  <img src="./confetti.gif" alt="Confetti Animation Demo" width="300" />
</p>

## Features

- 🍎 iOS native implementation using Swift
- 🎉 Beautiful confetti animations
- 🎨 Customizable colors
- ⚡ Configurable intensity

## Installation

```bash
npx expo install expo-any-confetti
```

## Usage

**Important:** The `ExpoAnyConfetti` component should be wrapped by a View with the desired size (e.g., `flex: 1`) to define the confetti animation area.

```tsx
import React, { useState } from "react";
import { View, Button } from "react-native";
import { ExpoAnyConfetti } from "expo-any-confetti";

export default function App() {
  const [isStarted, setIsStarted] = useState(false);

  return (
    <ExpoAnyConfetti
      confettiColors={["#ff0000", "#00ff00", "#0000ff", "#ffff00", "#ff00ff"]}
      style={StyleSheet.absoluteFillObjec}
      isStarted={true}
    />
  );
}
```

## Props

| Prop              | Type       | Default     | Description                                       |
| ----------------- | ---------- | ----------- | ------------------------------------------------- |
| `confettiColors`  | `string[]` | `undefined` | Array of hex color strings for confetti particles |
| `intensity`       | `number`   | `1.0`       | Intensity of the confetti animation (0.0 to 1.0)  |
| `isStarted`       | `boolean`  | `false`     | Whether the confetti animation is active          |
| `beginAtTimeZero` | `boolean`  | `false`     | Whether to begin animation at time zero           |

## Platform Support

- ✅ iOS
- ❌ Android (use alternative skia solutions)

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## Credits

This module uses confetti animation code from [Any-Distance](https://github.com/Any-Distance). Special thanks to their team for the beautiful confetti implementation.

## License

MIT
