<template>
  <transition name="modal">
    <div id="new-account-mordal" class="myModal" tabindex="-1" >
      <div class="modal__mask">
        <div class="modal__wrapper">
          <div class="modal__container">
            <div class="modal__header">
              <slot name="header">
              </slot>
            </div>
            <div class="modal__body">
              <slot name="body">
              </slot>
            </div>
            <div class="modal__footer">
              <slot name="footer">
              </slot>
            </div>
          </div>
        </div>
      </div>
    </div>
  </transition>
</template>

<script>
  import modal from './modal';

  export default modal;
</script>
