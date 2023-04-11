<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class UserModel extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'email',
        'password',
    ];

    public function create($data)
    {
        $result = UserModel::create($data)->id_user;
        return $result;
    }
    
    public function getAuth($data)
    {
        return UserModel::where("email", $data['email'])
            ->where("password", $data['password'])
            ->first();
    }

    public function findById($data)
    {
        return UserModel::where("email", $data['email'])
            ->where("password", $data['password'])
            ->first();
    }
}
