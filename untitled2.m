%foo = ch1vol+ch2vol;
%foo = foo + ch3vol;
foo = 
%%
figure
subplot(2,2,1)
imagesc(foo(:,:,1))
subplot(2,2,2)
imagesc(foo(:,:,5))
subplot(2,2,3)
imagesc(foo(:,:,10))
subplot(2,2,4)
imagesc(foo(:,:,38))

%%  BW
I = graythresh(foo(:,:,19));
for i = 1:size(foo,3)
    fooBW(:,:,i) = im2bw(foo(:,:,i),I);
    fooBW(:,:,i) = imerode(fooBW(:,:,i),strel('disk',60));
    %fooBW(:,:,i) = imdilate(fooBW(:,:,i),strel('disk',20));
end
%%

BW1 = edge(fooBW(:,:,10),'Canny');
BW2 = edge(fooBW(:,:,10),'Prewitt');
BW3 = edge(fooBW(:,:,10),'Roberts');
BW4 = edge(fooBW(:,:,10),'Sobel');
%BW5 = edge(fooBW(:,:,10),'Zerocross');
%BW6 = edge(fooBW(:,:,10),'log');
figure,
subplot(2,2,1)
imshowpair(BW1,foo(:,:,10),'falsecolor')
subplot(2,2,2)
imshowpair(BW1,foo(:,:,10),'falsecolor')
subplot(2,2,3)
imshowpair(BW2,foo(:,:,10),'falsecolor')
subplot(2,2,4)
imshowpair(BW4,foo(:,:,10),'falsecolor')
%subplot(2,3,6)
%imshowpair(BW5,foo(:,:,10),'falsecolor')
%subplot(2,3,2)
%imshowpair(BW6,foo(:,:,10),'falsecolor')

%%
figure
subplot(1,2,1)
imshowpair(foo(:,:,10),(imdilate(BW1,(strel('disk',10)))),'falsecolor')
subplot(1,2,2)
imshowpair(foo(:,:,10),(imdilate(BW1,(strel('disk',20)))),'falsecolor')


