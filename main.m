% The following program creates an animated visualisation of a dynamical system
% and checks if the system is divergent or convergent to 1.

% Initialise length of hypotenuse (length) and angle of line
l = 3;
theta = pi/6;

% Print description of program for user
fprintf('The following program creates an animated visualisation of the Collatz map. \nStart at a number n (up to t), if n is even the next number is n/2. \nOtherwise, if n is odd the next number is an+b. \nIterating this process, which values of a and b cause the map to converge to 1?\n\n')

% Request user input for a,b,t parameters. Note: yields interesting values when a,b=(3,1),(4,2),(6,2)
a = input('Enter a: ');
b = input('Enter b: ');
t = input('Enter t: ');

% Initialise i as 2 (1 is a trivial case)
i = 2;

% Initialise divergentCheck to false or 0
divergentCheck = 0;
hold on;

% Loop from i to t such that divergentCheck is false
while i<=t && divergentCheck~=1
    % Initialise Path, x, y arrays and counter c
    Path = [i];
    c = 1;
    x = [0];
    y = [10];
    
    % Initialise animated line
    h = animatedline(x(c),y(c));
    while Path(end)~=1
        % y always increments by the same amount: l*sin(theta)
        y = [y;y(c)+l*sin(theta)];
        
        % If last element of Path is even x increases by l*cos(theta)
        if mod(Path(end),2)==0
            x = [x;x(c)+l*cos(theta)];
            % Append the last element of Path divided by 2 to Path
            Path = [Path;Path(end)/2];
        else
            % Otherwise x decreases by l*cos(theta)
            x = [x;x(c)-l*cos(theta)];
            % Append a*(last element)+b to Path
            Path = [Path;a*Path(end)+b];
        end
        % Increment c
        c=c+1;
        % Add x,y values (at c) to animated line
        addpoints(h,x(c),y(c));
        % Draw animated line
        drawnow
        
        % Ensure that the path isn't divergent by calling 'checkIfDivergent' function
        if checkIfDivergent(Path)==1
            divergentCheck = 1;
            fprintf('After this point the path is divergent (will continue indefinitely).\n')
            break;
        end
        hold off;
    end
    % Increment i
    i=i+1;
end

% Request user input for whether image file and/or title is required
isImage = input('\nIs an image with axis labelling required in pdf format? (please enter 1 - yes or 0 - no): ');
isTitle = input('Should a general title be created? (please enter 1 - yes or 0 - no): ');

% Axis labelling if required
if isImage==1
    if isTitle==1
        title('Plot of Dynamical System: $C(n)=an+b$ if $n\equiv 1\pmod{2}$, otherwise $n/2$','interpreter','latex');
    end
    xlabel('$x$','interpreter','latex');
    ylabel('$y$','interpreter','latex');
    % Save plot as pdf file
    saveas(gcf,'Figure_1.pdf')        
end



