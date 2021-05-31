Return-Path: <jailhouse-dev+bncBD2KJCOQRYJRBF6F2KCQMGQEB6WI2SQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x239.google.com (mail-oi1-x239.google.com [IPv6:2607:f8b0:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id 5480B395752
	for <lists+jailhouse-dev@lfdr.de>; Mon, 31 May 2021 10:47:21 +0200 (CEST)
Received: by mail-oi1-x239.google.com with SMTP id r194-20020acaa8cb0000b02901f15926212dsf2663977oie.12
        for <lists+jailhouse-dev@lfdr.de>; Mon, 31 May 2021 01:47:21 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1622450840; cv=pass;
        d=google.com; s=arc-20160816;
        b=EArYUsmAmqWnHaKisV+z6M4FCxgcTHXy0v+F6qZ7StKBWGZFKpWNirnp5yv4t/vbsg
         uIIwizMdjRQyoGpAhubGtAwmAIitFORdRqLxQfIxA2XiX1wlNJnM9n9zrKDqmzk64g7I
         MV6YWQcbFCT2urrqheR75zAO9I2SYGk9wRwo2B2efKNgJIafI8dcJ6NT79iEz5/uS0Sl
         wRUEFXqQMe2jHzZZbxqYaYrSDEpV0AOm+cIZvjb9pzVnOzl8oQ0w4SIgspsoQw6w+pGN
         m8/tRoe2y6vSJAzgrz8uzqEQNULHx7J4GQCu6HjsyHfu4U7mTZ9SkhNJJjLKu325NKe1
         AQlQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature;
        bh=j/jFwfdXgrnSa+YHjILVVCKe4GX66Sn5K0eOkdiDaKs=;
        b=nXo+o1uu4tYtpprHIOQJdNNpAv9wwPCkLmgBU2LG+miLix4UEu9MbR1kvGUeeHJUFh
         hq9mLCo//xgoJCQ2JDcZhvHtC1fIUoUjQjh4bBWquMhW263jFyyv/1klv1/TpFzziFEY
         LyaRqNmMvoi+7DznVDoohCsL54+p/BBwv5myK0KY4Qewt/ThAdp8ZypoQYjSJza/rpLm
         +oZcHWXTk2eOWF15aobSRz+fs1Z2zHAgY2jHHtk0iP4tz5RUBqslFcSq+rcGddKavGQ8
         9QfgyvI9tXgyq09bFa/eypUTBMQFWQlmlnmtqTbLkLFJxPj3jKNXYnYW3YU8b0gyUWRO
         TTmw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@cimware-in.20150623.gappssmtp.com header.s=20150623 header.b=hnPMas9w;
       spf=pass (google.com: domain of kannan@cimware.in designates 2607:f8b0:4864:20::d32 as permitted sender) smtp.mailfrom=kannan@cimware.in
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=j/jFwfdXgrnSa+YHjILVVCKe4GX66Sn5K0eOkdiDaKs=;
        b=TZJJKv5cML7rprrhfog24hhUqeKeeMl1aTYJWH69UqcSmuoDj1bgf1ItE24wo0OakP
         B93nEXLPcDTw3GwWc6xEIP+XWJVx9aZOr1o1mfQ14Yg6fsilmV5VEG/p5GwHJOPzKop3
         fpFGwMzTyA5wXrsBtHbIUvaiig+ssBLRv0v1PzF9xOd5p4EHmlNYzQyyQ3r/qDGbNF9s
         PhXF7tpkOTCTPeZ+gUTy46GkTdrVOudPayFj98D56ugshGEX4MSHNVdQqspw13xoRcqb
         tA3Y7Z1mj6VVex9nFDf1R8n5CxgWIHdhNVPI8zTdIgAHV4iMuFkrhCIwXc7Oo4NDqWD2
         M+pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=j/jFwfdXgrnSa+YHjILVVCKe4GX66Sn5K0eOkdiDaKs=;
        b=JjE8cOOO1IVwuEoov4TZ3Y/zOx1a+fYkhsLTkv/r1l6hj2RPi+yptyVmiQuqamryD/
         CATbDaPY63iLFdJ7Vxbewa0T6YhAYZ1wbz51rlkAxf1Wsup0y7Ihi4CV56D2gcRzJ5AP
         MlFkO5C1wTEp/G6zyrlZBC1lVcZN8sAE3776Xi6ozOrISHC+dY1Jlwbbu/l2WV1L/Jon
         iZujClq23iG0C7ddnErenz0qLk5RsQsKiy+3kMadQYiusv7SWf7ESb0laO6IXP36JlnR
         6mFDLpalSm+UUEHp1v/t0dWzFBT/nf4G61VPjljHsSrqodhnox7rE+v0GhNt67Sp0yXy
         H7Sg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531yopJxjNxeGrUkrsYnXJy2BLCrxldObyMt73qIgYyh91fkf4m/
	AZFWBsjVH/hoNEASCL2xbnc=
X-Google-Smtp-Source: ABdhPJzGFWIeNE9q19+iqEW2c0k5Rh7J3kNFY3paRY0mIN9IXIUJkxGiMeccC8tyVK+HuXaBakC3Mw==
X-Received: by 2002:a05:6830:410d:: with SMTP id w13mr16208772ott.173.1622450839778;
        Mon, 31 May 2021 01:47:19 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6808:bd6:: with SMTP id o22ls3966989oik.1.gmail; Mon, 31
 May 2021 01:47:19 -0700 (PDT)
X-Received: by 2002:aca:5b04:: with SMTP id p4mr6747275oib.28.1622450839136;
        Mon, 31 May 2021 01:47:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622450839; cv=none;
        d=google.com; s=arc-20160816;
        b=d2PEyN/IhSCQ8HmzWG3Ct2J4ntxlYgjYUdr7zUrnVAHr9oGeV8GTJWlaLXNR+SMovg
         eb/vanW636CASsWriCX3r8tL8yelNnz0sRzkk4i2ukLjl1TMzVpYAKEgVZrSqasu/DlY
         Z5lvMmGj+eulZ3YDDBw2ssRuxvPy6P5f+RVwpiv2vBWM/3iuceyBm3Qknr6lUE7DJGeb
         uT6jxwbnJjYstYnaUyxIdFt8rV8yTa9fZyjTnSjV2H/JeJs1nFkgGPJRyl4TyCZT+NoF
         u8HHGkGD5WNrpz1V+QbXfW4f26OzZ09q6CqjK/VlKB5mBzBPOB98p7OnHJRszZktPGkp
         /V0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dMTC6lX/S+G7kYoplCjEl31YQcKlPItOP2oOnXTHEg4=;
        b=NS0r0bkIIxITc8rznTfxlsoEnjaSyUkpzjaUIS+2cBbFZNqZgVQ/OC5ER0qYSHrOk+
         QZa8EazG/DbSuZEd+Wh0Tt4Jb5bMVmmO8yEeO2bUQRnBNC8r+c0adCwI7VJX1ZkqgekB
         IG4eKBk1cuCI0eA1PfgzVfu9qZJwRSlcRcD0emJL2wnotNr3PYZV/NTA/mtrBc9QOBkY
         C0Ci/EUeBLWGa4Eg3GgYl1ZPmKeUlSQC8Fd3suYrRAAZy6W8G3enV5mvgqC8h1TgIZ6L
         fgnLlG0dGcFxQR57F35esS/+noRVd0wqnruvOIi4S4MHFkH5V/amwiWt5hNUyDduwhfT
         BiZg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@cimware-in.20150623.gappssmtp.com header.s=20150623 header.b=hnPMas9w;
       spf=pass (google.com: domain of kannan@cimware.in designates 2607:f8b0:4864:20::d32 as permitted sender) smtp.mailfrom=kannan@cimware.in
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com. [2607:f8b0:4864:20::d32])
        by gmr-mx.google.com with ESMTPS id l81si1097620oig.0.2021.05.31.01.47.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 May 2021 01:47:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of kannan@cimware.in designates 2607:f8b0:4864:20::d32 as permitted sender) client-ip=2607:f8b0:4864:20::d32;
