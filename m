Return-Path: <jailhouse-dev+bncBC2JHXGGREIRBGEZ5OHQMGQEPJU7EIA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x83d.google.com (mail-qt1-x83d.google.com [IPv6:2607:f8b0:4864:20::83d])
	by mail.lfdr.de (Postfix) with ESMTPS id D135E4A77E1
	for <lists+jailhouse-dev@lfdr.de>; Wed,  2 Feb 2022 19:25:29 +0100 (CET)
Received: by mail-qt1-x83d.google.com with SMTP id c15-20020ac87dcf000000b002d0a849c0besf16049594qte.16
        for <lists+jailhouse-dev@lfdr.de>; Wed, 02 Feb 2022 10:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=BmS3n/LsUUv23sGKwqt05BOhPIkD8vf7eCEr100Ftg4=;
        b=SU62t+cHuhN7UO7ZdRQwyifuQrCyE8LAMvmjgIWCzv/KlGjJhKpAYXB+qnFdYUEO6X
         L7DXwENX9HwcqeWrlQnTNI72qMqX4+HZwaX1kj4hSoCsy87CVh/9Y4sKy1OviWJFA5++
         PD85H2TN0edFqCZ/oizcu9xXJYeWgmpkO1ApXn7njWsgvPb+y0qrNQUVzuPpej079FnY
         bJrUjoJrPYJp47UgddytkaXbqEccm5UVWAa2FxmEa8iU1SK5g6VBq9F2sKXIIpZ8JxL5
         tUypx2NPbPMZG6mdCOA22z9Gk2tTLuy1sdq681E6o2UtSQcGl9GCaJocg8hdh7j5q3Y5
         tBxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=BmS3n/LsUUv23sGKwqt05BOhPIkD8vf7eCEr100Ftg4=;
        b=mNuydkvlVXCz799Uhrgoy9oteaoPBaWqc5Zx5w6uIrguaeaql67pzTYDQ7CsV3rZ3V
         bKDkkFT/qX9qGJfbzymUPA8cgH3MWSm4ZJFcoIx2h0Y0JuOECXHdcU2g9Cn1scTiklFp
         JAuph5Out88vmxgW16+p5Rx4+PegHJEx0mb4EQfNWXOfDe4jpBzs1CmP8H4gJQkCEYZT
         BYZwjsdKKRWSi2wdqOqNKBP2UoCrpFkkBKNAacJL9nBQtILEZnciTTEg3AXnHEbL3PsP
         xQn5pmYrEL9Ajx16SMj3lkaOCTXdhNjqtpANBM9/1THKDxOoiJkmOb5q4+MxQ6KuFK1e
         1sEg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531O8I1/Qwc8eN6/wlZnAuJn04wPC3tXf7IU79nqw2QSOoF1YfBi
	p9KShsFS+cZNFPrOuGWdbv4=
X-Google-Smtp-Source: ABdhPJwudpf8KBbpkv0Ojy0vL4Qy2OpXzfZ2vrm2Tm2RaplCeq84rwYpx5qHtulX9RB6ty6HWhoRCw==
X-Received: by 2002:a05:622a:1805:: with SMTP id t5mr23895001qtc.293.1643826328617;
        Wed, 02 Feb 2022 10:25:28 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:444b:: with SMTP id w11ls12499218qkp.10.gmail; Wed,
 02 Feb 2022 10:25:27 -0800 (PST)
X-Received: by 2002:a05:620a:4692:: with SMTP id bq18mr14168154qkb.575.1643826327683;
        Wed, 02 Feb 2022 10:25:27 -0800 (PST)
Date: Wed, 2 Feb 2022 10:25:27 -0800 (PST)
From: =?UTF-8?Q?Paul_W=C3=BCrtz?= <paulwuertz@web.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <69269fdd-f93d-49b5-8b38-94090561dd48n@googlegroups.com>
In-Reply-To: <3fd793cf-ddd7-4159-8ef2-2efbb525ec5fn@googlegroups.com>
References: <708f3b50-30ad-8ec8-d1a8-0ebd52f14586@posteo.de>
 <3fd793cf-ddd7-4159-8ef2-2efbb525ec5fn@googlegroups.com>
