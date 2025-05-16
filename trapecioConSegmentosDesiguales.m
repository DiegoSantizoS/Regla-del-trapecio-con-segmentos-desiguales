clc; clear all;
% Función dada
f = @(x) 5*x.^3 - 3*x.^2 + 2*x + 1;

% Puntos x desiguales
x_vals = [0, 0.18, 0.30, 0.50, 0.60, 0.75, 1.0];
y_vals = f(x_vals);

% Integral por regla del trapecio con segmentos desiguales
I_aprox = 0;
for i = 1:length(x_vals)-1
    h = x_vals(i+1) - x_vals(i);
    I_aprox = I_aprox + (y_vals(i) + y_vals(i+1)) * h / 2;
end

% Valor exacto simbólico
syms x
f_sym = 5*x^3 - 3*x^2 + 2*x + 1;
I_exacto = double(int(f_sym, 0, 1));

% Error relativo
error_rel = abs((I_exacto - I_aprox) / I_exacto) * 100;

% Mostrar resultados
fprintf('Integral aproximada: %.4f\n', I_aprox);
fprintf('Valor exacto: %.4f\n', I_exacto);
fprintf('Error relativo porcentual: %.2f%%\n', error_rel);
