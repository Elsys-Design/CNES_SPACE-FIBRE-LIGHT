#pragma once

// Yes, it's weird. But it's convenient.
#define EIGHT_ENTRIES_OF(...) \
	__VA_ARGS__, __VA_ARGS__, __VA_ARGS__, __VA_ARGS__, \
	__VA_ARGS__, __VA_ARGS__, __VA_ARGS__, __VA_ARGS__

#define EIGHT_VARIANTS_OF(x) \
	(x), (x + 32), (x + 64), (x + 128), \
	(x + 256), (x + 512), (x + 1024), (x + 2048)

#define CHANNEL_COUNT 9
#define ALL_CHANS            0x1FF
#define NO_BROADCAST_CHANS   0x0FF
#define ONLY_BROADCAST_CHANS 0x100

#define BASIC_CONFIG(enablemask, init, ...) \
	{ \
		.gen_conf = {EIGHT_ENTRIES_OF(__VA_ARGS__)}, \
		.ana_conf = {EIGHT_ENTRIES_OF(__VA_ARGS__)}, \
		.gen_init = {EIGHT_VARIANTS_OF(init)}, \
		.ana_init = {EIGHT_VARIANTS_OF(init)}, \
		.enable_mask = enablemask, \
		.expect_errors = false \
	}

#define INVALID_CONFIG(enablemask, init, ...) \
	{ \
		.gen_conf = {EIGHT_ENTRIES_OF(__VA_ARGS__)}, \
		.ana_conf = {EIGHT_ENTRIES_OF(__VA_ARGS__)}, \
		.gen_init = {EIGHT_VARIANTS_OF(init)}, \
		.ana_init = {EIGHT_VARIANTS_OF((init+13))}, \
		.enable_mask = enablemask, \
		.expect_errors = true \
	}

struct test_config
{
	struct dl_generator_configuration gen_conf[8];
	struct dl_analyzer_configuration ana_conf[8];
	uint32_t gen_init[8];
	uint32_t ana_init[8];
	uint8_t enable_mask;
	bool expect_errors;
};

enum action_result initialization_sequence (void);

enum action_result run_test (const struct test_config test [const static 1]);

enum action_result run_tests
(
	const unsigned int test_count,
	const struct test_config test [const static test_count]
);

enum action_result init_and_run_tests
(
	const unsigned int test_count,
	const struct test_config test [const static test_count]
);
