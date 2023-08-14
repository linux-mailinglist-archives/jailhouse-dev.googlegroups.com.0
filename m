Return-Path: <jailhouse-dev+bncBDKLL2HKV4DRBBU546TAMGQEKMFTUFI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pj1-x103a.google.com (mail-pj1-x103a.google.com [IPv6:2607:f8b0:4864:20::103a])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF5C77B1D3
	for <lists+jailhouse-dev@lfdr.de>; Mon, 14 Aug 2023 08:49:45 +0200 (CEST)
Received: by mail-pj1-x103a.google.com with SMTP id 98e67ed59e1d1-26b357b9bc2sf1283437a91.2
        for <lists+jailhouse-dev@lfdr.de>; Sun, 13 Aug 2023 23:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1691995783; x=1692600583;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VD7vcCS0AfahnxjZX5Uqp4lNJlFItoDuvq1fgETyW90=;
        b=iTalF6qsjrPxjGXZShWNaDIJUuJ+FF2zmsNp6+SbHWxowsIwv2b/7pGMRhDalxeTYs
         m0vJ/slSCCXzJC/1e7B8ixlr0XoPShaxINohM1rLn5X9sZbQZqFWDUANS8lB/ArWAieE
         4eUmmcU4PraMeK3QDBGx22KV/C4I/Zifxtu/8VXohXFWgvmgyDtNmRuUQfoAWPBN2HHs
         +GN73yYmwluisgin8UqHSTPD/BJlHSmZpCUzjh7Ce8MJr41oIjrT4U27G3gsoJGzZbeg
         9nG8ksczqQmrtMme4hkKWK+typ45ZDLwLupYqL0WCl/luHdCGza3HokqMjXeYYCQH3p0
         D9yA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691995783; x=1692600583;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VD7vcCS0AfahnxjZX5Uqp4lNJlFItoDuvq1fgETyW90=;
        b=hHXAn7qc9/ogOQQnXIFz4sDDEQaw8GI1YyvKJjT5eRiKFVqgQs6ZLzHnK3R00Xrbgu
         j1gsOIHPu2ktUq8z/n+/TcjaE7VPKSJvQq+2G8hmEjmWhWs9Zk6Ppz3Ho6PyFVldT0YV
         6MmwajJNbB44vPGh/6+E45ikTcYtSleFkUR6T8YRxx7I/XTMtRYjryDU33yu3tw6x+bA
         9EdO+EaE6Wt4WuN5WLhavSYWIMI1P1lzI0w13kD/uPWWjMmqJcjt9wQ8cB0G3QOr7m48
         XyCxkOSgUmouBYk3r+pQ7tzXAxV9RqC643vzrfygcDVCmzwZkh/5H3GVxxDae8MUKoyz
         RjqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691995783; x=1692600583;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VD7vcCS0AfahnxjZX5Uqp4lNJlFItoDuvq1fgETyW90=;
        b=lzKf0bP05Nb4EBBqZiQk1ZUnT8vQMpCDx72Ziyo3oJG1Cfpb+FInA+W08oh7sCz2F6
         jbdBCBJoFpAF0TbmSSLtGmLw/+iJzC0DxMCUNCPvt0/oB8K2uhrb7H3IKJSOsqeNYSca
         p3LZE3tTIaXpCwYPNQqzTb5Fukl9EYqJjYp9NwgtZM+t0FlGNTkdmcakCg/3OC999HQa
         g3OEiNavyod+Dm2S+f9gVC4Y4NnqJUrmJd0n3sKqLsFqwFUEJi54s6VknjW4lD+v4YZi
         SuFkslEijkWJ4uAr4FJgsW1qS1LHoSkcAhPM6loYAD8xP3tJmg8YgYcLhGmtW0whmiiY
         XHEw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0Yz2uoO4O8Bo/3m6Lf3du1Wp70Ji3MMvdSQRE3W9yupW+mhMUv/K
	rNvodWZMP6pWfCVGmAYqQQY=
X-Google-Smtp-Source: AGHT+IEj1ZdS8FiuslwLTJITanAL+Rlcy49yo9vEAmN7KsyhwiCcfCvOmwevAxMdiRG+jU348R25SA==
X-Received: by 2002:a17:90a:17c7:b0:268:2523:652c with SMTP id q65-20020a17090a17c700b002682523652cmr8044002pja.31.1691995782831;
        Sun, 13 Aug 2023 23:49:42 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:902:ab17:b0:1b8:8e7:469f with SMTP id
 ik23-20020a170902ab1700b001b808e7469fls1991000plb.1.-pod-prod-05-us; Sun, 13
 Aug 2023 23:49:41 -0700 (PDT)
X-Received: by 2002:a17:903:22ce:b0:1b8:a555:3865 with SMTP id y14-20020a17090322ce00b001b8a5553865mr3820348plg.6.1691995781417;
        Sun, 13 Aug 2023 23:49:41 -0700 (PDT)
