//
//  Teams.swift
//  SuperCroco
//
//  Created by Alexey Davidenko on 21.04.2023.
//

import Foundation

struct Team {
     let name: String
     let avatar: String
     var score: Int

     static func getTeams() -> (firstTeam: Team, secondTeam: Team) {
         let teams = [
             Team(name: "Стройняшки", avatar: "hobbie", score: 0),
             Team(name: "Толстяки", avatar: "food", score: 0),
             Team(name: "Панки", avatar: "persons", score: 0),
             Team(name: "Звезды", avatar: "star", score: 0)
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
