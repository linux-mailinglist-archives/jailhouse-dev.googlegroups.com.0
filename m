Return-Path: <jailhouse-dev+bncBCZKRDGF7APRBO5H574QKGQEALMEVBQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pj1-x1037.google.com (mail-pj1-x1037.google.com [IPv6:2607:f8b0:4864:20::1037])
	by mail.lfdr.de (Postfix) with ESMTPS id E25F22485B4
	for <lists+jailhouse-dev@lfdr.de>; Tue, 18 Aug 2020 15:12:29 +0200 (CEST)
Received: by mail-pj1-x1037.google.com with SMTP id l22sf12388622pjt.8
        for <lists+jailhouse-dev@lfdr.de>; Tue, 18 Aug 2020 06:12:29 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597756348; cv=pass;
        d=google.com; s=arc-20160816;
        b=magJapgWt+5URYrRDAp91N6TGzrWyJSZzwkFMYcg3Yzl6uBHKnnj3dHSAlu7xUEryb
         WoS55bMyN3vr6/m/p1dFt82aGopE5oG3hoe+FYknSSqi2e00ShCebDWDJj+Ek3DHLxYh
         sTt12+F5mcm/lfexhu6JjMQqXhlELBhamVaJKQgyorvCiOboupQRgfnHApg7SJDaWS3x
         blgNlvCbHXRWZFmdgBy6XaFhumueBS4YIgWM8Rz2fsn86fUL3PukL+TmDhtxe/kaN0PQ
         yMjFq92ifLKhnKiU0tk79iXLpMuy7TylbJQPq4aXeaxReAChUuXyYi/q2cMgWixh9Gs6
         NRnQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature;
        bh=H4f73CW4jXogSge/oInPMoZJfg41zfYwTpeRXnr7F44=;
        b=TcLV0SM/agUp/LrSPeLjCF3wCKqWnPN5sy5icobB4DR4alAP7FZidFDOyImLfbFy+o
         SugiLQ9PALinStS19jUNhQkH6f9L29F59bbnCU5SBHc7Bh4g6/sfTCjnxWaU6v972j/N
         wGZ4BXsDdnrkvffQ+DeZ5yp/EfU1WE63xvoEZ5G1PN3zpMv77UW/EMi/NIg+TGExVa5z
         Fbmu13n+/VkV7Fz3wAVHqXJlzSTqY8eoYddsutdemhjGa/ytp5vvUW0AmYZr9imNKKBs
         zJH+7rz35WaZ49LipWIt7rxKTPleuCZFSOl2sOs4oCB3apmtNY2AT8y4MWt/WSo1Ok//
         F7Gw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@luzny-cz.20150623.gappssmtp.com header.s=20150623 header.b=jngExWTC;
       spf=neutral (google.com: 2607:f8b0:4864:20::244 is neither permitted nor denied by best guess record for domain of jakub@luzny.cz) smtp.mailfrom=jakub@luzny.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=H4f73CW4jXogSge/oInPMoZJfg41zfYwTpeRXnr7F44=;
        b=JssraQoAV2n1Q8sOpiR6up7JhnuXFPT6gvAGBu00TAnshtGnQNQrXulLWavayQFLzU
         1Vm429IL0bz4s/fdfrlO68x7FzNEnGPJTGCewo/PzNfnv9w/mV+j8V4jVie3CmEckSUO
         ANNC5d20g828T3gaXusk2wtLUg0xObftA8nrwOUCvgZ2l8gEcmpHz9+tUqst4NKDKJBN
         ELvBnaZkv9LG4FWcpeLSg7rT1jQvtcsBsJa6IvjG73XAx+OERarVkeT0c6bh/KTTV06B
         bnZcMP99YJMgb8TBHeeRU2pQlQpBMaUm92BUN69bXJwwtnH6c28ooymRwFU57KAipEOQ
         fsZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=H4f73CW4jXogSge/oInPMoZJfg41zfYwTpeRXnr7F44=;
        b=KMCYfoeNxZmymI2aP2j0g7yhkpVk2qqCY9GSU9MZo7dEaLn8ty3uvbIBEKHOrU0Qy+
         A5bznqbiDmj6Tk0atCmyv1mTmBm4xOLklAInDcbrHmElxXKZyX/cqwYgZblSTq899tDX
         xCQVvFbodwj1OWTshZZJaZiCZQrnAs0VJuWYETkKN5RgyV2ax6ImL3kdzGesMigbBx0n
         4xxrp4pCmiG9eTS72Z8cKBO1EMmCbRnTccA9LIiQap2af7d2dtQd2rcQlShWQXhDgYrT
         qQahEr+xQDzog1nCasxoSt7+w4KMYdTKpmotUBBgMRpWQM6WT000QtsT42msudC2094O
         2Y8Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531poGWtpQeMUHC71eJ/w3y8oHvX2bLzdoTFiMdstnozjB+Q0T7H
	U7WX50tTOOQHkjkRaiLZo7Y=
