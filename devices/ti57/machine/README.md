---
layout: page
title: TI-57 Test Page
permalink: /devices/ti57/machine/
machines:
  - id: ti57
    type: Machine
    name: TI-57 Programmable Calculator
    config: |
      {
        clock: {
          class: "Time",
          cyclesPerSecond: 1600000,
          bindings: {
            run: "runTI57",
            print: "printTI57"
          }
        },
        rom: {
          class: "ROM",
          wordSize: 13,
          valueSize: 16,
          valueTotal: 2048,
          littleEndian: true,
          file: "ti57pat867.bin",
          reference: "",
          values: [
            4627,4388,5099,7044,3246,6152,5814,5638,5733,7044,4388,3246,7905,5132,1822,6796,
            2600,1497,6542,6473,6645,6464,6893,6936,6663,3246,7590,4390,6651,4388,5631,7044,
            4388,5689,7044,6154,6394,3246,7436,4390,3186,7759,3194,3197,8067,3495,3184,6735,
            4065,6776,6304,6887,6331,3246,7273,4388,6773,4390,3246,8111,3186,7723,3879,6690,
            2087,6236,6266,6884,6332,4388,3246,7318,6208,4390,3246,8133,3186,7766,3219,6748,
            3261,6797,6683,6890,6760,3288,6240,3288,6315,4388,3246,8134,3238,6799,3188,6781,
            3112,3246,6767,3290,3296,6318,4388,3217,7043,3250,6253,3194,6568,4388,6395,2079,
            2241,5133,2079,1879,3588,1806,7044,5083,3329,7044,4390,3246,7300,3189,3186,7714,
            3250,3237,7048,3587,5132,1793,3194,6329,3588,2272,2272,3310,6288,3584,1793,3590,
            2273,3594,3589,3310,7707,6277,5428,5186,2007,5550,5513,3194,8068,1887,5584,7044,
            4388,3194,7172,5734,3246,7044,804,8068,5814,5632,7044,3108,3246,6767,3359,4390,
            5132,3129,3133,3298,7353,3128,3290,7353,3132,5232,7048,3308,3250,7593,4388,5428,
            3246,6339,3232,3194,6346,3304,3298,6346,3246,7279,2271,3583,5278,3592,3551,2303,
            3877,6776,3298,6358,3234,7280,3118,7800,2080,3114,6369,3118,7393,3110,3108,6371,
            3107,3115,3300,2055,3594,5138,1815,1991,3298,7416,3310,6384,3234,6261,5228,6261,
            3306,6387,3128,3234,6391,5633,6392,5582,5228,6797,3246,3296,6331,4224,5120,5136,
            2573,6408,2657,5142,2656,5155,2657,6399,2777,5155,6477,5217,4224,5123,2599,3120,
            3124,2629,6408,2656,5142,2657,5155,2656,6414,3186,3592,6429,5186,3225,1815,5537,
            3919,3587,3246,6457,3250,6425,3250,3237,6433,3233,1505,2623,3194,6447,3116,3246,
            6452,3943,3192,3848,2759,5123,5155,3234,7501,3233,5120,5136,2573,6682,2592,6471,
            4224,3246,7465,5136,3233,2593,7501,3588,6477,3246,8088,3250,7706,3592,3248,5123,
            2593,7508,544,6480,813,1028,808,6491,3589,2561,6471,5827,1991,3593,5142,3877,
            7184,3118,6502,3117,3309,1255,3943,3192,3849,3877,6526,3292,3848,5257,3877,6529,
            1823,1061,1025,1281,813,2247,3232,3236,7663,3294,6636,6114,6042,6545,3849,3877,
            7532,2591,6053,1535,1512,3134,6542,3130,3126,6542,3130,3122,7626,3841,5490,1528,
            1823,5418,616,616,872,872,1061,7577,1127,2377,5827,872,872,5559,3234,7048,
            1384,3238,7048,3233,5221,6710,4224,3308,3256,3237,3232,145,3194,6575,167,3495,
            3228,3220,3246,6581,3488,3298,7611,3310,7466,3488,3488,3224,6442,3234,6452,3233,
            3258,7648,3118,7476,3479,3903,165,7476,3116,6452,2599,2592,3124,3314,7634,4065,
            3128,3872,3318,7638,3872,3321,3322,7641,3872,3232,3236,3310,3309,6530,1255,6530,
            1503,2623,3257,3226,6449,3222,6633,3116,6449,3218,7624,6452,6115,6087,6545,3294,
            1312,6523,6112,6093,6545,3250,7458,3246,7435,3252,6661,3262,7683,1999,5418,3591,
            3591,7679,1887,3254,8072,3263,7048,3246,3296,7960,4390,5135,2561,3588,3261,5133,
            3121,3125,6329,401,257,3594,3588,2208,3590,6677,3249,4390,257,2193,329,473,
            3594,3588,1793,5418,3184,1038,616,1038,3473,3877,7740,3218,7730,3216,679,672,
            680,592,3221,7048,1320,5103,1328,7048,3250,7613,3186,6690,3222,7732,549,6722,
            3218,6731,719,1241,744,2024,220,2029,7048,1231,607,2055,1087,552,7048,3194,
            3197,7730,3196,3220,1353,7048,3222,6748,3308,5221,1144,5000,2121,2144,1896,79,
            3895,3122,7773,3167,2145,8072,5494,6756,4388,3246,7287,3116,3194,6767,3288,4388,
            6016,3238,7800,3236,6799,5127,3872,6796,3188,7043,5633,2079,6016,4065,6799,4057,
            2081,2085,2561,7813,2079,1815,3588,7047,3877,7840,3873,2277,3588,287,7044,5127,
            2151,3877,6804,2119,2149,7836,2141,6792,4064,3594,3322,7216,287,3841,3105,6790,
            1887,1806,3162,6821,3128,2120,7851,2120,7802,5582,6779,2079,3588,1999,1806,549,
            7867,5537,5734,1806,3589,5633,5733,5213,1999,2247,6779,3154,6846,6121,613,6839,
            6134,5550,5537,6839,5132,3919,3090,2303,6858,3232,5624,5213,3588,1807,5638,1822,
            5638,5688,5213,3588,1807,5858,1863,5133,613,7902,5638,3588,5625,7044,5487,1806,
            6260,3194,7876,3240,3120,3246,6176,3124,3246,6145,3246,6173,5856,3250,6897,3246,
            6568,4388,3246,6970,5135,549,3094,7936,5101,3399,3157,5580,3588,549,7947,6924,
            1793,3588,6923,5132,1887,5580,3298,6921,3090,549,7948,3232,3194,6927,3235,1951,
            3234,7043,3262,3254,7043,5136,2592,7042,3250,6941,3246,3194,6567,4388,3246,7939,
            5132,3194,8053,3126,7800,3872,3262,3254,7980,3121,3125,6964,3588,3697,5211,3697,
            3588,5136,1807,3681,5232,3254,8023,3240,3262,8023,5428,5278,3877,6776,3246,6999,
            2349,3527,5278,3877,3551,1535,1512,2055,3592,1528,6776,5136,2561,3242,6993,3241,
            3260,1500,7800,1505,8066,2592,6995,2413,2413,1503,2687,2009,2265,3551,5183,2629,
            2573,1504,7026,3593,296,296,3592,2272,3310,7007,3552,3294,7800,3290,7004,3286,
            8029,7004,2408,2408,6987,3122,3123,3126,3125,6224,3588,3665,5211,3665,3588,3697,
            5214,3681,3588,1815,3242,2193,7894,5428,3254,7054,3262,3261,8078,3253,5278,3593,
            3877,2265,7736,3289,2305,1504,1508,3586,4388,3194,8094,5428,5186,5251,3090,7073,
            2279,3217,5235,3194,7079,5251,7080,5254,5235,3194,7084,5254,5221,3376,7044,4388,
            3300,5132,5625,3633,5213,5226,3681,5223,5099,3697,5223,5133,3302,3303,8118,5550,
            3649,5223,3665,5223,7043,3296,4388,3194,8138,3300,3681,5138,5136,3298,7337,1991,
            1807,5638,1806,5632,3697,1863,5138,5584,1806,6313,1927,769,6090,6087,6096,6101,
            6109,6087,6042,6100,6098,5827,967,768,839,768,3587,1991,5625,1865,103,2055,
            3587,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
            2663,3936,7161,5136,2631,1793,3587,3871,3594,455,3589,3587,1991,3649,6154,1991,
            3665,6154,3302,7262,3584,6239,3293,6180,3294,6177,2591,3429,6187,3590,591,2687,
            3587,2759,6174,3292,2639,639,3401,2575,5170,2145,7192,5490,1399,296,3424,1288,
            7197,6185,2560,3130,6205,3126,6205,2085,7229,3114,8185,3872,2049,2119,3847,3594,
            3584,3587,1100,3237,3185,3329,7241,3092,5568,621,1127,1120,616,97,7254,76,
            7252,97,6561,3088,552,6220,616,5565,101,7254,6561,3589,3681,1863,3589,1806,
            3587,5425,2592,3134,6241,2271,3587,1991,5138,1823,3855,5582,3302,7280,3590,6257,
            3588,1823,3587,2007,5550,5513,1822,1887,5580,1822,1865,3156,3160,1901,3156,1383,
            3855,3131,6826,5565,5565,6561,5573,5573,6561,3114,6295,3126,7311,3122,7319,3873,
            2080,3118,6334,3126,7319,3841,2605,3587,2561,3588,3188,3261,3253,799,3192,3245,
            3195,3262,3254,7365,975,3591,3591,7333,5413,3591,3591,6312,2623,5257,5422,3591,
            3591,6312,1535,3130,3877,7475,2085,6451,3122,6304,3126,7475,3247,6305,2080,3118,
            7318,3872,3872,3872,6334,967,3593,3254,7390,3190,7323,3591,3591,6366,2623,3126,
            3130,7390,2080,3118,6359,2081,6396,2080,3106,3110,7390,3114,6366,5217,5136,2592,
            3588,2593,5170,3190,7320,2145,7401,296,6373,3877,7420,3118,6383,3117,3192,5490,
            3391,3431,3160,3337,3365,3335,7420,3895,3337,3365,6419,3244,799,5500,1535,3877,
            7475,5257,3877,6451,3246,3194,7432,5000,4377,3194,7437,799,4896,3246,7440,4951,
            2279,3308,4208,2265,2193,3090,7449,3361,2215,3098,6428,3296,3094,7455,3308,3194,
            6434,3304,1823,4377,4310,3190,6449,2592,3122,6446,841,3592,865,7473,3593,863,
            3592,3591,3591,3587,3592,5537,3649,5213,1865,3156,5494,2009,3090,6463,3431,2119,
            3198,7496,1479,992,992,1005,1509,7552,3284,2081,5492,5492,3118,6475,1028,6497,
            5493,711,544,1252,6487,749,6483,741,6498,545,967,1815,5563,804,6454,799,
            6498,5493,2149,6504,1061,6504,1125,7521,552,616,3286,6522,3094,6523,1120,3282,
            6515,3091,3847,3587,2081,557,1901,3152,3164,3587,1377,1121,2567,3587,5565,557,
            3094,7550,1317,7497,5572,2081,6530,2049,6530,1814,841,3169,941,5573,3094,7580,
            872,613,7572,3168,5527,552,6541,533,7627,529,864,6551,5565,936,3094,7585,
            5527,3129,37,6569,552,5573,549,6562,1793,3130,3129,8102,1927,6592,5101,783,
            3329,1281,3128,6562,1351,2121,1281,1377,8102,813,6583,513,39,3094,7142,1313,
            1317,6595,3093,3587,621,3094,8166,1313,6595,1319,3092,3587,3128,1806,3130,6609,
            3091,1423,3129,3158,7662,3094,1299,7667,1445,6605,1937,3090,6628,3154,7654,525,
            7629,521,1887,6561,3154,7647,520,6684,557,877,5564,804,7650,6684,3094,6605,
            1299,7629,1445,613,7642,557,5565,6609,3128,1887,6657,5551,1303,3154,6561,5101,
            3128,3130,6662,549,8176,3095,1935,583,3338,3089,3154,6669,3088,3217,3346,3222,
            7718,1288,8168,513,1425,1353,5568,677,7650,3130,7726,557,1185,6630,685,677,
            7650,101,6683,872,5573,6684,1293,6698,3095,1294,1289,6675,905,544,909,6700,
            37,6626,877,552,549,6702,5573,6702,5585,6135,1793,677,7585,5101,1441,7752,
            1441,7748,1312,6718,3222,6727,1312,621,3217,2121,1287,2424,1281,1425,6750,877,
            813,6749,897,897,776,901,6738,777,786,6746,165,6735,936,877,869,6739,
            5552,3351,2383,1343,6626,3120,3122,7853,6135,1415,1281,3088,549,8169,5556,841,
            3122,6773,103,549,7675,798,769,2063,2081,7878,2081,7888,2081,7895,2081,7900,
            39,6049,798,3122,6800,797,7829,793,655,534,6049,534,592,6789,535,856,
            647,6049,534,530,6798,2144,749,741,6773,3122,7675,5815,1991,521,5552,1822,
            3222,6819,3088,1895,1431,127,1453,621,1431,127,1806,5633,6609,5814,5513,3328,
            3170,8168,3545,2265,1423,6766,1863,1793,6103,6101,808,6103,6096,6087,6096,808,
            6109,6101,808,808,808,3587,6095,6101,6042,808,6042,6090,6109,6087,5827,6786,
            6108,6096,808,6101,6101,808,6861,6107,6096,5827,6103,6862,6106,6096,5826,6786,
            4388,2303,3189,3194,8018,3128,6055,5083,768,5513,6006,5556,5082,768,3090,6897,
            787,3329,5083,909,853,7929,3235,3126,6919,901,7935,897,3126,6911,3091,3122,
            3877,6989,909,7943,787,3091,3235,925,7947,851,3128,791,3527,798,841,913,
            167,3194,7957,6021,6934,6048,965,7975,963,798,3194,6945,6049,786,6021,778,
            6929,6048,776,782,6049,897,6929,2144,741,6929,783,3130,6962,3194,6961,5082,
            851,790,5552,5487,3194,8038,1814,5552,1879,5632,3089,5487,3126,6982,5099,3125,
            5688,5631,5487,3190,6982,5544,3281,3234,6986,3280,2271,3967,4996,909,8016,787,
            851,6919,6006,3527,3126,7004,5099,5584,5689,3190,8035,5632,3094,549,8033,5631,
            3128,5556,6925,4749,3194,6986,3122,7021,4874,5551,1879,5584,3089,1927,3234,7028,
            5083,3329,1879,5585,6055,6986,657,936,912,677,7596,3094,6572,3122,7012,1793,
            3097,3290,6572,3096,6572,769,2063,2081,8082,2081,8092,39,2081,7073,6105,6109,
            6092,7114,6108,6092,6087,6093,6096,6103,6098,6109,808,7142,6106,6092,6092,7065,
            791,2063,813,2081,7074,2080,3587,5490,2175,5132,2349,2062,2600,3182,8126,3178,
            7281,6096,6090,6103,6095,6089,6095,6042,6101,3329,808,6042,1879,6657,6100,6092,
            6042,6109,6089,6103,6101,6090,7097,808,7135,6090,808,7136,6093,808,7137,6109,
            808,7138,808,7139,6093,808,7140,808,7141,6109,6109,6109,6109,808,800,800,
            800,800,800,800,800,800,1312,6595,3094,769,8174,801,3093,8180,1313,8179,
            613,3343,7145,39,3188,6561,3130,3090,7162,3188,3587,0,0,0,0,0
          ]
        }
      }
---

TI-57 Test Page
---------------

{% include machine.html id="ti57" %}