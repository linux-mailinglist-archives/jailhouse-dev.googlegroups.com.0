Return-Path: <jailhouse-dev+bncBCF23YV2QAERB66P22BQMGQEOVBL47Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63a.google.com (mail-ej1-x63a.google.com [IPv6:2a00:1450:4864:20::63a])
	by mail.lfdr.de (Postfix) with ESMTPS id 2650435E136
	for <lists+jailhouse-dev@lfdr.de>; Tue, 13 Apr 2021 16:17:32 +0200 (CEST)
Received: by mail-ej1-x63a.google.com with SMTP id bn26sf5093375ejb.20
        for <lists+jailhouse-dev@lfdr.de>; Tue, 13 Apr 2021 07:17:32 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1618323452; cv=pass;
        d=google.com; s=arc-20160816;
        b=dRo0Tqre03H5vu/c+//eNKYe+XHK/GNO+87mVFdqZzSRZ9pL1oGzL3nb9L99ewbWbf
         ePrshMWD3PdDAWXeUbjEs4USW6Na6WjTS5KQxf0K0Tmg/OH4/5j5Xp4ClwYzpRunqnpZ
         ReAoObmwXK/ERWDHqP+XvhAkvqjdNbpWTChTvHas4tBp+j/I7rh2ZVRXO09wNkUfKV0Q
         Ca/Sslq1UYyPKu+s6/6grBB5HPGD/ZEJ6DtGyYxwiCAyFzSFGYHjokYrlwnbzY0p0CEO
         PGS6SIJiDLULEa5bIJFeiF+YQaEm5ErdQKXjA1Lo7vemvX2wbCgcaaVCoHn58KLC18HD
         fUvQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=xIsuTWkpq/KWVJC8FR5GSWLtozPDcou42ejbHfdy/YM=;
        b=Hr3EqFUIavoNqkxSC8xWgCoLAjFTk0fTf4FDlARfHHhGWMCSvqqbcXcnh8u2ncT3Cl
         2R/atId3bQFNgOB3xvBiquT+ginZph8hYzaMLiFs1Pwst6UKUGSTU+vBMss0pCNA8C32
         O1bxMx6O3aQz39ojR2QUq3DbafHzoAyCd1dFtry36N+dAkvdahcMl+D7yYJt/Frh/bmO
         ehDF2vfYJgV2HWhlwAG9Xm68tWTVAK7pzOygMqlZnrRn+lRtcGTEaRd3kVXhsMygVKi1
         q+FhAcZQ3sawrsyhMbBjX3HItBxiLfUliMKj/J7LOVoFy1UinIj/Z3IlbdmJzcuEJWb4
         ETCw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=eaOa56Nb;
       spf=pass (google.com: domain of zhuzhuzhuzai@gmail.com designates 2a00:1450:4864:20::42c as permitted sender) smtp.mailfrom=zhuzhuzhuzai@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=xIsuTWkpq/KWVJC8FR5GSWLtozPDcou42ejbHfdy/YM=;
        b=RJ7NO2r1pbHGT9f73wa+8Kmx3aYQglMSPLuKK8I6dWAjbY0QgzihLEPe1Eepj0wbn3
         qJWeRCTl/G/yfQb6KPK8ctryjmXo4oZTgENQVbHXLucyvMiBUkvYZ5PZQzPMn2DXflft
         L9y6W/Wq5k7rjl97n7Jiu35NEOOtoF+qPG3PAyICrobukS8QgJzzaUXIkYIYFAYWIsBY
         ki7sj4r7egnh2VqRtbraIvgs5HlxO0yehZwiYji7X1FXJ+GNSfQ37u0A6yh07Z35EsXg
         7n4gm5tWUeG5QS5CZCR8AOwaotVS9QO9OHYWDqdrDcT1HcejqjMNficyiSg/tglpNDJm
         2jKg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=xIsuTWkpq/KWVJC8FR5GSWLtozPDcou42ejbHfdy/YM=;
        b=f3jtkDOCRU58uv8JH3qYtU7EJ5B10iKy4SpzqAgok/C0ZV4BCnJrC/PKdCBwmege96
         5t4zD6aZw4cdwilnFKWWaPZgHxKQkIB1AbKx9FlZeH8vfO5LPWg8KWBhC2FDcckENWN6
         KC3dkHM0EqucUJo6CL4LNpbFo2+Tqex5OrOBeZr+B8hA31X61s38FTBW+cYf8RbImYJW
         Rzs9EnOjTD7ZkVYMpYxs5rTPb7f+FKzWbunBBXfTvQIwo904d1NuNH7wpvau0Rp9dM8x
         a/F2pfMxBCKc50ZTbpI4o7Ew0PWWksJvJgXFMPrV86bW/b7Jy0HqJM6q7vaB+3lcbTcW
         zHvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=xIsuTWkpq/KWVJC8FR5GSWLtozPDcou42ejbHfdy/YM=;
        b=OKFf2Daa4Mx5O8bTwvif/KW+i4wcffmhDwuqQaVCWX50YGTntDGNA2Xj4eZmgtFg3B
         v27HFq54Yw0eVEhgWP61OV7oQwA+G/b4adaVZ8d/uBSCTQXFL4oIyhrMHDIuRr/hdojK
         tcqOiwvGsQS0DBg1XE6Pzti/2dSPeV51Rg10hb1NeRytIzsBqxtiVdB3fU6fiWHF9Fte
         nilcNX4dl81Bn6+qJE3Pyh/HXU4FnLcGR8S5t+ApZ70W50iRbDrmXKYWKsCfT5gyGGRx
         ZWj8ZI6PMlqHh2a4jIaVnIhWWQ2Q9jupgBXDZ3kfJhi8shRQN9+h0aRktOncWb4j6ZE/
         jfiA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532M9Jh4ZfYTzBY4jK0yP07NaIv4dss7qD6I3A/MTuK6z3rkhbtT
	+a2TYVCk5W46c1JbUcY2kBM=
