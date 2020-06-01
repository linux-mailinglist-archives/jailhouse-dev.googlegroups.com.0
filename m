Return-Path: <jailhouse-dev+bncBDLNPVGISQLRBT7B2X3AKGQEVSI52HI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x439.google.com (mail-wr1-x439.google.com [IPv6:2a00:1450:4864:20::439])
	by mail.lfdr.de (Postfix) with ESMTPS id 532B71EB0D4
	for <lists+jailhouse-dev@lfdr.de>; Mon,  1 Jun 2020 23:19:12 +0200 (CEST)
Received: by mail-wr1-x439.google.com with SMTP id m14sf468443wrj.12
        for <lists+jailhouse-dev@lfdr.de>; Mon, 01 Jun 2020 14:19:12 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591046352; cv=pass;
        d=google.com; s=arc-20160816;
        b=NyS6j0cyf+j/ZY5STFDsKaJ37dKQF+1jugx3RLyagteVAAoUGiipzua3SO1Nzipddg
         54TfF6xbazae3T2T2eLXux6kmremWtGVtq7CLA93fqoGYsWszL+OAIL1YCqLYqFcPIWJ
         y0bXqrFktazkHY9Y/GHKESjaCJirQkkbCh1Tur7FiJ0FhwK5WQ+eLavtbcmURuJIQpb7
         5Wyubws4TB+p1HMDQxM9BlXFs/JOyhLuAw/d9ULv21JXSpjfhqYSb2qjyxcBIcbfVLjc
         G5UF7qEL2J4mkzfuBrcicjmS8lXjU39AZtnvvOPdEwxYvY4IsbO8bTreR/VYujNVlXoL
         7AZw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:user-agent:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:sender:dkim-signature;
        bh=de7eGFJahfH7HNOncMpGlbAxo1v2F71bnuf/T8iPhNg=;
        b=qRHPs02mIJkdS1m29Xn5SQZyjpSuTuE7ATqSvAFgP0g1CiyWI5ayLSqVKM+eqGBdjv
         PjOpF5pQSZFDYrfw18IJe4SiUxvB1DtmD4qBfl/vFG5NFINKd5caMDw0QLhZ73ayGGiB
         dl22GRyoz5PtPkpNWuOwLs0sO1pQUG8lvVNmMl2m5eMRGrIzAkJlMXpUiuDX28BOQFn+
         QUB1cs6SNQU2n7aXC83jEdr/G4Q3K4x2W0Wk+fqkK5RmwTKdwxiFct6ZdCn/el8Rh0HU
         rPYha69wUDaEFIDyp84fyU5nkI3YF0YLden89iPl+SDnoCIoMVMbQ9uorocZWT9eqZ7m
         WGuQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: best guess record for domain of yann.morin.1998@free.fr designates 212.27.42.1 as permitted sender) smtp.mailfrom=yann.morin.1998@free.fr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=de7eGFJahfH7HNOncMpGlbAxo1v2F71bnuf/T8iPhNg=;
        b=oPx9y38XM6WZDCIGRtlfe6ZzjhoUUzR7vw30U4OdrO/BgLknyZTxWC3ZOWXa1Lb0JM
         tUHNto7pfcopcRQaekUmgMnRfDqdosAvug82XMenkQSEzOcOZcGGnRWX7h4ZxAa/xGiT
         19T8Vs1qX6XY0BT+uJoIoE+4Va5zdacwba4rXKk9EJdNJjl+XzBEAJZ4SI0Bu5LFPniX
         EL48EJIAEpdAqlNemnKjC8yAjDgm9w2ny81wf4BjeJ+dAQzr8j5+sdZTh0NnYO5RW0fy
         Qw3a/2PsKt6Q3AS9A4g3Y0v0T9V0yM8ntSI7twc54Mc1OSlO1FAkexcT6AeT+FaSs8wI
         bZUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=de7eGFJahfH7HNOncMpGlbAxo1v2F71bnuf/T8iPhNg=;
        b=YcKtttcZsTYWDZU3x48jausnr8Y7uRUjGU/SvTVFNpHivxZEHEK4UJexeUuPMKNFhv
         9c2Yneb6O2Mqcy/R1FOqoLgdwJzuKp9XebpKhmGitn6qw1RgWvLLXfVo/uL6El/IG8XC
         gJXWdCUO0twg65kLOH4FHrQ4RRKP1FNJ1uLx0vAXlmt1ONbunwf77GVj6ofdzcuU34Wr
         Aw/qgOqS3zKVlQByn0Pkhzxi55kLBlSWfo/rDB/u4+Sj295XuLxtI1zC15eMT8jPXkzF
         /w2n9UPdo/YfoPBjk9t5fIBpc3j4V0pfGe803Up9lDQM8mn5EOWa64+sGtxkWSat7hvO
         euFw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530RMP5ZNsKvuMxQzFFNB6K305Pkaruz5BtUF75NRdfhrboFbRJ1
	hNwY/IE66sX9IP6sOZXNap8=