Date: Sun, 13 Aug 2023 23:49:40 -0700 (PDT)
From: Bharathiraja Nallathambi <barathiraja@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <def6ab5f-df34-4c67-84a8-345da51dc39dn@googlegroups.com>
In-Reply-To: <DU0PR04MB94174AF5A7AB203146DCE2138817A@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <AQHZyzwzNUhJGzlGpESf/zNKYJKpn6/o/IbQ>
 <CAGA=GbyPEO8Z9bAgpfRaAaFAg2sqHuvfEzCbCNCUguag4-Nfsg@mail.gmail.com>
 <CAGA=Gbz2Ex86ay715NTjSCDYhqAeOgfO+PemStDzjNOoS+8NWw@mail.gmail.com>
 <CAGA=GbzySq2VRdiufBc2oc3rJDhgPq4q1iky3hpmmhOAD62N8g@mail.gmail.com>
 <CAOx58ZZ3RzsGxDjTys_yoK1d96+dTUgB2aAVVhnegyEWnr5rgQ@mail.gmail.com>
 <DU0PR04MB94174AF5A7AB203146DCE2138817A@DU0PR04MB9417.eurprd04.prod.outlook.com>
Subject: Re: jailhouse - Linux demo on imx8mm (IOT-GATE-iMX8 - Industrial
 IoT Gateway)
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_51104_1079357543.1691995780296"
X-Original-Sender: barathiraja@gmail.com
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

------=_Part_51104_1079357543.1691995780296
Content-Type: multipart/alternative; 
	boundary="----=_Part_51105_13360491.1691995780296"

------=_Part_51105_13360491.1691995780296
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peng,
    Thanks for replying.=20

Yes, I have tried the following,

export PATH=3D$PATH:/usr/share/jailhouse/tools
insmod /lib/modules/5.15.32-iot-gate-imx8m-3.2.1+/extra/driver/jailhouse.ko=
=20
jailhouse enable /usr/share/jailhouse/cells/imx8mm.cell=20
jailhouse cell list

jailhouse cell create /usr/share/jailhouse/cells/imx8mm-inmate-demo.cell
jailhouse cell load inmate-demo /usr/share/jailhouse/inmates/gic-demo.bin
jailhouse cell start inmate-demo
jailhouse cell stats inmate-demo

*Which is working without any issues.*

I find the reported issue with linux-demo

looking forward for support on the same.

Thanks and Regards,
Bharathiraja Nallathambi

On Monday, 14 August 2023 at 06:22:16 UTC+5:30 Peng Fan wrote:

> Have you ever tried a simple inmate demo? Like gic-demo? Does it work?
>
> =20
>
> Regards,
>
> Peng.
>
> =20
>
> *From:* jailho...@googlegroups.com <jailho...@googlegroups.com> *On=20
> Behalf Of *Bharathiraja Nallathambi
> *Sent:* 2023=E5=B9=B48=E6=9C=8810=E6=97=A5 11:39
> *To:* jailho...@googlegroups.com
> *Subject:* jailhouse - Linux demo on imx8mm (IOT-GATE-iMX8 - Industrial=
=20
> IoT Gateway)
>
> =20
>
> Hi,
>
>   As my previous post is marked as spam, i am posting this from my=20
> different mail ID.
>
> =20
>
> I am trying to run jailhouse Linux demo on imx8mm board (
> https://www.compulab.com/products/iot-gateways/iot-gate-imx8-industrial-a=
rm-iot-gateway/
> )
>
>  =20
> After the dts patch and kernel re-build, I am able to run the jailhouse=
=20
> inmate demo (gic-demo.bin) without any issues.
>
>  =20
> When i tried to run jailhouse Linux demo on imx8mm board, i face the=20
> following challenge,
>
> #Enable Jailhouse: =20
> export PATH=3D$PATH:/usr/share/jailhouse/tools
> insmod=20
> /lib/modules/5.15.32-iot-gate-imx8m-3.2.1+/extra/driver/jailhouse.ko=20
> jailhouse enable /usr/share/jailhouse/cells/imx8mm.cell=20
> jailhouse cell list
>
> #try to run Linux
> jailhouse cell linux imx8mm-linux-demo.cell /home/root/jailhouse/vmlinux=
=20
> -d /home/root/jailhouse/sb-iotgimx8.dtb -c "clk_ignore_unused=20
> console=3Dttymxc2,115200 earlycon=3Dec_imx6q,0x30880000,115200 net.ifname=
s=3D0=20
> root=3D/dev/sda2 rootwait rw"
>
> imx8mm-linux-demo.cell - file attached for reference
> sb-iotgimx8.dts - file attached for reference
>
> #jailhouse console output
> root@iot-gate-imx8:~/jailhouse# jailhouse console
>
> Initializing Jailhouse hypervisor v0.2 on CPU 0
> Code location: 0x0000ffffc0200800
> Page pool usage after early setup: mem 39/993, remap 0/131072
> Initializing processors:
>  CPU 0... OK
>  CPU 3... OK
>  CPU 1... OK
>  CPU 2... OK
> Initializing unit: irqchip
> Initializing unit: ARM SMMU v3
> Initializing unit: ARM SMMU
> Initializing unit: PVU IOMMU
> Initializing unit: PCI
> Adding virtual PCI device 00:02.0 to cell "imx8mm"
> Adding virtual PCI device 00:03.0 to cell "imx8mm"
> Adding virtual PCI device 00:00.0 to cell "imx8mm"
> Adding virtual PCI device 00:01.0 to cell "imx8mm"
> Page pool usage after late setup: mem 63/993, remap 144/131072
> Activating hypervisor
> Adding virtual PCI device 00:02.0 to cell "linux-inmate-demo"
> Shared memory connection established, peer cells:
>  "imx8mm"
> Adding virtual PCI device 00:03.0 to cell "linux-inmate-demo"
> Shared memory connection established, peer cells:
>  "imx8mm"
> Adding virtual PCI device 00:00.0 to cell "linux-inmate-demo"
> Shared memory connection established, peer cells:
>  "imx8mm"
> Adding virtual PCI device 00:01.0 to cell "linux-inmate-demo"
> Shared memory connection established, peer cells:
>  "imx8mm"
> Created cell "linux-inmate-demo"
> Page pool usage after cell creation: mem 77/993, remap 144/131072
>
> #jailhouse cell list output
> #root@iot-gate-imx8:~/jailhouse# jailhouse cell list
> ID      Name                    State             Assigned CPUs          =
=20
> Failed CPUs            =20
> 0       imx8mm                  running           0-1                    =
=20
>                        =20
> 1       linux-inmate-demo       shut down         2-3=20
>
> #/proc/cmdline
> console=3Dttymxc2,115200 earlycon=3Dec_imx6q,0x30880000,115200 net.ifname=
s=3D0=20
> root=3D/dev/mmcblk2p2 rootwait rw panic=3D5 oops=3Dpanic
>
> #/proc/iomem
> root@iot-gate-imx8:~/jailhouse# cat /proc/iomem=20
> 00100000-00107fff : 30900000.crypto caam-sm@100000
> 18000000-1fefffff : pcie@33800000
>   18000000-180fffff : 0000:00:00.0
>   18100000-181fffff : PCI Bus 0000:01
>     18100000-18103fff : 0000:01:00.0
>       18100000-18103fff : iwlwifi
>   18200000-1820ffff : 0000:00:00.0
> 1ff00000-1ff7ffff : 33800000.pcie config
> 30200000-3020ffff : 30200000.gpio gpio@30200000
> 30210000-3021ffff : 30210000.gpio gpio@30210000
> 30220000-3022ffff : 30220000.gpio gpio@30220000
> 30230000-3023ffff : 30230000.gpio gpio@30230000
> 30240000-3024ffff : 30240000.gpio gpio@30240000
> 30260000-3026ffff : 30260000.tmu tmu@30260000
> 30280000-3028ffff : 30280000.watchdog watchdog@30280000
> 302b0000-302bffff : 302b0000.dma-controller dma-controller@302b0000
> 302c0000-302cffff : 302c0000.dma-controller dma-controller@302c0000
> 30330000-3033ffff : 30330000.pinctrl pinctrl@30330000
> 30350000-3035ffff : 30350000.efuse efuse@30350000
> 30380000-3038ffff : 30380000.clock-controller clock-controller@30380000
> 30820000-3082ffff : 30820000.spi spi@30820000
> 30860000-3086ffff : 30860000.serial serial@30860000
> 30880000-3088ffff : 30880000.serial serial@30880000
> 30900000-3093ffff : 30900000.crypto crypto@30900000
> 30a20000-30a2ffff : 30a20000.i2c i2c@30a20000
> 30a30000-30a3ffff : 30a30000.i2c i2c@30a30000
> 30a60000-30a6ffff : 30a60000.serial serial@30a60000
> 30aa0000-30aaffff : 30aa0000.mailbox mailbox@30aa0000
> 30b50000-30b5ffff : 30b50000.mmc mmc@30b50000
> 30b60000-30b6ffff : 30b60000.mmc mmc@30b60000
> 30bd0000-30bdffff : 30bd0000.dma-controller dma-controller@30bd0000
> 30be0000-30beffff : 30be0000.ethernet ethernet@30be0000
> 32e28000-32e28003 : 32e28000.dispmix-sft-rstn dispmix-sft-rstn@32e28000
> 32e28004-32e28007 : 32e28004.dispmix-clk-en dispmix-clk-en@32e28004
> 32e28008-32e2800b : 32e28008.dispmix-mipi-rst dispmix-mipi-rst@32e28008
> 32e40000-32e401ff : usb@32e40000
>   32e40000-32e401ff : ci_hdrc.0 usb@32e40000
> 32e40200-32e403ff : 32e40200.usbmisc usbmisc@32e40200
> 32e50000-32e501ff : usb@32e50000
>   32e50000-32e501ff : ci_hdrc.1 usb@32e50000
> 32e50200-32e503ff : 32e50200.usbmisc usbmisc@32e50200
> 32f00000-32f0ffff : 33800000.pcie pcie-phy@32f00000
> 33000000-33001fff : 33000000.dma-controller dma-controller@33000000
> 33800000-33bfffff : 33800000.pcie dbi
> 3d800000-3dbfffff : 3d800000.ddr-pmu ddr-pmu@3d800000
> 40000000-55ffffff : System RAM
>   40610000-41ceffff : Kernel code
>   41cf0000-4206ffff : reserved
>   42070000-423bffff : Kernel data
>   43000000-4300afff : reserved
> 58000000-93bfffff : System RAM
>   6a000000-91ffffff : reserved
> 93c00000-b83fffff : reserved
>   b7c00000-b7ffffff : Jailhouse hypervisor
> b8400000-bb6fffff : System RAM
> bb700000-bbbfffff : reserved
> bbc00000-bfffffff : System RAM
>   bd900000-bfbfffff : reserved
>   bfc6d000-bfc6dfff : reserved
>   bfc6e000-bfce5fff : reserved
>   bfce8000-bfce9fff : reserved
>   bfcea000-bfceafff : reserved
>   bfceb000-bfcfefff : reserved
>   bfcff000-bfcfffff : reserved
>   bfd00000-bfd35fff : reserved
>   bfd36000-bfffffff : reserved
>
>
> #dts patch
>
> From aaee5eb45ada7121c7c34af7049c0db11ea2b572 Mon Sep 17 00:00:00 2001
> From: Bharathiraja Nallathambi <bharathiraja...@xxxxxx.com>
> Date: Mon, 31 Jul 2023 17:14:42 +0000
> Subject: [PATCH] adding reserved memory for jailhouse
>
> - adding reserved memory for jailhouse imx8mm
>
> Signed-off-by: Bharathiraja Nallathambi <bharathiraja...@xxxxxx.com>
> ---
>  arch/arm64/boot/dts/compulab/sb-iotgimx8.dts | 38 ++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/compulab/sb-iotgimx8.dts=20
> b/arch/arm64/boot/dts/compulab/sb-iotgimx8.dts
> index 08de87e55d0b..6539aa8c83f6 100644
> --- a/arch/arm64/boot/dts/compulab/sb-iotgimx8.dts
> +++ b/arch/arm64/boot/dts/compulab/sb-iotgimx8.dts
> @@ -315,3 +315,41 @@ MX8MM_IOMUXC_SAI5_RXC_GPIO3_IO20 0x140
>   };
>   };
>  };
> +
> +&{/reserved-memory} {
> +
> + ivshmem_reserved: ivshmem@bbb00000 {
> + no-map;
> + reg =3D <0 0xbbb00000 0x0 0x00100000>;
> + };
> +
> + ivshmem2_reserved: ivshmem2@bba00000 {
> + no-map;
> + reg =3D <0 0xbba00000 0x0 0x00100000>;
> + };
> +
> + pci_reserved: pci@bb800000 {
> + no-map;
> + reg =3D <0 0xbb800000 0x0 0x00200000>;
> + };
> +
> + loader_reserved: loader@bb700000 {
> + no-map;
> + reg =3D <0 0xbb700000 0x0 0x00100000>;
> + };
> +
> + jh_reserved: jh@b7c00000 {
> + no-map;
> + reg =3D <0 0xb7c00000 0x0 0x00400000>;
> + };
> +
> + /* 512MB */
> + inmate_reserved: inmate@93c00000 {
> + no-map;
> + reg =3D <0 0x93c00000 0x0 0x24000000>;
> + };
> +};
> +
> +&{/reserved-memory/linux,cma} {
> + alloc-ranges =3D <0 0x40000000 0 0x60000000>;
> +};
> --=20
> 2.34.1
>
>
> There is no console output. The terminal froze.
>
> Can someone help me here please.
>  =20
> =20
> --=20
>
> Thanks and Regards,
>
> Bharathiraja Nallathambi
>
>
> =20
>
> --=20
> You received this message because you are subscribed to the Google Groups=
=20
> "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
=20
> email to jailhouse-de...@googlegroups.com.
> To view this discussion on the web visit=20
> https://groups.google.com/d/msgid/jailhouse-dev/CAOx58ZZ3RzsGxDjTys_yoK1d=
96%2BdTUgB2aAVVhnegyEWnr5rgQ%40mail.gmail.com=20
> <https://groups.google.com/d/msgid/jailhouse-dev/CAOx58ZZ3RzsGxDjTys_yoK1=
d96%2BdTUgB2aAVVhnegyEWnr5rgQ%40mail.gmail.com?utm_medium=3Demail&utm_sourc=
e=3Dfooter>
> .
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/def6ab5f-df34-4c67-84a8-345da51dc39dn%40googlegroups.com.

