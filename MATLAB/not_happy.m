function value = not_happy(threshold,width, height,agents,x, y)
    %To determine whether an agent is satisfied or not
    %Satisfied if it has 3 similar agents nearby
    similar = 0;
    different = 0;
    neighbours_index = get_index(width, height,agents,x,y);
    for i=1:1:length(neighbours_index)
        %Calculating similar and diffirent neighbours
        if agents(x,y) == agents(neighbours_index(i));
            similar = similar+1;
        else
            different = different+1;
        end
    end
    %Depends on number of similar agents nearby
    value = similar < threshold;
end
    