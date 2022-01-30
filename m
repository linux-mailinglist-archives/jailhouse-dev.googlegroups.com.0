Return-Path: <jailhouse-dev+bncBC653PXTYYERBWWC3OHQMGQE725QVKI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf39.google.com (mail-qv1-xf39.google.com [IPv6:2607:f8b0:4864:20::f39])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3604A385E
	for <lists+jailhouse-dev@lfdr.de>; Sun, 30 Jan 2022 20:05:00 +0100 (CET)
Received: by mail-qv1-xf39.google.com with SMTP id t3-20020a0562140c6300b00424a0fd3721sf10747246qvj.12
        for <lists+jailhouse-dev@lfdr.de>; Sun, 30 Jan 2022 11:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=CBnNJA5QlCNAulU15ivi7WX0Y53FLcdVFv7uiRVcOTU=;
        b=pUk7sAwAjH+uPYZ1ciC2GyjnujfJpn4KwrTuIwgQrnqFSXeMnEEqQmn0ApsdbI5WpQ
         F0SKXSA7kighDuOsp/chvY71wfkk0L3JNqXcuHGT5RLPmO18pcX36zLMQ4rVn0IJCsVk
         1V+n0gO8nbh234pRvQ30YBfG2XZV2ndAslWIrQcSeHZw59+eNpou/N+FiXmvgYDGN3Rw
         bjjr4BTwBrlCYHQj472H6Wpxvqj5fqSA5u20IMlQp1RxMIZyCTetQdQlQUIWXfItey1z
         wnGGgR5KUtX0NPYcbnAph+o4w6SFn27fddho3MEV9ZyulrrE6ZlIqlb9k80ix845Nqwa
         8uKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=CBnNJA5QlCNAulU15ivi7WX0Y53FLcdVFv7uiRVcOTU=;
        b=qGcUAI7aslIuBy1/RPjO2NwIS9fNCAfO2C0WBK8vtviVm519xNNjcJbv8yuRLaCKgK
         Ba88vzQq5PJpRIsrv7cXI9QNYxUar4S7QRCXpDgVXfh/SHDUdE9R+s60OJDDm8sIvbg0
         JRztppB+m67ATd0uOvYADmlQjRbDfAhW6xW1SLWlJLepeDYF+xEFTTdo5SOpS4RFJhpW
         yzJ7WnLhaXs5nMu6XZ4qE3oM9PwrQDx63V4QydsEzanB0BA+U1oe35COnL6i8+KGWqgA
         +fRsibp/r6OTzB6iMGjhX+iYOnsOy+Lqx7ZsAq+YxM6FehwYe3jy9yizfOIj50fgdJ8x
         DXyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=CBnNJA5QlCNAulU15ivi7WX0Y53FLcdVFv7uiRVcOTU=;
        b=33iKNlU/AGCNdTDjNxY2ySB6cH29NQaaArMpNLX3ssQqUXZPIjqEe3IrArjI9pqGCD
         sb/GSm9L+g3BZuFilaOV4dBXQFBDZmBi/clSQZ9TPuIpRQSBaPsfTZ5Sw+WSh3KSrRQY
         Q/+x7MT45T6nuWzvqjuR/Ty4bXkxoEjlk04qByKWVWyRZOcoZGsbVgzztd7pu9hlFUs1
         uln19hRhAu6OAahO/R/6RQ9gG+gaYftAK5iPZqES08b1LKfuuGRMvbmzf5iaXdTm3hEj
         UHGscQ+2E/C1JzjfAcH6pH5787mw9vyqTwJM7uAU6pay/R13gVuti3+Zt607zIxeO6qC
         QOwA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532ISYf9yWMuBoH2fXX6tYDPtvgpKDoigrEf11GeQlmoUgRHyQse
	n1zNQsl8nSFvA6MLQerrvWs=
X-Google-Smtp-Source: ABdhPJymwgscpmE2sNYvOHCaUltnf3QpQvd6J5K1EDpnF6nZ2m93Pf5/IJ0ymkQfF/v3T9R5JOWDbw==
X-Received: by 2002:ae9:f801:: with SMTP id x1mr11421231qkh.171.1643569498823;
        Sun, 30 Jan 2022 11:04:58 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6214:c83:: with SMTP id r3ls6590085qvr.9.gmail; Sun, 30
 Jan 2022 11:04:58 -0800 (PST)
