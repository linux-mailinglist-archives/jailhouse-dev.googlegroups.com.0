Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBWX2ZKCAMGQEHEFNDBA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53b.google.com (mail-ed1-x53b.google.com [IPv6:2a00:1450:4864:20::53b])
	by mail.lfdr.de (Postfix) with ESMTPS id 0019B373EC7
	for <lists+jailhouse-dev@lfdr.de>; Wed,  5 May 2021 17:44:26 +0200 (CEST)
Received: by mail-ed1-x53b.google.com with SMTP id d8-20020a0564020008b0290387d38e3ce0sf1084395edu.1
        for <lists+jailhouse-dev@lfdr.de>; Wed, 05 May 2021 08:44:26 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1620229466; cv=pass;
        d=google.com; s=arc-20160816;
        b=xAvKYnApLmCHjm532eu7h9G8NQpHF1XnA6iPvbrj8uRzfBbjZIn20ctNFIFesdVFAC
         BV1WM8MZ4WDxDUfXl/N+Bu8TJ3QtiK6j1sr2MnRN4T90SO9W+hlqyQ1IpYbcIeIfi9ps
         lZZiQlClERkGe0kIQZ0ngmJ+gbO3Zz0wDWU2sIY3A1pGkHR15/frMBXp6KdCbR7IjO7Z
         72ku4rm2bSaYYWDXdGNMBwr86msboGlcz20NdbhPFPXkJaL7Tyj2zH5gEpjQvmaidSHh
         LvE8zpFFjmPQkexyGz5KvWbxTDAgxrDmJLqsLvIKOi3CZ6mXpRNrd3KnGzflTF00b6ad
         q5dQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=5NWla25FpaLIHtHNCQ1tj9PkYL6j89ZzBEJimCX3rL0=;
        b=JE1u6Wdgr0M9mH5ObzV65o54IMjFTcJO2/MO8TfnRgoGktIRVb73YJRoJYqV4MAewA
         yELm51h1d76ipRrjqa7u9t2w12TRZ7xriCXpQas9zcpb4RxEuTbqXYD53UzPrp+Gvd8B
         xtoFB0ulvT6A/o6geyFxibTkcINXoB2sT5lgZEfrTN8cNAii2KCM1//7ekRnUySQ4+PU
         s7o3JyMdSZdyL+dQygfhBSxbJveluO791rxWTZ33kL9TCbxsruAAModhCNozV14yE3VK
         EhGlLIVeP8zgwWoKcUx4qeSoGh3ey8/Ynu/FnKmGytusA/bAgHAUgLfmF/+chl/Ihac2
         XnxQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=qiaosH7S;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=5NWla25FpaLIHtHNCQ1tj9PkYL6j89ZzBEJimCX3rL0=;
        b=V/tcwUd80K36RWTd+CBgUpDKtTc+d/r2tIb3pG6G6rt7JoSrLEGNpsNBcDsjqb0Kdm
         zak6YUE1ldJ3JmiFfyRYadXRBBC42Kye2I81xpgj3EJZb4tswcAuqTJ7CpRbL7EkWX4L
         gz+3RkeTqR8ZRhU+JLEDIoE/CrT6gvH3GyvLDWHtvH+I1foIZUdsQcHEQEtTzlBCEGJN
         OhpC1rvKgRZDiF+Xg8DGqjfVrUD6y0bvgIIv4u+x7Hps9D8wbVU6B5RXaoVH1QeOAmDA
         9+WM77pX7PuuKhJBhmjKIN9NzXAA7AEb7oGSUDU44JfrctLb47lGMrNAdFztDgZUXZTM
         d3fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=5NWla25FpaLIHtHNCQ1tj9PkYL6j89ZzBEJimCX3rL0=;
        b=ZduD9j8Au11Qk1Yf6yADfz/LjQOS3PA+UZGU1QfhRYvqtFzImhfjfmD39cytnxGvvI
         kTTDX1VoVn9FTpPVfgtsHMGbCVrwqK4RDChz+yg+IfLYiFlawgJo58vzMuDOjhzF/Rv4
         dZ6ydqtz6VSgO3d7vhEql/97nxOdWXSYtOr+zrPeBmKGSiAV99hU1ajtBNCtu8T2/z0l
         SIMLthLyqfon0GzcTCUtIAwEqOGn2g8JcQHSCF597I7ioNHv9vBC1/4MUricCKQptSVs
         EL6f2KY472FFMIntwhgxQG+uOBa6eUYOFrva54sHJy5S08UvTqDHHEiaAjUdu+9j4aHy
         1WnQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533+aiBK7K3K5wy2gnTJR4qH5ORNf+a/hJ85wRCzwLd7prwIf7rb
	mwJkktYVvYgW6BUJa9v2WPQ=
