clear
close all

% ode15s uses NDF of order 1 to 5

n = ['1'; '2'; '3'; '4'; '5'];

figure;
hold on;

for i = 1:length(n)
    par = ndf_get_method(string(n(i)));
    hl = get_stability_boundary(par.a, par.b, []);
    plot(hl);
end

title('Stability boundary for NDF methods of different orders', 'Interpreter', 'latex');
legend(n);
grid on;
xlabel('$Re\{h\lambda\}$', 'Interpreter', 'latex');
ylabel('$Im\{h\lambda\}$', 'Interpreter', 'latex');
set(gca, 'XAxisLocation', 'origin');
set(gca, 'YAxisLocation', 'origin');