library(maptools)

KFW_grid <- readShapePoly("/home/aiddata/Desktop/R_Repo/KFW_grids/IDJoining/Grid_CommunityFactors.shp")

#Join in each "grid-level" dataset

#Air Temp
csv <- read.csv("/home/aiddata/Desktop/R_Repo/KFW_grids/SciClone_Data/air_temp.csv")

#Merge in - "ad_XXXX_XX" - Average Degrees, Year, Month, at the grid level.
KFW_gridA <- merge(KFW_grid, csv, by.x="GridID", by.y="Id", all.x=TRUE)

#Remove the original grid and CSV to free up memory.
rm(KFW_grid)
rm(csv)

#Now, either merge in more datasets, or alternatively save the file.  You can use either:
#write.csv(KFW_gridA@data,"Path")
#or
#writePolyShape(KFW_gridA,"Path")