import { ExpoAnyConfetti } from "expo-any-confetti";
import React, { useState } from "react";
import { Button, ScrollView, StyleSheet, Text, View } from "react-native";
import { SafeAreaProvider, SafeAreaView } from "react-native-safe-area-context";

export default function App() {
  const [isConfettiActive, setIsConfettiActive] = useState(false);
  const [intensity, setIntensity] = useState(1.0);
  const [size, setSize] = useState<"large" | "small">("large");

  const confettiColors = [
    "#ff0000", // Red
    "#00ff00", // Green
    "#0000ff", // Blue
    "#ffff00", // Yellow
    "#ff00ff", // Magenta
    "#00ffff", // Cyan
    "#ff6600", // Orange
  ];

  return (
    <SafeAreaProvider>
      <SafeAreaView style={styles.container}>
        <ScrollView contentContainerStyle={styles.scrollContent}>
          <Text style={styles.header}>🎉 Expo Any Confetti</Text>
          <Text style={styles.subtitle}>
            A Swift native confetti animation for iOS
          </Text>

          <View style={styles.controls}>
            <View style={styles.buttonGroup}>
              <Button
                title={isConfettiActive ? "Stop Confetti" : "Start Confetti"}
                onPress={() => setIsConfettiActive(!isConfettiActive)}
                color="#007AFF"
              />
            </View>

            <View style={styles.section}>
              <Text style={styles.sectionTitle}>
                Intensity: {intensity.toFixed(1)}
              </Text>
              <View style={styles.buttonRow}>
                <Button
                  title="Low (0.3)"
                  onPress={() => setIntensity(0.3)}
                  color="#34C759"
                />
                <Button
                  title="Medium (0.6)"
                  onPress={() => setIntensity(0.6)}
                  color="#34C759"
                />
                <Button
                  title="High (1.0)"
                  onPress={() => setIntensity(1.0)}
                  color="#34C759"
                />
              </View>
            </View>

            <View style={styles.section}>
              <Text style={styles.sectionTitle}>Size: {size}</Text>
              <View style={styles.buttonRow}>
                <Button
                  title="Small"
                  onPress={() => setSize("small")}
                  color="#FF9500"
                />
                <Button
                  title="Large"
                  onPress={() => setSize("large")}
                  color="#FF9500"
                />
              </View>
            </View>

            <View style={styles.infoBox}>
              <Text style={styles.infoText}>ℹ️ This is an iOS-only module</Text>
              <Text style={styles.infoSubtext}>
                Using Swift native implementation for beautiful confetti
                animations
              </Text>
            </View>
          </View>
        </ScrollView>

        {/* Confetti overlay */}
        {isConfettiActive && (
          <ExpoAnyConfetti
            confettiColors={confettiColors}
            intensity={intensity}
            size={size}
            isStarted={isConfettiActive}
            beginAtTimeZero
            style={StyleSheet.absoluteFillObject}
          />
        )}
      </SafeAreaView>
    </SafeAreaProvider>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#F2F2F7",
  },
  scrollContent: {
    padding: 20,
  },
  header: {
    fontSize: 32,
    fontWeight: "bold",
    textAlign: "center",
    marginTop: 20,
    marginBottom: 10,
    color: "#000",
  },
  subtitle: {
    fontSize: 16,
    textAlign: "center",
    color: "#8E8E93",
    marginBottom: 30,
  },
  controls: {
    gap: 20,
  },
  buttonGroup: {
    marginBottom: 10,
  },
  section: {
    backgroundColor: "#fff",
    borderRadius: 12,
    padding: 16,
    shadowColor: "#000",
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.1,
    shadowRadius: 2,
    elevation: 2,
  },
  sectionTitle: {
    fontSize: 18,
    fontWeight: "600",
    marginBottom: 12,
    color: "#000",
  },
  buttonRow: {
    flexDirection: "row",
    justifyContent: "space-between",
    gap: 10,
  },
  infoBox: {
    backgroundColor: "#E5F3FF",
    borderRadius: 12,
    padding: 16,
    borderLeftWidth: 4,
    borderLeftColor: "#007AFF",
  },
  infoText: {
    fontSize: 16,
    fontWeight: "600",
    color: "#007AFF",
    marginBottom: 4,
  },
  infoSubtext: {
    fontSize: 14,
    color: "#555",
  },
});