X-Google-Smtp-Source: ABdhPJz6Mwt+kJCfn1F+L0ePH9jvhpndMN4WRBgbE6vbjWAgouZP+4Z3fWo5QfzlL27rkhIq/Mw0cQ==
X-Received: by 2002:a1c:451:: with SMTP id 78mr1124256wme.83.1591046352000;
        Mon, 01 Jun 2020 14:19:12 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:da46:: with SMTP id r6ls2340374wrl.3.gmail; Mon, 01 Jun
 2020 14:19:11 -0700 (PDT)
X-Received: by 2002:adf:f4c6:: with SMTP id h6mr24016514wrp.398.1591046351336;
        Mon, 01 Jun 2020 14:19:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591046351; cv=none;
        d=google.com; s=arc-20160816;
        b=VqDi7JKtEcjPL275HHJwtclM4nLwc6fiX9ToZh0V6shszTS1HeRAr903c8VXFOdPpF
         NoK5XzXyltTZORpG4BMDZS4Dg03A5br8OOafPR6pASdjWToyZz+V4NOl6Y+HRO1VBPbO
         /9mow0s5YeW6ATAHmuPGIszD9ntl0hl/w8wYo4svKJkrWC1KYNaO+CYIT3HQvW0XQBtD
         Gwan2qjtzsH41CdCmvBBsjNV1D/jPt9dcvvXXd8uVQEAxfxdn3ufUgkbjnaGI4D5Dhxx
         EwBt4V5mPntfpQSVNEP40ubNP5EWUkPFRJjX5+P8/l0O05EhJYOd7yel41nlWqGRok3J
         0hNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date;
        bh=7n7t0NAROOAFKX9+VVZz3AONKkjJus2ogZFk5DaXL44=;
        b=JZjpR5apIXSCLnylL3wPlPWeFEqxl7wW37LrQL7YUbw3N3dcOYg8LNZXN5/SRsE3nW
         yP4LShrNOGh/bPP8DKA7yXTZaXHN3JTWqF29eR5dGpZyMASgbKrRLuo2mB2/CMHmmZ6H
         URpjkGxU4Ttvnx33T7M/N8nSDrV2EOWK1PJSahxUccPAWqG3lUZT1HKsZvnPcUZniBdP
         qzqhH7b2tu0axOtFgFPNHHXjkFdeprhbC4os9Q0R7c8ae3ow6mL7W1141mJuZMHmSH+u
         2+Es2RBiOdMvA0TYRq31TaFMYcaO5q3iUhmDctCUue79Fw/HhQHssl2fDU5+q9pWV6wi
         jeHQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: best guess record for domain of yann.morin.1998@free.fr designates 212.27.42.1 as permitted sender) smtp.mailfrom=yann.morin.1998@free.fr
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr. [212.27.42.1])
        by gmr-mx.google.com with ESMTPS id w126si80114wma.4.2020.06.01.14.19.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jun 2020 14:19:11 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of yann.morin.1998@free.fr designates 212.27.42.1 as permitted sender) client-ip=212.27.42.1;
Received: from ymorin.is-a-geek.org (unknown [IPv6:2a01:cb19:8b51:cb00:dde4:6569:b690:50d])
	(Authenticated sender: yann.morin.1998)
	by smtp1-g21.free.fr (Postfix) with ESMTPSA id E67A6B0058A;
	Mon,  1 Jun 2020 23:19:02 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation); Mon, 01 Jun 2020 23:19:02 +0200
Date: Mon, 1 Jun 2020 23:19:02 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Mario Mintel <mariomintel@gmail.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	buildroot@buildroot.org, jailhouse-dev@googlegroups.com
Subject: Re: [Buildroot] [PATCH 2/2] package/jailhouse: add option to choose
 custom repo/branch
