Return-Path: <jailhouse-dev+bncBCKO35F6UENRBS5IXHZAKGQEOIQYF2A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x239.google.com (mail-oi1-x239.google.com [IPv6:2607:f8b0:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE77165A56
	for <lists+jailhouse-dev@lfdr.de>; Thu, 20 Feb 2020 10:41:33 +0100 (CET)
Received: by mail-oi1-x239.google.com with SMTP id k206sf3678378oia.22
        for <lists+jailhouse-dev@lfdr.de>; Thu, 20 Feb 2020 01:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=WztBQww/TL6fWWrO2wmNRzvCwEMINzkxWzuJdIBQ5Do=;
        b=bw1HRJSd9YWBKzauOW8WO3t1EM3tdF3REvDUfrH9nzn+Lzbq+0yTFJbMK3dRvuV7E8
         crsnavSbsq++Xn6/+21uGCejjE46uKDfuHlAC7nT6zkE7XeAKfHjFHSqL3Y3Nw+C94du
         O+AhuZi4vfChrmRLynoYXvBw9Gs5DMikKbGZ2idN7kNfnkmGh+73tV5QdkYIjTPu5fuD
         Ji60p4ggZQw0//7C3rwi7Ez1npz8thRkl9EH3xQYDQvfKMcg4TpFvIpCrAl2VABwt+ck
         N5/1CbgtliDp0Kq72W22fcPZK02ZtikJVSzLVESqrAUWLL6h6ywQVkCAmhcndxWQPfVg
         5qIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=WztBQww/TL6fWWrO2wmNRzvCwEMINzkxWzuJdIBQ5Do=;
        b=AJRwEl41lCXKOdMxl10LQ4QgBfPk0sCs05PKfJvQQuL6pLtNumoMhNcUwmGRl44DyV
         7q2AW50Y8NENnYxm7PEvy2Jqa8KryFNecnqfaoGpQ6WKRlZ6KgoFcnN2aehJZrbQy4E7
         jDEQuVw9Q7ddlZ79N+HXVS9o+/lSQ9NmxtcfJYOSqKoYZnhRgiEENqAYLKYGTrXHwppg
         nHpdoe1chK0BUV3kEHI+hJjoBw+C8IrZoW0Rowk2fojW+MtCkFbSRQnVDEZInZ1FgV+l
         j5l3ukfrXiK3Lad0SXkBgWkySyfJb/xHcbWKRHQgG03D+KEArnGdT81m1EWvFCwH/xBE
         h75w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=WztBQww/TL6fWWrO2wmNRzvCwEMINzkxWzuJdIBQ5Do=;
        b=gB0HfY6RkCcVO6JqvSPNJyaqrhVBuS/XgE0juddwU/BPvSAd2z/C1lFJgT2crLANxH
         gCEneEUOoWiEzoWBBY7b4K39MrHCP7nlgyD3y4GZpnd6dhSNAKgH0um++QGg22HIWAxv
         C3aAIRaqXv0YNp9hx/aMRq0fr51qNXm8UZVbowx3za86Rcq4s9cgoGBrwbuhUuH06Alz
         ITz3YonKoL2FczBA7IkUkr8vd0A2QUyldj24TZeSIEQA+KPBH7+qLuDYvllpAi/xFcHJ
         hbSyZRe4dXEtAeF+gNNRXi7oaAf6UufCnw7v18B47cbidFQ+wMPzjqFVAG8ukBaL3JM8
         Jrgw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAW2FSqk3OWyIJpo2MQTRzYw6MQVgJt9scRFmKRxlXymtWsY5e1c
	+qul7buk5YZ3aRdpyj1uy8Y=
X-Google-Smtp-Source: APXvYqx/gZIzjdza1fVlRnDamJ2yHXrRm/EY8h4d2mJpbkPQP0vpt5aV2jDBJatAUlX75fs8/YmlnQ==
X-Received: by 2002:a05:6830:18d4:: with SMTP id v20mr23178553ote.29.1582191691834;
        Thu, 20 Feb 2020 01:41:31 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:611c:: with SMTP id i28ls73518otj.3.gmail; Thu, 20 Feb
 2020 01:41:31 -0800 (PST)
X-Received: by 2002:a9d:7c81:: with SMTP id q1mr4722015otn.112.1582191691000;
        Thu, 20 Feb 2020 01:41:31 -0800 (PST)
Date: Thu, 20 Feb 2020 01:41:29 -0800 (PST)
From: raymanfx@gmail.com
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <dfe23f77-f16a-41c9-9f6e-8e67b853b66e@googlegroups.com>
In-Reply-To: <5d6e66d7-2a25-1678-2ff1-247e861ab8d5@siemens.com>
References: <2b9c213c-a111-4f3f-94c5-4f89d06b5fdf@googlegroups.com>
 <eebfa055-f561-d5fb-7da6-706bb1e858ea@siemens.com>
 <439a798e-f9c3-4455-8128-e4047e5aa9e3@googlegroups.com>
 <5d6e66d7-2a25-1678-2ff1-247e861ab8d5@siemens.com>
Subject: Re: Linux non-root cell tooling
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_5838_1785627321.1582191690213"
X-Original-Sender: raymanfx@gmail.com
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

------=_Part_5838_1785627321.1582191690213
Content-Type: multipart/alternative; 
	boundary="----=_Part_5839_958030655.1582191690214"

------=_Part_5839_958030655.1582191690214
Content-Type: text/plain; charset="UTF-8"

Am Freitag, 14. Februar 2020 16:15:53 UTC+1 schrieb Jan Kiszka:

> Check if your non-root Linux comes with CONFIG_X86_X2APIC=y - I suspect 
> it doesn't. 
>
  
It didn't. Fixed that and now I can start the non-root cell. Thank you!

You can find a working x86 inmate kernel config in 
>
> https://github.com/siemens/jailhouse-images/blob/master/recipes-kernel/linux/files/amd64_defconfig_5.4 
> (multi-purpose config, thus a bit larger than technically needed). 
>
> > 
> > Is there a guide somewhere that documents the steps necessary for 
> > adjusting the linux-x86-demo cell config? 
>
> Nope, unfortunately not. The mid-term plan is still to enhance the 
> config generator to build also non-root configs. Any contribution, 
> including "just" documentation, would be very welcome! 
>
 
I'll prepare a pull request to update the documentation.

Although I cannot see any errors in the Jailhouse console anymore, my Linux 
guest still appears to be stuck somewhere.
The console output I get is:
Adding virtual PCI device 00:0c.0 to cell "linux-x86-demo"
Adding virtual PCI device 00:0d.0 to cell "linux-x86-demo"
Adding virtual PCI device 00:0e.0 to cell "linux-x86-demo"
Adding virtual PCI device 00:0f.0 to cell "linux-x86-demo"
Created cell "linux-x86-demo"
Page pool usage after cell creation: mem 375/975, remap 16395/131072
Cell "linux-x86-demo" can be loaded
CPU 2 received SIPI, vector 100
CPU 3 received SIPI, vector 100
Started cell "linux-x86-demo"
CPU 3 received SIPI, vector 9a

I added the JAILHOUSE_CELL_VIRTUAL_CONSOLE_ACTIVE bit to the linux-x86-demo 
cell flags to get kernel message output in /dev/jailhouse in the root cell. 
Is that supposed to be working or do I need to use UART?

At first there was a PIO read access violation at port 87, I went to check 
my root cell config and found the following:
        /* Port I/O: 0080-008f : dma page reg */
        /* PIO_RANGE(0x80, 0x10), */

So I added that exact range (0x80, 0x10) to the linux-x86-demo PIO configs 
and the error disappeared.
Could that be related to the cell being stuck issue?

To ensure it's not related to other missing guest kernel options, I will 
build a kernel with your amd64_defconfig_5.4 
<https://github.com/siemens/jailhouse-images/blob/master/recipes-kernel/linux/files/amd64_defconfig_5.4> 
and see if I get the same results.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/dfe23f77-f16a-41c9-9f6e-8e67b853b66e%40googlegroups.com.

------=_Part_5839_958030655.1582191690214
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Am Freitag, 14. Februar 2020 16:15:53 UTC+1 schrieb Jan Ki=
szka:<br><blockquote class=3D"gmail_quote" style=3D"margin: 0;margin-left: =
0.8ex;border-left: 1px #ccc solid;padding-left: 1ex;">Check if your non-roo=
t Linux comes with CONFIG_X86_X2APIC=3Dy - I suspect=20
<br>it doesn&#39;t.
<br></blockquote><div>=C2=A0 <br></div><div>It didn&#39;t. Fixed that and n=
ow I can start the non-root cell. Thank you!<br></div><div><br></div><block=
quote class=3D"gmail_quote" style=3D"margin: 0;margin-left: 0.8ex;border-le=
ft: 1px #ccc solid;padding-left: 1ex;">You can find a working x86 inmate ke=
rnel config in=20
<br><a href=3D"https://github.com/siemens/jailhouse-images/blob/master/reci=
pes-kernel/linux/files/amd64_defconfig_5.4" target=3D"_blank" rel=3D"nofoll=
ow" onmousedown=3D"this.href=3D&#39;https://www.google.com/url?q\x3dhttps%3=
A%2F%2Fgithub.com%2Fsiemens%2Fjailhouse-images%2Fblob%2Fmaster%2Frecipes-ke=
rnel%2Flinux%2Ffiles%2Famd64_defconfig_5.4\x26sa\x3dD\x26sntz\x3d1\x26usg\x=
3dAFQjCNGyUisLi2A0K95pgKXFqb-2Lif0hA&#39;;return true;" onclick=3D"this.hre=
f=3D&#39;https://www.google.com/url?q\x3dhttps%3A%2F%2Fgithub.com%2Fsiemens=
%2Fjailhouse-images%2Fblob%2Fmaster%2Frecipes-kernel%2Flinux%2Ffiles%2Famd6=
4_defconfig_5.4\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNGyUisLi2A0K95pgKXFq=
b-2Lif0hA&#39;;return true;">https://github.com/siemens/<wbr>jailhouse-imag=
es/blob/master/<wbr>recipes-kernel/linux/files/<wbr>amd64_defconfig_5.4</a>=
=20
<br>(multi-purpose config, thus a bit larger than technically needed).
<br>
<br>&gt;=20
<br>&gt; Is there a guide somewhere that documents the steps necessary for=
=20
<br>&gt; adjusting the linux-x86-demo cell config?
<br>
<br>Nope, unfortunately not. The mid-term plan is still to enhance the=20
<br>config generator to build also non-root configs. Any contribution,=20
<br>including &quot;just&quot; documentation, would be very welcome!
<br></blockquote><div>=C2=A0</div><div>I&#39;ll prepare a pull request to u=
pdate the documentation.</div><div><br></div><div>Although I cannot see any=
 errors in the Jailhouse console anymore, my Linux guest still appears to b=
e stuck somewhere.</div><div>The console output I get is:</div><div><div st=
yle=3D"background-color: rgb(250, 250, 250); border-color: rgb(187, 187, 18=
7); border-style: solid; border-width: 1px; overflow-wrap: break-word;" cla=
ss=3D"prettyprint"><code class=3D"prettyprint"><div class=3D"subprettyprint=
"><span style=3D"color: #606;" class=3D"styled-by-prettify">Adding</span><s=
pan style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=
=3D"color: #008;" class=3D"styled-by-prettify">virtual</span><span style=3D=
"color: #000;" class=3D"styled-by-prettify"> PCI device </span><span style=
=3D"color: #066;" class=3D"styled-by-prettify">00</span><span style=3D"colo=
r: #660;" class=3D"styled-by-prettify">:</span><span style=3D"color: #066;"=
 class=3D"styled-by-prettify">0c</span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">.</span><span style=3D"color: #066;" class=3D"style=
d-by-prettify">0</span><span style=3D"color: #000;" class=3D"styled-by-pret=
tify"> to cell </span><span style=3D"color: #080;" class=3D"styled-by-prett=
ify">&quot;linux-x86-demo&quot;</span><span style=3D"color: #000;" class=3D=
"styled-by-prettify"><br></span><span style=3D"color: #606;" class=3D"style=
d-by-prettify">Adding</span><span style=3D"color: #000;" class=3D"styled-by=
-prettify"> </span><span style=3D"color: #008;" class=3D"styled-by-prettify=
">virtual</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =
PCI device </span><span style=3D"color: #066;" class=3D"styled-by-prettify"=
>00</span><span style=3D"color: #660;" class=3D"styled-by-prettify">:</span=
><span style=3D"color: #066;" class=3D"styled-by-prettify">0d</span><span s=
tyle=3D"color: #660;" class=3D"styled-by-prettify">.</span><span style=3D"c=
olor: #066;" class=3D"styled-by-prettify">0</span><span style=3D"color: #00=
0;" class=3D"styled-by-prettify"> to cell </span><span style=3D"color: #080=
;" class=3D"styled-by-prettify">&quot;linux-x86-demo&quot;</span><span styl=
e=3D"color: #000;" class=3D"styled-by-prettify"><br></span><span style=3D"c=
olor: #606;" class=3D"styled-by-prettify">Adding</span><span style=3D"color=
: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #008;" =
class=3D"styled-by-prettify">virtual</span><span style=3D"color: #000;" cla=
ss=3D"styled-by-prettify"> PCI device </span><span style=3D"color: #066;" c=
lass=3D"styled-by-prettify">00</span><span style=3D"color: #660;" class=3D"=
styled-by-prettify">:</span><span style=3D"color: #066;" class=3D"styled-by=
-prettify">0e</span><span style=3D"color: #660;" class=3D"styled-by-prettif=
y">.</span><span style=3D"color: #066;" class=3D"styled-by-prettify">0</spa=
n><span style=3D"color: #000;" class=3D"styled-by-prettify"> to cell </span=
><span style=3D"color: #080;" class=3D"styled-by-prettify">&quot;linux-x86-=
demo&quot;</span><span style=3D"color: #000;" class=3D"styled-by-prettify">=
<br></span><span style=3D"color: #606;" class=3D"styled-by-prettify">Adding=
</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><s=
pan style=3D"color: #008;" class=3D"styled-by-prettify">virtual</span><span=
 style=3D"color: #000;" class=3D"styled-by-prettify"> PCI device </span><sp=
an style=3D"color: #066;" class=3D"styled-by-prettify">00</span><span style=
=3D"color: #660;" class=3D"styled-by-prettify">:</span><span style=3D"color=
: #066;" class=3D"styled-by-prettify">0f</span><span style=3D"color: #660;"=
 class=3D"styled-by-prettify">.</span><span style=3D"color: #066;" class=3D=
"styled-by-prettify">0</span><span style=3D"color: #000;" class=3D"styled-b=
y-prettify"> to cell </span><span style=3D"color: #080;" class=3D"styled-by=
-prettify">&quot;linux-x86-demo&quot;</span><span style=3D"color: #000;" cl=
ass=3D"styled-by-prettify"><br></span><span style=3D"color: #606;" class=3D=
"styled-by-prettify">Created</span><span style=3D"color: #000;" class=3D"st=
yled-by-prettify"> cell </span><span style=3D"color: #080;" class=3D"styled=
-by-prettify">&quot;linux-x86-demo&quot;</span><span style=3D"color: #000;"=
 class=3D"styled-by-prettify"><br></span><span style=3D"color: #606;" class=
=3D"styled-by-prettify">Page</span><span style=3D"color: #000;" class=3D"st=
yled-by-prettify"> pool usage after cell creation</span><span style=3D"colo=
r: #660;" class=3D"styled-by-prettify">:</span><span style=3D"color: #000;"=
 class=3D"styled-by-prettify"> mem </span><span style=3D"color: #066;" clas=
s=3D"styled-by-prettify">375</span><span style=3D"color: #660;" class=3D"st=
yled-by-prettify">/</span><span style=3D"color: #066;" class=3D"styled-by-p=
rettify">975</span><span style=3D"color: #660;" class=3D"styled-by-prettify=
">,</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> remap =
</span><span style=3D"color: #066;" class=3D"styled-by-prettify">16395</spa=
n><span style=3D"color: #660;" class=3D"styled-by-prettify">/</span><span s=
tyle=3D"color: #066;" class=3D"styled-by-prettify">131072</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"><br></span><span style=3D"co=
lor: #606;" class=3D"styled-by-prettify">Cell</span><span style=3D"color: #=
000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #080;" cla=
ss=3D"styled-by-prettify">&quot;linux-x86-demo&quot;</span><span style=3D"c=
olor: #000;" class=3D"styled-by-prettify"> can be loaded<br>CPU </span><spa=
n style=3D"color: #066;" class=3D"styled-by-prettify">2</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"> received SIPI</span><span s=
tyle=3D"color: #660;" class=3D"styled-by-prettify">,</span><span style=3D"c=
olor: #000;" class=3D"styled-by-prettify"> vector </span><span style=3D"col=
or: #066;" class=3D"styled-by-prettify">100</span><span style=3D"color: #00=
0;" class=3D"styled-by-prettify"><br>CPU </span><span style=3D"color: #066;=
" class=3D"styled-by-prettify">3</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> received SIPI</span><span style=3D"color: #660;" c=
lass=3D"styled-by-prettify">,</span><span style=3D"color: #000;" class=3D"s=
tyled-by-prettify"> vector </span><span style=3D"color: #066;" class=3D"sty=
led-by-prettify">100</span><span style=3D"color: #000;" class=3D"styled-by-=
prettify"><br></span><span style=3D"color: #606;" class=3D"styled-by-pretti=
fy">Started</span><span style=3D"color: #000;" class=3D"styled-by-prettify"=
> cell </span><span style=3D"color: #080;" class=3D"styled-by-prettify">&qu=
ot;linux-x86-demo&quot;</span><span style=3D"color: #000;" class=3D"styled-=
by-prettify"><br>CPU </span><span style=3D"color: #066;" class=3D"styled-by=
-prettify">3</span><span style=3D"color: #000;" class=3D"styled-by-prettify=
"> received SIPI</span><span style=3D"color: #660;" class=3D"styled-by-pret=
tify">,</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> ve=
ctor </span><span style=3D"color: #066;" class=3D"styled-by-prettify">9a</s=
pan><span style=3D"color: #000;" class=3D"styled-by-prettify"><br></span></=
div></code></div><br>I added the JAILHOUSE_CELL_VIRTUAL_CONSOLE_ACTIVE bit =
to the linux-x86-demo cell flags to get kernel message output in /dev/jailh=
ouse in the root cell. Is that supposed to be working or do I need to use U=
ART?</div><div><br></div><div>At first there was a PIO read access violatio=
n at port 87, I went to check my root cell config and found the following:<=
/div><div><div style=3D"background-color: rgb(250, 250, 250); border-color:=
 rgb(187, 187, 187); border-style: solid; border-width: 1px; overflow-wrap:=
 break-word;" class=3D"prettyprint"><code class=3D"prettyprint"><div class=
=3D"subprettyprint"><span style=3D"color: #000;" class=3D"styled-by-prettif=
y">=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span><span style=3D"color: #800;" class=3D=
"styled-by-prettify">/* Port I/O: 0080-008f : dma page reg */</span><span s=
tyle=3D"color: #000;" class=3D"styled-by-prettify"><br>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 </span><span style=3D"color: #800;" class=3D"styled-by-prettify">/*=
 PIO_RANGE(0x80, 0x10), */</span></div></code></div><br>So I added that exa=
ct range (0x80, 0x10) to the linux-x86-demo PIO configs and the error disap=
peared.</div><div>Could that be related to the cell being stuck issue?</div=
><div><br></div><div>To ensure it&#39;s not related to other missing guest =
kernel options, I will build a kernel with your <a href=3D"https://github.c=
om/siemens/jailhouse-images/blob/master/recipes-kernel/linux/files/amd64_de=
fconfig_5.4" target=3D"_blank" rel=3D"nofollow">amd64_defconfig_5.4</a> and=
 see if I get the same results.<br></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/dfe23f77-f16a-41c9-9f6e-8e67b853b66e%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/dfe23f77-f16a-41c9-9f6e-8e67b853b66e%40googlegroups.com<=
/a>.<br />

------=_Part_5839_958030655.1582191690214--

------=_Part_5838_1785627321.1582191690213--
