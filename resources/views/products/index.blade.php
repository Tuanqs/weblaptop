<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh Sách Sản Phẩm</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="{{ asset('css/product.css') }}">
</head>
<body>
    <div class="container" style="padding-top: 20px;">
        <!-- Title -->
        <h1>Danh Sách Sản Phẩm</h1>
        
        <!-- Search Form -->
        <form class="filter-form" method="GET" action="{{ route('products.index') }}">
            <div class="form-row">
                <div class="col-md-4 mb-3">
                    <input type="text" name="search" class="form-control" placeholder="Search by product name" value="{{ request('search') }}">
                </div>
                <div class="col-md-4 mb-3">
                    <select name="price_range" class="form-control">
                        <option value="">Select Price Range</option>
                        <option value="5-20" {{ request('price_range') == '5-20' ? 'selected' : '' }}>5.000.000đ - 20.000.000đ</option>
                        <option value="20-35" {{ request('price_range') == '20-35' ? 'selected' : '' }}>20.000.000đ - 35.000.000đ</option>
                        <option value="35-50" {{ request('price_range') == '35-50' ? 'selected' : '' }}>35.000.000đ - 50.000.000đ</option>
                        <option value="50+" {{ request('price_range') == '50+' ? 'selected' : '' }}>50.000.000đ+</option>
                    </select>
                </div>
                <div class="col-md-4 mb-3">
                    <button type="submit" class="btn btn-primary btn-block">Search</button>
                </div>
            </div>
        </form>
        
        <!-- Product Listing -->
        <div class="product-container">
            @foreach($products as $product)
                <div class="product-card">
                    @if($product->image)
                        <img src="{{ asset('storage/' . $product->image) }}" alt="{{ $product->name }}">
                    @endif
                    <h5 class="product-name">
                        {{ $product->name }}
                    </h5>
                    <p class="product-description">
                        {!! nl2br(e($product->description)) !!}
                    </p>
                    <span class="read-more">Xem thêm</span>
                    <p class="product-price">
                        Price: {{ number_format($product->price, 0, ',', '.') }}₫
                    </p>
                    <a href="#" class="btn btn-primary btn-sm buy-button">Mua hàng</a>
                </div>
            @endforeach
        </div>

        <!-- Pagination -->
        <div class="pagination-container">
                @if ($products->currentPage() > 1)
                    <a href="{{ $products->previousPageUrl() }}" class="pagination-link">« Previous</a>
                @endif

                @foreach(range(1, $products->lastPage()) as $page)
                    <a href="{{ $products->url($page) }}" class="pagination-link {{ $page == $products->currentPage() ? 'active' : '' }}">
                        {{ $page }}
                    </a>
                @endforeach

                @if ($products->hasMorePages())
                    <a href="{{ $products->nextPageUrl() }}" class="pagination-link">Next »</a>
                @endif
        </div>
    </div>

    <!-- Optional JavaScript; choose one of the two! -->
    <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Read More Script -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Find all "Read More" links
            const readMoreLinks = document.querySelectorAll('.read-more');

            // Attach click event to each link
            readMoreLinks.forEach(link => {
                link.addEventListener('click', function() {
                    // Find the corresponding product description
                    const description = this.previousElementSibling;

                    // Toggle the 'expanded' class
                    description.classList.toggle('expanded');

                    // Change the link text based on the current state
                    if (description.classList.contains('expanded')) {
                        this.textContent = 'Thu gọn'; // Text when expanded
                    } else {
                        this.textContent = 'Xem thêm'; // Text when collapsed
                    }
                });
            });
        });
    </script>
</body>
</html>
