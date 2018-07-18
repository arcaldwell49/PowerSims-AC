
#Install the functions for the simulations
  

# Install the two functions from Lakens GitHub by running the code below:

source("https://raw.githubusercontent.com/Lakens/ANOVA_power_simulation/master/ANOVA_design.R")
source("https://raw.githubusercontent.com/Lakens/ANOVA_power_simulation/master/ANOVA_power.R")

#Install the function from Caldwell GitHub by running the code below:

source("https://raw.githubusercontent.com/arcaldwell49/PowerSims-AC/master/2b5ANOVAsim.R")



#Test type 1 error rate
#With correlation of 0.5
Cald_Nulln20r5 <- ANOVAsim2by5(TCt1Mean=0, TCt2Mean=0, TCt3Mean=0, TCt4Mean=0, TCt5Mean=0, TEt1Mean=0, TEt2Mean=0,TEt3Mean=0, TEt4Mean=0, TEt5Mean=0,
             r=0.5, SD=1, sample=20, reps=10000,  sig = 0.05)

design_Nulln20_r5 <- ANOVA_design(string = "2b*5w",
                              n = 20, 
                              mu = c(0, 0, 0, 0, 0,
                                     0, 0, 0, 0, 0), 
                              sd = 1, 
                              r=0.5, 
                              p_adjust = "none")

Lakens_Nulln20_r5 <- ANOVA_power(design_Nulln20_r5, alpha = 0.05, nsims = 10000)

#With correlation of 0.65
Cald_Nulln20r65 <- ANOVAsim2by5(TCt1Mean=0, TCt2Mean=0, TCt3Mean=0, TCt4Mean=0, TCt5Mean=0, TEt1Mean=0, TEt2Mean=0,TEt3Mean=0, TEt4Mean=0, TEt5Mean=0,
                               r=0.65, SD=1, sample=20, reps=10000,  sig = 0.05)

design_Nulln20_r65 <- ANOVA_design(string = "2b*5w",
                                  n = 20, 
                                  mu = c(0, 0, 0, 0, 0,
                                         0, 0, 0, 0, 0), 
                                  sd = 1, 
                                  r=0.65, 
                                  p_adjust = "none")

Lakens_Nulln20_r65 <- ANOVA_power(design_Nulln20_r65, alpha = 0.05, nsims = 10000)

#With correlation of 0.8
Cald_Nulln20r8 <- ANOVAsim2by5(TCt1Mean=0, TCt2Mean=0, TCt3Mean=0, TCt4Mean=0, TCt5Mean=0, TEt1Mean=0, TEt2Mean=0,TEt3Mean=0, TEt4Mean=0, TEt5Mean=0,
                                r=0.8, SD=1, sample=20, reps=10000,  sig = 0.05)

design_Nulln20_r8 <- ANOVA_design(string = "2b*5w",
                                   n = 20, 
                                   mu = c(0, 0, 0, 0, 0,
                                          0, 0, 0, 0, 0), 
                                   sd = 1, 
                                   r=0.8, 
                                   p_adjust = "none")

Lakens_Nulln20_r8 <- ANOVA_power(design_Nulln20_r8, alpha = 0.05, nsims = 10000)



#Power for interaction
#With correlation of 0.5 and sample size of 20
Cald_Inter_n20_r5 <- ANOVAsim2by5(TCt1Mean=0, TCt2Mean=0, TCt3Mean=0, TCt4Mean=0, TCt5Mean=0, 
                                  TEt1Mean=0, TEt2Mean=0.2,TEt3Mean=0.4, TEt4Mean=0.6, TEt5Mean=0.8,
                               r=0.5, SD=1, sample=20, reps=10000,  sig = 0.05)

design_Inter_n20_r5 <- ANOVA_design(string = "2b*5w",
                                  n = 20, 
                                  mu = c(0, 0, 0, 0, 0,
                                         0, 0.2, 0.4, 0.6, 0.8), 
                                  sd = 1, 
                                  r=0.5, 
                                  p_adjust = "none")

Lakens_Inter_n20_r5 <- ANOVA_power(design_Inter_n20_r5, alpha = 0.05, nsims = 10000)

#With correlation of 0.75 and sample size of 20
Cald_Inter_n20_r75 <- ANOVAsim2by5(TCt1Mean=0, TCt2Mean=0, TCt3Mean=0, TCt4Mean=0, TCt5Mean=0, 
                                  TEt1Mean=0, TEt2Mean=0.2,TEt3Mean=0.4, TEt4Mean=0.6, TEt5Mean=0.8,
                                  r=0.75, SD=1, sample=20, reps=10000,  sig = 0.05)

design_Inter_n20_r75 <- ANOVA_design(string = "2b*5w",
                                    n = 20, 
                                    mu = c(0, 0, 0, 0, 0,
                                           0, 0.2, 0.4, 0.6, 0.8), 
                                    sd = 1, 
                                    r=0.75, 
                                    p_adjust = "none")

