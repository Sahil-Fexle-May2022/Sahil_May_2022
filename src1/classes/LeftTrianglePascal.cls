public with sharing class LeftTrianglePascal {
    public LeftTrianglePascal() {
        integer k=6;
        for(integer i=1;i<=9;i++){
            if(i<=5){
                k--;
            }
            else{
                k++;
            }
            string s=' ';
            for(integer j=1;j<=5;j++){
                if(j>=k){
                   s= s+'*';
                }
                else{
                    s= s+'_';
                }
            }
            system.debug(s);
        }               
    }
}

