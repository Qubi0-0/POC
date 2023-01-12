
I=imread('cfa.png');  %wczytujemy obraz surowy
IGT=imread('srgb.png');  %wczytujemy obraz kolorowy
[W,K] = size(I);

R(W,K)=double(zeros);
G(W,K)=double(zeros);
B(W,K)=double(zeros);

%wypelnienie macierzy
for i=1:1:W
    for j=1:1:K
        % czesc R
        if(mod(i,2)==1 && mod(j,2)==1)
            R(i,j)=I(i,j);
        end
        %czesc B
        if(mod(i,2)==0 && mod(j,2)==0)
            B(i,j)=I(i,j);
        end
        %czesc G
        if ((mod(i,2)==1 && mod(j,2)==0)||( mod(i,2)==0 && mod(j,2)==1))
            G(i,j)=I(i,j);
        end
    end
end

%metoda interpolacji biliniowej
Rbil=R; 
Gbil=G;
Bbil=B;
    
%czesc R
for i=2:1:W-1
    for j=2:1:K-1
        if ( mod(i,2)==0 && mod(j,2)==0)
            Rbil(i,j)=R(i-1,j-1)/4+R(i-1,j+1)/4+R(i+1,j-1)/4+R(i+1,j+1)/4;
        elseif ( (mod(i,2)==1 && mod(j,2)==0))
            Rbil(i,j)=R(i,j-1)/2+R(i,j+1)/2;
        end
    end
end

%piksele (czesc R)
for i=2:2:W-1
    for j=3:2:K-1
        Rbil(i, j) = Rbil(i-1, j-1)/4+Rbil(i-1, j+1)/4+Rbil(i+1, j-1)/4+Rbil(i+1, j+1)/4;
    end
end

%piksele (czesc G)
for i=2:1:W-1
    for j=2:1:K-1
        if( (mod(i,2)==0 && mod(j,2)==0) || ( mod(i,2)==1 && mod(j,2)==1))
            Gbil(i,j)=G(i-1,j)/4+G(i,j-1)/4+G(i+1,j)/4+G(i,j+1)/4;
        end
    end
end

%czesc B
for i=3:1:W
    for j=3:1:K
        if( mod(i,2)==1 && mod(j,2)==1)
            Bbil(i,j)=B(i-1,j-1)/4+B(i-1,j+1)/4+B(i+1,j-1)/4+B(i+1,j+1)/4;
        elseif ( (mod(i,2)==0 && mod(j,2)==1))
            Bbil(i,j)=B(i,j-1)/2+B(i,j+1)/2;
        end
    end
end

%piksele (czesc B)
for i=2:1:W-1
    for j=2:1:K-1
        if i==2 && mod(j, 2)==1
            Bbil(i, j) = Bbil(i, j-1)/2+Bbil(i, j+1)/2;
        elseif (mod(j, 2)==0 && mod(i,2)==1)
            Bbil(i, j) = Bbil(i-1, j-1)/4+Bbil(i-1, j+1)/4+Bbil(i+1, j-1)/4+Bbil(i+1, j+1)/4;
        end
    end
end

Tab_Biliniowa(:,:,3)=Rbil;
Tab_Biliniowa(:,:,2)=Gbil;
Tab_Biliniowa(:,:,1)=Bbil;
Tab_Biliniowa=cast(Tab_Biliniowa,'uint8');%rzutowanie na uint8

imwrite(Tab_Biliniowa,'biliniowy.png');

%wyswietlenie wycinkow obrazow
figure();
subplot (1,3,1); imshow(I(80:180,90:190)); xlabel('obraz surowy');
subplot (1,3,3); imshow(IGT(80:180,90:190,:)); xlabel('obraz wzorcowy');
subplot (1,3,2); imshow(Tab_Biliniowa(80:180,90:190,:)); xlabel('metoda biliniowa');

[PSNR] = psnr(Tab_Biliniowa, IGT) %oblicz psnr