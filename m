Return-Path: <jailhouse-dev+bncBDH5LQU54QDBBIFJ232QKGQEHPNTWXA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33b.google.com (mail-ot1-x33b.google.com [IPv6:2607:f8b0:4864:20::33b])
	by mail.lfdr.de (Postfix) with ESMTPS id 066AC1CB5B4
	for <lists+jailhouse-dev@lfdr.de>; Fri,  8 May 2020 19:19:30 +0200 (CEST)
Received: by mail-ot1-x33b.google.com with SMTP id z9sf1595943oth.23
        for <lists+jailhouse-dev@lfdr.de>; Fri, 08 May 2020 10:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=BUZgiG6Z7sL6Qir/UGVFb2NE4WASFY//ad2ZjQ8Jh38=;
        b=GNxjnNw9xX63hS4CRstTf+Rt5PonZ0WUE6TjSDU+Sz57aDvtw0mn8jdFb1BF7k72dh
         ZJX39xfrOknmC1fKHXX5v9yQpcvbeqngkEYGQFNNSOeiq3Vl22scJZaFIkjVbZunaxOg
         etyflPTrHF8Y0G878/L2mRHA+EuMJx64Q4wfSCdcXRWAqgRk9WNuNmndAoULGj+7uAIX
         XhDJuw0ZrB+57odoXMiavObm3CjcOrbfq8uRHJUeIlQ9cG1Qx1Dt5jvQsOBRRuZjT1WO
         7ZLLht4Sj7qShq7E6ddSi5GALQ0AChCncudKSOs+9qRPYz7A8RMw4pqFtwYHbf9bIQCb
         6GcQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=BUZgiG6Z7sL6Qir/UGVFb2NE4WASFY//ad2ZjQ8Jh38=;
        b=hNS6FuU6J67Rvj7ahmLqN8eF9MyWp7Sd5E/lp2DW1W/QHWwPJqMZi1v8/7zMpveCXa
         qlOi6RLBj6wOg6ObQqCNCF3JcpoTACH4JdsAbE+1yzo8Vok2W8zYYHdBUblAKJ4aOtkk
         ODC8RoRd2cGDW8inhQpvG9x/7nr437auT4gVYFb3V4QBFUnuhak53ZNK6YgPa7gvTHsu
         Om0E5rzP8h1+E137XGiWHvyca3WChgU5oZWV0Jn6TL02p8jb18JLKsBtHyu0h3FoJLut
         +RKN97liGM4tPsYzG2Pald3iEF1vcpbEB3iwrkzhpaCRMbU/bCEbqUw0XcywG+TJaTVz
         oo2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=BUZgiG6Z7sL6Qir/UGVFb2NE4WASFY//ad2ZjQ8Jh38=;
        b=LXW98afeRI4hUjzGOuZGSJyIrLklNre1HqQICy+5aGYtqum7Jcc+LHbjomRnkahugh
         P9q4yUAPfjiXeZx8dfH+7sEKDO0dj4Bfo7I0WUOE4QRTN8RZbHd8jDtRFdKH99UkHpz/
         slR6IayQrQhEC0uaPCr89m9PqhnADVByN9uhWxbKRR4G8awbeUocxTz5KHoj5CO/l9dc
         oKEge5KY3TJeX0iDRCNwUr361AS9519RT9fKQUt0UNrrr4/Bvo0/Ngd6hw2qGmlgiBtB
         /Q8ivupSpRoSaRYq2eFmuhgZFebx7yAfhT9EGrKmlQaTFT9zViw3ekhSUK1t6dh3OexG
         66KA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PuYOrNKE/A04Qg85Nq2N79gld3nx3b3vDgdOo8UiRZbqIuEf8owe
	zzrIxJDYIVGvGKGYaFlZDB4=
X-Google-Smtp-Source: APiQypK88e8wozEHNu6c1QhQR5qWgqVg8dYiKEYQ3c9TiJH7Wu6SaLTI9iADlVB7/iw8H0XCIE1nVQ==
X-Received: by 2002:aca:ac54:: with SMTP id v81mr11451560oie.17.1588958368805;
        Fri, 08 May 2020 10:19:28 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a54:4418:: with SMTP id k24ls2444620oiw.3.gmail; Fri, 08 May
 2020 10:19:28 -0700 (PDT)
X-Received: by 2002:aca:b9c3:: with SMTP id j186mr3871278oif.174.1588958367905;
        Fri, 08 May 2020 10:19:27 -0700 (PDT)
Date: Fri, 8 May 2020 10:19:27 -0700 (PDT)
From: Luigi De Simone <luigi.desimone3@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <e5934ccb-97ba-49f5-bf43-d47b2763f4b4@googlegroups.com>
Subject: Problem with setup on Banana Pi BPI-M1 ARM board - jailhouse enable
 bananapi.cell crash
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_653_1451258986.1588958367397"
X-Original-Sender: luigi.desimone3@gmail.com
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

------=_Part_653_1451258986.1588958367397
Content-Type: multipart/alternative; 
	boundary="----=_Part_654_60421715.1588958367399"

------=_Part_654_60421715.1588958367399
Content-Type: text/plain; charset="UTF-8"

Hi all,

I really need your help about finding out a solution with FreeRTOS BananPI 
demo. My board model is BPI-M1
I've followed exactly the guide at 
https://github.com/siemens/jailhouse/blob/master/Documentation/setup-on-banana-pi-arm-board.md
with a kernel 
Only one deviation is about command:

cp -av ~/jailhouse/ci/jailhouse-config-banana-pi.h ~/jailhouse/include/
jailhouse/config.h

