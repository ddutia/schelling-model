function [indexes] = get_index(width, height, agents,x, y)
    indexes = [];
    %Finding indices of 8 neighbours
    if x>1
        indexes = [ indexes sub2ind([width, height],x-1, y)];
        if y>1
            indexes =[ indexes sub2ind([width, height],x-1, y-1)];
        end
        if y<height
            indexes =[ indexes sub2ind([width, height],x-1, y+1)];
        end
    end

    if x<width
        indexes =[ indexes sub2ind([width, height],x+1, y)];
        if y>1
            indexes =[ indexes sub2ind([width, height],x+1, y-1)];
        end
        if y<height
            indexes =[ indexes sub2ind([width, height],x+1, y+1)];
        end
    end

    if y<height
        indexes =[ indexes sub2ind([width, height],x, y+1)];
    end

    if y<height && y>1
        indexes =[ indexes sub2ind([width, height],x, y-1)];
    end
end