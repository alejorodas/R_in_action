# Looking at this dataset, several obstacles are immediately evident. 
# First, scores on the three exams aren’t comparable. 
# They have widely different means and standard deviations, so averaging them doesn’t make sense. 
# You must transform the exam scores into comparable units before combining them. 
# Second, you’ll need a method of determining a student’s percentile rank on this score in order to assign a grade. 
# Third, there’s a single field for names, complicating the task of sorting students. 
# You’ll need to break apart their names into first name and last name in order to sort them properly.


# Your challenge is to combine subject test scores into a single 
# performance indicator for each student, grade each student from A to F based on their relative 
# standing (top 20 percent, next 20 percent, etc.), and sort the roster by students’ last name, followed by first name

options(digits=2)

Student <- c("John Davis", "Angela Williams", "Bullwinkle Moose",
             "David Jones", "Janice Markhammer", "Cheryl Cushing",
              "Reuven Ytzrhak", "Greg Knox", "Joel England",
              "Mary Rayburn")

Math <- c(502, 600, 412, 358, 495, 512, 410, 625, 573, 522)
Science <- c(95, 99, 80, 82, 75, 85, 80, 95, 89, 86)
English <- c(25, 22, 18, 15, 20, 28, 15, 30, 27, 18)
roster <- data.frame(Student, Math, Science, English, stringsAsFactors=FALSE)

roster

# Obtain performance scores. In this step you apply a standard deviation
z <- scale(roster[,2:4])
z
# apply(), that allows you to apply an arbitrary function to any dimension 
# of a matrix, array, or data frame. In a matrix or data frame MARGIN=1 indicates 
# rows and MARGIN=2 indicates columns. 
score <- apply(z, 1, mean)
score
roster <- cbind(roster, score)
roster

# Grade students
y <- quantile(score, c(.8,.6,.4,.2))
y

roster$grade[score >= y[1]] <- "A"
roster$grade[score < y[1] & score >= y[2]] <- "B"
roster$grade[score < y[2] & score >= y[3]] <- "C"
roster$grade[score < y[3] & score >= y[4]] <- "D"
roster$grade[score < y[4]] <- "F"

roster

# Extract last and first names

name <- strsplit((roster$Student), " ")
lastname <- sapply(name, "[", 2)
firstname <- sapply(name, "[", 1)
roster <- cbind(firstname,lastname, roster[,-1])

# Sort by last and first names
roster <- roster[order(lastname,firstname),]

roster
