'channels' => [
    'stack' => [
        'driver' => 'stack',
        'channels' => ['stderr'],
        'ignore_exceptions' => false,
    ],
    'stderr' => [
        'driver' => 'monolog',
        'handler' => Monolog\Handler\StreamHandler::class,
        'with' => [
            'stream' => 'php://stderr',
        ],
        'formatter' => Monolog\Formatter\JsonFormatter::class,
    ],
    // ...
],
