Return-Path: <jailhouse-dev+bncBC653PXTYYERBGNP6WHAMGQEFWGQWYA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf3a.google.com (mail-qv1-xf3a.google.com [IPv6:2607:f8b0:4864:20::f3a])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AC148AB14
	for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Jan 2022 11:10:34 +0100 (CET)
Received: by mail-qv1-xf3a.google.com with SMTP id g2-20020a0562141cc200b004123b0abe18sf15729459qvd.2
        for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Jan 2022 02:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=gtkJbhMPb6pYAXJ74MG9yw/gLVDMaFjwD5WMkp2kRK0=;
        b=ZNoVwizolubbxe3h5lR2GHi8lo4jFiZQHSOP4JPsF7FF2lbveG42EVOhROTDvs/eXX
         LKWQGh4eJSHCWFtyhHhmI6nVmqoFrauVEatPr//TUUMhK3zoPq0E59t6rNCQjip9iD0B
         lD2zd7Ma/mKepLTRxDPg21RzXYFYV6lRczhVWrz5MFfkCvXQlnMIk9LkPuyFpGiF6RZl
         vZCaTLVf8YmH0p3pYHjLbNqv3amJIj2KSjqtVdKmHCB0EwIQwnwL1VY4gCUOmmYHyxuq
         7QUj8DdrSMrnCmvcDW+maaRrY/i/7SwfQyU+oKqc4UQkJgFl5GZKYR8e6g9ohJCGgTdO
         +3+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=gtkJbhMPb6pYAXJ74MG9yw/gLVDMaFjwD5WMkp2kRK0=;
        b=We9aNuZwa8fhw4znXxB5hAxkvzDZj8L2O89vZw/YBv+plap03+jGj6H3190dTmDQfu
         RFD4CqJQ/KdVNINjs0N2aLH9CRpFeMITXFHYqlRMG/4S4w6fjDLBA4+2yKqjYngZcNTc
         lIc9UD5GlolxbkEno+u197j7rKHVwyYehTN8IQdxb3DajVOYVJaRtLDJATxYlQ6fzXNA
         cYcWEhS/xigXwZNTB+Cn4yeDq9N/1rt/BPuPX4Bkx1KCKWvT+4VqSEoAvMs5vmcjJsUb
         tixVqQpDSF6TIAD4Vbbu1ESuc4l6gY2vjx+IpdUV7mxLH0YkaOxvseRIXZ/QOUtuDRtA
         yVng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=gtkJbhMPb6pYAXJ74MG9yw/gLVDMaFjwD5WMkp2kRK0=;
        b=tr4uTCw62DgpIQ3TM1jfIAf7hopUrt6L4aembkUL3oG5mw4R7y/dRZsdyik2ZjzCB6
         lHVT6UHjkaP02kS3NE3cJFLtJ45CVR45ve0ZT6M3bxkruHdF76E8/Kl0mWqM3Mq5GoUa
         X9ab2yRK0vsvITSnqBcZSnE/4WhRaJoQmU/DNVnjsjKrioYmhhV7gk9rq1+KlDWDdXch
         T//oAeyWHocUoX+KoGA+Xq0ry4rJnc67x1dfaZLQPKAd+kJeu6AWitaHrsW8EsejG16m
         rxi/gwEpczZTtYYLmoAQMCfS1yBSFAxDfaTPpkUjFkMKQOya9Styku0ATMdzECDb4N8A
         EIgA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5313blXeVCndHQ9LYJGFMBD2ABGYW2YmtXk5ME3gUtAdYBIDuZnX
	/xfsTxs72UiONm3bqXDqpOQ=
X-Google-Smtp-Source: ABdhPJx5CKuKWsYg8aZWbCi3RFmyjsUiUfNAczkc4LuqZcRGd2dV5Ji39ur9hv7ncIPr8e82E1rVng==
X-Received: by 2002:ad4:5949:: with SMTP id eo9mr2997255qvb.91.1641895833949;
        Tue, 11 Jan 2022 02:10:33 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:134b:: with SMTP id c11ls6889111qkl.7.gmail; Tue,
 11 Jan 2022 02:10:33 -0800 (PST)
X-Received: by 2002:a37:6857:: with SMTP id d84mr1312278qkc.322.1641895833271;
        Tue, 11 Jan 2022 02:10:33 -0800 (PST)
