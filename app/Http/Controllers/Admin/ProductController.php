<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class ProductController extends Controller
{
    // Hiển thị danh sách sản phẩm
    public function index()
    {
        $products = Product::all();
        return view('admin.products.index', compact('products'));
    }

    // Hiển thị form thêm sản phẩm
    public function create()
    {
        return view('admin.products.create');
    }

    // Lưu sản phẩm mới
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'description' => 'nullable|string',
            'price' => 'required|numeric',
            'quantity' => 'required|integer',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg,webp|max:2048',
        ]);

        $imagePath = null;
        if ($request->hasFile('image')) {
            $imagePath = $request->file('image')->store('product_images', 'public');
        }

        Product::create([
            'name' => $request->name,
            'description' => $request->description,
            'price' => $request->price,
            'quantity' => $request->quantity,
            'image' => $imagePath,
        ]);

        return redirect()->route('admin.dashboard')->with('success', 'Sản phẩm đã được thêm thành công.');
    }

    // Hiển thị form chỉnh sửa sản phẩm
    public function edit(Product $product)
    {
        return view('admin.products.edit', compact('product'));
    }

    // Cập nhật sản phẩm
    public function update(Request $request, Product $product)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'description' => 'nullable|string',
            'price' => 'required|numeric',
            'quantity' => 'required|integer',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg,webp|max:2048',
        ]);

        $data = $request->only(['name', 'description', 'price', 'quantity']);

        if ($request->hasFile('image')) {
            // Xóa ảnh cũ nếu có
            if ($product->image) {
                Storage::delete('public/' . $product->image);
            }

            // Lưu ảnh mới
            $data['image'] = $request->file('image')->store('product_images', 'public');
        }

        // Cập nhật sản phẩm
        $product->update($data);

        return redirect()->route('admin.dashboard')->with('success', 'Sản phẩm đã được cập nhật thành công.');
    }
}