Subject: Re: Adding hardware peripherals to rpi4 with image from
 jailhouse-images
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1266_1583731158.1643826327030"
X-Original-Sender: paulwuertz@web.de
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

------=_Part_1266_1583731158.1643826327030
Content-Type: multipart/alternative; 
	boundary="----=_Part_1267_1093716223.1643826327030"

------=_Part_1267_1093716223.1643826327030
Content-Type: text/plain; charset="UTF-8"

Hej Mustafa :)

Can you share the cell and dts with me, from your GPIO transfer to the 
baremetal cell?
Are you working with the raspberry-pi/bcm2711 as well?

The serial driver already is loaded, so I would expect this to work, but I 
get some bus error, even the cell grants access to this address:
*[    0.035905] OF: amba: of_address_to_resource() failed (-22) for 
/serial@7e201600*

The I2C drivers are also loaded and two internal I2C are running on the 
base linux/the root cell. So I guess my defconfig should be ok?!
But the kernel logs give some phandle error, I find no helpful information 
about online...
*[    0.037665] OF: /i2c@7e804000: could not find phandle*

Yesterday I tried to transfer the GPIO as well. I oriented myself on this 
dts[1]
Leading to this cell and dts additions, which is the 283x-dtsi with the 
overriden values from the 2711.dts applied:

[image: dts.png]
Originally I started with the reg size of 0xb4 like in the rpi4 dts file, 
but booting the linux cell then gave me:


*[    0.195071] pinctrl-bcm2835 7e200000000000ff.gpio: could not get IO 
memory[    0.195095] pinctrl-bcm2835: probe of 7e200000000000b4.gpio failed 
with error -22*
In the kernel logs. So I increased it a little, since in the peripheral 
docs section 5.2[3] upto 0xf0 registers are mentioned, but the same error 
ocurrs
with reg-size of 0xff. I also do not understand, why the 32-bit address is 
expended to 64-bit, when the bcm2711 has a 35-bit bus...

And yes, I am using jailhouse-images. For building jailhouse myself - 
I tried that -  but I could'n start the kernel module with my self build 
image, 
but I am fine for now by working with the reference jailhouse-images.
If anybody has used peripherals in the linux demo in the rpi 
jailhouse-image I would be happy for any code references, or hints ^^

I don't know. Maybe my kernel hacking level is not up for using jailhouse 
like that. I fell that I struggle with the kernel here more, then with 
actual jailhouse.
But on the other hand I would like to understand, make it running, and add 
some practical examples of peripheral usage to some kind of docs, so
that the learning curve for getting started is a little less step. I just 
don't know where else to ask, if one can recommend some literature  to read 
or forum, where my
issues are discussed more adequately I am grateful for any hints :)

Thank you all very much!
Greetings Paul

[1] 
https://github.com/raspberrypi/linux/blob/rpi-5.10.y/arch/arm/boot/dts/bcm283x.dtsi#L107
[2] root@demo:~# jailhouse cell linux /etc/jailhouse/rpi4-linux-demo.cell   
                      /boot/vmlinux*                         -d 
/etc/jailhouse/dts/inmate-rpi4.dtb                         -i 
/usr/libexec/jailhouse/demos/rootfs.cpio                         -c 
"console=ttyS0,115200 ip=192.168.19.2"^C
root@demo:~# jailhouse cell linux 
/root/jailhouse-next/configs/arm64/rpi4-linux-demo_neu.cell /boot/vmlinux* 
-d /root/jailhouse-next/configs/arm64/dts/inmate-rpi4_custom.dtb -i 
/usr/libexec/jailhouse/demos/rootfs.cpio -c "console=ttyS0,115200 
ip=192.168.19.2"
root@demo:~# ssh 192.168.19.2
# dmesg | grep gpio
[    0.195071] pinctrl-bcm2835 7e200000000000ff.gpio: could not get IO 
memory
[    0.195095] pinctrl-bcm2835: probe of 7e200000000000ff.gpio failed with 
error -22
[3] https://datasheets.raspberrypi.com/bcm2711/bcm2711-peripherals.pdf
mustafa...@gmail.com schrieb am Sonntag, 30. Januar 2022 um 20:04:57 UTC+1:

