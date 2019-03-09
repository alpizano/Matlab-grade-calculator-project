% Carlos Gonzalez
% ENGR120
% 3/8/2019

% clear workspace variables and console window
clc;
clear;

% This student calculator utilizes all the concepts on the grading rubrik.
% ... From comments, example outputs, functions, loops, if-else
% conditionals, input from user, and output to screen, input checking and
% matlab plots.

% this while loop will continually loop, allowing user to input grades and
% have the final grade calculated per weight listed in syllabus.
% Furthermore, the grades will be plotted per assignment, and average
% plotted on the same plot.

% If the user enters a null name, and error will be thrown and loop back to
% ask for name. The loop will continue, allowing for user to input multiple
% grades per student to calculate multiple final grades UNTIL the user
% inputs QUIT!
op = "quit"

while 1
prompt = 'Hi, what''s your name? OR enter QUIT to exit loop!';
test_name = input(prompt, 's');

% error handling to check if the user input a name or an empty string!
if(test_name == "")
    % pops up warning dialog box indicting empty string/name!
    warndlg('Cmon, we know you have a name!!!','ERROR');
    continue;
% if user types in QUIT, exit the loop!!!
elseif(strcmp(test_name,op) == 1)
    break;
else
    msgbox(sprintf('Hi %s!',test_name));
    fprintf('Hi %s', test_name)
    
% Prompts user for input and stores variables into answer cell array
prompt = {'Enter your homeworks grades (seperated by spaces):','Enter your quiz grades (seperated by spaces):','Enter your exam grades (seperated by spaces):','Enter final project grade:'};
dlgtitle = 'ENGR120 Grade Calculator';
dims = [1 70]; % the size of input text field
definput = {'55 55 55','60 60 60 60 60 75 75 75 75 75 75','75 75 75 99 99 99','100'}; % sample default inputs
answer = inputdlg(prompt,dlgtitle,dims,definput);

% shows what the cell array looks like after user has input responses into corresponding text fields (i.e.
% quiz, exam, final project, and homework grades
answer

% intializing variables
hw_tot = 0;
hw_num = 0;
quiz_tot = 0;
quiz_num = 0;
exam_tot = 0;
exam_num = 0;

% Iterate thru cell array and extract into variables/vector to be looped-thru and
% arithmetic performed upon vector
for i = 1:length(answer)
    if(i == 1)
        hw_vect = str2num(answer{i});
        hw_num = length(hw_vect);
            % iterate thru quiz vector
            for k = 1:length(hw_vect)
            hw_tot = hw_tot + hw_vect(k);
            end
    elseif(i == 2)
        quiz_vect = str2num(answer{i});
        quiz_num = length(quiz_vect);
            % iterate thru quiz vector
            for k = 1:length(quiz_vect)
            quiz_tot = quiz_tot + quiz_vect(k);
            end
    elseif(i == 3)
        exam_vect = str2num(answer{i}); %converts string to int
        exam_num = length(exam_vect);
            % iterate thru exam vector
            for k = 1:length(exam_vect)
            exam_tot = exam_tot + exam_vect(k);
            end
    else
        final_proj = str2num(answer{i}); %converts string to int
    end
end

% Checking and testing variable outputs
%name
%quiz_vect
%exam_vect
%final_proj
%quiz_tot
%quiz_num * 100
%exam_tot
%exam_num * 100

% real weights to compute final grade per course syllabus
hw_weight = 0.3;
proj_weight = 0.1;
quiz_weight= 0.1;
exam_weight = 0.5;

quiz_avg = (quiz_tot/(100*quiz_num))*100;
hw_avg = (hw_tot/(100*hw_num))*100;
exam_avg = (exam_tot/(100*exam_num))*100;

% compute total points for each seperate assignment (i.e. hw, quizzes,
% projects, exams...)
hw_final = (hw_tot/(100*hw_num))*hw_weight;
proj_final = (final_proj/100)*proj_weight;
quiz_final = (quiz_tot/(100*quiz_num))*quiz_weight;
exam_final = (exam_tot/(100*exam_num))*exam_weight;

% compute total weighted final grade in decimal
tot_weight_grade = hw_final +proj_final + quiz_final + exam_final;

% conver total weighted final grade to percent
perc_tot_weight_grade = tot_weight_grade * 100;

%grade = ( (hw_tot/(100*hw_num))* (quiz_tot/(100*quiz_num))* (exam_tot/(100*exam_num)) * (final_proj/100) ) *100

calcGrade(perc_tot_weight_grade,test_name)

% Plotting homework grades & average on same plot
hw_amt = 1:length(hw_vect);
figure;
plot(hw_amt, hw_vect, 'gd')
title('HW grades plot');
xlabel('# of HW''s')
ylabel('% Score')
ylim([0 100])
grid on
hold on
%plot the average quiz score
plot(hw_amt, hw_avg*ones(size(hw_amt)))

% Plotting quizes grades & average on same plot
quizes_amt = 1:length(quiz_vect);
figure;
plot(quizes_amt, quiz_vect, 'gd')
title('Quiz grades plot');
xlabel('# of Quizes')
ylabel('% Score')
ylim([0 100])
grid on
hold on
%plot the average quiz score
plot(quizes_amt, quiz_avg*ones(size(quizes_amt)))

% Plotting exam grades & average on same plot
exam_amt = 1:length(exam_vect);
figure;
plot(exam_amt, exam_vect, 'gd')
title('Exam grades plot');
xlabel('# of Exam''s')
ylabel('% Score')
ylim([0 100])
grid on
hold on
%plot the average quiz score
plot (exam_amt, exam_avg*ones(size(exam_amt)))

end
end

% Local function to calculate final grade in class
function a = calcGrade(grade, name)
    if (grade >= 90)
    a = msgbox(sprintf('You were a top performer in this course %s with your grade of %.0f%%!',name,grade),'You got an A');
    elseif ((89 > grade) && (grade > 80))
    a = msgbox(sprintf('A bit behind the top students in the class %s with your grade of %.0f%%, but hey, a B is nothing to frown about!',name,grade),'You got a B');
    elseif ((79 > grade) && (grade > 70))
    a = msgbox(sprintf('You suck %s! You got an %.0f%%, but hey, we weren''t expecting much from you',name,grade),'You got a C');
    elseif ((69 > grade) && (grade > 60))
    a = msgbox(sprintf('Were you even paying attention in class %s? With your score of %.0f%%, we dont think so!',name,grade),'You got a D!');
    else
    a = msgbox(sprintf('Did you even show up to the lectures %s or were you sleeping? A grade of %.0f%% earns you the right to repeat the course! Have a fun summer!!!',name,grade),'You got an F');
    end
end