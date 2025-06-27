// Standard headers
#include <stdint.h>
// Driver
#include "gpio.h"
#include "models.h"
// Private
#include "config.h"
#include "lane_loopback.h"
#include "data_link_loopback.h"
#include "data_link_link_reset.h"
#include "shared_header.h"
// Common
#include "common.h"

uint32_t exit_code;
#include "xil_printf.h"

/****** Hardware setup ******/


#define USE_ALT_SCENARIO


int main(void) 
{	
	
	
	printf("\r\nSEQ_SFB: -- Start --\r\n");
  printf("\r\n Choose your program: \r\n");
	printf("\r\n   - 0 = [PHY + LANE] LOOPBACK scenario ALL steps\r\n");
	printf("\r\n   - 1 = [PHY + LANE] LOOPBACK scenario step 1 (Parallel Loopback) only\r\n");
	printf("\r\n   - 2 = [PHY + LANE] LOOPBACK scenario step 2 (Near-End Loopback) only \r\n");
	printf("\r\n   - 3 = [PHY + LANE] LOOPBACK scenario step 3 (External Loopback) only \r\n");
	printf("\r\n   - 4 = [PHY + LANE + DATA-LINK]: LOOPBACK scenario (External Loopback) ALL steps\r\n");
	printf("\r\n   - 5 = [PHY + LANE + DATA-LINK]: LOOPBACK scenario (External Loopback) Step 1 only \r\n");
	printf("\r\n   - 6 = [PHY + LANE + DATA-LINK]: LOOPBACK scenario (External Loopback) Step 2 only \r\n");
	printf("\r\n   - 7 = [PHY + LANE + DATA-LINK]: LOOPBACK scenario (External Loopback) Step 3 only \r\n");
	printf("\r\n   - 8 = [PHY + LANE + DATA-LINK]: LOOPBACK scenario (External Loopback) Step 4 only \r\n");
	printf("\r\n   - 9 = [PHY + LANE + DATA-LINK]: LINK RESET scenario (External Loopback) ALL steps\r\n");
	printf("\r\n   - A = [PHY + LANE + DATA-LINK]: LINK RESET scenario (External Loopback) Step 1 only \r\n");
	printf("\r\n   - B = [PHY + LANE + DATA-LINK]: LINK RESET scenario (External Loopback) Step 2 only \r\n");
	printf("\r\n   - C = [PHY + LANE + DATA-LINK]: LOOPBACK scenario (Near-End Loopback) ALL steps\r\n");
	printf("\r\n   - D = [PHY + LANE + DATA-LINK]: LOOPBACK scenario (Near-End Loopback) Step 1 only \r\n");
	printf("\r\n   - E = [PHY + LANE + DATA-LINK]: LOOPBACK scenario (Near-End Loopback) Step 2 only \r\n");
	printf("\r\n   - F = [PHY + LANE + DATA-LINK]: LOOPBACK scenario (Near-End Loopback) Step 3 only \r\n");
	printf("\r\n   - G = [PHY + LANE + DATA-LINK]: LOOPBACK scenario (Near-End Loopback) Step 4 only \r\n");
	printf("\r\n   - H = [PHY + LANE + DATA-LINK]: LINK RESET scenario (Near-End Loopback) ALL steps\r\n");
	printf("\r\n   - I = [PHY + LANE + DATA-LINK]: LINK RESET scenario (Near-End Loopback) Step 1 only \r\n");
	printf("\r\n   - J = [PHY + LANE + DATA-LINK]: LINK RESET scenario (Near-End Loopback) Step 2 only \r\n");
	while(1) {
		char temp = inbyte();
		if (temp == '0'){ //[PHY + LANE] LOOPBACK scenario ALL steps
			lane_loopback_all_step();
		}
		if (temp == '1'){ //[PHY + LANE] LOOPBACK scenario step 1 (Parallel Loopback) only
			lane_loopback_step1();
		}
		if (temp == '2'){ //[PHY + LANE] LOOPBACK scenario step 2 (Near-End Loopback) only
			lane_loopback_step2();
		}
		if (temp == '3'){ //[PHY + LANE] LOOPBACK scenario step 3 (External Loopback) only 
			lane_loopback_step3();
		}
		if (temp == '4'){ //[PHY + LANE + DATA-LINK]: LOOPBACK scenario (External Loopback) ALL steps
			data_link_lpb_all_step(0);
		}
		if (temp == '5'){ //[PHY + LANE + DATA-LINK]: LOOPBACK scenario (External Loopback) Step 1 only 
			data_link_lpb_step1(0);
		}
		if (temp == '6'){ //[PHY + LANE + DATA-LINK]: LOOPBACK scenario (External Loopback) Step 2 only 
			data_link_lpb_step2(0);
		}
		if (temp == '7'){ //[PHY + LANE + DATA-LINK]: LOOPBACK scenario (External Loopback) Step 3 only 
			data_link_lpb_step3(0);
		}
		if (temp == '8'){ //[PHY + LANE + DATA-LINK]: LOOPBACK scenario (External Loopback) Step 4 only 
			data_link_lpb_step4(0);
		}
		if (temp == '9'){ //[PHY + LANE + DATA-LINK]: LINK RESET scenario (External Loopback) ALL steps
			data_link__link_reset_all_step(0);
		}
		if (temp == 'A'){ //[PHY + LANE + DATA-LINK]: LINK RESET scenario (External Loopback) Step 1 only
			data_link_link_reset_step1(0);
		}
		if (temp == 'B'){ //[PHY + LANE + DATA-LINK]: LINK RESET scenario (External Loopback) Step 2 only
			data_link_link_reset_step2(0);
		}
		if (temp == 'C'){ //[PHY + LANE + DATA-LINK]: LOOPBACK scenario (Near-End Loopback) ALL steps
			data_link_lpb_all_step(1);
		}
		if (temp == 'D'){ //[PHY + LANE + DATA-LINK]: LOOPBACK scenario (Near-End Loopback) Step 1 only 
			data_link_lpb_step1(1);
		}
		if (temp == 'E'){ //[PHY + LANE + DATA-LINK]: LOOPBACK scenario (Near-End Loopback) Step 2 only
			data_link_lpb_step2(1);
		}
		if (temp == 'F'){ //[PHY + LANE + DATA-LINK]: LOOPBACK scenario (Near-End Loopback) Step 3 only
			data_link_lpb_step3(1);
		}
		if (temp == 'G'){ //[PHY + LANE + DATA-LINK]: LOOPBACK scenario (Near-End Loopback) Step 4 only
			data_link_lpb_step4(1);
		}
		if (temp == 'H'){ //[PHY + LANE + DATA-LINK]: LINK RESET scenario (Near-End Loopback) ALL steps
			data_link__link_reset_all_step(1);
		}
		if (temp == 'I'){ //[PHY + LANE + DATA-LINK]: LINK RESET scenario (Near-End Loopback) Step 1 only
			data_link_link_reset_step1(1);
		}
		if (temp == 'J'){ //[PHY + LANE + DATA-LINK]: LINK RESET scenario (Near-End Loopback) Step 2 only
			data_link_link_reset_step2(1);
		}
		
	}

	return 0;
}