> Hi, 
> I am like, a student doing his thesis with Jailhouse. 
> How did you built your non-root Linux cell, if you are taking the build 
> root generated by jailhouse-images, you might need to add some flags in the 
> buildroot defconfig. However, I am not sure. I did not try this with the 
> Linux inmate, but I was able to add the GPIO on an bare-metal cell. So, I 
> think your workflow is correct. It might be also possible, that your 
> buildroot kernel does not have drivers for the nodes you added. One more 
> question, are you using jailhouse-images, or you ported jailhouse yourself. 
>
> Moustafa Noufale
> On Sunday, 30 January 2022 at 19:48:13 UTC+1 Paul wrote:
>
>> Hello everyone :)
>>
>> I am playing around with jailhouse finally for my thesis :)
>>
>> I tried the last days to add another UART, I2C and some GPIOs to the 
>> non-root cell linux demo.
>> Already the UART produces some errors I cannot resolve myself.
>> Maybe someone could hint me in the right direction ^^
>>
>> I try to add uart3[1] and i2c1 from the BCM2711 to the non-root cell.
>> Therefore I modified the reference dts[2] and linux-demo-cell[3] from the 
>> configs with these changes[4].
>> Then I re-make the jailhouse folder on the pi:
>>
>> root@demo:~/jailhouse-next# make KDIR=../linux-5.10.19/
>>
>>   CC      /root/jailhouse-next/configs/arm64/rpi4-linux-demo_neu.o
>>
>>   OBJCOPY /root/jailhouse-next/configs/arm64/rpi4-linux-demo_neu.cell
>>
>>   DTC     /root/jailhouse-next/configs/arm64/dts/inmate-rpi4_custom.dtb
>>
>> When booting up the kernel logs on serial line/dmsg show no difference.
>> I hoped some of /dev/ttyS* devices now can be written to, but nope:
>>
>> # echo "hhhhhhh" > /dev/ttyS3
>>
>> sh: write error: Input/output error
>>
>> I dont know. Do my steps seem plausible, do I need something more to make 
>> these resources available
>> in the non-root cell Linux besides adding the peripheral addresses to dts 
>> and the cell? 
>> Any hints are very much apreciated ^^
>>
>> Attached are my custom cell source and dts file (or the patch file for 
>> the rpi4 linux-demo).
>>
>> Thank you!
>> Paul
>>
>> P.S. my kernel version of the jailhouse-images is 5.10.31, in the 
>> buildroot folder I only found 5.10.19 to re-build the .cell file, but I 
>> hope these 12 patches do not make for the error...
>>
>>
>> [1] 
>> https://github.com/raspberrypi/linux/blob/rpi-5.10.y/arch/arm/boot/dts/bcm2711.dtsi#L140
>> [2] 
>> https://github.com/siemens/jailhouse/blob/master/configs/arm64/dts/inmate-rpi4.dts
>> [3] 
>> https://github.com/siemens/jailhouse/blob/master/configs/arm64/rpi4-linux-demo.c
>> [4] [p4w5@p4w5 jailhouse/configs]$ git diff . 
>>
>> diff --git a/configs/arm64/dts/inmate-rpi4.dts b/configs/arm64/dts/inmate-rpi4.dts
>> index 305ac22f..8ff2da27 100644
>> --- a/configs/arm64/dts/inmate-rpi4.dts
>> +++ b/configs/arm64/dts/inmate-rpi4.dts
>> @@ -84,6 +84,27 @@
>>                 status = "okay";
>>         };
>> +    uart3: serial@7e201600 {
>> +        compatible = "arm,pl011", "arm,primecell";
>> +        reg = <0x7e201600 0x200>;
>> +        interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
>> +        clocks = <&clocks BCM2835_CLOCK_UART>,
>> +                <&clocks BCM2835_CLOCK_VPU>;
>> +        clock-names = "uartclk", "apb_pclk";
>> +        arm,primecell-periphid = <0x00241011>;
>> +        status = "okay";
>> +    };
>> +
>> +       i2c1: i2c@7e804000 {
>> +               compatible = "brcm,bcm2835-i2c";
>> +               reg = <0x7e804000 0x1000>;
>> +               interrupts = <2 21>;
>> +               clocks = <&clocks BCM2835_CLOCK_VPU>;
>> +               #address-cells = <1>;
>> +               #size-cells = <0>;
>> +               status = "disabled";
>> +       };
>> +
>>         pci@e0000000 {
>>                 compatible = "pci-host-ecam-generic";
>>                 device_type = "pci";
>> diff --git a/configs/arm64/rpi4-linux-demo.c b/configs/arm64/rpi4-linux-demo.c
>> index f93c564a..9ccdc9dd 100644
>> --- a/configs/arm64/rpi4-linux-demo.c
>> +++ b/configs/arm64/rpi4-linux-demo.c
>> @@ -19,7 +19,7 @@
>>  struct {
>>         struct jailhouse_cell_desc cell;
>>         __u64 cpus[1];
>> -       struct jailhouse_memory mem_regions[13];
>> +       struct jailhouse_memory mem_regions[15];
>>         struct jailhouse_irqchip irqchips[2];
>>         struct jailhouse_pci_device pci_devices[2];
>>  } __attribute__((packed)) config = {
>> @@ -93,6 +93,22 @@ struct {
>>                                 JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_8 |
>>                                 JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_ROOTSHARED,
>>                 },
>> +               /* UART3 */ {
>> +                       .phys_start = 0x7e201600,
>> +                       .virt_start = 0x7e201600,
>> +                       .size = 0x200,
>> +                       .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                               JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_8 |
>> +                               JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_ROOTSHARED,
>> +               },
>> +               /* I2C */ {
>> +                       .phys_start = 0x7e804000,
>> +                       .virt_start = 0x7e804000,
>> +                       .size = 0x1000,
>> +                       .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                               JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_8 |
>> +                               JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_ROOTSHARED,
>> +               },
>>                 /* RAM */ {
>>                         .phys_start = 0x1f900000,
>>                         .virt_start = 0,
>>
>>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/69269fdd-f93d-49b5-8b38-94090561dd48n%40googlegroups.com.

------=_Part_1267_1093716223.1643826327030
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hej Mustafa :)<br><br>Can you share the cell and dts with me, from your GPI=
O transfer to the baremetal cell?<br>Are you working with the raspberry-pi/=
bcm2711 as well?<br><br>The serial driver already is loaded, so I would exp=
ect this to work, but I get some bus error, even the cell grants access to =
this address:<br><i>[ &nbsp; &nbsp;0.035905] OF: amba: of_address_to_resour=
ce() failed (-22) for /serial@7e201600</i><br><br>The I2C drivers are also =
loaded and two internal I2C are running on the base linux/the root cell. So=
 I guess my defconfig should be ok?!<br>But the kernel logs give some phand=
le error,  I find no helpful information about online...<br><i>[ &nbsp; &nb=
sp;0.037665] OF: /i2c@7e804000: could not find phandle</i><br><br>Yesterday=
 I tried to transfer the GPIO as well. I oriented myself on this dts[1]<br>=
Leading to this cell and dts additions, which is the 283x-dtsi with the ove=
rriden values from the 2711.dts applied:<br><br><img alt=3D"dts.png" data-i=
ml=3D"225361" width=3D"878px" height=3D"224px" src=3D"cid:ca516b57-16dd-410=
f-b475-83c52af762be"><br>Originally I started with the reg size of 0xb4 lik=
e in the rpi4 dts file, but booting the linux cell then gave me:<br><i>[ &n=
bsp; &nbsp;0.195071] pinctrl-bcm2835 7e200000000000ff.gpio: could not get I=
O memory<br>[ &nbsp; &nbsp;0.195095] pinctrl-bcm2835: probe of 7e2000000000=
00b4.gpio failed with error -22<br></i><br>In the kernel logs. So I increas=
ed it a little, since in the peripheral docs section 5.2[3] upto 0xf0 regis=
ters are mentioned, but the same error ocurrs<br>with reg-size of 0xff. I a=
lso do not understand, why the 32-bit address is expended to 64-bit, when t=
he bcm2711 has a 35-bit bus...<br><div><br></div><div>And yes, I am using  =
jailhouse-images. For building jailhouse myself - <br>I tried that -&nbsp; =
but I could'n start the kernel module with my self build image, <br>but I a=
m fine for now by working with the reference jailhouse-images.<br></div>If =
anybody has used peripherals in the linux demo in the rpi jailhouse-image I=
 would be happy for any code references, or hints ^^<br><br>I don't know. M=
aybe my kernel hacking level is not up for using jailhouse like that. I fel=
l that I struggle with the kernel here more, then with actual jailhouse.<br=
>But on the other hand I would like to understand, make it running, and add=
 some practical examples of peripheral usage to some kind of docs, so<br>th=
at the learning curve for getting started is a little less step. I just don=
't know where else to ask, if one can recommend some literature&nbsp; to re=
ad or forum, where my<br>issues are discussed more adequately I am grateful=
 for any hints :)<br><br>Thank you all very much!<br>Greetings Paul<br><br>=
[1] https://github.com/raspberrypi/linux/blob/rpi-5.10.y/arch/arm/boot/dts/=
bcm283x.dtsi#L107<br>[2] root@demo:~# jailhouse cell linux /etc/jailhouse/r=
pi4-linux-demo.cell &nbsp; &nbsp;
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /boo=
t/vmlinux* &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; -d=20
/etc/jailhouse/dts/inmate-rpi4.dtb &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; -i=20
/usr/libexec/jailhouse/demos/rootfs.cpio &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; -c=20
"console=3DttyS0,115200 ip=3D192.168.19.2"^C<br>root@demo:~# jailhouse cell=
=20
linux /root/jailhouse-next/configs/arm64/rpi4-linux-demo_neu.cell=20
/boot/vmlinux* -d=20
/root/jailhouse-next/configs/arm64/dts/inmate-rpi4_custom.dtb -i=20
/usr/libexec/jailhouse/demos/rootfs.cpio -c "console=3DttyS0,115200=20
ip=3D192.168.19.2"<br>root@demo:~# ssh 192.168.19.2<br># dmesg | grep gpio<=
br>[ &nbsp; &nbsp;0.195071] pinctrl-bcm2835 7e200000000000ff.gpio: could no=
t get IO memory<br>[ &nbsp; &nbsp;0.195095] pinctrl-bcm2835: probe of 7e200=
000000000ff.gpio failed with error -22<br>[3] https://datasheets.raspberryp=
i.com/bcm2711/bcm2711-peripherals.pdf<div class=3D"gmail_quote"><div dir=3D=
"auto" class=3D"gmail_attr">mustafa...@gmail.com schrieb am Sonntag, 30. Ja=
nuar 2022 um 20:04:57 UTC+1:<br/></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); padd=
ing-left: 1ex;">Hi, <br>I am like, a student doing his thesis with Jailhous=
e. <br>How did you built your non-root Linux cell, if you are taking the bu=
ild root generated by jailhouse-images, you might need to add some flags in=
 the buildroot defconfig. However, I am not sure. I did not try this with t=