X-Received: by 2002:ad4:5c83:: with SMTP id o3mr15085172qvh.15.1643569497800;
        Sun, 30 Jan 2022 11:04:57 -0800 (PST)
Date: Sun, 30 Jan 2022 11:04:57 -0800 (PST)
From: Moustafa Nofal <mustafa13e09940@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <3fd793cf-ddd7-4159-8ef2-2efbb525ec5fn@googlegroups.com>
In-Reply-To: <708f3b50-30ad-8ec8-d1a8-0ebd52f14586@posteo.de>
References: <708f3b50-30ad-8ec8-d1a8-0ebd52f14586@posteo.de>
Subject: Re: Adding hardware peripherals to rpi4 with image from
 jailhouse-images
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1226_285963504.1643569497205"
X-Original-Sender: mustafa13e09940@gmail.com
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>

------=_Part_1226_285963504.1643569497205
Content-Type: multipart/alternative; 
	boundary="----=_Part_1227_449954940.1643569497205"

------=_Part_1227_449954940.1643569497205
Content-Type: text/plain; charset="UTF-8"

Hi, 
I am like, a student doing his thesis with Jailhouse. 
How did you built your non-root Linux cell, if you are taking the build 
root generated by jailhouse-images, you might need to add some flags in the 
buildroot defconfig. However, I am not sure. I did not try this with the 
Linux inmate, but I was able to add the GPIO on an bare-metal cell. So, I 
think your workflow is correct. It might be also possible, that your 
buildroot kernel does not have drivers for the nodes you added. One more 
question, are you using jailhouse-images, or you ported jailhouse yourself. 

Moustafa Noufale
On Sunday, 30 January 2022 at 19:48:13 UTC+1 Paul wrote:

