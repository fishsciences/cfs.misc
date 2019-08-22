# cfs.misc

R package with miscellaneous convenience functions used in projects at Cramer Fish Sciences.

### Prerequisites

Installation requires the R package [`remotes`](https://remotes.r-lib.org).

```
install.packages("remotes")
```

### Installation

cfs.misc is only available through Github.

```
remotes::install_github("fishsciences/cfs.misc")
```

### Basic Usage

* [water_year](#water_year)
* [wy_week](#wy_week)
* [wy_yday](#wy_yday)
* [wy_date](#wy_date)
* [get_water_year_type](#get_water_year_type)
* [vet](#vet)
* [fill_missing](#fill_missing)
* [len](#len)
* [timer](#timer)
* [col2hex](#col2hex)

#### water_year

Gets water year from a date-time object. A water year is define as October 1st to Sept 30th where the water year is the same as the calendar year from January to September.

```
> x = c("2016-12-31", "2017-01-01", "2017-09-30", "2017-10-01")
> water_year(as.Date(x))
[1] 2017 2017 2017 2018
> water_year(as.Date(x)) == format(as.Date(x), "%Y")
[1] FALSE  TRUE  TRUE FALSE
```

#### wy_week

Returns the number of complete seven day periods that have occurred between the date and October 1st, plus one. Based on `lubridate::week`.

```
> wy_week(as.Date(c("2016-10-01", "2017-01-01")))
[1]  1 14
```

#### wy_yday

Gets the day of the water year from a date-time object.

```
> wy_yday(as.Date(c("2016-01-01", "2016-10-01", "2017-01-01")))
[1] 93  1 93
> wy_yday(as.Date(c("2016-03-01", "2017-03-01"))) # 2016 was a leap year
[1] 153 152
```

#### wy_date

Gets the date for the day of the water year.

```
> wy_date(x = seq(1, 361, 60), y = 2011)
[1] "2010-10-01" "2010-11-30" "2011-01-29" "2011-03-30" "2011-05-29" "2011-07-28" "2011-09-26"
```

#### get_water_year_type

Gets the water year classifications from [CDEC](http://cdec.water.ca.gov/cgi-progs/iodir/WSIHIST).

```
> df <- get_water_year_type()
> head(df)
  WaterYear SAC SJR
1      1901       W
2      1902      AN
3      1903      AN
4      1904       W
5      1905      AN
6      1906   W   W
```

#### vet

Quickly "vets" a data frame by previewing rows from the beginning, middle, and end of a data frame.

```
> vet(iris)
    Sepal.Length Sepal.Width Petal.Length Petal.Width    Species
1            5.1         3.5          1.4         0.2     setosa
2            4.9         3.0          1.4         0.2     setosa
3            4.7         3.2          1.3         0.2     setosa
4            4.6         3.1          1.5         0.2     setosa
73           6.3         2.5          4.9         1.5 versicolor
74           6.1         2.8          4.7         1.2 versicolor
75           6.4         2.9          4.3         1.3 versicolor
76           6.6         3.0          4.4         1.4 versicolor
147          6.3         2.5          5.0         1.9  virginica
148          6.5         3.0          5.2         2.0  virginica
149          6.2         3.4          5.4         2.3  virginica
150          5.9         3.0          5.1         1.8  virginica
```

#### fill_missing

Computes weighted means with a triangular weighting function. 

```
> x <- 1:20
> x[seq(4, 16, 6)] <- NA
> x
 [1]  1  2  3 NA  5  6  7  8  9 NA 11 12 13 14 15 NA 17 18 19 20
> fill_missing(x, 3)
 [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20
```

#### len

`len(x)` is shorthand for `length(unique(x))` to count the number of unique elements in a vector.

```
> len(letters)
[1] 26
```

#### timer

A simple timer that plays a sound after the specified amount of time.

```
timer(5, "secs")
```

#### col2hex 

Converts quoted names of colors in R to hex codes.

```
> col2hex("wheat")
[1] "#F5DEB3"
```