Date: Tue, 11 Jan 2022 02:10:32 -0800 (PST)
From: Moustafa Nofal <mustafa13e09940@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <84ebb12e-49ba-49ed-9719-063064e3c8e6n@googlegroups.com>
In-Reply-To: <20220111103848.5abbc20e@md1za8fc.ad001.siemens.net>
References: <e630d89c-45ab-40c1-ab9e-222fbbe26f30n@googlegroups.com>
 <20220111103848.5abbc20e@md1za8fc.ad001.siemens.net>
Subject: Re: Adding another vpci
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_692_1457742085.1641895832749"
X-Original-Sender: mustafa13e09940@gmail.com
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

------=_Part_692_1457742085.1641895832749
Content-Type: multipart/alternative; 
	boundary="----=_Part_693_12120268.1641895832749"

------=_Part_693_12120268.1641895832749
Content-Type: text/plain; charset="UTF-8"

The device is virtual pci, I was missing this JAILHOUSE_SHMEM_NET_REGIONS. 
I added it on a reserved place, away from other memory regions and its and 
another virtual ethernet is added. I have another question regarding 
particularly these two memroy regions, 
                /* MMIO 1 (permissive) */ {
                        .phys_start = 0xfd500000,
                        .virt_start = 0xfd500000,
                        .size =        0x1b00000,
                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                                JAILHOUSE_MEM_IO,
                },
                /* MMIO 2 (permissive) */{
                        .phys_start = 0x600000000,
                        .virt_start = 0x600000000,
                        .size =         0x4000000,
                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                                JAILHOUSE_MEM_IO,
                },
In my system it points to pcie device and RAM(non-reserved for jailhouse). 
What are these regions? and are they related 
to JAILHOUSE_SHMEM_NET_REGIONS, because what I read is that this command 
reserves four memory regions. 
One more question, on the second linux cell configuration, I added the 
memory region with correct flags, that was added on the root cell and I am 
trying to configure the pci communication. 
On root cell:
                        /* IVSHMEM 0001:00:02.0 (networking) */
                {
                        .type = JAILHOUSE_PCI_TYPE_IVSHMEM,
                        .domain = 2,
                        .bdf = 2 << 3,
                        .bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
                        .shmem_regions_start = 12,
                        .shmem_dev_id = 0,
                        .shmem_peers = 2,
                        .shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
                },
and 
                JAILHOUSE_SHMEM_NET_REGIONS(0x30000000, 0),

On 2nd Linux cell:
                { /* IVSHMEM 00:02.0 (networking) */
                        .type = JAILHOUSE_PCI_TYPE_IVSHMEM,
                        .bdf = 2 << 3,
                        .bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
                        .shmem_regions_start = 6,
                        .shmem_dev_id = 1,
                        .shmem_peers = 2,
                        .shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
                },
and                 JAILHOUSE_SHMEM_NET_REGIONS(0x30000000, 1),
I followed the documentation, the .bdf is the same, only 2 peers , and I 
put also the correct memory region. However, no ethernet is added on the 
second non-root Linux
Kind regards
Moustafa Noufale
On Tuesday, 11 January 2022 at 10:38:52 UTC+1 Henning Schild wrote:

> Am Mon, 10 Jan 2022 13:31:16 -0800 (PST)
> schrieb Moustafa Nofal <mustafa...@gmail.com>:
>
> > Hi, 
> > I intend to add another Linux on Raspberry Pi4. So, I added also a
> > memory region on rpi4.c and extended the size of mem_regions by, and
> > managed to get working. I added a pci device, and extended the array
> > by one, and the pci device is added, but without kernel driver in
> > use? So, how to add the driver to it?
>
>
> What kind of device is it? The kernel should simply find it and bind
> any driver that fits, in case it has one that does.
>
> If it is a virtual network device based on ivshmem2 you need to add the
> pci device, and multiple memory regions for it
> JAILHOUSE_SHMEM_NET_REGIONS for the driver to pick it up correctly you
> need to set the shmem_protocol of the pci device to
> JAILHOUSE_SHMEM_PROTO_VETH and set the index shmem_regions_start to
> your newly added memory regions.
>
> regards,
> Henning
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/84ebb12e-49ba-49ed-9719-063064e3c8e6n%40googlegroups.com.

