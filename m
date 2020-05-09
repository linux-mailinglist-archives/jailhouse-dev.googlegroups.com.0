Return-Path: <jailhouse-dev+bncBDH5LQU54QDBB5X23P2QKGQEFMWYTWA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oo1-xc39.google.com (mail-oo1-xc39.google.com [IPv6:2607:f8b0:4864:20::c39])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECB61CC3D5
	for <lists+jailhouse-dev@lfdr.de>; Sat,  9 May 2020 20:59:04 +0200 (CEST)
Received: by mail-oo1-xc39.google.com with SMTP id l4sf3816587oog.15
        for <lists+jailhouse-dev@lfdr.de>; Sat, 09 May 2020 11:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=3UqsY9LHEYbZC3Cdb4Zg6VdTFGjPDR5kI/+iNxCKbaE=;
        b=hMQZa05vNZFuTxViTm308THegpQlsWCvUazfGE3msFVSMs+k75DGI8y6vsjoNZID7j
         Z2jqLQNbS5dP/aQmaJHNrUdSBT58QN1Bei8EMr6P7N1JVPBMlHQxAhLUaU+0MC/kwnoh
         VqPX19PwKL2DwFut2LPSttaiUCeGRICxIX7VwPM2bGZagyN/7xWdkRSXoGpi14mbqCX4
         1ZsfMWT0AG3QdQrHB+HrfdF6ykOxSUADitsbQfY8P1B3h+wMMCz8axno3yCk/lSWyWMh
         bPVDDA9Tm2O02MbgK1FXCzkHEGCzDhiEid9NB7FlB2T82AUstGIc3HPkLAPslA2mq4u9
         tP1Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=3UqsY9LHEYbZC3Cdb4Zg6VdTFGjPDR5kI/+iNxCKbaE=;
        b=DUcVLlCk7uF09UbAVv7o9xQayaw4gdn/t4ZhIpY/Dltr8LBLMp6/r7dtjK3D00t8M2
         RD5jG+i35qRcYuaHIJhVVPnUuAUTjGcipqTuL/Pul2p61Njyil82Q6YKaySLTIN5KKzr
         SIEPulhZKZ5t1U5UcMBYD9cIBxmgYgQIVNMTueSSE9E8Rt6YXA7TYSGzqxigEzEx0reU
         H7zM6qsfIfsUsmbmueJwaTJdvHFw/lvFYXDgiDb5L/SfV2FYoG5+2xS4ui5b8rGqSLsU
         0rhkUOU8pvGrzCfGee8OO4hVf7ch+31LPUnIbOp7jGkrg5quvXurA+EulTGKiQ3koVb+
         U9Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=3UqsY9LHEYbZC3Cdb4Zg6VdTFGjPDR5kI/+iNxCKbaE=;
        b=DN89S2w4K5LKYPaZDqzdGHPqBtGdRaJwPvtQ1eW1+E+usLYekSGNfjwIdI2SMUNMQt
         gmArgH8JvMxGgS0d1iPxLHYwB7T0dihEBdf6SUhAXZysi43YIv7AGFpcODRZIYUmUtms
         Ig6Iol918qw3XR3bIvjcVAquIDXkErkSS4cPbnhEHOxH44kiArzOm20IDvHlAtVhxJjZ
         HGs+BAs3hl1JrZhAZQVyu25I1sYUjaNArt/OcoCt/KgqfHclCp2vX+beFRauccegfQ0c
         D+huHCv/h3zdvXHUjzToy8NRM4zA+9UfTk1TpPtPD9MHR5CK0IVzfs6j81J6abcIA/0S
         41yA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PuauDdxCwsvfHhfJgDz3SRFzDS7SpjiiO4TnvKPdGn19Xy+5Lpje
	YSNNO7ShwnKO6zF0zyYIGRQ=
X-Google-Smtp-Source: APiQypIbo1fJVu7nI+PB2A6rRi+yO7pBjvYNr8chjTr06N9pGyl/sZHJ7S+E7lHz6Zbm5uALZwJW3g==
X-Received: by 2002:a05:6830:1290:: with SMTP id z16mr7161875otp.78.1589050742681;
        Sat, 09 May 2020 11:59:02 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:72d1:: with SMTP id d17ls1191788otk.0.gmail; Sat, 09 May
 2020 11:59:02 -0700 (PDT)
X-Received: by 2002:a9d:6d8e:: with SMTP id x14mr7130741otp.156.1589050741936;
        Sat, 09 May 2020 11:59:01 -0700 (PDT)
