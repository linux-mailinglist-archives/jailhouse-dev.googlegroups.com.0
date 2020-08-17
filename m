Return-Path: <jailhouse-dev+bncBCI7XTXZ6ADBBL7R5H4QKGQEGEEALBQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf3e.google.com (mail-qv1-xf3e.google.com [IPv6:2607:f8b0:4864:20::f3e])
	by mail.lfdr.de (Postfix) with ESMTPS id 08877246666
	for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Aug 2020 14:31:45 +0200 (CEST)
Received: by mail-qv1-xf3e.google.com with SMTP id l18sf10788098qvq.16
        for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Aug 2020 05:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=AmN26XwofOda5PkcPp0frXeQt0OSAxFsM04RP2oSeeg=;
        b=fl4eirycSxXEM1EEB2CTq01dKSaxqQ6xt0je3hRzyDlryVMP3Ev5tZ/yENM0PwYWGX
         d3B0fNl/jNqvrOBAW81CH7x6FITSYcm2mzGRerE69YEfZBA1tnp8lP5IhJuUqdZVfLZi
         /Tcsv9XC7afgVkWjPv0TDm4yKzYuOYg/5obwptLxniDH1LQRYUA6tr51M6Av8V4rUeX7
         kn0qXP38YRRGtN9kmVxBVsIQHH9LCuDh3Z0xLpDa3xzo/VeivR76QOwA1FzW0UuVT7Em
         lOHMbAFaid4wGHw4+q/AA4An8DRL0kEUn1K0EnP5ohGBlKBh5sr7GTn+NRpXsf+1TH9q
         t8IA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=AmN26XwofOda5PkcPp0frXeQt0OSAxFsM04RP2oSeeg=;
        b=BEptmRYDXEy0sWn/KYOHaMMSB9XnVQ3Rr2/YKc/UcU/895EgAauHdBFzIfkba5sbZH
         Zg08hgaL/O324GbS4Ka7GfZqNd8ySCbqX2a5teGuD5x+APGGLQoriAUSqLW2vlE0XUjP
         zXMAScYeUf+9d44fGb4o4I4w/yFB7KNRCzv2qjTl/zAA2T8e9mIcL8j/BcBcvOiEiQ9X
         HvdD5hD8Biz/6qrwZ01OoEfei3C25envNk77R4AtNT7C9XpgyChfLY58CViRztmZzLeu
         EHDE5m9PoczdpUSlm74H9GnfAZMd5pOVN2VHPHShHYOdTZiD0QBAS5zSZh8QCx09+AWb
         4Fcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=AmN26XwofOda5PkcPp0frXeQt0OSAxFsM04RP2oSeeg=;
        b=eyTJo7Ks66DL4+H84Sv5EYnvvfhALR9cFSKnEWrWikq5PX/fz8UDaeJeOTPeHNQqJu
         mvP/P0MzZpAoJpqg+mtFGP8Ldz9NNzovfCDN/JDPaltvhNsSgQMTiG3RMRW+gOpqYB3t
         0PuUfl1ZNIX63OSoQajXpmh/XBgvvnkua4lQWm/wYZnAJ3quqJUiksgq50cF150XHmBX
         7GUmv/ZJgzCgmjjjy5Pt0AH2daGtHLG1cWqI+88IN/rlCVuGymVUMnhtOGJ5+DCJbIg7
         KfVVPblMLLj/2DPBpf95+wkStVW1+GVM2isZuoepF0jyxZtlJdiUZibPX62avwjH+gX+
         lcHw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531KUguryCHedYpuhfTH533nNVZi5YjISYL+iYAGuz+KBGfmua/7
	O/fELH7qfBch8/oAoU2czkE=
X-Google-Smtp-Source: ABdhPJw/4TwWXDygzmPfYZwimcKJOTRg4OYjuWNmMfU6TRviUd3RaaqwIGxOjyRQPdlh1evsUSbUAw==
X-Received: by 2002:aed:3ac7:: with SMTP id o65mr13140379qte.11.1597667503834;
        Mon, 17 Aug 2020 05:31:43 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6214:334:: with SMTP id j20ls4086241qvu.5.gmail; Mon, 17
 Aug 2020 05:31:43 -0700 (PDT)
X-Received: by 2002:a0c:fdeb:: with SMTP id m11mr14218287qvu.103.1597667503124;
        Mon, 17 Aug 2020 05:31:43 -0700 (PDT)
