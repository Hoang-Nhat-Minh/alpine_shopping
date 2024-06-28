@extends('layout.main')

@section('css')
<style>
  input[type="number"]::-webkit-inner-spin-button,
  input[type="number"]::-webkit-outer-spin-button {
    -webkit-appearance: none;
    margin: 0;
  }

  input[type="number"] {
    -moz-appearance: textfield;
  }

</style>

<style>
  .truncate {
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
  }

  .alert_custom {
    position: fixed;
    pointer-events: none;
    width: 100%;
    height: 100vh;
    top: 0;
    left: 0;
    z-index: 9999999999;
  }

  /* list */
  .alert_custom .list {
    display: flex;
    flex-direction: column;
    margin: 1rem;
    width: 100%;
    max-width: 400px;
    float: right;
  }

  /* item */
  .alert_custom .list .item {
    --line-height: 4px;
    position: relative;
    display: flex;
    align-items: center;
    padding: .5rem;
    color: #fff;
    border-radius: 0.25rem;
    overflow: hidden;
    padding-bottom: calc(.5rem + var(--line-height))
  }

  .alert_custom .list .item.success {
    background: #16A34A;
  }

  .alert_custom .list .item.error {
    background: #EAB308;
  }

  .alert_custom .list .item::after {
    content: "";
    position: absolute;
    width: 0;
    height: var(--line-height);
    background: #fff;
    bottom: 0;
    left: 0;
    animation: line 3s linear;
  }

  /* icon */
  .alert_custom .list .icon {
    flex: none;
    display: block;
    width: 40px;
    height: 40px;
  }

  .alert_custom .list .icon svg {
    width: 100%;
    height: 100%;
  }

  /* title */
  .alert_custom .list .title {
    min-width: 0;
    flex-grow: 1;
    margin-left: .5rem;
  }

  .alert_custom .list .title h6 {
    width: 100%;
    font-family: Arial, Helvetica, sans-serif !important;
    font-size: 14px !important;
    color: inherit !important;
    font-weight: bold;
    line-height: 1.5;
    margin: 0;
  }

  .alert_custom .list .title p {
    width: 100%;
    font-family: Arial, Helvetica, sans-serif !important;
    font-size: 12px !important;
    color: inherit !important;
    margin: 0rem !important;
    line-height: 1.5;
  }

  /* transiton */
  .transition_all {
    transition: all .3s ease-in-out;
  }

  .enter_start {
    transform: scale(0);
    opacity: 0;
  }

  .enter_end {
    transform: scale(1);
    opacity: 1;
  }

  .leave_start {
    transform: translateX(0);
    opacity: 1;
  }

  .leave_end {
    transform: translateX(100%);
    opacity: 0;
  }

  @keyframes line {
    from {
      width: 0;
    }

    to {
      width: 100%;
    }
  }

</style>
@endsection

@section('content')
<div x-data="alert" class="alert_custom">
  <div class="list">
    <template x-for="item in list" :key="item.id">
      <div class="item" x-show="item.show" x-transition:enter="transition_all" x-transition:enter-start="enter_start" x-transition:enter-end="enter_end" x-transition:leave="transition_all" x-transition:leave-start="leave_start" x-transition:leave-end="leave_end" :class="item.type">
        <span class="icon">
          <template x-if="item.type == 'success'">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" style="fill: currentColor">
              <path d="m10 15.586-3.293-3.293-1.414 1.414L10 18.414l9.707-9.707-1.414-1.414z"></path>
            </svg>
          </template>
          <template x-if="item.type == 'error'">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" style="fill: currentColor">
              <path d="M11.953 2C6.465 2 2 6.486 2 12s4.486 10 10 10 10-4.486 10-10S17.493 2 11.953 2zM12 20c-4.411 0-8-3.589-8-8s3.567-8 7.953-8C16.391 4 20 7.589 20 12s-3.589 8-8 8z"></path>
              <path d="M11 7h2v7h-2zm0 8h2v2h-2z"></path>
            </svg>
          </template>
        </span>
        <div class="title">
          <h6 class="truncate" x-text="item.title"></h6>
          <p x-text="item.body"></p>
        </div>
      </div>
    </template>
  </div>
</div>
<!-- Single Page Header start -->
<div class="container-fluid page-header py-5">
  <h1 class="text-center text-white display-6 p-5">Shop</h1>
</div>
<!-- Single Page Header End -->


