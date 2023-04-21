//
//  Team.swift
//  SuperCroco
//
//  Created by Келлер Дмитрий on 21.04.2023.
//

struct Team {
    let name: String
    let avatar: String
    
    static func getTeams() -> (firstTeam: Team, secondTeam: Team) {
        let teams = [
            Team(name: "Стройняшки", avatar: "food"),
            Team(name: "Ковбои", avatar: "persons"),
            Team(name: "Толстяки", avatar: "food"),
            Team(name: "Панки", avatar: "persons"),
            Team(name: "Звезды", avatar: "star")
        ]
        
        let shuffledTeams = teams.shuffled()
        let firstTeam = shuffledTeams.randomElement()!
        var secondTeam = shuffledTeams.randomElement()!
        
        while firstTeam.name == secondTeam.name {
            secondTeam = shuffledTeams.randomElement()!
        }
        
        return (firstTeam, secondTeam)
    }
}
