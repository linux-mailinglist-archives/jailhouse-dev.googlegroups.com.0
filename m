Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBQ5SZOCAMGQE2DQWXOY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23a.google.com (mail-lj1-x23a.google.com [IPv6:2a00:1450:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1B2374393
	for <lists+jailhouse-dev@lfdr.de>; Wed,  5 May 2021 19:43:32 +0200 (CEST)
Received: by mail-lj1-x23a.google.com with SMTP id s4-20020a2eb8c40000b02900bbf0cb2373sf1382864ljp.18
        for <lists+jailhouse-dev@lfdr.de>; Wed, 05 May 2021 10:43:32 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1620236612; cv=pass;
        d=google.com; s=arc-20160816;
        b=N8itfLr25K8367ZzNRvLfZQjKm8fo6rPlE71oDMDdy0hRU1MygMQxEKs2kHLhQJgHs
         7/XjKjK8o25Oyubc60lxtVupzEWFQEPGee1DUIkS6gXN8dFDX0vxAZkd78b+4xUzJcJ8
         cgvy4XBNzna+VB96em5HxCcLARXkjzIditiuKkViY8bTW3ucOZVsL+bS19aU/m4efmEW
         19R+CM0voH452snaqJDwRKTk3HoxtX/Q4A+m6oPxa7Hb8QkTXavzBA4QtTQRAAHvHZdx
         v+kYeB4Qi997Fn3vQejDro1Csm4YbkmOZvQKJhN2KU+ZlKIPu7cA9h5qLNG5na1JE0hI
         4Yxw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=9Z2hhmoc3r+/3fesZvPmmbvZ8H35lxpUENzdwcGc1U0=;
        b=KiHFkCogfGDBZNEkuUciKLW2Uj/TjnUA06asLHbC1Dd5so/oqQM5r+rudOBmi8PMGf
         yFP6UMQ+jWHFa8+MfhhmZnacUTwBhNxvWb8w8LjE7NWpC0zdYlN7V0EuVVnIy7vjlxaI
         1X27K/6xVvAPivvM+ya0h6XQtzUo6rLmMXoJn9SabpkkFN+uf7xPxvmgIRo9biEr5LVa
         +2y+BJCyL38wAuK7QHW6wmPqY68SqttOpvNlJsoTy/kqSomv2Fcl6XLQ9d/klcp98bjO
         6SYE40SLekca1D7kzSbTT9HCPlweNFs2gIdc1AcfckAdrQEgEmqJe2a10t6EivtsEVwr
         MOjQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=tPP4mB2C;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=9Z2hhmoc3r+/3fesZvPmmbvZ8H35lxpUENzdwcGc1U0=;
        b=S6k/5Js8HfESjV+GXdRWTl3zcP9WJJsAvg79GMmfPwiAQkHppR1YAWzjndRi68utZt
         Y+kucuZfV08A/adN3Lb1Gnqn46POfN4MEBuc+FRnX4jNJSUxGzA4OLmyE8G9178L1Eoc
         cH6BA5GmDBNCxO9RN1331snY2SjfJvGH+E25VFcWmWeF+4XxaY3GLuU2s3RsUQyDgiIU
         5TBiax4SyRwHMJKwMq43hHsrzZ85pSIR3wNAi3WALNdaOka1yQV+F4EPMr5fucBweDT6
         wyhLiJHVFXdzjtT0ZyUZ4D7igdM/kCU/XVhLxINldJAvXnfOTuS/qFgUImyhFJdPCIPR
         snkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=9Z2hhmoc3r+/3fesZvPmmbvZ8H35lxpUENzdwcGc1U0=;
        b=IwB7o7qNJFZLoP20QL6Hq5aUXXWHhOYZxYd6y77dfmvczXTLtSvzwGxaAw/LkIr3/P
         G80Ygg+UD/iqpJeo1pklb2lxMDsP+sHrQjx9Lfj+EG0p/VCWhe5EmnmaHbkJ2/FYoqZT
         5t2IXoGOviDlb+ovNxO5b8va7ByO/ymsApeAsmrC0UGnfOH2L1EdvFcv8zlb+8uTsIMO
         62xXSuY5VGxr3VFSNdKqDBseL6nCQeyJdKDv5I8TNst+/fsx73J/fBNuqIzIJBMGZQMB
         mlZ4rXwL/xOWgkH2545sSbp8Eg7Y7x+nK0B51FHCf7iXqs62PlT0EdjbOrIRx1ggYfDc
         nEgQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532aeVecev7MXMhEfzm6S4/GJxexVPco9k1ZhmEilhozzHkriGPw
	ywbk1ak+XHKv0DmIf4RXiCM=
X-Google-Smtp-Source: ABdhPJzPnWBYeQNPhUzGNGz6GnDh1NXXHAIoZG4jILD0QuOkym4WfrV4OyKrFw7r/LBI3ElZCUiEtA==
X-Received: by 2002:a2e:9bd7:: with SMTP id w23mr10150496ljj.401.1620236611892;
        Wed, 05 May 2021 10:43:31 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:6c2:: with SMTP id u2ls11700lff.3.gmail; Wed, 05
 May 2021 10:43:30 -0700 (PDT)
X-Received: by 2002:a05:6512:318f:: with SMTP id i15mr6964lfe.636.1620236610563;
        Wed, 05 May 2021 10:43:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620236610; cv=none;
        d=google.com; s=arc-20160816;
        b=Lm1YRF3f6IeN1E0jEZYWl1WQm5W71F5PkagW3JXH75Qd0Z7BtkV2BQO0O7fR7UPvPB
         1mrhkw7vG8sDHynjDlcFvOQDDDiKHUhKl49JV1hKd4o5JKCBd32dFu+/YZaZMGSqVPiu
         m3SeQWoW9qKJKqPM4Zx0yCzzG7aWSndg/LQbTa2Oa0fNdJFVi96TFfxTvTmUbzSkCRft
         XH1FQbR3skh1Q+n7aF5wyYu4WOdfwUyqwcjZLMzHP/VQrBWyHJVz5beeYot874IIrpXC
         moOhHWiudlPuXo36MDOzIdu1VCcVO5likbifB17GlSaHLMD3enAhQhEOAFGPW8bAWgpz
         5n4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=Qg6aRPsGXO5X0sPmkRAUqbtunumiKmEDFUycbocB78Y=;
        b=NrhmtnR0oJAQdxLdDcLRYKG9VURsL8x+Dt3nppvZCXd3rXsloE9tjA3mjg3IRRczF/
         z/JzqTpUP8xv1Up6dL51ap5fS5c1bLjkhr1khY7P2HhKcqm37p/GTZdtV65z0Z6oiy5M
         gQ6JY3vGavikIUd450/Kit9R7yy9FMS1kCMI+/jLszATYX34djICyFBfrnLw9HI6bLOl
         eQ7TVvmcj2ya6LSv5bhYAKoEV9XFPU3D9sr0G84Nx2rnJl9KzCKftvmExfkpc4RZxi6T
         +GFMxUIiF7GD3E+38PPrcjtYuvIj/ndqAO/81xfn3Q9URUncaWXhMr4YBj6sZqc8/iJA
         W5Yg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=tPP4mB2C;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id q6si2723lfc.13.2021.05.05.10.43.30
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 May 2021 10:43:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4Fb3wK3vyKzyCk;
	Wed,  5 May 2021 19:43:29 +0200 (CEST)
Received: from [172.16.2.102] (194.95.106.138) by E16S03.hs-regensburg.de
 (2001:638:a01:8013::93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Wed, 5 May 2021
 19:43:29 +0200
Subject: Re: [EXT] Re: use uart3 from inmate cell
To: Stefano Gurrieri <gurrieristefano@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <dd1ffb4f-3c78-4a8d-9982-7b589e0f3754n@googlegroups.com>
 <eec6d53b-a974-69cb-6a0a-302db90b14f6@oth-regensburg.de>
 <c2dffc36-35f4-43bf-8166-107f4fcae804n@googlegroups.com>
 <f2af08c1-490b-b421-4034-0c396d5d093a@oth-regensburg.de>
 <CAKpvFF2AfHti6Zu14P2kM-__Wi85FHXyrZB7JXDi7+NS3FonJg@mail.gmail.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Message-ID: <1f265279-5787-062e-5107-2b2e528a50b8@oth-regensburg.de>
Date: Wed, 5 May 2021 19:43:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CAKpvFF2AfHti6Zu14P2kM-__Wi85FHXyrZB7JXDi7+NS3FonJg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=tPP4mB2C;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

Hi Stefano,

On 05/05/2021 19:23, Stefano Gurrieri wrote:
> Hi Ralf,
>=20
> Well, I agree with you, but sometimes it could be necessary to develop=C2=
=A0a
> bare-metal application (critical task requirements) without OS.
> Anyway, my final goal would be to run a real time application on an
> inmate cell (on three cores Linux and on one core RTOS),=C2=A0specificall=
y I
> would need=C2=A0to use=C2=A0freeRTOS.
> FreeRTOS is supported on an inmate cell?

Please keep the list on Cc. I don't know the current state about
FreeRTOS, but maybe someone on the list can help.

  Ralf

>=20
> My board is based on i.MX8M-MINI (based on four cortex-A53 64 bit).
>=20
> Thank you.
> Waiting for feedback from you.
> Regards.
> Stefano
>=20
> Il giorno mer 5 mag 2021 alle ore 17:44 Ralf Ramsauer
> <ralf.ramsauer@oth-regensburg.de
> <mailto:ralf.ramsauer@oth-regensburg.de>> ha scritto:
>=20
>     Hi Stefano,
>=20
>     On 05/05/2021 09:25, Stefano Gurrieri wrote:
>     > Hello Ralf,
>     >
>     > thanks for your advice. I've patched the driver
>     > /inmates/lib/arm-common/uart-imx.c/ and everything it works.
>=20
>     Excellent, patches welcome! :-)
>=20
>     >
>     > Speaking in general, I find a bit strange that there aren't drivers
>     > ready to develop a bare-metal application into inmate cell (like
>     for M4
>     > into MCUXpresso SDK).
>     > Do you know if in the future there will be implemented this "softwa=
re
>     > layer"?
>     > For example if I want to use other peripherals (SPI, I2C, etc...)..=
.
>     > there is something?
>=20
>     Inmates are used for tiny demos, testing the hypervisor or for
>     bootloading Linux. There's a infinite amount of different devices out
>     there - providing drivers for every device would end up in
>     reimplementing already existing operating systems. IOW, if you look f=
or
>     extensive device support, you should consider moving from libinmate t=
o
>     an embedded operating system (Linux, FreeRTOS, RTEMS, Zephyr, =E2=80=
=A6).
>=20
>     Or, of course, if your application is reasonable small, implement the
>     missing drivers for libinmate.
>=20
>     =C2=A0 Ralf
>=20
>     >
>     > Thank you.
>     > Waiting a feedback from you.
>     > Regards.
>     > Stefano
>     >
>     > On Thursday, April 29, 2021 at 6:16:28 PM UTC+2 Ralf Ramsauer wrote=
:
>     >
>     >=C2=A0 =C2=A0 =C2=A0Hi Stefano,
>     >
>     >=C2=A0 =C2=A0 =C2=A0On 29/04/2021 10:45, Stefano Gurrieri wrote:
>     >=C2=A0 =C2=A0 =C2=A0> Hello,
>     >=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0> I=E2=80=99ve experimented succefully jailhouse=
 on my target
>     >=C2=A0 =C2=A0 =C2=A0(var-som-mx8m-mini +
>     >=C2=A0 =C2=A0 =C2=A0> symphony carrier board); specifically I=E2=80=
=99ve tested a second
>     linux and
>     >=C2=A0 =C2=A0 =C2=A0> other demos (ivshmem-demo, gic-demo...).=C2=A0
>     >=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0> Furthermore, I=E2=80=99ve cross-compiled a ver=
y easy bare-metal
>     >=C2=A0 =C2=A0 =C2=A0application, but
>     >=C2=A0 =C2=A0 =C2=A0> I=E2=80=99m not able to use UART3 (second uart=
) from this cell
>     (linux root
>     >=C2=A0 =C2=A0 =C2=A0cell
>     >=C2=A0 =C2=A0 =C2=A0> send correctly debug messages on UART4 -first =
uart-).
>     Attached you
>     >=C2=A0 =C2=A0 =C2=A0can find:
>     >=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0> -=C2=A0*imx8mm-uart-demo.c*=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 my=C2=A0config cell
>     >=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0> -=C2=A0*uart-demo.c*=C2=A0=C2=A0=C2=A0=C2=A0 =
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0demo
>     loaded into
>     >=C2=A0 =C2=A0 =C2=A0> inmate cell
>     >=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0> Runtime, after enabling jailhouse, I enter:
>     >=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0> jailhouse cell create
>     >=C2=A0 =C2=A0 =C2=A0/usr/share/jailhouse/cells/imx8mm-uart-demo.cell
>     >=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0> jailhouse cell load 1 /usr/share/jailhouse/inm=
ates/uart-demo.bin
>     >=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0> jailhouse cell start 1
>     >=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0> In theory, I should be able to see
>     =E2=80=9C/printk(=E2=80=9Dblablabla=E2=80=9D)/=C2=A0messages
>     >=C2=A0 =C2=A0 =C2=A0on my
>     >=C2=A0 =C2=A0 =C2=A0> uart3 console (the second serial console), but=
 I don=E2=80=99t see
>     anything.
>     >=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0> ***
>     >=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0> Questions:
>     >=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0> 1. Have you some idea? What I got wrong?
>     >=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0> 2. The config cell seems correct, but I=E2=80=
=99m asking who
>     initialize uart3
>     >=C2=A0 =C2=A0 =C2=A0> serial? Linux? Because if it=E2=80=99s linux, =
the uart3 is disabled
>     in the
>     >=C2=A0 =C2=A0 =C2=A0dtb.
>     >=C2=A0 =C2=A0 =C2=A0> Is it possible initialize uart3 serial also in=
to jailhouse?
>     >
>     >=C2=A0 =C2=A0 =C2=A0If it's disabled in the DT, and nobody initialis=
ed it before,
>     then yes,
>     >=C2=A0 =C2=A0 =C2=A0there's a certain chance that the UART arrives u=
nconfigured in the
>     >=C2=A0 =C2=A0 =C2=A0cell.
>     >
>     >=C2=A0 =C2=A0 =C2=A0Have a look at inmates/lib/arm-common/uart-imx.c=
 . The init
>     routine
>     >=C2=A0 =C2=A0 =C2=A0currently does nothing. IOW, you either need to =
patch the
>     driver and
>     >=C2=A0 =C2=A0 =C2=A0add
>     >=C2=A0 =C2=A0 =C2=A0optional initialisation (you can have a look at =
other drivers,
>     there
>     >=C2=A0 =C2=A0 =C2=A0are
>     >=C2=A0 =C2=A0 =C2=A0already appropriate fields in the config structu=
res for uart
>     >=C2=A0 =C2=A0 =C2=A0configuration), or rely on Linux to hand it over=
 initialised.
>     >
>     >=C2=A0 =C2=A0 =C2=A0Ralf
>     >
>     >=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0> Thanks a lot for your help in advance!
>     >=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0> Kind regards.
>     >=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0> Stefano
>     >=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0> --
>     >=C2=A0 =C2=A0 =C2=A0> You received this message because you are subs=
cribed to the
>     Google
>     >=C2=A0 =C2=A0 =C2=A0> Groups "Jailhouse" group.
>     >=C2=A0 =C2=A0 =C2=A0> To unsubscribe from this group and stop receiv=
ing emails
>     from it,
>     >=C2=A0 =C2=A0 =C2=A0send
>     >=C2=A0 =C2=A0 =C2=A0> an email to jailhouse-de...@googlegroups.com
>     <mailto:jailhouse-de...@googlegroups.com>
>     >=C2=A0 =C2=A0 =C2=A0> <mailto:jailhouse-de...@googlegroups.com
>     <mailto:jailhouse-de...@googlegroups.com>>.
>     >=C2=A0 =C2=A0 =C2=A0> To view this discussion on the web visit
>     >=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0
>     =C2=A0https://groups.google.com/d/msgid/jailhouse-dev/dd1ffb4f-3c78-4=
a8d-9982-7b589e0f3754n%40googlegroups.com
>     <https://groups.google.com/d/msgid/jailhouse-dev/dd1ffb4f-3c78-4a8d-9=
982-7b589e0f3754n%40googlegroups.com>
>     >=C2=A0 =C2=A0
>     =C2=A0<https://groups.google.com/d/msgid/jailhouse-dev/dd1ffb4f-3c78-=
4a8d-9982-7b589e0f3754n%40googlegroups.com
>     <https://groups.google.com/d/msgid/jailhouse-dev/dd1ffb4f-3c78-4a8d-9=
982-7b589e0f3754n%40googlegroups.com>>
>     >
>     >=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0
>     =C2=A0<https://groups.google.com/d/msgid/jailhouse-dev/dd1ffb4f-3c78-=
4a8d-9982-7b589e0f3754n%40googlegroups.com?utm_medium=3Demail&utm_source=3D=
footer
>     <https://groups.google.com/d/msgid/jailhouse-dev/dd1ffb4f-3c78-4a8d-9=
982-7b589e0f3754n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter=
>
>     >=C2=A0 =C2=A0
>     =C2=A0<https://groups.google.com/d/msgid/jailhouse-dev/dd1ffb4f-3c78-=
4a8d-9982-7b589e0f3754n%40googlegroups.com?utm_medium=3Demail&utm_source=3D=
footer
>     <https://groups.google.com/d/msgid/jailhouse-dev/dd1ffb4f-3c78-4a8d-9=
982-7b589e0f3754n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter=
>>>.
>     >
>     >
>     > --
>     > You received this message because you are subscribed to the Google
>     > Groups "Jailhouse" group.
>     > To unsubscribe from this group and stop receiving emails from it, s=
end
>     > an email to jailhouse-dev+unsubscribe@googlegroups.com
>     <mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com>
>     > <mailto:jailhouse-dev+unsubscribe@googlegroups.com
>     <mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com>>.
>     > To view this discussion on the web visit
>     >
>     https://groups.google.com/d/msgid/jailhouse-dev/c2dffc36-35f4-43bf-81=
66-107f4fcae804n%40googlegroups.com
>     <https://groups.google.com/d/msgid/jailhouse-dev/c2dffc36-35f4-43bf-8=
166-107f4fcae804n%40googlegroups.com>
>     >
>     <https://groups.google.com/d/msgid/jailhouse-dev/c2dffc36-35f4-43bf-8=
166-107f4fcae804n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter
>     <https://groups.google.com/d/msgid/jailhouse-dev/c2dffc36-35f4-43bf-8=
166-107f4fcae804n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter=
>>.
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/1f265279-5787-062e-5107-2b2e528a50b8%40oth-regensburg.de.
