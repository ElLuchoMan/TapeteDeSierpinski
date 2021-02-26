close all
clear all
clc
n = 7;%Cantidad de estados a mostrar
f = cell(1, n); %Arreglo de celdas para guardar las matrices
f{1} = ones(300 * n );%tamaño del panel
figure,imshow(f{1}); %Imprime en pantalla cada uno de los estados generados
%Permite realizar cada estado
for i = 1: n - 1
    f{i+1} = T(f{i});
    figure,imshow(f{i + 1});
end
%Matriz para guardar el estado actual
function A = M(K)
    A = [K 0 0; 0 K 0; 0 0 1];
end  