 fid=fopen('/home/vipl/llh/food172_finetune/food172_patch/patch_all_list.txt');%图片名
path2='/home/vipl/llh/food172_finetune/food172_patch/food172_patch64/patch_64';%输出图片路径
i=0;
while ~feof(fid)
path='/home/vipl/llh/food172_finetune/ready_chinese_food';%输入图片路径
tline=fgetl(fid);
Img=imread([path tline]);
t=regexp(tline,'.jpg','split');
t1=char(t(1));
t2=regexp(t1,'/','split');
classname=char(t2(2));
if ~isdir([path2 '/' classname])
    mkdir([path2 '/' classname]);
end


%图片分割成mxn块?
m=4;
n=4;
[sample_h,sample_w]=size(Img);%输出的是图片的高 和 宽 640 360
region_h=floor(sample_h/m);%每个图片的高 320
region_w=floor(sample_w/(n*3));%每个图片的宽 60 sample_w=图片的宽*3 3个通道
RGB1=imcrop(Img,[0,0,region_w,region_h]);
RGB2=imcrop(Img,[region_w,0,region_w,region_h]);
RGB3=imcrop(Img,[region_w*2,0,region_w,region_h]);
RGB4=imcrop(Img,[region_w*3,0,region_w,region_h]);

RGB5=imcrop(Img,[0,region_h,region_w,region_h]);
RGB6=imcrop(Img,[region_w,region_h,region_w,region_h]);
RGB7=imcrop(Img,[region_w*2,region_h,region_w,region_h]);
RGB8=imcrop(Img,[region_w*3,region_h,region_w,region_h]);

RGB9=imcrop(Img,[0,region_h*2,region_w,region_h]);
RGB10=imcrop(Img,[region_w,region_h*2,region_w,region_h]);
RGB11=imcrop(Img,[region_w*2,region_h*2,region_w,region_h]);
RGB12=imcrop(Img,[region_w*3,region_h*2,region_w,region_h]);


RGB13=imcrop(Img,[0,region_h*3,region_w,region_h]);
RGB14=imcrop(Img,[region_w*1,region_h*3,region_w,region_h]);
RGB15=imcrop(Img,[region_w*2,region_h*3,region_w,region_h]);
RGB16=imcrop(Img,[region_w*3,region_h*3,region_w,region_h]);



imwrite(RGB1,[path2 t1 '_1.jpg']);
imwrite(RGB2,[path2 t1 '_2.jpg']);
imwrite(RGB3,[path2 t1 '_3.jpg']);
imwrite(RGB4,[path2 t1 '_4.jpg']);
imwrite(RGB5,[path2 t1 '_5.jpg']);
imwrite(RGB6,[path2 t1 '_6.jpg']);
imwrite(RGB7,[path2 t1 '_7.jpg']);
imwrite(RGB8,[path2 t1 '_8.jpg']);

imwrite(RGB9,[path2 t1 '_9.jpg']);
imwrite(RGB10,[path2 t1 '_10.jpg']);
imwrite(RGB11,[path2 t1 '_11.jpg']);
imwrite(RGB12,[path2 t1 '_12.jpg']);
imwrite(RGB13,[path2 t1 '_13.jpg']);
imwrite(RGB14,[path2 t1 '_14.jpg']);
imwrite(RGB15,[path2 t1 '_15.jpg']);
imwrite(RGB16,[path2 t1 '_16.jpg']);
 i=i+1
 end
fclose all
