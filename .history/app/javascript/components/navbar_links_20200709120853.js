const navbarLinks = () => {
  $(document).ready(function() {
    $( ".mr-auto .nav-item" ).bind( "click", function(event) {
        event.preventDefault();
        const clickedItem = $( this );
        $( ".mr-auto .nav-item" ).each( function() {
            $( this ).removeClass( "active" );
        });
        clickedItem.addClass( "active" );
    });
});
};

export { navbarLinks };