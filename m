Return-Path: <jailhouse-dev+bncBCBJJVUE3MMRBWE526MAMGQERTUJIQA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33f.google.com (mail-ot1-x33f.google.com [IPv6:2607:f8b0:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F2C5AD011
	for <lists+jailhouse-dev@lfdr.de>; Mon,  5 Sep 2022 12:26:34 +0200 (CEST)
Received: by mail-ot1-x33f.google.com with SMTP id 36-20020a9d0627000000b0063927bfccb5sf4871861otn.18
        for <lists+jailhouse-dev@lfdr.de>; Mon, 05 Sep 2022 03:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date;
        bh=NBn3TOiM8vXsOOJDuZftXITFj5F7/V3eeeSPDhzi+RU=;
        b=ZdW8/u03EFeQx326WG571zzk7ph+RvsyYgQk+xB4cQH885UXzqho0SoSa142UFi9e0
         K6WTmixcMi5Es5lYcOPD7oTcia1qrbC9WleMJdPjdEAsHuEqunEr4LeWFOdgMOZG4+yG
         DZA06lp1c6yCfhPVvuvOHxjake3qMS+/+9cH1skirnYBUJ+7eXQY6ox1A2HKWiLj36U0
         0D1kRZAwLZ+RH08l6gOaLYMjc/fbv+RYJ+KyOwPKS9RekY7E8x8xfxX9GjWEs90wM2VE
         fuRcW+RqJ6By8diO2zyqB5Jt6IPwhNfLGf2+ubFZPRgkrQy33AdQMWLCfjQDzLilUn1s
         0d6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date;
        bh=NBn3TOiM8vXsOOJDuZftXITFj5F7/V3eeeSPDhzi+RU=;
        b=UM/AQLTUPriUaValpHV2h1pRbSrQkFs0PQIleRtZBdX6ZK+vjsEyPEzJGztvsbki+g
         ByCLsnZ3WLmyf0V9IM+EbNv0JDvzhyYMM1slat4AFBy5SZyrE8Sr2KPPQBJ/KN/W5b10
         ry4ylf+BDi7Z741bMHwCcADjGfrtOtxYzl5+vMNo1m4jKduXed8h6Bt3yXxbJULCSBoD
         KnFsZUjb4TKp1lKhv1Dy9Kd/EzFC3wBIebadYwGXXNtiZ7z3kbb2ZTWW3rp3gu8JCp4d
         nt2laL7bnxodHHsEcJLI+vl/vSWVOyTHUXpOxPIafCNPRQKN/lTQOcz21nz5ak2XpVKY
         NB0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-gm-message-state:sender:from:to:cc
         :subject:date;
        bh=NBn3TOiM8vXsOOJDuZftXITFj5F7/V3eeeSPDhzi+RU=;
        b=XdP1O8g8FKuiP+rouw6L2KEwdy2hGPH+tysvYgENdj0L1StGMWd0PdTxNqHlzelQ7S
         4PNFE/NwaDqFLTYUhzixV1jQ3TEiW5+yH5cBc5eSoDDDjJTNe8dhqLY32zhmOhgFPIAr
         dBYXoNlSTc708EMQjGAVsmu8hSKM/xZRhAnvn+NLHavD9Us523HOr1qh0dPD3BcFUTn5
         opJE/QcluJxTwhwJeqGoKal9fgLYW/HYlDQDfQrIiYRUPkZOfRZx5PXf3ggLAPar2ppH
         0hc3il/Uf1Lcl0y8Xzfpyt7PzL7Nflfugr0QYfIj+8/qJnA/IY/c7b7KH4F5oBQL8mXO
         jo4g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ACgBeo1N3RAAjeFugWNayzwgui2fWMUZJj4Gd2X1jPb+vr9yh4+W7CQc
	WT83xOW2B9aX0PP6durzF0Y=
X-Google-Smtp-Source: AA6agR5AWuuN/BjCvmJiM5stsRNlEraqo7WIF3+jvDKMtlshIItHHpNT31B+oMsqWendaG+CJWZyBA==
X-Received: by 2002:a05:6808:201e:b0:343:6192:1e21 with SMTP id q30-20020a056808201e00b0034361921e21mr7115043oiw.277.1662373593032;
        Mon, 05 Sep 2022 03:26:33 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6870:d8a5:b0:127:2be3:37fc with SMTP id
 dv37-20020a056870d8a500b001272be337fcls1181282oab.10.-pod-prod-gmail; Mon, 05
 Sep 2022 03:26:32 -0700 (PDT)
X-Received: by 2002:a05:6870:4303:b0:125:5aaa:5f56 with SMTP id w3-20020a056870430300b001255aaa5f56mr7380107oah.126.1662373592165;
        Mon, 05 Sep 2022 03:26:32 -0700 (PDT)
Date: Mon, 5 Sep 2022 03:26:31 -0700 (PDT)
From: Yelena Konyukh <ykonyukh@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <22820838-b99f-4a2e-9c87-d634c7d376e5n@googlegroups.com>
In-Reply-To: <CA+V-a8uoYz_CUxxstk8afHMKjOjHX9c=tWPAhFpoBKjfnb=TPA@mail.gmail.com>
References: <94bae287-eaf2-4ae2-bcdd-fc87342256e5n@googlegroups.com>
 <CA+V-a8uE2PzOF2mh0xEQmQ=akMTWXHy7usqEaM1C754DHS1=+w@mail.gmail.com>
 <CA+V-a8uJVDLNGjtcoZHN_FcvVMnxq5MjQRudtR1zQznPja2Kng@mail.gmail.com>
 <CA+V-a8uoYz_CUxxstk8afHMKjOjHX9c=tWPAhFpoBKjfnb=TPA@mail.gmail.com>
Subject: Re: Linux imate unhandled read
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_3612_817085746.1662373591509"
X-Original-Sender: ykonyukh@gmail.com
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

------=_Part_3612_817085746.1662373591509
Content-Type: multipart/alternative; 
	boundary="----=_Part_3613_2057144780.1662373591509"

------=_Part_3613_2057144780.1662373591509
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

Just wanted to say "thank you" for sharing your experience  - your messages 
have been helping me to get non-root Linux cell configuration.

Best Regards,

Yelena

On Monday, June 6, 2022 at 6:42:26 PM UTC+1 prabhaka...@gmail.com wrote:

> On Thu, Jun 2, 2022 at 9:41 AM Lad, Prabhakar
> <prabhaka...@gmail.com> wrote:
> >
> > On Tue, May 31, 2022 at 8:13 PM Lad, Prabhakar
> > <prabhaka...@gmail.com> wrote:
> > >
> > > On Tue, May 31, 2022 at 1:52 PM Prabhakar Lad
> > > <prabhaka...@gmail.com> wrote:
> > > >
> > > >
> > > <snip>
> > > > * Looking at some of the linux inmate configs there are two regions 
> of RAM specified is this a strict requirement?
> > > > * For the inmate RAM should the virt_start = CONFIG_INMATE_BASE?
> > > >
> > > After updating my memory layout, i.e. after creating one region for
> > > loading the linux another for DDR RAM and lastly the communication
> > > region in my inmate I no longer see the unhandled read error.
> > >
> > > /* linux-loader space */ {
> > > .phys_start = 0x59000000,
> > > .virt_start = 0x0,
> > > .size = 0x6400000,
> > > .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> > > JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
> > > },
> > > /* RAM */ {
> > > .phys_start = 0x5F400000,
> > > .virt_start = 0x5F400000,
> > > .size = 0x19C00000,
> > > .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> > > JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
> > > JAILHOUSE_MEM_LOADABLE,
> > > },
> > > /* communication region */ {
> > > .virt_start = 0x80000000,
> > > .size = 0x00001000,
> > > .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> > > JAILHOUSE_MEM_COMM_REGION,
> > > },
> > >
> > > I am able to load the linux on one of the CPUs but I cannot see any
> > > console output on the serial.
> > >
> > > root@hihope-rzg2m:~# jailhouse cell linux
> > > renesas-r8a774a1-linux-demo.cell Image.gz -d
> > > inmate-r8a774a1-hihope.dtb -c "clk_ignore_unused rootwait rw"
> > > Started cell "renesas-r8a774a1-linux-demo"
> > > root@hihope-rzg2m:~#
> > > root@hihope-rzg2m:~# jailhouse cell list
> > > ID Name State Assigned CPUs
> > > Failed CPUs
> > > 0 Renesas HopeRun HiHope RZ/G2Mrunning 0,2-5
> > > 1 renesas-r8a774a1-linux-demorunning 1
> > > root@hihope-rzg2m:~#
> > >
> > > Any pointers on debugging this? (jailhouse cell stat 1 doesn't seem to
> > > updating the number so I assume it's panicked somewhere)
> > >
> > I was able to get the console output on the root cell for debugging by
> > setting "console=jailhouse earlycon..."
> >
> > I'm seeing that when trying to initialize the GIC its causing a panic:
> >
> > [ 0.000000] ------------[ cut here ]------------
> > [ 0.000000] unable to map gic dist registers
> > [ 0.000000] WARNING: CPU: 0 PID: 0 at
> > drivers/irqchip/irq-gic.c:1393 gic_of_setup+0xa8/0xf0
> > [ 0.000000] Modules linked in:
> > [ 0.000000] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G W
> > 5.10.31+ #37
> > [ 0.000000] Hardware name: Jailhouse cell on HopeRun HiHope RZ/G2M
> > R8A774A1 (DT)
> > [ 0.000000] pstate: 60000085 (nZCv daIf -PAN -UAO -TCO BTYPE=--)
> > [ 0.000000] pc : gic_of_setup+0xa8/0xf0
> > [ 0.000000] lr : gic_of_setup+0xa8/0xf0
> > [ 0.000000] sp : ffff800011203dd0
> > [ 0.000000] x29: ffff800011203dd0 x28: ffff800010f936c0
> > [ 0.000000] x27: ffff80001120cc18 x26: ffff80001120cc18
> > [ 0.000000] x25: 0000000000000000 x24: ffff800011209000
> > [ 0.000000] x23: ffff000077c36460 x22: ffff80001120c000
> > [ 0.000000] x21: ffff800010f93000 x20: ffff000077c36460
> > [ 0.000000] x19: ffff80001120cc18 x18: ffffffffffffffff
> > [ 0.000000] x17: 00000000000000c0 x16: fffffdffffe00340
> > [ 0.000000] x15: ffff800011209948 x14: 0000000000000056
> > [ 0.000000] x13: ffff800011203a70 x12: 00000000ffffffea
> > [ 0.000000] x11: ffff8000112914c0 x10: ffff800011279480
> > [ 0.000000] x9 : ffff8000112794d8 x8 : 0000000000017fe8
> > [ 0.000000] x7 : c0000000ffffefff x6 : 0000000000000001
> > [ 0.000000] x5 : 0000000000000000 x4 : 0000000000000000
> > [ 0.000000] x3 : 00000000ffffffff x2 : ffff800011221450
> > [ 0.000000] x1 : 0000000000000000 x0 : 0000000000000000
> > [ 0.000000] Call trace:
> > [ 0.000000] gic_of_setup+0xa8/0xf0
> > [ 0.000000] gic_of_init+0x88/0x390
> > [ 0.000000] of_irq_init+0x194/0x33c
> > [ 0.000000] irqchip_init+0x18/0x40
> > [ 0.000000] init_IRQ+0xc8/0xfc
> > [ 0.000000] start_kernel+0x2ec/0x4f8
> > [ 0.000000] ---[ end trace f68728a0d3053b52 ]---
> > [ 0.000000] OF: of_irq_init: children remain, but no parents
> > [ 0.000000] Kernel panic - not syncing: No interrupt controller found.
> > [ 0.000000] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G W
> > 5.10.31+ #37
> > [ 0.000000] Hardware name: Jailhouse cell on HopeRun HiHope RZ/G2M
> > R8A774A1 (DT)
> > [ 0.000000] Call trace:
> > [ 0.000000] dump_backtrace+0x0/0x1c0
> > [ 0.000000] show_stack+0x18/0x68
> > [ 0.000000] dump_stack+0xd8/0x134
> > [ 0.000000] panic+0x188/0x3a8
> > [ 0.000000] init_IRQ+0xe0/0xfc
> > [ 0.000000] start_kernel+0x2ec/0x4f8
> > [ 0.000000] ---[ end Kernel panic - not syncing: No interrupt
> > controller found. ]---
> >
> I was able to resolve the issue by fixing the DT.
>
> Cheers,
> Prabhakar
>
> > I have the below GIC node in the inmate dts:
> >
> > gic: interrupt-controller@f1010000 {
> > compatible = "arm,gic-400";
> > #interrupt-cells = <3>;
> > #address-cells = <0>;
> > interrupt-controller;
> > reg = <0x0 0xf1010000 0 0x1000>,
> > <0x0 0xf1020000 0 0x20000>,
> > <0x0 0xf1040000 0 0x20000>,
> > <0x0 0xf1060000 0 0x20000>;
> > interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_HIGH)>;
> > };
> >
> > In the inmate cell file for GIC configuration, do we need to enable
> > pin_bitmap mask just for the peripherals which are only enabled in DT
> > (For now I have the pin_bitmap mask in the inmate cell same as the
> > root cell) ?
> >
> > Cheers,
> > Prabhakar
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/22820838-b99f-4a2e-9c87-d634c7d376e5n%40googlegroups.com.

------=_Part_3613_2057144780.1662373591509
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,<br><br>Just wanted to say "thank you" for sharing your experi=
ence&nbsp; - your messages have been helping me to get non-root Linux cell =
configuration.<br><br>Best Regards,<br><br>Yelena<br><br><div class=3D"gmai=
l_quote"><div dir=3D"auto" class=3D"gmail_attr">On Monday, June 6, 2022 at =
6:42:26 PM UTC+1 prabhaka...@gmail.com wrote:<br/></div><blockquote class=
=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(2=
04, 204, 204); padding-left: 1ex;">On Thu, Jun 2, 2022 at 9:41 AM Lad, Prab=
hakar
<br>&lt;<a href data-email-masked rel=3D"nofollow">prabhaka...@gmail.com</a=
>&gt; wrote:
<br>&gt;
<br>&gt; On Tue, May 31, 2022 at 8:13 PM Lad, Prabhakar
<br>&gt; &lt;<a href data-email-masked rel=3D"nofollow">prabhaka...@gmail.c=
om</a>&gt; wrote:
<br>&gt; &gt;
<br>&gt; &gt; On Tue, May 31, 2022 at 1:52 PM Prabhakar Lad
<br>&gt; &gt; &lt;<a href data-email-masked rel=3D"nofollow">prabhaka...@gm=
ail.com</a>&gt; wrote:
<br>&gt; &gt; &gt;
<br>&gt; &gt; &gt;
<br>&gt; &gt; &lt;snip&gt;
<br>&gt; &gt; &gt; * Looking at some of the linux inmate  configs there are=
 two regions of RAM specified is this a strict requirement?
<br>&gt; &gt; &gt; * For the inmate RAM should the virt_start =3D CONFIG_IN=
MATE_BASE?
<br>&gt; &gt; &gt;
<br>&gt; &gt; After updating my memory layout, i.e. after creating one regi=
on for
<br>&gt; &gt; loading the linux another for DDR RAM and lastly the communic=
ation
<br>&gt; &gt; region in my inmate I no longer see the unhandled read error.
<br>&gt; &gt;
<br>&gt; &gt;         /* linux-loader space */ {
<br>&gt; &gt;             .phys_start =3D 0x59000000,
<br>&gt; &gt;             .virt_start =3D 0x0,
<br>&gt; &gt;             .size =3D 0x6400000,
<br>&gt; &gt;             .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRI=
TE |
<br>&gt; &gt;                 JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABL=
E,
<br>&gt; &gt;         },
<br>&gt; &gt;         /* RAM */ {
<br>&gt; &gt;             .phys_start =3D 0x5F400000,
<br>&gt; &gt;             .virt_start =3D 0x5F400000,
<br>&gt; &gt;             .size =3D 0x19C00000,
<br>&gt; &gt;             .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRI=
TE |
<br>&gt; &gt;                 JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
<br>&gt; &gt;                 JAILHOUSE_MEM_LOADABLE,
<br>&gt; &gt;         },
<br>&gt; &gt;         /* communication region */ {
<br>&gt; &gt;             .virt_start =3D 0x80000000,
<br>&gt; &gt;             .size =3D 0x00001000,
<br>&gt; &gt;             .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRI=
TE |
<br>&gt; &gt;                 JAILHOUSE_MEM_COMM_REGION,
<br>&gt; &gt;         },
<br>&gt; &gt;
<br>&gt; &gt; I am able to load the linux on one of the CPUs but I cannot s=
ee any
<br>&gt; &gt; console output on the serial.
<br>&gt; &gt;
<br>&gt; &gt; root@hihope-rzg2m:~# jailhouse cell linux
<br>&gt; &gt; renesas-r8a774a1-linux-demo.cell Image.gz -d
<br>&gt; &gt; inmate-r8a774a1-hihope.dtb -c &quot;clk_ignore_unused rootwai=
t rw&quot;
<br>&gt; &gt; Started cell &quot;renesas-r8a774a1-linux-demo&quot;
<br>&gt; &gt; root@hihope-rzg2m:~#
<br>&gt; &gt; root@hihope-rzg2m:~# jailhouse cell list
<br>&gt; &gt; ID      Name                    State             Assigned CP=
Us
<br>&gt; &gt;    Failed CPUs
<br>&gt; &gt; 0       Renesas HopeRun HiHope RZ/G2Mrunning           0,2-5
<br>&gt; &gt; 1       renesas-r8a774a1-linux-demorunning           1
<br>&gt; &gt; root@hihope-rzg2m:~#
<br>&gt; &gt;
<br>&gt; &gt; Any pointers on debugging this? (jailhouse cell stat 1 doesn&=
#39;t seem to
<br>&gt; &gt; updating the number so I assume it&#39;s panicked somewhere)
<br>&gt; &gt;
<br>&gt; I was able to get the console output on the root cell for debuggin=
g by
<br>&gt; setting &quot;console=3Djailhouse earlycon...&quot;
<br>&gt;
<br>&gt; I&#39;m seeing that when trying to initialize the GIC its causing =
a panic:
<br>&gt;
<br>&gt; [    0.000000] ------------[ cut here ]------------
<br>&gt; [    0.000000] unable to map gic dist registers
<br>&gt; [    0.000000] WARNING: CPU: 0 PID: 0 at
<br>&gt; drivers/irqchip/irq-gic.c:1393 gic_of_setup+0xa8/0xf0
<br>&gt; [    0.000000] Modules linked in:
<br>&gt; [    0.000000] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        W
<br>&gt;   5.10.31+ #37
<br>&gt; [    0.000000] Hardware name: Jailhouse cell on HopeRun HiHope RZ/=
G2M
<br>&gt; R8A774A1 (DT)
<br>&gt; [    0.000000] pstate: 60000085 (nZCv daIf -PAN -UAO -TCO BTYPE=3D=
--)
<br>&gt; [    0.000000] pc : gic_of_setup+0xa8/0xf0
<br>&gt; [    0.000000] lr : gic_of_setup+0xa8/0xf0
<br>&gt; [    0.000000] sp : ffff800011203dd0
<br>&gt; [    0.000000] x29: ffff800011203dd0 x28: ffff800010f936c0
<br>&gt; [    0.000000] x27: ffff80001120cc18 x26: ffff80001120cc18
<br>&gt; [    0.000000] x25: 0000000000000000 x24: ffff800011209000
<br>&gt; [    0.000000] x23: ffff000077c36460 x22: ffff80001120c000
<br>&gt; [    0.000000] x21: ffff800010f93000 x20: ffff000077c36460
<br>&gt; [    0.000000] x19: ffff80001120cc18 x18: ffffffffffffffff
<br>&gt; [    0.000000] x17: 00000000000000c0 x16: fffffdffffe00340
<br>&gt; [    0.000000] x15: ffff800011209948 x14: 0000000000000056
<br>&gt; [    0.000000] x13: ffff800011203a70 x12: 00000000ffffffea
<br>&gt; [    0.000000] x11: ffff8000112914c0 x10: ffff800011279480
<br>&gt; [    0.000000] x9 : ffff8000112794d8 x8 : 0000000000017fe8
<br>&gt; [    0.000000] x7 : c0000000ffffefff x6 : 0000000000000001
<br>&gt; [    0.000000] x5 : 0000000000000000 x4 : 0000000000000000
<br>&gt; [    0.000000] x3 : 00000000ffffffff x2 : ffff800011221450
<br>&gt; [    0.000000] x1 : 0000000000000000 x0 : 0000000000000000
<br>&gt; [    0.000000] Call trace:
<br>&gt; [    0.000000]  gic_of_setup+0xa8/0xf0
<br>&gt; [    0.000000]  gic_of_init+0x88/0x390
<br>&gt; [    0.000000]  of_irq_init+0x194/0x33c
<br>&gt; [    0.000000]  irqchip_init+0x18/0x40
<br>&gt; [    0.000000]  init_IRQ+0xc8/0xfc
<br>&gt; [    0.000000]  start_kernel+0x2ec/0x4f8
<br>&gt; [    0.000000] ---[ end trace f68728a0d3053b52 ]---
<br>&gt; [    0.000000] OF: of_irq_init: children remain, but no parents
<br>&gt; [    0.000000] Kernel panic - not syncing: No interrupt controller=
 found.
<br>&gt; [    0.000000] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        W
<br>&gt;   5.10.31+ #37
<br>&gt; [    0.000000] Hardware name: Jailhouse cell on HopeRun HiHope RZ/=
G2M
<br>&gt; R8A774A1 (DT)
<br>&gt; [    0.000000] Call trace:
<br>&gt; [    0.000000]  dump_backtrace+0x0/0x1c0
<br>&gt; [    0.000000]  show_stack+0x18/0x68
<br>&gt; [    0.000000]  dump_stack+0xd8/0x134
<br>&gt; [    0.000000]  panic+0x188/0x3a8
<br>&gt; [    0.000000]  init_IRQ+0xe0/0xfc
<br>&gt; [    0.000000]  start_kernel+0x2ec/0x4f8
<br>&gt; [    0.000000] ---[ end Kernel panic - not syncing: No interrupt
<br>&gt; controller found. ]---
<br>&gt;
<br>I was able to resolve the issue by fixing the DT.
<br>
<br>Cheers,
<br>Prabhakar
<br>
<br>&gt; I have the below GIC node in the inmate dts:
<br>&gt;
<br>&gt;     gic: interrupt-controller@f1010000 {
<br>&gt;         compatible =3D &quot;arm,gic-400&quot;;
<br>&gt;         #interrupt-cells =3D &lt;3&gt;;
<br>&gt;         #address-cells =3D &lt;0&gt;;
<br>&gt;         interrupt-controller;
<br>&gt;         reg =3D &lt;0x0 0xf1010000 0 0x1000&gt;,
<br>&gt;             &lt;0x0 0xf1020000 0 0x20000&gt;,
<br>&gt;             &lt;0x0 0xf1040000 0 0x20000&gt;,
<br>&gt;             &lt;0x0 0xf1060000 0 0x20000&gt;;
<br>&gt;         interrupts =3D &lt;GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(6) | IRQ=
_TYPE_LEVEL_HIGH)&gt;;
<br>&gt;     };
<br>&gt;
<br>&gt; In the inmate cell file for GIC configuration, do we need to enabl=
e
<br>&gt; pin_bitmap mask just for the peripherals which are only enabled in=
 DT
<br>&gt; (For now I have the pin_bitmap mask in the inmate cell same as the
<br>&gt; root cell) ?
<br>&gt;
<br>&gt; Cheers,
<br>&gt; Prabhakar
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/22820838-b99f-4a2e-9c87-d634c7d376e5n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/22820838-b99f-4a2e-9c87-d634c7d376e5n%40googlegroups.co=
m</a>.<br />

------=_Part_3613_2057144780.1662373591509--

------=_Part_3612_817085746.1662373591509--
