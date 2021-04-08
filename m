Return-Path: <jailhouse-dev+bncBDMKXRN27YJRBOM2XSBQMGQEAIDSQ5A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x739.google.com (mail-qk1-x739.google.com [IPv6:2607:f8b0:4864:20::739])
	by mail.lfdr.de (Postfix) with ESMTPS id 30137358593
	for <lists+jailhouse-dev@lfdr.de>; Thu,  8 Apr 2021 16:03:39 +0200 (CEST)
Received: by mail-qk1-x739.google.com with SMTP id h21sf1341251qkl.12
        for <lists+jailhouse-dev@lfdr.de>; Thu, 08 Apr 2021 07:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=FqrgVXJXzlN6mIxebu/Mf64+ks0q0NuCC4U5i/hYoQA=;
        b=WBHix7xzFnV9e+tBSnblzCjfsSgCnoZZPIdyY9GKAXvaUZPL8QWrzhx/LrX5/E6B1o
         gTWy2afo2nfA2zRnr9D2Nau6tXEixzgbTe9tYYTv7+JW2qxbko09geVzdSiOySilanpW
         XpjCVJHRQj8KL3Wh23FxyUuqnYdetIhTb1wEe6bZWDWLXa234w9QcNjpRfXpIqNAbZ7A
         QrxxHcQulKQoN8kS868uYYqLTFo+yzWYQVPirUXCzoV/rj0tAih81xcx1krNsg1IbbXr
         4tdAqDJAHfDn8OWwLHQ2j5gMxWTn+fCNxqtlson/fSJ7BrpAK3bdsMwWMC1EJenyEmgX
         NR5w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=FqrgVXJXzlN6mIxebu/Mf64+ks0q0NuCC4U5i/hYoQA=;
        b=Hky6XegM7RXq2mcD7zxACTkC5EIhMoV9BGRy6nubvd+Z7dJG3uLjOi/2VbnARdtdk3
         7J1YwAJFHkcz/2VSModNrvc5PxzJ2MXpOJv8VeI3qpsrZNIc0KCnV7xdRzTxOO+2tAGL
         epTRwFN0nB14QNo3LyDeloT6ShbWHdUgentdV3wZM2zb+XNWn57/1z7mphpvqC0WCGsT
         fL+S33viFlEcV26cS2wSEKP0ESp2pTtit4BxNG/LxulashSjP97oOm7yPsEUJNcRSgLJ
         05cqJJDxkBiVjFpuQSp+WvauGKTudrI1IFFJsrzR1szuQFPuYccsfLJEG/dc9NVGFybT
         ZNjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=FqrgVXJXzlN6mIxebu/Mf64+ks0q0NuCC4U5i/hYoQA=;
        b=NSv0fKCs1LBPaabF++Kg+aZtU0TloWDmKfV0EjWp56LxySYoC2aQljGvLZPLwJM6sw
         jc+fSVCbZdT1Mfbp0KzdLnt2TLVfOkYtXDMMKYFyn+2siB9hziI6dpeWGACs/oB8kxu6
         RQ+QzBZzpI95ebGUK1rrfri5MC/D7jjU3atzmVzxCzSXKvS7YZSvaNxDpPHoBCrzYQIQ
         YF6SZmEWp03CVEEmaxIWV65BjJB9pamxakuEBJgtwgVHR+P1w1COEZfR8WTQCfHrYqcm
         vqvzoe6xAFU2msdMyYFnNRdPDFFe5KOVUO3yB1rmqmp0jRUlClDjRrtRW7SkCYr5rF1s
         gIcw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530r3xhTscW3hK1ymAsg4hO9sSJpDcGOPF2MM7IFXFbjuKA9ZN4C
	kql3H0pJWVJCyrbx5TB/mmg=
X-Google-Smtp-Source: ABdhPJzJhtojOUomvRsEtSwmsYheR+PHepvPq//LzaYWzW4k9U+SEs0FwDAr/jWlsL5qemcurBKE+w==
X-Received: by 2002:ac8:5f49:: with SMTP id y9mr7648155qta.152.1617890618112;
        Thu, 08 Apr 2021 07:03:38 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a37:c207:: with SMTP id i7ls3232995qkm.9.gmail; Thu, 08 Apr
 2021 07:03:37 -0700 (PDT)
