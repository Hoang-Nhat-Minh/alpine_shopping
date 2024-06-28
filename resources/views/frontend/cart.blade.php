@extends('layout.main')

@section('css')
@endsection

@section('content')
<!-- Single Page Header start -->
<div class="container-fluid page-header py-5">
  <h1 class="text-center text-white display-6 p-5">Cart</h1>
</div>
<!-- Single Page Header End -->


<!-- Cart Page Start -->
<div class="container-fluid py-5" x-data="checkout">
  <div class="container py-5">
    <div class="table-responsive">
      <table class="table">
        <thead>
          <tr>
            <th scope="col">Products</th>
            <th scope="col">Name</th>
            <th scope="col">Price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Total</th>
            <th scope="col">Handle</th>
          </tr>
        </thead>
        <tbody>
          <template x-for="(product, index) in productsInCart" :key="index">
            <tr>
              <th scope="row">
                <div class="d-flex align-items-center">
                  <img :src="product.image" :alt="product.name" class="img-fluid me-5 rounded-circle" style="width: 80px; height: 80px;">
                </div>
              </th>
              <td>
                <p class="mb-0 mt-4" x-text="product.name"></p>
              </td>
              <td>
                <p class="mb-0 mt-4" x-text="formatPrice(product.price,1)"></p>
              </td>
              <td>
                <div class="input-group quantity mt-4" style="width: 100px;">
                  <div class="input-group-btn">
                    <button class="btn btn-sm btn-minus rounded-circle bg-light border" @click="down(index);$store.cart.update()">
                      <i class=" fa fa-minus"></i>
                    </button>
                  </div>
                  <span class="text-center border-0 p-1" x-text="product.count"></span>
                  <div class="input-group-btn">
                    <button class="btn btn-sm btn-plus rounded-circle bg-light border" @click="up(index);$store.cart.update()">
                      <i class=" fa fa-plus"></i>
                    </button>
                  </div>
                </div>
              </td>
              <td>
                <p class="mb-0 mt-4" x-text="formatPrice(product.price,product.count)"></p>
              </td>
              <td>
                <button class="btn btn-md rounded-circle bg-light border mt-4" @click="remove(index)">
                  <i class="fa fa-times text-danger"></i>
                </button>
              </td>
            </tr>
          </template>
        </tbody>
        <template x-if="productsInCart.length === 0">
          <h2 class="mt-3 text-center">Nothing in your cart</h2>
        </template>
      </table>
    </div>
    <div class="mt-5">
      <form action="{{ route('check.coupon') }}" method="post">
        @csrf

        @if(isset($coupon))
        <div class="border border-primary rounded-pill px-4 py-3 text-primary" style="width:fit-content">Apply Success</div>
        @elseif(session()->has('message'))
        <style>
          ::placeholder {
            color: red;
            opacity: 1;
          }

          ::-ms-input-placeholder {
            color: red;
          }

        </style>
        <input type="text" name="name" class="border-0 border-bottom rounded me-5 py-3 mb-4" placeholder="Code not found" required="PLease enter the code" style="color:red">
        <button type="submit" class="btn border-secondary rounded-pill px-4 py-3 text-primary">Apply Coupon</button>
        @else
        <input type="text" name="name" class="border-0 border-bottom rounded me-5 py-3 mb-4" placeholder="Coupon Code" required="PLease enter the code">
        <button type="submit" class="btn border-secondary rounded-pill px-4 py-3 text-primary">Apply Coupon</button>
        @endif
      </form>
    </div>
    <form action="{{ route('checkout') }}" method="POST" class="row mt-3" onsubmit="submit()">
      @csrf

      @if($errors->any())
      <style>
        ::placeholder {
          color: red !important;
          opacity: 1;
        }

        ::-ms-input-placeholder {
          color: red !important;
        }

      </style>
      @endif

      <div class="col-sm-12 col-md-7 col-lg-6">
        <div class="mb-3">
          <label for="name" class="form-label">Họ và tên</label>

          @if($errors->has('name'))
          <input type="text" class="form-control" id="name" name="name" placeholder="{{ $errors->first('name') }}">
          @else
          <input type="text" class="form-control" id="name" name="name" placeholder="Họ và tên" value="{{ old('name') }}">
          @endif
        </div>

        <div class="mb-3">
          <label for="email" class="form-label">Email</label>
          @if($errors->has('email'))
          <input type="email" class="form-control" id="email" name="email" placeholder="{{ $errors->first('email') }}">
          @else
          <input type="email" class="form-control" id="email" name="email" placeholder="Email" value="{{ old('email') }}">
          @endif
        </div>

        <div class="mb-3">
          <label for="phone" class="form-label">Số điện thoại</label>
          @if($errors->has('phone'))
          <input type="text" class="form-control" id="phone" name="phone" placeholder="{{ $errors->first('phone') }}">
          @else
          <input type="text" class="form-control" id="phone" name="phone" placeholder="Số điện thoại" value="{{ old('phone') }}">
          @endif
        </div>

        <div class="mb-3">
          <label for="address" class="form-label">Địa chỉ</label>
          @if($errors->has('address'))
          <input type="text" class="form-control" id="address" name="address" placeholder="{{ $errors->first('address') }}">
          @else
          <input type="text" class="form-control" id="address" name="address" placeholder="Địa chỉ" value="{{ old('address') }}">
          @endif
        </div>
      </div>
      <div class="col-sm-12 col-md-5 col-lg-6">
        <div class="bg-light rounded">
          <div class="p-4">
            <h1 class="display-6 mb-4">Cart <span class="fw-normal">Total</span></h1>
            <div class="d-flex justify-content-between mb-4">
              <h5 class="mb-0 me-4">Subtotal:</h5>
              <p class="mb-0" x-text="subTotalPrice()"></p>
              <input type="hidden" name="SubPrice" :value="subTotalPriceNotFormat()">
            </div>
            <div class="d-flex justify-content-between">
              <h5 class="mb-0 me-4">Coupon</h5>
              <div class="">
                <p class="mb-0" x-text="displayCoupon()"></p>
                @if(isset($coupon))
                <input type="hidden" name="coupon" x-model="coupon.name">

                @else
                <input type="hidden" name="coupon" value="0">
                @endif
              </div>
            </div>
          </div>
          <div class="py-4 mb-4 border-top border-bottom d-flex justify-content-between">
            <h5 class="mb-0 ps-4 me-4">Total</h5>
            <p class="mb-0 pe-4" x-text="total()"></p>
            <input type="hidden" name="totalPrice" :value="totalNotFormat()">
            <input type="hidden" name="orders" :value="getCartItems()">
            <input type="hidden" name="coupon" :value="getCoupon()">
          </div>
          <button class="btn border-secondary rounded-pill px-4 py-3 text-primary text-uppercase mb-4 ms-4" type="submit">Gửi đơn</button>
        </div>
      </div>
    </form>
  </div>
