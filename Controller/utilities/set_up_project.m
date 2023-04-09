

function set_up_project()
%set_up_project  Configure the environment for this project
%
%   Set up the environment for the current project. This function is set to
%   Run at Startup.

%   Copyright 2011-2012 The MathWorks, Inc.
%setup_build_env;

% Use Simulink Project API to get the current project:
p = slproject.getCurrentProject;

projectRoot = p.RootFolder;
% Set the location of slprj to be the "work" folder of the current project:
myCacheFolder = fullfile(projectRoot, 'model_codegen');
myCodeGenFolder = fullfile(projectRoot, 'model_codegen');
if ~exist(myCacheFolder, 'dir')
    mkdir(myCacheFolder)
end
if ~exist(myCodeGenFolder, 'dir')
    mkdir(myCodeGenFolder)
end
Simulink.fileGenControl('set', 'CacheFolder', myCacheFolder, ...
   'CodeGenFolder', myCodeGenFolder);

% Set the path for this project:
folders = project_paths();
for jj=1:numel(folders)
	disp(strcat('adding folder to path', fullfile(projectRoot, folders{jj})));
    addpath( fullfile(projectRoot, folders{jj}));
end


disp('attempting to load project files');

% Ensure that enums are loaded before anything else
fileslist = find_files_recursive(fullfile(projectRoot, 'model/enums'), '*.m', 0);

for k=1:length(fileslist)
  disp(strcat('loading: ', fileslist{k}));
end
  
fileslist = find_files_recursive(fullfile(projectRoot, 'model/config'), '*.mat', 0);

for k=1:length(fileslist)
  disp(strcat('loading: ',fileslist{k}));
  evalin('base', strcat('load(''', fileslist{k}, ''')'));
end

fileslist = find_files_recursive(fullfile(projectRoot, 'model/parameters'), '*.m', 0);

for k=1:length(fileslist)
  disp(strcat('loading: ', fileslist{k}));
  evalin('base', strcat('run(''', fileslist{k}, ''')'));
end
    
  
fileslist = find_files_recursive(fullfile(projectRoot, 'model/config'), '*.m', 0);

for k=1:length(fileslist)
  disp(strcat('loading: ',fileslist{k}));
  evalin('base', strcat('run(''', fileslist{k}, ''')'));
end

  
  
cd(projectRoot);