because *jailhouse-config-banana-pi.h *does not exist anymore in the repo 
(I don't know if it is a refuse from refactoring).
What I've done is to create a config.h file like this:

#define CONFIG_TRACE_ERROR              1
#define CONFIG_CRASH_CELL_ON_PANIC      1
#define CONFIG_TEST_DEVICE              1
#define CONFIG_ARM_GIC                  1
#define CONFIG_MACH_SUN7I               1
#define CONFIG_SERIAL_8250_DW           1

according to old *jailhouse-config-banana-pi.h *file.
Anyway, once booted the board and try to run command:
jailhouse enable jailhouse/configs/arm/bananapi.cell

The board stall, and the output is:

Initializing Jailhouse hypervisor v0.12 (35-g2e4d71f6-dirty) on CPU 0
Code location: 0xf0000040
Page pool usage after early setup: mem 56/16359, remap 0/131072
Initializing processors:
 CPU 0... Unhandled HYP data abort exit at 0xf0005b10
r0:  0x7c01b000  r1:  0x7c00e000  r2:  0x00001fff  r3:  0x00000000
r4:  0x00001000  r5:  0xf0010090  r6:  0x7c00e000  r7:  0x00000000
r8:  0x7c0037a0  r9:  0x7c000000  r10: 0x00000000  r11: 0x7c01b000
r12: 0xc3ff7000  r13: 0xf0003ce4
Physical address: 0x7c01b004 HSR: 0x94000007
Stopping CPU 0 (Cell: "Banana-Pi")

What is wrong?

Some information on my board.

*Kernel log at boot.*
[    0.000000] Linux version 4.3.3bananagigi1-dirty  (gcc version 5.3.1 
20160113 (Linaro GCC 5.3-2016.02) ) #1 SMP Fri May 8 17:53:47 CEST 2020

....
[    0.000000] Kernel command line: console=ttyS0,115200 console=tty0 
console=tty1 root=/dev/mmcblk0p2 rootfstype=ext4 elevator=deadline rootwait 
mem=932M vmalloc=512M
...
[    0.000000] Virtual kernel memory layout:
[    0.000000]     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
[    0.000000]     fixmap  : 0xffc00000 - 0xfff00000   (3072 kB)
[    0.000000]     vmalloc : 0xdf800000 - 0xff000000   ( 504 MB)
[    0.000000]     lowmem  : 0xc0000000 - 0xdf000000   ( 496 MB)
[    0.000000]     pkmap   : 0xbfe00000 - 0xc0000000   (   2 MB)
[    0.000000]     modules : 0xbf000000 - 0xbfe00000   (  14 MB)
[    0.000000]       .text : 0xc0008000 - 0xc0813cf4   (8240 kB)
[    0.000000]       .init : 0xc0814000 - 0xc0890000   ( 496 kB)
[    0.000000]       .data : 0xc0890000 - 0xc0917880   ( 543 kB)
[    0.000000]        .bss : 0xc091a000 - 0xc111740c   (8182 kB)


*/proc/iomem*

> 01c00000-01c0002f : /soc@01c00000/sram-controller@01c00000
> 01c05000-01c05fff : /soc@01c00000/spi@01c05000
> 01c0f000-01c0ffff : /soc@01c00000/mmc@01c0f000
> 01c18000-01c18fff : /soc@01c00000/sata@01c18000
> 01c20060-01c20067 : /clocks/clk@01c20060
> 01c20068-01c2006b : /clocks/clk@01c20068
> 01c2006c-01c2006f : /clocks/clk@01c2006c
> 01c20088-01c2008b : /clocks/clk@01c20088
> 01c2008c-01c2008f : /clocks/clk@01c2008c
> 01c20090-01c20093 : /clocks/clk@01c20090
> 01c20094-01c20097 : /clocks/clk@01c20094
> 01c200cc-01c200cf : /clocks/clk@01c200cc
> 01c20800-01c20bff : /soc@01c00000/pinctrl@01c20800
> 01c20c90-01c20c9f : /soc@01c00000/watchdog@01c20c90
> 01c20d00-01c20d1f : /soc@01c00000/rtc@01c20d00
> 01c28000-01c2801f : serial
> 01c28c00-01c28c1f : serial
> 01c29c00-01c29c1f : serial
> 01c2ac00-01c2afff : /soc@01c00000/i2c@01c2ac00
> 01c2b400-01c2b7ff : /soc@01c00000/i2c@01c2b400
> 01c50000-01c5ffff : /soc@01c00000/ethernet@01c50000
> 01c60000-01c60fff : /soc@01c00000/hstimer@01c60000
> 40000000-7bdfffff : System RAM
>   40008000-40813cf3 : Kernel code
>   40890000-4111740b : Kernel data



If you need any other info (e.g., complete kernel log, .config file, or 
whatever) let me know.
I really appreciate any suggestions as soon as possible.

Best regards,

Luigi 


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/e5934ccb-97ba-49f5-bf43-d47b2763f4b4%40googlegroups.com.

------=_Part_654_60421715.1588958367399
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<div><br></div><div>I really need your help about f=
inding out a solution with FreeRTOS BananPI demo. My board model is BPI-M1<=
/div><div>I&#39;ve followed exactly the guide at=C2=A0<a href=3D"https://gi=
thub.com/siemens/jailhouse/blob/master/Documentation/setup-on-banana-pi-arm=
-board.md">https://github.com/siemens/jailhouse/blob/master/Documentation/s=
etup-on-banana-pi-arm-board.md</a></div><div>with a kernel=C2=A0</div><div>=
Only one deviation is about command:</div><div><br></div><div><div class=3D=
"prettyprint" style=3D"background-color: rgb(250, 250, 250); border-color: =
rgb(187, 187, 187); border-style: solid; border-width: 1px; overflow-wrap: =
break-word;"><code class=3D"prettyprint"><div class=3D"subprettyprint"><spa=
n style=3D"font-family: Arial, Helvetica, sans-serif; background-color: rgb=
(255, 255, 255);"><span style=3D"color: #000;" class=3D"styled-by-prettify"=
>cp </span><span style=3D"color: #660;" class=3D"styled-by-prettify">-</spa=
n><span style=3D"color: #000;" class=3D"styled-by-prettify">av </span><span=
 style=3D"color: #660;" class=3D"styled-by-prettify">~</span><span style=3D=
"color: #080;" class=3D"styled-by-prettify">/jailhouse/</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify">ci</span><span style=3D"colo=
r: #660;" class=3D"styled-by-prettify">/</span><span style=3D"color: #000;"=
 class=3D"styled-by-prettify">jailhouse</span><span style=3D"color: #660;" =
class=3D"styled-by-prettify">-</span><span style=3D"color: #000;" class=3D"=
styled-by-prettify">config</span><span style=3D"color: #660;" class=3D"styl=
ed-by-prettify">-</span><span style=3D"color: #000;" class=3D"styled-by-pre=
ttify">banana</span><span style=3D"color: #660;" class=3D"styled-by-prettif=
y">-</span><span style=3D"color: #000;" class=3D"styled-by-prettify">pi</sp=
an><span style=3D"color: #660;" class=3D"styled-by-prettify">.</span><span =
style=3D"color: #000;" class=3D"styled-by-prettify">h </span><span style=3D=
"color: #660;" class=3D"styled-by-prettify">~</span><span style=3D"color: #=
080;" class=3D"styled-by-prettify">/jailhouse/</span><span style=3D"color: =
#000;" class=3D"styled-by-prettify">include</span><span style=3D"color: #66=
0;" class=3D"styled-by-prettify">/</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify">jailhouse</span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">/</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify">config</span><span style=3D"color: #660;" class=3D"styled-by=
-prettify">.</span><span style=3D"color: #000;" class=3D"styled-by-prettify=
">h</span></span><span style=3D"color: #000;" class=3D"styled-by-prettify">=
<br></span></div></code></div><br>because <b>jailhouse-config-banana-pi.h <=
/b>does<b> </b>not exist anymore in the repo (I don&#39;t know if it is a r=
efuse from refactoring).</div><div>What I&#39;ve done is to create a config=
.h file like this:</div><div><br></div><div class=3D"prettyprint" style=3D"=
background-color: rgb(250, 250, 250); border-color: rgb(187, 187, 187); bor=
der-style: solid; border-width: 1px; overflow-wrap: break-word;"><code clas=
s=3D"prettyprint"><div class=3D"subprettyprint"><span style=3D"color: #800;=
" class=3D"styled-by-prettify">#define</span><span style=3D"color: #000;" c=
lass=3D"styled-by-prettify"> CONFIG_TRACE_ERROR =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0</span><span style=3D"color: #066;" class=3D"styled-by=
-prettify">1</span><span style=3D"color: #000;" class=3D"styled-by-prettify=
"><br></span><span style=3D"color: #800;" class=3D"styled-by-prettify">#def=
ine</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> CONFIG=
_CRASH_CELL_ON_PANIC =C2=A0 =C2=A0 =C2=A0</span><span style=3D"color: #066;=
" class=3D"styled-by-prettify">1</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"><br></span><span style=3D"color: #800;" class=3D"st=
yled-by-prettify">#define</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify"> CONFIG_TEST_DEVICE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0</span><span style=3D"color: #066;" class=3D"styled-by-prettify">=
1</span><span style=3D"color: #000;" class=3D"styled-by-prettify"><br></spa=
n><span style=3D"color: #800;" class=3D"styled-by-prettify">#define</span><=
span style=3D"color: #000;" class=3D"styled-by-prettify"> CONFIG_ARM_GIC =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0</span><span =
style=3D"color: #066;" class=3D"styled-by-prettify">1</span><span style=3D"=
color: #000;" class=3D"styled-by-prettify"><br></span><span style=3D"color:=
 #800;" class=3D"styled-by-prettify">#define</span><span style=3D"color: #0=
00;" class=3D"styled-by-prettify"> CONFIG_MACH_SUN7I =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span><span style=3D"color: #066;" class=3D"st=
yled-by-prettify">1</span><span style=3D"color: #000;" class=3D"styled-by-p=
rettify"><br></span><span style=3D"color: #800;" class=3D"styled-by-prettif=
y">#define</span><span style=3D"color: #000;" class=3D"styled-by-prettify">=
 CONFIG_SERIAL_8250_DW =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span><span styl=
e=3D"color: #066;" class=3D"styled-by-prettify">1</span><span style=3D"colo=
r: #000;" class=3D"styled-by-prettify"><br></span></div></code></div><div><=
br></div><div>according to old=C2=A0<b>jailhouse-config-banana-pi.h </b>fil=
e.</div><div>Anyway, once booted the board and try to run command:</div><di=
v><div><div class=3D"prettyprint" style=3D"background-color: rgb(250, 250, =
250); border-color: rgb(187, 187, 187); border-style: solid; border-width: =
1px; overflow-wrap: break-word;"><code class=3D"prettyprint"><div class=3D"=
subprettyprint"><span style=3D"color: #000;" class=3D"styled-by-prettify">j=
ailhouse enable jailhouse</span><span style=3D"color: #660;" class=3D"style=
d-by-prettify">/</span><span style=3D"color: #000;" class=3D"styled-by-pret=
tify">configs</span><span style=3D"color: #660;" class=3D"styled-by-prettif=
y">/</span><span style=3D"color: #000;" class=3D"styled-by-prettify">arm</s=
pan><span style=3D"color: #660;" class=3D"styled-by-prettify">/</span><span=
 style=3D"color: #000;" class=3D"styled-by-prettify">bananapi</span><span s=