X-Google-Smtp-Source: ABdhPJx4B9OWxG/P+/AE6IPVMiThD1x1fYY+l2sBy1d4b6Aa5zxNIFzrE6ugerUgmja1EHXTMEvY2w==
X-Received: by 2002:a63:501f:: with SMTP id e31mr6021791pgb.389.1597756348330;
        Tue, 18 Aug 2020 06:12:28 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a62:2c11:: with SMTP id s17ls7107180pfs.9.gmail; Tue, 18 Aug
 2020 06:12:27 -0700 (PDT)
X-Received: by 2002:a65:58cf:: with SMTP id e15mr13460824pgu.59.1597756347334;
        Tue, 18 Aug 2020 06:12:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597756347; cv=none;
        d=google.com; s=arc-20160816;
        b=N/Yxe5sPmTKS6YzgBW7ztqzKx1DPllbhydbbmjrSSHHQDpUqyGnJLOuf1BjGTXHsx9
         Znf5I23G+WhVM6P/1Zpp+Z9FiyC514Bp6t1VmGA3LBTjsxb7aNpMuXg6PrmHioCJp+KR
         +mONlhRNfFzpyhvYq9PoJTak2PFgWwSvUZDcRU9EwUJA/HQH2hwSHRPRsiL5gL4BImbP
         PuMU8Ipz0MwGOp5zdLS5vgxHecpsJF6D/r8R5b4MSoq5RCLeU7dcyKOWcR8e/nuBWwnd
         4PZjLWgJw94CPANA5zKjJzP9Wu/xtia9JM7c5/Vg8dYvbLI+Oox9DB5G78oecYBLMHL9
         0PRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=ZGAYWFHi/FawJZiSpHDXTylXNIn+TXTT/+MEkbrphdw=;
        b=RGHMGGLdFgrvbU+Tkj6IHZXfvTZ48B0TiI9xNX71zK4sxXfl+c4DUTWTuwOjDwx1Vw
         2HIsuUS42tjy2oOb7Q+cHufgbaCP1MomLVpRoqK0G16zRvjrwN0mruqbhGOTTSOAYyR9
         QAdEZWBF3Lseo5T4buK5kFS0vKmg/+J9pZJ5qMHvwpfocSoXc11AjhdVJk6qivyH7iPq
         MAkpHJaa70481PaiilkirLsNdxDH1vKZY/7/4s0f+JR9SfoJ9EudDldEVJe6wSKDvamb
         iJ86muCiUhLcjmwOOcWoDP3kZeX2gTBj9l6AzZxZiMJUqwzVtJFSKwIjdE22W2y/SWcw
         UWfQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@luzny-cz.20150623.gappssmtp.com header.s=20150623 header.b=jngExWTC;
       spf=neutral (google.com: 2607:f8b0:4864:20::244 is neither permitted nor denied by best guess record for domain of jakub@luzny.cz) smtp.mailfrom=jakub@luzny.cz
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com. [2607:f8b0:4864:20::244])
        by gmr-mx.google.com with ESMTPS id n3si141386pjb.3.2020.08.18.06.12.27
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2020 06:12:27 -0700 (PDT)
Received-SPF: neutral (google.com: 2607:f8b0:4864:20::244 is neither permitted nor denied by best guess record for domain of jakub@luzny.cz) client-ip=2607:f8b0:4864:20::244;
Received: by mail-oi1-x244.google.com with SMTP id v13so17822696oiv.13
        for <jailhouse-dev@googlegroups.com>; Tue, 18 Aug 2020 06:12:27 -0700 (PDT)
X-Received: by 2002:aca:ab87:: with SMTP id u129mr12979600oie.128.1597756346488;
 Tue, 18 Aug 2020 06:12:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200817171736.78100-1-jakub@luzny.cz> <57c67012-fee7-d7f1-1201-25415e39034a@siemens.com>
In-Reply-To: <57c67012-fee7-d7f1-1201-25415e39034a@siemens.com>
From: =?UTF-8?B?SmFrdWIgTHXFvm7DvQ==?= <jakub@luzny.cz>
Date: Tue, 18 Aug 2020 15:12:15 +0200
Message-ID: <CAGdCPwtX9JoP_RocDeB-MF3XTz+yyrXYL2LBCOs_-xa_TVA6Ug@mail.gmail.com>
Subject: Re: [PATCH] configs: arm64: Add support for RPi4 with more than 1G of memory
To: jailhouse-dev@googlegroups.com
Content-Type: multipart/alternative; boundary="00000000000078724705ad26a365"
X-Original-Sender: jakub@luzny.cz
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@luzny-cz.20150623.gappssmtp.com header.s=20150623
 header.b=jngExWTC;       spf=neutral (google.com: 2607:f8b0:4864:20::244 is
 neither permitted nor denied by best guess record for domain of
 jakub@luzny.cz) smtp.mailfrom=jakub@luzny.cz
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