<!-- Fruits Shop Start-->
<div x-data="shop" class="container-fluid fruite py-5">
  <div class="container py-5">
    <h1 class="mb-4">Welcome to {{ Voyager::setting('site.title') }} ❤</h1>
    <div class="row g-4">
      <div class="col-lg-12">
        <div class="row g-4">
          <div class="col-xl-3">
            <div class="input-group w-100 mx-auto d-flex">
              <input type="search" class="form-control p-3" placeholder="keywords" aria-describedby="search-icon-1" x-model="keywords" @input="searchItem">
              <span id="search-icon-1" class="input-group-text p-3"><i class="fa fa-search"></i></span>
            </div>
          </div>
          <div class="col-6"></div>
          <div class="col-xl-3">
            <div class="bg-light ps-3 py-3 rounded d-flex justify-content-between mb-4">
              <label for="fruits">Price Sorting:</label>
              <select id="fruits" name="fruitlist" class="border-0 form-select-sm bg-light me-3" form="fruitform" @change="sortFruits">
                <option value="highToLow">High to Low</option>
                <option value="lowToHigh">Low to High</option>
              </select>
            </div>
          </div>
        </div>
        <div class="row g-4">
          <div class="col-lg-3">
            <div class="row g-4">
              <div class="col-lg-12">
                <div class="mb-3">
                  <h4>Categories</h4>
                  <ul class="list-unstyled fruite-categorie">
                    <li>
                      <div class="d-flex justify-content-between fruite-name">
                        <a href="#" @click.prevent="category(0)">
                          All
                        </a>
                        <span>({{ $products->count() }})</span>
                      </div>
                    </li>
                    @foreach ($categories as $category)
                    <li>
                      <div class="d-flex justify-content-between fruite-name">
                        <a href="#" @click.prevent="category({{ $category->id }})">
                          {{ $category->name }}
                        </a>
                        <span>
                          @php
                          $category_number = $products->where('category_id', $category->id)->count();
                          @endphp
                          ({{ $category_number }})
                        </span>
                      </div>
                    </li>
                    @endforeach
                  </ul>
                </div>
              </div>
              <div class="col-lg-12">
                <div class="mb-3">
                  <h4 class="mb-2">Price Limit</h4>
                  <input type="range" class="form-range w-100" id="rangeInput" name="rangeInput" min="0" max="500000" x-model="price" @change="priceLimit($event.target.value)" step="1000">
                  <output id="amount" name="amount" for="rangeInput" x-text="formatPrice(price,1)"></output>
                </div>
              </div>
              <div class="col-lg-12">
                <h4 class="mb-3">Featured products</h4>
                @foreach ($featured_products as $featured_product)
                <div class="d-flex align-items-center justify-content-start mb-1">
                  <div class="rounded me-4" style="width: 100px; height: 100px;">
                    <img src="{{ Voyager::image($featured_product->image) }}" class="img-fluid rounded" alt="">
                  </div>
                  <div>
                    <h6 class="mb-2">{{ $featured_product->name }}</h6>
                    <div class="d-flex mb-2">
                      <i class="fa fa-star text-secondary"></i>
                      <i class="fa fa-star text-secondary"></i>
                      <i class="fa fa-star text-secondary"></i>
                      <i class="fa fa-star text-secondary"></i>
                      <i class="fa fa-star text-secondary"></i>
                    </div>
                    <div class="d-flex mb-2">
                      <h5 class="fw-bold me-2">{{ $featured_product->price }}</h5>
                    </div>
                  </div>
                </div>
                @endforeach
              </div>
              <div class="col-lg-12">
                <div class="position-relative">
                  <img src="img/banner-fruits.jpg" class="img-fluid w-100 rounded" alt="">
                  <div class="position-absolute" style="top: 50%; right: 10px; transform: translateY(-50%);">
                    <h3 class="text-secondary fw-bold">Fresh <br> Fruits <br> Banner</h3>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-9">
            <div class="row g-4 justify-content-center">
              <template x-for="(product, index) in filteredProducts" :key="index">
                <div class="col-md-6 col-lg-6 col-xl-4">
                  <div class="rounded position-relative fruite-item">
                    <div class="fruite-img">
                      <img :src="getImage(product.image)" class="img-fluid w-100 rounded-top" :alt="product.name" style="height:260px;object-fit: cover">
                    </div>
                    <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;" x-text="getCategory(product.category_id)"></div>
                    <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                      <h4 x-text="product.name"></h4>
                      <p x-text="product.desc"></p>
                      <div class="d-flex justify-content-between flex-lg-wrap">
                        <p class="text-dark fs-5 fw-bold mb-0" x-text="formatPrice(product.price,product.count)"></p>
                        <span class="d-flex flex-row  justify-content-between w-100">
                          <span class="d-flex flex-col">
                            <button class="btn border border-secondary rounded-pill px-3 text-primary" @click="up(index)">+</button>

                            <input type="number" class="border border-secondary rounded-pill text-primary mx-1" x-model="product.count" style="width:60px;text-align:center !important;">

                            <button class="btn border border-secondary rounded-pill px-3 text-primary" @click="down(index)">-</button>
                          </span>
                          <a href="#" @click.prevent="submit(index,product.count);$store.cart.update()" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag text-primary"></i>
                          </a>
                        </span>
                      </div>
                    </div>
                  </div>
                </div>
              </template>
              <div class="col-12">
                <div class="pagination d-flex justify-content-center mt-5">
                  <a href="#" class="rounded">&laquo;</a>
                  <a href="#" class="active rounded">1</a>
                  <a href="#" class="rounded">2</a>
                  <a href="#" class="rounded">3</a>
                  <a href="#" class="rounded">4</a>
                  <a href="#" class="rounded">5</a>
                  <a href="#" class="rounded">6</a>
                  <a href="#" class="rounded">&raquo;</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- Fruits Shop End-->
