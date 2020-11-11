Return-Path: <jailhouse-dev+bncBCALNYGP4YHRB44SWD6QKGQEKU7MNCQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73d.google.com (mail-qk1-x73d.google.com [IPv6:2607:f8b0:4864:20::73d])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB1A2AF589
	for <lists+jailhouse-dev@lfdr.de>; Wed, 11 Nov 2020 16:55:32 +0100 (CET)
Received: by mail-qk1-x73d.google.com with SMTP id z68sf2013650qkc.4
        for <lists+jailhouse-dev@lfdr.de>; Wed, 11 Nov 2020 07:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=kOnRyjZCR5iwfuWuAeuygipuhWxezMtZ7S4pS0YDfeU=;
        b=bl6YqpvESAh1Bc9epcwSOikJ3etYfkSD8s1y8oZLTMIITzmUn3mtdSoZQbj7VH77oD
         W3DhlLy60KuI9cHTcGgOFOGIa/f3Lfjg4qswv440NUXjHgqN4pxS7jOX0z9eiSy2IhMO
         G2jTo4WkzQHz54CZJm0Mdti7VZ0LLsyvS/8uB34D3iLbxb25Pw+3QSXBgjbdGwTW7+o6
         D4vY25SYPT1Cixl/5WKOfJHmkAAJDrU5g43jKks2DGaV5XtL2YEcokkJfh3eYRz60wrn
         Bj1meak3Exh9JfRbkXKgjoqjyX70kWcvMCKmvh33CoJdnY6AhvcauKw2EfD2rsUDHXox
         6ZGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=kOnRyjZCR5iwfuWuAeuygipuhWxezMtZ7S4pS0YDfeU=;
        b=q1Te+Sw22KubrEdgtiDeyDwUT9+7WV9cx5NXQsgKEr1+5BSJlMGTftN6SaTt1iRlx6
         zx4Ayk7+23drqYU+ieuPtms24rHQW6pr5vu2cZSDhTHGI74R8GcXHQt7w9tOZIEd6oxp
         VTc5CmdHB4OGTdcYNM6rKMc8zLZKznIPfIacXa+RKJmN9ZJrw6p3NlVlvnIARAa/sRai
         w5Rp8NsFQ84jYngfGe/BJMutRR97fOGn2UyruOR3d0G1tzdo9yVWJ3Oy3Zq8JTWXGYlH
         +Vp5GuJ9N7A38xMqH08ZWZhynzM4uAjrueYG6DMwJObii8GABnMKYYq5skL0UIMKTG3X
         5qkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=kOnRyjZCR5iwfuWuAeuygipuhWxezMtZ7S4pS0YDfeU=;
        b=RUC1oBTifv9d7YtGtVKwePKUAXDBcKD3gXvWaYVHr/BTVP/o4gdNbyCD8u6KswYv7k
         j0mY9WHziJjpravScKLRAWGsYmFzbjZ4XKWVq1qUsSQo/DUSPz7kTnqYhbHP4fhgK5yh
         uFhL+j/zmQ+TPQpRwItkBt/wIiBdKSRyeEzhgjqxqjE5Pha56rbRiLzB7HSrdF0gpKnY
         sTPzEB4oSxA/oVTmK52tdk4RDX3+IwT0sHDVaNG3coY6Hw7mRrWfqe3MEQVZ16wJ9vem
         YoAwm71CzZYXieCrCrB4GEduypoUK74DH0HsJbipdcG5UPviW+ZYAME9zvN6Ubi7FOXb
         Q7/w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533JV0CeBaVGqQoxf8z/otlVLlw22Bns++yKGrBjkvQ5AcER9C76
	k+u5Uj9COoxNN8kaubZA1pI=
X-Google-Smtp-Source: ABdhPJwweSbxCgstMnMWZWQuBDv3KZ7tjnacvT6N7fNmrejFPVzoV24b2IElM6UyUE3RyMtWTREtag==
X-Received: by 2002:a37:5f85:: with SMTP id t127mr24186253qkb.180.1605110131867;
        Wed, 11 Nov 2020 07:55:31 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:4e29:: with SMTP id d9ls5859428qtw.10.gmail; Wed, 11 Nov
 2020 07:55:31 -0800 (PST)
X-Received: by 2002:ac8:1287:: with SMTP id y7mr24095295qti.108.1605110130544;
        Wed, 11 Nov 2020 07:55:30 -0800 (PST)
