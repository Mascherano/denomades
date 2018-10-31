<?php
	namespace App\Models;
	use Illuminate\Database\Eloquent\Model;

	class Booking extends Model{
		protected $table = 'bookings';
		protected $fillable = ['activity_id', 'date', 'people_number', 'total_price'];
	}