Date: Sat, 9 May 2020 11:59:01 -0700 (PDT)
From: Luigi De Simone <luigi.desimone3@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <db06189c-4bfc-4559-8052-9782f06d94e3@googlegroups.com>
In-Reply-To: <fc9db7b7-1804-d4ef-e37d-d5d8198c8278@web.de>
References: <e5934ccb-97ba-49f5-bf43-d47b2763f4b4@googlegroups.com>
 <fc9db7b7-1804-d4ef-e37d-d5d8198c8278@web.de>
Subject: Re: Problem with setup on Banana Pi BPI-M1 ARM board - jailhouse
 enable bananapi.cell crash
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_952_1634832213.1589050741305"
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

------=_Part_952_1634832213.1589050741305
Content-Type: multipart/alternative; 
	boundary="----=_Part_953_1013894369.1589050741307"

------=_Part_953_1013894369.1589050741307
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Jan for your time.
I've tried to go back to v0.9 Jailhouse and FreeRTOS cell commit=20
effb194d911971c6065e37bfeb8d49b12d4dd212 (more or less the same date of=20
Jailhouse)
The kernel version is still 4.3.3
Run these commands:

root@banana1 ~ # jailhouse enable jailhouse/configs/arm/bananapi.cell
root@banana1 ~ # jailhouse cell create=20
jailhouse/configs/arm/bananapi-freertos-demo.cell

The output:

Initializing Jailhouse hypervisor v0.9 (0-g1e780089-dirty) on CPU 0
Code location: 0xf0000040
Page pool usage after early setup: mem 54/16359, remap 32/131072
Initializing processors:
 CPU 0... OK
 CPU 1... OK
Initializing unit: irqchip
Initializing unit: PCI
Adding virtual PCI device 00:00.0 to cell "Banana-Pi"
Page pool usage after late setup: mem 57/16359, remap 37/131072
Activating hypervisor
[   36.540575] The Jailhouse is opening.
[   44.652929] CPU1: shutdown
Created cell "FreeRTOS"
Page pool usage after cell creation: mem 65/16359, remap 37/131072
[   44.664523] Created Jailhouse cell "FreeRTOS"
Unhandled data read at 0x1c2090c(4)
FATAL: unhandled trap (exception class 0x24)
pc=3D0xc02bbbc4 cpsr=3D0x600f0193 hsr=3D0x93840007
r0=3D0x400f0113 r1=3D0x00000111 r2=3D0x00000111 r3=3D0xdf89c90c
r4=3D0x00000001 r5=3D0x00000018 r6=3D0x0000010c r7=3D0xde3317bc
r8=3D0xde331790 r9=3D0x400f0113 r10=3D0x00000001 r11=3D0xc07e5d64
r12=3D0x00000000 r13=3D0xc07e5d38 r14=3D0xc02bbbb8
Parking CPU 0 (Cell: "Banana-Pi")


Is it possible to be some problem related to kernel *.config *?

