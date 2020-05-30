Return-Path: <jailhouse-dev+bncBDXPDIF3WYKRBQNPZL3AKGQESFVNAFA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x540.google.com (mail-pg1-x540.google.com [IPv6:2607:f8b0:4864:20::540])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F25A1E92DC
	for <lists+jailhouse-dev@lfdr.de>; Sat, 30 May 2020 19:28:35 +0200 (CEST)
Received: by mail-pg1-x540.google.com with SMTP id a16sf2092555pgw.19
        for <lists+jailhouse-dev@lfdr.de>; Sat, 30 May 2020 10:28:35 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1590859714; cv=pass;
        d=google.com; s=arc-20160816;
        b=C73LOXp1PfrBhmOBGOqYYu2GJrWsvMdSwqtSqB4BKcJ49o1uKVtwXcdBI7A7wCtGPK
         Ob7/v/xGA8H/0iP72iPUjJ8ygycqoxtbV2m9Nd0/HEConaDg93WwlJ1trzJxxCdfscwe
         9FIGSL8Brv60cDkr54xkBuRr2ilTK046HzW4YFfk+Pl7psqlDB+5tZocPsDslHSu0YwI
         W3VOUE/5B9OcKwc3P4BuRmWedRnRI/QXm9ZcgrZO8L5kXKtWTwwzSV9bIfe7X4TkiPch
         gJ534Eg1RnpKhzXWDNME5AKSXwR4rVLrew4dm3boxV/NVdhndzNFJ8fR84VsQP6modgT
         KYIg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=V3PZB/VcilG2rVxF2KlEW9T3mzTnZLVN3yhWOEbWPO4=;
        b=fv2pfZOTE53oSJaKvIY85uNwT4dnIBGPXAbA33hKcjFXluh000RlQqW713Ig4q7/Eu
         uSXu2Nx3dml/OfElnZoHoC4G0+TTWrCoW+bp+Tlvu1eCy4izI9gPkaj5975Ek1xddOb7
         dbFvWb6LYvxcXC+pNcTg4d0mXpyIOxOkr4h5tFGc901NlMhldZ8lRMOjmNuSldYf+czS
         3HWf2AKjat4uTDE9eZ3vq75MaDGjoLO28WAIjNtaLsRUDOGntbB1MaWa0o+27cQ9YzI+
         qrEdKCR6YNSDaww2gfAau6LEbGBfTLxv46haMQHkMwZ0f4rKQIK+3REEdD/e2azcROhH
         MX8w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=m8oExOpI;
       spf=pass (google.com: domain of mariomintel@gmail.com designates 2607:f8b0:4864:20::744 as permitted sender) smtp.mailfrom=mariomintel@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=V3PZB/VcilG2rVxF2KlEW9T3mzTnZLVN3yhWOEbWPO4=;
        b=KvuImuNgE94vVxFlSwn8oZbPlkfUxRH07y4K3gQ4NuUaIkrsA6pfCyvsXWTsjf1z2L
         GO4R3GCYySEdV2rki2QPeak8KWeGBzQ1aRTrqL6YIeVH2tnPpkHrV21ZVmVjPhgdfXHp
         p2f4LQzCLeJwIbIrnENiwtBD26UXm8J2LWqDitj6kZQtO9ZNeDQthEUM+ptvzn8riRGO
         v7Y9NiwQ03uNyDn29Bn85tY+cJ/cSX23Qye5oKBZgv8PhDlfE9SFJP3OEuKSebOFIV/0
         M5AWskCnGBqy2Mg07mv00QSRDUn3AKX93QJ40+UeU/QqlIJYh2/PZ5u6uQdvACS5eA75
         3U5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=V3PZB/VcilG2rVxF2KlEW9T3mzTnZLVN3yhWOEbWPO4=;
        b=KM4DJFh3fI7z2PGGwF0KkBI9aiFV3vFKLnVXPNCwyXhu5ffPUOmyag7bD8dNlaXkxs
         BrBNDXXaZMb6k35nQLpvfUTd8IfKn3if/GibY519y929iOex///VbvjeemubwE8yG+BU
         U5gz8anqricIXirUhCdCNJU5qeIQFIMb0C/BbKJeKKRu/OXxBIJxf0pAX0GQyH6z+gqj
         /q3L9Coy6Ty07R4Llwtys0NJfzDJRfrk+BRggHZvbeegwsae20RgG4OiiXxXpwILRdGC
         VcvF1h1W8mYnEKiC0aZsOYi8AAW5aoDlkgcuF1ADYxHNP9WVGV8NgkH7TQFaOxv0GoHe
         hLkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=V3PZB/VcilG2rVxF2KlEW9T3mzTnZLVN3yhWOEbWPO4=;
        b=TCQyHy8dxW6Ml6atOEiqteryOafanbIFO5n6MB3VHJz6DrDQwYTrfE+cduNfL2zTRj
         40MB/7rfX+ggWIl7SN0nwYedZiPiR4mgyIVB9empdZJsx2nln+NG5OrIXDud9OEa7yOA
         GaZHDep2xfss8WWZuSXkv0KXCqF/18SfudITx7f+AmmxnGYR5r5BasHzHOpS7Mdv6YGG
         3LBCfu3y8gT47wEwXITn1ck+QvpvsiprvY7Wp27PYtoPTvPE9TH0GRQolFfSMOzej5fo
         zxt6HLB32BBHV5cwn4nsPpT+fJa0MjHB4feW3NEepP9B4P72Y268nV2YZE5myvwZxWBN
         FP8g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530B4DjJAJB9/mFiiGIfTEbCdRPB2DBTAATkyth2zIWYl6cQGp6c
	ziPFc7tKNXTOeqfEnEby010=
