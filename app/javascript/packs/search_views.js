$(document).ready(function () {
  videojs("player-id").ready(function () {
    let my_player = this;
    my_player.bigPlayButton.on('click', function(){
      if (document.querySelectorAll(".embed-responsive")) {
        let id_video = document.querySelectorAll(".embed-responsive")[0].id
        get_views_videos(id_video)
      }
    });
  });
});

const get_views_videos = id_video => {
  $.ajax({
    url: `/videos/${id_video}/count_views`,
    type: 'POST',
    success: data => {},
    error: data => alert("Não foi possível carregar o video")
  });
}