void kernel_main()
{

    char* video = (char*)0xB8000;


    video[0]='K';
    video[1]=0x0F;

    video[2]='E';
    video[3]=0x0F;

    video[4]='R';
    video[5]=0x0F;


    while(1)
    {

    }

}