X-Google-Smtp-Source: ABdhPJwQIRYbHag9W2PBBxx/48j735Jf9T6OH98owbnzmPSjRWGhuNGNtpBhyS20VEd9aAgJpnpLFA==
X-Received: by 2002:a17:90a:ce11:: with SMTP id f17mr8209640pju.123.1590859713720;
        Sat, 30 May 2020 10:28:33 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:9706:: with SMTP id a6ls370414pfg.8.gmail; Sat, 30 May
 2020 10:28:33 -0700 (PDT)
X-Received: by 2002:a62:cd8a:: with SMTP id o132mr13656635pfg.206.1590859712897;
        Sat, 30 May 2020 10:28:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590859712; cv=none;
        d=google.com; s=arc-20160816;
        b=NQ1ag+gVsEvBL2tR/HHR+VZgAEnfadVdf2r7ZpJX1dJA8ppCpbTH3dsMaKYXkkbIJA
         Z6fr4sttm1vYlpUyqIyTsxy3z7RjGnnb7PQVG5f1ICNRI1+oZQ6Do6Yglms2Zc4LAqP+
         gBLz08wjx+gC5RaNVBdnlEDR8KFgj978KybnBKys0/5Cyd1ycb3S5u5ghQo5URWJ2tNG
         cvPdPNjiYliQ6SFo92xaQ8YPU4h+ss+B5XIC68yqt9s5KaIk7hr3GvYBqdXrR4jbqpBN
         KuW/HdFK9cFMTDDuSguVQLWQFGVwAkglpv+B0wpSdcXVemLCh4fggeVJf/bKtagiXNFB
         BfBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=KO8TTLNq6d47F5h4D4tA40uZ2/mxGgIfz5Vrc4y0Pjo=;
        b=rUdhLnOn+FAqpTIc88chXe4Z4nM5WiattNdsAHQvVYa9Ss43n9GH1Ezc0EnJ9NlRsL
         Q9QlFg1NU+y4mxOpaKHH43GBy165V5RH4SHxMQXfA8BZ+BoBCPY4OxzkbMeRppDnxXG0
         YzIrd414mg90AC3r84VGG+qGs+c+ZdsEdEpn/rnvMSMtec900zfU6fmfJZ6ahp4nsH9i
         VosFHVgxH3pLwXSINC/YYGesS0ZNywamJJkRj6dHjcUbewVB2xVphR0/ydtr8DJjivVo
         bpOV5+T630mY608n1Wy/1vqtpHaPI/vrb4ItzAZGTwPCcJkRfeGtn+X8/kgZCiRx/AVB
         UvsQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=m8oExOpI;
       spf=pass (google.com: domain of mariomintel@gmail.com designates 2607:f8b0:4864:20::744 as permitted sender) smtp.mailfrom=mariomintel@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com. [2607:f8b0:4864:20::744])
        by gmr-mx.google.com with ESMTPS id e13si1027889plq.3.2020.05.30.10.28.32
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 May 2020 10:28:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of mariomintel@gmail.com designates 2607:f8b0:4864:20::744 as permitted sender) client-ip=2607:f8b0:4864:20::744;
Received: by mail-qk1-x744.google.com with SMTP id n11so5303969qkn.8
        for <jailhouse-dev@googlegroups.com>; Sat, 30 May 2020 10:28:32 -0700 (PDT)
