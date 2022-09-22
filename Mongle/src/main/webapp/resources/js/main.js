/**
 * 
 */

let h1_1 = document.querySelector("#h1")
let h1_2 = document.querySelector("#st_text1")
let h1_3 = document.querySelector("#btn_a")
let	h2_1 = document.querySelector("#h2")
let h2_2 = document.querySelector(".st1")
let h2_3 = document.querySelector("#btn_a1")
	window.addEventListener("scroll",function(){
		
		let value = window.scrollY;
		console.log("scrollY",value);
		
		if(300< value && value<1300){// 700~2100
			h1_1.style.animation = "slidein 2s ease-out";
			h1_2.style.animation = "slidein 2s ease-out";
			h1_3.style.animation = "slidein 2s ease-out";
		}else if(1301 < value && value<3000){// 2101~3000

			h2_1.style.animation = "slidein 2s ease-out";
			h2_2.style.animation = "slidein 2s ease-out";
			h2_3.style.animation = "slidein 2s ease-out";
			
		}
		else{
			h1_1.style.animation ="disappear 2s ease-out forwards";
			h1_2.style.animation ="disappear 2s ease-out forwards";
			h1_3.style.animation ="disappear 2s ease-out forwards";
			h2_1.style.animation ="disappear 2s ease-out forwards";
			h2_2.style.animation ="disappear 2s ease-out forwards";
			h2_3.style.animation ="disappear 2s ease-out forwards";
		}
	});
	let pt = document.querySelector("#s_pt")
	let pt1 = document.querySelector("#s_pt1")
	window.addEventListener("scroll",function(){
		let value = window.scrollY;
		
		if(300 < value && value<1300){
			pt.style.animation = "slidein_pt 2s ease-out";
		}else if(1301 < value && value<3000){
			pt1.style.animation = "slidein_pt 2s ease-out";
		}else{
			pt.style.animation ="disappear_pt 2s ease-out forwards";
			pt1.style.animation ="disappear_pt 2s ease-out forwards";
		}
	})