Date: Mon, 17 Aug 2020 05:31:42 -0700 (PDT)
From: stranzjanmarc@gmail.com
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <df0e6993-5f54-4d99-95f6-b3a36ce677d1o@googlegroups.com>
In-Reply-To: <6e9595aa-ae7e-8808-9335-29dbe7345ad6@siemens.com>
References: <cf0c959a-a862-4ef3-80c9-2037c88fad45o@googlegroups.com>
 <ce8b7368-3da1-fc89-d1ea-628b25bec62d@siemens.com>
 <ee6a7e80-c88f-4044-9cf9-209aa0fc8d61o@googlegroups.com>
 <ce82e02e-1b8c-4979-9b3f-8ab0161e067co@googlegroups.com>
 <6e9595aa-ae7e-8808-9335-29dbe7345ad6@siemens.com>
Subject: Re: Starting jailhouse on real hardware without QEMU
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_673_448240465.1597667502373"
X-Original-Sender: stranzjanmarc@gmail.com
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

------=_Part_673_448240465.1597667502373
Content-Type: multipart/alternative; 
	boundary="----=_Part_674_1572980400.1597667502374"

------=_Part_674_1572980400.1597667502374
Content-Type: text/plain; charset="UTF-8"

I booted the Linux PC several times and then always created a new system 
configuration with "sudo jailhouse config create configs/x86/sysconfig.c".

Interestingly, the configuration generated in this way is always slightly 
different!
The following section is always affected:

    /* MemRegion: 100000000-23f1fffff : System RAM */
    {
        .phys_start = 0x100000000,
        .virt_start = 0x100000000,
        .size = 0x13f200000,
        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
            JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
    },
    /* MemRegion: 23f200000-241ffffff : Kernel */
    {
        .phys_start = 0x23f200000,
        .virt_start = 0x23f200000,
        .size = 0x2e00000,
        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
            JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
    },
    /* MemRegion: 242000000-41f37ffff : System RAM */
    {
        .phys_start = 0x242000000,
        .virt_start = 0x242000000,
        .size = 0x1dd380000,
        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
            JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
    },
What can be the reason?
Shouldn't the generated configuration always be the same?

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/df0e6993-5f54-4d99-95f6-b3a36ce677d1o%40googlegroups.com.

------=_Part_674_1572980400.1597667502374
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I booted the Linux PC several times and then always c=
reated a new system configuration with &quot;sudo jailhouse config create c=
onfigs/x86/sysconfig.c&quot;.</div><div><br></div><div>Interestingly, the c=
onfiguration generated in this way is always slightly different!</div><div>=
The following section is always affected:</div><div><br></div><div><span st=
yle=3D"font-family: courier new, monospace;">=C2=A0=C2=A0=C2=A0 /* MemRegio=
n: 100000000-23f1fffff : System RAM */<br>=C2=A0=C2=A0=C2=A0 {<br>=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .phys_start =3D 0x100000000,<br>=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .virt_start =3D 0x100000000,<br>=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .size =3D 0x13f200000,<br>=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_W=
RITE |<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,<br>=C2=A0=C2=A0=C2=A0 },<br>=
=C2=A0=C2=A0=C2=A0 /* MemRegion: 23f200000-241ffffff : Kernel */<br>=C2=A0=
=C2=A0=C2=A0 {<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .phys_start =
=3D 0x23f200000,<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .virt_start =
=3D 0x23f200000,<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .size =3D 0x=
2e00000,<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .flags =3D JAILHOUSE=
_MEM_READ | JAILHOUSE_MEM_WRITE |<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,<b=
r>=C2=A0=C2=A0=C2=A0 },<br>=C2=A0=C2=A0=C2=A0 /* MemRegion: 242000000-41f37=
ffff : System RAM */<br>=C2=A0=C2=A0=C2=A0 {<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 .phys_start =3D 0x242000000,<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 .virt_start =3D 0x242000000,<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 .size =3D 0x1dd380000,<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 JAILHOUSE_MEM_=
EXECUTE | JAILHOUSE_MEM_DMA,<br>=C2=A0=C2=A0=C2=A0 },</span></div><div><spa=
n style=3D"font-family: courier new, monospace;"></span>What can be the rea=
son?<br>Shouldn&#39;t the generated configuration always be the same?</div>=
</div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/df0e6993-5f54-4d99-95f6-b3a36ce677d1o%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/df0e6993-5f54-4d99-95f6-b3a36ce677d1o%40googlegroups.co=
m</a>.<br />

------=_Part_674_1572980400.1597667502374--

------=_Part_673_448240465.1597667502373--
