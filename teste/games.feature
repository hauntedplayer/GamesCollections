Feature: Modify game status

    Scenario: Marking a game as "Jogando"
        Given the app is running
            And I am in {'home page'}
            And I select a game {“Minecraft”}
        When I mark the game {“Minecraft”} as {'Jogando'}
        Then the game {“Minecraft”} is {'Jogando'}
            And the game {“Minecraft”} is in {'my_games page'}

    Scenario: Marking a game as "Jogado"
        Given the app is running
            And I am in {'home page'}
            And I select a game {“Minecraft”}
        When I mark the game {“Minecraft”} as {'Jogado'}
        Then the game {“Minecraft”} is {'Jogado'}
            And the game {“Minecraft”} is in {'my_games page'}

    Scenario: Marking a game as "Quero jogar"
        Given the app is running
            And I am in {'home page'}
            And I select a game {“Minecraft”}
        When I mark the game {“Minecraft”} as {'Quero jogar'}
        Then the game {“Minecraft”} is {'Quero jogar'}
            And the game {“Minecraft”} is in {'my_games page'}


Feature: Rate a game

    Scenario: Rate a game
        Given the app is running
            And I am in {'home page'}
            And I select a game {“Minecraft”}
        When I rate the game {“Minecraft”} as {'2'}
        Then the rating of game {“Minecraft”} is {'2'}


Feature: View Available Games

    Scenario: View Available Games
        Given the app is running
            And I am in {'home page'}
        Then I see {"Minecraft"} game

    Scenario: Filter Game by Year
        Given the app is running
            And I am in {'home page'}
        When I search for {"2009"} 
        Then I see {"Minecraft"} game

	Scenario: Filter Game by Type
        Given the app is running
            And I am in {'home page'}
        When I search for {"Sandbox"} 
        Then I see {"Minecraft"} game

    Scenario: Filter Game by Publisher
        Given the app is running
            And I am in {'home page'}
        When I search for {"Mojang Studios"} 
        Then I see {"Minecraft"} game


Feature: View Active Games

    Scenario: No active Games
    Given the app is running
        And I am in {'my_games page'}
    Then I see {"Não há jogos adicionados"} text

    Scenario: View Active Games
        Given the app is running
            And I am in {'home page'}
            And I select a game {“Minecraft”}
            And I mark the game {“Minecraft”} as {'Jogado'}
        When I go to {'my_games page'}
        Then I see {"Minecraft"} game

    Scenario: Remove Game
        Given the app is running
            And I am in {'home page'}
            And I select a game {“Minecraft”}
            And I mark the game {“Minecraft”} as {'Jogado'}
            And I go to {'my_games page'}
            And I see {"Minecraft"} game
        When I remove the  {“Minecraft”} game
        Then I don’t see {"Minecraft"} game


Feature: Select a game
    Scenario: Open game details modal in homepage
    Given the app is running
        And I am in {'home page'}
    When I select a game {“Minecraft”}
    Then I see {"Minecraft"} game
        And I see the game {"Minecraft"}  description as {“Minecraft is a game where you build things with blocks in an open virtual world that's free to explore.”} 
        And I see the game {“Minecraft”} year as {"2009"} 
        And I see the game {"Minecraft"} type as {"Sandbox"} 
        And I see the game {"Minecraft"}  publisher  as {"Mojang Studios"} 