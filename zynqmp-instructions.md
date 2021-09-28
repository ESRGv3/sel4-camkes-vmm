0. Setup a sdcard usa use xilin'x pre-built stuff to get a BOOT.BIN file.

1. Create a build-zynqmp directory and run the following command inside it:
    
```
../init-build.sh -DCAMKES_VM_APP=vm_minimal -DPLATFORM=zynqmp -DCROSS_COMPILER_PREFIX=aarch64-linux-gnu- -DLibUtilsDefaultZfLogLevel=0 -DElfloaderImage=ElfloaderImageBinary -DVmInitRdFile=1 -DNUM_NODES=4  -DKernelArmExportPCNTUser=1 -DKernelArmExportVCNTUser=1
```

Then create a uboot image:

```
mkimage -n sel4_camkes_vmm -A arm64 -O linux -C none -T kernel -a 0x200000 -e 0x200000 -d images/capdl-loader-image-arm-zynqmp sel4
```

3. Copy sel4 uboot-image and kernel/kernel.dtb to the sd card.

4. Use uboot to load the images and start th kernel:

```
fatload mmc 0 0x8000000 sel4 && fatload mmc 0 0x10000000 kernel.dtb && bootm 0x8000000 - 0x10000000
```
