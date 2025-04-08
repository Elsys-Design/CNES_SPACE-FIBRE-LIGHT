#pragma once

// Yes, it's weird. But it's convenient.
#define EIGHT_ENTRIES_OF(...) \
	__VA_ARGS__, __VA_ARGS__, __VA_ARGS__, __VA_ARGS__, \
	__VA_ARGS__, __VA_ARGS__, __VA_ARGS__, __VA_ARGS__

#define EIGHT_VARIANTS_OF(x) \
	(x), (x + 32), (x + 64), (x + 128), \
	(x + 256), (x + 512), (x + 1024), (x + 2048)

#define NINTH_VARIANT_OF(x) (x + 4096)

#define BASIC_CONFIG(init, ...) \
	{ \
		.gen_conf = {EIGHT_ENTRIES_OF(__VA_ARGS__)}, \
		.ana_conf = {EIGHT_ENTRIES_OF(__VA_ARGS__)}, \
		.gen_init = {EIGHT_VARIANTS_OF(init)}, \
		.ana_init = {EIGHT_VARIANTS_OF(init)}, \
		.broadcast_gen_conf = __VA_ARGS__, \
		.broadcast_ana_conf = __VA_ARGS__, \
		.broardcast_gen_init = NINTH_VARIANT_OF(init), \
		.broardcast_ana_init = NINTH_VARIANT_OF(init), \
		.expect_errors = false \
	}

#define INVALID_CONFIG(init, ...) \
	{ \
		.gen_conf = {EIGHT_ENTRIES_OF(__VA_ARGS__)}, \
		.ana_conf = {EIGHT_ENTRIES_OF(__VA_ARGS__)}, \
		.gen_init = {EIGHT_VARIANTS_OF(init)}, \
		.ana_init = {EIGHT_VARIANTS_OF((init+13))}, \
		.broadcast_gen_conf = __VA_ARGS__, \
		.broadcast_ana_conf = __VA_ARGS__, \
		.broardcast_gen_init = NINTH_VARIANT_OF(init), \
		.broardcast_ana_init = NINTH_VARIANT_OF((init+13)), \
		.expect_errors = true \
	}

struct test_config
{
	struct generator_configuration gen_conf[8];
	struct analyzer_configuration ana_conf[8];
	struct generator_configuration broadcast_gen_conf;
	struct analyzer_configuration broadcast_ana_conf;
	uint32_t gen_init[8];
	uint32_t ana_init[8];
	uint32_t broardcast_gen_init;
	uint32_t broardcast_ana_init;
	bool expect_errors;
};

enum action_result wait_test_end (const uint32_t channel_count);
void start_test (const uint32_t channel_count);

enum action_result run_tests
(
	const unsigned int test_count,
	const struct test_config test[const static test_count],
	const uint32_t channel_count
);
