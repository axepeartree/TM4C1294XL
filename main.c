
#define PART_TM4C1294NCPDT
#include <stdint.h>
#include <stdbool.h>
#include "inc/hw_types.h"
#include "inc/hw_gpio.h"
#include "inc/hw_memmap.h"
#include "driverlib/pin_map.h"
#include "driverlib/sysctl.h"
#include "driverlib/gpio.h"
#include "driverlib/pwm.h"

#define LED_PERIPH SYSCTL_PERIPH_GPIOF
#define LED_BASE GPIO_PORTF_BASE
#define RED_LED GPIO_PIN_1      


int main(){
    SysCtlPeripheralEnable(SYSCTL_PERIPH_PWM0);

    SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOF);
    SysCtlDelay(10);

    GPIOPinConfigure(GPIO_PF1_M0PWM1);

    GPIOPinTypePWM(GPIO_PORTF_BASE, GPIO_PIN_1);

    PWMClockSet(PWM0_BASE, PWM_SYSCLK_DIV_8);

    PWMGenConfigure(PWM0_BASE, PWM_GEN_0, PWM_GEN_MODE_DOWN | PWM_GEN_MODE_NO_SYNC);

    uint32_t freq = 40000000;
    uint32_t duty = freq / 2;
    PWMGenPeriodSet(PWM0_BASE, PWM_GEN_0, freq);
    PWMPulseWidthSet(PWM0_BASE, PWM_OUT_1, duty);

    PWMOutputState(PWM0_BASE, PWM_OUT_1_BIT, true);
    PWMGenEnable(PWM0_BASE, PWM_GEN_0);
}