X-Google-Smtp-Source: ABdhPJyLDbhoSQwZcitJ5jNGdzPh+bqs7aroqwTfi28Dy5rHgsRTmZ5Xe4sjR8x3U1KOajlFihzDBQ==
X-Received: by 2002:a05:6402:351:: with SMTP id r17mr33115765edw.186.1620229466665;
        Wed, 05 May 2021 08:44:26 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:cdcb:: with SMTP id h11ls5916210edw.2.gmail; Wed, 05 May
 2021 08:44:25 -0700 (PDT)
X-Received: by 2002:a05:6402:4314:: with SMTP id m20mr16934346edc.387.1620229465613;
        Wed, 05 May 2021 08:44:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620229465; cv=none;
        d=google.com; s=arc-20160816;
        b=arxzSZNlrklwisyfYmLrR+fYBrLB0N6wheebMa8w9s7Eo0f/3JREQUQ2Bu6Equvkje
         AqaHlww1HfFhw042QJR23mpEEPtjHCbYD0tVAE+bDdyX5lKj6A8b1NXqwFX94avu1E/8
         IAF8cPSFgweQKfX6AsOR+CZZ1LmBxznnPqjFY33FCUdu6nrMgtNsphXivJUQBewwHkLf
         xCqwPp5sLhKKOvT9JouiWULY8uN8PBDuo1SK+84dp9RteXC4A6ZZcJfZ0MhxdJ66XPv9
         DgfO0rlxoitk+TacO3G7w1TyMNEtxpKNas88bFh60MzagZXbJTZ8ijYhWTBj+dWgy+l8
         8y9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=X94mywTaYOr+EWfPOPp2UshT/4pM4zm333J2Kpm0IB4=;
        b=lDrYSUCZ7bNQvJKkSCY0CRRdXcTgapDhP14MsgYRPFHPX5ILZBY/Pt2AQJARLexNjN
         74LIXtcvY739Od8Tvyg0xTvucp6ScYzXfzk+3JqScnuDe4vAvvf5/EkJFFbT0Xs1mwHj
         FzWbbgW6Ka1iU/UJxkHr80qI4H6/nWKF0xJM7gM75x/stFc0VIYrbIJRIdYSOOKMyQer
         7EjlL9ul4kMDdVfej9Go2d0+Ak7dKEJi/t/Nguffl6Xu5oeNSr1E+hwGCgNwv2Y2BJ5u
         UuwJjynoxHktDNfqPvim/bY5LI1dkDv2dj5KKesl2/2eyPT/Ic5Mvz9l30pMNTolUT37
         N1RQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=qiaosH7S;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id h3si393570edz.1.2021.05.05.08.44.25
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 May 2021 08:44:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4Fb1Gx194jzyD0;
	Wed,  5 May 2021 17:44:25 +0200 (CEST)
Received: from [172.16.2.102] (194.95.106.138) by E16S03.hs-regensburg.de
 (2001:638:a01:8013::93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Wed, 5 May 2021
 17:44:24 +0200
Subject: Re: use uart3 from inmate cell
To: Stefano Gurrieri <gurrieristefano@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <dd1ffb4f-3c78-4a8d-9982-7b589e0f3754n@googlegroups.com>
 <eec6d53b-a974-69cb-6a0a-302db90b14f6@oth-regensburg.de>
 <c2dffc36-35f4-43bf-8166-107f4fcae804n@googlegroups.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Message-ID: <f2af08c1-490b-b421-4034-0c396d5d093a@oth-regensburg.de>
Date: Wed, 5 May 2021 17:44:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <c2dffc36-35f4-43bf-8166-107f4fcae804n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=qiaosH7S;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

On 05/05/2021 09:25, Stefano Gurrieri wrote:
> Hello Ralf,
>=20
> thanks for your advice. I've patched the driver
> /inmates/lib/arm-common/uart-imx.c/ and everything it works.

Excellent, patches welcome! :-)

>=20
> Speaking in general, I find a bit strange that there aren't drivers
> ready to develop a bare-metal application into inmate cell (like for M4
> into MCUXpresso SDK).
> Do you know if in the future there will be implemented this "software
> layer"?
> For example if I want to use other peripherals (SPI, I2C, etc...)...
> there is something?

Inmates are used for tiny demos, testing the hypervisor or for
bootloading Linux. There's a infinite amount of different devices out
there - providing drivers for every device would end up in
reimplementing already existing operating systems. IOW, if you look for
extensive device support, you should consider moving from libinmate to
an embedded operating system (Linux, FreeRTOS, RTEMS, Zephyr, =E2=80=A6).

