function l1119040
    clc; 
    close all;
    
    [tus,tus_fs] = audioread('tel.wav');
    [no,no_fs] = audioread('numara.wav');
    
    
    ses1 = [1,801];
    ses2 = [1200,2000];
    ses3 = [2400,3200];
    ses4 = [4400,5200];
    ses5 = [5600,6400];
    ses6 = [6800,7600];
    ses7 = [8000,8800];
    
    %VERİLEN SES
    sesler = cat(1,ses1,ses2,ses3,ses4,ses5,ses6,ses7);
    
    
    tel1 = [1,801];
    tel2 = [1200,2000];
    tel3 = [2400,3200];
    tel4 = [3600,4400];
    tel5 = [4800,5600];
    tel6 = [6000,6800];
    tel7 = [7200,8000];
    tel8 = [8400,9200];
    tel9 = [9600,10400];
    tel10 = [10800,11600];
    tel11 = [12000,12800];
    
    %KENDİ NUMARAM
    numaralar = cat(1,tel1,tel2,tel3,tel4,tel5,tel6,tel7,tel8,tel9,tel10,tel11);
   

    figure(1)
    subplot(2,2,1)
    plot(tus)
    title("Verilen Ses")

    
    subplot(2,2,2)
    stem(tus)
    title("Verilen Ses")


    subplot(2,2,3)
    plot(no)
    title("Telefon No")
    
    
    subplot(2,2,4)
    stem(no)
    title("Telefon No")

    %VERİLEN SES İÇİN FONKSİYON ÇAĞRIMI
    myFonk(7,tus,sesler,2);

    %KENDİ NUMARAM İÇİN FONKSİYON ÇAĞRIMI
    myFonk(11,no,numaralar,3);
end

function myFonk(n,ses,fs,x)
    max = [];
        for j = 1:n
            frekans = fft(ses(fs(j,1):fs(j,2)));
           
            max(1) = 1;
            max(2) = 1;
            for i = 1:100
               
                if abs(frekans(i)) > abs(frekans(max(1)))
                    max(1) = i;
                end
               
            end
    
            for i = 101:200
                if abs(frekans(i)) > abs(frekans(max(2)))
                    max(2) = i;
                end
             
            end
          
            max(1) = max(1) * 10;
            max(2) = max(2) * 10;

         
            
            if max(1) > 600 && max(1) < 735 && max(2) > 1100 && max(2) < 1260
                disp("1");
                basilanTus = "1";
            elseif max(1) > 600 && max(1) < 735 && max(2) > 1260 && max(2) < 1405
                disp("2");
                basilanTus = "2";
            elseif max(1) > 600 && max(1) < 735 && max(2) > 1405 && max(2) < 1550
                disp("3");
                basilanTus = "3";
            elseif max(1) > 735 && max(1) < 810 && max(2) > 1100 && max(2) < 1260
                disp("4");
                basilanTus = "4";
            elseif max(1) > 735 && max(1) < 810 && max(2) > 1260 && max(2) < 1405
                disp("5");
                basilanTus = "5";
            elseif max(1) > 735 && max(1) < 810 && max(2) > 1405 && max(2) < 1550
                disp("6");
                basilanTus = "6";
            elseif max(1) > 810 && max(1) < 895 && max(2) > 1100 && max(2) < 1260
                disp("7");
                basilanTus = "7";
            elseif max(1) > 810 && max(1) < 895 && max(2) > 1260 && max(2) < 1405
                disp("8");
                basilanTus = "8";
            elseif max(1) > 810 && max(1) < 895 && max(2) > 1405 && max(2) < 1550
                disp("9");
                basilanTus = "9";
            elseif max(1) > 895 && max(1) < 1000 && max(2) > 1100 && max(2) < 1260
                disp("*");
                basilanTus = "*";
            elseif max(1) > 895 && max(1) < 1000 && max(2) > 1260 && max(2) < 1405
                disp("0");
                basilanTus = "0";
            elseif max(1) > 895 && max(1) < 1000 && max(2) > 1405 && max(2) < 1550
                disp("#");
                basilanTus = "#";
            end
            figure(x)     
            subplot(6,2,j)
            plot(abs(frekans))
            title(basilanTus)
            
        end
end