@endsection

@section('js')
<script>
  document.addEventListener('alpine:init', () => {
    Alpine.data('alert', () => ({
      index: 0
      , list: []
      , init() {
        // this.addAlert({body: 'dsa'})
        let alert = JSON.parse(`@json(session()->get('alert'))`)

        if (alert) {
          this.addAlert(alert);
          localStorage.clear(); //Custom
        }
      }
      , addAlert(alert) {
        this.list = [...JSON.parse(JSON.stringify(this.list)), {
          id: ++this.index
          , type: alert.type
          , title: alert.title
          , body: alert.body
          , show: false
        }]

        this.$nextTick(() => {
          this.list[this.index - 1].show = true
        })

        setTimeout(() => {
          this.list[this.index - 1].show = false
        }, 3000);
      }
    }));

    Alpine.data('shop', () => ({
      products: []
      , categories: []
      , price: 500000
      , keywords: ''
      , category_id: 0,

      init() {
        this.products = @json($products).data.map(product => {
          return {
            ...product
            , count: 0
          };
        });

        this.$watch('products', (value) => {
          value.forEach((product, index) => {
            if (product.count < 0) {
              this.products[index].count = 0;
            }
          });
        });

        this.categories = @json($categories);

        // console.log(this.products);
        // console.log(this.categories);
      },


      //GetCategoryProduct
      getCategory(id) {
        let category = this.categories.find(category => category.id === id);
        if (category) {
          // console.log(category.name);
          return category.name;
        }
        return null;
      },


      //GetImageProduct
      getImage(image) {
        return `{{ Voyager::image('/') }}${image}`;
      },


      //Counter
      up(index) {
        this.products[index].count++;
      }
      , down(index) {
        if (this.products[index].count > 0)
          this.products[index].count--;
      },


      // SortProduct
      sortFruits(event) {
        let selectedOption = event.target.value;
        if (selectedOption === 'highToLow') {
          this.hightolow();
        } else if (selectedOption === 'lowToHigh') {
          this.lowtohigh();
        }
      }
      , lowtohigh() {
        this.products.sort((a, b) => parseFloat(a.price) - parseFloat(b.price));
        // console.log(this.products);
      }
      , hightolow() {
        this.products.sort((a, b) => parseFloat(b.price) - parseFloat(a.price));
      },


      //PriceLimitToBeShow
      priceLimit(value) {
        this.price = value;
      },


      //Get searchItem
      searchItem() {
        this.keywords = this.keywords.toLowerCase();
      },

      //Get Category
      category(id) {
        this.category_id = id;
      },

      //Filter by Price and Search and Category
      get filteredProducts() {
        return this.products
          .filter(product => parseFloat(product.price) <= this.price)
          .filter(product =>
            this.keywords === '' ||
            product.name.toLowerCase().includes(this.keywords)
          )
          .filter(product =>
            this.category_id == 0 || product.category_id == this.category_id
          );
      },

      //Submit and save in localStorage
      submit(index) {
        const product = this.products[index];
        product.count = parseInt(product.count);

        let productsInCart = JSON.parse(localStorage.getItem('productsInCart')) || [];

        // Find if the product already exists in the cart
        let existingProduct = productsInCart.find(p => p.id === product.id);

        if (existingProduct) {
          // Increment the count
          existingProduct.count += product.count;
        } else {
          // Add new product with count
          productsInCart.push({
            id: product.id
            , image: this.getImage(product.image)
            , name: product.name
            , price: product.price
            , count: product.count
          });
        }

        // Save the updated array back to localStorage
        localStorage.setItem('productsInCart', JSON.stringify(productsInCart));
      },

      formatPrice(price, count) {
        if (count == 0) {
          return new Intl.NumberFormat('vi-VN', {
            style: 'currency'
            , currency: 'VND'
          }).format(price);
        } else {
          let totalPrice;
          totalPrice = price * count;
          return new Intl.NumberFormat('vi-VN', {
            style: 'currency'
            , currency: 'VND'
          }).format(totalPrice);
        }
      }
    }));
  });

</script>
@endsection
