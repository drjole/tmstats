# Base game
base_game = Extension.find_or_create_by! name: "Base Game"
Board.find_or_create_by! name: "Tharsis", extension: base_game
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

# Prelude
prelude = Extension.find_or_create_by! name: "Prelude"
Corporation.find_or_create_by! name: "Cheung Shing Mars", extension: prelude
Corporation.find_or_create_by! name: "Point Luna", extension: prelude
Corporation.find_or_create_by! name: "Robinson Industries", extension: prelude
Corporation.find_or_create_by! name: "Valley Trust", extension: prelude
Corporation.find_or_create_by! name: "Vitor", extension: prelude

# Hellas & Elysium
hellas_and_elysium = Extension.find_or_create_by! name: "Hellas & Elysium"
Board.find_or_create_by! name: "Hellas", extension: hellas_and_elysium
Board.find_or_create_by! name: "Elysium", extension: hellas_and_elysium

# Venus Next
venus_next = Extension.find_or_create_by! name: "Venus Next"
Corporation.find_or_create_by! name: "Aphrodite", extension: venus_next
Corporation.find_or_create_by! name: "Celestic", extension: base_game
Corporation.find_or_create_by! name: "Manutech", extension: base_game
Corporation.find_or_create_by! name: "Morning Star Inc.", extension: base_game
Corporation.find_or_create_by! name: "Viron", extension: base_game

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

if Rails.env.development?
  users = ["Alice", "Bob", "Charlie", "David", "Eve"]
  users.each do |name|
    User.find_or_create_by! name: name, email_address: "#{name.downcase}@example.com" do |user|
      user.assign_attributes password: "password", password_confirmation: "password"
    end
  end

  User.find_by(name: "Alice").update!(admin: true)

  Game.create! date: Date.new(2024, 10, 7), num_generations: 6, board: Board.find_by(name: "Elysium"), extensions: [
    Extension.find_by(name: "Base Game"),
    Extension.find_by(name: "Corporate Era"),
    Extension.find_by(name: "Prelude"),
    Extension.find_by(name: "Hellas & Elysium"),
    Extension.find_by(name: "Venus Next"),
    Extension.find_by(name: "Turmoil")
  ], players_attributes: {
    "0": {
      user: User.find_by(name: "Alice"),
      corporation_id: Corporation.find_by(name: "Arcadian Communities").id,
      victory_points: 56
    },
    "1": {
      user: User.find_by(name: "Bob"),
      corporation_id: Corporation.find_by(name: "Splice").id,
      victory_points: 47
    },
    "2": {
      user: User.find_by(name: "Charlie"),
      corporation_id: Corporation.find_by(name: "Factorum").id,
      victory_points: 48
    },
    "3": {
      user: User.find_by(name: "David"),
      corporation_id: Corporation.find_by(name: "Philares").id,
      victory_points: 60
    },
    "4": {
      user: User.find_by(name: "Eve"),
      corporation_id: Corporation.find_by(name: "Cheung Shing Mars").id,
      victory_points: 54
    }
  }
end
