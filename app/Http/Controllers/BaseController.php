<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\ProductCategory;
use App\Product;
use App\Order;
use App\OrdersDetail;
use Illuminate\Support\Arr;

use function PHPUnit\Framework\isNull;

class BaseController extends Controller
{
    public function shop()
    {
        $categories = ProductCategory::get();
        $products = Product::paginate(9);

        $featured_products = Product::limit(5)->inRandomOrder()->get();
        return view('frontend.shop', compact('categories', 'products', 'featured_products'));
    }

    public function cart()
    {
        return view('frontend.cart');
    }

    public function checkout(Request $request)
    {
        $data = $request->validate([
            'name' => 'required|max:255',
            'email' => 'required|email',
            'phone' => 'required|digits_between:10,13',
            'address' => 'required|max:255',
            'orders' => 'required'
        ], [
            'name.required' => 'Tên là bắt buộc.',
            'name.max' => 'Không quá 255 ký tự.',
            'email.required' => 'Email là bắt buộc.',
            'email.email' => 'Email không hợp lệ.',
            'phone.required' => 'Số điện thoại là bắt buộc.',
            'phone.digits_between' => 'Dài từ 10 đến 13 số.',
            'address.required' => 'Địa chỉ là bắt buộc.',
            'address.max' => 'Địa Không quá 255 ký tự.',
            'orders.required' => 'Chưa đặt hàng.'
        ]);

        $data['SubPrice'] = $request->SubPrice;
        $data['totalPrice'] = $request->totalPrice;

        Arr::forget($data, 'orders');

        $orders = json_decode($request->orders);

        $coupon = json_decode($request->coupon);

        if ($coupon != 'null') {
            $data['coupon'] = $coupon->name;
        } else {
            $data['coupon'] = "Không dùng mã giảm giá";
        }

        $user_order = Order::create($data);
        $order_id = $user_order->id;

        foreach ($orders as $order) {
            OrdersDetail::create([
                'order_id' => $order_id,
                'product_id' => $order->product_id,
                'number' => $order->number,
                'product_name' => $order->product_name,
                'product_price' => $order->product_price,
                'product_image' => $order->product_image
            ]);
        }

        $alert = [
            "type" => "success",
            "title" => __("Thành công"),
            "body" => __("Cảm ơn bạn đã đặt hàng, chúng tôi sẽ sớm phản hồi cho bạn!")
        ];

        return redirect()->route('shop.view')->with('alert', $alert);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