Il giorno venerd=C3=AC 8 maggio 2020 20:45:40 UTC+2, Jan Kiszka ha scritto:
>
> On 08.05.20 19:19, Luigi De Simone wrote:=20
> > Hi all,=20
> >=20
> > I really need your help about finding out a solution with FreeRTOS=20
> > BananPI demo. My board model is BPI-M1=20
> > I've followed exactly the guide at=20
> >=20
> https://github.com/siemens/jailhouse/blob/master/Documentation/setup-on-b=
anana-pi-arm-board.md=20
> > with a kernel=20
> > Only one deviation is about command:=20
> >=20
> > |=20
> > cp -av ~/jailhouse/ci/jailhouse-config-banana-pi.h=20
> > ~/jailhouse/include/jailhouse/config.h=20
> > |=20
> >=20
> > because *jailhouse-config-banana-pi.h *does**not exist anymore in the=
=20
> > repo (I don't know if it is a refuse from refactoring).=20
> > What I've done is to create a config.h file like this:=20
> >=20
> > |=20
> > #defineCONFIG_TRACE_ERROR 1=20
> > #defineCONFIG_CRASH_CELL_ON_PANIC 1=20
> > #defineCONFIG_TEST_DEVICE 1=20
> > #defineCONFIG_ARM_GIC 1=20
> > #defineCONFIG_MACH_SUN7I 1=20
> > #defineCONFIG_SERIAL_8250_DW 1=20
> > |=20
> >=20
> > according to old *jailhouse-config-banana-pi.h *file.=20
>
> Most of these are nops by now, and the rest is not needed for a working=
=20
> setup.=20
>
> > Anyway, once booted the board and try to run command:=20
> > |=20
> > jailhouse enable jailhouse/configs/arm/bananapi.cell=20
> > |=20
> >=20
> > The board stall, and the output is:=20
> >=20
> > |=20
> > InitializingJailhousehypervisor v0.12(35-g2e4d71f6-dirty)on CPU 0=20
> > Codelocation:0xf0000040=20
> > Pagepool usage after early setup:mem 56/16359,remap 0/131072=20
> > Initializingprocessors:=20
> >   CPU 0...UnhandledHYP data abort exitat 0xf0005b10=20
> > r0:0x7c01b000 r1:0x7c00e000 r2:0x00001fff r3:0x00000000=20
> > r4:0x00001000 r5:0xf0010090 r6:0x7c00e000 r7:0x00000000=20
> > r8:0x7c0037a0 r9:0x7c000000 r10:0x00000000 r11:0x7c01b000=20
> > r12:0xc3ff7000 r13:0xf0003ce4=20
> > Physicaladdress:0x7c01b004HSR:0x94000007=20
> > StoppingCPU 0(Cell:"Banana-Pi")=20
> > |=20
> >=20
> > What is wrong?=20
>
> I didn't test on the BananaPi M1 for a longer while (and my board is out=
=20
> of reach the next days). We may have regressed with its configuration=20
> over refactorings in the past releases. You could try by rolling=20
> Jailhouse back to version around the time when the doc was once written,=
=20
> then bisect forward to find out the breaking change.=20
>
> Another option is jailhouse-images: We generate a known-to-work image=20
> for the OrangePi Zero, which is technically not that far away from the=20
> BananaPi. You could use that as baseline, adjusting bootloader and=20
> kernel config, and then try with recent Jailhouse again.=20
>
> Or you did into the fault above: "arm-linux-gnueabihf-objdump -dS=20
> hypervisor/hypervisor.o" gives the disassembly of the hypervisor core=20
> and could be matched with the faulting PC (0xf0005b10). That would be a=
=20
> first hint on what fails.=20
>
> Jan=20
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/db06189c-4bfc-4559-8052-9782f06d94e3%40googlegroups.com.

------=_Part_953_1013894369.1589050741307
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Jan for your time.<div>I&#39;ve tried to go back to=
 v0.9 Jailhouse and FreeRTOS cell commit=C2=A0<span style=3D"color: rgb(68,=
 77, 86); font-family: SFMono-Regular, Consolas, &quot;Liberation Mono&quot=
