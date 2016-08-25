<?php

class Sample extends PHPDaemon\Core\AppInstance
{
	public function onReady()
	{
		PHPDaemon\Core\Daemon::log('Started.');
	}

	public function onShutdown($graceful = false)
	{
		static $cnt = 3;

		PHPDaemon\Core\Daemon::log("Shutdown ({$cnt})");

		return --$cnt === 0;
	}
}
