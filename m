Return-Path: <jailhouse-dev+bncBCPOXAO4SYIBBKMFUDZAKGQE6E3WDRY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-io1-xd3c.google.com (mail-io1-xd3c.google.com [IPv6:2607:f8b0:4864:20::d3c])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A2E15FEDE
	for <lists+jailhouse-dev@lfdr.de>; Sat, 15 Feb 2020 15:39:38 +0100 (CET)
Received: by mail-io1-xd3c.google.com with SMTP id p4sf8826648ioo.4
        for <lists+jailhouse-dev@lfdr.de>; Sat, 15 Feb 2020 06:39:38 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1581777577; cv=pass;
        d=google.com; s=arc-20160816;
        b=eq2Dxzv8gvOzBVFL6l3U+BVb9FNX5Bvw7e+077yH8lI4Fg8KKbO8AFanNLYOS+1037
         prEb99JFiteFDxu9kFvOV/sDOc8Qa0kqhqh/hOM60s7HCqMe3+ltFbS9ZSdoH0SifAmx
         pFIAs4+sSmSEU5T1PAByeRnFfnlLFwRhZKJh/3FchigTC1fe+UgPOwWufiNzQrUa9Jgu
         QdsjkGacMyjeHQMUVx/20t9nTMryg7te+EvaWdCokc5QBmP8oY8bEKImYXkLrQCd0ATZ
         AbWyUudiwrlVCYfl95HBHFZ0hCt24rfJMAKBOoCawfk0U32esytdrYvtXL4viQWB8dOL
         AAnA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=PWXJUrE/qV5c6VVq235FlGVBKsjp4tG3Iq3syTz6IV4=;
        b=Gww+9dIiKWKt03edC2sMOJGd9dC8wPqvJAL9cKnap2f7z9s3QnEu805RyjHsJTJafD
         VXnohV38d26OPC53p5CCHbKLcHulwda1nyBOIJd3QgD4qrZpALuJya2IaPcJHPNjA16O
         jGLoLwEJby+U/ls/D0m3Ht7q5pt60Bzw6CJnau6zM2Pzg0F8MQzIxXpkSQNTVExUpx/w
         TB+UAlFgRAbfYgtyhdZicZs/UMJ8dcoimtOk13XbWDu2GLTltI+55kbhsZytpa0CaZPA
         h4tSN7jEdjrJhwmFGpT2wCj04BrufDbfntOGj+phLr+8rpFSM0ACZ9ip/2Db+8fzofNK
         4zBw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=GfEusj+7;
       spf=pass (google.com: domain of vijaikumar.kanagarajan@gmail.com designates 2607:f8b0:4864:20::842 as permitted sender) smtp.mailfrom=vijaikumar.kanagarajan@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=PWXJUrE/qV5c6VVq235FlGVBKsjp4tG3Iq3syTz6IV4=;
        b=dFMBFQL82jmwWGK25vbPI6XcqxGiL4aGHCzOSN81dxqFr6QzCzaFfRsZO60GD8Vink
         Ccrm7A7fL0KNTiZY6MIQJc+ktqwxfRwid2UBKC2774rH1L5XlFrikrf0bAM2Tyj7NPg1
         Ph8rEK1pYih964sD7PHCyQiEouF09ekRCX0JgTA2Dbq31tvQLGXuXwmeZrZIsnb40WY9
         DNHo5pHusyMgKemdfN5FdrEZkw0+oMPM4H0zgDndH8N/K3ifw103dwCHZPSTFmPtSF2h
         uXLQ0SP1HWnXTAAjdvyujlBRcUXVOdiBe1pH/RRu6rHqTCOlSPAxJFBm6ilsxkEQVFiW
         eHNg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=PWXJUrE/qV5c6VVq235FlGVBKsjp4tG3Iq3syTz6IV4=;
        b=LmdmtT1jkham2ChpuKR30D4bRdJwcjGkiTLEcX7vNa0hu8ewRbyxpl4MZvFqNp881F
         /0slmkpJCv0AuYvAKJlhJThg2AxbFf2votVQw+pIRBUSCOxBd7WpU85IXCdg1HbU9C1K
         isnpDlPbvA5QPGCzBlR80OVJ8vmyj5/isLf6XbnyZvFwLwY/aNUHukbrhAyaxEyvsX3J
         kWcvhrfR92zBo6p97Fx6SMaZWhg69ICR2IZdlVxY5RPmLS6WOZuBoO7UNke72iDtpzPK
         3gBS7QYLIxTD6c/UQlCVL2FdbCkZrwUxp65T6bDNtp7nVAvNSlgMp3lAC0aHb+2h7EE5
         4WbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=PWXJUrE/qV5c6VVq235FlGVBKsjp4tG3Iq3syTz6IV4=;
        b=DdXaDR5GUWNplElnELJxgBPYNceFEfKLJ6cFMrarzmCXEKEdoRUTEZ1U6k9attvGCe
         Hc9t4FlgHY2PaPcnuiPgk82qa2Lf2I2Y2S5wJ9KUi0BADDXZPYoYQwsFneGuodDK3vAX
         k4L4ohzX23T9OEp/WkZJ2OhRnF9ZqOuQ6cDwBPAYB9WK0HRLzAZOwBpa5ntadP4o0VOz
         54iehhJcySr9JvlQREKRYqM6UBKG0OODjuweGrRdE3BiY/r65kS25uqhp0oIfNocBamI
         sgAYKRBB9eMrFPQodXu1xAfygKqIXH7s3JBx2xjY4tnBpIJwLcGcugoNSeyvYiR7gC1d
         LJ8g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUsTYdc7Uc8RQxMg8Ltpp8Icudz8/nT/q8m3sQCHognWVIGO0ze
	atiCg+agsCNK/9Q4mlge2Ug=
