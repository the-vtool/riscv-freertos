/**
 * @file main.c
 * @author your name (you@domain.com)
 * @brief 
 * @version 0.1
 * @date 2023-01-11
 * 
 * @copyright Copyright (c) 2023
 * 
 */

#include <FreeRTOS.h>
#include <task.h>
#include <queue.h>

#define GPIO_SWs    0x80001400
#define GPIO_LEDs   0x80001404
#define GPIO_INOUT  0x80001408

#define READ_GPIO(dir) (*(volatile unsigned *)dir)
#define WRITE_GPIO(dir, value) { (*(volatile unsigned *)dir) = (value); }

void vApplicationMallocFailedHook( void );
void vApplicationIdleHook( void );
void vApplicationStackOverflowHook( TaskHandle_t pxTask, char *pcTaskName );
void vApplicationTickHook( void );

int main_blinky( void );


int main( void )
{
	int ret = main_blinky();

	return ret;
}


int main_blinky( void )
{
	// vSendString( "Hello FreeRTOS!" );
   int En_Value=0xFFFF;

   WRITE_GPIO(GPIO_INOUT, En_Value);

   // while(1){
   //    /* Print "hello world" message on the serial output (be careful not all the printf formats are supported) */
   //    WRITE_GPIO(GPIO_LEDs, En_Value)
   //    En_Value = ~En_Value;
   //    /* Delay */
   //    for (int i=0;i<10000000;i++){};
   // }
	/* Create the queue. */
	// xQueue = xQueueCreate( mainQUEUE_LENGTH, sizeof( unsigned long ) );

	// if( xQueue != NULL )
	// {
	// 	/* Start the two tasks as described in the comments at the top of this
	// 	file. */
	// 	xTaskCreate( prvQueueReceiveTask, "Rx", configMINIMAL_STACK_SIZE * 2U, NULL,
	// 				mainQUEUE_RECEIVE_TASK_PRIORITY, NULL );
	// 	xTaskCreate( prvQueueSendTask, "Tx", configMINIMAL_STACK_SIZE * 2U, NULL,
	// 				mainQUEUE_SEND_TASK_PRIORITY, NULL );
	// }

	vTaskStartScheduler();

	return 0;
}

void vApplicationMallocFailedHook( void )
{
	/* vApplicationMallocFailedHook() will only be called if
	configUSE_MALLOC_FAILED_HOOK is set to 1 in FreeRTOSConfig.h.  It is a hook
	function that will get called if a call to pvPortMalloc() fails.
	pvPortMalloc() is called internally by the kernel whenever a task, queue,
	timer or semaphore is created.  It is also called by various parts of the
	demo application.  If heap_1.c or heap_2.c are used, then the size of the
	heap available to pvPortMalloc() is defined by configTOTAL_HEAP_SIZE in
	FreeRTOSConfig.h, and the xPortGetFreeHeapSize() API function can be used
	to query the size of free heap space that remains (although it does not
	provide information on how the remaining heap might be fragmented). */
	taskDISABLE_INTERRUPTS();
	for( ;; );
}
/*-----------------------------------------------------------*/

void vApplicationIdleHook( void )
{
	/* vApplicationIdleHook() will only be called if configUSE_IDLE_HOOK is set
	to 1 in FreeRTOSConfig.h.  It will be called on each iteration of the idle
	task.  It is essential that code added to this hook function never attempts
	to block in any way (for example, call xQueueReceive() with a block time
	specified, or call vTaskDelay()).  If the application makes use of the
	vTaskDelete() API function (as this demo application does) then it is also
	important that vApplicationIdleHook() is permitted to return to its calling
	function, because it is the responsibility of the idle task to clean up
	memory allocated by the kernel to any task that has since been deleted. */
}
/*-----------------------------------------------------------*/

void vApplicationStackOverflowHook( TaskHandle_t pxTask, char *pcTaskName )
{
	( void ) pcTaskName;
	( void ) pxTask;

	/* Run time stack overflow checking is performed if
	configCHECK_FOR_STACK_OVERFLOW is defined to 1 or 2.  This hook
	function is called if a stack overflow is detected. */
	taskDISABLE_INTERRUPTS();
	for( ;; );
}
/*-----------------------------------------------------------*/

void vApplicationTickHook( void )
{
}
/*-----------------------------------------------------------*/

void vAssertCalled( void )
{
volatile uint32_t ulSetTo1ToExitFunction = 0;

	taskDISABLE_INTERRUPTS();
	while( ulSetTo1ToExitFunction != 1 )
	{
		__asm volatile( "NOP" );
	}
}
// int main(void)
// {
//    int i;
//    int En_Value=0xFFFF;

//    WRITE_GPIO(GPIO_INOUT, En_Value);

//    while(1){
//       /* Print "hello world" message on the serial output (be careful not all the printf formats are supported) */
//       WRITE_GPIO(GPIO_LEDs, En_Value)
//       En_Value = ~En_Value;
//       /* Delay */
//       for (i=0;i<10000000;i++){};
//    }

// }