--00000000000078724705ad26a365
Content-Type: text/plain; charset="UTF-8"

>
> > - * Test configuration for Raspberry Pi 4 (32-bit, quad-core Cortex-A72,
> 1GB RAM)
> > + * Test configuration for Raspberry Pi 4 (32-bit, quad-core Cortex-A72,
> 1GB, 2GB, 4GB or 8GB RAM)
>
> Not sure anymore what I meant with "32-bit", that can be removed.
>

Alright, I was wondering what that means.

>   *
> >   * Copyright (c) Siemens AG, 2020
> >   *
> > @@ -10,6 +10,9 @@
> >   *
> >   * This work is licensed under the terms of the GNU GPL, version 2.  See
> >   * the COPYING file in the top-level directory.
> > + *
> > + * Reservation via device tree: reg = <0x0 0x20000000 0x10000000>;
> > + *                              reg = <0x0 0xe0000000 0x200000>;
>
> Why this split-up into two regions?
>
> This will also mean I need to add a patch to [1] so that the DT will
> carry the carve out. And drop the mem= from [2]. Or can we rearrange the
> reservation to keep that mem= cut-off, at the price of wasting memory on
> larger RPi variants?
>

It's because the PCI MMIO address space is mapped to 0xe0000000 in the
original configuration. I don't know where this address comes from, but
I've had some issues then I moved it somewhere else. I would like it most
if it would be above all the available memory, but I was getting errors
when i tried to do so:

[  154.161182] pci-host-generic 200000000.pci: host bridge /pci@0 ranges:
[  154.161231] pci-host-generic 200000000.pci:   MEM
0x200100000..0x200103fff -> 0x200100000
[  154.161354] pci-host-generic 200000000.pci: ECAM at [mem
0x200000000-0x2000fffff] for [bus 00]
[  154.161525] pci-host-generic 200000000.pci: PCI host bridge to bus
0001:00
[  154.161540] pci_bus 0001:00: root bus resource [bus 00]
[  154.161553] pci_bus 0001:00: root bus resource [mem
0x200100000-0x200103fff]
[  154.161620] pci 0001:00:00.0: [110a:4106] type 00 class 0xff0000
[  154.161718] pci 0001:00:00.0: reg 0x10: [mem 0x00000000-0x00000fff]
[  154.162420] pci 0001:00:01.0: [110a:4106] type 00 class 0xff0001
[  154.162523] pci 0001:00:01.0: reg 0x10: [mem 0x00000000-0x00000fff]
[  154.166228] pci 0001:00:00.0: BAR 0: no space for [mem size 0x00001000]
[  154.166246] pci 0001:00:00.0: BAR 0: failed to assign [mem size
0x00001000]
[  154.166259] pci 0001:00:01.0: BAR 0: no space for [mem size 0x00001000]
[  154.166270] pci 0001:00:01.0: BAR 0: failed to assign [mem size
0x00001000]

So it seems that only 32-bit addresses are supported. When I tried to move
it somewhere to the reserved space (e.g. to 0x20000000), I was getting
crashes when enabling Jailhouse. So I stuck to the original address.

Currently, as it is, with the mem= limitation, it works also on the 2G and
4G variants. 8G doesn't even boot because the RPi firmware is too old (it
boots with the next branch of jailhouse-images). But the purpose of this
patch is to enable use of all the available memory (maybe I should specify
that better?).

For reserving the memory, I have a device tree overlay that can be used to
do so. It has configurable offset and size, so it can be used multiple
times from config.txt to reserve multiple memory regions. I tried to
integrate that into jailhouse-images, but currently the precompiled DT
overlays coming with RPi firmware are used, not the ones getting built with
the kernel, so I would need to change that first.

Jakub

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAGdCPwtX9JoP_RocDeB-MF3XTz%2ByyrXYL2LBCOs_-xa_TVA6Ug%40mail.gmail.com.

--00000000000078724705ad26a365
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><span class=3D"gmail-im" style=
=3D"color:rgb(80,0,80)"><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">&=
gt; - * Test configuration for Raspberry Pi 4 (32-bit, quad-core Cortex-A72=
, 1GB RAM)<br>&gt; + * Test configuration for Raspberry Pi 4 (32-bit, quad-=
core Cortex-A72, 1GB, 2GB, 4GB or 8GB RAM)<br><br>Not sure anymore what I m=
eant with &quot;32-bit&quot;, that can be removed.<br></blockquote><div>=C2=
=A0</div></span><div>Alright, I was wondering what that means.<br><br></div=
><span class=3D"gmail-im" style=3D"color:rgb(80,0,80)"><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">&gt;=C2=A0 =C2=A0*<br>&gt;=C2=A0 =C2=A0* Copy=
right (c) Siemens AG, 2020<br>&gt;=C2=A0 =C2=A0*<br>&gt; @@ -10,6 +10,9 @@<=
br>&gt;=C2=A0 =C2=A0*<br>&gt;=C2=A0 =C2=A0* This work is licensed under the=
 terms of the GNU GPL, version 2.=C2=A0 See<br>&gt;=C2=A0 =C2=A0* the COPYI=