X-Received: by 2002:a05:620a:1474:: with SMTP id j20mr8714027qkl.272.1617890612897;
        Thu, 08 Apr 2021 07:03:32 -0700 (PDT)
Date: Thu, 8 Apr 2021 07:03:32 -0700 (PDT)
From: Junjie Shi <shijunjie92@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <6280a288-f7b6-4e56-a9c8-3206c30ec36fn@googlegroups.com>
In-Reply-To: <7cf1060e-2b4f-4d3f-a57e-a3079a4ef460@googlegroups.com>
References: <3b1a5cb0-d89a-4f0e-aa59-88e4f48999a8@googlegroups.com>
 <c6de1284-fa93-cb9c-44b2-552f851a5470@web.de>
 <7cf1060e-2b4f-4d3f-a57e-a3079a4ef460@googlegroups.com>
Subject: Re: jailhouse compilation error (no include path)
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2886_401971620.1617890612310"
X-Original-Sender: shijunjie92@gmail.com
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

------=_Part_2886_401971620.1617890612310
Content-Type: multipart/alternative; 
	boundary="----=_Part_2887_1303795578.1617890612310"

------=_Part_2887_1303795578.1617890612310
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,
I also have the same problem for Jetpack 4.3 and 4.4 for Jetson TX2.
Have you solved this problem?

Best,
Junjie

=E5=9C=A82020=E5=B9=B42=E6=9C=8811=E6=97=A5=E6=98=9F=E6=9C=9F=E4=BA=8C UTC+=
1 =E4=B8=8B=E5=8D=889:56:45<Saroj Sapkota> =E5=86=99=E9=81=93=EF=BC=9A

