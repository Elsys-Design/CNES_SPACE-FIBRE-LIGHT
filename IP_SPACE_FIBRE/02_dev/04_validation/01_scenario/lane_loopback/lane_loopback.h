/**
 * @brief Scenraio loopback
 * @author Yvan DAURIAC
 * @date 2024-12-03
*/



#include <stdint.h>
#include <stdbool.h>

void init_to_started(void);
void wait_for_started_to_active(void);
uint32_t wait_end_test(void);
void started_to_active(void);

void scenario_loopback(void);
void lane_loopback_step2(void);
void lane_loopback_step1(void);
void lane_loopback_step3(void);