> Hello everyone :)
>
> I am playing around with jailhouse finally for my thesis :)
>
> I tried the last days to add another UART, I2C and some GPIOs to the 
> non-root cell linux demo.
> Already the UART produces some errors I cannot resolve myself.
> Maybe someone could hint me in the right direction ^^
>
> I try to add uart3[1] and i2c1 from the BCM2711 to the non-root cell.
> Therefore I modified the reference dts[2] and linux-demo-cell[3] from the 
> configs with these changes[4].
> Then I re-make the jailhouse folder on the pi:
>
> root@demo:~/jailhouse-next# make KDIR=../linux-5.10.19/
>
>   CC      /root/jailhouse-next/configs/arm64/rpi4-linux-demo_neu.o
>
>   OBJCOPY /root/jailhouse-next/configs/arm64/rpi4-linux-demo_neu.cell
>
>   DTC     /root/jailhouse-next/configs/arm64/dts/inmate-rpi4_custom.dtb
>
> When booting up the kernel logs on serial line/dmsg show no difference.
> I hoped some of /dev/ttyS* devices now can be written to, but nope:
>
> # echo "hhhhhhh" > /dev/ttyS3
>
> sh: write error: Input/output error
>
> I dont know. Do my steps seem plausible, do I need something more to make 
> these resources available
> in the non-root cell Linux besides adding the peripheral addresses to dts 
> and the cell? 
> Any hints are very much apreciated ^^
>
> Attached are my custom cell source and dts file (or the patch file for the 
> rpi4 linux-demo).
>
> Thank you!
> Paul
>
> P.S. my kernel version of the jailhouse-images is 5.10.31, in the 
> buildroot folder I only found 5.10.19 to re-build the .cell file, but I 
> hope these 12 patches do not make for the error...
>
>
> [1] 
> https://github.com/raspberrypi/linux/blob/rpi-5.10.y/arch/arm/boot/dts/bcm2711.dtsi#L140
> [2] 
> https://github.com/siemens/jailhouse/blob/master/configs/arm64/dts/inmate-rpi4.dts
> [3] 
> https://github.com/siemens/jailhouse/blob/master/configs/arm64/rpi4-linux-demo.c
> [4] [p4w5@p4w5 jailhouse/configs]$ git diff . 
>
> diff --git a/configs/arm64/dts/inmate-rpi4.dts b/configs/arm64/dts/inmate-rpi4.dts
> index 305ac22f..8ff2da27 100644
> --- a/configs/arm64/dts/inmate-rpi4.dts
> +++ b/configs/arm64/dts/inmate-rpi4.dts
> @@ -84,6 +84,27 @@
>                 status = "okay";
>         };
> +    uart3: serial@7e201600 {
> +        compatible = "arm,pl011", "arm,primecell";
> +        reg = <0x7e201600 0x200>;
> +        interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&clocks BCM2835_CLOCK_UART>,
> +                <&clocks BCM2835_CLOCK_VPU>;
> +        clock-names = "uartclk", "apb_pclk";
> +        arm,primecell-periphid = <0x00241011>;
> +        status = "okay";
> +    };
> +
> +       i2c1: i2c@7e804000 {
> +               compatible = "brcm,bcm2835-i2c";
> +               reg = <0x7e804000 0x1000>;
> +               interrupts = <2 21>;
> +               clocks = <&clocks BCM2835_CLOCK_VPU>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               status = "disabled";
> +       };
> +
>         pci@e0000000 {
>                 compatible = "pci-host-ecam-generic";
>                 device_type = "pci";
> diff --git a/configs/arm64/rpi4-linux-demo.c b/configs/arm64/rpi4-linux-demo.c
> index f93c564a..9ccdc9dd 100644
> --- a/configs/arm64/rpi4-linux-demo.c
> +++ b/configs/arm64/rpi4-linux-demo.c
> @@ -19,7 +19,7 @@
>  struct {
>         struct jailhouse_cell_desc cell;
>         __u64 cpus[1];
> -       struct jailhouse_memory mem_regions[13];
> +       struct jailhouse_memory mem_regions[15];
>         struct jailhouse_irqchip irqchips[2];
>         struct jailhouse_pci_device pci_devices[2];
>  } __attribute__((packed)) config = {
> @@ -93,6 +93,22 @@ struct {
>                                 JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_8 |
>                                 JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_ROOTSHARED,
>                 },
> +               /* UART3 */ {
> +                       .phys_start = 0x7e201600,
> +                       .virt_start = 0x7e201600,
> +                       .size = 0x200,
> +                       .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +                               JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_8 |
> +                               JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_ROOTSHARED,
> +               },
> +               /* I2C */ {
> +                       .phys_start = 0x7e804000,
> +                       .virt_start = 0x7e804000,
> +                       .size = 0x1000,
> +                       .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +                               JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_8 |
> +                               JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_ROOTSHARED,
> +               },
>                 /* RAM */ {
>                         .phys_start = 0x1f900000,
>                         .virt_start = 0,
>
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/3fd793cf-ddd7-4159-8ef2-2efbb525ec5fn%40googlegroups.com.

------=_Part_1227_449954940.1643569497205
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

SGksIDxicj5JIGFtIGxpa2UsIGEgc3R1ZGVudCBkb2luZyBoaXMgdGhlc2lzIHdpdGggSmFpbGhv
dXNlLiA8YnI+SG93IGRpZCB5b3UgYnVpbHQgeW91ciBub24tcm9vdCBMaW51eCBjZWxsLCBpZiB5
b3UgYXJlIHRha2luZyB0aGUgYnVpbGQgcm9vdCBnZW5lcmF0ZWQgYnkgamFpbGhvdXNlLWltYWdl
cywgeW91IG1pZ2h0IG5lZWQgdG8gYWRkIHNvbWUgZmxhZ3MgaW4gdGhlIGJ1aWxkcm9vdCBkZWZj
b25maWcuIEhvd2V2ZXIsIEkgYW0gbm90IHN1cmUuIEkgZGlkIG5vdCB0cnkgdGhpcyB3aXRoIHRo
ZSBMaW51eCBpbm1hdGUsIGJ1dCBJIHdhcyBhYmxlIHRvIGFkZCB0aGUgR1BJTyBvbiBhbiBiYXJl
LW1ldGFsIGNlbGwuIFNvLCBJIHRoaW5rIHlvdXIgd29ya2Zsb3cgaXMgY29ycmVjdC4gSXQgbWln
aHQgYmUgYWxzbyBwb3NzaWJsZSwgdGhhdCB5b3VyIGJ1aWxkcm9vdCBrZXJuZWwgZG9lcyBub3Qg
aGF2ZSBkcml2ZXJzIGZvciB0aGUgbm9kZXMgeW91IGFkZGVkLiBPbmUgbW9yZSBxdWVzdGlvbiwg
YXJlIHlvdSB1c2luZyBqYWlsaG91c2UtaW1hZ2VzLCBvciB5b3UgcG9ydGVkIGphaWxob3VzZSB5
b3Vyc2VsZi4mbmJzcDs8YnI+PGJyPk1vdXN0YWZhIE5vdWZhbGU8ZGl2IGNsYXNzPSJnbWFpbF9x
dW90ZSI+PGRpdiBkaXI9ImF1dG8iIGNsYXNzPSJnbWFpbF9hdHRyIj5PbiBTdW5kYXksIDMwIEph
bnVhcnkgMjAyMiBhdCAxOTo0ODoxMyBVVEMrMSBQYXVsIHdyb3RlOjxici8+PC9kaXY+PGJsb2Nr
cXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOiAwIDAgMCAwLjhleDsgYm9y
ZGVyLWxlZnQ6IDFweCBzb2xpZCByZ2IoMjA0LCAyMDQsIDIwNCk7IHBhZGRpbmctbGVmdDogMWV4
OyI+DQogIA0KDQogICAgDQogIA0KICA8ZGl2Pg0KICAgIDxwPkhlbGxvIGV2ZXJ5b25lIDopPGJy
Pg0KICAgICAgPGJyPg0KICAgICAgSSBhbSBwbGF5aW5nIGFyb3VuZCB3aXRoIGphaWxob3VzZSBm
aW5hbGx5IGZvciBteSB0aGVzaXMgOik8YnI+DQogICAgICA8YnI+DQogICAgICBJIHRyaWVkIHRo
ZSBsYXN0IGRheXMgdG8gYWRkIGFub3RoZXIgVUFSVCwgSTJDIGFuZCBzb21lIEdQSU9zIHRvDQog
ICAgICB0aGUgbm9uLXJvb3QgY2VsbCBsaW51eCBkZW1vLjxicj4NCiAgICAgIEFscmVhZHkgdGhl
IFVBUlQgcHJvZHVjZXMgc29tZSBlcnJvcnMgSSBjYW5ub3QgcmVzb2x2ZSBteXNlbGYuPGJyPg0K
ICAgICAgTWF5YmUgc29tZW9uZSBjb3VsZCBoaW50IG1lIGluIHRoZSByaWdodCBkaXJlY3Rpb24g
Xl48YnI+DQogICAgICA8YnI+DQogICAgICBJIHRyeSB0byBhZGQgdWFydDNbMV0gYW5kIGkyYzEg
ZnJvbSB0aGUgQkNNMjcxMSB0byB0aGUgbm9uLXJvb3QNCiAgICAgIGNlbGwuPGJyPg0KICAgICAg
VGhlcmVmb3JlIEkgbW9kaWZpZWQgdGhlIHJlZmVyZW5jZSBkdHNbMl0gYW5kIGxpbnV4LWRlbW8t
Y2VsbFszXQ0KICAgICAgZnJvbSB0aGUgY29uZmlncyB3aXRoIHRoZXNlIGNoYW5nZXNbNF0uPGJy
Pg0KICAgICAgVGhlbiBJIHJlLW1ha2UgdGhlIGphaWxob3VzZSBmb2xkZXIgb24gdGhlIHBpOjwv
cD4NCiAgICA8cHJlPnJvb3RAZGVtbzp+L2phaWxob3VzZS1uZXh0IyBtYWtlIEtESVI9Li4vbGlu
dXgtNS4xMC4xOS88L3ByZT4NCiAgICA8cHJlPsKgIENDwqDCoMKgwqDCoCAvcm9vdC9qYWlsaG91
c2UtbmV4dC9jb25maWdzL2FybTY0L3JwaTQtbGludXgtZGVtb19uZXUubzwvcHJlPg0KICAgIDxw
cmU+wqAgT0JKQ09QWSAvcm9vdC9qYWlsaG91c2UtbmV4dC9jb25maWdzL2FybTY0L3JwaTQtbGlu
dXgtZGVtb19uZXUuY2VsbDwvcHJlPg0KICAgIDxwcmU+wqAgRFRDwqDCoMKgwqAgL3Jvb3QvamFp
bGhvdXNlLW5leHQvY29uZmlncy9hcm02NC9kdHMvaW5tYXRlLXJwaTRfY3VzdG9tLmR0Yg0KPC9w
cmU+DQogICAgPHA+V2hlbiBib290aW5nIHVwIHRoZSBrZXJuZWwgbG9ncyBvbiBzZXJpYWwgbGlu
ZS9kbXNnIHNob3cgbm8NCiAgICAgIGRpZmZlcmVuY2UuPGJyPg0KICAgICAgSSBob3BlZCBzb21l
IG9mIC9kZXYvdHR5UyogZGV2aWNlcyBub3cgY2FuIGJlIHdyaXR0ZW4gdG8sIGJ1dA0KICAgICAg
bm9wZTo8YnI+DQogICAgPC9wPg0KICAgIDxwcmU+IyBlY2hvICZxdW90O2hoaGhoaGgmcXVvdDsg
Jmd0OyAvZGV2L3R0eVMzPC9wcmU+DQogICAgPHByZT5zaDogd3JpdGUgZXJyb3I6IElucHV0L291
dHB1dCBlcnJvcg0KPC9wcmU+DQogICAgPHA+SSBkb250IGtub3cuIERvIG15IHN0ZXBzIHNlZW0g
cGxhdXNpYmxlLCBkbyBJIG5lZWQgc29tZXRoaW5nIG1vcmUNCiAgICAgIHRvIG1ha2UgdGhlc2Ug
cmVzb3VyY2VzIGF2YWlsYWJsZTxicj4NCiAgICAgIGluIHRoZSBub24tcm9vdCBjZWxsIExpbnV4
IGJlc2lkZXMgYWRkaW5nIHRoZSBwZXJpcGhlcmFsIGFkZHJlc3Nlcw0KICAgICAgdG8gZHRzIGFu
ZCB0aGUgY2VsbD8gPGJyPg0KICAgICAgQW55IGhpbnRzIGFyZSB2ZXJ5IG11Y2ggYXByZWNpYXRl
ZCBeXjxicj4NCiAgICAgIDxicj4NCiAgICAgIEF0dGFjaGVkIGFyZSBteSBjdXN0b20gY2VsbCBz
b3VyY2UgYW5kIGR0cyBmaWxlIChvciB0aGUgcGF0Y2ggZmlsZQ0KICAgICAgZm9yIHRoZSBycGk0
IGxpbnV4LWRlbW8pLjxicj4NCiAgICAgIDxicj4NCiAgICAgIFRoYW5rIHlvdSE8YnI+DQogICAg
ICBQYXVsPC9wPg0KICAgIDxwPlAuUy4gbXkga2VybmVsIHZlcnNpb24gb2YgdGhlIGphaWxob3Vz
ZS1pbWFnZXMgaXMgNS4xMC4zMSwgaW4gdGhlDQogICAgICBidWlsZHJvb3QgZm9sZGVyIEkgb25s
eSBmb3VuZCA1LjEwLjE5IHRvIHJlLWJ1aWxkIHRoZSAuY2VsbCBmaWxlLA0KICAgICAgYnV0IEkg
aG9wZSB0aGVzZSAxMiBwYXRjaGVzIGRvIG5vdCBtYWtlIGZvciB0aGUgZXJyb3IuLi48YnI+DQog
ICAgPC9wPg0KICAgIDxwPjxicj4NCiAgICAgIFsxXQ0KPGEgaHJlZj0iaHR0cHM6Ly9naXRodWIu
Y29tL3Jhc3BiZXJyeXBpL2xpbnV4L2Jsb2IvcnBpLTUuMTAueS9hcmNoL2FybS9ib290L2R0cy9i
Y20yNzExLmR0c2kjTDE0MCIgdGFyZ2V0PSJfYmxhbmsiIHJlbD0ibm9mb2xsb3ciIGRhdGEtc2Fm
ZXJlZGlyZWN0dXJsPSJodHRwczovL3d3dy5nb29nbGUuY29tL3VybD9obD1lbi1HQiZhbXA7cT1o
dHRwczovL2dpdGh1Yi5jb20vcmFzcGJlcnJ5cGkvbGludXgvYmxvYi9ycGktNS4xMC55L2FyY2gv
YXJtL2Jvb3QvZHRzL2JjbTI3MTEuZHRzaSUyM0wxNDAmYW1wO3NvdXJjZT1nbWFpbCZhbXA7dXN0
PTE2NDM2NTU1MTgwNjEwMDAmYW1wO3VzZz1BRlFqQ05IWmx6NWRwNHdIUUFUQkxCSTVaNUp5WnZG
U0VnIj5odHRwczovL2dpdGh1Yi5jb20vcmFzcGJlcnJ5cGkvbGludXgvYmxvYi9ycGktNS4xMC55
L2FyY2gvYXJtL2Jvb3QvZHRzL2JjbTI3MTEuZHRzaSNMMTQwPC9hPjxicj4NCiAgICAgIFsyXQ0K
PGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL3NpZW1lbnMvamFpbGhvdXNlL2Jsb2IvbWFzdGVy
L2NvbmZpZ3MvYXJtNjQvZHRzL2lubWF0ZS1ycGk0LmR0cyIgdGFyZ2V0PSJfYmxhbmsiIHJlbD0i
bm9mb2xsb3ciIGRhdGEtc2FmZXJlZGlyZWN0dXJsPSJodHRwczovL3d3dy5nb29nbGUuY29tL3Vy
bD9obD1lbi1HQiZhbXA7cT1odHRwczovL2dpdGh1Yi5jb20vc2llbWVucy9qYWlsaG91c2UvYmxv
Yi9tYXN0ZXIvY29uZmlncy9hcm02NC9kdHMvaW5tYXRlLXJwaTQuZHRzJmFtcDtzb3VyY2U9Z21h
aWwmYW1wO3VzdD0xNjQzNjU1NTE4MDYxMDAwJmFtcDt1c2c9QUZRakNOR2d6TGt0cDNCTWZwSXV2
OTVnelNwYmQtWmVvdyI+aHR0cHM6Ly9naXRodWIuY29tL3NpZW1lbnMvamFpbGhvdXNlL2Jsb2Iv
bWFzdGVyL2NvbmZpZ3MvYXJtNjQvZHRzL2lubWF0ZS1ycGk0LmR0czwvYT48YnI+DQogICAgICBb
M10NCjxhIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS9zaWVtZW5zL2phaWxob3VzZS9ibG9iL21h
c3Rlci9jb25maWdzL2FybTY0L3JwaTQtbGludXgtZGVtby5jIiB0YXJnZXQ9Il9ibGFuayIgcmVs
PSJub2ZvbGxvdyIgZGF0YS1zYWZlcmVkaXJlY3R1cmw9Imh0dHBzOi8vd3d3Lmdvb2dsZS5jb20v
dXJsP2hsPWVuLUdCJmFtcDtxPWh0dHBzOi8vZ2l0aHViLmNvbS9zaWVtZW5zL2phaWxob3VzZS9i
bG9iL21hc3Rlci9jb25maWdzL2FybTY0L3JwaTQtbGludXgtZGVtby5jJmFtcDtzb3VyY2U9Z21h
aWwmYW1wO3VzdD0xNjQzNjU1NTE4MDYxMDAwJmFtcDt1c2c9QUZRakNORVZWYzcxWmQ3XzBTSUQy
aXBzTFVBX0dLTjBWQSI+aHR0cHM6Ly9naXRodWIuY29tL3NpZW1lbnMvamFpbGhvdXNlL2Jsb2Iv
bWFzdGVyL2NvbmZpZ3MvYXJtNjQvcnBpNC1saW51eC1kZW1vLmM8L2E+PGJyPg0KICAgICAgWzRd
IFtwNHc1QHA0dzUgamFpbGhvdXNlL2NvbmZpZ3NdJCBnaXQgZGlmZiAuDQogICAgPC9wPg0KICAg
IDxwcmU+ZGlmZiAtLWdpdCBhL2NvbmZpZ3MvYXJtNjQvZHRzL2lubWF0ZS1ycGk0LmR0cyBiL2Nv
bmZpZ3MvYXJtNjQvZHRzL2lubWF0ZS1ycGk0LmR0cw0KaW5kZXggMzA1YWMyMmYuLjhmZjJkYTI3
IDEwMDY0NA0KLS0tIGEvY29uZmlncy9hcm02NC9kdHMvaW5tYXRlLXJwaTQuZHRzDQorKysgYi9j
b25maWdzL2FybTY0L2R0cy9pbm1hdGUtcnBpNC5kdHMNCkBAIC04NCw2ICs4NCwyNyBAQA0KwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0YXR1cyA9ICZxdW90O29rYXkmcXVvdDs7DQrC
oMKgwqDCoMKgwqDCoCB9Ow0KK8KgwqDCoCB1YXJ0Mzogc2VyaWFsQDdlMjAxNjAwIHsNCivCoMKg
wqDCoMKgwqDCoCBjb21wYXRpYmxlID0gJnF1b3Q7YXJtLHBsMDExJnF1b3Q7LCAmcXVvdDthcm0s
cHJpbWVjZWxsJnF1b3Q7Ow0KK8KgwqDCoMKgwqDCoMKgIHJlZyA9ICZsdDsweDdlMjAxNjAwIDB4
MjAwJmd0OzsNCivCoMKgwqDCoMKgwqDCoCBpbnRlcnJ1cHRzID0gJmx0O0dJQ19TUEkgMTIxIElS
UV9UWVBFX0xFVkVMX0hJR0gmZ3Q7Ow0KK8KgwqDCoMKgwqDCoMKgIGNsb2NrcyA9ICZsdDsmYW1w
O2Nsb2NrcyBCQ00yODM1X0NMT0NLX1VBUlQmZ3Q7LA0KK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAmbHQ7JmFtcDtjbG9ja3MgQkNNMjgzNV9DTE9DS19WUFUmZ3Q7Ow0KK8KgwqDCoMKg
wqDCoMKgIGNsb2NrLW5hbWVzID0gJnF1b3Q7dWFydGNsayZxdW90OywgJnF1b3Q7YXBiX3BjbGsm
cXVvdDs7DQorwqDCoMKgwqDCoMKgwqAgYXJtLHByaW1lY2VsbC1wZXJpcGhpZCA9ICZsdDsweDAw
MjQxMDExJmd0OzsNCivCoMKgwqDCoMKgwqDCoCBzdGF0dXMgPSAmcXVvdDtva2F5JnF1b3Q7Ow0K
K8KgwqDCoCB9Ow0KKw0KK8KgwqDCoMKgwqDCoCBpMmMxOiBpMmNAN2U4MDQwMDAgew0KK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29tcGF0aWJsZSA9ICZxdW90O2JyY20sYmNtMjgzNS1p
MmMmcXVvdDs7DQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZWcgPSAmbHQ7MHg3ZTgw
NDAwMCAweDEwMDAmZ3Q7Ow0KK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaW50ZXJydXB0
cyA9ICZsdDsyIDIxJmd0OzsNCivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNsb2NrcyA9
ICZsdDsmYW1wO2Nsb2NrcyBCQ00yODM1X0NMT0NLX1ZQVSZndDs7DQorwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAjYWRkcmVzcy1jZWxscyA9ICZsdDsxJmd0OzsNCivCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgICNzaXplLWNlbGxzID0gJmx0OzAmZ3Q7Ow0KK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgc3RhdHVzID0gJnF1b3Q7ZGlzYWJsZWQmcXVvdDs7DQorwqDCoMKgwqDC
oMKgIH07DQorDQrCoMKgwqDCoMKgwqDCoCBwY2lAZTAwMDAwMDAgew0KwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGNvbXBhdGlibGUgPSAmcXVvdDtwY2ktaG9zdC1lY2FtLWdlbmVyaWMm
cXVvdDs7DQrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2aWNlX3R5cGUgPSAmcXVv
dDtwY2kmcXVvdDs7DQpkaWZmIC0tZ2l0IGEvY29uZmlncy9hcm02NC9ycGk0LWxpbnV4LWRlbW8u
YyBiL2NvbmZpZ3MvYXJtNjQvcnBpNC1saW51eC1kZW1vLmMNCmluZGV4IGY5M2M1NjRhLi45Y2Nk
YzlkZCAxMDA2NDQNCi0tLSBhL2NvbmZpZ3MvYXJtNjQvcnBpNC1saW51eC1kZW1vLmMNCisrKyBi
L2NvbmZpZ3MvYXJtNjQvcnBpNC1saW51eC1kZW1vLmMNCkBAIC0xOSw3ICsxOSw3IEBADQrCoHN0
cnVjdCB7DQrCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgamFpbGhvdXNlX2NlbGxfZGVzYyBjZWxsOw0K
wqDCoMKgwqDCoMKgwqAgX191NjQgY3B1c1sxXTsNCi3CoMKgwqDCoMKgwqAgc3RydWN0IGphaWxo
b3VzZV9tZW1vcnkgbWVtX3JlZ2lvbnNbMTNdOw0KK8KgwqDCoMKgwqDCoCBzdHJ1Y3QgamFpbGhv
dXNlX21lbW9yeSBtZW1fcmVnaW9uc1sxNV07DQrCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgamFpbGhv
dXNlX2lycWNoaXAgaXJxY2hpcHNbMl07DQrCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgamFpbGhvdXNl
X3BjaV9kZXZpY2UgcGNpX2RldmljZXNbMl07DQrCoH0gX19hdHRyaWJ1dGVfXygocGFja2VkKSkg
Y29uZmlnID0gew0KQEAgLTkzLDYgKzkzLDIyIEBAIHN0cnVjdCB7DQrCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBKQUlMSE9VU0Vf
TUVNX0lPIHwgSkFJTEhPVVNFX01FTV9JT184IHwNCsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEpBSUxIT1VTRV9NRU1fSU9fMzIg
fCBKQUlMSE9VU0VfTUVNX1JPT1RTSEFSRUQsDQrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgfSwNCivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIFVBUlQzICovIHsNCivCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAucGh5c19zdGFydCA9IDB4
N2UyMDE2MDAsDQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
LnZpcnRfc3RhcnQgPSAweDdlMjAxNjAwLA0KK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIC5zaXplID0gMHgyMDAsDQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgLmZsYWdzID0gSkFJTEhPVVNFX01FTV9SRUFEIHwgSkFJTEhP
VVNFX01FTV9XUklURSB8DQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIEpBSUxIT1VTRV9NRU1fSU8gfCBKQUlMSE9VU0VfTUVNX0lP
XzggfA0KK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBKQUlMSE9VU0VfTUVNX0lPXzMyIHwgSkFJTEhPVVNFX01FTV9ST09UU0hBUkVE
LA0KK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfSwNCivCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIC8qIEkyQyAqLyB7DQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgLnBoeXNfc3RhcnQgPSAweDdlODA0MDAwLA0KK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC52aXJ0X3N0YXJ0ID0gMHg3ZTgwNDAwMCwNCivC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuc2l6ZSA9IDB4MTAw
MCwNCivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuZmxhZ3Mg
PSBKQUlMSE9VU0VfTUVNX1JFQUQgfCBKQUlMSE9VU0VfTUVNX1dSSVRFIHwNCivCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgSkFJTEhP
VVNFX01FTV9JTyB8IEpBSUxIT1VTRV9NRU1fSU9fOCB8DQorwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEpBSUxIT1VTRV9NRU1fSU9f
MzIgfCBKQUlMSE9VU0VfTUVNX1JPT1RTSEFSRUQsDQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB9LA0KwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIFJBTSAqLyB7DQrCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5waHlzX3N0YXJ0ID0g
MHgxZjkwMDAwMCwNCsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgLnZpcnRfc3RhcnQgPSAwLDwvcHJlPg0KICA8L2Rpdj4NCg0KPC9ibG9ja3F1b3RlPjwvZGl2
Pg0KDQo8cD48L3A+CgotLSA8YnIgLz4KWW91IHJlY2VpdmVkIHRoaXMgbWVzc2FnZSBiZWNhdXNl
IHlvdSBhcmUgc3Vic2NyaWJlZCB0byB0aGUgR29vZ2xlIEdyb3VwcyAmcXVvdDtKYWlsaG91c2Um
cXVvdDsgZ3JvdXAuPGJyIC8+ClRvIHVuc3Vic2NyaWJlIGZyb20gdGhpcyBncm91cCBhbmQgc3Rv
cCByZWNlaXZpbmcgZW1haWxzIGZyb20gaXQsIHNlbmQgYW4gZW1haWwgdG8gPGEgaHJlZj0ibWFp
bHRvOmphaWxob3VzZS1kZXYrdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbSI+amFpbGhvdXNl
LWRldit1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tPC9hPi48YnIgLz4KVG8gdmlldyB0aGlz
IGRpc2N1c3Npb24gb24gdGhlIHdlYiB2aXNpdCA8YSBocmVmPSJodHRwczovL2dyb3Vwcy5nb29n
bGUuY29tL2QvbXNnaWQvamFpbGhvdXNlLWRldi8zZmQ3OTNjZi1kZGQ3LTQxNTktOGVmMi0yZWZi
YjUyNWVjNWZuJTQwZ29vZ2xlZ3JvdXBzLmNvbT91dG1fbWVkaXVtPWVtYWlsJnV0bV9zb3VyY2U9
Zm9vdGVyIj5odHRwczovL2dyb3Vwcy5nb29nbGUuY29tL2QvbXNnaWQvamFpbGhvdXNlLWRldi8z
ZmQ3OTNjZi1kZGQ3LTQxNTktOGVmMi0yZWZiYjUyNWVjNWZuJTQwZ29vZ2xlZ3JvdXBzLmNvbTwv
YT4uPGJyIC8+Cg==
------=_Part_1227_449954940.1643569497205--

------=_Part_1226_285963504.1643569497205--