> Thank you Jan, for the continuous support and encouragement=20
>
> I also tried in upstream kernel v4.9-tegra and  got the same error.
>
> Furthermore, I also try to cross compile on x86 host(different machine)=
=20
> one  with v4.4, and other with v5.0.1 all of them results in the same err=
or.
>
> So whats the issue here I get really frustrated as same error pops up=20
> everywhere.
>
>
> On Saturday, February 8, 2020 at 3:10:12 AM UTC-6, Jan Kiszka wrote:
>>
>> On 07.02.20 23:55, Saroj Sapkota wrote:=20
>> > While trying to built on jailhouse(master version) on jetson tx2 board=
=20
>> I=20
>> > get the following  error:=20
>> > kernel version-4.9--tegra=20
>> > nvidia@jetson-0320218169735:~/jailhouse$ sudo make:=20
>> >   CHK      /home/nvidia/jailhouse/hypervisor/include/generated/
>> config.mk=20
>> >    UPD     /home/nvidia/jailhouse/hypervisor/include/generated/
>> config.mk=20
>> >   CC     =20
>> /home/nvidia/jailhouse/configs/arm64/amd-seattle-inmate-demo.o=20
>> >    OBJCOPY=20
>> /home/nvidia/jailhouse/configs/arm64/amd-seattle-inmate-demo.cell=20
>> >    CC     =20
>> /home/nvidia/jailhouse/configs/arm64/amd-seattle-linux-demo.o=20
>> >    OBJCOPY=20
>> /home/nvidia/jailhouse/configs/arm64/amd-seattle-linux-demo.cell=20
>> >    CC      /home/nvidia/jailhouse/configs/arm64/amd-seattle.o=20
>> >    OBJCOPY /home/nvidia/jailhouse/configs/arm64/amd-seattle.cell=20
>> >    CC     =20
>> /home/nvidia/jailhouse/configs/arm64/espressobin-inmate-demo.o=20
>> >    OBJCOPY=20
>> /home/nvidia/jailhouse/configs/arm64/espressobin-inmate-demo.cell=20
>> >    CC     =20
>> /home/nvidia/jailhouse/configs/arm64/espressobin-linux-demo.o=20
>> >    OBJCOPY=20
>> /home/nvidia/jailhouse/configs/arm64/espressobin-linux-demo.cell=20
>> >    CC      /home/nvidia/jailhouse/configs/arm64/espressobin.o=20
>> >    OBJCOPY /home/nvidia/jailhouse/configs/arm64/espressobin.cell=20
>> >    CC     =20
>> /home/nvidia/jailhouse/configs/arm64/foundation-v8-inmate-demo.o=20
>> >    OBJCOPY=20
>> > /home/nvidia/jailhouse/configs/arm64/foundation-v8-inmate-demo.cell=20
>> >    CC     =20
>> /home/nvidia/jailhouse/configs/arm64/foundation-v8-linux-demo.o=20
>> >    OBJCOPY=20
>> > /home/nvidia/jailhouse/configs/arm64/foundation-v8-linux-demo.cell=20
>> >    CC      /home/nvidia/jailhouse/configs/arm64/foundation-v8.o=20
>> >    OBJCOPY /home/nvidia/jailhouse/configs/arm64/foundation-v8.cell=20
>> >    CC      /home/nvidia/jailhouse/configs/arm64/hikey-inmate-demo.o=20
>> >    OBJCOPY /home/nvidia/jailhouse/configs/arm64/hikey-inmate-demo.cell=
=20
>> >    CC      /home/nvidia/jailhouse/configs/arm64/hikey-linux-demo.o=20
>> >    OBJCOPY /home/nvidia/jailhouse/configs/arm64/hikey-linux-demo.cell=
=20
>> >    CC      /home/nvidia/jailhouse/configs/arm64/hikey.o=20
>> >    OBJCOPY /home/nvidia/jailhouse/configs/arm64/hikey.cell=20
>> >    CC      /home/nvidia/jailhouse/configs/arm64/imx8mq-inmate-demo.o=
=20
>> >    OBJCOPY /home/nvidia/jailhouse/configs/arm64/imx8mq-inmate-demo.cel=
l=20
>> >    CC      /home/nvidia/jailhouse/configs/arm64/imx8mq.o=20
>> >    OBJCOPY /home/nvidia/jailhouse/configs/arm64/imx8mq.cell=20
>> >    CC     =20
>> /home/nvidia/jailhouse/configs/arm64/jetson-tx1-inmate-demo.o=20
>> >    OBJCOPY=20
>> /home/nvidia/jailhouse/configs/arm64/jetson-tx1-inmate-demo.cell=20
>> >    CC      /home/nvidia/jailhouse/configs/arm64/jetson-tx1-linux-demo.=
o=20
>> >    OBJCOPY=20
>> /home/nvidia/jailhouse/configs/arm64/jetson-tx1-linux-demo.cell=20
>> >    CC      /home/nvidia/jailhouse/configs/arm64/jetson-tx1.o=20
>> >    OBJCOPY /home/nvidia/jailhouse/configs/arm64/jetson-tx1.cell=20
>> >    CC     =20
>> /home/nvidia/jailhouse/configs/arm64/jetson-tx2-inmate-demo.o=20
>> >    OBJCOPY=20
>> /home/nvidia/jailhouse/configs/arm64/jetson-tx2-inmate-demo.cell=20
>> >    CC      /home/nvidia/jailhouse/configs/arm64/jetson-tx2.o=20
>> >    OBJCOPY /home/nvidia/jailhouse/configs/arm64/jetson-tx2.cell=20
>> >    CC     =20
>> /home/nvidia/jailhouse/configs/arm64/k3-am654-idk-linux-demo.o=20
>> >    OBJCOPY=20
>> /home/nvidia/jailhouse/configs/arm64/k3-am654-idk-linux-demo.cell=20
>> >    CC      /home/nvidia/jailhouse/configs/arm64/k3-am654-idk.o=20
>> >    OBJCOPY /home/nvidia/jailhouse/configs/arm64/k3-am654-idk.cell=20
>> >    CC      /home/nvidia/jailhouse/configs/arm64/k3-am654-inmate-demo.o=
=20
>> >    OBJCOPY=20
>> /home/nvidia/jailhouse/configs/arm64/k3-am654-inmate-demo.cell=20
>> >    CC     =20
>> /home/nvidia/jailhouse/configs/arm64/k3-j721e-evm-inmate-demo.o=20
>> >    OBJCOPY=20
>> > /home/nvidia/jailhouse/configs/arm64/k3-j721e-evm-inmate-demo.cell=20
>> >    CC     =20
>> /home/nvidia/jailhouse/configs/arm64/k3-j721e-evm-linux-demo.o=20
>> >    OBJCOPY=20
>> /home/nvidia/jailhouse/configs/arm64/k3-j721e-evm-linux-demo.cell=20
>> >    CC      /home/nvidia/jailhouse/configs/arm64/k3-j721e-evm.o=20
>> >    OBJCOPY /home/nvidia/jailhouse/configs/arm64/k3-j721e-evm.cell=20
>> >    CC     =20
>> /home/nvidia/jailhouse/configs/arm64/macchiatobin-inmate-demo.o=20
>> >    OBJCOPY=20
>> > /home/nvidia/jailhouse/configs/arm64/macchiatobin-inmate-demo.cell=20
>> >    CC     =20
>> /home/nvidia/jailhouse/configs/arm64/macchiatobin-linux-demo.o=20
>> >    OBJCOPY=20
>> /home/nvidia/jailhouse/configs/arm64/macchiatobin-linux-demo.cell=20
>> >    CC      /home/nvidia/jailhouse/configs/arm64/macchiatobin.o=20
>> >    OBJCOPY /home/nvidia/jailhouse/configs/arm64/macchiatobin.cell=20
>> >    CC=20
>> > /home/nvidia/jailhouse/configs/arm64/miriac-sbc-ls1046a-inmate-demo.o=
=20
>> >    OBJCOPY=20
>> >=20
>> /home/nvidia/jailhouse/configs/arm64/miriac-sbc-ls1046a-inmate-demo.cell=
=20
>> >    CC=20
>> > /home/nvidia/jailhouse/configs/arm64/miriac-sbc-ls1046a-linux-demo.o=
=20
>> >    OBJCOPY=20
>> > /home/nvidia/jailhouse/configs/arm64/miriac-sbc-ls1046a-linux-demo.cel=
l=20
>> >    CC      /home/nvidia/jailhouse/configs/arm64/miriac-sbc-ls1046a.o=
=20
>> >    OBJCOPY /home/nvidia/jailhouse/configs/arm64/miriac-sbc-ls1046a.cel=
l=20
>> >    CC     =20
>> /home/nvidia/jailhouse/configs/arm64/qemu-arm64-inmate-demo.o=20
>> >    OBJCOPY=20
>> /home/nvidia/jailhouse/configs/arm64/qemu-arm64-inmate-demo.cell=20
>> >    CC      /home/nvidia/jailhouse/configs/arm64/qemu-arm64-linux-demo.=
o=20
>> >    OBJCOPY=20
>> /home/nvidia/jailhouse/configs/arm64/qemu-arm64-linux-demo.cell=20
>> >    CC      /home/nvidia/jailhouse/configs/arm64/qemu-arm64.o=20
>> >    OBJCOPY /home/nvidia/jailhouse/configs/arm64/qemu-arm64.cell=20
>> >    CC      /home/nvidia/jailhouse/configs/arm64/rpi4-inmate-demo.o=20
>> >    OBJCOPY /home/nvidia/jailhouse/configs/arm64/rpi4-inmate-demo.cell=
=20
>> >    CC      /home/nvidia/jailhouse/configs/arm64/rpi4-linux-demo.o=20
>> >    OBJCOPY /home/nvidia/jailhouse/configs/arm64/rpi4-linux-demo.cell=
=20
>> >    CC      /home/nvidia/jailhouse/configs/arm64/rpi4.o=20
>> >    OBJCOPY /home/nvidia/jailhouse/configs/arm64/rpi4.cell=20
>> >    CC      /home/nvidia/jailhouse/configs/arm64/ultra96-inmate-demo.o=
=20
>> >    OBJCOPY=20
>> /home/nvidia/jailhouse/configs/arm64/ultra96-inmate-demo.cell=20
>> >    CC      /home/nvidia/jailhouse/configs/arm64/ultra96-linux-demo.o=
=20
>> >    OBJCOPY /home/nvidia/jailhouse/configs/arm64/ultra96-linux-demo.cel=
l=20
>> >    CC      /home/nvidia/jailhouse/configs/arm64/ultra96.o=20
>> >    OBJCOPY /home/nvidia/jailhouse/configs/arm64/ultra96.cell=20
>> >    CC     =20
>> /home/nvidia/jailhouse/configs/arm64/zynqmp-zcu102-inmate-demo.o=20
>> >    OBJCOPY=20
>> > /home/nvidia/jailhouse/configs/arm64/zynqmp-zcu102-inmate-demo.cell=20
>> >    CC     =20
>> /home/nvidia/jailhouse/configs/arm64/zynqmp-zcu102-linux-demo-2.o=20
>> >    OBJCOPY=20
>> > /home/nvidia/jailhouse/configs/arm64/zynqmp-zcu102-linux-demo-2.cell=
=20
>> >    CC     =20
>> /home/nvidia/jailhouse/configs/arm64/zynqmp-zcu102-linux-demo.o=20
>> >    OBJCOPY=20
>> > /home/nvidia/jailhouse/configs/arm64/zynqmp-zcu102-linux-demo.cell=20
>> >    CC      /home/nvidia/jailhouse/configs/arm64/zynqmp-zcu102.o=20
>> >    OBJCOPY /home/nvidia/jailhouse/configs/arm64/zynqmp-zcu102.cell=20
>> >    DTC    =20
>> /home/nvidia/jailhouse/configs/arm64/dts/inmate-amd-seattle.dtb=20
>> >=20
>> > /home/nvidia/jailhouse/configs/arm64/dts/inmate-amd-seattle.dts:17:54:=
=20
>> > error: no include path in which to search for=20
>> > dt-bindings/interrupt-controller/arm-gic.h=20
>> > scripts/Makefile.lib:291: recipe for target=20
>> > '/home/nvidia/jailhouse/configs/arm64/dts/inmate-amd-seattle.dtb'=20
>> failed=20
>> > make[3]: ***=20
>> > [/home/nvidia/jailhouse/configs/arm64/dts/inmate-amd-seattle.dtb] Erro=
r=20
>> 1=20
>> > scripts/Makefile.build:479: recipe for target=20
>> > '/home/nvidia/jailhouse/configs' failed=20
>> > make[2]: *** [/home/nvidia/jailhouse/configs] Error 2=20
>> > Makefile:1429: recipe for target '_module_/home/nvidia/jailhouse'=20
>> failed=20
>> > make[1]: *** [_module_/home/nvidia/jailhouse] Error 2=20
>> > Makefile:40: recipe for target 'modules' failed=20
>> > make: *** [modules] Error 2=20
>> > I also tried it cross compiling in host machine and I got the same=20
>> > error. (i also tried cross compiling in different x86 machine one with=
=20
>> > kernel-4.4 (ubuntu 16.04) and another with kernel-5.01(ubuntu 18.04)=
=20
>> but=20
>> > same error as above pops up)=20
>>
>> Then it is likely an issue with that downstream NVIDIA kernel. Jailhouse=
=20
>> builds fine against upstream v4.9.213 (although that is surely no longer=
=20
>> a recommended version for it). Maybe NVIDIA fixed that in newer versions=
=20
>> of their SDK.=20
>>
>> Jan=20
>>
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/6280a288-f7b6-4e56-a9c8-3206c30ec36fn%40googlegroups.com.

