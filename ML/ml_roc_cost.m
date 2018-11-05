clear all;
close all;
clc;

%测试样本数据
samples=[
    1,0.9;
    1,0.8;
    0,0.7;
    1,0.6;
    1,0.55;
    1,0.54;
    0,0.53;
    0,0.52;
    1,0.51;
    0,0.505;
    1,0.4;
    0,0.39;
    1,0.38;
    0,0.37;
    0,0.36;
    0,0.35;
    1,0.34;
    0,0.33;
    1,0.30;
    0,0.1];

%首先准备绘制ROC曲线
figure;
%开始计算TPR和FPR
tpr=zeros(20,1);
fpr=zeros(20,1);
%这里的i表示以第i个样本的评分作为分类阈值
for i=1:20
    %正例样本计数
    p_cnt=0;
    %这里的j表示在统计正例个数的时候，遍历到的样本的id
    for j=1:i
        %判断这个遍历到的样本是不是正例
        if(samples(j,1)==1)
            %是？计数器++
            p_cnt=p_cnt+1;
        end
    end
    
    %计算TPR FPR
    tpr(i)=p_cnt/10;    %(10)是表示样本总体中的真正例个数总数为10
    fpr(i)=(i-p_cnt)/10;    %这里的10则是样本总体中的真反例个数总数    
end

%计算完成之后需要做的事情就是……画点，连线
plot(fpr,tpr,'*b-');
xlabel('FPR');
ylabel('TPF');
title('ROC Curve');
text(fpr+0.02,tpr+0.02,num2str(samples(:,2)));
