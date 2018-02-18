function agents = relocate(agents, x, y)
            empty = find(agents==0);
            
            %Finding closest distance to move
            index_to_move = randi([1 length(empty)],1);
            
            agents(empty(index_to_move)) = agents(x,y);
            agents(x,y) = 0;
        end