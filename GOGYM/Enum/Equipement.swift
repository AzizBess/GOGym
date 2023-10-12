//
//  Equipement.swift
//  GoGym
//
//  Created by Aziz Bessrour on 2023-09-28.
//

import Foundation

enum Equipement: String, CaseIterable {
      case assisted = "assisted"
      case band = "band"
      case barbell = "barbell"
      case bodyWeight = "body weight"
      case bosuBall = "bosu ball"
      case cable = "cable"
      case dumbbell = "dumbbell"
      case ellipticalMachine = "elliptical machine"
      case ezBarbell = "ez barbell"
      case hammer = "hammer"
      case kettlebell = "kettlebell"
      case leverageMachine = "leverage machine"
      case medicineBall = "medicine ball"
      case olympicBarbell = "olympic barbell"
      case resistanceBand = "resistance band"
      case roller = "roller"
      case rope = "rope"
      case skiergMachine = "skierg machine"
      case sledMachine = "sled machine"
      case smithMachine = "smith machine"
      case stabilityBall = "stability ball"
      case stationaryBike = "stationary bike"
      case stepmillMachine = "stepmill machine"
      case tire = "tire"
      case trapBar = "trap bar"
      case upperBodyErgometer = "upper body ergometer"
      case weighted = "weighted"
      case wheelRolle = "wheel rolle"
    
    var imageName: String {
        if self.rawValue.contains(" ") {
            return self.rawValue.filter { $0 != " " }
        } else {
            return self.rawValue
        }
    }
}