;, Menlo, monospace; font-size: 12px; text-align: right; white-space: nowra=
p;">effb194d911971c6065e37bfeb8d49b12d4dd212=C2=A0</span>(more or less the =
same date of Jailhouse)</div><div>The kernel version is still 4.3.3</div><d=
iv>Run these commands:</div><div><br></div><div><div class=3D"prettyprint" =
style=3D"background-color: rgb(250, 250, 250); border-color: rgb(187, 187, =
187); border-style: solid; border-width: 1px; overflow-wrap: break-word;"><=
code class=3D"prettyprint"><div class=3D"subprettyprint"><span style=3D"col=
or: #000;" class=3D"styled-by-prettify">root@banana1 </span><span style=3D"=
color: #660;" class=3D"styled-by-prettify">~</span><span style=3D"color: #0=
00;" class=3D"styled-by-prettify"> </span><span style=3D"color: #800;" clas=
s=3D"styled-by-prettify"># jailhouse enable jailhouse/configs/arm/bananapi.=
cell</span><span style=3D"color: #000;" class=3D"styled-by-prettify"><br>ro=
ot@banana1 </span><span style=3D"color: #660;" class=3D"styled-by-prettify"=
>~</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </span>=
<span style=3D"color: #800;" class=3D"styled-by-prettify"># jailhouse cell =
create jailhouse/configs/arm/bananapi-freertos-demo.cell</span></div></code=
></div><div><br></div></div><div>The output:</div><div><br></div><div><div =
class=3D"prettyprint" style=3D"background-color: rgb(250, 250, 250); border=
-color: rgb(187, 187, 187); border-style: solid; border-width: 1px; overflo=
w-wrap: break-word;"><code class=3D"prettyprint"><div class=3D"subprettypri=
nt"><span style=3D"color: #606;" class=3D"styled-by-prettify">Initializing<=
/span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><sp=
an style=3D"color: #606;" class=3D"styled-by-prettify">Jailhouse</span><spa=
n style=3D"color: #000;" class=3D"styled-by-prettify"> hypervisor v0</span>=
<span style=3D"color: #660;" class=3D"styled-by-prettify">.</span><span sty=
le=3D"color: #066;" class=3D"styled-by-prettify">9</span><span style=3D"col=
or: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #660;=
" class=3D"styled-by-prettify">(</span><span style=3D"color: #066;" class=
=3D"styled-by-prettify">0</span><span style=3D"color: #660;" class=3D"style=
d-by-prettify">-</span><span style=3D"color: #000;" class=3D"styled-by-pret=
tify">g1e780089</span><span style=3D"color: #660;" class=3D"styled-by-prett=
ify">-</span><span style=3D"color: #000;" class=3D"styled-by-prettify">dirt=
y</span><span style=3D"color: #660;" class=3D"styled-by-prettify">)</span><=
span style=3D"color: #000;" class=3D"styled-by-prettify"> on CPU </span><sp=
an style=3D"color: #066;" class=3D"styled-by-prettify">0</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"><br></span><span style=3D"co=
lor: #606;" class=3D"styled-by-prettify">Code</span><span style=3D"color: #=
000;" class=3D"styled-by-prettify"> location</span><span style=3D"color: #6=
60;" class=3D"styled-by-prettify">:</span><span style=3D"color: #000;" clas=
s=3D"styled-by-prettify"> </span><span style=3D"color: #066;" class=3D"styl=
ed-by-prettify">0xf0000040</span><span style=3D"color: #000;" class=3D"styl=
ed-by-prettify"><br></span><span style=3D"color: #606;" class=3D"styled-by-=
prettify">Page</span><span style=3D"color: #000;" class=3D"styled-by-pretti=
fy"> pool usage after early setup</span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">:</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify"> mem </span><span style=3D"color: #066;" class=3D"styled-by-=
prettify">54</span><span style=3D"color: #660;" class=3D"styled-by-prettify=
">/</span><span style=3D"color: #066;" class=3D"styled-by-prettify">16359</=
span><span style=3D"color: #660;" class=3D"styled-by-prettify">,</span><spa=
n style=3D"color: #000;" class=3D"styled-by-prettify"> remap </span><span s=
tyle=3D"color: #066;" class=3D"styled-by-prettify">32</span><span style=3D"=
color: #660;" class=3D"styled-by-prettify">/</span><span style=3D"color: #0=
66;" class=3D"styled-by-prettify">131072</span><span style=3D"color: #000;"=
 class=3D"styled-by-prettify"><br></span><span style=3D"color: #606;" class=
=3D"styled-by-prettify">Initializing</span><span style=3D"color: #000;" cla=
ss=3D"styled-by-prettify"> processors</span><span style=3D"color: #660;" cl=
ass=3D"styled-by-prettify">:</span><span style=3D"color: #000;" class=3D"st=
yled-by-prettify"><br>=C2=A0CPU </span><span style=3D"color: #066;" class=
=3D"styled-by-prettify">0.</span><span style=3D"color: #660;" class=3D"styl=
ed-by-prettify">..</span><span style=3D"color: #000;" class=3D"styled-by-pr=
ettify"> OK<br>=C2=A0CPU </span><span style=3D"color: #066;" class=3D"style=
d-by-prettify">1.</span><span style=3D"color: #660;" class=3D"styled-by-pre=
ttify">..</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =
OK<br></span><span style=3D"color: #606;" class=3D"styled-by-prettify">Init=
ializing</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> u=
nit</span><span style=3D"color: #660;" class=3D"styled-by-prettify">:</span=
><span style=3D"color: #000;" class=3D"styled-by-prettify"> irqchip<br></sp=
an><span style=3D"color: #606;" class=3D"styled-by-prettify">Initializing</=
span><span style=3D"color: #000;" class=3D"styled-by-prettify"> unit</span>=
<span style=3D"color: #660;" class=3D"styled-by-prettify">:</span><span sty=
le=3D"color: #000;" class=3D"styled-by-prettify"> PCI<br></span><span style=
=3D"color: #606;" class=3D"styled-by-prettify">Adding</span><span style=3D"=
color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #0=
08;" class=3D"styled-by-prettify">virtual</span><span style=3D"color: #000;=
" class=3D"styled-by-prettify"> PCI device </span><span style=3D"color: #06=
6;" class=3D"styled-by-prettify">00</span><span style=3D"color: #660;" clas=
s=3D"styled-by-prettify">:</span><span style=3D"color: #066;" class=3D"styl=
ed-by-prettify">00.0</span><span style=3D"color: #000;" class=3D"styled-by-=
prettify"> to cell </span><span style=3D"color: #080;" class=3D"styled-by-p=
rettify">&quot;Banana-Pi&quot;</span><span style=3D"color: #000;" class=3D"=
styled-by-prettify"><br></span><span style=3D"color: #606;" class=3D"styled=
-by-prettify">Page</span><span style=3D"color: #000;" class=3D"styled-by-pr=
ettify"> pool usage after late setup</span><span style=3D"color: #660;" cla=
ss=3D"styled-by-prettify">:</span><span style=3D"color: #000;" class=3D"sty=
led-by-prettify"> mem </span><span style=3D"color: #066;" class=3D"styled-b=
y-prettify">57</span><span style=3D"color: #660;" class=3D"styled-by-pretti=
fy">/</span><span style=3D"color: #066;" class=3D"styled-by-prettify">16359=
</span><span style=3D"color: #660;" class=3D"styled-by-prettify">,</span><s=
pan style=3D"color: #000;" class=3D"styled-by-prettify"> remap </span><span=
 style=3D"color: #066;" class=3D"styled-by-prettify">37</span><span style=
