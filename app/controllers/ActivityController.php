<?php
	namespace App\Controllers;
	use App\Controllers\BaseController;
	use App\Models\Activity;

	class ActivityController extends BaseController{
		public function getIndex($id){
			$activity = Activity::where('id', $id)->get();

			return $this->render('activities.twig', ['activity' => $activity]);
		}
	}