------=_Part_51105_13360491.1691995780296
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peng,<div>=C2=A0 =C2=A0 Thanks for replying.=C2=A0</div><div><br /></div=
><div>Yes, I have tried the following,</div><div><br /></div><div>export PA=
TH=3D$PATH:/usr/share/jailhouse/tools<br />insmod /lib/modules/5.15.32-iot-=
gate-imx8m-3.2.1+/extra/driver/jailhouse.ko <br />jailhouse enable /usr/sha=
re/jailhouse/cells/imx8mm.cell <br />jailhouse cell list<br /><br />jailhou=
se cell create /usr/share/jailhouse/cells/imx8mm-inmate-demo.cell<br />jail=
house cell load inmate-demo /usr/share/jailhouse/inmates/gic-demo.bin<br />=
jailhouse cell start inmate-demo<br />jailhouse cell stats inmate-demo</div=
><div><br /></div><div><b>Which is working without any issues.</b></div><di=
v><br /></div><div>I find the reported issue with=C2=A0linux-demo</div><div=
><br /></div><div>looking forward for support on the same.</div><div><br />=
</div><div>Thanks and Regards,</div><div>Bharathiraja Nallathambi<br /><br =
/></div><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">O=
n Monday, 14 August 2023 at 06:22:16 UTC+5:30 Peng Fan wrote:<br/></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-left: 1=
px solid rgb(204, 204, 204); padding-left: 1ex;">





