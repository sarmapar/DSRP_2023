## install required packages
#install.packages("ggplot2")
install.packages(c("usethis","credentials"))

## load required packages
library(ggplot2)

## mpg dataset
str(mpg)
?mpg

ggplot(data = mpg, aes(x = hwy, y = cty)) +
  geom_point() +
  labs(x = "highway mpg", 
       y = "city mpg",
       title = "car city vs highway milage")

## histogram
# We can set the number of bars with `bins`
ggplot(data = iris, aes(x = Sepal.Length)) +
  geom_histogram(bins = 35) #deault num of bins is 30

# We can set the size of bars with `binwidth`
ggplot(data = iris, aes(x = Sepal.Length)) +
  geom_histogram(binwidth = 0.25)


## Boxplots
ggplot(data = iris, aes(x = Sepal.Length)) +
  geom_boxplot()

ggplot(data = iris, aes(y = Sepal.Length)) +
  geom_boxplot()

ggplot(data = iris, aes(x = Sepal.Length, y = Species)) +
  geom_boxplot()


## Violin and boxplot
ggplot(data = iris, aes(x = Species, y = Sepal.Length)) +
  geom_violin(color = "violet", fill = "grey95") + 
  geom_boxplot(width = 0.2, fill = NA)

ggplot(data = iris, aes(x = Species, y = Sepal.Length, fill = Species)) +
  geom_violin() + 
  geom_boxplot(width = 0.2, fill = "white")

ggplot(data = iris, aes(x = Species, y = Sepal.Length)) +
  geom_violin(aes(fill = Species)) + 
  geom_boxplot(width = 0.2)

## barplot
ggplot(data = iris, aes(x = Species, y = Sepal.Length, fill = Species)) +
  geom_bar(stat = "summary",
           fun = "mean")

## scatterplots
ggplot(data = iris, aes(x = Species, y = Sepal.Length)) +
  geom_point()

ggplot(data = iris, aes(x = Species, y = Sepal.Length)) +
  geom_jitter(width = 0.2)

ggsave("plots/exampleJitter2.png")

## line plots
ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point() +
  geom_line()

ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point() +
  geom_line(stat = "summary", 
            fun = "mean")

ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point() +
  geom_smooth(se = F) +
  theme_minimal()

## color scales
ggplot(data = iris, aes(x = as.factor(Sepal.Length), y = Sepal.Width)) +
  geom_point(aes(color = Species)) +
  scale_color_manual(values = c("violet","lightpink","red"))


## factors
mpg$year <- as.factor(mpg$year)

iris$Species <- factor(iris$Species, levels = c("versicolor", "setosa", "virginica"))