------=_Part_693_12120268.1641895832749
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The device is virtual pci, I was missing this JAILHOUSE_SHMEM_NET_REGIONS. =
I added it on a reserved place, away from other memory regions and its and =
another virtual ethernet is added. I have another question regarding partic=
ularly these two memroy regions,&nbsp;<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; /* MMIO 1 (permissive) */ {<br>&nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .phys_start =
=3D 0xfd500000,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; .virt_start =3D 0xfd500000,<br>&nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .size =
=3D &nbsp; &nbsp; &nbsp; &nbsp;0x1b00000,<br>&nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .flags =3D JAILHOUSE_=
MEM_READ | JAILHOUSE_MEM_WRITE |<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; JA=
ILHOUSE_MEM_IO,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
},<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* MMIO 2 (pe=
rmissive) */{<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; .phys_start =3D 0x600000000,<br>&nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .virt_st=
art =3D 0x600000000,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; .size =3D &nbsp; &nbsp; &nbsp; &nbsp; 0x40=
00000,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br=
>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; JAILHOUSE_MEM_IO,<br>&nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; },<br>In my system it points to pci=
e device and RAM(non-reserved for jailhouse). What are these regions? and a=
re they related to&nbsp;JAILHOUSE_SHMEM_NET_REGIONS, because what I read is=
 that this command reserves four memory regions.&nbsp;<br>One more question=
, on the second linux cell configuration, I added the memory region with co=
rrect flags, that was added on the root cell and I am trying to configure t=
he pci communication.&nbsp;<br>On root cell:<br>&nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* IVSHMEM 0001:00=
:02.0 (networking) */<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; {<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; .type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,<br>&nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .doma=
in =3D 2,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; .bdf =3D 2 &lt;&lt; 3,<br>&nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .bar_mask =3D JAIL=
HOUSE_IVSHMEM_BAR_MASK_INTX,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .shmem_regions_start =3D 12,<br>&n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; .shmem_dev_id =3D 0,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .shmem_peers =3D 2,<br>&nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .sh=
mem_protocol =3D JAILHOUSE_SHMEM_PROTO_VETH,<br>&nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; },<div>and&nbsp;</div><div>&nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; JAILHOUSE_SHMEM_NET_REGIONS(0x30000000=
, 0),<br><br>On 2nd Linux cell:<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; { /* IVSHMEM 00:02.0 (networking) */<br>&nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .type =3D =
JAILHOUSE_PCI_TYPE_IVSHMEM,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .bdf =3D 2 &lt;&lt; 3,<br>&nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
.bar_mask =3D JAILHOUSE_IVSHMEM_BAR_MASK_INTX,<br>&nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .shmem_regions_s=
tart =3D 6,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; .shmem_dev_id =3D 1,<br>&nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .shmem_peers =3D 2=
,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; .shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_VETH,<br>&nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; },<br>and&nbsp;&nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; JAILHOUSE_SHMEM_NET_REGIONS(0x300=
00000, 1),<br><div>I followed the documentation, the .bdf is the same, only=
 2 peers , and I put also the correct memory region. However, no ethernet i=
s added on the second non-root Linux<br>Kind regards<br>Moustafa Noufale</d=
iv></div><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">=
On Tuesday, 11 January 2022 at 10:38:52 UTC+1 Henning Schild wrote:<br/></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-l=
eft: 1px solid rgb(204, 204, 204); padding-left: 1ex;">Am Mon, 10 Jan 2022 =
13:31:16 -0800 (PST)
<br>schrieb Moustafa Nofal &lt;<a href data-email-masked rel=3D"nofollow">m=
ustafa...@gmail.com</a>&gt;:
<br>
<br>&gt; Hi,=20
<br>&gt; I intend to add another Linux on Raspberry Pi4. So, I added also a
<br>&gt; memory region on rpi4.c and extended the size of mem_regions by, a=
nd
<br>&gt; managed to get working. I added a pci device, and extended the arr=
ay
<br>&gt; by one, and the pci device is added, but without kernel driver in
<br>&gt; use? So, how to add the driver to it?
<br>
<br>
<br>What kind of device is it? The kernel should simply find it and bind
<br>any driver that fits, in case it has one that does.
<br>
<br>If it is a virtual network device based on ivshmem2 you need to add the
<br>pci device, and multiple memory regions for it
<br>JAILHOUSE_SHMEM_NET_REGIONS for the driver to pick it up correctly you
<br>need to set the shmem_protocol of the pci device to
<br>JAILHOUSE_SHMEM_PROTO_VETH and set the index shmem_regions_start to
<br>your newly added memory regions.
<br>
<br>regards,
<br>Henning
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/84ebb12e-49ba-49ed-9719-063064e3c8e6n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/84ebb12e-49ba-49ed-9719-063064e3c8e6n%40googlegroups.co=
m</a>.<br />

------=_Part_693_12120268.1641895832749--

------=_Part_692_1457742085.1641895832749--