X-Google-Smtp-Source: ABdhPJyrAJmoBuAj8wwA1kP7ox4Urejba0qdYej+iiuKfI2Bbns48HS8kWEVYEScHI7p8mNo7m1USQ==
X-Received: by 2002:a05:6402:2744:: with SMTP id z4mr35395038edd.347.1618323451901;
        Tue, 13 Apr 2021 07:17:31 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:4d10:: with SMTP id r16ls6816837eju.8.gmail; Tue, 13
 Apr 2021 07:17:30 -0700 (PDT)
X-Received: by 2002:a17:907:d15:: with SMTP id gn21mr31558925ejc.337.1618323450741;
        Tue, 13 Apr 2021 07:17:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618323450; cv=none;
        d=google.com; s=arc-20160816;
        b=ZRmCZFz87P6UACyfptsp7NUyCwTWQ6UZjpeHUTXGlEDChntmqj0mGD3lOdYdvLFTuM
         hGgefb/MGTVPm/0uMXhZUVQpxcVL0+zKe/AXCgEx4umSixf4a1iCOx1ymcsqJZ/tI8hG
         n8Cpfg98iX6aGjPAZ+WMC6Yg9RCD0HyJCd2Bw4a7qg9yhcqTV62lmx3sNaHjGVDg/i5A
         4NwYj3H1ixN2Z2ElFnnm6COZsJE1UJlmpUl4ywLfJlmuHsVc9+rT+taQHXxHI7QHE4fu
         A89z1uqIEtNbneWkLtKDv3z7PEJy7KixvWn5UHUWpeHfW5LLxRj52MZ4kZ0lm1WWzBlY
         DxyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sfuTLLk2Xx/kgBuPQs+rFajPG4eYl8M4+pj7swovfDM=;
        b=dJg9uh7nmBP1dxw0ihzFzrwQUl/ulWNYJwtnocHFUt+DrQPhXBkSwpkPotJjSxrO38
         JUz1kBsDRb1K7hDwGaxjUjB8O6DTBF5xSZxLfKUF3mrQ48P3lc4srMEPEDgrDqEQwQxb
         aIQMChg3av+onQU7SOEc6nxPQTc6sG5jEuSjPiezV2zSgsQNS56zRST7yIWqXkTOIHiM
         xx2GALt4u9EBeZ1/XcVOOxhyngA9/L/STJqdVa54RoTV4y6aqYn2ynr3she5+YZExpGk
         cn2pv9fjvc/ZvAlEnBG5jcm11sdSBXRrw+zLG/xXTAymU0iFiw4Yi/HfgF43qxtS3PBy
         3v3A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=eaOa56Nb;
       spf=pass (google.com: domain of zhuzhuzhuzai@gmail.com designates 2a00:1450:4864:20::42c as permitted sender) smtp.mailfrom=zhuzhuzhuzai@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com. [2a00:1450:4864:20::42c])
        by gmr-mx.google.com with ESMTPS id df6si1106378edb.3.2021.04.13.07.17.30
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Apr 2021 07:17:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhuzhuzhuzai@gmail.com designates 2a00:1450:4864:20::42c as permitted sender) client-ip=2a00:1450:4864:20::42c;
Received: by mail-wr1-x42c.google.com with SMTP id r7so4649212wrm.1
        for <jailhouse-dev@googlegroups.com>; Tue, 13 Apr 2021 07:17:30 -0700 (PDT)
