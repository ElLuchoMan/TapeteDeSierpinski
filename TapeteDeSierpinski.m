close all
clear all
clc
n = 7;%Cantidad de estados a mostrar
f = cell(1, n); %Arreglo de celdas para guardar las matrices
f{1} = ones(300 * n );%tamaño del panel
figure,imshow(f{1}); %Imprime en pantalla cada uno de los estados generados
%Permite realizar cada estado
for i = 1: n - 1
    f{i+1} = T(f{i});%Realiza la transformación de cada estado
    figure,imshow(f{i + 1});%Imprime en pantalla cada uno de los estados
end
%Matriz para guardar el estado actual
function A = M(K)
    A = [K 0 0; 0 K 0; 0 0 1];
end  
%Transformación
function mf = T(X)
    b = size(X);% Se toma el tamaño del panel 
    C = M(1/6);%Se define a cuántas partes del total, será equivalente la casilla
    [C,ref] = imwarp(X,affine2d(C));%Se hace uso de affine 2d para la transformación
    %Se indica cuáles de las casillas se van a eliminar y cuáles
    %permanecerán iguales
    mf = [C C C C C C; C C zeros(b(1)/6) C C C; C zeros(b(1)/6) C C C C; C C zeros(b(1)/6) C C C; C C C C C C; C C C C C C];
end