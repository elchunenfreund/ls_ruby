$(function() {

  $("form.delete").submit(function(event) {
    event.preventDefault();
    event.stopPropagation();

    var ok = confirm("Are you sure this can not be undone!");
    if (ok) {
      this.submit();
    }
  });

});
