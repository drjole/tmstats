# Base game
base_game = Extension.find_or_create_by! name: "Base Game"
Board.find_or_create_by! name: "Tharsis"
Corporation.find_or_create_by! name: "Credicor", extension: base_game
Corporation.find_or_create_by! name: "Ecoline", extension: base_game
Corporation.find_or_create_by! name: "Helion", extension: base_game
Corporation.find_or_create_by! name: "Mining Guild", extension: base_game
Corporation.find_or_create_by! name: "Interplanetary Cinematics", extension: base_game
Corporation.find_or_create_by! name: "Inventrix", extension: base_game
Corporation.find_or_create_by! name: "Phobolog", extension: base_game
Corporation.find_or_create_by! name: "Tharsis Republic", extension: base_game
Corporation.find_or_create_by! name: "Thorgate", extension: base_game
Corporation.find_or_create_by! name: "United Nations Mars Initiative", extension: base_game

# Corporate Era
corporate_era = Extension.find_or_create_by! name: "Corporate Era"
Corporation.find_or_create_by! name: "Teractor", extension: corporate_era
Corporation.find_or_create_by! name: "Saturn Systems", extension: corporate_era

# Hellas & Elysium
Extension.find_or_create_by! name: "Hellas & Elysium"
Board.find_or_create_by! name: "Hellas"
Board.find_or_create_by! name: "Elysium"

# Venus Next
venus_next = Extension.find_or_create_by! name: "Venus Next"
Corporation.find_or_create_by! name: "Aphrodite", extension: venus_next
Corporation.find_or_create_by! name: "Celestic", extension: base_game
Corporation.find_or_create_by! name: "Manutech", extension: base_game
Corporation.find_or_create_by! name: "Morning Star Inc.", extension: base_game
Corporation.find_or_create_by! name: "Viron", extension: base_game

# Prelude
prelude = Extension.find_or_create_by! name: "Prelude"
Corporation.find_or_create_by! name: "Cheung Shing Mars", extension: prelude
Corporation.find_or_create_by! name: "Point Luna", extension: prelude
Corporation.find_or_create_by! name: "Robinson Industries", extension: prelude
Corporation.find_or_create_by! name: "Valley Trust", extension: prelude
Corporation.find_or_create_by! name: "Vitor", extension: prelude

# Colonies
colonies = Extension.find_or_create_by! name: "Colonies"
Corporation.find_or_create_by! name: "Aridor", extension: colonies
Corporation.find_or_create_by! name: "Arklight", extension: colonies
Corporation.find_or_create_by! name: "Polyphemos", extension: colonies
Corporation.find_or_create_by! name: "Poseidon", extension: colonies
Corporation.find_or_create_by! name: "Stormcraft", extension: colonies

# Turmoil
turmoil = Extension.find_or_create_by! name: "Turmoil"
Corporation.find_or_create_by! name: "Lakefront Resorts", extension: turmoil
Corporation.find_or_create_by! name: "Pristar", extension: turmoil
Corporation.find_or_create_by! name: "Septem Tribus", extension: turmoil
Corporation.find_or_create_by! name: "Terralabs Research", extension: turmoil
Corporation.find_or_create_by! name: "Utopia Inveset", extension: turmoil

# Turmoil Kickstarter Promo Pack
turmoil_kickstarter_promo_pack = Extension.find_or_create_by! name: "Turmoil Kickstarter Promo Pack"
Corporation.find_or_create_by! name: "Factorum", extension: turmoil_kickstarter_promo_pack
Corporation.find_or_create_by! name: "Mons Insurance", extension: turmoil_kickstarter_promo_pack
Corporation.find_or_create_by! name: "Philares", extension: turmoil_kickstarter_promo_pack

# TM Promo Pack
tm_promo_pack = Extension.find_or_create_by! name: "TM Promo Pack"
Corporation.find_or_create_by! name: "Arcadian Communities", extension: tm_promo_pack
Corporation.find_or_create_by! name: "Splice", extension: tm_promo_pack
Corporation.find_or_create_by! name: "Recyclon", extension: tm_promo_pack
