<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Redis;

Route::get('/healthz', function () {
    try {
        $ping = Redis::ping();
        return response()->json([
            'status' => 'ok',
            'redis' => $ping
        ]);
    } catch (\Exception $e) {
        return response()->json([
            'status' => 'error',
            'redis' => $e->getMessage()
        ], 500);
    }
});