Date: Wed, 11 Nov 2020 07:55:29 -0800 (PST)
From: Kai-Feng Chou <mapleelpam@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <b62cf553-ad22-4a2b-9386-d7448fa79043n@googlegroups.com>
In-Reply-To: <f7cf4733-ad92-ae81-3d4c-acdffc81a57b@siemens.com>
References: <345ef7c0-f01c-4032-811d-dbd1318da92a@googlegroups.com>
 <69a501bc-e164-8ee2-f1a0-dac5f896401e@web.de>
 <7a9814a6-dd4b-453a-977b-3e2f86119176n@googlegroups.com>
 <7253133c-e79b-4ae7-93bb-7d58e76ed1cdn@googlegroups.com>
 <38b5b700-e09d-6f36-1dda-2310b5465771@siemens.com>
 <CAMh94uNz0G2-4HXuiArECtNYjSQ-a-GDRdfUcNXfTOj4Mt7eYQ@mail.gmail.com>
 <f7cf4733-ad92-ae81-3d4c-acdffc81a57b@siemens.com>
Subject: Re: Jailhouse support on Arrow SoCKit Evaluation Board
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_36_68489365.1605110129851"
X-Original-Sender: mapleelpam@gmail.com
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

------=_Part_36_68489365.1605110129851
Content-Type: multipart/alternative; 
	boundary="----=_Part_37_1238806467.1605110129851"

------=_Part_37_1238806467.1605110129851
Content-Type: text/plain; charset="UTF-8"

1. what you meant about "backed any RAM" ?  I used mem=1024M to test. And 
my DDR4 is 4G for now.
2. nope only 4G . / thanks for notice. let me remove some unused region.
On Wednesday, 11 November 2020 at 23:52:16 UTC+8 j.kiszka...@gmail.com 
wrote:

> On 11.11.20 16:34, maple Chou wrote:
> > "
> > Last login: Mon May 11 15:35:01 +0000 2020 on /dev/ttyS0.
> > root@stratix10:~# cat /proc/iomem
> > 01000000-7fffffff : System RAM
> >   02080000-02eaffff : Kernel code
> >   02eb0000-0309ffff : reserved
> >   030a0000-031bbfff : Kernel data
> >   79800000-7f7fffff : reserved
> >   7fa30000-7fa34fff : reserved
> > ff800000-ff801fff : ff800000.ethernet
> > ff808000-ff808fff : ff808000.dwmmc0
> > ff8d2000-ff8d20ff : ff8d2000.spi
> > ff900000-ff9fffff : ff8d2000.spi
> > ffb00000-ffb3ffff : ffb00000.usb
> > ffc02000-ffc0201f : serial
> > ffc02900-ffc029ff : ffc02900.i2c
> > ffc03300-ffc033ff : ffc03300.gpio
> > ffd00200-ffd002ff : ffd00200.watchdog
> > ffd10000-ffd10fff : ffd10000.clock-controller
> > ffd11000-ffd11fff : ffd11000.rstmgr
> > ffda0000-ffda0fff : pdma@ffda0000
> >   ffda0000-ffda0fff : ffda0000.pdma
> > ffe00000-ffefffff : ffe00000.sram
> > 180000000-1ffffffff : System RAM
> >   1fae00000-1fb5fffff : reserved
> >   1fb7fe000-1ff5fffff : reserved
> >   1ff72d000-1ff78cfff : reserved
> >   1ff78d000-1ff78dfff : reserved
> >   1ff78e000-1ff7e5fff : reserved
> >   1ff7e8000-1ff7e8fff : reserved
> >   1ff7e9000-1ff7edfff : reserved
> >   1ff7ee000-1ffffffff : reserved
> > root@stratix10:~#
> > 
>
> But you are using address 8,0000,0000 for loading the hypervisor. That
> seems to like it's not backed by any RAM, is it?
>
> > "
> > 
> > and I'd reference this
> > - 
> https://github.com/altera-opensource/u-boot-socfpga/blob/socfpga_v2020.04/arch/arm/mach-socfpga/mmu-arm64_s10.c
> > <
> https://github.com/altera-opensource/u-boot-socfpga/blob/socfpga_v2020.04/arch/arm/mach-socfpga/mmu-arm64_s10.c
> >
>
> That seems to describe possible occupations - or die you really have 124
> GB on your board?
>
> Jan
> -- 
> Siemens AG, T RDA IOT
> Corporate Competence Center Embedded Linux
>
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/b62cf553-ad22-4a2b-9386-d7448fa79043n%40googlegroups.com.

------=_Part_37_1238806467.1605110129851
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

