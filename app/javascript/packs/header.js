$(document).on('turbolinks:load', function() {
  const profileIcon = $('.header .profileIcon');
  const profileModal = $('.profileModal');
  const hamburger = $('.hamburger');
  const membershipHeader = $('.membershipHeader');
  const headerSideMenu = $('.sideMenu');
  const content = $('.openItem__wrapper');
  const inputFormIndex = $('.inputFormIndex');

  profileIcon.hover(
    () => {
      if (!hamburger.hasClass('show')) {
        profileModal.removeClass('none');
      }
    },
    () => {
      if (!hamburger.hasClass('show')) {
        profileModal.addClass('none');
      }
    },
  );

  const removeHamburgerClass = () => {
    inputFormIndex.removeClass('none');

    // home
    headerSideMenu.removeClass('show');
    content.unwrap();
    $('.overlay__background').remove();

    membershipHeader.removeClass('show');
    hamburger.removeClass('show');
    hamburger.children().removeClass('show');
  };

  const addHamburgerClass = () => {
    inputFormIndex.addClass('none');

    // home
    headerSideMenu.addClass('show');
    content.wrapAll('<div class="overlay"></div>');
    content.before('<div class="overlay__background"></div>');

    membershipHeader.addClass('show');
    hamburger.addClass('show');
    hamburger.children().addClass('show');
  };

  hamburger.on('click', () => {
    if (!hamburger.hasClass('show')) {
      addHamburgerClass();
    } else {
      removeHamburgerClass();
    }
  });

  $(window).resize(() => {
    if ($(window).width() > 768 && hamburger.hasClass('show')) {
      removeHamburgerClass();
    }
  });
});
