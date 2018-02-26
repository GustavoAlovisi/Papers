# QUESTION #1

# Initial setup

# Clear all
rm(list=ls())

# Load packages
library(tidyverse) 

# Set working directory
setwd("C:/Users/fsabino/Desktop/Codes/")

# Parameters
n_steps = 17 # number of steps (0 is the origin)
n_iter = 1000 # number of simulations

# Compute the change in x (dx) and y (dy) corresponding to each dice roll
get_change_axes = function(outcome){
  
  # initialize variables
  dx = dy = NA
  
  # rolling the dice
  if (outcome == 1) { # up: north
    dx = 1/2
    dy = sqrt(3/4)
  } 
  else if (outcome == 2) { # diagonal to the upper right (Northeast)
    dx = 1
    dy = 0
  } 
  else if (outcome == 3) { # diagonal to the lower right (Southeast)
    dx = 1/2
    dy = -sqrt(3/4)
  }  
  else if (outcome == 4) { # down (South)
    dx = -1/2
    dy = -sqrt(3/4)
  }
  else if (outcome == 5) { # diagonal to the lower left (Southwest)
    dx = -1
    dy = 0
  } 
  else if (outcome == 6) { # diagonal to the upper left (Northwest)
    dx = -1/2
    dy = sqrt(3/4) 
  } else {
    stop("ERROR Invalid input: Resulting roll result should be an integer between 1 and 6")
  }
  
  # return the change in the axes corresponding to the dice roll
  return(list(dx, dy))

}

# Create a new row in the dataframe of step coordinates
# Each row picks up from where previous left off
# Row 1 begins and ends at origin
# Parameters:
#  i: row to update
update_curr_row = function(i) {
  # check whether row number is between 2 and n_steps
  if (i < 2 | i > n_steps) {
    stop("i must be between 2 and n_steps")
  }
  
  # Random number generator (roll the dice)
  outcome = sample(1:6, 1, replace = TRUE)
  
  # Update the i-th row in the dataframe df
  df[i, 'outcome'] <<- outcome # (scoping assignment) modifies the existing variable df 
  temp = get_change_axes(outcome) # change in x and y corresponding to the dice roll
  # Start point of this row is where last row ended
  df[i, c("x", "y")] <<- c(df[i - 1, "xend"], df[i - 1, "yend"])
  # End point of this row is start point plus changes
  df[i, c("xend", "yend")] <<- c(df[i, "x"] + temp[[1]], df[i, "y"] + temp[[2]])
}

# Collect up the iterations in a list of length n_iter (number of iterations)
ret_list = vector('list', n_iter)

# Main code:
# Simulate a random-walk in a hexagonal grid
system.time({ # returns the CPU time used
  for (j in 1:n_iter) { # create a data frame with the changes in the axes and the final coordinates
    df = data.frame(x = c(0, rep(NA, n_steps - 1)), 
                    y = c(0, rep(NA, n_steps - 1)), 
                    xend = c(0, rep(NA, n_steps - 1)), 
                    yend = c(0, rep(NA, n_steps - 1)), 
                    step = 0:(n_steps - 1),
                    group = j)
  for (i in 2:n_steps) { # create a new row in the dataframe of step coordinates
    update_curr_row(i)
  }
  
  # save results in a list
  ret_list[[j]] = df  
  
  }
})

# Convert the list of data frames (df) into one big data frame (stacked_df)
stacked_df = do.call('rbind', ret_list) 

# Get summary statistics for distance and average (x,y)-coordinates for every step
final_df = stacked_df %>% 
  mutate(distance = sqrt((xend)**2 + (yend)**2)) %>% # compute the distance
  group_by(step) %>%
  summarize(mean_avg = mean(distance),
            std_avg = mean(sd(distance)),
            root_mean_sq_avg = sqrt(mean(distance**2)),
            mean_x = mean(xend),
            mean_y = mean(yend)) %>%
  ungroup()


# Print final answers
options(digits = 10) # controls the number of digits to print

# Initialize vector with final answers
answers <- rep(NA, 2)

# Expected value of the bee's distance from the starting hexagon after n_steps steps
answers[1] <- final_df[[2]][n_steps]

# Expected value of the deviation of the bee's distance from the starting hexagon after n_steps steps
answers[2] <- final_df[[3]][n_steps]
# Update the labels
names(answers)[1] <- 'E(distance)'
names(answers)[2] <- 'E(sd(distance))'
# Print answers
print(answers)

# Vector of expected value of distance
distance_vec = vector()
for (i in 1:n_iter){
  distance_vec[i] = sqrt(stacked_df[n_steps*i,3]^2 + stacked_df[n_steps*i,4]^2)
}

# Compute the probability Pr(distance >= 8 | distance >= 6)
# By Bayes' rule, we have that Pr(d >= 8 | d >= 6) = Pr(d >= 8) / Pr(d >= 6)
length(distance_vec[distance_vec >= 6])/length(distance_vec)
length(distance_vec[distance_vec >= 8])/length(distance_vec)
length(distance_vec[distance_vec >= 8])/length(distance_vec[distance_vec >= 6])

# Compute the probability Pr(distance >= 24 | distance >= 20)
# By Bayes' rule, we have that Pr(d >= 24 | d >= 20) = Pr(d >= 24) / Pr(d >= 20)
length(distance_vec[distance_vec >= 20])/length(distance_vec)
length(distance_vec[distance_vec >= 24])/length(distance_vec)
length(distance_vec[distance_vec >= 24])/length(distance_vec[distance_vec >= 20])


