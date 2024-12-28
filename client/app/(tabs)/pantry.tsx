import { Image, StyleSheet, Platform, View, Text, FlatList, SectionList } from 'react-native';

import { HelloWave } from '@/components/HelloWave';
import ParallaxScrollView from '@/components/ParallaxScrollView';
import { ThemedText } from '@/components/ThemedText';
import { ThemedView } from '@/components/ThemedView';
import { SafeAreaView } from 'react-native-safe-area-context';

const styles = StyleSheet.create({
    container: {
      flex: 1,
      paddingTop: 22,
    },
    item: {
      padding: 10,
      fontSize: 18,
      height: 44,
    },
    section: {
      padding: 10,
      fontSize: 24,
      fontWeight: '700',
    },
  });

  const DATA = [
    {
      title: "Produit laitier",
      data: ["Lait", "Fromage", "Yahourt"]
    },
    {
      title: "Produit cérialier",
      data: ["Pain", "Céréal", "Croissant"]
    },
    {
      title: "Fruit",
      data: ["Pomme", "Poire", "Pêche"]
    }
  ]

export default function PantryScreen() {
  return (
    <SafeAreaView style={styles.container}>
      <SectionList
        sections={DATA}
        renderSectionHeader={(item) => <Text style={styles.section}>{item.section.title}</Text>}
        renderItem={({item}) => <Text style={styles.item}>{item}</Text>}
      />
    </SafeAreaView>
  );
}