X-Received: by 2002:a37:c20c:: with SMTP id i12mr13922597qkm.167.1590859711962;
 Sat, 30 May 2020 10:28:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200528144333.49268-1-mariomintel@gmail.com> <20200528144333.49268-3-mariomintel@gmail.com>
 <20200529204844.GR8737@scaer> <3806f122-f6b0-efba-e94a-64a3729fbe8a@oth-regensburg.de>
In-Reply-To: <3806f122-f6b0-efba-e94a-64a3729fbe8a@oth-regensburg.de>
From: Mario Mintel <mariomintel@gmail.com>
Date: Sat, 30 May 2020 19:28:46 +0200
Message-ID: <CAH3JsOrK+8F4xXhxm8ytEawBQ63jswzBG8PW2naq40M6MAyZQA@mail.gmail.com>
Subject: Re: [Buildroot] [PATCH 2/2] package/jailhouse: add option to choose
 custom repo/branch
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org, 
	jailhouse-dev@googlegroups.com
Content-Type: multipart/alternative; boundary="00000000000004e07505a6e0e408"
X-Original-Sender: mariomintel@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=m8oExOpI;       spf=pass
 (google.com: domain of mariomintel@gmail.com designates 2607:f8b0:4864:20::744
 as permitted sender) smtp.mailfrom=mariomintel@gmail.com;       dmarc=pass
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

--00000000000004e07505a6e0e408
Content-Type: text/plain; charset="UTF-8"

Hi everyone,

Am Fr., 29. Mai 2020 um 23:40 Uhr schrieb Ralf Ramsauer <
ralf.ramsauer@oth-regensburg.de>:

> Hi Yann,
>
> On 5/29/20 10:48 PM, Yann E. MORIN wrote:
> > Mario, All,
> >
> > On 2020-05-28 16:43 +0200, Mario Mintel spake thusly:
> >> In addition to official releases of Jailhouse, allow to specify a custom
> >> Git URI + branches. This adds more flexibility for custom
> >> configurations.
> >
> > The overwhelming majority of packages do not allow selecting an
> > alternate location. Why would jailhouse be different?
>
> Jailhouse requires system-specific configurations. Those configurations
> are compiled from C source files to binaries during the build process.
> While upstream Jailhouse comes with a lot of samples for supported
> systems, you will need a lot of fine tuning to for a specific use case.
>
> >
> > Are you trying to cover for development? In that case, the usual way is
>
> In our case -- Yes.
>
> > to use the override srcdir mechanism. See BR2_PACKAGE_OVERRIDE_FILE and
> > provide such a file with definitions like;
> >
> >     JAILHOUSE_OVERRIDE_SRCDIR =
> /path/to/your/local/development/tree/jailhouse
>
> Oh, that could maybe work. Mario, could you please check that? In case
> this works, we can simply add those definitions to our br2-external tree.
>
>

Yeah sure I can try that. Although I won't be able to until Monday as I
have no
access to my working computer as of right now.

I will report back as soon as I have results.

