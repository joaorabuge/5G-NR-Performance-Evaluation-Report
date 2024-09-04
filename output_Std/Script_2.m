%function [ output_args ] = desenha_throughput_vs_time( file )
%UNTITLED1 Summary of this function goes here
%   Detailed explanation goes here
clear;
%file
figure;
%teste = [0.2 111; 0 11; 1 13; 1.1 22; 1.2 44; 2 33; 2.1 34; 3 44];
load('FACH_avg_ue_throughput.txt');

tam_vector=length(FACH_avg_ue_throughput(:,1));
num_seg=round(FACH_avg_ue_throughput(tam_vector,1))+1;

for i = 1:num_seg
    aux=1;
    for j = 1:tam_vector
        if(round(FACH_avg_ue_throughput(j,1))==i-1)
 amostras(i,aux)=FACH_avg_ue_throughput(j,2)/1000*1.0;
        aux=aux+1;
        end;
    end;
end;

for z = 1:num_seg
    sum_bit_rates = 0;
    aux2=0;
    for s = 1:length(amostras(z,:))
        if(amostras(z,s)>0)
           sum_bit_rates = amostras(z,s) + sum_bit_rates;
           aux2 = aux2+1;
        end;
    end;
    avg_bit_rate(z) = sum_bit_rates/aux2;
end;

load('FACH_avg_ue_throughput.txt');

tam_vector=length(FACH_avg_ue_throughput2(:,1));
num_seg=round(FACH_avg_ue_throughput2(tam_vector,1))+1;

for i = 1:num_seg
    aux=1;
    for j = 1:tam_vector
        if(round(FACH_avg_ue_throughput2(j,1))==i-1)
 amostras(i,aux)=FACH_avg_ue_throughput2(j,2)/1000*0.839;
        aux=aux+1;
        end;
    end;
end;

for z = 1:num_seg
    sum_bit_rates = 0;
    aux2=0;
    for s = 1:length(amostras(z,:))
        if(amostras(z,s)>0)
           sum_bit_rates = amostras(z,s) + sum_bit_rates;
           aux2 = aux2+1;
        end;
    end;
    avg_bit_rate1(z) = sum_bit_rates/aux2;
end;

plot(0:num_seg-1,avg_bit_rate(:),"b",0:num_seg-1,avg_bit_rate1(:),"r");
legend('Cen1','Cen2');

xlabel('Time [s]');
ylabel('Average Throughput [Mbps]');
grid;