<template>
    <header class="header-login">
        <div class="main-container">
            <div class="row">
                <div class="header-login__logo">
                    <router-link to="/">
                        APS
                    </router-link>
                </div>
            </div>
        </div>
    </header>
</template>
<style lang="scss" scoped>
.header-login {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    z-index: 2;
    padding: 35px 0;

    &__logo {
        a {
            color: #fff;
            text-decoration: none;
            font-weight: bold;
        }
    }
}
</style>
