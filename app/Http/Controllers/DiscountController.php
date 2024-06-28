<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Discount;

class DiscountController extends Controller
{
    public function checkCode(Request $request)
    {
        $coupon = Discount::where('name', $request->name)->first();
        // dd($coupon);

        if (!empty($coupon)) {
            return view('frontend.cart', compact('coupon'));
        }

        $message = "Coupon code not found";
        return redirect()->route('cart')->with('message', $message);
    }
}