X-Google-Smtp-Source: APXvYqww9BxpUVrhlggcXQcyM7H5xshtjN9Qy94UekiRrL8ji2McjBlxpB+StVfI9Aa9C120mQGJ0g==
X-Received: by 2002:a92:3611:: with SMTP id d17mr7762474ila.264.1581777577435;
        Sat, 15 Feb 2020 06:39:37 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a92:2907:: with SMTP id l7ls1204797ilg.8.gmail; Sat, 15 Feb
 2020 06:39:36 -0800 (PST)
X-Received: by 2002:a92:4e:: with SMTP id 75mr7365933ila.276.1581777576849;
        Sat, 15 Feb 2020 06:39:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581777576; cv=none;
        d=google.com; s=arc-20160816;
        b=Q7jzUvjS/NHGf4VqSLztPzfkkwSw4SLfbTtOyBBgkdY+I5XnHojPjfTXyyX0MJzfJ8
         Fyoc8OVRSA/kIOrmXL41f+KTy6kT7hx3dFwmpmh7nmtgrqhfQOAggdl14o+Ske4GvuBk
         +8NshIw9bnuc0Ls8ilZlAa4eNQpeRaDYZNzJdhqueiZkvlVZP+qD5rrz9zF+OrLyvdUP
         XLvE0oP39z+O54t7ZxnYP+/+FLiyBWwdc2uHrHPvBfKQElZ+QaScICocmCKzLJxRXhYE
         DzinSoYHrynSK0ASmTgRAouyLPSL9+joR84CndzczE1c/dfM6BMMlfNoQAu0Qpi0p658
         scVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SUDkad5Eh2SiXtI8li+lLUHiq6nFGuW8X4S3mht9rp0=;
        b=OFx3KvrySnQcDpLIqgvj9xAxKFTRejlqFuCQiID8MUgVXOuVKoRW7e5FbXzPnkK7E6
         g5cNA6Yx/aCEjdN8R74ZCqd3QoRF8eN5ToLhBAOmdO+fbXNrsK9yRpx5WX8P3k387CCT
         9VICdDH/dQaAm8zHYR15nWgalawy31PfvDikAkk3Jj62X1osWi6XWWGYAOQpMsyXiLBV
         uQBPA/4wR4HQB8sA030/VRHp3G+kbop4swT5/3PVeRW4Zy/Vyot/03Ab1lb/+6bqOv8v
         4UY54UbPaueQ610dObrNLI2c96GzHotbZJZc/tR55uHIqwJIooawpft2ttOFyEH2XLJO
         vvXA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=GfEusj+7;
       spf=pass (google.com: domain of vijaikumar.kanagarajan@gmail.com designates 2607:f8b0:4864:20::842 as permitted sender) smtp.mailfrom=vijaikumar.kanagarajan@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com. [2607:f8b0:4864:20::842])
        by gmr-mx.google.com with ESMTPS id i4si459449ioi.1.2020.02.15.06.39.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Feb 2020 06:39:36 -0800 (PST)