------=_Part_2887_1303795578.1617890612310
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi,</div><div>I also have the same problem for Jetpack 4.3 and 4.4 for=
 Jetson TX2.</div>Have you solved this problem?<div><br></div><div>Best,</d=
iv><div>Junjie<br><br></div><div class=3D"gmail_quote"><div dir=3D"auto" cl=
ass=3D"gmail_attr">=E5=9C=A82020=E5=B9=B42=E6=9C=8811=E6=97=A5=E6=98=9F=E6=
=9C=9F=E4=BA=8C UTC+1 =E4=B8=8B=E5=8D=889:56:45&lt;Saroj Sapkota> =E5=86=99=
=E9=81=93=EF=BC=9A<br/></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: =
1ex;"><div dir=3D"ltr"><div>Thank you Jan, for the continuous support and e=
ncouragement <br></div><div><br></div><div>I also tried in upstream kernel =
v4.9-tegra and=C2=A0 got the same error.</div><div><br></div><div>Furthermo=
re, I also try to cross compile on x86 host(different machine) one=C2=A0 wi=
th v4.4, and other with v5.0.1 all of them results in the same error.</div>=
<div><br></div><div>So whats the issue here I get really frustrated as same=
 error pops up everywhere.<br></div></div><div dir=3D"ltr"><div><br></div><=
