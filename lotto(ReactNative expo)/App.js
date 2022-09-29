import { StatusBar } from "expo-status-bar";
import { useEffect, useState } from "react";
import { Button, StyleSheet, Text, View } from "react-native";

export default function App() {
  const [Lotto, setLotto] = useState([]);

  function makeLotto() {
    let i = 0;
    let lnumber = [];
    let rnumber = 0;

    let lottos = [];
    let a = 0;

    for (i = 1; i <= 45; i++) {
      lottos.push(i);
    }

    for (i = 0; i < +44; i++) {
      rnumber = Math.floor(Math.random() * 45);

      a = lottos[i];
      lottos[i] = lottos[rnumber];
      lottos[rnumber] = a;
    }

    for (i = 0; i < 6; i++) {
      lnumber.push(lottos[i]);
    }
    setLotto(lnumber);
  }

  useEffect(() => {
    makeLotto();
  }, []);

  return (
    <View style={styles.container}>
      <Text style={{ marginBottom: 100 }}>Lotto App</Text>

      <Button title="Lotto Number Create" onPress={() => makeLotto()} />

      <Text style={{ fontSize: 25 }}> {Lotto.toLocaleString()} </Text>
      <StatusBar style="auto" />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#fff",
    alignItems: "center",
    justifyContent: "center",
  },
});
