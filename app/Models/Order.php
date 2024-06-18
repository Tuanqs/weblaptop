<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id', 'status', 'total', 'payment_method', 'address', 'shipped_at', 'delivered_at'
    ];

    // Nếu bảng có quan hệ với các bảng khác như User, Product, bạn có thể định nghĩa ở đây
    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