Received-SPF: pass (google.com: domain of vijaikumar.kanagarajan@gmail.com designates 2607:f8b0:4864:20::842 as permitted sender) client-ip=2607:f8b0:4864:20::842;
Received: by mail-qt1-x842.google.com with SMTP id r5so8997108qtt.9
        for <jailhouse-dev@googlegroups.com>; Sat, 15 Feb 2020 06:39:36 -0800 (PST)
X-Received: by 2002:aed:3eee:: with SMTP id o43mr6725007qtf.33.1581777576267;
 Sat, 15 Feb 2020 06:39:36 -0800 (PST)
MIME-Version: 1.0
References: <276d18e9-3f9b-4b93-8f5b-7223a4bea0f5@googlegroups.com>
 <20200214162440.27509-1-vijaikumar.kanagarajan@gmail.com> <20200214162440.27509-4-vijaikumar.kanagarajan@gmail.com>
 <c7a38ec3-253d-23a2-c470-19b6ca2ee22d@web.de>
In-Reply-To: <c7a38ec3-253d-23a2-c470-19b6ca2ee22d@web.de>
From: vijai kumar <vijaikumar.kanagarajan@gmail.com>
Date: Sat, 15 Feb 2020 20:09:24 +0530
Message-ID: <CALLGG_L3c5=g35XOnG79mC3ksKAFqBdwp6EUDqVRqg+zQewv0g@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] Enable pine64-plus support
To: Jan Kiszka <jan.kiszka@web.de>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: multipart/alternative; boundary="0000000000008c13d6059e9e4abc"
X-Original-Sender: vijaikumar.kanagarajan@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=GfEusj+7;       spf=pass
 (google.com: domain of vijaikumar.kanagarajan@gmail.com designates
 2607:f8b0:4864:20::842 as permitted sender) smtp.mailfrom=vijaikumar.kanagarajan@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

--0000000000008c13d6059e9e4abc
Content-Type: text/plain; charset="UTF-8"

On Sat 15 Feb, 2020, 8:02 PM Jan Kiszka, <jan.kiszka@web.de> wrote:

> On 14.02.20 17:24, Vijai Kumar K wrote:
> > - Add the necessary machine, multiconfig and wks file.
> > - Add entry in images list.
> > - Add info in README.
> >
> > Signed-off-by: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
> > ---
> >   README.md                                     |  6 ++++++
> >   conf/machine/pine64-plus.conf                 | 19 +++++++++++++++++++
> >   .../pine64-plus-jailhouse-demo.conf           | 14 ++++++++++++++
> >   images.list                                   |  1 +
> >   wic/pine64-plus.wks                           | 16 ++++++++++++++++
> >   5 files changed, 56 insertions(+)
> >   create mode 100644 conf/machine/pine64-plus.conf
> >   create mode 100644 conf/multiconfig/pine64-plus-jailhouse-demo.conf
> >   create mode 100644 wic/pine64-plus.wks
> >
> > diff --git a/README.md b/README.md
> > index 8841513..99d9f0d 100644
> > --- a/README.md
> > +++ b/README.md
> > @@ -115,6 +115,12 @@ is support. You can boot the board directly from
> the generated SD card image.
> >   The mini UART on the GPIO header (pin 6/8/10: Ground/TXD/RXD) is used
> as serial
> >   console.
> >
> > +## Pine64+
> > +
> > +The [Pine64+](
> https://www.pine64.org/devices/single-board-computers/pine-a64/)
> > +with Allwinner A64 is supported with its 2GB edition. You can boot the
> board
> > +directly from the generated SD card image. UART0 available via EXP 10
> connector
> > +(pin 7/8/9: TXD/RXD/GND) is used as serial console. For details refer
> [here](https://linux-sunxi.org/Pine64#Serial_port_.2F_UART).
> >
> >   Community Resources
> >   -------------------
> > diff --git a/conf/machine/pine64-plus.conf
> b/conf/machine/pine64-plus.conf
> > new file mode 100644
> > index 0000000..0949ab4
> > --- /dev/null
> > +++ b/conf/machine/pine64-plus.conf
> > @@ -0,0 +1,19 @@
> > +#
> > +# Jailhouse, a Linux-based partitioning hypervisor
> > +#
> > +# Copyright (c) Vijai Kumar K, 2020
> > +#
> > +# Authors:
> > +#  Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
> > +#
> > +# SPDX-License-Identifier: MIT
> > +#
> > +
> > +DISTRO_ARCH = "arm64"
> > +
> > +IMAGE_TYPE = "wic-img"
> > +IMAGER_INSTALL += "u-boot-pine64-plus"
> > +IMAGER_BUILD_DEPS += "u-boot-pine64-plus"
> > +PREFERRED_PROVIDER_u-boot-pine64-plus = "u-boot-pine64-plus"
> > +
> > +IMAGE_INSTALL += "u-boot-script"
> > diff --git a/conf/multiconfig/pine64-plus-jailhouse-demo.conf
> b/conf/multiconfig/pine64-plus-jailhouse-demo.conf
> > new file mode 100644
> > index 0000000..5e66c94
> > --- /dev/null
> > +++ b/conf/multiconfig/pine64-plus-jailhouse-demo.conf
> > @@ -0,0 +1,14 @@
> > +#
> > +# Jailhouse, a Linux-based partitioning hypervisor
> > +#
> > +# Copyright (c) Vijai Kumar K, 2020
> > +#
> > +# Authors:
> > +#  Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
> > +#
> > +# SPDX-License-Identifier: MIT
> > +#
> > +#
> > +MACHINE = "pine64-plus"
> > +
> > +DISTRO = "jailhouse-demo"
> > diff --git a/images.list b/images.list
> > index 26a802d..b794d85 100644
> > --- a/images.list
> > +++ b/images.list
> > @@ -7,3 +7,4 @@ macchiatobin  Marvell MACCHIATObin
> >   hikey620    LeMaker HiKey (Kirin 620 SoC, 2 GB edition)
> >   ultra96             Avnet Ultra96
> >   rpi4                Raspberry Pi 4 (1 GB edition)
> > +pine64-plus  Pine64+ (Allwinner A64, 2GB edition)
> > diff --git a/wic/pine64-plus.wks b/wic/pine64-plus.wks
> > new file mode 100644
> > index 0000000..aacca04
> > --- /dev/null
> > +++ b/wic/pine64-plus.wks
> > @@ -0,0 +1,16 @@
> > +#
> > +# Jailhouse, a Linux-based partitioning hypervisor
> > +#
> > +# Copyright (c) Vijai Kumar K, 2020
> > +#
> > +# Authors:
> > +#  Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
> > +#
> > +# SPDX-License-Identifier: MIT
> > +#
> > +
> > +part u-boot --source rawcopy --sourceparams
> "file=/usr/lib/u-boot/pine64-plus/u-boot-sunxi-with-spl.bin" --no-table
> --align 8
> > +
> > +part / --source rootfs-u-boot --ondisk mmcblk0 --fstype ext4 --label
> platform --align 1024
> > +
> > +bootloader --append "rootwait mem=1792M"
> >
>
> Thanks, I've merged all 4 to next. But we need some tuning: The config
> files only come via --latest, not via the default 0.12 release build. We
> can either carry the backported patches from upstream in the 0.12 recipe
> or describe the limitation in the documentation until the next release
> is out.
>

I would say let's back-port it. I'll send a patch on that.

Thanks,
Vijai Kumar K


> Jan
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CALLGG_L3c5%3Dg35XOnG79mC3ksKAFqBdwp6EUDqVRqg%2BzQewv0g%40mail.gmail.com.

--0000000000008c13d6059e9e4abc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Sat 15 Feb, 2020, 8:02 PM Jan Kiszka, &lt;<a href=
=3D"mailto:jan.kiszka@web.de">jan.kiszka@web.de</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">On 14.02.20 17:24, Vijai Kumar K wrote:<br>
&gt; - Add the necessary machine, multiconfig and wks file.<br>
&gt; - Add entry in images list.<br>
&gt; - Add info in README.<br>
&gt;<br>
&gt; Signed-off-by: Vijai Kumar K &lt;<a href=3D"mailto:vijaikumar.kanagara=
jan@gmail.com" target=3D"_blank" rel=3D"noreferrer">vijaikumar.kanagarajan@=
gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0README.md=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 6 ++++++<br>
&gt;=C2=A0 =C2=A0conf/machine/pine64-plus.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 19 +++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0.../pine64-plus-jailhouse-demo.conf=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 14 ++++++++++++++<br>
&gt;=C2=A0 =C2=A0images.list=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 1 +<br>
&gt;=C2=A0 =C2=A0wic/pine64-plus.wks=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 16 +++++++++++=
+++++<br>
&gt;=C2=A0 =C2=A05 files changed, 56 insertions(+)<br>
&gt;=C2=A0 =C2=A0create mode 100644 conf/machine/pine64-plus.conf<br>
&gt;=C2=A0 =C2=A0create mode 100644 conf/multiconfig/pine64-plus-jailhouse-=
demo.conf<br>
&gt;=C2=A0 =C2=A0create mode 100644 wic/pine64-plus.wks<br>
&gt;<br>
&gt; diff --git a/README.md b/README.md<br>
&gt; index 8841513..99d9f0d 100644<br>
&gt; --- a/README.md<br>
&gt; +++ b/README.md<br>
&gt; @@ -115,6 +115,12 @@ is support. You can boot the board directly from =
the generated SD card image.<br>
&gt;=C2=A0 =C2=A0The mini UART on the GPIO header (pin 6/8/10: Ground/TXD/R=
XD) is used as serial<br>
&gt;=C2=A0 =C2=A0console.<br>
&gt;<br>
&gt; +## Pine64+<br>
&gt; +<br>
&gt; +The [Pine64+](<a href=3D"https://www.pine64.org/devices/single-board-=
computers/pine-a64/" rel=3D"noreferrer noreferrer" target=3D"_blank">https:=
//www.pine64.org/devices/single-board-computers/pine-a64/</a>)<br>
&gt; +with Allwinner A64 is supported with its 2GB edition. You can boot th=
e board<br>
&gt; +directly from the generated SD card image. UART0 available via EXP 10=
 connector<br>
&gt; +(pin 7/8/9: TXD/RXD/GND) is used as serial console. For details refer=
 [here](<a href=3D"https://linux-sunxi.org/Pine64#Serial_port_.2F_UART" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://linux-sunxi.org/Pine64=
#Serial_port_.2F_UART</a>).<br>
&gt;<br>
&gt;=C2=A0 =C2=A0Community Resources<br>
&gt;=C2=A0 =C2=A0-------------------<br>
&gt; diff --git a/conf/machine/pine64-plus.conf b/conf/machine/pine64-plus.=
conf<br>
&gt; new file mode 100644<br>
&gt; index 0000000..0949ab4<br>
&gt; --- /dev/null<br>
&gt; +++ b/conf/machine/pine64-plus.conf<br>
&gt; @@ -0,0 +1,19 @@<br>
&gt; +#<br>
&gt; +# Jailhouse, a Linux-based partitioning hypervisor<br>
&gt; +#<br>
&gt; +# Copyright (c) Vijai Kumar K, 2020<br>
&gt; +#<br>
&gt; +# Authors:<br>
&gt; +#=C2=A0 Vijai Kumar K &lt;<a href=3D"mailto:vijaikumar.kanagarajan@gm=
ail.com" target=3D"_blank" rel=3D"noreferrer">vijaikumar.kanagarajan@gmail.=
com</a>&gt;<br>
&gt; +#<br>
&gt; +# SPDX-License-Identifier: MIT<br>
&gt; +#<br>
&gt; +<br>
&gt; +DISTRO_ARCH =3D &quot;arm64&quot;<br>
&gt; +<br>
&gt; +IMAGE_TYPE =3D &quot;wic-img&quot;<br>
&gt; +IMAGER_INSTALL +=3D &quot;u-boot-pine64-plus&quot;<br>
&gt; +IMAGER_BUILD_DEPS +=3D &quot;u-boot-pine64-plus&quot;<br>
&gt; +PREFERRED_PROVIDER_u-boot-pine64-plus =3D &quot;u-boot-pine64-plus&qu=
ot;<br>
&gt; +<br>
&gt; +IMAGE_INSTALL +=3D &quot;u-boot-script&quot;<br>
&gt; diff --git a/conf/multiconfig/pine64-plus-jailhouse-demo.conf b/conf/m=
ulticonfig/pine64-plus-jailhouse-demo.conf<br>
&gt; new file mode 100644<br>
&gt; index 0000000..5e66c94<br>
&gt; --- /dev/null<br>
&gt; +++ b/conf/multiconfig/pine64-plus-jailhouse-demo.conf<br>
&gt; @@ -0,0 +1,14 @@<br>
&gt; +#<br>
&gt; +# Jailhouse, a Linux-based partitioning hypervisor<br>
&gt; +#<br>
&gt; +# Copyright (c) Vijai Kumar K, 2020<br>
&gt; +#<br>
&gt; +# Authors:<br>
&gt; +#=C2=A0 Vijai Kumar K &lt;<a href=3D"mailto:vijaikumar.kanagarajan@gm=
ail.com" target=3D"_blank" rel=3D"noreferrer">vijaikumar.kanagarajan@gmail.=
com</a>&gt;<br>
&gt; +#<br>
&gt; +# SPDX-License-Identifier: MIT<br>
&gt; +#<br>
&gt; +#<br>
&gt; +MACHINE =3D &quot;pine64-plus&quot;<br>
&gt; +<br>
&gt; +DISTRO =3D &quot;jailhouse-demo&quot;<br>
&gt; diff --git a/images.list b/images.list<br>
&gt; index 26a802d..b794d85 100644<br>
&gt; --- a/images.list<br>
&gt; +++ b/images.list<br>
&gt; @@ -7,3 +7,4 @@ macchiatobin=C2=A0 Marvell MACCHIATObin<br>
&gt;=C2=A0 =C2=A0hikey620=C2=A0 =C2=A0 LeMaker HiKey (Kirin 620 SoC, 2 GB e=
dition)<br>
&gt;=C2=A0 =C2=A0ultra96=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Avn=
et Ultra96<br>
&gt;=C2=A0 =C2=A0rpi4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 Raspberry Pi 4 (1 GB edition)<br>
&gt; +pine64-plus=C2=A0 Pine64+ (Allwinner A64, 2GB edition)<br>
&gt; diff --git a/wic/pine64-plus.wks b/wic/pine64-plus.wks<br>
&gt; new file mode 100644<br>
&gt; index 0000000..aacca04<br>
&gt; --- /dev/null<br>
&gt; +++ b/wic/pine64-plus.wks<br>
&gt; @@ -0,0 +1,16 @@<br>
&gt; +#<br>
&gt; +# Jailhouse, a Linux-based partitioning hypervisor<br>
&gt; +#<br>
&gt; +# Copyright (c) Vijai Kumar K, 2020<br>
&gt; +#<br>
&gt; +# Authors:<br>
&gt; +#=C2=A0 Vijai Kumar K &lt;<a href=3D"mailto:vijaikumar.kanagarajan@gm=
ail.com" target=3D"_blank" rel=3D"noreferrer">vijaikumar.kanagarajan@gmail.=
com</a>&gt;<br>
&gt; +#<br>
&gt; +# SPDX-License-Identifier: MIT<br>
&gt; +#<br>
&gt; +<br>
&gt; +part u-boot --source rawcopy --sourceparams &quot;file=3D/usr/lib/u-b=
oot/pine64-plus/u-boot-sunxi-with-spl.bin&quot; --no-table --align 8<br>
&gt; +<br>
&gt; +part / --source rootfs-u-boot --ondisk mmcblk0 --fstype ext4 --label =
platform --align 1024<br>
&gt; +<br>
&gt; +bootloader --append &quot;rootwait mem=3D1792M&quot;<br>
&gt;<br>
<br>
Thanks, I&#39;ve merged all 4 to next. But we need some tuning: The config<=
br>
files only come via --latest, not via the default 0.12 release build. We<br=
>
can either carry the backported patches from upstream in the 0.12 recipe<br=
>
or describe the limitation in the documentation until the next release<br>
is out.<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D=
"auto">I would say let&#39;s back-port it. I&#39;ll send a patch on that.</=
div><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks,</div><div dir=3D"=
auto">Vijai Kumar K</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div=
 class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Jan<br>
</blockquote></div></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CALLGG_L3c5%3Dg35XOnG79mC3ksKAFqBdwp6EUDqVRqg%2BzQ=
ewv0g%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://grou=
ps.google.com/d/msgid/jailhouse-dev/CALLGG_L3c5%3Dg35XOnG79mC3ksKAFqBdwp6EU=
DqVRqg%2BzQewv0g%40mail.gmail.com</a>.<br />

--0000000000008c13d6059e9e4abc--
