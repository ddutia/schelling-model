clc; clear all; close all;

%Defining constants
width = 50; 
height = 50; 
types = 2; %Two kinds of agents x and o
total_cells = width*height; %Total 2500 cells in the grid
n_agents = 1000; %Population
empty_cells = 1500;
threshold = 3; %Happiness threshold 3 neighbours
iterations = 100; 
%To save intermediate grid occupancies
intermediate1 = round(0.25*iterations);
intermediate2 = round(0.375*iterations);
intermediate3 = round(0.5*iterations);
intermediate4 = round(0.75*iterations);
name = 1; %For saving file names

%Filling the grids with agents
agents = randi([0 1],width, height);
agents(agents == 0) = -1;
%Randomly assigning 
empty_index = randi([1 total_cells], 1, empty_cells);
agents(empty_index) = 0;

matrix = zeros(width,height,iterations);
matrix(:,:,1) = agents(:,:);

for i=2:1:iterations
    n_changes = 0;
    for j = 1:1:total_cells
        %Starting with top-left corner and moving row-wise
        [y,x] = ind2sub([width, height],j);
        
        if agents(x,y) == 0 %If empty cell move ahead
            continue;
        end
        if not_happy(threshold, width, height,agents,x,y) ~= 0
            agents = relocate(agents,x,y);
            n_changes = n_changes+1;
        end
    end
    
    %Visualizing the simulation
    spy(agents(:,:) == -1,'k');
    hold on
    spy(agents(:,:) == 1, 'g');
    hold off
    pause(0.01);
    
    %Saving the intermediate model
    if(i==2)
        savefig('Figures\Initial.fig');        
    end
    if(i==intermediate1 ||  i==intermediate2 || i==intermediate3 ||i==intermediate4)
        savefig(strcat('Figures\Intermediate',num2str(name),'.fig'));
        name = name+1;
    end
    
    matrix(:,:,i) = agents(:,:);
    if n_changes == 0 %If all agents are happy stop the iterations
        fprintf('Finished in %d iterations \n',i);
        break;
    end
end

matrix = matrix(:,:,1:i);
if n_changes == 0
    %To save the final model
    savefig('Figures\Final.fig');
else
    disp('More iterations required');
end

%f=openfig('Figures\Final.fig');
%saveas(f,'Figures\Final.jpg');
    
    
    