he Linux inmate, but I was able to add the GPIO on an bare-metal cell. So, =
I think your workflow is correct. It might be also possible, that your buil=
droot kernel does not have drivers for the nodes you added. One more questi=
on, are you using jailhouse-images, or you ported jailhouse yourself.=C2=A0=
<br><br>Moustafa Noufale<div class=3D"gmail_quote"><div dir=3D"auto" class=
=3D"gmail_attr">On Sunday, 30 January 2022 at 19:48:13 UTC+1 Paul wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
 =20

   =20
 =20
  <div>
    <p>Hello everyone :)<br>
      <br>
      I am playing around with jailhouse finally for my thesis :)<br>
      <br>
      I tried the last days to add another UART, I2C and some GPIOs to
      the non-root cell linux demo.<br>
      Already the UART produces some errors I cannot resolve myself.<br>
      Maybe someone could hint me in the right direction ^^<br>
      <br>
      I try to add uart3[1] and i2c1 from the BCM2711 to the non-root
      cell.<br>
      Therefore I modified the reference dts[2] and linux-demo-cell[3]
      from the configs with these changes[4].<br>
      Then I re-make the jailhouse folder on the pi:</p>
    <pre>root@demo:~/jailhouse-next# make KDIR=3D../linux-5.10.19/</pre>
    <pre>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /root/jailhouse-next/confi=
