$(document).ready(function(){
    $("#step-one").on("click",function(e){
        e.preventDefault();
        $(".first-step-book").fadeOut(400,function(){
            $(".second-step-book").fadeIn();    
        });
        

    });
    
});