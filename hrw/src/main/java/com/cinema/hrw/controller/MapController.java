<<<<<<< HEAD
package com.cinema.hrw.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MapController {
	
	@GetMapping("/map")
	public String map() {
		return "map";
	}

}
=======
package com.cinema.hrw.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MapController {
	
	@GetMapping("/map")
	public String map() {
		return "map";
	}

}
>>>>>>> 03b06105d6f9e96da199e74b8d3458d69e5fafb9
