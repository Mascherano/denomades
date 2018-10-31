<?php
	namespace App\Controllers;
	use App\Controllers\BaseController;
	use App\Models\Activity;

	class IndexController extends BaseController{
		public function getIndex(){
			$activities = Activity::query()->orderBy('id', 'desc')->get();
			return $this->render('index.twig', ['activities' => $activities]);
		}
	}