NG file in the top-level directory.<br>&gt; + *<br>&gt; + * Reservation via=
 device tree: reg =3D &lt;0x0 0x20000000 0x10000000&gt;;<br>&gt; + *=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0x0 0xe0000000 0x200000&gt;;<br><br>Wh=
y this split-up into two regions?<br><br>This will also mean I need to add =
a patch to [1] so that the DT will<br>carry the carve out. And drop the mem=
=3D from [2]. Or can we rearrange the<br>reservation to keep that mem=3D cu=
t-off, at the price of wasting memory on<br>larger RPi variants?<br></block=
quote><div><br></div></span><div>It&#39;s because the PCI MMIO address spac=
e is mapped to=C2=A00xe0000000 in the original configuration. I don&#39;t k=
now where this address comes from, but I&#39;ve had some issues then I move=
d it somewhere else. I would like it most if it would be above all the avai=
lable memory, but I was getting errors when i tried to do so:<br><br>[ =C2=
=A0154.161182] pci-host-generic 200000000.pci: host bridge /pci@0 ranges:<b=
r>[ =C2=A0154.161231] pci-host-generic 200000000.pci: =C2=A0 MEM 0x20010000=
0..0x200103fff -&gt; 0x200100000<br>[ =C2=A0154.161354] pci-host-generic 20=
0000000.pci: ECAM at [mem 0x200000000-0x2000fffff] for [bus 00]<br>[ =C2=A0=
154.161525] pci-host-generic 200000000.pci: PCI host bridge to bus 0001:00<=
br>[ =C2=A0154.161540] pci_bus 0001:00: root bus resource [bus 00]<br>[ =C2=
=A0154.161553] pci_bus 0001:00: root bus resource [mem 0x200100000-0x200103=
fff]<br>[ =C2=A0154.161620] pci 0001:00:00.0: [110a:4106] type 00 class 0xf=
f0000<br>[ =C2=A0154.161718] pci 0001:00:00.0: reg 0x10: [mem 0x00000000-0x=
00000fff]<br>[ =C2=A0154.162420] pci 0001:00:01.0: [110a:4106] type 00 clas=
s 0xff0001<br>[ =C2=A0154.162523] pci 0001:00:01.0: reg 0x10: [mem 0x000000=
00-0x00000fff]<br>[ =C2=A0154.166228] pci 0001:00:00.0: BAR 0: no space for=
 [mem size 0x00001000]<br>[ =C2=A0154.166246] pci 0001:00:00.0: BAR 0: fail=
ed to assign [mem size 0x00001000]<br>[ =C2=A0154.166259] pci 0001:00:01.0:=
 BAR 0: no space for [mem size 0x00001000]<br>[ =C2=A0154.166270] pci 0001:=
00:01.0: BAR 0: failed to assign [mem size 0x00001000]<br><br>So it seems t=
hat only 32-bit addresses are supported. When I tried to move it somewhere =
to the reserved space (e.g. to 0x20000000), I was getting crashes when enab=
ling Jailhouse. So I stuck to the original address.</div></div><br clear=3D=
"all"><div>Currently, as it is, with the mem=3D limitation, it works also o=
n the 2G and 4G variants. 8G doesn&#39;t even boot because the RPi firmware=
 is too old (it boots with the next branch of jailhouse-images). But the pu=
rpose of this patch is to enable use of all the available memory (maybe I s=
hould specify that better?).<br><br>For reserving the memory, I have a devi=
ce tree overlay that can be used to do so. It has configurable offset and s=
ize, so it can be used multiple times from config.txt to reserve multiple m=
emory regions. I tried to integrate that into jailhouse-images, but current=
ly the precompiled DT overlays coming with RPi firmware are used, not the o=
nes getting built with the kernel, so I would need to change that first.</d=
iv><font color=3D"#888888"><br>Jakub</font></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAGdCPwtX9JoP_RocDeB-MF3XTz%2ByyrXYL2LBCOs_-xa_TVA=
6Ug%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups=
.google.com/d/msgid/jailhouse-dev/CAGdCPwtX9JoP_RocDeB-MF3XTz%2ByyrXYL2LBCO=
s_-xa_TVA6Ug%40mail.gmail.com</a>.<br />

--00000000000078724705ad26a365--
