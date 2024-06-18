<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách sản phẩm</title>
</head>
<body>
    <h1>Danh sách sản phẩm</h1>
    <a href="{{ route('user.products.index) }}" class="btn btn-create">Thêm sản phẩm mới</a>

    @if($products->isEmpty())
        <p>Không có sản phẩm nào.</p>
    @else
        <ul>
            @foreach($products as $product)
                <li>
                    <strong>{{ $product->name }}</strong><br>
                    Mô tả: {{ $product->description }}<br>
                    Giá: {{ number_format($product->price) }} VND<br>
                    Số lượng: {{ $product->quantity }}
                </li>
            @endforeach
        </ul>
    @endif
</body>
</html>