gs/arm64/rpi4-linux-demo_neu.o</pre>
    <pre>=C2=A0 OBJCOPY /root/jailhouse-next/configs/arm64/rpi4-linux-demo_=
neu.cell</pre>
    <pre>=C2=A0 DTC=C2=A0=C2=A0=C2=A0=C2=A0 /root/jailhouse-next/configs/ar=
m64/dts/inmate-rpi4_custom.dtb
</pre>
    <p>When booting up the kernel logs on serial line/dmsg show no
      difference.<br>
      I hoped some of /dev/ttyS* devices now can be written to, but
      nope:<br>
    </p>
    <pre># echo &quot;hhhhhhh&quot; &gt; /dev/ttyS3</pre>
    <pre>sh: write error: Input/output error
</pre>
    <p>I dont know. Do my steps seem plausible, do I need something more
      to make these resources available<br>
      in the non-root cell Linux besides adding the peripheral addresses
      to dts and the cell? <br>
      Any hints are very much apreciated ^^<br>
      <br>
      Attached are my custom cell source and dts file (or the patch file
      for the rpi4 linux-demo).<br>
      <br>
      Thank you!<br>
      Paul</p>
    <p>P.S. my kernel version of the jailhouse-images is 5.10.31, in the
      buildroot folder I only found 5.10.19 to re-build the .cell file,
      but I hope these 12 patches do not make for the error...<br>
    </p>
    <p><br>
      [1]
