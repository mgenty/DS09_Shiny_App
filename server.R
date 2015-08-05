## Create The Function:
stopDist <- function(x) {
    # Load Required Libraries:
    library(datasets)
    # Fit The Model:
    mod <- lm(dist ~ speed, data = cars)
    # Get The Coefficients For The Line:
    beta0 <- round(summary(mod)$coeff[1], 2)
    beta1 <- round(summary(mod)$coeff[2], 2)
    # Get The Fit:
    rsquared <- round(summary(mod)$r.squared, 4)
    corcoeff <- round(sqrt(summary(mod)$r.squared), 4)
    # Check & Adjust Inputs If Out Of Bounds:
    if (is.na(x)) {
        d <- NA
    } else if (x <  5 | x > 25) {
        d <- NA
    } else {
        # Predict The New Distance:
        newdata <- data.frame(speed = x)
        d <- round(predict(mod, newdata), 2)        
    }
    # Return Estimated Distance, beta0, & beta1
    rvect <- c(d, beta0, beta1, corcoeff, rsquared)
    # names(rvect) <- c("distance", "beta0", "beta1", "r", "R^2")
    names(rvect) <- c("", "", "", "", "")
    return(rvect)
}

## Run Function Once To Get The Constant Values:
speed <- 5
firstRun <- stopDist(speed)

shinyServer(
    function(input, output) {
        output$inputValue <- 
            renderPrint({input$speed})
        output$distance <- 
            renderPrint({as.numeric(stopDist(input$speed)[1])})
        output$equation <- 
            renderPrint({paste(
                'distance = ', 
                firstRun[2], 
                ' + ', 
                firstRun[3],
                '(speed)', sep = ""
                )    
            })
        output$ccoeff <- 
            renderPrint({as.numeric(firstRun[4])})
        output$rsquare <- 
            renderPrint({as.numeric(firstRun[5] * 100)})
    }
)