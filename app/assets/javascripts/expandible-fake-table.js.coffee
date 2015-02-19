$ ->
  if $('.expansible-fake-table').length
    $('.expansible-fake-table section .col.toggle').on 'click', ->
      $section = $(this).closest('section')
      $section.find('.panel-collapse').collapse('toggle')