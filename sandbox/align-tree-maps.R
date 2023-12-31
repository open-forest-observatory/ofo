# Purpose: Demonstrate function for identifying the optimal x, y, z shift to align two (simulated)
# tree maps

# Setup

library(spatstat)
library(ggplot2)
library(dplyr)

# ---- Simulate a "predicted" and "observed" tree map
sim = simulate_tree_maps(trees_per_ha = 300, trees_per_clust = 5, cluster_radius = 5,
                         obs_extent = 60,
                         horiz_jitter = 3,
                         vert_jitter = 5, # max of 5
                         false_pos = 0.25,
                         false_neg = 0.50,
                         drop_understory = TRUE,
                         shift_x = -9.25,
                         shift_y = 15.5)

print(nrow(sim$obs))
vis2(sim$pred, sim$obs)

obj_mean_dist_to_closest(sim$pred, sim$obs)

tictoc::tic()
best_shift = find_best_shift(sim$pred, sim$obs)
tictoc::toc()
print(best_shift)


# Try different random tree maps and see if it works every time