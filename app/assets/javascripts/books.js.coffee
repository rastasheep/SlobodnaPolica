# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


jQuery =>
     $('#content').infinitescroll
        navSelector  : "div.pager",            
        nextSelector : "a.next_page",    
        itemSelector : "#content div.book",
        loading: 
          finished: undefined,
          finishedMsg: null,
          img: "",
          msg: null,
          msgText: '<div class="row"><div class="progress progress-striped span4 offset4"><div class="bar" style="width: 50%;"></div></div></div>',
          selector: null,
          speed: 'fast',
          start: undefined
