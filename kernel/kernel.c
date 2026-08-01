#define COLOR_BLACK          0
#define COLOR_BLUE           1
#define COLOR_GREEN          2
#define COLOR_CYAN           3
#define COLOR_RED            4
#define COLOR_MAGENTA        5
#define COLOR_BROWN          6
#define COLOR_LIGHT_GRAY     7
#define COLOR_DARK_GRAY      8
#define COLOR_LIGHT_BLUE     9
#define COLOR_LIGHT_GREEN    10
#define COLOR_LIGHT_CYAN     11
#define COLOR_LIGHT_RED      12
#define COLOR_LIGHT_MAGENTA  13
#define COLOR_YELLOW         14
#define COLOR_WHITE          15

void clear_screen()
{
    char *vga_buffer = (char*)0xB8000;
    for (int i = 0; i < 80 * 25 * 2; i += 2) 
    {
        vga_buffer[i] = ' ';
        vga_buffer[i+1] = COLOR_GREEN;
    }
}

void printf(char *message, int line)
{
    char* video = (char*)0xB8000;

    int i = 0;
    i = (line*80*2);
    int j = 0;

    while (message[j] != '\0')
    {
        video[i] = message[j];
        video[i + 1] = 0x0F;
        i += 2; 
        j++;
    }

}

void kernel()
{
    clear_screen();
    printf("KERNEL ACTIVE!", 0);

    while(1) {}

}
