close all;
clear all;

%Conversion of a gray scale image to a binary one
original_image = imread('findAngle10.png');
Binary_image = im2bw(original_image, 0.99);
figure(1);
subplot(1,2,1), imshow(original_image), title('Original image');
subplot(1,2,2), imshow(Binary_image), title('Binary image');

%Calculating the Radon transformation
theta = 0:180;
[R,xp] = radon(Binary_image,theta);

%Display the transformation
figure(2);
iptsetpref('ImshowAxesVisible','on');
subplot(1,2,1), imshow(Binary_image), title('Binary image');
subplot(1,2,2), imshow(R,[],'Xdata',theta,'Ydata',xp,'InitialMagnification','fit'), title('Radon Transformation');
xlabel('\theta (degrees)')
ylabel('x''')
colormap(gca,hot), colorbar

%Radon Transformation with Rectangels
rectangel_image = imread('findRect10.png');

Binary_rectangel = im2bw(rectangel_image, 0.99);
figure(3);
subplot(1,2,1), imshow(rectangel_image), title('Original rectangel');
subplot(1,2,2), imshow(Binary_rectangel), title('Binary image');

%Calculating the Radon transformation
theta = 0:180;
[R,xp] = radon(Binary_rectangel,theta);

%Display the transformation
figure(4);
iptsetpref('ImshowAxesVisible','on');
subplot(1,2,1), imshow(Binary_rectangel), title('Binary image');
subplot(1,2,2), imshow(R,[],'Xdata',theta,'Ydata',xp,'InitialMagnification','fit'), title('Radon Transformation');
xlabel('\theta (degrees)')
ylabel('x''')
colormap(gca,hot), colorbar

%Correlation function
image_text = imread('text.png');
image_a = imread('pattern.png');
image_a_1 = imread('pattern_1.png');

binary_text = im2bw(image_text);
binary_a = im2bw(image_a);
binary_a_1 = im2bw(image_a_1);

figure(5);
imshow(binary_text), title('Binary image with the text');

figure(6);
binary_a_position = binary_a(1:13,1:11);
subplot(1,2,1), imshow(binary_a), title('Pattern image #1');
subplot(1,2,2), imshow(binary_a_position), title('Zoomed Pattern image #1');

figure(7);
binary_a_1_position = binary_a_1(1:11,1:13);
subplot(1,2,1), imshow(binary_a_1), title('Pattern image #2');
subplot(1,2,2), imshow(binary_a_1_position), title('Zoomed Pattern image #2');

%Transformations
A=real(ifft2(fft2(binary_text).*fft2(rot90(binary_a,2),256,256)));
figure(8);
subplot(1,2,1), imshow(A,[]), title('After transformation');
thresh=67;
subplot(1,2,2),imshow(A>thresh), title('Results according to the pattern #1');

B=real(ifft2(fft2(binary_text).*fft2(rot90(binary_a_1,2),256,256)));
figure(9);
subplot(1,2,1), imshow(B,[]), title('After transformation');
thresh=67;
subplot(1,2,2),imshow(B>thresh), title('Results according to the pattern #1');