</div>

@php
if (!isset($coupon)) {
$coupon = 'null';
}
@endphp

<script>
  document.addEventListener('alpine:init', () => {
    Alpine.data('checkout', () => ({
      productsInCart: [],

      coupon: {},

      init() {
        this.productsInCart = JSON.parse(localStorage.getItem('productsInCart') || '[]');
        this.coupon = @json($coupon);

        // console.log(this.productsInCart);
        // this.productsInCart.forEach(i => {
        // console.log(i);
        // });

        // CheckNumberInCart
        this.$watch('productsInCart', (i) => {
          i.forEach((product, index) => {
            if (product.count < 1) {
              this.products[index].count = 1;
            }
          });
        });
      },

      getCartItems() {
        const data = this.productsInCart.map((product) => ({
          product_id: product.id,


          product_name: product.name,

          number: product.count,

          product_price: product.price,

          product_image: product.image
        }));

        // console.log(JSON.stringify(data));
        return JSON.stringify(data);
      },

      getCoupon() {
        // console.log(JSON.stringify(this.coupon));
        return JSON.stringify(this.coupon);
      },

      //Counter
      up(index) {
        this.productsInCart[index].count++;
        this.saveCurrentItem(index);
      },

      down(index) {
        if (this.productsInCart[index].count > 1)
          this.productsInCart[index].count--;
        this.saveCurrentItem(index);
      },

      //Delete items in Cart
      remove(index) {
        console.log("Deleting item at index", index);
        this.productsInCart.splice(index, 1);
        this.saveCurrentItem(index);
        console.log("Item deleted successfully");
      },

      saveCurrentItem(index) {
        localStorage.setItem('productsInCart', JSON.stringify(this.productsInCart));
        // console.log('Cart Checkout');
      },

      subTotalPrice() {
        return this.formatPrice(this.productsInCart.reduce((total, product) => total + (product.price * product.count), 0), 1);
      },

      subTotalPriceNotFormat() {
        return this.productsInCart.reduce((total, product) => total + (product.price * product.count), 0);
      },

      total() {
        if (this.coupon.type === 1) {
          // console.log('type 1');
          let discountAmount = (this.subTotalPriceNotFormat() * this.coupon.amount) / 100;
          // console.log(discountAmount);
          return this.formatPrice((this.subTotalPriceNotFormat() - discountAmount), 1);
        } else if (this.coupon.type === 2) {
          // console.log('type 2');
          let totalAfterDiscount = this.subTotalPriceNotFormat() - this.coupon.amount;

          if (totalAfterDiscount < 0) {
            return this.formatPrice(0, 0);
          }

          return this.formatPrice(totalAfterDiscount, 1);
        } else {
          return this.subTotalPrice();
        }
      },

      totalNotFormat() {
        if (this.coupon.type === 1) {
          let discountAmount = (this.subTotalPriceNotFormat() * this.coupon.amount) / 100;
          return this.subTotalPriceNotFormat() - discountAmount;
        } else if (this.coupon.type === 2) {
          let totalAfterDiscount = this.subTotalPriceNotFormat() - this.coupon.amount;

          if (totalAfterDiscount < 0) {
            return 0;
          }

          return totalAfterDiscount;
        } else {
          return this.subTotalPriceNotFormat();
        }
      },

      displayCoupon() {
        if (this.coupon.type == 1) {
          // console.log('type 1 display');
          return this.coupon.amount + "%";
        } else {
          // console.log('type 2 display');
          // console.log(this.formatPrice(this.coupon.amount));
          return this.formatPrice(this.coupon.amount, 0);
        }
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
      },

    }))
  });

</script>

@endsection