Greetings,
Mario


> Thanks
>   Ralf
>
> >
> > Regards,
> > Yann E. MORIN.
> >
> >> Signed-off-by: Mario Mintel <mariomintel@gmail.com>
> >> ---
> >>  package/jailhouse/Config.in    | 36 ++++++++++++++++++++++++++++++++--
> >>  package/jailhouse/jailhouse.mk | 17 ++++++++++++++--
> >>  2 files changed, 49 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/package/jailhouse/Config.in b/package/jailhouse/Config.in
> >> index 596b4951db..47523747f9 100644
> >> --- a/package/jailhouse/Config.in
> >> +++ b/package/jailhouse/Config.in
> >> @@ -3,18 +3,50 @@ config BR2_PACKAGE_JAILHOUSE
> >>      depends on BR2_aarch64 || BR2_x86_64
> >>      depends on BR2_LINUX_KERNEL
> >>      help
> >> -      The Jailhouse partitioning Hypervisor based on Linux.
> >> +      The Jailhouse Linux-based partitioning hypervisor.
> >>
> >>        https://github.com/siemens/jailhouse
> >>
> >>  if BR2_PACKAGE_JAILHOUSE
> >>
> >> +choice
> >> +    prompt "Jailhouse Version"
> >> +
> >> +config BR2_PACKAGE_JAILHOUSE_LATEST_VERSION
> >> +    bool "Version 0.12"
> >> +
> >> +config BR2_PACKAGE_JAILHOUSE_CUSTOM_GIT
> >> +    bool "Custom Git repository"
> >> +    help
> >> +      This option allows Buildroot to get the Jailhouse source code
> >> +      from a custom Git repository.
> >> +
> >> +endchoice
> >> +
> >> +if BR2_PACKAGE_JAILHOUSE_CUSTOM_GIT
> >> +
> >> +config BR2_PACKAGE_JAILHOUSE_CUSTOM_GIT_URI
> >> +    string "URI of custom repository"
> >> +    default "https://github.com/siemens/jailhouse.git"
> >> +
> >> +config BR2_PACKAGE_JAILHOUSE_CUSTOM_GIT_BRANCH
> >> +    string "Name of Git branch"
> >> +    default "master"
> >> +
> >> +endif
> >> +
> >> +config BR2_PACKAGE_JAILHOUSE_VERSION
> >> +    string
> >> +    default "0.12" if BR2_PACKAGE_JAILHOUSE_LATEST_VERSION
> >> +    default BR2_PACKAGE_JAILHOUSE_CUSTOM_GIT_BRANCH \
> >> +            if BR2_PACKAGE_JAILHOUSE_CUSTOM_GIT
> >> +
> >>  config BR2_PACKAGE_JAILHOUSE_HELPER_SCRIPTS
> >>      bool "helper scripts"
> >>      depends on BR2_PACKAGE_PYTHON
> >>      select BR2_PACKAGE_PYTHON_MAKO # runtime
> >>      help
> >> -      Python-based helpers for the Jailhouse Hypervisor.
> >> +      Python-based helpers for the Jailhouse hypervisor.
> >>
> >>        https://github.com/siemens/jailhouse
> >>
> >> diff --git a/package/jailhouse/jailhouse.mk b/package/jailhouse/
> jailhouse.mk
> >> index 6356c5a7aa..d134b3d1b4 100644
> >> --- a/package/jailhouse/jailhouse.mk
> >> +++ b/package/jailhouse/jailhouse.mk
> >> @@ -4,10 +4,23 @@
> >>  #
> >>
> ################################################################################
> >>
> >> -JAILHOUSE_VERSION = 0.12
> >> -JAILHOUSE_SITE = $(call github,siemens,jailhouse,v$(JAILHOUSE_VERSION))
> >> +JAILHOUSE_VERSION = $(call qstrip,$(BR2_PACKAGE_JAILHOUSE_VERSION))
> >>  JAILHOUSE_LICENSE = GPL-2.0
> >> +ifeq ($(BR2_PACKAGE_JAILHOUSE_LATEST_VERSION),y)
> >>  JAILHOUSE_LICENSE_FILES = COPYING
> >> +endif
> >> +
> >> +ifeq ($(BR2_PACKAGE_JAILHOUSE_CUSTOM_GIT),y)
> >> +JAILHOUSE_SITE = $(call qstrip,$(BR2_PACKAGE_JAILHOUSE_CUSTOM_GIT_URI))
> >> +JAILHOUSE_SITE_METHOD = git
> >> +else
> >> +JAILHOUSE_SITE = $(call github,siemens,jailhouse,v$(JAILHOUSE_VERSION))
> >> +endif
> >> +
> >> +ifeq ($(BR2_PACKAGE_JAILHOUSE)$(BR2_PACKAGE_JAILHOUSE_CUSTIM_GIT),y)
> >> +BR_NO_CHECK_HASH_FOR += $(JAILHOUSE_SOURCE)
> >> +endif
> >> +
> >>  JAILHOUSE_DEPENDENCIES = \
> >>      linux
> >>
> >> --
> >> 2.26.1
> >>
> >> _______________________________________________
> >> buildroot mailing list
> >> buildroot@busybox.net
> >> http://lists.busybox.net/mailman/listinfo/buildroot
> >
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAH3JsOrK%2B8F4xXhxm8ytEawBQ63jswzBG8PW2naq40M6MAyZQA%40mail.gmail.com.

