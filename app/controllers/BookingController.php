<?php
	namespace App\Controllers;
	use App\Controllers\BaseController;
	use App\Models\Booking;
	use Sirius\Validation\Validator;

	class BookingController extends BaseController{
		public function getIndex($result = false){
			$message = false;

			$bookings = Booking::query()->orderBy('id', 'desc')->get();
			if($result){
				$message = true;
				return $this->render('booking.twig', [
					'bookings' => $bookings,
					'message' => $message
				]);
			}
			return $this->render('booking.twig', [
				'bookings' => $bookings
			]);
		}

		public function anyCreate(){
			$errors = [];
			$result = false;

			$validator = new Validator();

			$validator->add('fechaReserva', 'required');
			$validator->add('cantPersonas', 'required | number');
			$validator->add('idActivity', 'required | number');
			$validator->add('price', 'required | number');

			if(isset($_POST)){
				if($validator->validate($_POST)){
					$total_price = $_POST['price'] * $_POST['cantPersonas'];
				
					$newBooking = new Booking([
		                'activity_id' => (int)$_POST['idActivity'],
		                'date' => $_POST['fechaReserva'],
		                'people_number' => (int)$_POST['cantPersonas'],
		                'total_price' => $total_price
		            ]);

		            if($newBooking->save()){
		            	$result = true;
		            	return $this->getIndex($result);
		            }else{
		            	return $this->getIndex($result);
		            }

		            
				}else{
					$errors = $validator->getMessages();
					return $this->render('booking.twig', ['errors' => $errors]);
				}
			}else{
				return $this->getIndex($result);
			}
			
		}
	}