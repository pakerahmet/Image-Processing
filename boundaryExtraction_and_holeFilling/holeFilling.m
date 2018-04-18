I=imread('fill.tif');
%imshow(I);

%Structuring element
B=strel('disk',5);
A=I;
compA = imcomplement(A);
%imshow(compA);

%Ýlk deliðin pozisyonunu bulduk
p=find(A==0);
p=p(1);

%A nýn boyutunda boþ bir resim oluþturduk
Label=zeros([size(A,1) size(A,2)]);
N=0;

%Her bir delik için konum belirle ve sýrayla algoritmayý uygula
while(~isempty(p))
    N=N+1;%Label for each component
    p=p(1);
X=false([size(A,1) size(A,2)]);
X(p)=1;

%Algorithm
Y=imdilate(X,B) & compA;
    while(~isequal(X,Y))
        X=Y;
        Y=imdilate(X,B)& compA;
    end

Pos=find(Y==1);

A(Pos)=0;
%Label the components
Label(Pos)=N;

p=find(A==1);

end
imtool(imcomplement(Label));
