#include <stdio.h>

union Data{
    
    struct{
        unsigned char n_1;
        unsigned char n_2;
        unsigned char n_3;
        unsigned char n_4;
    }numbers_u;
    struct{
        char n_1;
        char n_2;
        char n_3;
        char n_4;
    }numbers_c;
    int nums;
};
void test_1()
{
    union Data d;
    d.nums=0x0A2;
    printf("numbers_u n_1:0x%x,n_2:0x%x,n_3:0x%x,n_4:0x%x\n",  \
        d.numbers_u.n_1,d.numbers_u.n_2,d.numbers_u.n_3,d.numbers_u.n_4);
    printf("numbers_c n_1:0x%x,n_2:0x%x,n_3:0x%x,n_4:0x%x\n",  \
        d.numbers_c.n_1,d.numbers_c.n_2,d.numbers_c.n_3,d.numbers_c.n_4);
}
void test_2()
{
    unsigned char uchar=0xFF;// uchar第8位为1 无符号
    signed char schar=0xFF;  // schar第8位为1 有符号
    int a=(int)uchar;        // 转换后a的高位字节被0x00填充
    int b=(int)schar;        // 转换后b的高位字节被0xff填充
    printf("a:0x%x,b:0x%x\n",a,b);
}
int main()
{
    test_1();
    test_2();
    return 0;
}