=3D"color: #660;" class=3D"styled-by-prettify">/</span><span style=3D"color=
: #066;" class=3D"styled-by-prettify">131072</span><span style=3D"color: #0=
00;" class=3D"styled-by-prettify"><br></span><span style=3D"color: #606;" c=
lass=3D"styled-by-prettify">Activating</span><span style=3D"color: #000;" c=
lass=3D"styled-by-prettify"> hypervisor<br></span><span style=3D"color: #66=
0;" class=3D"styled-by-prettify">[</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> =C2=A0 </span><span style=3D"color: #066;" class=
=3D"styled-by-prettify">36.540575</span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">]</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify"> </span><span style=3D"color: #606;" class=3D"styled-by-pret=
tify">The</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =
</span><span style=3D"color: #606;" class=3D"styled-by-prettify">Jailhouse<=
/span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><sp=
an style=3D"color: #008;" class=3D"styled-by-prettify">is</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"> opening</span><span style=
=3D"color: #660;" class=3D"styled-by-prettify">.</span><span style=3D"color=
: #000;" class=3D"styled-by-prettify"><br></span><span style=3D"color: #660=
;" class=3D"styled-by-prettify">[</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> =C2=A0 </span><span style=3D"color: #066;" class=
=3D"styled-by-prettify">44.652929</span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">]</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify"> CPU1</span><span style=3D"color: #660;" class=3D"styled-by-=
prettify">:</span><span style=3D"color: #000;" class=3D"styled-by-prettify"=
> shutdown<br></span><span style=3D"color: #606;" class=3D"styled-by-pretti=
fy">Created</span><span style=3D"color: #000;" class=3D"styled-by-prettify"=
> cell </span><span style=3D"color: #080;" class=3D"styled-by-prettify">&qu=
ot;FreeRTOS&quot;</span><span style=3D"color: #000;" class=3D"styled-by-pre=
ttify"><br></span><span style=3D"color: #606;" class=3D"styled-by-prettify"=
>Page</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> pool=
 usage after cell creation</span><span style=3D"color: #660;" class=3D"styl=
