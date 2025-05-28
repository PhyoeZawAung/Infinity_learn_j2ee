    <div id="layoutSidenav">
        <div id="layoutSidenav_nav">
            <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                <div class="sb-sidenav-menu">
                    <div class="nav">
                        <div class="sb-sidenav-menu-heading">Menu</div>
                        <a class="nav-link ${active_nav == 'dashboard' ? 'active': ''}" href="/dashboard">
                            <div class="sb-nav-link-icon"><i class="bi bi-columns-gap"></i></div>
                            Dashboard
                        </a>
                        <a class="nav-link ${active_nav == 'application' ? 'active': ''}" href="/admin/admin-apply-teacher">
                            <div class="sb-nav-link-icon"><i class="bi bi-folder"></i></div>
                            Applications
                        </a>
    
                        <a class="nav-link ${active_nav == 'chat' ? 'active': ''}" href="/chat/list">
                            <div class="sb-nav-link-icon"><i class="bi bi-chat-left-dots"></i></i></div>
                            Messages
                        </a>
                    </div>
                </div>
                <div class="sb-sidenav-footer">
                    <div class="small">Logged in as:</div>
                    ${auth_user.firstName} ${auth_user.lastName}
                </div>
            </nav>
        </div>
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">