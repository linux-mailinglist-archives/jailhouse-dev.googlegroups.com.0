Return-Path: <jailhouse-dev+bncBC2PTC4R4MNBBIPYU3WAKGQE75BWK4I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33e.google.com (mail-ot1-x33e.google.com [IPv6:2607:f8b0:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C6BBC202
	for <lists+jailhouse-dev@lfdr.de>; Tue, 24 Sep 2019 08:48:03 +0200 (CEST)
Received: by mail-ot1-x33e.google.com with SMTP id l25sf609219otp.10
        for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Sep 2019 23:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=RdORBgdPvcq2U6v/gpg0I8vqU2vJvxQYidUYxiKH+Ag=;
        b=McsE5ay7eb8HP2GHTiSVpsJqBWq72ERm040uwSfY2hncgXAdKSrKVNLFKXte3copcR
         RUfa5ODZvUoBeqwwiWbmehcu1/jWeriRMRRKBosLJLiBW1zRLGDLYesuWm3KEakNrB0M
         BPK9GBywPbuxaY3+RTFzUie/KWksGku1vo+qCeAnRdbF1BsOmaX6iDiG+IjMZCaIJRV8
         KxXlqMlUV70fpUlsIrPis1ECmjPauuNGGoHNJV8dF83lmkKgqyGrNXHw3UjDGJn4DCA7
         LAE1n62sqZvD4UYXVCB925ol7eiLAwWCCDp/z+Squ4XDne4PKJWZYI0gRJUpjpn49dnx
         gUVQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=RdORBgdPvcq2U6v/gpg0I8vqU2vJvxQYidUYxiKH+Ag=;
        b=ayNxSh+dxJ6cRTc/o0Ld2zcToouXrHSbKsYFCOa7SrmmjJKl7siJbgkUwXgAdM23N6
         ILuuJdRdD2gvIuduzVJI63y1Ud3DisiOXWefsgF5O9FkgKL4QcR7FFygECJeq1ARQe8H
         ov8mRXKSEn8kDiIfsrAQFJy+eMyZCZFUvJqjhf29sRLTYCT9WSgKBWy4fSKpAlGW4BK8
         4JQut8svGhjobJ/rlXIVJ8rlVJDh8jXFw0cngC4nHfMy4gcEJNrmB1EhbGOJiWWCbcNE
         NX/WofKPzxGvvytdmP2DCfNbZ0h88G9t+xKI2ttOdv8KTMcB4PooJ9qRxmRugfHRqhx0
         0/eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=RdORBgdPvcq2U6v/gpg0I8vqU2vJvxQYidUYxiKH+Ag=;
        b=tqj/Fvuhm56YsTxhMeeY2d9TBc1GGjZ5ZnCDPOr6Ka4nTYtjXZc1+b19q6+l8ymPkP
         MRFII5Y4NOC3UiL+tP/0LUWQ0u9M4oGSL6kjq+iSQ7aB9Yy8Vcw/b5YnZ6dNyhuPZLxH
         03EuFA4Zg08+z+NBtEn1DGmPFApLl9XO3UsR6OqnI6l9Z/wC8NbgRRYMs70nTVWbfFnh
         xlMCcvs08im/niwEIdrenEkRimyZz4199kKI+SVMrwWnbpaGOXrawmh9PIxsQN4vmJut
         d+7ERkLsccuTc8tHPKMQEz1C2e7T/49duX4YPLfb8qLf4K2sH5XpEVmTbwPIB2IH5hav
         X1Jg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXE96SKaEL+KuxFc9K+Jdy70o/Rm6bmtmexmP5APBR3phDyqP1O
	oZVpKqDi/XAcFoTMFOG4+1U=
X-Google-Smtp-Source: APXvYqzYKtHa5IVrkvkrywlMkiUCBSlkwI5NPO6XCVb7T++3gwbwUtTiatOn/oEFSyUI0v6Y8G/3Qw==
X-Received: by 2002:a9d:6405:: with SMTP id h5mr623537otl.115.1569307682194;
        Mon, 23 Sep 2019 23:48:02 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:688:: with SMTP id 8ls182502otx.9.gmail; Mon, 23 Sep
 2019 23:48:01 -0700 (PDT)
X-Received: by 2002:a05:6830:4a5:: with SMTP id l5mr638904otd.150.1569307681581;
        Mon, 23 Sep 2019 23:48:01 -0700 (PDT)
Date: Mon, 23 Sep 2019 23:48:00 -0700 (PDT)
From: Chung-Fan Yang <sonic.tw.tp@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <8a0921f1-11ce-4231-a9ec-c115a059cfee@googlegroups.com>
In-Reply-To: <494277d5-a425-8e0d-85da-6474878134e4@siemens.com>
References: <f529a508-6259-43e5-a2f9-6b4c48bdf153@googlegroups.com>
 <494277d5-a425-8e0d-85da-6474878134e4@siemens.com>
Subject: Re: Invalid MMIO access during PCI device initialization
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2539_1757382215.1569307680981"
X-Original-Sender: Sonic.tw.tp@gmail.com
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

------=_Part_2539_1757382215.1569307680981
Content-Type: multipart/alternative; 
	boundary="----=_Part_2540_2046482418.1569307680981"

------=_Part_2540_2046482418.1569307680981
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable



2019=E5=B9=B49=E6=9C=8820=E6=97=A5=E9=87=91=E6=9B=9C=E6=97=A5 18=E6=99=8257=
=E5=88=8627=E7=A7=92 UTC+9 Jan Kiszka:
>
> On 20.09.19 10:49, Chung-Fan Yang wrote:=20
> > Hi everyone,=20
> >=20
> > I am having some problem with a physical PCI-e serial card and non-root=
=20
> Linux.=20
> >=20
> > I have been using the serial card with the root Linux and non-root RTOS=
=20
> for a=20
> > while whthout any problem.=20
> >=20
> > Recently, I decided to try this card in a non-root Linux.=20
> > I compiled the Jailhouse enabled kernel and prepared a rootfs.=20
> > The non-root Linux work fine with an motherboard built-in 8250 serial.=
=20
> >=20
> > I have a custom Linux driver for this PCI-e serial card.=20
> > Therefore, this card should be immune from the 8250.n_uart problem.=20
> > However, because the card is still in the COMMUNICATION_SERIAL class,=
=20
> 8250_pci=20
> > driver still will initialize the card during boot.=20
> >=20
> > During this initialization, it will try to setup the virtual channels.=
=20
> > When it read the VC capability structures, the system hangs with the=20
> following=20
> > log(I had made jailhouse to be more verbose).=20
> >=20
> > More specifically,=20
> >=20
> > when it do pci_vc_do_save_buffer() in drivers/pci/vc.c and call=20
> >=20
> > pci_read_config_word(dev, pos + PCI_VC_PORT_CTRL, (u16 *)buf);=20
> >=20
> > it will in turn call read_pci_config() in arch/x86/pci/early.c,=20
> resulting a fault.=20
> >=20
> >=20
> > Removing PCI device 02:00.0 from cell "RootCell"=20
> > Freeing 8 interrupt(s) for device 0200 at index 74=20
> > Adding PCI device 02:00.0 to cell "linux-x86-demo"=20
> > Reserving 1 interrupt(s) for device 0200 at index 72=20
> > Removing PCI device 02:00.1 from cell "RootCell"=20
> > Freeing 8 interrupt(s) for device 0201 at index 119=20
> > Adding PCI device 02:00.1 to cell "linux-x86-demo"=20
> > Reserving 1 interrupt(s) for device 0201 at index 73=20
> > Removing PCI device 02:00.2 from cell "RootCell"=20
> > Freeing 1 interrupt(s) for device 0202 at index 71=20
> > Adding PCI device 02:00.2 to cell "linux-x86-demo"=20
> > Reserving 1 interrupt(s) for device 0202 at index 71=20
> > Created cell "linux-x86-demo"=20
> > Page pool usage after cell creation: mem 468/16329, remap 65711/131072=
=20
> > Cell "linux-x86-demo" can be loaded=20
> > CPU 7 received SIPI, vector 100=20
> > Started cell "linux-x86-demo"=20
> > FATAL: unsupported instruction (0x66 0x00 0x00 0x00)=20
> > FATAL: Invalid MMIO/RAM read, addr: 0x000000008020010c size: 0=20
> > Name: linux-x86-demo=20
> > RIP: 0xffffffffb2550a08 RSP: 0xffffad0cc003bc08 FLAGS: 10286=20
> > RAX: 0xffffad0cd020010c RBX: 0xffffad0cd0200000 RCX: 0x000000000000010c=
=20
> > RDX: 0x00000000000000ff RSI: 0x0000000000000002 RDI: 0x0000000000000000=
=20
> > CS: 10 BASE: 0x0000000000000000 AR-BYTES: a09b EFER.LMA 1=20
> > RBP: 0x000000000000010c=20
> > DS: 0=20
> > SS: 0=20
> > GDTR_BASE: 0xfffffe0000001000 GDTR_LIMIT: 0x000000000000007f=20
> > IDTR_BASE: 0xfffffe0000000000 IDTR_LIMIT: 0x0000000000000fff=20
> > CR0: 0x0000000080050033 CR3: 0x0000000006c0a001 CR4: 0x00000000003626f0=
=20
> > EFER: 0x0000000000000d01=20
> > CPL: 0 RPL: 0=20
> > Parking CPU 7 (Cell: "linux-x86-demo")=20
> >=20
> > I do not understand why only this specific read cause a fault, but=20
> others don't.=20
> > Did I misconfig anything in the cell config file(as an attachment).=20
> >=20
>
> I suspect your are not using current master but rather the laster release=
,=20
> right? Could you retry with master, specifically because of [1]?=20
>
>
Yeah, I am using an old version. I want to make my system as stable as=20
possible during my research.

Using the current master solve the problem.

Thanks for the help.

Yang

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/8a0921f1-11ce-4231-a9ec-c115a059cfee%40googlegroups.com.

------=_Part_2540_2046482418.1569307680981
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>2019=E5=B9=B49=E6=9C=8820=E6=97=A5=E9=87=91=E6=9B=
=9C=E6=97=A5 18=E6=99=8257=E5=88=8627=E7=A7=92 UTC+9 Jan Kiszka:<blockquote=
 class=3D"gmail_quote" style=3D"margin: 0;margin-left: 0.8ex;border-left: 1=
px #ccc solid;padding-left: 1ex;">On 20.09.19 10:49, Chung-Fan Yang wrote:
<br>&gt; Hi everyone,
<br>&gt;=20
<br>&gt; I am having some problem with a physical PCI-e serial card and non=
-root Linux.
<br>&gt;=20
<br>&gt; I have been using the serial card with the root Linux and non-root=
 RTOS for a=20
<br>&gt; while whthout any problem.
<br>&gt;=20
<br>&gt; Recently, I decided to try this card in a non-root Linux.
<br>&gt; I compiled the Jailhouse enabled kernel and prepared a rootfs.
<br>&gt; The non-root Linux work fine with an motherboard built-in 8250 ser=
ial.
<br>&gt;=20
<br>&gt; I have a custom Linux driver for this PCI-e serial card.
<br>&gt; Therefore, this card should be immune from the 8250.n_uart problem=
.
<br>&gt; However, because the card is still in the COMMUNICATION_SERIAL cla=
ss, 8250_pci=20
<br>&gt; driver still will initialize the card during boot.
<br>&gt;=20
<br>&gt; During this initialization, it will try to setup the virtual chann=
els.
<br>&gt; When it read the VC capability structures, the system hangs with t=
he following=20
<br>&gt; log(I had made jailhouse to be more verbose).
<br>&gt;=20
<br>&gt; More specifically,
<br>&gt;=20
<br>&gt; when it do pci_vc_do_save_buffer() in drivers/pci/vc.c and call
<br>&gt;=20
<br>&gt; pci_read_config_word(dev, pos + PCI_VC_PORT_CTRL, (u16 *)buf);
<br>&gt;=20
<br>&gt; it will in turn call read_pci_config() in arch/x86/pci/early.c, re=
sulting a fault.
<br>&gt;=20
<br>&gt;=20
<br>&gt; Removing PCI device 02:00.0 from cell &quot;RootCell&quot;
<br>&gt; Freeing 8 interrupt(s) for device 0200 at index 74
<br>&gt; Adding PCI device 02:00.0 to cell &quot;linux-x86-demo&quot;
<br>&gt; Reserving 1 interrupt(s) for device 0200 at index 72
<br>&gt; Removing PCI device 02:00.1 from cell &quot;RootCell&quot;
<br>&gt; Freeing 8 interrupt(s) for device 0201 at index 119
<br>&gt; Adding PCI device 02:00.1 to cell &quot;linux-x86-demo&quot;
<br>&gt; Reserving 1 interrupt(s) for device 0201 at index 73
<br>&gt; Removing PCI device 02:00.2 from cell &quot;RootCell&quot;
<br>&gt; Freeing 1 interrupt(s) for device 0202 at index 71
<br>&gt; Adding PCI device 02:00.2 to cell &quot;linux-x86-demo&quot;
<br>&gt; Reserving 1 interrupt(s) for device 0202 at index 71
<br>&gt; Created cell &quot;linux-x86-demo&quot;
<br>&gt; Page pool usage after cell creation: mem 468/16329, remap 65711/13=
1072
<br>&gt; Cell &quot;linux-x86-demo&quot; can be loaded
<br>&gt; CPU 7 received SIPI, vector 100
<br>&gt; Started cell &quot;linux-x86-demo&quot;
<br>&gt; FATAL: unsupported instruction (0x66 0x00 0x00 0x00)
<br>&gt; FATAL: Invalid MMIO/RAM read, addr: 0x000000008020010c size: 0
<br>&gt; Name: linux-x86-demo
<br>&gt; RIP: 0xffffffffb2550a08 RSP: 0xffffad0cc003bc08 FLAGS: 10286
<br>&gt; RAX: 0xffffad0cd020010c RBX: 0xffffad0cd0200000 RCX: 0x00000000000=
0010c
<br>&gt; RDX: 0x00000000000000ff RSI: 0x0000000000000002 RDI: 0x00000000000=
00000
<br>&gt; CS: 10 BASE: 0x0000000000000000 AR-BYTES: a09b EFER.LMA 1
<br>&gt; RBP: 0x000000000000010c
<br>&gt; DS: 0
<br>&gt; SS: 0
<br>&gt; GDTR_BASE: 0xfffffe0000001000 GDTR_LIMIT: 0x000000000000007f
<br>&gt; IDTR_BASE: 0xfffffe0000000000 IDTR_LIMIT: 0x0000000000000fff
<br>&gt; CR0: 0x0000000080050033 CR3: 0x0000000006c0a001 CR4: 0x00000000003=
626f0
<br>&gt; EFER: 0x0000000000000d01
<br>&gt; CPL: 0 RPL: 0
<br>&gt; Parking CPU 7 (Cell: &quot;linux-x86-demo&quot;)
<br>&gt;=20
<br>&gt; I do not understand why only this specific read cause a fault, but=
 others don&#39;t.
<br>&gt; Did I misconfig anything in the cell config file(as an attachment)=
.
<br>&gt;=20
<br>
<br>I suspect your are not using current master but rather the laster relea=
se,=20
<br>right? Could you retry with master, specifically because of [1]?
<br>
<br></blockquote><div><br></div><div>Yeah, I am using an old version. I wan=
t to make my system as stable as possible during my research.</div><div><br=
></div><div>Using the current master solve the problem.</div><div><br></div=
><div>Thanks for the help.</div><div><br></div><div>Yang<br></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/8a0921f1-11ce-4231-a9ec-c115a059cfee%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/8a0921f1-11ce-4231-a9ec-c115a059cfee%40googlegroups.com<=
/a>.<br />

------=_Part_2540_2046482418.1569307680981--

------=_Part_2539_1757382215.1569307680981--