--00000000000004e07505a6e0e408
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi everyone,<br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Am Fr., 29. Mai 2020 um 23:40=C2=A0Uh=
r schrieb Ralf Ramsauer &lt;<a href=3D"mailto:ralf.ramsauer@oth-regensburg.=
de">ralf.ramsauer@oth-regensburg.de</a>&gt;:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">Hi Yann,<br>
<br>
On 5/29/20 10:48 PM, Yann E. MORIN wrote:<br>
&gt; Mario, All,<br>
&gt; <br>
&gt; On 2020-05-28 16:43 +0200, Mario Mintel spake thusly:<br>
&gt;&gt; In addition to official releases of Jailhouse, allow to specify a =
custom<br>
&gt;&gt; Git URI + branches. This adds more flexibility for custom<br>
&gt;&gt; configurations.<br>
&gt; <br>
&gt; The overwhelming majority of packages do not allow selecting an<br>
&gt; alternate location. Why would jailhouse be different?<br>
<br>
Jailhouse requires system-specific configurations. Those configurations<br>
are compiled from C source files to binaries during the build process.<br>
While upstream Jailhouse comes with a lot of samples for supported<br>
systems, you will need a lot of fine tuning to for a specific use case.<br>
<br>
&gt; <br>
&gt; Are you trying to cover for development? In that case, the usual way i=
s<br>
<br>
In our case -- Yes.<br>
<br>
&gt; to use the override srcdir mechanism. See BR2_PACKAGE_OVERRIDE_FILE an=
d<br>
&gt; provide such a file with definitions like;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0JAILHOUSE_OVERRIDE_SRCDIR =3D /path/to/your/local/d=
evelopment/tree/jailhouse<br>
<br>
Oh, that could maybe work. Mario, could you please check that? In case<br>
this works, we can simply add those definitions to our br2-external tree.<b=
r>
<br></blockquote><div><br></div><div><br>Yeah sure I can try that. Although=
 I won&#39;t be able to until Monday as I have no<br>access to my working c=
