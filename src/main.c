#define GPIO_SWs    0x80001400
#define GPIO_LEDs   0x80001404
#define GPIO_INOUT  0x80001408

#define READ_GPIO(dir) (*(volatile unsigned *)dir)
#define WRITE_GPIO(dir, value) { (*(volatile unsigned *)dir) = (value); }

int main(void)
{
   int i;
   int En_Value=0xFFFF;

   WRITE_GPIO(GPIO_INOUT, En_Value);

   while(1){
      /* Print "hello world" message on the serial output (be careful not all the printf formats are supported) */
      WRITE_GPIO(GPIO_LEDs, En_Value)
      En_Value = ~En_Value;
      /* Delay */
      for (i=0;i<10000000;i++){};
   }

}