<div lang=3D"EN-US" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:break=
-word">
<div>
<p class=3D"MsoNormal">Have you ever tried a simple inmate demo? Like gic-d=
emo? Does it work?<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Regards,<u></u><u></u></p>
<p class=3D"MsoNormal">Peng.<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0cm 0cm 0cm =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #e1e1e1 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><b>From:</b> <a href data-email-masked rel=3D"nofoll=
ow">jailho...@googlegroups.com</a> &lt;<a href data-email-masked rel=3D"nof=
ollow">jailho...@googlegroups.com</a>&gt;
<b>On Behalf Of </b>Bharathiraja Nallathambi<br>
<b>Sent:</b> 2023<span lang=3D"ZH-CN" style=3D"font-family:SimSun">=E5=B9=
=B4</span>8<span lang=3D"ZH-CN" style=3D"font-family:SimSun">=E6=9C=88</spa=
n>10<span lang=3D"ZH-CN" style=3D"font-family:SimSun">=E6=97=A5</span> 11:3=
9<br>
<b>To:</b> <a href data-email-masked rel=3D"nofollow">jailho...@googlegroup=
s.com</a><br>
<b>Subject:</b> jailhouse - Linux demo on imx8mm (IOT-GATE-iMX8 - Industria=
l IoT Gateway)<u></u><u></u></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<div>
<div>
<div>
<p class=3D"MsoNormal">Hi,<u></u><u></u></p>
</div>
<div>
<div>
<div>
<p class=3D"MsoNormal">=C2=A0 As my previous post is marked as spam, i am p=
osting this from my different mail ID.<u></u><u></u></p>
</div></div></div></div></div></div></div></div></div></div><div lang=3D"EN=
-US" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:break-word"><div><di=
v style=3D"border:none;border-left:solid blue 1.5pt;padding:0cm 0cm 0cm 4.0=
pt"><div><div><div><div><div><div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">I am trying to run jailhouse Linux demo on imx8mm bo=
ard (<a href=3D"https://www.compulab.com/products/iot-gateways/iot-gate-imx=
8-industrial-arm-iot-gateway/" target=3D"_blank" rel=3D"nofollow" data-safe=
redirecturl=3D"https://www.google.com/url?hl=3Den-GB&amp;q=3Dhttps://www.co=
mpulab.com/products/iot-gateways/iot-gate-imx8-industrial-arm-iot-gateway/&=
amp;source=3Dgmail&amp;ust=3D1692081882488000&amp;usg=3DAOvVaw3ZojOK1LfXimJ=
1AoosFUgv">https://www.compulab.com/products/iot-gateways/iot-gate-imx8-ind=
ustrial-arm-iot-gateway/</a>)<u></u><u></u></p>
<div>
<p class=3D"MsoNormal">=C2=A0 <br>
After the dts patch and kernel re-build, I am able to run the jailhouse inm=
ate demo (gic-demo.bin) without any issues.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 <br>
When i tried to run jailhouse Linux demo on imx8mm board, i face the follow=
ing challenge,<br>
<br>
#Enable Jailhouse: =C2=A0<br>
export PATH=3D$PATH:/usr/share/jailhouse/tools<br>
insmod /lib/modules/5.15.32-iot-gate-imx8m-3.2.1+/extra/driver/jailhouse.ko=
 <br>
