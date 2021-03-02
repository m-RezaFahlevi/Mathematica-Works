library(plotly)

#Declare a constant
gravity = 9.81 # in meter / second square. Of course this value is an approximation
drag_coefficient = 0.25 # in kg / m
mass = 68.1 # in kg

#An autonomous differential equations
diffeq_velocity <- function(what_time, what_velocity) {
        calc_slope <- gravity - (drag_coefficient * (what_velocity ** 2)) / mass
        return(calc_slope)
}

#This solution is founded by using calculus / analytical
calc_velocity <- function(time_t) {
    velocity <- sqrt(gravity * mass / drag_coefficient) * tanh(sqrt(gravity * drag_coefficient / mass) * time_t)
    return(velocity)
}

calc_model<- function(what_step_size, what_calc_time, initial_calc_velocity = 0) {
    step_size = what_step_size
    calc_time = what_calc_time
    
    model_calc_velocity <- c(initial_calc_velocity)
    
    for (iter in 1:length(calc_time)) {
        ifelse(
            iter == 1,
            model_calc_velocity[iter] <- model_calc_velocity + step_size*diffeq_velocity(what_time = calc_time[iter], what_velocity = model_calc_velocity),
            model_calc_velocity[iter] <- model_calc_velocity[iter-1] + step_size*diffeq_velocity(what_time = calc_time[iter], what_velocity = model_calc_velocity[iter-1])
        )
    }
    
    df <- data.frame(calc_time, model_calc_velocity)
    
    return(df)
}

calculated_model <- calc_model(what_step_size = 2, what_calc_time = seq(0, 12, 2), initial_calc_velocity = -40)
calculated_model

plot_model_df <- ggplot(data = calculated_model, mapping = aes(calc_time, model_calc_velocity)) + geom_line(color = "blue")
plot_model_df 

calc_time = seq(0, 12, 2)
predicted_velocity <- calc_velocity(time_t = calc_time)
predicted_velocity
df_predicted_velocity <- data.frame(calc_time, predicted_velocity)
df_predicted_velocity

plot_predicted_velocity <- ggplot(data = df_predicted_velocity, mapping = aes(calc_time, predicted_velocity)) + geom_line(color = "darkblue")
plot_predicted_velocity
