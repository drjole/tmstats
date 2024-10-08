# Base game
base_game = Extension.create! name: "Base Game"
Board.create! name: "Tharsis"
Corporation.create! name: "Credicor", extension: base_game
Corporation.create! name: "Ecoline", extension: base_game
Corporation.create! name: "Helion", extension: base_game
Corporation.create! name: "Mining Guild", extension: base_game
Corporation.create! name: "Interplanetary Cinematics", extension: base_game
Corporation.create! name: "Inventrix", extension: base_game
Corporation.create! name: "Phobolog", extension: base_game
Corporation.create! name: "Tharsis Republic", extension: base_game
Corporation.create! name: "Thorgate", extension: base_game
Corporation.create! name: "United Nations Mars Initiative", extension: base_game

# Corporate Era
corporate_era = Extension.create! name: "Corporate Era"
Corporation.create! name: "Teractor", extension: corporate_era
Corporation.create! name: "Saturn Systems", extension: corporate_era

# Hellas & Elysium
Extension.create! name: "Hellas & Elysium"
Board.create! name: "Hellas"
Board.create! name: "Elysium"

# Venus Next
venus_next = Extension.create! name: "Venus Next"
Corporation.create! name: "Aphrodite", extension: venus_next
Corporation.create! name: "Celestic", extension: base_game
Corporation.create! name: "Manutech", extension: base_game
Corporation.create! name: "Morning Star Inc.", extension: base_game
Corporation.create! name: "Viron", extension: base_game

# Prelude
prelude = Extension.create! name: "Prelude"
Corporation.create! name: "Cheung Shing Mars", extension: prelude
Corporation.create! name: "Point Luna", extension: prelude
Corporation.create! name: "Robinson Industries", extension: prelude
Corporation.create! name: "Valley Trust", extension: prelude
Corporation.create! name: "Vitor", extension: prelude

# Colonies
colonies = Extension.create! name: "Colonies"
Corporation.create! name: "Aridor", extension: colonies
Corporation.create! name: "Arklight", extension: colonies
Corporation.create! name: "Polyphemos", extension: colonies
Corporation.create! name: "Poseidon", extension: colonies
Corporation.create! name: "Stormcraft", extension: colonies

# Turmoil
turmoil = Extension.create! name: "Turmoil"
Corporation.create! name: "Lakefront Resorts", extension: turmoil
Corporation.create! name: "Pristar", extension: turmoil
Corporation.create! name: "Septem Tribus", extension: turmoil
Corporation.create! name: "Terralabs Research", extension: turmoil
Corporation.create! name: "Utopia Inveset", extension: turmoil

# Turmoil Kickstarter Promo Pack
Corporation.create! name: "Factorum"
Corporation.create! name: "Mons Insurance"
Corporation.create! name: "Philares"

# TM Promo Pack
Corporation.create! name: "Arcadian Communities"
Corporation.create! name: "Splice"
Corporation.create! name: "Recyclon"
