Feature: View Available Games

    Scenario: View Available Games
        Given the app is running
            And I am in {'home page'}
        Then I see {"Minecraft"} text