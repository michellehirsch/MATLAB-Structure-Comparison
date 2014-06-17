function structcompvis(s1,s2)
% STRUCTCOMPVIS     Use visual differencing tool to compare two structures
%
% STRUCTCOMPVIS(s1,s2) opens an HTML differencing report comparing two 
% structures.  
%
% KNOWN ISSUE: If the longest field names of the 2 structures are different
% lengths, you may get very poor results.  I know this seems like a stupid
% restriction, but you'll understand why when you try it and look at my
% code.
%
% Example: Compare values of two graphics objects
% 
%  p = plot(rand(100,2));
%  s = get(p);
%  structcompvis(s(1),s(2))

% Michelle Hirsch  
% mhirsch@mathworks.com
% Copyright 2005-2014 The MathWorks, Inc

% Write temp text files for structs
f1 = [tempdir 's1.m']
f2 = [tempdir 's2.m'];


% Sort structures, to ignore order
s1 = orderfields(s1);
s2 = orderfields(s2);

% Write structures to temp files
diary(f1);     % Create diary file
disp(s1)
diary off

diary(f2);     % Create diary file
disp(s2)
diary off

% Take a best guess at character width of structure display
lengthNames = max([size(char(fieldnames(s1)),2) size(char(fieldnames(s2)),2)]);
% lengthFields  % Too painful to get.
fieldWidth = floor(2*lengthNames);        % Change this if you like

% Use visual differencing report
visdiff(f1,f2,fieldWidth)

% Delete temp files.  
% Wait a little while to make sure visdiff is done.
t = timer;
t.ExecutionMode = 'fixedDelay';
t.StartDelay = 100;
t.TimerFcn = {@deleteTempFiles,f1,f2};
start(t)


function deleteTempFiles(t,~,f1,f2)
% Feel free to keep these.
if exist(f1,'file')
    delete(f1)
end

if exist(f2,'file')
    delete(f2)
end

stop(t)
delete(t)
