#Simulation code for 2 (b) by  5 (w) ANOVA
#This a code I wrote for an acquaintance 
#In this study participants were either in a control or experimental condition
#The measurement of interest was measured 5 times over 24 hours
#There the function starts out by defining the means for each cell of the study
#TC = treatment is control while TE = treatment is experimental
#t1-t5 refers to the "time point"
#The correlation between repeated measures is defined by "r"
#The standard deviation is defined by "SD"
#"sample" is the sample size per cell
#"reps" refers to the number of simulations
#"sig" refers to the alpha level

ANOVAsim2by5 <- function(TCt1Mean=0, TCt2Mean=0, TCt3Mean=0, TCt4Mean=0, TCt5Mean=0, 
                         TEt1Mean=0, TEt2Mean=0, TEt3Mean=0, TEt4Mean=0, TEt5Mean=0,
                         r=0.5, SD=1, sample, reps=1000, sig = 0.05){
  #Create the two data frames to store results
  #probs stores each sequence of the simulation
  #prop_sig stores the overall result of the simulation
  probs <- matrix(nrow = reps, ncol = 10, dimnames = list(c(), c("RepNum",  
                                                                 "pvalue_Main1", "pvalue_Main2", "pvalue_Inter",
                                                                 "sig_Main1", "sig_Main2", "sig_Inter",
                                                                 "pes_Main1", "pes_Main2", "pes_Inter")))
  prop_sig <- matrix(nrow = 1, ncol = 7, dimnames = list(c(), c("Sample_Size",
                                                                "Power_Main1",
                                                                "Power_Main2",
                                                                "Power_Inter",
                                                                "Part_Eta_Sq_Main1",
                                                                "Part_Eta_Sq_Main2",
                                                                "Part_Eta_Sq_Inter")))
  #For loop fot the simulation
  for (i in seq(1,reps,1)) {
    
    #meansC creates vector of means for the control group
    meansC <- c(TCt1Mean, TCt2Mean, TCt3Mean, TCt4Mean, TCt5Mean)
    #sigmaC creates vector of standard deviations for the control group
    sigmaC <- c(SD,SD,SD,SD,SD)
    #corMatC creates correlation matrix for the control group
    corMatC <-  matrix(c(1,r,r,r,r,
                         r,1,r,r,r,
                         r,r,1,r,r,
                         r,r,r,1,r,
                         r,r,r,r,1),nrow=5)
    #simstudy's genCorData is then utlized to produce a "wide" format dataset
    dataC <- simstudy::genCorData(n=sample,mu=meansC,sigma=sigmaC, corMatrix=corMatC)
    
    
    #Tranfer to long format
    data_longC <- tidyr::gather(dataC, point, measure, V1:V5, factor_key=TRUE)
    #Create column for within subject factor
    data_longC$time <- NA
    #Labels for within subject factor
    data_longC$time <- ifelse(data_longC$point == 'V1' , 1,
                              ifelse(data_longC$point == 'V2' , 2,
                                     ifelse(data_longC$point == 'V3', 3, 
                                            ifelse(data_longC$point == 'V4', 4, 5))))
    #Recognize the within subject label as a factor
    data_longC$time <- as.factor(data_longC$time)
    
    
    #Create between subjects factor
    data_longC$order <- NA
    data_longC$order <- "CON"
    data_longC$order <- as.factor(data_longC$order)
    
    
    #Repeats the process for the experimental group
    meansE <- c(TEt1Mean, TEt2Mean,TEt3Mean, TEt4Mean, TEt5Mean)
    sigmaE <- c(SD,SD,SD,SD,SD)
    corMatE <-  matrix(c(1,r,r,r,r,
                         r,1,r,r,r,
                         r,r,1,r,r,
                         r,r,r,1,r,
                         r,r,r,r,1),nrow=5)
    dataE <- simstudy::genCorData(n=sample,mu=meansE,sigma=sigmaE, corMatrix=corMatE)
    
    data_longE <- tidyr::gather(dataE, point, measure, V1:V5, factor_key=TRUE)
    data_longE$time <- NA
    data_longE$time <- ifelse(data_longE$point == 'V1' , 1,
                              ifelse(data_longE$point == 'V2' , 2,
                                     ifelse(data_longE$point == 'V3' , 3, 
                                            ifelse(data_longE$point == 'V4' , 4,5))))
    data_longE$time <- as.factor(data_longE$time)
    
    
    data_longE$order <- NA
    data_longE$order <- "EXP"
    data_longE$order <- as.factor(data_longE$order)
    
    data_longE$id <- data_longE$id+nrow(dataE)
    
    ##melt data together
    
    datarun <- rbind(data_longC, data_longE)
    
    #Recognize the subjects as a factor
    datarun$id <- as.factor(datarun$id)
    
    #Run anova; id for subject; measure is the measure of interest;
    modelRMb <- afex::aov_ez("id", "measure", data=datarun, 
                             between=c("order"), within=c("time"), anova_table = list("pes"))
    
    #Create table of p values from anova
    modB <- lapply(modelRMb$anova_table, broom::tidy)
    modB <- as.data.frame(modB$`Pr(>F)`)
    #Create table of partial eta squared values
    modPes <- lapply(modelRMb$anova_table, broom::tidy)
    modPes <- as.data.frame(modPes$pes)
    
    #Assigns between subjects main effect p value
    probs[i,2] <- modB$x[1]
    #Assigns within subjects main effect p value
    probs[i,3] <- modB$x[2]
    #Assign interaction p value
    probs[i,4] <- modB$x[3]
    #Assigns 1 for significant p-value for each effect
    ifelse(modB$x[1] < sig, probs[i,5] <- 1, probs[i,5] <- 0)
    ifelse(modB$x[2] < sig, probs[i,6] <- 1, probs[i,6] <- 0)
    ifelse(modB$x[3] < sig, probs[i,7] <- 1, probs[i,7] <- 0)
    #Assigns between subjects main effect partial eta squared
    probs[i,8] <- modPes$x[1]
    #Assigns within subjects main effect partial eta squared
    probs[i,9] <- modPes$x[2]
    #Assigns interaction partial eta squared
    probs[i,10] <- modPes$x[3]
  }
  
  
  
  #Create summation table of the results
  #Sample size
  prop_sig[,1] <- sample
  #proportion of main effect #1 that are significant
  prop_sig[,2] <- ((sum(probs[,5])) / reps)*100
  #proportion of main effect #1 that are significant
  prop_sig[,3] <- ((sum(probs[,6])) / reps)*100
  #proportion of main effect #1 that are significant
  prop_sig[,4] <- ((sum(probs[,7])) / reps)*100
  #Partial eta squared for main effects and interaction
  prop_sig[,5] <- round(mean(probs[,8]),digits=3)
  prop_sig[,6] <- round(mean(probs[,9]),digits=3)
  prop_sig[,7] <- round(mean(probs[,10]),digits=3)
  
  #Convert all matrices to data.frames
  probs <- data.frame(probs)
  prop_sig <- data.frame(prop_sig)
  
  
  #save simulation results to list
  invisible(list(Individual_Reps = probs,
                 Simulation_Result = prop_sig))
  
}