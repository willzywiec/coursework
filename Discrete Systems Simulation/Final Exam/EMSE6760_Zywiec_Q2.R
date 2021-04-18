# Will Zywiec
# EMSE 6760 Final Exam
# Question 2

rm(list = ls())
gc()

# a. Obtain the probability that a person having McDonald's now
#    will have McDonald's for the third meal after this meal.

# Probability combinations that result in success:
# McD --> McD --> McD --> McD (0.8 * 0.8 * 0.8)
# McD --> BK  --> McD --> McD (0.2 * 0.3 * 0.8)
# McD --> BK  --> BK  --> McD (0.2 * 0.7 * 0.3)
# McD --> McD --> BK  --> McD (0.8 * 0.2 * 0.3)

prob_sucess = (0.8 * 0.8 * 0.8) + (0.2 * 0.3 * 0.8) + (0.2 * 0.7 * 0.3) + (0.8 * 0.2 * 0.3)

prob_sucess

# b. Assuming that McDonald's is new to town, develop a model to 
#    determine how many iterations it takes until at least 70%
#    of the people have had McDonald's at least once.

TP = matrix(c(0.8, 0.3, 0.2, 0.7), ncol=2)

McD_once = 0 # population that have had McDonald's at least once
frac_McD_once = 0 # fraction of the population that have had McDonald's at least once
population = 1000 # population
iteration = 0 # number of iterations until at least 70% of the people have had McDonald's at least once.

S <- NA
T <- NA

col_counter <- NA

for (i in 1:population) {
	S[i] = 2
}

while (frac_McD_once < 0.7) {
	for (i in 1:population) {

		U = runif(1, min=0, max=1)

		if (U < TP[S[i], 1]) {
			S[i] = 1
			col_counter = c(col_counter, i)
		} else {
			S[i] = 2
		}
	}
	iteration = iteration + 1
	frac_McD_once = (length(col_counter) - 1) / population
}

iteration

# c. $10 purchase of fast food
#    What are the expected weekly sales of McDonald's and Burger King over the next 12 weeks?

McD_once = 0 # population that have had McDonald's at least once
frac_McD_once = 0 # fraction of the population that have had McDonald's at least once
population = 1000 # population
iteration = 0 # number of iterations until at least 70% of the people have had McDonald's at least once.

S <- NA
T <- NA

McD.Sales <- 0
BK.Sales <- 0

col_counter <- NA

for (i in 1:population) {
	S[i] = 2
}

for (i in 1:12) {
	for (i in 1:population) {

		U = runif(1, min=0, max=1)

		if (U < TP[S[i], 1]) {
			S[i] = 1
			col_counter = c(col_counter, i)
			McD.Sales = McD.Sales + 10
		} else {
			S[i] = 2
			BK.Sales = BK.Sales + 10
		}
	}
}

McD.Sales
BK.Sales