<a href=3D"https://github.com/raspberrypi/linux/blob/rpi-5.10.y/arch/arm/bo=
ot/dts/bcm2711.dtsi#L140" rel=3D"nofollow" target=3D"_blank" data-saferedir=
ecturl=3D"https://www.google.com/url?hl=3Dde&amp;q=3Dhttps://github.com/ras=
pberrypi/linux/blob/rpi-5.10.y/arch/arm/boot/dts/bcm2711.dtsi%23L140&amp;so=
urce=3Dgmail&amp;ust=3D1643910534178000&amp;usg=3DAFQjCNHYoc5pVKoWgcouO6lLx=
yn3Dv4RPg">https://github.com/raspberrypi/linux/blob/rpi-5.10.y/arch/arm/bo=
ot/dts/bcm2711.dtsi#L140</a><br>
      [2]
<a href=3D"https://github.com/siemens/jailhouse/blob/master/configs/arm64/d=
ts/inmate-rpi4.dts" rel=3D"nofollow" target=3D"_blank" data-saferedirecturl=
=3D"https://www.google.com/url?hl=3Dde&amp;q=3Dhttps://github.com/siemens/j=
ailhouse/blob/master/configs/arm64/dts/inmate-rpi4.dts&amp;source=3Dgmail&a=
mp;ust=3D1643910534179000&amp;usg=3DAFQjCNF7QgFOXifuc6TcQIyG8NlT3iUgxQ">htt=
ps://github.com/siemens/jailhouse/blob/master/configs/arm64/dts/inmate-rpi4=
.dts</a><br>
      [3]
<a href=3D"https://github.com/siemens/jailhouse/blob/master/configs/arm64/r=
pi4-linux-demo.c" rel=3D"nofollow" target=3D"_blank" data-saferedirecturl=
=3D"https://www.google.com/url?hl=3Dde&amp;q=3Dhttps://github.com/siemens/j=
ailhouse/blob/master/configs/arm64/rpi4-linux-demo.c&amp;source=3Dgmail&amp=
;ust=3D1643910534179000&amp;usg=3DAFQjCNHESKkV76JwQHs6MaQDiSlJCvM14A">https=
://github.com/siemens/jailhouse/blob/master/configs/arm64/rpi4-linux-demo.c=
</a><br>
      [4] [p4w5@p4w5 jailhouse/configs]$ git diff .
    </p>
    <pre>diff --git a/configs/arm64/dts/inmate-rpi4.dts b/configs/arm64/dts=
