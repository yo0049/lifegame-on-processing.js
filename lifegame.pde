int s_hight = 400;
int s_width = 400;
int f_hight = 20;
int f_width = 20;
boolean[][] f = new boolean[f_hight][f_width];
boolean[][] tmpf = new boolean[f_hight][f_width];

void setup()
{
    size(s_hight,s_width);
    background(0);
    fill(255);
    //  Loop();
    smooth();
    //noLoop();
    frameRate(1);
    for (int i=0;i<f_hight;i++){
        for (int j=0;j<f_width;j++){
            if((int)random(10)==1){
                f[i][j]=true;
            }else{
                f[i][j]=false;
            }
        }
    };

}

void draw(){ 
    background(0);
    stroke(255);
    for(int i=0 ;i<f_hight;i++){
        for(int j=0 ;j<f_width;j++){
            if(f[i][j]){
                rect(map(i,0,f_hight,0,width)+2,map(j,0,f_width,0,width)+2,18,18);
            }
        }
    }
    arrayCopy(f,tmpf);
    for(int i=0 ;i<f_hight;i++){
        for(int j=0 ;j<f_width;j++){
            // println(check_round(1,1));
            if((f[i][j]==false) && ( check_round(i,j)==3)){tmpf[i][j]=true;}
            if(f[i][j] && ((check_round(i,j)<=1) ||( check_round(i,j)>=4))){ tmpf[i][j]=false; }
            }
        }
    arrayCopy(tmpf,f);
}

int check_round(int x,int y){
    int xx=0;
    int yy=0;
    int count=0;
    for(int dx=-1;dx<=1;dx++){
        for(int dy=-1;dy<=1;dy++){
            xx=0;
            yy=0;
            if(!(dx==0 && dy==0)){
                if(x+dx <0){xx=f_hight-1;}
                else if(x+dx >=f_hight){xx=0;}
                else {xx=x+dx;}

                if(y+dy <0){yy=f_width-1;}
                else if(y+dy >=f_width){yy=0;}
                else{yy=y+dy;}
                if(f[xx][yy]){count++;}
            }
        }
    }
    return count;
}