Received: by mail-io1-xd32.google.com with SMTP id v9so11180328ion.11
        for <jailhouse-dev@googlegroups.com>; Mon, 31 May 2021 01:47:17 -0700 (PDT)
X-Received: by 2002:a02:970c:: with SMTP id x12mr19566536jai.21.1622450837650;
 Mon, 31 May 2021 01:47:17 -0700 (PDT)
MIME-Version: 1.0
References: <CALeLWRiLpL3v0c5BDkmNFeObjfqs83MU8L4_4US=BygPkHMnPA@mail.gmail.com>
 <CALeLWRiU3q5Ubd3NZepHK_yeVYkicU7AejgCXpwf8MMdHrue9Q@mail.gmail.com> <PA4PR02MB6670AFAD2B49D463C676F1D5B63F9@PA4PR02MB6670.eurprd02.prod.outlook.com>
In-Reply-To: <PA4PR02MB6670AFAD2B49D463C676F1D5B63F9@PA4PR02MB6670.eurprd02.prod.outlook.com>
From: Kannan Sivaraman <kannan@cimware.in>
Date: Mon, 31 May 2021 14:17:06 +0530
Message-ID: <CALeLWRixvLSaFDH1tmwR1On=NZEc3gYhBDvmN7N-npHNmD4vrg@mail.gmail.com>
Subject: Re: Error when building jailhouse on debian - arm64
To: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
Cc: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
Content-Type: multipart/alternative; boundary="000000000000d81f0005c39c4599"
X-Original-Sender: kannan@cimware.in
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@cimware-in.20150623.gappssmtp.com header.s=20150623
 header.b=hnPMas9w;       spf=pass (google.com: domain of kannan@cimware.in
 designates 2607:f8b0:4864:20::d32 as permitted sender) smtp.mailfrom=kannan@cimware.in
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

