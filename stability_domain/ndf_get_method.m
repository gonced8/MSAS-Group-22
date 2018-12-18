function [par] = ndf_get_method(method)
% Function that returns the matrices to apply the NDF method
% Input: string of the name of the method
% Output: matrices that caracterize the method

    switch method
        case '1'
            par.n = '1';
            par.a = [-1, 1];
            par.b = [0, 1];
        case '2'
            par.n = '2';
            par.a = [1/3, -4/3, 1];
            par.b = [0, 0, 2/3];
        case '3'
            par.n = '3';
            par.a = [-2/11, 9/11 -18/11 1];
            par.b = [0, 0, 0, 6/11];
        case '4'
            par.n = '4';
            par.a = [3/25, -16/25, 36/25, -48/25 1];
            par.b = [0, 0, 0, 0, 12/25];
        case '5'
            par.n = '5';
            par.a = [-12/137, 75/137, -200/137, 300/137, -300/137, 1];
            par.b = [0, 0, 0, 0, 0, 60/137];
        otherwise
            fprintf('NDF of order %d not defined. Return.\n', order);
            par = [];
    end
end