Lakens_Inter_n20_r75 <- ANOVA_power(design_Inter_n20_r75, alpha = 0.05, nsims = 10000)


#With correlation of 0.5 and sample size of 40
Cald_Inter_n40_r5 <- ANOVAsim2by5(TCt1Mean=0, TCt2Mean=0, TCt3Mean=0, TCt4Mean=0, TCt5Mean=0, 
                                  TEt1Mean=0, TEt2Mean=0.2,TEt3Mean=0.4, TEt4Mean=0.6, TEt5Mean=0.8,
                                  r=0.5, SD=1, sample=40, reps=10000,  sig = 0.05)

design_Inter_n40_r5 <- ANOVA_design(string = "2b*5w",
                                    n = 40, 
                                    mu = c(0, 0, 0, 0, 0,
                                           0, 0.2, 0.4, 0.6, 0.8), 
                                    sd = 1, 
                                    r=0.5, 
                                    p_adjust = "none")

Lakens_Inter_n40_r5 <- ANOVA_power(design_Inter_n40_r5, alpha = 0.05, nsims = 10000)

#With correlation of 0.75 and sample size of 40
Cald_Inter_n40_r75 <- ANOVAsim2by5(TCt1Mean=0, TCt2Mean=0, TCt3Mean=0, TCt4Mean=0, TCt5Mean=0, 
                                   TEt1Mean=0, TEt2Mean=0.2,TEt3Mean=0.4, TEt4Mean=0.6, TEt5Mean=0.8,
                                   r=0.75, SD=1, sample=40, reps=10000,  sig = 0.05)

design_Inter_n40_r75 <- ANOVA_design(string = "2b*5w",
                                     n = 40, 
                                     mu = c(0, 0, 0, 0, 0,
                                            0, 0.2, 0.4, 0.6, 0.8), 
                                     sd = 1, 
                                     r=0.75, 
                                     p_adjust = "none")

Lakens_Inter_n40_r75 <- ANOVA_power(design_Inter_n40_r75, alpha = 0.05, nsims = 10000)


################


#Power for Main Effect for between subjects
#With correlation of 0.5 and sample size of 20
Cald_MainB_n20_r5 <- ANOVAsim2by5(TCt1Mean=0, TCt2Mean=0, TCt3Mean=0, TCt4Mean=0, TCt5Mean=0, 
                                  TEt1Mean=0.5, TEt2Mean=0.5,TEt3Mean=0.5, TEt4Mean=0.5, TEt5Mean=0.5,
                                  r=0.5, SD=1, sample=20, reps=10000,  sig = 0.05)

design_MainB_n20_r5 <- ANOVA_design(string = "2b*5w",
                                    n = 20, 
                                    mu = c(0, 0, 0, 0, 0,
                                           0.5, 0.5, 0.5, 0.5, 0.5), 
                                    sd = 1, 
                                    r=0.5, 
                                    p_adjust = "none")

Lakens_MainB_n20_r5 <- ANOVA_power(design_MainB_n20_r5, alpha = 0.05, nsims = 10000)

#With correlation of 0.75 and sample size of 20
Cald_MainB_n20_r75 <- ANOVAsim2by5(TCt1Mean=0, TCt2Mean=0, TCt3Mean=0, TCt4Mean=0, TCt5Mean=0, 
                                   TEt1Mean=0.5, TEt2Mean=0.5,TEt3Mean=0.5, TEt4Mean=0.5, TEt5Mean=0.5,
                                   r=0.75, SD=1, sample=20, reps=10000,  sig = 0.05)

design_MainB_n20_r75 <- ANOVA_design(string = "2b*5w",
                                     n = 20, 
                                     mu = c(0, 0, 0, 0, 0,
                                            0.5, 0.5, 0.5, 0.5, 0.5), 
                                     sd = 1, 
                                     r=0.75, 
                                     p_adjust = "none")

Lakens_MainB_n20_r75 <- ANOVA_power(design_MainB_n20_r75, alpha = 0.05, nsims = 10000)


#With correlation of 0.5 and sample size of 40
Cald_MainB_n40_r5 <- ANOVAsim2by5(TCt1Mean=0, TCt2Mean=0, TCt3Mean=0, TCt4Mean=0, TCt5Mean=0, 
                                  TEt1Mean=0.5, TEt2Mean=0.5,TEt3Mean=0.5, TEt4Mean=0.5, TEt5Mean=0.5,
                                  r=0.5, SD=1, sample=40, reps=10000,  sig = 0.05)

design_MainB_n40_r5 <- ANOVA_design(string = "2b*5w",
                                    n = 40, 
                                    mu = c(0, 0, 0, 0, 0,
                                           0.5, 0.5, 0.5, 0.5, 0.5), 
                                    sd = 1, 
                                    r=0.5, 
                                    p_adjust = "none")

Lakens_MainB_n40_r5 <- ANOVA_power(design_MainB_n40_r5, alpha = 0.05, nsims = 10000)