Message-ID: <20200601211902.GI8737@scaer>
References: <20200528144333.49268-1-mariomintel@gmail.com>
 <20200528144333.49268-3-mariomintel@gmail.com>
 <20200529204844.GR8737@scaer>
 <3806f122-f6b0-efba-e94a-64a3729fbe8a@oth-regensburg.de>
 <CAH3JsOrK+8F4xXhxm8ytEawBQ63jswzBG8PW2naq40M6MAyZQA@mail.gmail.com>
 <CAH3JsOrGo0k4S=VKfaXFbgkOv2jYvCB6nff0f+TihKz-1ok4JQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAH3JsOrGo0k4S=VKfaXFbgkOv2jYvCB6nff0f+TihKz-1ok4JQ@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Original-Sender: yann.morin.1998@free.fr
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: best guess record for domain of yann.morin.1998@free.fr
 designates 212.27.42.1 as permitted sender) smtp.mailfrom=yann.morin.1998@free.fr
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

Mario, Ralf, All,

On 2020-06-01 18:23 +0200, Mario Mintel spake thusly:
> Am Sa., 30. Mai 2020 um 19:28=C2=A0Uhr schrieb Mario Mintel < [1]mariomin=
tel@gmail.com>:
>   Am Fr., 29. Mai 2020 um 23:40=C2=A0Uhr schrieb Ralf Ramsauer < [2]ralf.=
ramsauer@oth-regensburg.de>:
>   On 5/29/20 10:48 PM, Yann E. MORIN wrote:
>   > Mario, All,
>   > On 2020-05-28 16:43 +0200, Mario Mintel spake thusly:
>   >> In addition to official releases of Jailhouse, allow to specify a cu=
stom
>   >> Git URI + branches. This adds more flexibility for custom
>   >> configurations.
>   > The overwhelming majority of packages do not allow selecting an
>   > alternate location. Why would jailhouse be different?
>=20
>   Jailhouse requires system-specific configurations. Those configurations
>   are compiled from C source files to binaries during the build process.
>   While upstream Jailhouse comes with a lot of samples for supported
>   systems, you will need a lot of fine tuning to for a specific use case.

I am not sure I entirely followed... Note that I am totally ignorant to
how jailhouse works (and I barely know what it is). So I had a quick
look into the github repo, and I noticed this:

    A system configuration can be created on an x86 target system by
    running the following command:

        jailhouse config create sysconfig.c

    In order to translate this into the required binary form, place
    this file in the configs/x86/ directory. The build system will pick
    up every .c file from there and generate a corresponding .cell file.

Is this what you were trying to explain?

If so, then I think we need a way for people to indeed provide their
cells descriptions files, so that they do get compiled by jailhouse,
without resorting to using an OVERRDIE_SRCDIR.

So I see a few options:

 1- let people provide those .c files as a patch against jailhouse. This
    requires no infra in Buildroot, but this is not very convenient;

 2- add a configuration option in jailhouse/Config.in, which people
    could set as a path to a directory with .c files; those would be
    copied into the jailhouse build directory before the actual build,
    so the documented way (see above) will be used; those files would
    have to be in a br2-external tree or whatever, but not in a package
    (because we'd have no way to ensure that package be extracted before
    jailhouse gets built).

 3- let people write their own package(s) (e.g. in a br2-external tree)
    that only builds the cell files. That package would depend on
    jailhouse (or rather, the to-be-introduced host-jailhouse). And
    packages could also provide their own cell definitions, too...

I think option 3 is the best solution, as it is the most flexible and
most generic one. However, it will depend on the possibility to
introduce a host-jailhoue package that can just install the 'jailhouse
cell cross compiler'. As far as I see, this is just a bunch of objcopy,
but this is quite tightly integrated into the kernel Kbiuld process, so
might not so simple to come up with.

Option 2 is probably a good compromise if option 3 turns out to be too
difficult to come up with...

[--SNIP--]
> It does work as proposed by Yann. I wasn't aware of that option. I
> guess that makes this patch redundant.

Using a completely separate tree? Yes, I think this is not an option.

However, given the above, maybe we still need a way for people to
provide their cells descriptions and have them somehow copied at build
(or configure) time...

Regards,
Yann E. MORIN.

--=20
.-----------------.--------------------.------------------.----------------=
----.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspira=
cy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___           =
    |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is =
no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspirac=
y.  |
'------------------------------^-------^------------------^----------------=
----'

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/20200601211902.GI8737%40scaer.
