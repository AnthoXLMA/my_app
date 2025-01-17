// Handle the form submission
document.getElementById('dance-form').addEventListener('submit', function (e) {
  e.preventDefault();  // Prevent default form submission

  // Get all selected checkboxes
  const selectedDances = Array.from(document.querySelectorAll('input[name="dance"]:checked'))
    .map(checkbox => checkbox.value);

  const dancesListElement = document.getElementById('dances-list');
  const selectedDancesSection = document.getElementById('selected-dances');

  // Clear the list before displaying the new selection
  dancesListElement.innerHTML = '';

  // Check if at least one dance is selected
  if (selectedDances.length > 0) {
    selectedDances.forEach(dance => {
      const li = document.createElement('li');
      li.textContent = dance;
      dancesListElement.appendChild(li);
    });

    selectedDancesSection.style.display = 'block';  // Show the selected dances section
  } else {
    selectedDancesSection.style.display = 'none';  // Hide if no dances are selected
  }
});
