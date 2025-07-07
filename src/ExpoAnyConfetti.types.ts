export interface ExpoAnyConfettiProps {
  /**
   * Array of hex color strings for confetti particles
   * @default undefined
   */
  confettiColors?: string[];

  /**
   * Size of confetti particles
   * @default 'large'
   */
  style?: "large" | "small";

  /**
   * Intensity of the confetti animation (0.0 to 1.0)
   * @default 1.0
   */
  intensity?: number;

  /**
   * Whether the confetti animation is active
   * @default false
   */
  isStarted?: boolean;

  /**
   * Whether to begin animation at time zero
   * @default false
   */
  beginAtTimeZero?: boolean;
}
