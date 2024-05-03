function [harmonicSeries] = exercise(freq, evenOddAll, nHarmonics, precision)
% EXERCISE  Calculates harmonics.
%
% EXERCISE(freq, evenOddAll, nHarmonics)
%          calculates nHarmonics harmonics for a given frequency freq.
%          evenOddAll specifies order of a harmonic series: 
%           "even"    - 2nd order
%           "odd"     - 3rd order
%           "all"     - all harmonics
%
% EXERCISE(_, precision)
%          specifies if output should have 2 decimal points precision.
%          0 for no precision, 1 for two decimal points precision.
%          Default: 0.


    % Ensures the right type of input
    arguments
        freq (1,1) {mustBeNumeric}
        evenOddAll (1, 1) {mustBeText}
        nHarmonics (1, 1) {mustBeInteger}
        precision  (1, 1) {mustBeInteger} = 0
    end

    % Only positive-valued frequencies allowed
    if freq <=0
        x = "Can't calculate harmonics of " + num2str(freq) + " Hz";
        error(x);
    end

    % creates array for output
    harmonicArray = ones(1, nHarmonics) * freq;

    % Necessary for below element-wise multiplication
    nHarmonics = double(nHarmonics);
  

    % Calculates "nHarmonics" harmonics for specified order
    % and throws error if wrong order was specified
    if evenOddAll == "all"
        harmonicArray = harmonicArray .* (1:nHarmonics);
    elseif evenOddAll == "even"
        harmonicArray = harmonicArray .* (2:2:2*nHarmonics);
    elseif evenOddAll == "odd"
        harmonicArray = harmonicArray .* (1:2:2*nHarmonics-1);
    else
        error("Wrong harmonic parameter");
    end

    
    
    % prints outcome of the calculation
    fprintf("%d first %s harmonics of %.2f Hz:\n", ...
        nHarmonics, evenOddAll, freq);

    % Prints with specified precision
    % and throws error if wrong order was specified
    if precision==1
        disp([num2str(harmonicArray, '%.2f Hz   ')]);
        harmonicSeries = round(harmonicArray, 2);
    elseif ~precision
        disp([num2str(harmonicArray, '%.0f Hz   ')]);
        harmonicSeries = round(harmonicArray, 0);
    else
        error("Wrong precision parameter");
    end
end

% commit latest changes - added output
