import { requireNativeViewManager } from "expo-modules-core";
import * as React from "react";

import { ExpoAnyConfettiProps } from "./ExpoAnyConfetti.types";

const NativeView: React.ComponentType<ExpoAnyConfettiProps> =
  requireNativeViewManager("ExpoAnyConfetti");

export default function ExpoAnyConfetti(props: ExpoAnyConfettiProps) {
  return <NativeView {...props} />;
}