ed-by-prettify">:</span><span style=3D"color: #000;" class=3D"styled-by-pre=
ttify"> mem </span><span style=3D"color: #066;" class=3D"styled-by-prettify=
">65</span><span style=3D"color: #660;" class=3D"styled-by-prettify">/</spa=
n><span style=3D"color: #066;" class=3D"styled-by-prettify">16359</span><sp=
an style=3D"color: #660;" class=3D"styled-by-prettify">,</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"> remap </span><span style=3D=
"color: #066;" class=3D"styled-by-prettify">37</span><span style=3D"color: =
#660;" class=3D"styled-by-prettify">/</span><span style=3D"color: #066;" cl=
ass=3D"styled-by-prettify">131072</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"><br></span><span style=3D"color: #660;" class=3D"st=
yled-by-prettify">[</span><span style=3D"color: #000;" class=3D"styled-by-p=
rettify"> =C2=A0 </span><span style=3D"color: #066;" class=3D"styled-by-pre=
ttify">44.664523</span><span style=3D"color: #660;" class=3D"styled-by-pret=
tify">]</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </=
span><span style=3D"color: #606;" class=3D"styled-by-prettify">Created</spa=
n><span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span s=
tyle=3D"color: #606;" class=3D"styled-by-prettify">Jailhouse</span><span st=
yle=3D"color: #000;" class=3D"styled-by-prettify"> cell </span><span style=
=3D"color: #080;" class=3D"styled-by-prettify">&quot;FreeRTOS&quot;</span><=
span style=3D"color: #000;" class=3D"styled-by-prettify"><br></span><span s=
tyle=3D"color: #606;" class=3D"styled-by-prettify">Unhandled</span><span st=
yle=3D"color: #000;" class=3D"styled-by-prettify"> data read at </span><spa=
n style=3D"color: #066;" class=3D"styled-by-prettify">0x1c2090c</span><span=
 style=3D"color: #660;" class=3D"styled-by-prettify">(</span><span style=3D=
"color: #066;" class=3D"styled-by-prettify">4</span><span style=3D"color: #=
660;" class=3D"styled-by-prettify">)</span><span style=3D"color: #000;" cla=
ss=3D"styled-by-prettify"><br>FATAL</span><span style=3D"color: #660;" clas=
s=3D"styled-by-prettify">:</span><span style=3D"color: #000;" class=3D"styl=
ed-by-prettify"> unhandled trap </span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">(</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify">exception </span><span style=3D"color: #008;" class=3D"style=
d-by-prettify">class</span><span style=3D"color: #000;" class=3D"styled-by-=
prettify"> </span><span style=3D"color: #066;" class=3D"styled-by-prettify"=
>0x24</span><span style=3D"color: #660;" class=3D"styled-by-prettify">)</sp=
an><span style=3D"color: #000;" class=3D"styled-by-prettify"><br>pc</span><=
span style=3D"color: #660;" class=3D"styled-by-prettify">=3D</span><span st=
yle=3D"color: #066;" class=3D"styled-by-prettify">0xc02bbbc4</span><span st=
yle=3D"color: #000;" class=3D"styled-by-prettify"> cpsr</span><span style=
=3D"color: #660;" class=3D"styled-by-prettify">=3D</span><span style=3D"col=
or: #066;" class=3D"styled-by-prettify">0x600f0193</span><span style=3D"col=
or: #000;" class=3D"styled-by-prettify"> hsr</span><span style=3D"color: #6=
60;" class=3D"styled-by-prettify">=3D</span><span style=3D"color: #066;" cl=
ass=3D"styled-by-prettify">0x93840007</span><span style=3D"color: #000;" cl=
ass=3D"styled-by-prettify"><br>r0</span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">=3D</span><span style=3D"color: #066;" class=3D"sty=
led-by-prettify">0x400f0113</span><span style=3D"color: #000;" class=3D"sty=
led-by-prettify"> r1</span><span style=3D"color: #660;" class=3D"styled-by-=
prettify">=3D</span><span style=3D"color: #066;" class=3D"styled-by-prettif=
y">0x00000111</span><span style=3D"color: #000;" class=3D"styled-by-prettif=
y"> r2</span><span style=3D"color: #660;" class=3D"styled-by-prettify">=3D<=
/span><span style=3D"color: #066;" class=3D"styled-by-prettify">0x00000111<=
/span><span style=3D"color: #000;" class=3D"styled-by-prettify"> r3</span><=
span style=3D"color: #660;" class=3D"styled-by-prettify">=3D</span><span st=
yle=3D"color: #066;" class=3D"styled-by-prettify">0xdf89c90c</span><span st=
yle=3D"color: #000;" class=3D"styled-by-prettify"><br>r4</span><span style=
=3D"color: #660;" class=3D"styled-by-prettify">=3D</span><span style=3D"col=
or: #066;" class=3D"styled-by-prettify">0x00000001</span><span style=3D"col=
or: #000;" class=3D"styled-by-prettify"> r5</span><span style=3D"color: #66=
0;" class=3D"styled-by-prettify">=3D</span><span style=3D"color: #066;" cla=
ss=3D"styled-by-prettify">0x00000018</span><span style=3D"color: #000;" cla=
ss=3D"styled-by-prettify"> r6</span><span style=3D"color: #660;" class=3D"s=
tyled-by-prettify">=3D</span><span style=3D"color: #066;" class=3D"styled-b=
y-prettify">0x0000010c</span><span style=3D"color: #000;" class=3D"styled-b=
y-prettify"> r7</span><span style=3D"color: #660;" class=3D"styled-by-prett=
ify">=3D</span><span style=3D"color: #066;" class=3D"styled-by-prettify">0x=
de3317bc</span><span style=3D"color: #000;" class=3D"styled-by-prettify"><b=
r>r8</span><span style=3D"color: #660;" class=3D"styled-by-prettify">=3D</s=
pan><span style=3D"color: #066;" class=3D"styled-by-prettify">0xde331790</s=
pan><span style=3D"color: #000;" class=3D"styled-by-prettify"> r9</span><sp=
an style=3D"color: #660;" class=3D"styled-by-prettify">=3D</span><span styl=
e=3D"color: #066;" class=3D"styled-by-prettify">0x400f0113</span><span styl=
e=3D"color: #000;" class=3D"styled-by-prettify"> r10</span><span style=3D"c=
olor: #660;" class=3D"styled-by-prettify">=3D</span><span style=3D"color: #=
066;" class=3D"styled-by-prettify">0x00000001</span><span style=3D"color: #=
000;" class=3D"styled-by-prettify"> r11</span><span style=3D"color: #660;" =
class=3D"styled-by-prettify">=3D</span><span style=3D"color: #066;" class=
=3D"styled-by-prettify">0xc07e5d64</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"><br>r12</span><span style=3D"color: #660;" class=3D=
"styled-by-prettify">=3D</span><span style=3D"color: #066;" class=3D"styled=
-by-prettify">0x00000000</span><span style=3D"color: #000;" class=3D"styled=
-by-prettify"> r13</span><span style=3D"color: #660;" class=3D"styled-by-pr=
ettify">=3D</span><span style=3D"color: #066;" class=3D"styled-by-prettify"=
>0xc07e5d38</span><span style=3D"color: #000;" class=3D"styled-by-prettify"=
> r14</span><span style=3D"color: #660;" class=3D"styled-by-prettify">=3D</=
span><span style=3D"color: #066;" class=3D"styled-by-prettify">0xc02bbbb8</=
span><span style=3D"color: #000;" class=3D"styled-by-prettify"><br></span><=
span style=3D"color: #606;" class=3D"styled-by-prettify">Parking</span><spa=
n style=3D"color: #000;" class=3D"styled-by-prettify"> CPU </span><span sty=
le=3D"color: #066;" class=3D"styled-by-prettify">0</span><span style=3D"col=
or: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #660;=
" class=3D"styled-by-prettify">(</span><span style=3D"color: #606;" class=
=3D"styled-by-prettify">Cell</span><span style=3D"color: #660;" class=3D"st=
yled-by-prettify">:</span><span style=3D"color: #000;" class=3D"styled-by-p=
rettify"> </span><span style=3D"color: #080;" class=3D"styled-by-prettify">=
&quot;Banana-Pi&quot;</span><span style=3D"color: #660;" class=3D"styled-by=
-prettify">)</span><span style=3D"color: #000;" class=3D"styled-by-prettify=
"><br><br></span></div></code></div><div><br>Is it possible to be some prob=
lem related to kernel <b>.config </b>?</div><br>Il giorno venerd=C3=AC 8 ma=
ggio 2020 20:45:40 UTC+2, Jan Kiszka ha scritto:<blockquote class=3D"gmail_=
quote" style=3D"margin: 0;margin-left: 0.8ex;border-left: 1px #ccc solid;pa=
dding-left: 1ex;">On 08.05.20 19:19, Luigi De Simone wrote:
<br>&gt; Hi all,
<br>&gt;
<br>&gt; I really need your help about finding out a solution with FreeRTOS
<br>&gt; BananPI demo. My board model is BPI-M1
<br>&gt; I&#39;ve followed exactly the guide at
<br>&gt; <a href=3D"https://github.com/siemens/jailhouse/blob/master/Docume=
ntation/setup-on-banana-pi-arm-board.md" target=3D"_blank" rel=3D"nofollow"=
 onmousedown=3D"this.href=3D&#39;https://www.google.com/url?q\x3dhttps%3A%2=
F%2Fgithub.com%2Fsiemens%2Fjailhouse%2Fblob%2Fmaster%2FDocumentation%2Fsetu=
p-on-banana-pi-arm-board.md\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNGULV_Cq=
rPPMdaPhtP4F2_y2_koxQ&#39;;return true;" onclick=3D"this.href=3D&#39;https:=
//www.google.com/url?q\x3dhttps%3A%2F%2Fgithub.com%2Fsiemens%2Fjailhouse%2F=
blob%2Fmaster%2FDocumentation%2Fsetup-on-banana-pi-arm-board.md\x26sa\x3dD\=
x26sntz\x3d1\x26usg\x3dAFQjCNGULV_CqrPPMdaPhtP4F2_y2_koxQ&#39;;return true;=
">https://github.com/siemens/<wbr>jailhouse/blob/master/<wbr>Documentation/=
setup-on-banana-<wbr>pi-arm-board.md</a>
<br>&gt; with a kernel
<br>&gt; Only one deviation is about command:
<br>&gt;
<br>&gt; |
<br>&gt; cp -av ~/jailhouse/ci/jailhouse-<wbr>config-banana-pi.h
<br>&gt; ~/jailhouse/include/jailhouse/<wbr>config.h
<br>&gt; |
<br>&gt;
<br>&gt; because *jailhouse-config-banana-pi.h *does**not exist anymore in =
the
<br>&gt; repo (I don&#39;t know if it is a refuse from refactoring).
<br>&gt; What I&#39;ve done is to create a config.h file like this:
<br>&gt;
<br>&gt; |
<br>&gt; #defineCONFIG_TRACE_ERROR 1
<br>&gt; #defineCONFIG_CRASH_CELL_ON_<wbr>PANIC 1
<br>&gt; #defineCONFIG_TEST_DEVICE 1
<br>&gt; #defineCONFIG_ARM_GIC 1
<br>&gt; #defineCONFIG_MACH_SUN7I 1
<br>&gt; #defineCONFIG_SERIAL_8250_DW 1
<br>&gt; |
<br>&gt;
<br>&gt; according to old *jailhouse-config-banana-pi.h *file.
<br>
<br>Most of these are nops by now, and the rest is not needed for a working
<br>setup.
<br>
<br>&gt; Anyway, once booted the board and try to run command:
<br>&gt; |
<br>&gt; jailhouse enable jailhouse/configs/arm/<wbr>bananapi.cell
<br>&gt; |
<br>&gt;
<br>&gt; The board stall, and the output is:
<br>&gt;
<br>&gt; |
<br>&gt; InitializingJailhousehyperviso<wbr>r v0.12(35-g2e4d71f6-dirty)on C=
PU 0
<br>&gt; Codelocation:0xf0000040
<br>&gt; Pagepool usage after early setup:mem 56/16359,remap 0/131072
<br>&gt; Initializingprocessors:
<br>&gt; =C2=A0=C2=A0CPU 0...UnhandledHYP data abort exitat 0xf0005b10
<br>&gt; r0:0x7c01b000=C2=A0r1:0x7c00e000=C2=A0<wbr>r2:0x00001fff=C2=A0r3:0=
x00000000
<br>&gt; r4:0x00001000=C2=A0r5:0xf0010090=C2=A0<wbr>r6:0x7c00e000=C2=A0r7:0=
x00000000
<br>&gt; r8:0x7c0037a0=C2=A0r9:0x7c000000=C2=A0<wbr>r10:0x00000000=C2=A0r11=
:0x7c01b000
<br>&gt; r12:0xc3ff7000=C2=A0r13:0xf0003ce4
<br>&gt; Physicaladdress:0x7c01b004HSR:<wbr>0x94000007
<br>&gt; StoppingCPU 0(Cell:&quot;Banana-Pi&quot;)
<br>&gt; |
<br>&gt;
<br>&gt; What is wrong?
<br>
<br>I didn&#39;t test on the BananaPi M1 for a longer while (and my board i=
s out
<br>of reach the next days). We may have regressed with its configuration
<br>over refactorings in the past releases. You could try by rolling
<br>Jailhouse back to version around the time when the doc was once written=
,
<br>then bisect forward to find out the breaking change.
<br>
<br>Another option is jailhouse-images: We generate a known-to-work image
<br>for the OrangePi Zero, which is technically not that far away from the
<br>BananaPi. You could use that as baseline, adjusting bootloader and
<br>kernel config, and then try with recent Jailhouse again.
<br>
<br>Or you did into the fault above: &quot;arm-linux-gnueabihf-objdump -dS
<br>hypervisor/hypervisor.o&quot; gives the disassembly of the hypervisor c=
ore
<br>and could be matched with the faulting PC (0xf0005b10). That would be a
<br>first hint on what fails.
<br>
<br>Jan
<br></blockquote></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/db06189c-4bfc-4559-8052-9782f06d94e3%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/db06189c-4bfc-4559-8052-9782f06d94e3%40googlegroups.com<=
/a>.<br />

------=_Part_953_1013894369.1589050741307--

------=_Part_952_1634832213.1589050741305--
