<script lang="ts">
    import { Receive, Send } from '@enums/events';
    import { VISIBLE, CONFIG } from '@stores/stores';
    import { ReceiveEvent, SendEvent } from '@utils/eventsHandlers';
    import { onMount } from 'svelte';

    ReceiveEvent(Receive.visible, (visible: boolean): void => {
        $VISIBLE = visible;
    });

    onMount(() => {
        if (!$CONFIG.allowEscapeKey) return;

        const keyHandler = (e: KeyboardEvent) => {
            if ($VISIBLE && ['Escape'].includes(e.code)) {
                SendEvent(Send.close);
            }
        };
        window.addEventListener('keydown', keyHandler);
        return () => window.removeEventListener('keydown', keyHandler);
    });
</script>

{#if $VISIBLE}
    <main>
        <slot />
    </main>
{/if}

<style>
    main {
        z-index: 100;
        user-select: none;
        position: absolute;
        box-sizing: border-box;
        display: flex;
        justify-content: center;
        align-items: flex-end;
        padding: 0;
        margin: 0;
        height: 100vh;
        width: 100vw;
    }
</style>