1. what you meant about "backed any RAM" ?&nbsp; I used mem=3D1024M to test=
. And my DDR4 is 4G for now.<br>2. nope only 4G . / thanks for notice. let =
me remove some unused region.<div class=3D"gmail_quote"><div dir=3D"auto" c=
lass=3D"gmail_attr">On Wednesday, 11 November 2020 at 23:52:16 UTC+8 j.kisz=
ka...@gmail.com wrote:<br/></div><blockquote class=3D"gmail_quote" style=3D=
"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-le=
ft: 1ex;">On 11.11.20 16:34, maple Chou wrote:
<br>&gt; &quot;
<br>&gt; Last login: Mon May 11 15:35:01 +0000 2020 on /dev/ttyS0.
<br>&gt; root@stratix10:~# cat /proc/iomem
<br>&gt; 01000000-7fffffff : System RAM
<br>&gt; =C2=A0 02080000-02eaffff : Kernel code
<br>&gt; =C2=A0 02eb0000-0309ffff : reserved
<br>&gt; =C2=A0 030a0000-031bbfff : Kernel data
<br>&gt; =C2=A0 79800000-7f7fffff : reserved
<br>&gt; =C2=A0 7fa30000-7fa34fff : reserved
<br>&gt; ff800000-ff801fff : ff800000.ethernet
<br>&gt; ff808000-ff808fff : ff808000.dwmmc0
<br>&gt; ff8d2000-ff8d20ff : ff8d2000.spi
<br>&gt; ff900000-ff9fffff : ff8d2000.spi
<br>&gt; ffb00000-ffb3ffff : ffb00000.usb
<br>&gt; ffc02000-ffc0201f : serial
<br>&gt; ffc02900-ffc029ff : ffc02900.i2c
<br>&gt; ffc03300-ffc033ff : ffc03300.gpio
<br>&gt; ffd00200-ffd002ff : ffd00200.watchdog
<br>&gt; ffd10000-ffd10fff : ffd10000.clock-controller
<br>&gt; ffd11000-ffd11fff : ffd11000.rstmgr
<br>&gt; ffda0000-ffda0fff : pdma@ffda0000
<br>&gt; =C2=A0 ffda0000-ffda0fff : ffda0000.pdma
<br>&gt; ffe00000-ffefffff : ffe00000.sram
<br>&gt; 180000000-1ffffffff : System RAM
<br>&gt; =C2=A0 1fae00000-1fb5fffff : reserved
<br>&gt; =C2=A0 1fb7fe000-1ff5fffff : reserved
<br>&gt; =C2=A0 1ff72d000-1ff78cfff : reserved
<br>&gt; =C2=A0 1ff78d000-1ff78dfff : reserved
<br>&gt; =C2=A0 1ff78e000-1ff7e5fff : reserved
<br>&gt; =C2=A0 1ff7e8000-1ff7e8fff : reserved
<br>&gt; =C2=A0 1ff7e9000-1ff7edfff : reserved
<br>&gt; =C2=A0 1ff7ee000-1ffffffff : reserved
<br>&gt; root@stratix10:~#
<br>&gt;=20
<br>
<br>But you are using address 8,0000,0000 for loading the hypervisor. That
<br>seems to like it&#39;s not backed by any RAM, is it?
<br>
<br>&gt; &quot;
<br>&gt;=20
<br>&gt; and I&#39;d reference this
<br>&gt; -=C2=A0<a href=3D"https://github.com/altera-opensource/u-boot-socf=
pga/blob/socfpga_v2020.04/arch/arm/mach-socfpga/mmu-arm64_s10.c" target=3D"=
_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url=
?hl=3Den-GB&amp;q=3Dhttps://github.com/altera-opensource/u-boot-socfpga/blo=
b/socfpga_v2020.04/arch/arm/mach-socfpga/mmu-arm64_s10.c&amp;source=3Dgmail=
&amp;ust=3D1605196451259000&amp;usg=3DAFQjCNGWGiT9DCExeF1qoaAWQaqS5bfZiA">h=
ttps://github.com/altera-opensource/u-boot-socfpga/blob/socfpga_v2020.04/ar=
ch/arm/mach-socfpga/mmu-arm64_s10.c</a>
<br>&gt; &lt;<a href=3D"https://github.com/altera-opensource/u-boot-socfpga=
/blob/socfpga_v2020.04/arch/arm/mach-socfpga/mmu-arm64_s10.c" target=3D"_bl=
ank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=
=3Den-GB&amp;q=3Dhttps://github.com/altera-opensource/u-boot-socfpga/blob/s=
ocfpga_v2020.04/arch/arm/mach-socfpga/mmu-arm64_s10.c&amp;source=3Dgmail&am=
p;ust=3D1605196451260000&amp;usg=3DAFQjCNHumsoWfU8ohNXhyjQzPg-Ys9b-FQ">http=
s://github.com/altera-opensource/u-boot-socfpga/blob/socfpga_v2020.04/arch/=
arm/mach-socfpga/mmu-arm64_s10.c</a>&gt;
<br>
<br>That seems to describe possible occupations - or die you really have 12=
4
<br>GB on your board?
<br>
<br>Jan
<br>--=20
<br>Siemens AG, T RDA IOT
<br>Corporate Competence Center Embedded Linux
<br>
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/b62cf553-ad22-4a2b-9386-d7448fa79043n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/b62cf553-ad22-4a2b-9386-d7448fa79043n%40googlegroups.co=
m</a>.<br />

------=_Part_37_1238806467.1605110129851--

------=_Part_36_68489365.1605110129851--