Or, of course, if your application is reasonable small, implement the
missing drivers for libinmate.

  Ralf

>=20
> Thank you.
> Waiting a feedback from you.
> Regards.
> Stefano
>=20
> On Thursday, April 29, 2021 at 6:16:28 PM UTC+2 Ralf Ramsauer wrote:
>=20
>     Hi Stefano,
>=20
>     On 29/04/2021 10:45, Stefano Gurrieri wrote:
>     > Hello,
>     >
>     > I=E2=80=99ve experimented succefully jailhouse on my target
>     (var-som-mx8m-mini +
>     > symphony carrier board); specifically I=E2=80=99ve tested a second =
linux and
>     > other demos (ivshmem-demo, gic-demo...).=C2=A0
>     >
>     > Furthermore, I=E2=80=99ve cross-compiled a very easy bare-metal
>     application, but
>     > I=E2=80=99m not able to use UART3 (second uart) from this cell (lin=
ux root
>     cell
>     > send correctly debug messages on UART4 -first uart-). Attached you
>     can find:
>     >
>     > -=C2=A0*imx8mm-uart-demo.c*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 my=C2=A0config cell
>     >
>     > -=C2=A0*uart-demo.c*=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0demo loaded into
>     > inmate cell
>     >
>     > Runtime, after enabling jailhouse, I enter:
>     >
>     > jailhouse cell create
>     /usr/share/jailhouse/cells/imx8mm-uart-demo.cell
>     >
>     > jailhouse cell load 1 /usr/share/jailhouse/inmates/uart-demo.bin
>     >
>     > jailhouse cell start 1
>     >
>     > In theory, I should be able to see =E2=80=9C/printk(=E2=80=9Dblabla=
bla=E2=80=9D)/=C2=A0messages
>     on my
>     > uart3 console (the second serial console), but I don=E2=80=99t see =
anything.
>     >
>     > ***
>     >
>     > Questions:
>     >
>     > 1. Have you some idea? What I got wrong?
>     >
>     > 2. The config cell seems correct, but I=E2=80=99m asking who initia=
lize uart3
>     > serial? Linux? Because if it=E2=80=99s linux, the uart3 is disabled=
 in the
>     dtb.
>     > Is it possible initialize uart3 serial also into jailhouse?
>=20
>     If it's disabled in the DT, and nobody initialised it before, then ye=
s,
>     there's a certain chance that the UART arrives unconfigured in the
>     cell.
>=20
>     Have a look at inmates/lib/arm-common/uart-imx.c . The init routine
>     currently does nothing. IOW, you either need to patch the driver and
>     add
>     optional initialisation (you can have a look at other drivers, there
>     are
>     already appropriate fields in the config structures for uart
>     configuration), or rely on Linux to hand it over initialised.
>=20
>     Ralf
>=20
>     >
>     > Thanks a lot for your help in advance!
>     >
>     > Kind regards.
>     >
>     > Stefano
>     >
>     > --
>     > You received this message because you are subscribed to the Google
>     > Groups "Jailhouse" group.
>     > To unsubscribe from this group and stop receiving emails from it,
>     send
>     > an email to jailhouse-de...@googlegroups.com
>     > <mailto:jailhouse-de...@googlegroups.com>.
>     > To view this discussion on the web visit
>     >
>     https://groups.google.com/d/msgid/jailhouse-dev/dd1ffb4f-3c78-4a8d-99=
82-7b589e0f3754n%40googlegroups.com
>     <https://groups.google.com/d/msgid/jailhouse-dev/dd1ffb4f-3c78-4a8d-9=
982-7b589e0f3754n%40googlegroups.com>
>=20
>     >
>     <https://groups.google.com/d/msgid/jailhouse-dev/dd1ffb4f-3c78-4a8d-9=
982-7b589e0f3754n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter
>     <https://groups.google.com/d/msgid/jailhouse-dev/dd1ffb4f-3c78-4a8d-9=
982-7b589e0f3754n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter=
>>.
>=20
>=20
> --=20
> You received this message because you are subscribed to the Google
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send
> an email to jailhouse-dev+unsubscribe@googlegroups.com
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit
> https://groups.google.com/d/msgid/jailhouse-dev/c2dffc36-35f4-43bf-8166-1=
07f4fcae804n%40googlegroups.com
> <https://groups.google.com/d/msgid/jailhouse-dev/c2dffc36-35f4-43bf-8166-=
107f4fcae804n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/f2af08c1-490b-b421-4034-0c396d5d093a%40oth-regensburg.de.