#With correlation of 0.75 and sample size of 40
Cald_MainB_n40_r75 <- ANOVAsim2by5(TCt1Mean=0, TCt2Mean=0, TCt3Mean=0, TCt4Mean=0, TCt5Mean=0, 
                                   TEt1Mean=0.5, TEt2Mean=0.5,TEt3Mean=0.5, TEt4Mean=0.5, TEt5Mean=0.5,
                                   r=0.75, SD=1, sample=40, reps=10000,  sig = 0.05)

design_MainB_n40_r75 <- ANOVA_design(string = "2b*5w",
                                     n = 40, 
                                     mu = c(0, 0, 0, 0, 0,
                                            0.5, 0.5, 0.5, 0.5, 0.5), 
                                     sd = 1, 
                                     r=0.75, 
                                     p_adjust = "none")

Lakens_MainB_n40_r75 <- ANOVA_power(design_MainB_n40_r75, alpha = 0.05, nsims = 10000)



##############################

#Power for iMain Effect for within subjects factor
#With correlation of 0.5 and sample size of 20
Cald_MainW_n20_r5 <- ANOVAsim2by5(TCt1Mean=0, TCt2Mean=0.1,TCt3Mean=0.2, TCt4Mean=0.3, TCt5Mean=0.4, 
                                  TEt1Mean=0, TEt2Mean=0.1,TEt3Mean=0.2, TEt4Mean=0.3, TEt5Mean=0.4,
                                  r=0.5, SD=1, sample=20, reps=10000,  sig = 0.05)

design_MainW_n20_r5 <- ANOVA_design(string = "2b*5w",
                                    n = 20, 
                                    mu = c(0, 0.1, 0.2, 0.3, 0.4,
                                           0, 0.1, 0.2, 0.3, 0.4), 
                                    sd = 1, 
                                    r=0.5, 
                                    p_adjust = "none")

Lakens_MainW_n20_r5 <- ANOVA_power(design_MainW_n20_r5, alpha = 0.05, nsims = 10000)

#With correlation of 0.75 and sample size of 20
Cald_MainW_n20_r75 <- ANOVAsim2by5(TCt1Mean=0, TCt2Mean=0.1,TCt3Mean=0.2, TCt4Mean=0.3, TCt5Mean=0.4, 
                                   TEt1Mean=0, TEt2Mean=0.1,TEt3Mean=0.2, TEt4Mean=0.3, TEt5Mean=0.4,
                                   r=0.75, SD=1, sample=20, reps=10000,  sig = 0.05)

design_MainW_n20_r75 <- ANOVA_design(string = "2b*5w",
                                     n = 20, 
                                     mu = c(0, 0.1, 0.2, 0.3, 0.4,
                                            0, 0.1, 0.2, 0.3, 0.4), 
                                     sd = 1, 
                                     r=0.75, 
                                     p_adjust = "none")

Lakens_MainW_n20_r75 <- ANOVA_power(design_MainW_n20_r75, alpha = 0.05, nsims = 10000)


#With correlation of 0.5 and sample size of 40
Cald_MainW_n40_r5 <- ANOVAsim2by5(TCt1Mean=0, TCt2Mean=0.1,TCt3Mean=0.2, TCt4Mean=0.3, TCt5Mean=0.4, 
                                  TEt1Mean=0, TEt2Mean=0.1,TEt3Mean=0.2, TEt4Mean=0.3, TEt5Mean=0.4,
                                  r=0.5, SD=1, sample=40, reps=10000,  sig = 0.05)

design_MainW_n40_r5 <- ANOVA_design(string = "2b*5w",
                                    n = 40, 
                                    mu = c(0, 0.1, 0.2, 0.3, 0.4,
                                           0, 0.1, 0.2, 0.3, 0.4), 
                                    sd = 1, 
                                    r=0.5, 
                                    p_adjust = "none")

Lakens_MainW_n40_r5 <- ANOVA_power(design_MainW_n40_r5, alpha = 0.05, nsims = 10000)

#With correlation of 0.75 and sample size of 40
Cald_MainW_n40_r75 <- ANOVAsim2by5(TCt1Mean=0, TCt2Mean=0.1,TCt3Mean=0.2, TCt4Mean=0.3, TCt5Mean=0.4, 
                                   TEt1Mean=0, TEt2Mean=0.1,TEt3Mean=0.2, TEt4Mean=0.3, TEt5Mean=0.4,
                                   r=0.75, SD=1, sample=40, reps=10000,  sig = 0.05)

design_MainW_n40_r75 <- ANOVA_design(string = "2b*5w",
                                     n = 40, 
                                     mu = c(0, 0.1, 0.2, 0.3, 0.4,
                                            0, 0.1, 0.2, 0.3, 0.4), 
                                     sd = 1, 
                                     r=0.75, 
                                     p_adjust = "none")

Lakens_MainW_n40_r75 <- ANOVA_power(design_MainW_n40_r75, alpha = 0.05, nsims = 10000)


save.image("C:/Users/ac039/Dropbox/Statistics/PowerSims-AC/objects_for_markdown.RData")
