<?php
/**
 * Created by PhpStorm.
 * User: kaguya
 * Date: 2017/3/3
 * Time: 23:51
 */
namespace App\Models;

/**
 * User Model
 */

use App\Utils\Tools;
use App\Utils\Hash;
use App\Models\InviteCode;
use App\Services\Config;
use App\Utils\GA;


class KaguyaConfig extends Model

{
    protected $connection = "default";
    protected $table = "kaguya_config";
}