X-Received: by 2002:adf:b1d3:: with SMTP id r19mr16916167wra.97.1618323450419;
 Tue, 13 Apr 2021 07:17:30 -0700 (PDT)
MIME-Version: 1.0
References: <96f74988-49c2-45b7-be31-67bf46c75cedn@googlegroups.com>
 <680669ce-69bb-1403-1c2f-8ccaa317baa9@web.de> <447e0050-c0a1-48b2-8390-2dcfba0fca5dn@googlegroups.com>
 <a33be9b1-5704-26ad-9a75-e7523600d8ab@oth-regensburg.de>
In-Reply-To: <a33be9b1-5704-26ad-9a75-e7523600d8ab@oth-regensburg.de>
From: =?UTF-8?B?5pyx6Iul5Yeh?= <zhuzhuzhuzai@gmail.com>
Date: Tue, 13 Apr 2021 22:17:19 +0800
Message-ID: <CA+nU6V_igzQA+pQ49Ge42zy4ztTB0XkpLa1TZbGGvV-y-BPjZA@mail.gmail.com>
Subject: Re: How to build jailhouse in Raspberry Pi 4b
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: multipart/alternative; boundary="00000000000064dcc805bfdb4ada"
X-Original-Sender: zhuzhuzhuzai@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=eaOa56Nb;       spf=pass
 (google.com: domain of zhuzhuzhuzai@gmail.com designates 2a00:1450:4864:20::42c
 as permitted sender) smtp.mailfrom=zhuzhuzhuzai@gmail.com;       dmarc=pass
 (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

--00000000000064dcc805bfdb4ada
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

thanks a lot!
I have finished my work. I build on RPI4 successfully!! that's what you
mean ,via device-tree.

Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de> =E4=BA=8E2021=E5=B9=B44=E6=
=9C=8813=E6=97=A5=E5=91=A8=E4=BA=8C =E4=B8=8B=E5=8D=887:29=E5=86=99=E9=81=
=93=EF=BC=9A

> Hi =E6=9C=B1=E8=8B=A5=E5=87=A1,
>
> On 13/04/2021 09:18, =E6=9C=B1=E8=8B=A5=E5=87=A1 wrote:
> >
> > Hello!
> > I success build it now with linux jailhouse-enabling-5.4-rpi kernel. Bu=
t
> > I can't enable the jailhouse . dmesg tells I didn't reserve
> > mem_regions,  while I did use mem=3D768M in cmdline .
>
> I never used jailhouse in RPi, but as far as i can see, the reservation
> comes via device tree and not via cmdline [1, 2].
>
>   Ralf
>
> [1] https://github.com/siemens/jailhouse/blob/master/configs/arm64
> /rpi4.c#L14
> <https://github.com/siemens/jailhouse/blob/master/configs/arm64/rpi4.c#L1=
4>
> [2]
>
> https://github.com/siemens/jailhouse-images/blob/master/recipes-bsp/rpi-f=
irmware/files/debian/jailhouse.dts#L15
>
> >
> > =E5=9C=A82021=E5=B9=B44=E6=9C=8812=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=80 =
UTC+8 =E4=B8=8B=E5=8D=889:25:54<Jan Kiszka> =E5=86=99=E9=81=93=EF=BC=9A
> >
> >     On 11.04.21 05:20, =E6=9C=B1=E8=8B=A5=E5=87=A1 wrote:
> >     > I just want to build jailhouse in my Raspberry Pi 4b which is
> >     supported
> >     > arm64. If jailhouse is support Raspberry Pi 4b arm board now? If
> >     there
> >     > is any page for how to build it in Raspberry Pi? Can some one hel=
p
> >     me ?
> >     > Thanks very much!
> >     >
> >
> >     You mean use 32-bit ARM on the RPi4 with Jailhouse. Might work with
> the
> >     existing configurations as well, never tried. But what would that b=
e
> >     good for? 32-bit is slowly fading out, arm64 is standard on hardwar=
e
> >     that supports it (downstream raspi does 32-bit only for legacy
> reasons,
> >     some images for old hardware).
> >
> >     Jan
> >
> > --
> > You received this message because you are subscribed to the Google
> > Groups "Jailhouse" group.
> > To unsubscribe from this group and stop receiving emails from it, send
> > an email to jailhouse-dev+unsubscribe@googlegroups.com
> > <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> > To view this discussion on the web visit
> >
> https://groups.google.com/d/msgid/jailhouse-dev/447e0050-c0a1-48b2-8390-2=
dcfba0fca5dn%40googlegroups.com
> > <
> https://groups.google.com/d/msgid/jailhouse-dev/447e0050-c0a1-48b2-8390-2=
dcfba0fca5dn%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter
> >.
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/CA%2BnU6V_igzQA%2BpQ49Ge42zy4ztTB0XkpLa1TZbGGvV-y-BPjZA%40mai=
l.gmail.com.

--00000000000064dcc805bfdb4ada
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">thanks a lot!<div>I have finished my work. I build on RPI4=
 successfully!! that&#39;s what you mean ,via device-tree.</div></div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Ralf Ramsau=
er &lt;<a href=3D"mailto:ralf.ramsauer@oth-regensburg.de">ralf.ramsauer@oth=
-regensburg.de</a>&gt; =E4=BA=8E2021=E5=B9=B44=E6=9C=8813=E6=97=A5=E5=91=A8=
=E4=BA=8C =E4=B8=8B=E5=8D=887:29=E5=86=99=E9=81=93=EF=BC=9A<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Hi =E6=9C=B1=E8=8B=A5=E5=87=A1,=
<br>
<br>
On 13/04/2021 09:18, =E6=9C=B1=E8=8B=A5=E5=87=A1 wrote:<br>
&gt; <br>
&gt; Hello!<br>
&gt; I success build it now with linux jailhouse-enabling-5.4-rpi kernel. B=
ut<br>
&gt; I can&#39;t enable the jailhouse . dmesg tells I didn&#39;t reserve<br=
>
&gt; mem_regions,=C2=A0 while I did use mem=3D768M in cmdline .<br>
<br>
I never used jailhouse in RPi, but as far as i can see, the reservation<br>
comes via device tree and not via cmdline [1, 2].<br>
<br>
=C2=A0 Ralf<br>
<br>
[1] <a href=3D"https://github.com/siemens/jailhouse/blob/master/configs/arm=
64/rpi4.c#L14" rel=3D"noreferrer" target=3D"_blank">https://github.com/siem=
ens/jailhouse/blob/master/configs/arm64<br>
/rpi4.c#L14</a><br>
[2]<br>
<a href=3D"https://github.com/siemens/jailhouse-images/blob/master/recipes-=
bsp/rpi-firmware/files/debian/jailhouse.dts#L15" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/siemens/jailhouse-images/blob/master/recipes=
-bsp/rpi-firmware/files/debian/jailhouse.dts#L15</a><br>
<br>
&gt; <br>
&gt; =E5=9C=A82021=E5=B9=B44=E6=9C=8812=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=80=
 UTC+8 =E4=B8=8B=E5=8D=889:25:54&lt;Jan Kiszka&gt; =E5=86=99=E9=81=93=EF=BC=
=9A<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 11.04.21 05:20, =E6=9C=B1=E8=8B=A5=E5=87=A1 wrot=
e:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; I just want to build jailhouse in my=C2=A0Rasp=
berry Pi 4b which is<br>
&gt;=C2=A0 =C2=A0 =C2=A0supported<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; arm64. If jailhouse is support Raspberry Pi 4b=
 arm board now? If<br>
&gt;=C2=A0 =C2=A0 =C2=A0there<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; is any page for how to build it in Raspberry P=
i? Can some one help<br>
&gt;=C2=A0 =C2=A0 =C2=A0me ?<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Thanks very much!<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0You mean use 32-bit ARM on the RPi4 with Jailhouse.=
 Might work with the<br>
&gt;=C2=A0 =C2=A0 =C2=A0existing configurations as well, never tried. But w=
hat would that be<br>
&gt;=C2=A0 =C2=A0 =C2=A0good for? 32-bit is slowly fading out, arm64 is sta=
ndard on hardware<br>
&gt;=C2=A0 =C2=A0 =C2=A0that supports it (downstream raspi does 32-bit only=
 for legacy reasons,<br>
&gt;=C2=A0 =C2=A0 =C2=A0some images for old hardware).<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Jan<br>
&gt; <br>
&gt; -- <br>
&gt; You received this message because you are subscribed to the Google<br>
&gt; Groups &quot;Jailhouse&quot; group.<br>
&gt; To unsubscribe from this group and stop receiving emails from it, send=
<br>
&gt; an email to <a href=3D"mailto:jailhouse-dev%2Bunsubscribe@googlegroups=
.com" target=3D"_blank">jailhouse-dev+unsubscribe@googlegroups.com</a><br>
&gt; &lt;mailto:<a href=3D"mailto:jailhouse-dev%2Bunsubscribe@googlegroups.=
com" target=3D"_blank">jailhouse-dev+unsubscribe@googlegroups.com</a>&gt;.<=
br>
&gt; To view this discussion on the web visit<br>
&gt; <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/447e0050-c0=
a1-48b2-8390-2dcfba0fca5dn%40googlegroups.com" rel=3D"noreferrer" target=3D=
"_blank">https://groups.google.com/d/msgid/jailhouse-dev/447e0050-c0a1-48b2=
-8390-2dcfba0fca5dn%40googlegroups.com</a><br>
&gt; &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/447e005=
0-c0a1-48b2-8390-2dcfba0fca5dn%40googlegroups.com?utm_medium=3Demail&amp;ut=
m_source=3Dfooter" rel=3D"noreferrer" target=3D"_blank">https://groups.goog=
le.com/d/msgid/jailhouse-dev/447e0050-c0a1-48b2-8390-2dcfba0fca5dn%40google=
groups.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a>&gt;.<br>
</blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CA%2BnU6V_igzQA%2BpQ49Ge42zy4ztTB0XkpLa1TZbGGvV-y-=
BPjZA%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://grou=
ps.google.com/d/msgid/jailhouse-dev/CA%2BnU6V_igzQA%2BpQ49Ge42zy4ztTB0XkpLa=
1TZbGGvV-y-BPjZA%40mail.gmail.com</a>.<br />

--00000000000064dcc805bfdb4ada--
