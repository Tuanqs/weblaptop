<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Order;
use Illuminate\Http\Request;

class OrderController extends Controller
{
    public function index()
    {
        // Lấy tất cả các đơn hàng để hiển thị trong danh sách
        $orders = Order::with('user')->get();
        return view('admin.orders.index', compact('orders'));
    }

    public function show(Order $order)
    {
        // Hiển thị chi tiết đơn hàng
        return view('admin.orders.show', compact('order'));
    }

    public function edit(Order $order)
    {
        // Hiển thị form chỉnh sửa đơn hàng
        return view('admin.orders.edit', compact('order'));
    }

    public function update(Request $request, Order $order)
    {
        $request->validate([
            'status' => 'required|in:pending,processing,shipped,delivered,paid',
        ]);

        // Xử lý trạng thái đặc biệt
        if ($request->status == 'shipped') {
            $order->shipped_at = now();
        } elseif ($request->status == 'delivered') {
            $order->delivered_at = now();
        }

        $order->update($request->all());

        return redirect()->route('admin.orders.index')->with('success', 'Đơn hàng đã được cập nhật.');
    }

    public function destroy(Order $order)
    {
        $order->delete();

        return redirect()->route('admin.orders.index')->with('success', 'Đơn hàng đã được xóa.');
    }
}
