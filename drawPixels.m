function drawPixels(state)

% Draws the collected pixels of a state
%
% Input
% state: state of the pixels to draw (either 'skin' or 'back')

if ~strcmp(state, 'skin') && ~strcmp(state, 'back')
    error('Invalid input')
end

P = getLinPixels(state)';

scatter3(P(:, 1), P(:, 2), P(:, 3), '+');
xlabel('red'); ylabel('green'); zlabel('blue')

end