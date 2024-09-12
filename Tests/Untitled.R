#With RainScotland, show how to
# ggplot a scatterplot with the OLS displayed
# and add residual vertical lines
# then add CI and explain how it is calculated

#Read the data
RainScotland<-read.csv("data/Ferguson/RainScotland.csv")

# Load the necessary packages
library(ggplot2)
library(ggpmisc)

# Create the scatter plot with OLS line, equation, and residual lines
ggplot(RainScotland, aes(x = Elevation, y = Rainfall)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "blue") +
  stat_poly_eq(aes(label = paste(..eq.label.., ..rr.label.., sep = "~~~")),
               formula = y ~ x, parse = TRUE) +
  geom_segment(aes(xend = Elevation, yend = predict(lm(Rainfall ~ Elevation, data = RainScotland))),
               linetype = "dashed", color = "red", size = 0.5) +
  labs(title = "Scatterplot of Rainfall against Elevation",
       x = "Elevation (m)",
       y = "Rainfall (mm)") +
  theme_minimal()


#add a confidence interval (95%)
ggplot(RainScotland, aes(x = Elevation, y = Rainfall)) +
  geom_point() +
  geom_smooth(method = "lm", se = TRUE, color = "blue", fill = "lightblue", alpha = 0.3) +
  stat_poly_eq(aes(label = paste(..eq.label.., ..rr.label.., sep = "~~~")),
               formula = y ~ x, parse = TRUE) +
  geom_segment(aes(xend = Elevation, yend = predict(lm(Rainfall ~ Elevation, data = RainScotland))),
               linetype = "dashed", color = "red", size = 0.5) +
  labs(title = "Scatterplot of Rainfall against Elevation",
       x = "Elevation (m)",
       y = "Rainfall (mm)") +
  theme_minimal()

#Show how the confidence interval is calculated

# Fit linear model
model <- lm(Rainfall ~ Elevation, data = RainScotland)

# Predict with confidence interval using ggplot
pred <- predict(model, newdata = data.frame(Elevation = RainScotland$Elevation), interval = "confidence")

# Manually calculate CI for the first observation
# Get the predicted value for the first observation
predicted_value <- pred[1,"fit"]

# Get the standard error of the prediction
se <- sqrt(sum(residuals(model)^2) / model$df.residual) * sqrt(1 / 20 + (RainScotland$Elevation[1] - mean(RainScotland$Elevation))^2 / sum((RainScotland$Elevation - mean(RainScotland$Elevation))^2))

# Get the critical value from the t-distribution
t_value <- qt(0.975, df = model$df.residual)


# Calculate the lower and upper bounds of the CI manually
lwr <- predicted_value - t_value * se
upr <- predicted_value + t_value * se

# Print both CIs
print(c(ggplot_lwr = ggplot_ci["lwr"], ggplot_upr = ggplot_ci["upr"]))
print(c(manual_lwr = lwr, manual_upr = upr))


- **Formula**: 
  ```markdown
\sqrt{\frac{\sum (\text{residuals(model)})^2}{\text{model\$df.residual}}}
```
- **Explanation**: This part calculates the residual standard error (RSE) of the model. It measures the average distance that the observed values fall from the regression line. The residuals are the differences between the observed and predicted values. The sum of squared residuals is divided by the degrees of freedom (df.residual), and then the square root is taken to get the RSE.

2. **Multiplicative Factor**:
  - **Formula**: 
  ```markdown
\sqrt{\frac{1}{20} + \frac{(\text{RainScotland\$Elevation[1]} - \text{mean(RainScotland\$Elevation)})^2}{\sum (\text{RainScotland\$Elevation} - \text{mean(RainScotland\$Elevation)})^2}}
```
- **Explanation**: This part adjusts the RSE to account for the specific observation's position relative to the mean of the predictor variable (Elevation). It consists of two components:
     - **\(\frac{1}{20}\)**: This term accounts for the sample size (20 observations in this case). It represents the variance of the mean estimate.
     - **\(\frac{(\text{RainScotland\$Elevation[1]} - \text{mean(RainScotland\$Elevation)})^2}{\sum (\text{RainScotland\$Elevation} - \text{mean(RainScotland\$Elevation)})^2}\)**: This term adjusts for the specific observation's deviation from the mean of the Elevation variable. It represents the leverage of the first observation.

3. **Combining Both Parts**:
  - The total SE for the first observation is obtained by multiplying the RSE by the square root of the multiplicative factor. This combination adjusts the RSE to reflect the uncertainty in predicting the specific observation, considering both the overall model fit and the observation's leverage.

---

In summary, the first factor calculates the overall model's standard error, while the second factor adjusts this error to account for the specific observation's characteristics.
