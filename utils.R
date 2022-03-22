print_hello <- function (name = NA, times = 3) {
    if (is.na(name)) {
        name = readline(prompt = "Please give your name: ")
    }
    for(n in 1:times) {
        print(paste0("Good morning, ", name))
    }
}

school <- "Hanze"