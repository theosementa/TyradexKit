# TyradexKit
TyradexKit is a Swift framework designed for developers to integrate Pokémon data into their applications. This README will guide you through the installation and basic usage of TyradexKit.

## Installation
To integrate TyradexKit into your Xcode project using Swift Package Manager, follow these steps:

1. Open your project in Xcode.
2. Navigate to File > Add Packages....
3. Enter the repository URL: https://github.com/theosementa/TyradexKit
4. Choose the version you wish to use.
5. Add the package to your target.

## Usage
Once you have TyradexKit installed, you can start using it to fetch and display Pokémon data. Below are some basic examples to help you get started.

<br>

```swift
import TyradexKit

@StateObject private var pokemonRepo: PokemonRepository = .shared
```

<br>

### PokemonRepository Methods
```swift
func fetchPokemons() async

func getPokemon(pokemonID: Int) async -> Pokemon?

func getPokemonsOfGeneration(generation: String) async -> [Pokemon]

func getRegionalFormOfPokemon(name: String, region: String) async -> Pokemon?
```

<br>

### Fetch Pokemon Data
Here's a simple example of how to fetch and display data
```swift
await pokemonRepo.fetchPokemons()

List(pokemonRepo.pokemons) { pokemon in

}
```