br>On Saturday, February 8, 2020 at 3:10:12 AM UTC-6, Jan Kiszka wrote:<blo=
ckquote class=3D"gmail_quote" style=3D"margin:0;margin-left:0.8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">On 07.02.20 23:55, Saroj Sapkota wrote:
<br>&gt; While trying to built on jailhouse(master version) on jetson tx2 b=
oard I
<br>&gt; get the following=C2=A0 error:
<br>&gt; kernel version-4.9--tegra
<br>&gt; nvidia@jetson-0320218169735:~/jailhouse$ sudo make:
<br>&gt; =C2=A0=C2=A0CHK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/hypervisor/include/generated/<a href=3D"http://config.mk" rel=3D"nofollo=
w" target=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?hl=
=3Dzh-CN&amp;q=3Dhttp://config.mk&amp;source=3Dgmail&amp;ust=3D161797676904=
7000&amp;usg=3DAFQjCNEVHnRJyTQxEag_M0CMFQhdQG5ZTA">config.mk</a>
<br>&gt; =C2=A0=C2=A0 UPD=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhouse/hy=
pervisor/include/generated/<a href=3D"http://config.mk" rel=3D"nofollow" ta=
rget=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dzh-=
CN&amp;q=3Dhttp://config.mk&amp;source=3Dgmail&amp;ust=3D1617976769047000&a=
mp;usg=3DAFQjCNEVHnRJyTQxEag_M0CMFQhdQG5ZTA">config.mk</a>
<br>&gt; =C2=A0=C2=A0CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhous=
e/configs/arm64/amd-seattle-inmate-demo.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/amd-seat=
tle-inmate-demo.cell
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/configs/arm64/amd-seattle-linux-demo.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/amd-seat=
tle-linux-demo.cell
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/configs/arm64/amd-seattle.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/amd-seat=
tle.cell
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/configs/arm64/espressobin-inmate-demo.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/espresso=
bin-inmate-demo.cell
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/configs/arm64/espressobin-linux-demo.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/espresso=
bin-linux-demo.cell
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/configs/arm64/espressobin.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/espresso=
bin.cell
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/configs/arm64/foundation-v8-inmate-demo.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY
<br>&gt; /home/nvidia/jailhouse/configs/arm64/foundation-v8-inmate-demo.cel=
l
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/configs/arm64/foundation-v8-linux-demo.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY
<br>&gt; /home/nvidia/jailhouse/configs/arm64/foundation-v8-linux-demo.cell
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/configs/arm64/foundation-v8.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/foundati=
on-v8.cell
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/configs/arm64/hikey-inmate-demo.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/hikey-in=
mate-demo.cell
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/configs/arm64/hikey-linux-demo.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/hikey-li=
nux-demo.cell
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/configs/arm64/hikey.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/hikey.ce=
ll
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/configs/arm64/imx8mq-inmate-demo.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/imx8mq-i=
nmate-demo.cell
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/configs/arm64/imx8mq.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/imx8mq.c=
ell
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/configs/arm64/jetson-tx1-inmate-demo.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/jetson-t=
x1-inmate-demo.cell
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/configs/arm64/jetson-tx1-linux-demo.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/jetson-t=
x1-linux-demo.cell
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/configs/arm64/jetson-tx1.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/jetson-t=
x1.cell
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/configs/arm64/jetson-tx2-inmate-demo.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/jetson-t=
x2-inmate-demo.cell
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/configs/arm64/jetson-tx2.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/jetson-t=
x2.cell
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/configs/arm64/k3-am654-idk-linux-demo.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/k3-am654=
-idk-linux-demo.cell
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/configs/arm64/k3-am654-idk.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/k3-am654=
-idk.cell
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/configs/arm64/k3-am654-inmate-demo.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/k3-am654=
-inmate-demo.cell
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/configs/arm64/k3-j721e-evm-inmate-demo.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY
<br>&gt; /home/nvidia/jailhouse/configs/arm64/k3-j721e-evm-inmate-demo.cell
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/configs/arm64/k3-j721e-evm-linux-demo.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/k3-j721e=
-evm-linux-demo.cell
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/configs/arm64/k3-j721e-evm.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/k3-j721e=
-evm.cell
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/configs/arm64/macchiatobin-inmate-demo.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY
<br>&gt; /home/nvidia/jailhouse/configs/arm64/macchiatobin-inmate-demo.cell
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/configs/arm64/macchiatobin-linux-demo.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/macchiat=
obin-linux-demo.cell
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/configs/arm64/macchiatobin.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/macchiat=
obin.cell
<br>&gt; =C2=A0=C2=A0 CC
<br>&gt; /home/nvidia/jailhouse/configs/arm64/miriac-sbc-ls1046a-inmate-dem=
o.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY
<br>&gt; /home/nvidia/jailhouse/configs/arm64/miriac-sbc-ls1046a-inmate-dem=
o.cell
<br>&gt; =C2=A0=C2=A0 CC
<br>&gt; /home/nvidia/jailhouse/configs/arm64/miriac-sbc-ls1046a-linux-demo=
.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY
<br>&gt; /home/nvidia/jailhouse/configs/arm64/miriac-sbc-ls1046a-linux-demo=
.cell
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/configs/arm64/miriac-sbc-ls1046a.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/miriac-s=
bc-ls1046a.cell
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/configs/arm64/qemu-arm64-inmate-demo.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/qemu-arm=
64-inmate-demo.cell
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/configs/arm64/qemu-arm64-linux-demo.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/qemu-arm=
64-linux-demo.cell
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/configs/arm64/qemu-arm64.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/qemu-arm=
64.cell
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/configs/arm64/rpi4-inmate-demo.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/rpi4-inm=
ate-demo.cell
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/configs/arm64/rpi4-linux-demo.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/rpi4-lin=
ux-demo.cell
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/configs/arm64/rpi4.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/rpi4.cel=
l
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/configs/arm64/ultra96-inmate-demo.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/ultra96-=
inmate-demo.cell
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/configs/arm64/ultra96-linux-demo.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/ultra96-=
linux-demo.cell
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/configs/arm64/ultra96.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/ultra96.=
cell
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/configs/arm64/zynqmp-zcu102-inmate-demo.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY
<br>&gt; /home/nvidia/jailhouse/configs/arm64/zynqmp-zcu102-inmate-demo.cel=
l
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/configs/arm64/zynqmp-zcu102-linux-demo-2.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY
<br>&gt; /home/nvidia/jailhouse/configs/arm64/zynqmp-zcu102-linux-demo-2.ce=
ll
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/configs/arm64/zynqmp-zcu102-linux-demo.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY
<br>&gt; /home/nvidia/jailhouse/configs/arm64/zynqmp-zcu102-linux-demo.cell
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/configs/arm64/zynqmp-zcu102.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/zynqmp-z=
cu102.cell
<br>&gt; =C2=A0=C2=A0 DTC=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhouse/co=
nfigs/arm64/dts/inmate-amd-seattle.dtb
<br>&gt;
<br>&gt; /home/nvidia/jailhouse/configs/arm64/dts/inmate-amd-seattle.dts:17=
:54:
<br>&gt; error: no include path in which to search for
<br>&gt; dt-bindings/interrupt-controller/arm-gic.h
<br>&gt; scripts/Makefile.lib:291: recipe for target
<br>&gt; &#39;/home/nvidia/jailhouse/configs/arm64/dts/inmate-amd-seattle.d=
tb&#39; failed
<br>&gt; make[3]: ***
<br>&gt; [/home/nvidia/jailhouse/configs/arm64/dts/inmate-amd-seattle.dtb] =
Error 1
<br>&gt; scripts/Makefile.build:479: recipe for target
<br>&gt; &#39;/home/nvidia/jailhouse/configs&#39; failed
<br>&gt; make[2]: *** [/home/nvidia/jailhouse/configs] Error 2
<br>&gt; Makefile:1429: recipe for target &#39;_module_/home/nvidia/jailhou=
se&#39; failed
<br>&gt; make[1]: *** [_module_/home/nvidia/jailhouse] Error 2
<br>&gt; Makefile:40: recipe for target &#39;modules&#39; failed
<br>&gt; make: *** [modules] Error 2
<br>&gt; I also tried it cross compiling in host machine and I got the same
<br>&gt; error. (i also tried cross compiling in different x86 machine one =
with
<br>&gt; kernel-4.4 (ubuntu 16.04) and another with kernel-5.01(ubuntu 18.0=
4) but
<br>&gt; same error as above pops up)
<br>
<br>Then it is likely an issue with that downstream NVIDIA kernel. Jailhous=
e
<br>builds fine against upstream v4.9.213 (although that is surely no longe=
r
<br>a recommended version for it). Maybe NVIDIA fixed that in newer version=
s
<br>of their SDK.
<br>
<br>Jan
<br></blockquote></div></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/6280a288-f7b6-4e56-a9c8-3206c30ec36fn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/6280a288-f7b6-4e56-a9c8-3206c30ec36fn%40googlegroups.co=
m</a>.<br />

------=_Part_2887_1303795578.1617890612310--

------=_Part_2886_401971620.1617890612310--