tyle=3D"color: #660;" class=3D"styled-by-prettify">.</span><span style=3D"c=
olor: #000;" class=3D"styled-by-prettify">cell</span></div></code></div><br=
></div><div>The board stall, and the output is:</div><div><br></div><div></=
div></div><div class=3D"prettyprint" style=3D"background-color: rgb(250, 25=
0, 250); border-color: rgb(187, 187, 187); border-style: solid; border-widt=
h: 1px; overflow-wrap: break-word;"><code class=3D"prettyprint"><div class=
=3D"subprettyprint"><span style=3D"color: #606;" class=3D"styled-by-prettif=
y">Initializing</span><span style=3D"color: #000;" class=3D"styled-by-prett=
ify"> </span><span style=3D"color: #606;" class=3D"styled-by-prettify">Jail=
house</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> hype=
rvisor v0</span><span style=3D"color: #660;" class=3D"styled-by-prettify">.=
</span><span style=3D"color: #066;" class=3D"styled-by-prettify">12</span><=
span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span styl=
e=3D"color: #660;" class=3D"styled-by-prettify">(</span><span style=3D"colo=
r: #066;" class=3D"styled-by-prettify">35</span><span style=3D"color: #660;=
" class=3D"styled-by-prettify">-</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify">g2e4d71f6</span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">-</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify">dirty</span><span style=3D"color: #660;" class=3D"styled-by-=
prettify">)</span><span style=3D"color: #000;" class=3D"styled-by-prettify"=
> on CPU </span><span style=3D"color: #066;" class=3D"styled-by-prettify">0=
</span><span style=3D"color: #000;" class=3D"styled-by-prettify"><br></span=
><span style=3D"color: #606;" class=3D"styled-by-prettify">Code</span><span=
 style=3D"color: #000;" class=3D"styled-by-prettify"> location</span><span =
style=3D"color: #660;" class=3D"styled-by-prettify">:</span><span style=3D"=
color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #0=
66;" class=3D"styled-by-prettify">0xf0000040</span><span style=3D"color: #0=
00;" class=3D"styled-by-prettify"><br></span><span style=3D"color: #606;" c=
lass=3D"styled-by-prettify">Page</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> pool usage after early setup</span><span style=3D"=
color: #660;" class=3D"styled-by-prettify">:</span><span style=3D"color: #0=
00;" class=3D"styled-by-prettify"> mem </span><span style=3D"color: #066;" =
class=3D"styled-by-prettify">56</span><span style=3D"color: #660;" class=3D=
"styled-by-prettify">/</span><span style=3D"color: #066;" class=3D"styled-b=
y-prettify">16359</span><span style=3D"color: #660;" class=3D"styled-by-pre=
ttify">,</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> r=
emap </span><span style=3D"color: #066;" class=3D"styled-by-prettify">0</sp=
an><span style=3D"color: #660;" class=3D"styled-by-prettify">/</span><span =
style=3D"color: #066;" class=3D"styled-by-prettify">131072</span><span styl=
e=3D"color: #000;" class=3D"styled-by-prettify"><br></span><span style=3D"c=
olor: #606;" class=3D"styled-by-prettify">Initializing</span><span style=3D=
"color: #000;" class=3D"styled-by-prettify"> processors</span><span style=
=3D"color: #660;" class=3D"styled-by-prettify">:</span><span style=3D"color=
: #000;" class=3D"styled-by-prettify"><br>=C2=A0CPU </span><span style=3D"c=
olor: #066;" class=3D"styled-by-prettify">0.</span><span style=3D"color: #6=
60;" class=3D"styled-by-prettify">..</span><span style=3D"color: #000;" cla=
ss=3D"styled-by-prettify"> </span><span style=3D"color: #606;" class=3D"sty=
led-by-prettify">Unhandled</span><span style=3D"color: #000;" class=3D"styl=
ed-by-prettify"> HYP data abort </span><span style=3D"color: #008;" class=
=3D"styled-by-prettify">exit</span><span style=3D"color: #000;" class=3D"st=
yled-by-prettify"> at </span><span style=3D"color: #066;" class=3D"styled-b=
y-prettify">0xf0005b10</span><span style=3D"color: #000;" class=3D"styled-b=
y-prettify"><br>r0</span><span style=3D"color: #660;" class=3D"styled-by-pr=
ettify">:</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =
=C2=A0</span><span style=3D"color: #066;" class=3D"styled-by-prettify">0x7c=
01b000</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=
=A0r1</span><span style=3D"color: #660;" class=3D"styled-by-prettify">:</sp=
an><span style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0</span>=
<span style=3D"color: #066;" class=3D"styled-by-prettify">0x7c00e000</span>=
<span style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0r2</span><=
span style=3D"color: #660;" class=3D"styled-by-prettify">:</span><span styl=
e=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0</span><span style=
=3D"color: #066;" class=3D"styled-by-prettify">0x00001fff</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0r3</span><span style=
=3D"color: #660;" class=3D"styled-by-prettify">:</span><span style=3D"color=
: #000;" class=3D"styled-by-prettify"> =C2=A0</span><span style=3D"color: #=
066;" class=3D"styled-by-prettify">0x00000000</span><span style=3D"color: #=
000;" class=3D"styled-by-prettify"><br>r4</span><span style=3D"color: #660;=
" class=3D"styled-by-prettify">:</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> =C2=A0</span><span style=3D"color: #066;" class=3D=
"styled-by-prettify">0x00001000</span><span style=3D"color: #000;" class=3D=
"styled-by-prettify"> =C2=A0r5</span><span style=3D"color: #660;" class=3D"=
styled-by-prettify">:</span><span style=3D"color: #000;" class=3D"styled-by=
-prettify"> =C2=A0</span><span style=3D"color: #066;" class=3D"styled-by-pr=
ettify">0xf0010090</span><span style=3D"color: #000;" class=3D"styled-by-pr=
ettify"> =C2=A0r6</span><span style=3D"color: #660;" class=3D"styled-by-pre=
ttify">:</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =
=C2=A0</span><span style=3D"color: #066;" class=3D"styled-by-prettify">0x7c=
00e000</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=
=A0r7</span><span style=3D"color: #660;" class=3D"styled-by-prettify">:</sp=
an><span style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0</span>=
<span style=3D"color: #066;" class=3D"styled-by-prettify">0x00000000</span>=
<span style=3D"color: #000;" class=3D"styled-by-prettify"><br>r8</span><spa=
n style=3D"color: #660;" class=3D"styled-by-prettify">:</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0</span><span style=3D=
"color: #066;" class=3D"styled-by-prettify">0x7c0037a0</span><span style=3D=
"color: #000;" class=3D"styled-by-prettify"> =C2=A0r9</span><span style=3D"=
color: #660;" class=3D"styled-by-prettify">:</span><span style=3D"color: #0=
00;" class=3D"styled-by-prettify"> =C2=A0</span><span style=3D"color: #066;=
" class=3D"styled-by-prettify">0x7c000000</span><span style=3D"color: #000;=
" class=3D"styled-by-prettify"> =C2=A0r10</span><span style=3D"color: #660;=
" class=3D"styled-by-prettify">:</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> </span><span style=3D"color: #066;" class=3D"style=
d-by-prettify">0x00000000</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify"> =C2=A0r11</span><span style=3D"color: #660;" class=3D"style=
d-by-prettify">:</span><span style=3D"color: #000;" class=3D"styled-by-pret=
tify"> </span><span style=3D"color: #066;" class=3D"styled-by-prettify">0x7=
c01b000</span><span style=3D"color: #000;" class=3D"styled-by-prettify"><br=
>r12</span><span style=3D"color: #660;" class=3D"styled-by-prettify">:</spa=
n><span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span s=
tyle=3D"color: #066;" class=3D"styled-by-prettify">0xc3ff7000</span><span s=
tyle=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0r13</span><span s=
tyle=3D"color: #660;" class=3D"styled-by-prettify">:</span><span style=3D"c=
olor: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #06=
6;" class=3D"styled-by-prettify">0xf0003ce4</span><span style=3D"color: #00=
0;" class=3D"styled-by-prettify"><br></span><span style=3D"color: #606;" cl=
ass=3D"styled-by-prettify">Physical</span><span style=3D"color: #000;" clas=
s=3D"styled-by-prettify"> address</span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">:</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify"> </span><span style=3D"color: #066;" class=3D"styled-by-pret=
tify">0x7c01b004</span><span style=3D"color: #000;" class=3D"styled-by-pret=
tify"> HSR</span><span style=3D"color: #660;" class=3D"styled-by-prettify">=
:</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><=
span style=3D"color: #066;" class=3D"styled-by-prettify">0x94000007</span><=
span style=3D"color: #000;" class=3D"styled-by-prettify"><br></span><span s=
tyle=3D"color: #606;" class=3D"styled-by-prettify">Stopping</span><span sty=
le=3D"color: #000;" class=3D"styled-by-prettify"> CPU </span><span style=3D=
"color: #066;" class=3D"styled-by-prettify">0</span><span style=3D"color: #=
000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #660;" cla=
ss=3D"styled-by-prettify">(</span><span style=3D"color: #606;" class=3D"sty=
led-by-prettify">Cell</span><span style=3D"color: #660;" class=3D"styled-by=
-prettify">:</span><span style=3D"color: #000;" class=3D"styled-by-prettify=
"> </span><span style=3D"color: #080;" class=3D"styled-by-prettify">&quot;B=
anana-Pi&quot;</span><span style=3D"color: #660;" class=3D"styled-by-pretti=
fy">)</span><span style=3D"color: #000;" class=3D"styled-by-prettify"><br><=
/span></div></code></div><div><br>What is wrong?</div><div><br></div><div>S=
ome information on my board.</div><div><br></div><div><b>Kernel log at boot=
.</b></div><div class=3D"prettyprint" style=3D"background-color: rgb(250, 2=
50, 250); border-color: rgb(187, 187, 187); border-style: solid; border-wid=
th: 1px; overflow-wrap: break-word;"><code class=3D"prettyprint"><div class=
=3D"subprettyprint"><span style=3D"color: #660;" class=3D"styled-by-prettif=
y">[</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=
=A0 =C2=A0</span><span style=3D"color: #066;" class=3D"styled-by-prettify">=
0.000000</span><span style=3D"color: #660;" class=3D"styled-by-prettify">]<=
/span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><sp=
an style=3D"color: #606;" class=3D"styled-by-prettify">Linux</span><span st=
yle=3D"color: #000;" class=3D"styled-by-prettify"> version </span><span sty=
le=3D"color: #066;" class=3D"styled-by-prettify">4.3</span><span style=3D"c=
olor: #660;" class=3D"styled-by-prettify">.</span><span style=3D"color: #06=
6;" class=3D"styled-by-prettify">3bananagigi1</span><span style=3D"color: #=
660;" class=3D"styled-by-prettify">-</span><span style=3D"color: #000;" cla=
ss=3D"styled-by-prettify">dirty =C2=A0</span><span style=3D"color: #660;" c=
lass=3D"styled-by-prettify">(</span><span style=3D"color: #000;" class=3D"s=
tyled-by-prettify">gcc version </span><span style=3D"color: #066;" class=3D=
"styled-by-prettify">5.3</span><span style=3D"color: #660;" class=3D"styled=
-by-prettify">.</span><span style=3D"color: #066;" class=3D"styled-by-prett=
ify">1</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </s=
pan><span style=3D"color: #066;" class=3D"styled-by-prettify">20160113</spa=
n><span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span s=
tyle=3D"color: #660;" class=3D"styled-by-prettify">(</span><span style=3D"c=
olor: #606;" class=3D"styled-by-prettify">Linaro</span><span style=3D"color=
: #000;" class=3D"styled-by-prettify"> GCC </span><span style=3D"color: #06=
6;" class=3D"styled-by-prettify">5.3</span><span style=3D"color: #660;" cla=
ss=3D"styled-by-prettify">-</span><span style=3D"color: #066;" class=3D"sty=
led-by-prettify">2016.02</span><span style=3D"color: #660;" class=3D"styled=
-by-prettify">)</span><span style=3D"color: #000;" class=3D"styled-by-prett=
ify"> </span><span style=3D"color: #660;" class=3D"styled-by-prettify">)</s=
pan><span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span=
 style=3D"color: #800;" class=3D"styled-by-prettify">#1 SMP Fri May 8 17:53=
:47 CEST 2020</span><span style=3D"color: #000;" class=3D"styled-by-prettif=
y"><br><br></span><span style=3D"color: #660;" class=3D"styled-by-prettify"=
>....</span><span style=3D"color: #000;" class=3D"styled-by-prettify"><br><=
/span><span style=3D"color: #660;" class=3D"styled-by-prettify">[</span><sp=
an style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span=
><span style=3D"color: #066;" class=3D"styled-by-prettify">0.000000</span><=
span style=3D"color: #660;" class=3D"styled-by-prettify">]</span><span styl=
e=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"colo=
r: #606;" class=3D"styled-by-prettify">Kernel</span><span style=3D"color: #=
000;" class=3D"styled-by-prettify"> command line</span><span style=3D"color=
: #660;" class=3D"styled-by-prettify">:</span><span style=3D"color: #000;" =
class=3D"styled-by-prettify"> console</span><span style=3D"color: #660;" cl=
ass=3D"styled-by-prettify">=3D</span><span style=3D"color: #000;" class=3D"=
styled-by-prettify">ttyS0</span><span style=3D"color: #660;" class=3D"style=
d-by-prettify">,</span><span style=3D"color: #066;" class=3D"styled-by-pret=
tify">115200</span><span style=3D"color: #000;" class=3D"styled-by-prettify=
"> console</span><span style=3D"color: #660;" class=3D"styled-by-prettify">=
=3D</span><span style=3D"color: #000;" class=3D"styled-by-prettify">tty0 co=
nsole</span><span style=3D"color: #660;" class=3D"styled-by-prettify">=3D</=
span><span style=3D"color: #000;" class=3D"styled-by-prettify">tty1 root</s=
pan><span style=3D"color: #660;" class=3D"styled-by-prettify">=3D</span><sp=
an style=3D"color: #080;" class=3D"styled-by-prettify">/dev/</span><span st=
yle=3D"color: #000;" class=3D"styled-by-prettify">mmcblk0p2 rootfstype</spa=
n><span style=3D"color: #660;" class=3D"styled-by-prettify">=3D</span><span=
 style=3D"color: #000;" class=3D"styled-by-prettify">ext4 elevator</span><s=
pan style=3D"color: #660;" class=3D"styled-by-prettify">=3D</span><span sty=
le=3D"color: #000;" class=3D"styled-by-prettify">deadline rootwait mem</spa=
n><span style=3D"color: #660;" class=3D"styled-by-prettify">=3D</span><span=
 style=3D"color: #066;" class=3D"styled-by-prettify">932M</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"> vmalloc</span><span style=
=3D"color: #660;" class=3D"styled-by-prettify">=3D</span><span style=3D"col=
or: #066;" class=3D"styled-by-prettify">512M</span><span style=3D"color: #0=
00;" class=3D"styled-by-prettify"><br></span><span style=3D"color: #660;" c=
lass=3D"styled-by-prettify">...</span><span style=3D"color: #000;" class=3D=
"styled-by-prettify"><br></span><span style=3D"color: #660;" class=3D"style=
d-by-prettify">[</span><span style=3D"color: #000;" class=3D"styled-by-pret=
tify"> =C2=A0 =C2=A0</span><span style=3D"color: #066;" class=3D"styled-by-=
prettify">0.000000</span><span style=3D"color: #660;" class=3D"styled-by-pr=
ettify">]</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =
</span><span style=3D"color: #606;" class=3D"styled-by-prettify">Virtual</s=
pan><span style=3D"color: #000;" class=3D"styled-by-prettify"> kernel memor=
y layout</span><span style=3D"color: #660;" class=3D"styled-by-prettify">:<=
/span><span style=3D"color: #000;" class=3D"styled-by-prettify"><br></span>=
<span style=3D"color: #660;" class=3D"styled-by-prettify">[</span><span sty=
le=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span=
 style=3D"color: #066;" class=3D"styled-by-prettify">0.000000</span><span s=
tyle=3D"color: #660;" class=3D"styled-by-prettify">]</span><span style=3D"c=
olor: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0 vector =C2=A0</spa=
n><span style=3D"color: #660;" class=3D"styled-by-prettify">:</span><span s=
tyle=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"c=
olor: #066;" class=3D"styled-by-prettify">0xffff0000</span><span style=3D"c=
olor: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #66=
0;" class=3D"styled-by-prettify">-</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> </span><span style=3D"color: #066;" class=3D"style=
d-by-prettify">0xffff1000</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify"> =C2=A0 </span><span style=3D"color: #660;" class=3D"styled-=
by-prettify">(</span><span style=3D"color: #000;" class=3D"styled-by-pretti=
fy"> =C2=A0 </span><span style=3D"color: #066;" class=3D"styled-by-prettify=
">4</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> kB</sp=
an><span style=3D"color: #660;" class=3D"styled-by-prettify">)</span><span =
style=3D"color: #000;" class=3D"styled-by-prettify"><br></span><span style=
=3D"color: #660;" class=3D"styled-by-prettify">[</span><span style=3D"color=
: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span style=3D"c=
olor: #066;" class=3D"styled-by-prettify">0.000000</span><span style=3D"col=
or: #660;" class=3D"styled-by-prettify">]</span><span style=3D"color: #000;=
" class=3D"styled-by-prettify"> =C2=A0 =C2=A0 fixmap =C2=A0</span><span sty=
le=3D"color: #660;" class=3D"styled-by-prettify">:</span><span style=3D"col=
or: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #066;=
" class=3D"styled-by-prettify">0xffc00000</span><span style=3D"color: #000;=
" class=3D"styled-by-prettify"> </span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">-</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify"> </span><span style=3D"color: #066;" class=3D"styled-by-pret=
tify">0xfff00000</span><span style=3D"color: #000;" class=3D"styled-by-pret=
tify"> =C2=A0 </span><span style=3D"color: #660;" class=3D"styled-by-pretti=
fy">(</span><span style=3D"color: #066;" class=3D"styled-by-prettify">3072<=
/span><span style=3D"color: #000;" class=3D"styled-by-prettify"> kB</span><=
span style=3D"color: #660;" class=3D"styled-by-prettify">)</span><span styl=
e=3D"color: #000;" class=3D"styled-by-prettify"><br></span><span style=3D"c=
olor: #660;" class=3D"styled-by-prettify">[</span><span style=3D"color: #00=
0;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span style=3D"color:=
 #066;" class=3D"styled-by-prettify">0.000000</span><span style=3D"color: #=
660;" class=3D"styled-by-prettify">]</span><span style=3D"color: #000;" cla=
ss=3D"styled-by-prettify"> =C2=A0 =C2=A0 vmalloc </span><span style=3D"colo=
r: #660;" class=3D"styled-by-prettify">:</span><span style=3D"color: #000;"=
 class=3D"styled-by-prettify"> </span><span style=3D"color: #066;" class=3D=
"styled-by-prettify">0xdf800000</span><span style=3D"color: #000;" class=3D=
"styled-by-prettify"> </span><span style=3D"color: #660;" class=3D"styled-b=
y-prettify">-</span><span style=3D"color: #000;" class=3D"styled-by-prettif=
y"> </span><span style=3D"color: #066;" class=3D"styled-by-prettify">0xff00=
0000</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=
=A0 </span><span style=3D"color: #660;" class=3D"styled-by-prettify">(</spa=
n><span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span s=
tyle=3D"color: #066;" class=3D"styled-by-prettify">504</span><span style=3D=
"color: #000;" class=3D"styled-by-prettify"> MB</span><span style=3D"color:=
 #660;" class=3D"styled-by-prettify">)</span><span style=3D"color: #000;" c=
lass=3D"styled-by-prettify"><br></span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">[</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify"> =C2=A0 =C2=A0</span><span style=3D"color: #066;" class=3D"s=
tyled-by-prettify">0.000000</span><span style=3D"color: #660;" class=3D"sty=
led-by-prettify">]</span><span style=3D"color: #000;" class=3D"styled-by-pr=
ettify"> =C2=A0 =C2=A0 lowmem =C2=A0</span><span style=3D"color: #660;" cla=
ss=3D"styled-by-prettify">:</span><span style=3D"color: #000;" class=3D"sty=
led-by-prettify"> </span><span style=3D"color: #066;" class=3D"styled-by-pr=
ettify">0xc0000000</span><span style=3D"color: #000;" class=3D"styled-by-pr=
ettify"> </span><span style=3D"color: #660;" class=3D"styled-by-prettify">-=
</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><s=
pan style=3D"color: #066;" class=3D"styled-by-prettify">0xdf000000</span><s=
pan style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 </span><spa=
n style=3D"color: #660;" class=3D"styled-by-prettify">(</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color=
: #066;" class=3D"styled-by-prettify">496</span><span style=3D"color: #000;=
" class=3D"styled-by-prettify"> MB</span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">)</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify"><br></span><span style=3D"color: #660;" class=3D"styled-by-p=
rettify">[</span><span style=3D"color: #000;" class=3D"styled-by-prettify">=
 =C2=A0 =C2=A0</span><span style=3D"color: #066;" class=3D"styled-by-pretti=
fy">0.000000</span><span style=3D"color: #660;" class=3D"styled-by-prettify=
">]</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0=
 =C2=A0 pkmap =C2=A0 </span><span style=3D"color: #660;" class=3D"styled-by=
-prettify">:</span><span style=3D"color: #000;" class=3D"styled-by-prettify=
"> </span><span style=3D"color: #066;" class=3D"styled-by-prettify">0xbfe00=
000</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </span=
><span style=3D"color: #660;" class=3D"styled-by-prettify">-</span><span st=
yle=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"co=
lor: #066;" class=3D"styled-by-prettify">0xc0000000</span><span style=3D"co=
lor: #000;" class=3D"styled-by-prettify"> =C2=A0 </span><span style=3D"colo=
r: #660;" class=3D"styled-by-prettify">(</span><span style=3D"color: #000;"=
 class=3D"styled-by-prettify"> =C2=A0 </span><span style=3D"color: #066;" c=
lass=3D"styled-by-prettify">2</span><span style=3D"color: #000;" class=3D"s=
tyled-by-prettify"> MB</span><span style=3D"color: #660;" class=3D"styled-b=
y-prettify">)</span><span style=3D"color: #000;" class=3D"styled-by-prettif=
y"><br></span><span style=3D"color: #660;" class=3D"styled-by-prettify">[</=
span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=
=A0</span><span style=3D"color: #066;" class=3D"styled-by-prettify">0.00000=
0</span><span style=3D"color: #660;" class=3D"styled-by-prettify">]</span><=
span style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0 mod=
ules </span><span style=3D"color: #660;" class=3D"styled-by-prettify">:</sp=
an><span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span =
style=3D"color: #066;" class=3D"styled-by-prettify">0xbf000000</span><span =
style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"=
color: #660;" class=3D"styled-by-prettify">-</span><span style=3D"color: #0=
00;" class=3D"styled-by-prettify"> </span><span style=3D"color: #066;" clas=
s=3D"styled-by-prettify">0xbfe00000</span><span style=3D"color: #000;" clas=
s=3D"styled-by-prettify"> =C2=A0 </span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">(</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify"> =C2=A0</span><span style=3D"color: #066;" class=3D"styled-b=
y-prettify">14</span><span style=3D"color: #000;" class=3D"styled-by-pretti=
fy"> MB</span><span style=3D"color: #660;" class=3D"styled-by-prettify">)</=
span><span style=3D"color: #000;" class=3D"styled-by-prettify"><br></span><=
span style=3D"color: #660;" class=3D"styled-by-prettify">[</span><span styl=
e=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span =
style=3D"color: #066;" class=3D"styled-by-prettify">0.000000</span><span st=
yle=3D"color: #660;" class=3D"styled-by-prettify">]</span><span style=3D"co=
lor: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0 =C2=A0 </span><span=
 style=3D"color: #660;" class=3D"styled-by-prettify">.</span><span style=3D=
"color: #000;" class=3D"styled-by-prettify">text </span><span style=3D"colo=
r: #660;" class=3D"styled-by-prettify">:</span><span style=3D"color: #000;"=
 class=3D"styled-by-prettify"> </span><span style=3D"color: #066;" class=3D=
"styled-by-prettify">0xc0008000</span><span style=3D"color: #000;" class=3D=
"styled-by-prettify"> </span><span style=3D"color: #660;" class=3D"styled-b=
y-prettify">-</span><span style=3D"color: #000;" class=3D"styled-by-prettif=
y"> </span><span style=3D"color: #066;" class=3D"styled-by-prettify">0xc081=
3cf4</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=
=A0 </span><span style=3D"color: #660;" class=3D"styled-by-prettify">(</spa=
n><span style=3D"color: #066;" class=3D"styled-by-prettify">8240</span><spa=
n style=3D"color: #000;" class=3D"styled-by-prettify"> kB</span><span style=
=3D"color: #660;" class=3D"styled-by-prettify">)</span><span style=3D"color=
: #000;" class=3D"styled-by-prettify"><br></span><span style=3D"color: #660=
;" class=3D"styled-by-prettify">[</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span style=3D"color: #066;" c=
lass=3D"styled-by-prettify">0.000000</span><span style=3D"color: #660;" cla=
ss=3D"styled-by-prettify">]</span><span style=3D"color: #000;" class=3D"sty=
led-by-prettify"> =C2=A0 =C2=A0 =C2=A0 </span><span style=3D"color: #660;" =
class=3D"styled-by-prettify">.</span><span style=3D"color: #000;" class=3D"=
styled-by-prettify">init </span><span style=3D"color: #660;" class=3D"style=
d-by-prettify">:</span><span style=3D"color: #000;" class=3D"styled-by-pret=
tify"> </span><span style=3D"color: #066;" class=3D"styled-by-prettify">0xc=
0814000</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </=
span><span style=3D"color: #660;" class=3D"styled-by-prettify">-</span><spa=
n style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=
=3D"color: #066;" class=3D"styled-by-prettify">0xc0890000</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 </span><span style=
=3D"color: #660;" class=3D"styled-by-prettify">(</span><span style=3D"color=
: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #066;" =
class=3D"styled-by-prettify">496</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> kB</span><span style=3D"color: #660;" class=3D"sty=
led-by-prettify">)</span><span style=3D"color: #000;" class=3D"styled-by-pr=
ettify"><br></span><span style=3D"color: #660;" class=3D"styled-by-prettify=
">[</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0=
 =C2=A0</span><span style=3D"color: #066;" class=3D"styled-by-prettify">0.0=
00000</span><span style=3D"color: #660;" class=3D"styled-by-prettify">]</sp=
an><span style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0=
 =C2=A0 </span><span style=3D"color: #660;" class=3D"styled-by-prettify">.<=