/inmate-rpi4.dts
index 305ac22f..8ff2da27 100644
--- a/configs/arm64/dts/inmate-rpi4.dts
+++ b/configs/arm64/dts/inmate-rpi4.dts
@@ -84,6 +84,27 @@
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 status =3D &quot;okay&quot;;
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
+=C2=A0=C2=A0=C2=A0 uart3: serial@7e201600 {
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible =3D &quot;arm,pl011&=
quot;, &quot;arm,primecell&quot;;
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =3D &lt;0x7e201600 0x200&gt=
;;
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 interrupts =3D &lt;GIC_SPI 121 =
IRQ_TYPE_LEVEL_HIGH&gt;;
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clocks =3D &lt;&amp;clocks BCM2=
835_CLOCK_UART&gt;,
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 &lt;&amp;clocks BCM2835_CLOCK_VPU&gt;;
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clock-names =3D &quot;uartclk&q=
uot;, &quot;apb_pclk&quot;;
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arm,primecell-periphid =3D &lt;=
0x00241011&gt;;
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status =3D &quot;okay&quot;;
+=C2=A0=C2=A0=C2=A0 };
+
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i2c1: i2c@7e804000 {
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 compatible =3D &quot;brcm,bcm2835-i2c&quot;;
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 reg =3D &lt;0x7e804000 0x1000&gt;;
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 interrupts =3D &lt;2 21&gt;;
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 clocks =3D &lt;&amp;clocks BCM2835_CLOCK_VPU&gt;;
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 #address-cells =3D &lt;1&gt;;
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 #size-cells =3D &lt;0&gt;;
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 status =3D &quot;disabled&quot;;
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
+
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pci@e0000000 {
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 compatible =3D &quot;pci-host-ecam-generic&quot;;
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 device_type =3D &quot;pci&quot;;
diff --git a/configs/arm64/rpi4-linux-demo.c b/configs/arm64/rpi4-linux-dem=
o.c
index f93c564a..9ccdc9dd 100644
--- a/configs/arm64/rpi4-linux-demo.c
+++ b/configs/arm64/rpi4-linux-demo.c
@@ -19,7 +19,7 @@
=C2=A0struct {
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct jailhouse_cell_desc cell;
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u64 cpus[1];
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct jailhouse_memory mem_regions[1=
3];
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct jailhouse_memory mem_regions[1=
5];
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct jailhouse_irqchip irqchip=
s[2];
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct jailhouse_pci_device pci_=
devices[2];
=C2=A0} __attribute__((packed)) config =3D {
@@ -93,6 +93,22 @@ struct {
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_8 =
|
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_RO=
OTSHARED,
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 },
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 /* UART3 */ {
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .phys_start =
=3D 0x7e201600,
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .virt_start =
=3D 0x7e201600,
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .size =3D 0x20=
0,
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .flags =3D JAI=
LHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_8 |
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_ROOTS=
HARED,
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 },
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 /* I2C */ {
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .phys_start =
=3D 0x7e804000,
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .virt_start =
=3D 0x7e804000,
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .size =3D 0x10=
00,
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .flags =3D JAI=
LHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_8 |
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_ROOTS=
HARED,
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 },
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 /* RAM */ {
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .phys_start=
 =3D 0x1f900000,
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .virt_start=
 =3D 0,</pre>
  </div>

</blockquote></div></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/69269fdd-f93d-49b5-8b38-94090561dd48n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/69269fdd-f93d-49b5-8b38-94090561dd48n%40googlegroups.co=
m</a>.<br />

------=_Part_1267_1093716223.1643826327030--

------=_Part_1266_1583731158.1643826327030
Content-Type: image/png; name=dts.png
Content-Transfer-Encoding: base64
Content-Disposition: inline; filename=dts.png
X-Attachment-Id: ca516b57-16dd-410f-b475-83c52af762be
Content-ID: <ca516b57-16dd-410f-b475-83c52af762be>

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
------=_Part_1266_1583731158.1643826327030--
