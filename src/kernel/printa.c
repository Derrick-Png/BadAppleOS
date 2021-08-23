void main() {
    // Prints white
    char* video_memory = (char *) 0xb8000;
    int maxrows = 80;
    int maxcols = 25;
    int row = 0;
    int col = 0;
    while(row < maxrows)
    {
        *(video_memory + 2 * (row * 80 + col)) =  'A';
        col++;
        if(col == maxcols)
        {
            col = 0;
            row++;
        }
    }
}