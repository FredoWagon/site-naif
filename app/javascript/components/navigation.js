const isActive =() => {
    let currentRoute = this.router.currentRouteName;
    let isRouteActive = {};
    for (let route of ['players', 'tournaments', 'games']) {
      isRouteActive[route] = currentRoute.includes(route);
    }
    return isRouteActive;
  }
