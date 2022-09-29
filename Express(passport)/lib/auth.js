module.exports = {
  isOwner: function (request, response) {
    if (request.user) {
      return true;
    } else {
      return false;
    }
  },
  statusUI: function (request, response) {
    var authStatusUI = `
    <a href="/auth/login">Login</a> | 
    <a href="/auth/register">Register</a>
    <a href="/auth/google">
      <img src="/images/googlelogin.jpg" style="width:250px; display:block; margin-top:20px; margin-left:12px;">
    </a>
    <a href="/auth/facebook">
      <img src="/images/facebooklogin.png" style="width:273px; display:block;">
    </a>
    `;
    if (this.isOwner(request, response)) {
      authStatusUI = `${request.user.displayName} | <a href="/auth/logout">logout</a>`;
    }
    return authStatusUI;
  },
};
