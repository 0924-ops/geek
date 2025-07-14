// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
document.querySelectorAll('.parent').forEach(parent => {
    parent.addEventListener('change', function () {
      const group = parent.dataset.group;
      const checked = parent.checked;
      document.querySelectorAll('.child.' + group).forEach(child => {
        child.checked = checked;
      });
    });
  });
