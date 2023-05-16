function [Q] = hmmd_quantification(HMMD,n_cells)
    Hue = HMMD(:,:,1);
    Diff = HMMD(:,:,2);
    Sum = HMMD(:,:,3);
    
    HT= [1,  1, 1, 1;
         4,  4, 4, 4;
         16, 8, 4, 0;
         16, 8, 8, 4;
         16, 8, 8, 4];
     
    ST= [32,16,8, 8;
         8, 4, 4, 4;
         4, 4, 4, 0;
         4, 4, 2, 1;
         4, 4, 1, 1];
     BT=zeros(5,4);
   for i=1:4
       BT(1,i)=0;
       sum = 0;
       for j=2:5
           sum = sum + HT(j-1,i)*ST(j-1,i);
           BT(j,i)= sum;
       end
   end
     switch(n_cells)
         case 256
            HueDivisions=HT(:,1);
            SumDivisions=ST(:,1);
            BASE = BT(:,1);
         case 128
            HueDivisions=HT(:,2);
            SumDivisions=ST(:,2);
            BASE = BT(:,2);
         case 64
            HueDivisions=HT(:,3);
            SumDivisions=ST(:,3);
            BASE = BT(:,3);
         case 32
            HueDivisions=HT(:,4);
            SumDivisions=ST(:,4);
            BASE = BT(:,4);
     end
           
    subspace = (Diff<6)*0 + (Diff>=6 & Diff<20)*1 + (Diff>=20 & Diff<60)*2 +(Diff>=60 & Diff<110)*3 + (Diff>=110)*4;
    MM = (Diff<6)*0 + (Diff>=6 & Diff<20)*6 + (Diff>=20 & Diff<60)*20 +(Diff>=60 & Diff<110)*60 + (Diff>=110)*110;
    
    if (n_cells ==32) 
        subspace = subspace - (subspace==2);
    end

    HuePie = ceil(HueDivisions(subspace+1).*double(Hue)/360);
    Pos_sum = ceil(SumDivisions(subspace+1).*(double(Sum)-(MM/2))./(255-MM));
    
    Base = BASE(subspace+1);
    Q= Base + HuePie.*SumDivisions(subspace+1)+Pos_sum;
end