--000000000000d81f0005c39c4599
Content-Type: text/plain; charset="UTF-8"

Thanks for the response.

How do i check for the device tree compiler?  Can I install one? Where to
find the DTC.

Regards,
Kannan

On Mon, May 31, 2021 at 1:00 PM Bram Hooimeijer <
bram.hooimeijer@prodrive-technologies.com> wrote:

> > Hi,
> >    Can anyone help me with this issue.
> >
> > Thanks
> > Kannan
> >
> > On Fri, May 28, 2021 at 10:52 AM Kannan Sivaraman <mailto:
> kannan@cimware.in> wrote:
> > Good morning,
> > I get the following error when building on Debian Linux - arm64 platform.
> >
> > Can someone help with this?
> >
> > make[5]: *** No rule to make target
> '/home/parallels/jh/jailhouse/configs/arm64/dts/inmate-amd-seattle.dtb',
> needed by '__build'.  Stop.
>
> I haven't used the Arm version of Jailhouse a lot, but as far as I know,
> these
> .dtb files (device tree blobs) are generated from the device tree source
> files
> (.dts) in the same directory. Do you have the device tree compiler (dtc)
> installed?
>
> Best regards, Bram
>
> > make[4]: ***
> [/usr/src/linux-headers-4.19.0-14-common/scripts/Makefile.build:549:
> /home/parallels/jh/jailhouse/configs] Error 2
> > make[3]: *** [/usr/src/linux-headers-4.19.0-14-common/Makefile:1568:
> _module_/home/parallels/jh/jailhouse] Error 2
> > make[2]: *** [Makefile:146: sub-make] Error 2
> > make[1]: *** [Makefile:8: all] Error 2
> > make: *** [Makefile:40: modules] Error 2
> >
> > thanks,
> > Kannan
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CALeLWRixvLSaFDH1tmwR1On%3DNZEc3gYhBDvmN7N-npHNmD4vrg%40mail.gmail.com.

--000000000000d81f0005c39c4599
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for the response.=C2=A0<div><br></div><div>How do i=
 check for the device tree compiler?=C2=A0 Can I install one? Where to find=
 the DTC.</div><div><br></div><div>Regards,</div><div>Kannan</div></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, M=
ay 31, 2021 at 1:00 PM Bram Hooimeijer &lt;<a href=3D"mailto:bram.hooimeije=
r@prodrive-technologies.com">bram.hooimeijer@prodrive-technologies.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">&gt; =
Hi,<br>
&gt;=C2=A0 =C2=A0 Can anyone help me with this issue.<br>
&gt;<br>
&gt; Thanks<br>
&gt; Kannan<br>
&gt;<br>
&gt; On Fri, May 28, 2021 at 10:52 AM Kannan Sivaraman &lt;mailto:<a href=
=3D"mailto:kannan@cimware.in" target=3D"_blank">kannan@cimware.in</a>&gt; w=
rote:<br>
&gt; Good morning,<br>
&gt; I get the following error when building on Debian Linux - arm64 platfo=
rm.<br>
&gt;<br>
&gt; Can someone help with this?<br>
&gt;<br>
&gt; make[5]: *** No rule to make target &#39;/home/parallels/jh/jailhouse/=
configs/arm64/dts/inmate-amd-seattle.dtb&#39;, needed by &#39;__build&#39;.=
=C2=A0 Stop.<br>
<br>
I haven&#39;t used the Arm version of Jailhouse a lot, but as far as I know=
, these<br>
.dtb files (device tree blobs) are generated from the device tree source fi=
les<br>
(.dts) in the same directory. Do you have the device tree compiler (dtc)<br=
>
installed?<br>
<br>
Best regards, Bram<br>
<br>
&gt; make[4]: *** [/usr/src/linux-headers-4.19.0-14-common/scripts/Makefile=
.build:549: /home/parallels/jh/jailhouse/configs] Error 2<br>
&gt; make[3]: *** [/usr/src/linux-headers-4.19.0-14-common/Makefile:1568: _=
module_/home/parallels/jh/jailhouse] Error 2<br>
&gt; make[2]: *** [Makefile:146: sub-make] Error 2<br>
&gt; make[1]: *** [Makefile:8: all] Error 2<br>
&gt; make: *** [Makefile:40: modules] Error 2<br>
&gt;<br>
&gt; thanks,<br>
&gt; Kannan<br>
</blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CALeLWRixvLSaFDH1tmwR1On%3DNZEc3gYhBDvmN7N-npHNmD4=
vrg%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups=
.google.com/d/msgid/jailhouse-dev/CALeLWRixvLSaFDH1tmwR1On%3DNZEc3gYhBDvmN7=
N-npHNmD4vrg%40mail.gmail.com</a>.<br />

--000000000000d81f0005c39c4599--
