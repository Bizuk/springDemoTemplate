 /*The Curriculum Planning Committee is attempting to fill in gaps in the current course offerings. 
You need to provide them with a query which lists each department and the number of courses offered by that department. 
The two columns should have headers “Department Name” and “# Courses”, and the output should be sorted by “# Courses” in each department (ascending).*/

select department.name as "Department Name", count(course.name) as "# Courses" from department, course where department.id = course.deptId
group by department.id
order by department.name;


/*The recruiting department needs to know which courses are most popular with the students. 
Please provide them with a query which lists the name of each course and the number of students in that course. 
The two columns should have headers “Course Name” and “# Students”, and the output should be sorted first by # Students descending and then by course name ascending. */

select name 'Course name', CourseID '#of Students'
from course 
join studentcourse
group by CourseID desc;

select
lastname, faculty.id, faculty.deptId, course.name as 'Course name', course.id
from faculty
join course
group by course.name ASC;


/*Quite a few students have been complaining that the professors are absent from some of their courses.
Write a query to list the names of all courses where the # of faculty assigned to those courses is zero. 
The output should be in alphabetical order by course name.
Using the above, write a query to list the course names and the # of students in those courses for all courses where there are no assigned faculty. 
The output should be ordered first by # of students descending and then by course name ascending*/

Select 
Lastname, faculty.ID, faculty.DeptID, course.name as 'Course name', course.ID
from faculty 
join course
group by course.name ASC;

/*Using the above, write a query to list the course names and the # of students in those courses for all courses where there are no assigned faculty. 
The output should be ordered first by # of students descending and then by course name ascending. */
Loop dont stop:

Select studentCourse.StudentId , studentCourse.CourseID, facultyCourse.Facultyid, course.name as 'Course Name'
from studentCourse inner join facultyCourse Inner join course
order by studentCourse.Studentid desc, course.name ASC;

/* The enrollment team is gathering analytics about student enrollment throughout the years. 
Write a query that lists the total # of students that were enrolled in the beginning of classes during each school year (from January 25th 2014 up to August 25th 2017). 
The first column should have the header “Students”. Provide a second “Year” column showing the enrollment year. [HINT: combining multiple select statements into one query is one way of doing this].*/

Select studentcourse.studentID 'Students', studentcourse.StartDate as 'Year'
from studentcourse 
order by studentcourse.StartDate asc, studentcourse.StudentId;

/*The enrollemnt team is gathering analytics about student enrollment and they now want to know about August admissions specifically. 
Write a query that lists the Start Date and # of Students who enrolled in classes in August of each year. 
Output should be ordered by start date ascending.  */

Select count(distinct studentid) as 'Students enrolled in August'
from studentcourse
where month(StartDate) = 8;

/*Students are required to take 4 courses, and at least two of these courses must be from the department of their major.
 Write a query to list students’ First Name, Last Name, and Number of Courses they are taking in their major department.
 The output should be sorted first in increasing order of the number of courses, then by student last name. */
 
Select student.Firstname, student.Lastname, count(course.name)
 from student, course
 order by student.MajorId;
 
/*Faculty are awarded bonuses based on the progress made by students in their courses.

1. Write a query to list each Course Name and the Average Progress of students in that course. The output should be sorted descending by average progress.
.*/

Select course.name as course, AVG(studentcourse.progress) as Progress
from course, studentcourse;

/*Write a query that selects the maximum value of the average progress reported by the previous query.*/

Select course.name as Course, Max(studentcourse.Progress)
from course,studentcourse;

/* Write a query that outputs the faculty First Name, Last Name, and average of the progress (“Avg. Progress”) made in each of their courses. */

select faculty.FirstName, faculty.Lastname, avg(studentcourse.Progress)
from faculty, studentcourse;

/*Write a query just like #3, but where only those faculty where average progress in their courses is 90% or more of the maximum observed in*/

select faculty.FirstName, faculty.Lastname, avg(studentcourse.Progress > 90) as Progess
from faculty, studentcourse;

/*Students are awarded two grades based on the minimum and maximum progress they are making in the courses. The grading scale is as follows:
Progress < 40: F
Progress < 50: D
Progress < 60: C
Progress < 70: B
Progress >= 70: A
Write a query which displays each student’s First Name, Last Name, Min Grade based on minimum progress, and Max Grade based on maximum progress.   */

Select student.Firstname, student.Lastname, Min(studentcourse.Progress)as minimum, Max(studentcourse.Progress) as max
from student, studentcourse;


* question C.1 */
SELECT c.name, fc.facultyid AS '# of Facuty'
FROM course c
left join facultyCourse fc ON c.id = fc.courseid
WHERE fc.facultyid IS NULL;
/* question C.2 */
SELECT c.name,
COUNT(sc.studentid) AS '# students'
FROM course c
left join facultyCourse fc ON c.id = fc.courseid
INNER JOIN studentCourse sc ON c.id = sc.courseid
WHERE fc.facultyid IS NULL
GROUP BY c.name;






