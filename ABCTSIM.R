# Set the number and type of vehicles for each unit
ABCT1_Vehicles <- c(35, 12)
ABCT2_Vehicles <- c(30, 10)

# Set the number and type of weapons for each unit
ABCT1_Weapons <- c(10, 10, 10)
ABCT2_Weapons <- c(12, 12, 12)

# Set the terrain for each unit
ABCT1_Terrain <- c("hills", "valleys", "forests", "mountains")
ABCT2_Terrain <- "hills"

# Set the enemy defense for each unit
ABCT1_Enemy <- c("trenches", "fortifications")
ABCT2_Enemy <- c("bunkers", "trenches", "fortifications")

# Set the probability of success for each region
ABCT1_Prob <- function(terrain, enemy, weapons) {
  # Calculate the success rate based on terrain, enemy defense, and weapons
  success_rate <- 0
  
  if(terrain %in% ABCT1_Terrain) {
    success_rate <- success_rate + 0.1
  }
  
  if(enemy %in% ABCT1_Enemy) {
    success_rate <- success_rate + 0.2
  }
  
  if(weapons %in% ABCT1_Weapons) {
    success_rate <- success_rate + 0.1
  }
  
  return(success_rate)
}

ABCT2_Prob <- function(terrain, enemy, weapons) {
  # Calculate the success rate based on terrain, enemy defense, and weapons
  success_rate <- 0
  
  if(terrain == ABCT2_Terrain) {
    success_rate <- success_rate + 0.2
  }
  
  if(enemy %in% ABCT2_Enemy) {
    success_rate <- success_rate + 0.3
  }
  
  if(weapons %in% ABCT2_Weapons) {
    success_rate <- success_rate + 0.1
  }
  
  return(success_rate)
}

# Simulate the battle

# Calculate the effectiveness of each unit
ABCT1_Effectiveness <- ABCT1_Prob(ABCT1_Terrain[1], ABCT1_Enemy[1], ABCT1_Weapons[1])
ABCT2_Effectiveness <- ABCT2_Prob(ABCT2_Terrain, ABCT2_Enemy[1], ABCT2_Weapons[1])

# Calculate the risks associated with the battle
ABCT1_Risks <- ABCT1_Prob(ABCT1_Terrain[1], ABCT1_Enemy[1], ABCT1_Weapons[1])
ABCT2_Risks <- ABCT2_Prob(ABCT2_Terrain, ABCT2_Enemy[1], ABCT2_Weapons[1])

# Print the results
print(paste("ABCT1 effectiveness:", ABCT1_Effectiveness))
print(paste("ABCT2 effectiveness:", ABCT2_Effectiveness))
print(paste("ABCT1 risks:", ABCT1_Risks))
print(paste("ABCT2 risks:", ABCT2_Risks))

#Who will win
if(ABCT1_Effectiveness > ABCT2_Effectiveness) {
  print("ABCT1 is more effective.")
} else if(ABCT1_Effectiveness < ABCT2_Effectiveness) {
  print("ABCT2 is more effective.")
} else {
  print("Both units are equally effective.")
}

ABCT1_Attrition <- 0.1
ABCT2_Attrition <- 0.2

# Calculate the remaining vehicles for each unit
ABCT1_Remaining_Vehicles <- ABCT1_Vehicles - (ABCT1_Attrition * ABCT1_Vehicles)
ABCT2_Remaining_Vehicles <- ABCT2_Vehicles - (ABCT2_Attrition * ABCT2_Vehicles)

# Calculate the remaining weapons for each unit
ABCT1_Remaining_Weapons <- ABCT1_Weapons - (ABCT1_Attrition * ABCT1_Weapons)
ABCT2_Remaining_Weapons <- ABCT2_Weapons - (ABCT2_Attrition * ABCT2_Weapons)

# Print the remaining vehicles and weapons for each unit
print(paste("ABCT1 remaining vehicles:", ABCT1_Remaining_Vehicles))
print(paste("ABCT2 remaining vehicles:", ABCT2_Remaining_Vehicles))
print(paste("ABCT1 remaining weapons:", ABCT1_Remaining_Weapons))
print(paste("ABCT2 remaining weapons:", ABCT2_Remaining_Weapons))