jailhouse enable /usr/share/jailhouse/cells/imx8mm.cell <br>
jailhouse cell list<br>
<br>
#try to run Linux<br>
jailhouse cell linux imx8mm-linux-demo.cell /home/root/jailhouse/vmlinux -d=
 /home/root/jailhouse/sb-iotgimx8.dtb -c &quot;clk_ignore_unused console=3D=
ttymxc2,115200 earlycon=3Dec_imx6q,0x30880000,115200 net.ifnames=3D0 root=
=3D/dev/sda2 rootwait rw&quot;<br>
<br>
imx8mm-linux-demo.cell - file attached for reference<br>
sb-iotgimx8.dts - file attached for reference<br>
<br>
#jailhouse console output<br>
root@iot-gate-imx8:~/jailhouse# jailhouse console<br>
<br>
Initializing Jailhouse hypervisor v0.2 on CPU 0<br>
Code location: 0x0000ffffc0200800<br>
Page pool usage after early setup: mem 39/993, remap 0/131072<br>
Initializing processors:<br>
=C2=A0CPU 0... OK<br>
=C2=A0CPU 3... OK<br>
=C2=A0CPU 1... OK<br>
=C2=A0CPU 2... OK<br>
Initializing unit: irqchip<br>
Initializing unit: ARM SMMU v3<br>
Initializing unit: ARM SMMU<br>
Initializing unit: PVU IOMMU<br>
Initializing unit: PCI<br>
Adding virtual PCI device 00:02.0 to cell &quot;imx8mm&quot;<br>
Adding virtual PCI device 00:03.0 to cell &quot;imx8mm&quot;<br>
Adding virtual PCI device 00:00.0 to cell &quot;imx8mm&quot;<br>
Adding virtual PCI device 00:01.0 to cell &quot;imx8mm&quot;<br>
Page pool usage after late setup: mem 63/993, remap 144/131072<br>
Activating hypervisor<br>
Adding virtual PCI device 00:02.0 to cell &quot;linux-inmate-demo&quot;<br>
Shared memory connection established, peer cells:<br>
=C2=A0&quot;imx8mm&quot;<br>
Adding virtual PCI device 00:03.0 to cell &quot;linux-inmate-demo&quot;<br>
Shared memory connection established, peer cells:<br>
=C2=A0&quot;imx8mm&quot;<br>
Adding virtual PCI device 00:00.0 to cell &quot;linux-inmate-demo&quot;<br>
Shared memory connection established, peer cells:<br>
=C2=A0&quot;imx8mm&quot;<br>
Adding virtual PCI device 00:01.0 to cell &quot;linux-inmate-demo&quot;<br>
Shared memory connection established, peer cells:<br>
=C2=A0&quot;imx8mm&quot;<br>
Created cell &quot;linux-inmate-demo&quot;<br>
Page pool usage after cell creation: mem 77/993, remap 144/131072<br>
<br>
#jailhouse cell list output<br>
#root@iot-gate-imx8:~/jailhouse# jailhouse cell list<br>
ID =C2=A0 =C2=A0 =C2=A0Name =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0State =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Ass=
igned CPUs =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Failed CPUs =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0
<br>
0 =C2=A0 =C2=A0 =C2=A0 imx8mm =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0running =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0-1 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
<br>
1 =C2=A0 =C2=A0 =C2=A0 linux-inmate-demo =C2=A0 =C2=A0 =C2=A0 shut down =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 2-3 <br>
<br>
#/proc/cmdline<br>
console=3Dttymxc2,115200 earlycon=3Dec_imx6q,0x30880000,115200 net.ifnames=
=3D0 root=3D/dev/mmcblk2p2 rootwait rw panic=3D5 oops=3Dpanic<br>
<br>
#/proc/iomem<br>
root@iot-gate-imx8:~/jailhouse# cat /proc/iomem <br>
00100000-00107fff : 30900000.crypto caam-sm@100000<br>
18000000-1fefffff : pcie@33800000<br>
=C2=A0 18000000-180fffff : 0000:00:00.0<br>
=C2=A0 18100000-181fffff : PCI Bus 0000:01<br>
=C2=A0 =C2=A0 18100000-18103fff : 0000:01:00.0<br>
=C2=A0 =C2=A0 =C2=A0 18100000-18103fff : iwlwifi<br>
=C2=A0 18200000-1820ffff : 0000:00:00.0<br>
1ff00000-1ff7ffff : 33800000.pcie config<br>
30200000-3020ffff : 30200000.gpio gpio@30200000<br>
30210000-3021ffff : 30210000.gpio gpio@30210000<br>
30220000-3022ffff : 30220000.gpio gpio@30220000<br>
30230000-3023ffff : 30230000.gpio gpio@30230000<br>
30240000-3024ffff : 30240000.gpio gpio@30240000<br>
30260000-3026ffff : 30260000.tmu tmu@30260000<br>
30280000-3028ffff : 30280000.watchdog watchdog@30280000<br>
302b0000-302bffff : 302b0000.dma-controller dma-controller@302b0000<br>
302c0000-302cffff : 302c0000.dma-controller dma-controller@302c0000<br>
30330000-3033ffff : 30330000.pinctrl pinctrl@30330000<br>
30350000-3035ffff : 30350000.efuse efuse@30350000<br>
30380000-3038ffff : 30380000.clock-controller clock-controller@30380000<br>
30820000-3082ffff : 30820000.spi spi@30820000<br>
30860000-3086ffff : 30860000.serial serial@30860000<br>
30880000-3088ffff : 30880000.serial serial@30880000<br>
30900000-3093ffff : 30900000.crypto crypto@30900000<br>
30a20000-30a2ffff : 30a20000.i2c i2c@30a20000<br>
30a30000-30a3ffff : 30a30000.i2c i2c@30a30000<br>
30a60000-30a6ffff : 30a60000.serial serial@30a60000<br>
30aa0000-30aaffff : 30aa0000.mailbox mailbox@30aa0000<br>
30b50000-30b5ffff : 30b50000.mmc mmc@30b50000<br>
30b60000-30b6ffff : 30b60000.mmc mmc@30b60000<br>
30bd0000-30bdffff : 30bd0000.dma-controller dma-controller@30bd0000<br>
30be0000-30beffff : 30be0000.ethernet ethernet@30be0000<br>
32e28000-32e28003 : 32e28000.dispmix-sft-rstn dispmix-sft-rstn@32e28000<br>
32e28004-32e28007 : 32e28004.dispmix-clk-en dispmix-clk-en@32e28004<br>
32e28008-32e2800b : 32e28008.dispmix-mipi-rst dispmix-mipi-rst@32e28008<br>
32e40000-32e401ff : usb@32e40000<br>
=C2=A0 32e40000-32e401ff : ci_hdrc.0 usb@32e40000<br>
32e40200-32e403ff : 32e40200.usbmisc usbmisc@32e40200<br>
32e50000-32e501ff : usb@32e50000<br>
=C2=A0 32e50000-32e501ff : ci_hdrc.1 usb@32e50000<br>
32e50200-32e503ff : 32e50200.usbmisc usbmisc@32e50200<br>
32f00000-32f0ffff : 33800000.pcie pcie-phy@32f00000<br>
33000000-33001fff : 33000000.dma-controller dma-controller@33000000<br>
33800000-33bfffff : 33800000.pcie dbi<br>
3d800000-3dbfffff : 3d800000.ddr-pmu ddr-pmu@3d800000<br>
40000000-55ffffff : System RAM<br>
=C2=A0 40610000-41ceffff : Kernel code<br>
=C2=A0 41cf0000-4206ffff : reserved<br>
=C2=A0 42070000-423bffff : Kernel data<br>
=C2=A0 43000000-4300afff : reserved<br>
58000000-93bfffff : System RAM<br>
=C2=A0 6a000000-91ffffff : reserved<br>
93c00000-b83fffff : reserved<br>
=C2=A0 b7c00000-b7ffffff : Jailhouse hypervisor<br>
b8400000-bb6fffff : System RAM<br>
bb700000-bbbfffff : reserved<br>
bbc00000-bfffffff : System RAM<br>
=C2=A0 bd900000-bfbfffff : reserved<br>
=C2=A0 bfc6d000-bfc6dfff : reserved<br>
=C2=A0 bfc6e000-bfce5fff : reserved<br>
=C2=A0 bfce8000-bfce9fff : reserved<br>
=C2=A0 bfcea000-bfceafff : reserved<br>
=C2=A0 bfceb000-bfcfefff : reserved<br>
=C2=A0 bfcff000-bfcfffff : reserved<br>
=C2=A0 bfd00000-bfd35fff : reserved<br>
=C2=A0 bfd36000-bfffffff : reserved<br>
<br>
<br>
#dts patch<br>
<br>
From aaee5eb45ada7121c7c34af7049c0db11ea2b572 Mon Sep 17 00:00:00 2001<br>
From: Bharathiraja Nallathambi &lt;<a href data-email-masked rel=3D"nofollo=
w">bharathiraja...@xxxxxx.com</a>&gt;<br>
Date: Mon, 31 Jul 2023 17:14:42 +0000<br>
Subject: [PATCH] adding reserved memory for jailhouse<br>
<br>
- adding reserved memory for jailhouse imx8mm<br>
<br>
Signed-off-by: Bharathiraja Nallathambi &lt;<a href data-email-masked rel=
=3D"nofollow">bharathiraja...@xxxxxx.com</a>&gt;<br>
---<br>
=C2=A0arch/arm64/boot/dts/compulab/sb-iotgimx8.dts | 38 +++++++++++++++++++=
+<br>
=C2=A01 file changed, 38 insertions(+)<br>
<br>
diff --git a/arch/arm64/boot/dts/compulab/sb-iotgimx8.dts b/arch/arm64/boot=
/dts/compulab/sb-iotgimx8.dts<br>
index 08de87e55d0b..6539aa8c83f6 100644<br>
--- a/arch/arm64/boot/dts/compulab/sb-iotgimx8.dts<br>
+++ b/arch/arm64/boot/dts/compulab/sb-iotgimx8.dts<br>
@@ -315,3 +315,41 @@ MX8MM_IOMUXC_SAI5_RXC_GPIO3_IO20 0x140<br>
=C2=A0 };<br>
=C2=A0 };<br>
=C2=A0};<br>
+<br>
+&amp;{/reserved-memory} {<br>
+<br>
+ ivshmem_reserved: ivshmem@bbb00000 {<br>
+ no-map;<br>
+ reg =3D &lt;0 0xbbb00000 0x0 0x00100000&gt;;<br>
+ };<br>
+<br>
+ ivshmem2_reserved: ivshmem2@bba00000 {<br>
+ no-map;<br>
+ reg =3D &lt;0 0xbba00000 0x0 0x00100000&gt;;<br>
+ };<br>
+<br>
+ pci_reserved: pci@bb800000 {<br>
+ no-map;<br>
+ reg =3D &lt;0 0xbb800000 0x0 0x00200000&gt;;<br>
+ };<br>
+<br>
+ loader_reserved: loader@bb700000 {<br>
+ no-map;<br>
+ reg =3D &lt;0 0xbb700000 0x0 0x00100000&gt;;<br>
+ };<br>
+<br>
+ jh_reserved: jh@b7c00000 {<br>
+ no-map;<br>
+ reg =3D &lt;0 0xb7c00000 0x0 0x00400000&gt;;<br>
+ };<br>
+<br>
+ /* 512MB */<br>
+ inmate_reserved: inmate@93c00000 {<br>
+ no-map;<br>
+ reg =3D &lt;0 0x93c00000 0x0 0x24000000&gt;;<br>
+ };<br>
+};<br>
+<br>
+&amp;{/reserved-memory/linux,cma} {<br>
+ alloc-ranges =3D &lt;0 0x40000000 0 0x60000000&gt;;<br>
+};<br>
-- <br>
2.34.1<br>
<br>
<br>
There is no console output. The terminal froze.<br>
<br>
Can someone help me here please.<br>
=C2=A0 <br>
=C2=A0<br>
<span>-- </span><u></u><u></u></p>
<div>
<div>
<p class=3D"MsoNormal">Thanks and Regards,<u></u><u></u></p>
<div>
<p class=3D"MsoNormal">Bharathiraja Nallathambi<u></u><u></u></p>
</div>
</div>
</div>
</div>
</div>
</div></div></div></div></div></div></div></div></div><div lang=3D"EN-US" l=
ink=3D"blue" vlink=3D"purple" style=3D"word-wrap:break-word"><div><div styl=
e=3D"border:none;border-left:solid blue 1.5pt;padding:0cm 0cm 0cm 4.0pt"><d=
iv><div><div><div><div><div></div>
<p class=3D"MsoNormal"><br clear=3D"all">
<u></u><u></u></p>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
</div>
</div>
</div>
</div>
</div>
<p class=3D"MsoNormal">-- <br>
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br>
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to
<a href data-email-masked rel=3D"nofollow">jailhouse-de...@googlegroups.com=
</a>.<br>
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAOx58ZZ3RzsGxDjTys_yoK1d96%2BdTUgB2aAVVhnegyEWnr5=
rgQ%40mail.gmail.com?utm_medium=3Demail&amp;utm_source=3Dfooter" target=3D"=
_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url=
?hl=3Den-GB&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/CAOx58Z=
Z3RzsGxDjTys_yoK1d96%252BdTUgB2aAVVhnegyEWnr5rgQ%2540mail.gmail.com?utm_med=
ium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;ust=3D169208188248=
8000&amp;usg=3DAOvVaw3jit9QeFs6zf9vY7Oic26M">
https://groups.google.com/d/msgid/jailhouse-dev/CAOx58ZZ3RzsGxDjTys_yoK1d96=
%2BdTUgB2aAVVhnegyEWnr5rgQ%40mail.gmail.com</a>.<u></u><u></u></p>
</div>
</div>
</div>

</blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/def6ab5f-df34-4c67-84a8-345da51dc39dn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/def6ab5f-df34-4c67-84a8-345da51dc39dn%40googlegroups.co=
m</a>.<br />

------=_Part_51105_13360491.1691995780296--

------=_Part_51104_1079357543.1691995780296--