omputer as of right now.<br><br>I will report back as soon as I have result=
s.</div><div><br></div><div>Greetings,</div><div>Mario<br></div><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
Thanks<br>
=C2=A0 Ralf<br>
<br>
&gt; <br>
&gt; Regards,<br>
&gt; Yann E. MORIN.<br>
&gt; <br>
&gt;&gt; Signed-off-by: Mario Mintel &lt;<a href=3D"mailto:mariomintel@gmai=
l.com" target=3D"_blank">mariomintel@gmail.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 package/jailhouse/Config.in=C2=A0 =C2=A0 | 36 ++++++++++++++=
++++++++++++++++++--<br>
&gt;&gt;=C2=A0 package/jailhouse/<a href=3D"http://jailhouse.mk" rel=3D"nor=
eferrer" target=3D"_blank">jailhouse.mk</a> | 17 ++++++++++++++--<br>
&gt;&gt;=C2=A0 2 files changed, 49 insertions(+), 4 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/package/jailhouse/Config.in b/package/jailhouse/Confi=
g.in<br>
&gt;&gt; index 596b4951db..47523747f9 100644<br>
&gt;&gt; --- a/package/jailhouse/Config.in<br>
&gt;&gt; +++ b/package/jailhouse/Config.in<br>
&gt;&gt; @@ -3,18 +3,50 @@ config BR2_PACKAGE_JAILHOUSE<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 depends on BR2_aarch64 || BR2_x86_64<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 depends on BR2_LINUX_KERNEL<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 help<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 The Jailhouse partitioning Hypervisor based =
on Linux.<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 The Jailhouse Linux-based partitioning hyper=
visor.<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://github.com/siemens/j=
ailhouse" rel=3D"noreferrer" target=3D"_blank">https://github.com/siemens/j=
ailhouse</a><br>
&gt;&gt;=C2=A0 <br>
&gt;&gt;=C2=A0 if BR2_PACKAGE_JAILHOUSE<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt; +choice<br>
&gt;&gt; +=C2=A0 =C2=A0 prompt &quot;Jailhouse Version&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +config BR2_PACKAGE_JAILHOUSE_LATEST_VERSION<br>
&gt;&gt; +=C2=A0 =C2=A0 bool &quot;Version 0.12&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +config BR2_PACKAGE_JAILHOUSE_CUSTOM_GIT<br>
&gt;&gt; +=C2=A0 =C2=A0 bool &quot;Custom Git repository&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 help<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 This option allows Buildroot to get the Jail=
house source code<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 from a custom Git repository.<br>
&gt;&gt; +<br>
&gt;&gt; +endchoice<br>
&gt;&gt; +<br>
&gt;&gt; +if BR2_PACKAGE_JAILHOUSE_CUSTOM_GIT<br>
&gt;&gt; +<br>
&gt;&gt; +config BR2_PACKAGE_JAILHOUSE_CUSTOM_GIT_URI<br>
&gt;&gt; +=C2=A0 =C2=A0 string &quot;URI of custom repository&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 default &quot;<a href=3D"https://github.com/siemens=
/jailhouse.git" rel=3D"noreferrer" target=3D"_blank">https://github.com/sie=
mens/jailhouse.git</a>&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +config BR2_PACKAGE_JAILHOUSE_CUSTOM_GIT_BRANCH<br>
&gt;&gt; +=C2=A0 =C2=A0 string &quot;Name of Git branch&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 default &quot;master&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +endif<br>
&gt;&gt; +<br>
&gt;&gt; +config BR2_PACKAGE_JAILHOUSE_VERSION<br>
&gt;&gt; +=C2=A0 =C2=A0 string<br>
&gt;&gt; +=C2=A0 =C2=A0 default &quot;0.12&quot; if BR2_PACKAGE_JAILHOUSE_L=
ATEST_VERSION<br>
&gt;&gt; +=C2=A0 =C2=A0 default BR2_PACKAGE_JAILHOUSE_CUSTOM_GIT_BRANCH \<b=
r>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if BR2_PACKAGE_JAILHOUS=
E_CUSTOM_GIT<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 config BR2_PACKAGE_JAILHOUSE_HELPER_SCRIPTS<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 bool &quot;helper scripts&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 depends on BR2_PACKAGE_PYTHON<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 select BR2_PACKAGE_PYTHON_MAKO # runtime<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 help<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 Python-based helpers for the Jailhouse Hyper=
visor.<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 Python-based helpers for the Jailhouse hyper=
visor.<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://github.com/siemens/j=
ailhouse" rel=3D"noreferrer" target=3D"_blank">https://github.com/siemens/j=
ailhouse</a><br>
&gt;&gt;=C2=A0 <br>
&gt;&gt; diff --git a/package/jailhouse/<a href=3D"http://jailhouse.mk" rel=
=3D"noreferrer" target=3D"_blank">jailhouse.mk</a> b/package/jailhouse/<a h=
ref=3D"http://jailhouse.mk" rel=3D"noreferrer" target=3D"_blank">jailhouse.=
mk</a><br>
&gt;&gt; index 6356c5a7aa..d134b3d1b4 100644<br>
&gt;&gt; --- a/package/jailhouse/<a href=3D"http://jailhouse.mk" rel=3D"nor=
eferrer" target=3D"_blank">jailhouse.mk</a><br>
&gt;&gt; +++ b/package/jailhouse/<a href=3D"http://jailhouse.mk" rel=3D"nor=
eferrer" target=3D"_blank">jailhouse.mk</a><br>
&gt;&gt; @@ -4,10 +4,23 @@<br>
&gt;&gt;=C2=A0 #<br>
&gt;&gt;=C2=A0 ############################################################=
####################<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt; -JAILHOUSE_VERSION =3D 0.12<br>
&gt;&gt; -JAILHOUSE_SITE =3D $(call github,siemens,jailhouse,v$(JAILHOUSE_V=
ERSION))<br>
&gt;&gt; +JAILHOUSE_VERSION =3D $(call qstrip,$(BR2_PACKAGE_JAILHOUSE_VERSI=
ON))<br>
&gt;&gt;=C2=A0 JAILHOUSE_LICENSE =3D GPL-2.0<br>
&gt;&gt; +ifeq ($(BR2_PACKAGE_JAILHOUSE_LATEST_VERSION),y)<br>
&gt;&gt;=C2=A0 JAILHOUSE_LICENSE_FILES =3D COPYING<br>
&gt;&gt; +endif<br>
&gt;&gt; +<br>
&gt;&gt; +ifeq ($(BR2_PACKAGE_JAILHOUSE_CUSTOM_GIT),y)<br>
&gt;&gt; +JAILHOUSE_SITE =3D $(call qstrip,$(BR2_PACKAGE_JAILHOUSE_CUSTOM_G=
IT_URI))<br>
&gt;&gt; +JAILHOUSE_SITE_METHOD =3D git<br>
&gt;&gt; +else<br>
&gt;&gt; +JAILHOUSE_SITE =3D $(call github,siemens,jailhouse,v$(JAILHOUSE_V=
ERSION))<br>
&gt;&gt; +endif<br>
&gt;&gt; +<br>
&gt;&gt; +ifeq ($(BR2_PACKAGE_JAILHOUSE)$(BR2_PACKAGE_JAILHOUSE_CUSTIM_GIT)=
,y)<br>
&gt;&gt; +BR_NO_CHECK_HASH_FOR +=3D $(JAILHOUSE_SOURCE)<br>
&gt;&gt; +endif<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 JAILHOUSE_DEPENDENCIES =3D \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 linux<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt; -- <br>
&gt;&gt; 2.26.1<br>
&gt;&gt;<br>
&gt;&gt; _______________________________________________<br>
&gt;&gt; buildroot mailing list<br>
&gt;&gt; <a href=3D"mailto:buildroot@busybox.net" target=3D"_blank">buildro=
ot@busybox.net</a><br>
&gt;&gt; <a href=3D"http://lists.busybox.net/mailman/listinfo/buildroot" re=
l=3D"noreferrer" target=3D"_blank">http://lists.busybox.net/mailman/listinf=
o/buildroot</a><br>
&gt;=C2=A0 <br></blockquote></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAH3JsOrK%2B8F4xXhxm8ytEawBQ63jswzBG8PW2naq40M6MAy=
ZQA%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups=
.google.com/d/msgid/jailhouse-dev/CAH3JsOrK%2B8F4xXhxm8ytEawBQ63jswzBG8PW2n=
aq40M6MAyZQA%40mail.gmail.com</a>.<br />

--00000000000004e07505a6e0e408--