/span><span style=3D"color: #000;" class=3D"styled-by-prettify">data </span=
><span style=3D"color: #660;" class=3D"styled-by-prettify">:</span><span st=
yle=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"co=
lor: #066;" class=3D"styled-by-prettify">0xc0890000</span><span style=3D"co=
lor: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #660=
;" class=3D"styled-by-prettify">-</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> </span><span style=3D"color: #066;" class=3D"style=
d-by-prettify">0xc0917880</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify"> =C2=A0 </span><span style=3D"color: #660;" class=3D"styled-=
by-prettify">(</span><span style=3D"color: #000;" class=3D"styled-by-pretti=
fy"> </span><span style=3D"color: #066;" class=3D"styled-by-prettify">543</=
span><span style=3D"color: #000;" class=3D"styled-by-prettify"> kB</span><s=
pan style=3D"color: #660;" class=3D"styled-by-prettify">)</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"><br></span><span style=3D"co=
lor: #660;" class=3D"styled-by-prettify">[</span><span style=3D"color: #000=
;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span style=3D"color: =
#066;" class=3D"styled-by-prettify">0.000000</span><span style=3D"color: #6=
60;" class=3D"styled-by-prettify">]</span><span style=3D"color: #000;" clas=
s=3D"styled-by-prettify"> =C2=A0 =C2=A0 =C2=A0 =C2=A0</span><span style=3D"=
color: #660;" class=3D"styled-by-prettify">.</span><span style=3D"color: #0=
00;" class=3D"styled-by-prettify">bss </span><span style=3D"color: #660;" c=
lass=3D"styled-by-prettify">:</span><span style=3D"color: #000;" class=3D"s=
tyled-by-prettify"> </span><span style=3D"color: #066;" class=3D"styled-by-=
prettify">0xc091a000</span><span style=3D"color: #000;" class=3D"styled-by-=
prettify"> </span><span style=3D"color: #660;" class=3D"styled-by-prettify"=
>-</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </span>=
<span style=3D"color: #066;" class=3D"styled-by-prettify">0xc111740c</span>=
<span style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 </span><s=
pan style=3D"color: #660;" class=3D"styled-by-prettify">(</span><span style=
=3D"color: #066;" class=3D"styled-by-prettify">8182</span><span style=3D"co=
lor: #000;" class=3D"styled-by-prettify"> kB</span><span style=3D"color: #6=
60;" class=3D"styled-by-prettify">)</span><span style=3D"color: #000;" clas=
s=3D"styled-by-prettify"><br><br></span></div></code></div><div><br></div><=
div><b>/proc/iomem</b></div><div><blockquote style=3D"margin: 0px 0px 0px 0=
.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;" class=
=3D"gmail_quote">01c00000-01c0002f : /soc@01c00000/sram-controller@01c00000=
<br>01c05000-01c05fff : /soc@01c00000/spi@01c05000<br>01c0f000-01c0ffff : /=
soc@01c00000/mmc@01c0f000<br>01c18000-01c18fff : /soc@01c00000/sata@01c1800=
0<br>01c20060-01c20067 : /clocks/clk@01c20060<br>01c20068-01c2006b : /clock=
s/clk@01c20068<br>01c2006c-01c2006f : /clocks/clk@01c2006c<br>01c20088-01c2=
008b : /clocks/clk@01c20088<br>01c2008c-01c2008f : /clocks/clk@01c2008c<br>=
01c20090-01c20093 : /clocks/clk@01c20090<br>01c20094-01c20097 : /clocks/clk=
@01c20094<br>01c200cc-01c200cf : /clocks/clk@01c200cc<br>01c20800-01c20bff =
: /soc@01c00000/pinctrl@01c20800<br>01c20c90-01c20c9f : /soc@01c00000/watch=
dog@01c20c90<br>01c20d00-01c20d1f : /soc@01c00000/rtc@01c20d00<br>01c28000-=
01c2801f : serial<br>01c28c00-01c28c1f : serial<br>01c29c00-01c29c1f : seri=
al<br>01c2ac00-01c2afff : /soc@01c00000/i2c@01c2ac00<br>01c2b400-01c2b7ff :=
 /soc@01c00000/i2c@01c2b400<br>01c50000-01c5ffff : /soc@01c00000/ethernet@0=
1c50000<br>01c60000-01c60fff : /soc@01c00000/hstimer@01c60000<br>40000000-7=
bdfffff : System RAM<br>=C2=A0 40008000-40813cf3 : Kernel code<br>=C2=A0 40=
890000-4111740b : Kernel data</blockquote><div style=3D"font-weight: bold;"=
><br></div></div><div><br>If you need any other info (e.g., complete kernel=
 log, .config file, or whatever) let me know.</div><div>I really appreciate=
 any suggestions as soon as possible.</div><div><br></div><div>Best regards=
,</div><div><br></div><div>Luigi=C2=A0</div><div><br></div><div><br></div><=
/div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/e5934ccb-97ba-49f5-bf43-d47b2763f4b4%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/e5934ccb-97ba-49f5-bf43-d47b2763f4b4%40googlegroups.com<=
/a>.<br />

------=_Part_654_60421715.1588958367399--

------=_Part_653_1451258986.1588958367397--
