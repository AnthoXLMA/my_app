document.addEventListener('DOMContentLoaded', function() {
    // Initialize the array to store selected dances
    var selectedDances = [];

    // Select all checkboxes
    var danceCheckboxes = document.querySelectorAll('.dance-checkbox input[type="checkbox"]');

    // Listen for clicks on checkboxes
    danceCheckboxes.forEach(function(checkbox) {
        checkbox.addEventListener('change', function() {
            var danceId = this.value;  // Get the id of the dance selected

            if (this.checked) {
                // If checked, add the dance to the array
                selectedDances.push(danceId);
            } else {
                // If unchecked, remove the dance from the array
                var index = selectedDances.indexOf(danceId);
                if (index > -1) {
                    selectedDances.splice(index, 1);
                }
            }

            // Optionally, display the selected dances for debugging
            console.log("Selected Dances:", selectedDances);

            // Update a hidden input field or a data attribute to send the selected dances when the form is submitted
            var selectedDancesInput = document.getElementById('user_selected_dances');
            selectedDancesInput.value = selectedDances.join(',');  // Store selected dance IDs as a comma-separated list
        });
    });
});
