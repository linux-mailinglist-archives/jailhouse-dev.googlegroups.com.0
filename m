Return-Path: <jailhouse-dev+bncBCKO35F6UENRBA4IXLZAKGQEX7O42QY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23c.google.com (mail-oi1-x23c.google.com [IPv6:2607:f8b0:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E19165E1F
	for <lists+jailhouse-dev@lfdr.de>; Thu, 20 Feb 2020 14:05:09 +0100 (CET)
Received: by mail-oi1-x23c.google.com with SMTP id j142sf3898281oib.23
        for <lists+jailhouse-dev@lfdr.de>; Thu, 20 Feb 2020 05:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=WuD893bCDvdJGeFqkFWL9YB3eV4jOsecO4c2zx9gdEQ=;
        b=oam3um4xtpxm3rI0ApHrQmJUtemacdAqwsGB7MhAXr6QH7QcQBsQmdTcUT316mOvBH
         W7jeyTmXX/YgPw6EJSj/XfPmVoOxywhM3eC6J0mlAOruZADUMJXwikaov419VUJhAP3K
         9LGTTLksAbwqYlsFl4G0mGOw/xY0KAv1tgdYO8c59AmwqtArWuYvwLKFzKBn02JyrvEJ
         lpwML8hRGBSvlYUMty6fL7WG9aFttFjY6ffmIcMIUvAzaN//b+caKcwTMR10YvNByhbD
         m6bUcIKmcFfkOmD2zyQWUGO0FjMTlY88xrHaXf5UySGUWCk0MFCDpGGrpyRI4b1fI70d
         YHCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=WuD893bCDvdJGeFqkFWL9YB3eV4jOsecO4c2zx9gdEQ=;
        b=HDBxDsECU69DpJAKTcUngDhb6UjXtMsSgXMIIWbee7QDI523jM5gjwBEwUHiPIyxLP
         i+ksThm6AkEH1EqgYst2Dl90KgFAShUi/+DKrBRD5DQ7TgU6NZiHWr1Cjhe3DRTUSFc/
         oGzr61+cwqH6LAY6nF83d/N45zz9p5BJAMVA5xVHWSX3azsEo4mxndCW7RHaM6ftuV7C
         3zzUClLwpH7lm/ZDnxVlz9hU9+H1/wFEkEmTSnokuQAV2gktK4y9zrorycdNb8N1BFOv
         3/QMpuN+cK7Yf/NDmNVkogWnaPsiv10xopHl/JIKpUeILBJz/SJpHOCX8IKSlYnuqdOK
         jAVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=WuD893bCDvdJGeFqkFWL9YB3eV4jOsecO4c2zx9gdEQ=;
        b=WazjSieEYnEmpvmT069XII/hCxikj++M9wr2bMysNIBoN0rIHhM9ZRxV7CemCIYyy/
         bzkqdRcbKB2vhZ6C43qGd1rkPAkuylRYfikxJlUEKG0T2xRzFelbwU9u0OCfxgQNNw7X
         WRCo8dP0ggZHepPCo2qoQhtBuD0q4D+X2IqSfvWi55fyGama8/qnNTBJJXI83tExNdwD
         HZWNHT+Wi/P0D7JgAcysgU/QBSQ8Rx95qyz7TDQjtKIHZirVuGCDG9p4TdHvT5bpTSwz
         LCxXRpOPc3/DvoogUxKVQard2hJ9ndYBggINL2J0yJErzgOFJ2v5/xOlLHX6bx/XrSjK
         uoyA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVCG7oWU3lElf2AkK5AuAFyFme6v3HDhbNWjAivC7oX4DdXv1XT
	Sq9UW+/UhDhILbJb3cfPm8U=
X-Google-Smtp-Source: APXvYqxrhOjCyk735jGBVV+zoRcziZH4Bs8+ZhSk2PqIrX4jxLgyYandgrAXsW/ISzqVsg1XvhqYug==
X-Received: by 2002:a05:6830:2110:: with SMTP id i16mr22879685otc.337.1582203907700;
        Thu, 20 Feb 2020 05:05:07 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:7150:: with SMTP id y16ls247403otj.7.gmail; Thu, 20 Feb
 2020 05:05:07 -0800 (PST)
X-Received: by 2002:a9d:811:: with SMTP id 17mr24256934oty.369.1582203906972;
        Thu, 20 Feb 2020 05:05:06 -0800 (PST)
Date: Thu, 20 Feb 2020 05:05:06 -0800 (PST)
From: raymanfx@gmail.com
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <221c5f40-594d-4b11-ab0f-dab66585471f@googlegroups.com>
In-Reply-To: <ba1334c7-a13c-fdea-7177-53ad21c23244@siemens.com>
References: <2b9c213c-a111-4f3f-94c5-4f89d06b5fdf@googlegroups.com>
 <eebfa055-f561-d5fb-7da6-706bb1e858ea@siemens.com>
 <439a798e-f9c3-4455-8128-e4047e5aa9e3@googlegroups.com>
 <5d6e66d7-2a25-1678-2ff1-247e861ab8d5@siemens.com>
 <dfe23f77-f16a-41c9-9f6e-8e67b853b66e@googlegroups.com>
 <ba1334c7-a13c-fdea-7177-53ad21c23244@siemens.com>
Subject: Re: Linux non-root cell tooling
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_5613_1792000964.1582203906208"
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

------=_Part_5613_1792000964.1582203906208
Content-Type: multipart/alternative; 
	boundary="----=_Part_5614_771740300.1582203906210"

------=_Part_5614_771740300.1582203906210
Content-Type: text/plain; charset="UTF-8"

Am Donnerstag, 20. Februar 2020 13:24:24 UTC+1 schrieb Jan Kiszka:

>
> PIO access has no "shared with root cell" mode, like memory regions (and 
> there is can be dangerous): If you grant access to non-root cell, the 
> root cell loses it - and may then run into own violations. I don't 
> recall what triggers access to this port, might be the SERIO things, but 
> it can be configured out. 
>
> Jan 
>

That makes sense. But that particular PIO range was not activated for my 
root cell sysconfig by default, so I figured enabling it in the non-root 
cell should not cause any issues.

Following up on my first email today, I built a guest kernel using the 
amd64_defconfig you linked a few days ago.
But no luck. I'm stuck at the exact same output I pasted earlier:
Started cell "linux-x86-demo"
CPU 3 received SIPI, vector 9a

The linux-x86-demo config I am using is the following (modified from the 
0.12 release):
diff --git a/configs/x86/linux-x86-demo.c b/configs/x86/linux-x86-demo.c
index 47cb6517..0f1e6d9e 100644
--- a/configs/x86/linux-x86-demo.c
+++ b/configs/x86/linux-x86-demo.c
@@ -25,7 +25,7 @@ struct {
 #endif
        struct jailhouse_cache cache_regions[1];
        struct jailhouse_irqchip irqchips[1];
-       struct jailhouse_pio pio_regions[3];
+       struct jailhouse_pio pio_regions[4];
 #ifdef CONFIG_QEMU_E1000E_ASSIGNMENT
        struct jailhouse_pci_device pci_devices[5];
 #else
@@ -38,7 +38,7 @@ struct {
                .revision = JAILHOUSE_CONFIG_REVISION,
                .name = "linux-x86-demo",
                .flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
-                        JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
+                        JAILHOUSE_CELL_VIRTUAL_CONSOLE_ACTIVE,
 
                .cpu_set_size = sizeof(config.cpus),
                .num_memory_regions = ARRAY_SIZE(config.mem_regions),
@@ -47,6 +47,12 @@ struct {
                .num_pio_regions = ARRAY_SIZE(config.pio_regions),
                .num_pci_devices = ARRAY_SIZE(config.pci_devices),
                .num_pci_caps = ARRAY_SIZE(config.pci_caps),
+
+               .console = {
+                       .type = JAILHOUSE_CON_TYPE_8250,
+                       .flags = JAILHOUSE_CON_ACCESS_PIO,
+                       .address = 0x3f8,
+               },
        },
 
        .cpus = {
@@ -186,7 +192,7 @@ struct {
        .irqchips = {
                /* IOAPIC */ {
                        .address = 0xfec00000,
-                       .id = 0xff00,
+                       .id = 0x100f7,
                        .pin_bitmap = {
                                (1 << 3) | (1 << 4),
                        },
@@ -197,6 +203,7 @@ struct {
                PIO_RANGE(0x2f8, 8), /* serial 2 */
                PIO_RANGE(0x3f8, 8), /* serial 1 */
                PIO_RANGE(0xe010, 8), /* OXPCIe952 serial1 */
+               PIO_RANGE(0x80, 0x10),
        },
 
        .pci_devices = {

From what I understood from your comment, this should print the Linux 
output to /dev/jailhouse, no?
I'm sorry if I'm missing something obvious here. My plan was to prepare 
real UART for more serious debugging once Linux is starting and loading an 
initrd.
My non-root cell invocation looks like this (modeled after the 
documentation examples):
jailhouse cell linux linux-x86-demo.cell bzImage -c "console=ttyS0,115200"

Thanks,
Chris

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/221c5f40-594d-4b11-ab0f-dab66585471f%40googlegroups.com.

------=_Part_5614_771740300.1582203906210
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Am Donnerstag, 20. Februar 2020 13:24:24 UTC+1 schrieb Jan=
 Kiszka:<br><blockquote class=3D"gmail_quote" style=3D"margin: 0;margin-lef=
t: 0.8ex;border-left: 1px #ccc solid;padding-left: 1ex;">
<br>PIO access has no &quot;shared with root cell&quot; mode, like memory r=
egions (and=20
<br>there is can be dangerous): If you grant access to non-root cell, the=
=20
<br>root cell loses it - and may then run into own violations. I don&#39;t=
=20
<br>recall what triggers access to this port, might be the SERIO things, bu=
t=20
<br>it can be configured out.
<br>
<br>Jan
<br></blockquote><div><br></div><div>That makes sense. But that particular =
PIO range was not activated for my root cell sysconfig by default, so I fig=
ured enabling it in the non-root cell should not cause any issues.</div><di=
v><br></div><div>Following up on my first email today, I built a guest kern=
el using the amd64_defconfig you linked a few days ago.</div><div>But no lu=
ck. I&#39;m stuck at the exact same output I pasted earlier:</div><div><div=
 style=3D"background-color: rgb(250, 250, 250); border-color: rgb(187, 187,=
 187); border-style: solid; border-width: 1px; overflow-wrap: break-word;" =
class=3D"prettyprint"><code class=3D"prettyprint"><div class=3D"subprettypr=
int"><span style=3D"color: #606;" class=3D"styled-by-prettify">Started</spa=
n><span style=3D"color: #000;" class=3D"styled-by-prettify"> cell </span><s=
pan style=3D"color: #080;" class=3D"styled-by-prettify">&quot;linux-x86-dem=
o&quot;</span><span style=3D"color: #000;" class=3D"styled-by-prettify"><br=
>CPU </span><span style=3D"color: #066;" class=3D"styled-by-prettify">3</sp=
an><span style=3D"color: #000;" class=3D"styled-by-prettify"> received SIPI=
</span><span style=3D"color: #660;" class=3D"styled-by-prettify">,</span><s=
pan style=3D"color: #000;" class=3D"styled-by-prettify"> vector </span><spa=
n style=3D"color: #066;" class=3D"styled-by-prettify">9a</span></div></code=
></div><br>The linux-x86-demo config I am using is the following (modified =
from the 0.12 release):</div><div><div style=3D"background-color: rgb(250, =
250, 250); border-color: rgb(187, 187, 187); border-style: solid; border-wi=
dth: 1px; overflow-wrap: break-word;" class=3D"prettyprint"><code class=3D"=
prettyprint"><div class=3D"subprettyprint"><span style=3D"color: #000;" cla=
ss=3D"styled-by-prettify">diff </span><span style=3D"color: #660;" class=3D=
"styled-by-prettify">--</span><span style=3D"color: #000;" class=3D"styled-=
by-prettify">git a</span><span style=3D"color: #660;" class=3D"styled-by-pr=
ettify">/</span><span style=3D"color: #000;" class=3D"styled-by-prettify">c=
onfigs</span><span style=3D"color: #660;" class=3D"styled-by-prettify">/</s=
pan><span style=3D"color: #000;" class=3D"styled-by-prettify">x86</span><sp=
an style=3D"color: #660;" class=3D"styled-by-prettify">/</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify">linux</span><span style=3D"c=
olor: #660;" class=3D"styled-by-prettify">-</span><span style=3D"color: #00=
0;" class=3D"styled-by-prettify">x86</span><span style=3D"color: #660;" cla=
ss=3D"styled-by-prettify">-</span><span style=3D"color: #000;" class=3D"sty=
led-by-prettify">demo</span><span style=3D"color: #660;" class=3D"styled-by=
-prettify">.</span><span style=3D"color: #000;" class=3D"styled-by-prettify=
">c b</span><span style=3D"color: #660;" class=3D"styled-by-prettify">/</sp=
an><span style=3D"color: #000;" class=3D"styled-by-prettify">configs</span>=
<span style=3D"color: #660;" class=3D"styled-by-prettify">/</span><span sty=
le=3D"color: #000;" class=3D"styled-by-prettify">x86</span><span style=3D"c=
olor: #660;" class=3D"styled-by-prettify">/</span><span style=3D"color: #00=
0;" class=3D"styled-by-prettify">linux</span><span style=3D"color: #660;" c=
lass=3D"styled-by-prettify">-</span><span style=3D"color: #000;" class=3D"s=
tyled-by-prettify">x86</span><span style=3D"color: #660;" class=3D"styled-b=
y-prettify">-</span><span style=3D"color: #000;" class=3D"styled-by-prettif=
y">demo</span><span style=3D"color: #660;" class=3D"styled-by-prettify">.</=
span><span style=3D"color: #000;" class=3D"styled-by-prettify">c<br>index <=
/span><span style=3D"color: #066;" class=3D"styled-by-prettify">47cb6517.</=
span><span style=3D"color: #660;" class=3D"styled-by-prettify">.</span><spa=
n style=3D"color: #066;" class=3D"styled-by-prettify">0f1e6d9e</span><span =
style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"=
color: #066;" class=3D"styled-by-prettify">100644</span><span style=3D"colo=
r: #000;" class=3D"styled-by-prettify"><br></span><span style=3D"color: #66=
0;" class=3D"styled-by-prettify">---</span><span style=3D"color: #000;" cla=
ss=3D"styled-by-prettify"> a</span><span style=3D"color: #660;" class=3D"st=
yled-by-prettify">/</span><span style=3D"color: #000;" class=3D"styled-by-p=
rettify">configs</span><span style=3D"color: #660;" class=3D"styled-by-pret=
tify">/</span><span style=3D"color: #000;" class=3D"styled-by-prettify">x86=
</span><span style=3D"color: #660;" class=3D"styled-by-prettify">/</span><s=
pan style=3D"color: #000;" class=3D"styled-by-prettify">linux</span><span s=
tyle=3D"color: #660;" class=3D"styled-by-prettify">-</span><span style=3D"c=
olor: #000;" class=3D"styled-by-prettify">x86</span><span style=3D"color: #=
660;" class=3D"styled-by-prettify">-</span><span style=3D"color: #000;" cla=
ss=3D"styled-by-prettify">demo</span><span style=3D"color: #660;" class=3D"=
styled-by-prettify">.</span><span style=3D"color: #000;" class=3D"styled-by=
-prettify">c<br></span><span style=3D"color: #660;" class=3D"styled-by-pret=
tify">+++</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =
b</span><span style=3D"color: #660;" class=3D"styled-by-prettify">/</span><=
span style=3D"color: #000;" class=3D"styled-by-prettify">configs</span><spa=
n style=3D"color: #660;" class=3D"styled-by-prettify">/</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify">x86</span><span style=3D"col=
or: #660;" class=3D"styled-by-prettify">/</span><span style=3D"color: #000;=
" class=3D"styled-by-prettify">linux</span><span style=3D"color: #660;" cla=
ss=3D"styled-by-prettify">-</span><span style=3D"color: #000;" class=3D"sty=
led-by-prettify">x86</span><span style=3D"color: #660;" class=3D"styled-by-=
prettify">-</span><span style=3D"color: #000;" class=3D"styled-by-prettify"=
>demo</span><span style=3D"color: #660;" class=3D"styled-by-prettify">.</sp=
an><span style=3D"color: #000;" class=3D"styled-by-prettify">c<br></span><s=
pan style=3D"color: #660;" class=3D"styled-by-prettify">@@</span><span styl=
e=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"colo=
r: #660;" class=3D"styled-by-prettify">-</span><span style=3D"color: #066;"=
 class=3D"styled-by-prettify">25</span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">,</span><span style=3D"color: #066;" class=3D"style=
d-by-prettify">7</span><span style=3D"color: #000;" class=3D"styled-by-pret=
tify"> </span><span style=3D"color: #660;" class=3D"styled-by-prettify">+</=
span><span style=3D"color: #066;" class=3D"styled-by-prettify">25</span><sp=
an style=3D"color: #660;" class=3D"styled-by-prettify">,</span><span style=
=3D"color: #066;" class=3D"styled-by-prettify">7</span><span style=3D"color=
: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #660;" =
class=3D"styled-by-prettify">@@</span><span style=3D"color: #000;" class=3D=
"styled-by-prettify"> </span><span style=3D"color: #008;" class=3D"styled-b=
y-prettify">struct</span><span style=3D"color: #000;" class=3D"styled-by-pr=
ettify"> </span><span style=3D"color: #660;" class=3D"styled-by-prettify">{=
</span><span style=3D"color: #000;" class=3D"styled-by-prettify"><br>=C2=A0=
</span><span style=3D"color: #800;" class=3D"styled-by-prettify">#endif</sp=
an><span style=3D"color: #000;" class=3D"styled-by-prettify"><br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 </span><span style=3D"color: #008;" class=3D"styled-by-pr=
ettify">struct</span><span style=3D"color: #000;" class=3D"styled-by-pretti=
fy"> jailhouse_cache cache_regions</span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">[</span><span style=3D"color: #066;" class=3D"style=
d-by-prettify">1</span><span style=3D"color: #660;" class=3D"styled-by-pret=
tify">];</span><span style=3D"color: #000;" class=3D"styled-by-prettify"><b=
r>=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span><span style=3D"color: #008;" class=3D"=
styled-by-prettify">struct</span><span style=3D"color: #000;" class=3D"styl=
ed-by-prettify"> jailhouse_irqchip irqchips</span><span style=3D"color: #66=
0;" class=3D"styled-by-prettify">[</span><span style=3D"color: #066;" class=
=3D"styled-by-prettify">1</span><span style=3D"color: #660;" class=3D"style=
d-by-prettify">];</span><span style=3D"color: #000;" class=3D"styled-by-pre=
ttify"><br></span><span style=3D"color: #660;" class=3D"styled-by-prettify"=
>-</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =
=C2=A0 =C2=A0 </span><span style=3D"color: #008;" class=3D"styled-by-pretti=
fy">struct</span><span style=3D"color: #000;" class=3D"styled-by-prettify">=
 jailhouse_pio pio_regions</span><span style=3D"color: #660;" class=3D"styl=
ed-by-prettify">[</span><span style=3D"color: #066;" class=3D"styled-by-pre=
ttify">3</span><span style=3D"color: #660;" class=3D"styled-by-prettify">];=
</span><span style=3D"color: #000;" class=3D"styled-by-prettify"><br></span=
><span style=3D"color: #660;" class=3D"styled-by-prettify">+</span><span st=
yle=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0 =C2=A0 </s=
pan><span style=3D"color: #008;" class=3D"styled-by-prettify">struct</span>=
<span style=3D"color: #000;" class=3D"styled-by-prettify"> jailhouse_pio pi=
o_regions</span><span style=3D"color: #660;" class=3D"styled-by-prettify">[=
</span><span style=3D"color: #066;" class=3D"styled-by-prettify">4</span><s=
pan style=3D"color: #660;" class=3D"styled-by-prettify">];</span><span styl=
e=3D"color: #000;" class=3D"styled-by-prettify"><br>=C2=A0</span><span styl=
e=3D"color: #800;" class=3D"styled-by-prettify">#ifdef</span><span style=3D=
"color: #000;" class=3D"styled-by-prettify"> CONFIG_QEMU_E1000E_ASSIGNMENT<=
br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span><span style=3D"color: #008;" class=3D=
"styled-by-prettify">struct</span><span style=3D"color: #000;" class=3D"sty=
led-by-prettify"> jailhouse_pci_device pci_devices</span><span style=3D"col=
or: #660;" class=3D"styled-by-prettify">[</span><span style=3D"color: #066;=
" class=3D"styled-by-prettify">5</span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">];</span><span style=3D"color: #000;" class=3D"styl=
ed-by-prettify"><br>=C2=A0</span><span style=3D"color: #800;" class=3D"styl=
ed-by-prettify">#else</span><span style=3D"color: #000;" class=3D"styled-by=
-prettify"><br></span><span style=3D"color: #660;" class=3D"styled-by-prett=
ify">@@</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </=
span><span style=3D"color: #660;" class=3D"styled-by-prettify">-</span><spa=
n style=3D"color: #066;" class=3D"styled-by-prettify">38</span><span style=
=3D"color: #660;" class=3D"styled-by-prettify">,</span><span style=3D"color=
: #066;" class=3D"styled-by-prettify">7</span><span style=3D"color: #000;" =
class=3D"styled-by-prettify"> </span><span style=3D"color: #660;" class=3D"=
styled-by-prettify">+</span><span style=3D"color: #066;" class=3D"styled-by=
-prettify">38</span><span style=3D"color: #660;" class=3D"styled-by-prettif=
y">,</span><span style=3D"color: #066;" class=3D"styled-by-prettify">7</spa=
n><span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span s=
tyle=3D"color: #660;" class=3D"styled-by-prettify">@@</span><span style=3D"=
color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #0=
08;" class=3D"styled-by-prettify">struct</span><span style=3D"color: #000;"=
 class=3D"styled-by-prettify"> </span><span style=3D"color: #660;" class=3D=
"styled-by-prettify">{</span><span style=3D"color: #000;" class=3D"styled-b=
y-prettify"><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </s=
pan><span style=3D"color: #660;" class=3D"styled-by-prettify">.</span><span=
 style=3D"color: #000;" class=3D"styled-by-prettify">revision </span><span =
style=3D"color: #660;" class=3D"styled-by-prettify">=3D</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"> JAILHOUSE_CONFIG_REVISION</=
span><span style=3D"color: #660;" class=3D"styled-by-prettify">,</span><spa=
n style=3D"color: #000;" class=3D"styled-by-prettify"><br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span><span style=3D"color: #660;" =
class=3D"styled-by-prettify">.</span><span style=3D"color: #000;" class=3D"=
styled-by-prettify">name </span><span style=3D"color: #660;" class=3D"style=
d-by-prettify">=3D</span><span style=3D"color: #000;" class=3D"styled-by-pr=
ettify"> </span><span style=3D"color: #080;" class=3D"styled-by-prettify">&=
quot;linux-x86-demo&quot;</span><span style=3D"color: #660;" class=3D"style=
d-by-prettify">,</span><span style=3D"color: #000;" class=3D"styled-by-pret=
tify"><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span><s=
pan style=3D"color: #660;" class=3D"styled-by-prettify">.</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify">flags </span><span style=3D"=
color: #660;" class=3D"styled-by-prettify">=3D</span><span style=3D"color: =
#000;" class=3D"styled-by-prettify"> JAILHOUSE_CELL_PASSIVE_COMMREG </span>=
<span style=3D"color: #660;" class=3D"styled-by-prettify">|</span><span sty=
le=3D"color: #000;" class=3D"styled-by-prettify"><br></span><span style=3D"=
color: #660;" class=3D"styled-by-prettify">-</span><span style=3D"color: #0=
00;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0JAILHOUSE_CELL_VIRTUAL_CONSOLE=
_PERMITTED</span><span style=3D"color: #660;" class=3D"styled-by-prettify">=
,</span><span style=3D"color: #000;" class=3D"styled-by-prettify"><br></spa=
n><span style=3D"color: #660;" class=3D"styled-by-prettify">+</span><span s=
tyle=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0JAILHOUSE_CEL=
L_VIRTUAL_CONSOLE_ACTIVE</span><span style=3D"color: #660;" class=3D"styled=
-by-prettify">,</span><span style=3D"color: #000;" class=3D"styled-by-prett=
ify"><br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
</span><span style=3D"color: #660;" class=3D"styled-by-prettify">.</span><s=
pan style=3D"color: #000;" class=3D"styled-by-prettify">cpu_set_size </span=
><span style=3D"color: #660;" class=3D"styled-by-prettify">=3D</span><span =
style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"=
color: #008;" class=3D"styled-by-prettify">sizeof</span><span style=3D"colo=
r: #660;" class=3D"styled-by-prettify">(</span><span style=3D"color: #000;"=
 class=3D"styled-by-prettify">config</span><span style=3D"color: #660;" cla=
ss=3D"styled-by-prettify">.</span><span style=3D"color: #000;" class=3D"sty=
led-by-prettify">cpus</span><span style=3D"color: #660;" class=3D"styled-by=
-prettify">),</span><span style=3D"color: #000;" class=3D"styled-by-prettif=
y"><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span><span=
 style=3D"color: #660;" class=3D"styled-by-prettify">.</span><span style=3D=
"color: #000;" class=3D"styled-by-prettify">num_memory_regions </span><span=
 style=3D"color: #660;" class=3D"styled-by-prettify">=3D</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"> ARRAY_SIZE</span><span styl=
e=3D"color: #660;" class=3D"styled-by-prettify">(</span><span style=3D"colo=
r: #000;" class=3D"styled-by-prettify">config</span><span style=3D"color: #=
660;" class=3D"styled-by-prettify">.</span><span style=3D"color: #000;" cla=
ss=3D"styled-by-prettify">mem_regions</span><span style=3D"color: #660;" cl=
ass=3D"styled-by-prettify">),</span><span style=3D"color: #000;" class=3D"s=
tyled-by-prettify"><br></span><span style=3D"color: #660;" class=3D"styled-=
by-prettify">@@</span><span style=3D"color: #000;" class=3D"styled-by-prett=
ify"> </span><span style=3D"color: #660;" class=3D"styled-by-prettify">-</s=
pan><span style=3D"color: #066;" class=3D"styled-by-prettify">47</span><spa=
n style=3D"color: #660;" class=3D"styled-by-prettify">,</span><span style=
=3D"color: #066;" class=3D"styled-by-prettify">6</span><span style=3D"color=
: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #660;" =
class=3D"styled-by-prettify">+</span><span style=3D"color: #066;" class=3D"=
styled-by-prettify">47</span><span style=3D"color: #660;" class=3D"styled-b=
y-prettify">,</span><span style=3D"color: #066;" class=3D"styled-by-prettif=
y">12</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </sp=
an><span style=3D"color: #660;" class=3D"styled-by-prettify">@@</span><span=
 style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D=
"color: #008;" class=3D"styled-by-prettify">struct</span><span style=3D"col=
or: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #660;=
" class=3D"styled-by-prettify">{</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 </span><span style=3D"color: #660;" class=3D"styled-by-prettify"=
>.</span><span style=3D"color: #000;" class=3D"styled-by-prettify">num_pio_=
regions </span><span style=3D"color: #660;" class=3D"styled-by-prettify">=
=3D</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> ARRAY_=
SIZE</span><span style=3D"color: #660;" class=3D"styled-by-prettify">(</spa=
n><span style=3D"color: #000;" class=3D"styled-by-prettify">config</span><s=
pan style=3D"color: #660;" class=3D"styled-by-prettify">.</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify">pio_regions</span><span styl=
e=3D"color: #660;" class=3D"styled-by-prettify">),</span><span style=3D"col=
or: #000;" class=3D"styled-by-prettify"><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 </span><span style=3D"color: #660;" class=3D"style=
d-by-prettify">.</span><span style=3D"color: #000;" class=3D"styled-by-pret=
tify">num_pci_devices </span><span style=3D"color: #660;" class=3D"styled-b=
y-prettify">=3D</span><span style=3D"color: #000;" class=3D"styled-by-prett=
ify"> ARRAY_SIZE</span><span style=3D"color: #660;" class=3D"styled-by-pret=
tify">(</span><span style=3D"color: #000;" class=3D"styled-by-prettify">con=
fig</span><span style=3D"color: #660;" class=3D"styled-by-prettify">.</span=
><span style=3D"color: #000;" class=3D"styled-by-prettify">pci_devices</spa=
n><span style=3D"color: #660;" class=3D"styled-by-prettify">),</span><span =
style=3D"color: #000;" class=3D"styled-by-prettify"><br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span><span style=3D"color: #660;" =
class=3D"styled-by-prettify">.</span><span style=3D"color: #000;" class=3D"=
styled-by-prettify">num_pci_caps </span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">=3D</span><span style=3D"color: #000;" class=3D"sty=
led-by-prettify"> ARRAY_SIZE</span><span style=3D"color: #660;" class=3D"st=
yled-by-prettify">(</span><span style=3D"color: #000;" class=3D"styled-by-p=
rettify">config</span><span style=3D"color: #660;" class=3D"styled-by-prett=
ify">.</span><span style=3D"color: #000;" class=3D"styled-by-prettify">pci_=
caps</span><span style=3D"color: #660;" class=3D"styled-by-prettify">),</sp=
an><span style=3D"color: #000;" class=3D"styled-by-prettify"><br></span><sp=
an style=3D"color: #660;" class=3D"styled-by-prettify">+</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"><br></span><span style=3D"co=
lor: #660;" class=3D"styled-by-prettify">+</span><span style=3D"color: #000=
;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 </span><span style=3D"color: #660;" class=3D"styled-by-prettify">.</=
span><span style=3D"color: #000;" class=3D"styled-by-prettify">console </sp=
an><span style=3D"color: #660;" class=3D"styled-by-prettify">=3D</span><spa=
n style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=
=3D"color: #660;" class=3D"styled-by-prettify">{</span><span style=3D"color=
: #000;" class=3D"styled-by-prettify"><br></span><span style=3D"color: #660=
;" class=3D"styled-by-prettify">+</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span><span style=3D"color: #660;" class=3D"st=
yled-by-prettify">.</span><span style=3D"color: #000;" class=3D"styled-by-p=
rettify">type </span><span style=3D"color: #660;" class=3D"styled-by-pretti=
fy">=3D</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> JA=
ILHOUSE_CON_TYPE_8250</span><span style=3D"color: #660;" class=3D"styled-by=
-prettify">,</span><span style=3D"color: #000;" class=3D"styled-by-prettify=
"><br></span><span style=3D"color: #660;" class=3D"styled-by-prettify">+</s=
pan><span style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span><=
span style=3D"color: #660;" class=3D"styled-by-prettify">.</span><span styl=
e=3D"color: #000;" class=3D"styled-by-prettify">flags </span><span style=3D=
"color: #660;" class=3D"styled-by-prettify">=3D</span><span style=3D"color:=
 #000;" class=3D"styled-by-prettify"> JAILHOUSE_CON_ACCESS_PIO</span><span =
style=3D"color: #660;" class=3D"styled-by-prettify">,</span><span style=3D"=
color: #000;" class=3D"styled-by-prettify"><br></span><span style=3D"color:=
 #660;" class=3D"styled-by-prettify">+</span><span style=3D"color: #000;" c=
lass=3D"styled-by-prettify"> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">.</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify">address </span><span style=3D"color: #660;" class=3D"styled-=
by-prettify">=3D</span><span style=3D"color: #000;" class=3D"styled-by-pret=
tify"> </span><span style=3D"color: #066;" class=3D"styled-by-prettify">0x3=
f8</span><span style=3D"color: #660;" class=3D"styled-by-prettify">,</span>=
<span style=3D"color: #000;" class=3D"styled-by-prettify"><br></span><span =
style=3D"color: #660;" class=3D"styled-by-prettify">+</span><span style=3D"=
color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 </span><span style=3D"color: #660;" class=3D"styled-by-pr=
ettify">},</span><span style=3D"color: #000;" class=3D"styled-by-prettify">=
<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">},</span><span style=3D"color: #000;" class=3D"styl=
ed-by-prettify"><br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span><span styl=
e=3D"color: #660;" class=3D"styled-by-prettify">.</span><span style=3D"colo=
r: #000;" class=3D"styled-by-prettify">cpus </span><span style=3D"color: #6=
60;" class=3D"styled-by-prettify">=3D</span><span style=3D"color: #000;" cl=
ass=3D"styled-by-prettify"> </span><span style=3D"color: #660;" class=3D"st=
yled-by-prettify">{</span><span style=3D"color: #000;" class=3D"styled-by-p=
rettify"><br></span><span style=3D"color: #660;" class=3D"styled-by-prettif=
y">@@</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </sp=
an><span style=3D"color: #660;" class=3D"styled-by-prettify">-</span><span =
style=3D"color: #066;" class=3D"styled-by-prettify">186</span><span style=
=3D"color: #660;" class=3D"styled-by-prettify">,</span><span style=3D"color=
: #066;" class=3D"styled-by-prettify">7</span><span style=3D"color: #000;" =
class=3D"styled-by-prettify"> </span><span style=3D"color: #660;" class=3D"=
styled-by-prettify">+</span><span style=3D"color: #066;" class=3D"styled-by=
-prettify">192</span><span style=3D"color: #660;" class=3D"styled-by-pretti=
fy">,</span><span style=3D"color: #066;" class=3D"styled-by-prettify">7</sp=
an><span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span =
style=3D"color: #660;" class=3D"styled-by-prettify">@@</span><span style=3D=
"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #=
008;" class=3D"styled-by-prettify">struct</span><span style=3D"color: #000;=
" class=3D"styled-by-prettify"> </span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">{</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify"><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span><span style=3D"color:=
 #660;" class=3D"styled-by-prettify">.</span><span style=3D"color: #000;" c=
lass=3D"styled-by-prettify">irqchips </span><span style=3D"color: #660;" cl=
ass=3D"styled-by-prettify">=3D</span><span style=3D"color: #000;" class=3D"=
styled-by-prettify"> </span><span style=3D"color: #660;" class=3D"styled-by=
-prettify">{</span><span style=3D"color: #000;" class=3D"styled-by-prettify=
"><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span><span =
style=3D"color: #800;" class=3D"styled-by-prettify">/* IOAPIC */</span><spa=
n style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=
=3D"color: #660;" class=3D"styled-by-prettify">{</span><span style=3D"color=
: #000;" class=3D"styled-by-prettify"><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span><span style=3D"=
color: #660;" class=3D"styled-by-prettify">.</span><span style=3D"color: #0=
00;" class=3D"styled-by-prettify">address </span><span style=3D"color: #660=
;" class=3D"styled-by-prettify">=3D</span><span style=3D"color: #000;" clas=
s=3D"styled-by-prettify"> </span><span style=3D"color: #066;" class=3D"styl=
ed-by-prettify">0xfec00000</span><span style=3D"color: #660;" class=3D"styl=
ed-by-prettify">,</span><span style=3D"color: #000;" class=3D"styled-by-pre=
ttify"><br></span><span style=3D"color: #660;" class=3D"styled-by-prettify"=
>-</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </spa=
n><span style=3D"color: #660;" class=3D"styled-by-prettify">.</span><span s=
tyle=3D"color: #000;" class=3D"styled-by-prettify">id </span><span style=3D=
"color: #660;" class=3D"styled-by-prettify">=3D</span><span style=3D"color:=
 #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #066;" c=
lass=3D"styled-by-prettify">0xff00</span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">,</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify"><br></span><span style=3D"color: #660;" class=3D"styled-by-p=
rettify">+</span><span style=3D"color: #000;" class=3D"styled-by-prettify">=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 </span><span style=3D"color: #660;" class=3D"styled-by-prettify">.</spa=
n><span style=3D"color: #000;" class=3D"styled-by-prettify">id </span><span=
 style=3D"color: #660;" class=3D"styled-by-prettify">=3D</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color=
: #066;" class=3D"styled-by-prettify">0x100f7</span><span style=3D"color: #=
660;" class=3D"styled-by-prettify">,</span><span style=3D"color: #000;" cla=
ss=3D"styled-by-prettify"><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span><span style=3D"color: #660;" =
class=3D"styled-by-prettify">.</span><span style=3D"color: #000;" class=3D"=
styled-by-prettify">pin_bitmap </span><span style=3D"color: #660;" class=3D=
"styled-by-prettify">=3D</span><span style=3D"color: #000;" class=3D"styled=
-by-prettify"> </span><span style=3D"color: #660;" class=3D"styled-by-prett=
ify">{</span><span style=3D"color: #000;" class=3D"styled-by-prettify"><br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span><span style=3D"color: #660;" =
class=3D"styled-by-prettify">(</span><span style=3D"color: #066;" class=3D"=
styled-by-prettify">1</span><span style=3D"color: #000;" class=3D"styled-by=
-prettify"> </span><span style=3D"color: #660;" class=3D"styled-by-prettify=
">&lt;&lt;</span><span style=3D"color: #000;" class=3D"styled-by-prettify">=
 </span><span style=3D"color: #066;" class=3D"styled-by-prettify">3</span><=
span style=3D"color: #660;" class=3D"styled-by-prettify">)</span><span styl=
e=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"colo=
r: #660;" class=3D"styled-by-prettify">|</span><span style=3D"color: #000;"=
 class=3D"styled-by-prettify"> </span><span style=3D"color: #660;" class=3D=
"styled-by-prettify">(</span><span style=3D"color: #066;" class=3D"styled-b=
y-prettify">1</span><span style=3D"color: #000;" class=3D"styled-by-prettif=
y"> </span><span style=3D"color: #660;" class=3D"styled-by-prettify">&lt;&l=
t;</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </span>=
<span style=3D"color: #066;" class=3D"styled-by-prettify">4</span><span sty=
le=3D"color: #660;" class=3D"styled-by-prettify">),</span><span style=3D"co=
lor: #000;" class=3D"styled-by-prettify"><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span><span style=
=3D"color: #660;" class=3D"styled-by-prettify">},</span><span style=3D"colo=
r: #000;" class=3D"styled-by-prettify"><br></span><span style=3D"color: #66=
0;" class=3D"styled-by-prettify">@@</span><span style=3D"color: #000;" clas=
s=3D"styled-by-prettify"> </span><span style=3D"color: #660;" class=3D"styl=
ed-by-prettify">-</span><span style=3D"color: #066;" class=3D"styled-by-pre=
ttify">197</span><span style=3D"color: #660;" class=3D"styled-by-prettify">=
,</span><span style=3D"color: #066;" class=3D"styled-by-prettify">6</span><=
span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span styl=
e=3D"color: #660;" class=3D"styled-by-prettify">+</span><span style=3D"colo=
r: #066;" class=3D"styled-by-prettify">203</span><span style=3D"color: #660=
;" class=3D"styled-by-prettify">,</span><span style=3D"color: #066;" class=
=3D"styled-by-prettify">7</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify"> </span><span style=3D"color: #660;" class=3D"styled-by-pret=
tify">@@</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> <=
/span><span style=3D"color: #008;" class=3D"styled-by-prettify">struct</spa=
n><span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span s=
tyle=3D"color: #660;" class=3D"styled-by-prettify">{</span><span style=3D"c=
olor: #000;" class=3D"styled-by-prettify"><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 PIO_RANGE</span><span style=3D"color: #660;" cl=
ass=3D"styled-by-prettify">(</span><span style=3D"color: #066;" class=3D"st=
yled-by-prettify">0x2f8</span><span style=3D"color: #660;" class=3D"styled-=
by-prettify">,</span><span style=3D"color: #000;" class=3D"styled-by-pretti=
fy"> </span><span style=3D"color: #066;" class=3D"styled-by-prettify">8</sp=
an><span style=3D"color: #660;" class=3D"styled-by-prettify">),</span><span=
 style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D=
"color: #800;" class=3D"styled-by-prettify">/* serial 2 */</span><span styl=
e=3D"color: #000;" class=3D"styled-by-prettify"><br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PIO_RANGE</span><span style=3D"color: #6=
60;" class=3D"styled-by-prettify">(</span><span style=3D"color: #066;" clas=
s=3D"styled-by-prettify">0x3f8</span><span style=3D"color: #660;" class=3D"=
styled-by-prettify">,</span><span style=3D"color: #000;" class=3D"styled-by=
-prettify"> </span><span style=3D"color: #066;" class=3D"styled-by-prettify=
">8</span><span style=3D"color: #660;" class=3D"styled-by-prettify">),</spa=
n><span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span s=
tyle=3D"color: #800;" class=3D"styled-by-prettify">/* serial 1 */</span><sp=
an style=3D"color: #000;" class=3D"styled-by-prettify"><br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PIO_RANGE</span><span style=3D"co=
lor: #660;" class=3D"styled-by-prettify">(</span><span style=3D"color: #066=
;" class=3D"styled-by-prettify">0xe010</span><span style=3D"color: #660;" c=
lass=3D"styled-by-prettify">,</span><span style=3D"color: #000;" class=3D"s=
tyled-by-prettify"> </span><span style=3D"color: #066;" class=3D"styled-by-=
prettify">8</span><span style=3D"color: #660;" class=3D"styled-by-prettify"=
>),</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </span=
><span style=3D"color: #800;" class=3D"styled-by-prettify">/* OXPCIe952 ser=
ial1 */</span><span style=3D"color: #000;" class=3D"styled-by-prettify"><br=
></span><span style=3D"color: #660;" class=3D"styled-by-prettify">+</span><=
span style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PIO_RANGE</span><span style=3D"color: #660;=
" class=3D"styled-by-prettify">(</span><span style=3D"color: #066;" class=
=3D"styled-by-prettify">0x80</span><span style=3D"color: #660;" class=3D"st=
yled-by-prettify">,</span><span style=3D"color: #000;" class=3D"styled-by-p=
rettify"> </span><span style=3D"color: #066;" class=3D"styled-by-prettify">=
0x10</span><span style=3D"color: #660;" class=3D"styled-by-prettify">),</sp=
an><span style=3D"color: #000;" class=3D"styled-by-prettify"><br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 </span><span style=3D"color: #660;" class=3D"styled-by-pr=
ettify">},</span><span style=3D"color: #000;" class=3D"styled-by-prettify">=
<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span><span style=3D"color: #660=
;" class=3D"styled-by-prettify">.</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify">pci_devices </span><span style=3D"color: #660;" cla=
ss=3D"styled-by-prettify">=3D</span><span style=3D"color: #000;" class=3D"s=
tyled-by-prettify"> </span><span style=3D"color: #660;" class=3D"styled-by-=
prettify">{</span></div></code></div><br>From what I understood from your c=
omment, this should print the Linux output to /dev/jailhouse, no?</div><div=
>I&#39;m sorry if I&#39;m missing something obvious here. My plan was to pr=
epare real UART for more serious debugging once Linux is starting and loadi=
ng an initrd.</div><div>My non-root cell invocation looks like this (modele=
d after the documentation examples):</div><div><div style=3D"background-col=
or: rgb(250, 250, 250); border-color: rgb(187, 187, 187); border-style: sol=
id; border-width: 1px; overflow-wrap: break-word;" class=3D"prettyprint"><c=
ode class=3D"prettyprint"><div class=3D"subprettyprint"><span style=3D"colo=
r: #000;" class=3D"styled-by-prettify">jailhouse cell linux linux</span><sp=
an style=3D"color: #660;" class=3D"styled-by-prettify">-</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify">x86</span><span style=3D"col=
or: #660;" class=3D"styled-by-prettify">-</span><span style=3D"color: #000;=
" class=3D"styled-by-prettify">demo</span><span style=3D"color: #660;" clas=
s=3D"styled-by-prettify">.</span><span style=3D"color: #000;" class=3D"styl=
ed-by-prettify">cell bzImage </span><span style=3D"color: #660;" class=3D"s=
tyled-by-prettify">-</span><span style=3D"color: #000;" class=3D"styled-by-=
prettify">c </span><span style=3D"color: #080;" class=3D"styled-by-prettify=
">&quot;console=3DttyS0,115200&quot;</span></div></code></div><br>Thanks,</=
div><div>Chris<br></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/221c5f40-594d-4b11-ab0f-dab66585471f%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/221c5f40-594d-4b11-ab0f-dab66585471f%40googlegroups.com<=
/a>.<br />

------=_Part_5614_771740300.1582203906210--

------=_Part_5613_1792000964.1582203906208--
