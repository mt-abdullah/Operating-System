/* linker.ld */

ENTRY(kernel_main)

SECTIONS
{
    /* Start at 1MB */
    . = 1M;

    /* Text section - code */
    .text : {
        *(.text)
    }

    /* Data section - initialized data */
    .data : {
        *(.data)
    }

    /* BSS section - uninitialized data */
    .bss : {
        *(.bss)
    }
}
