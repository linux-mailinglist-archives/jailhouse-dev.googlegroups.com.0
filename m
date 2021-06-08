Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBAFX7WCQMGQEPVDMUXA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oo1-xc40.google.com (mail-oo1-xc40.google.com [IPv6:2607:f8b0:4864:20::c40])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B5E39F5D9
	for <lists+jailhouse-dev@lfdr.de>; Tue,  8 Jun 2021 13:58:58 +0200 (CEST)
Received: by mail-oo1-xc40.google.com with SMTP id r130-20020a4a37880000b029024987ad471csf6010435oor.17
        for <lists+jailhouse-dev@lfdr.de>; Tue, 08 Jun 2021 04:58:58 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1623153536; cv=pass;
        d=google.com; s=arc-20160816;
        b=wq2zoTpdPHPYIz43OcrUBjq8QRTxkLmDP2/48dSitFf9ZK7/u/3X1L8XvvxMDRT3sq
         R3peFNqZNN/xrYcrCpdxWvlPPcIOSrGyZpQw5T4R/+B7n+L8HosZeEHaw8VJHXai2VYN
         rSp9ryUN0dR8W83pDTvcBANGjhw20iNOfhg+lNjGtA3JgAVfIxzfXQteMdTHFlv9E/Va
         8J2b0knlWQdVkhRHLreTzm/X5k/G6h3eejtUJhCdMHJo7A2qeqM/fX2s9GV9H/lpzV/q
         PVhUXfrJ0SYcXHodihYybLkyWBlwzCXkISQ+1Gs9QmRVYTzNozLW1I9D1x+lQEcTQaUq
         tc1A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=dr+9DYk9VZwZlqFgLINZfAlaSLjQr+LqjJgnrnCG73M=;
        b=mbn7fSIPl1l7V24Dy3vhUkFbWjyYN6v6Xz0stpxNae4PJ7+5GYnY1s/miFkzad8nDB
         gifqRCwe3f3kwvzU5ATvvF+rg2N4ICGCZ7blZqCZipcjLSgzfjzu6dFxXCNdDr8BiH/x
         VPmyia7IMqkvTuIAQCzU0/ZcbY9TLQQBPkLqkUZPUabC3qFUADKYaick5iuDghdAt+81
         GidclCIdNaQ8zMiUZtUYWs7NAiUMn/c3Osp8fYD0I7DTOINaCXhFrLjLLFJavan3AGuD
         eUNAVtM7mabx7abX0OzUmQwt1mKSBz4q8MY+It4wD8R5kL3W7ZSvxBig6CEx1NqIP4wa
         MpUw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=dr+9DYk9VZwZlqFgLINZfAlaSLjQr+LqjJgnrnCG73M=;
        b=qJwcCohJGsjVFWL7q+H/hFSLmAKcdQu3qSm/N8lkCmAIXCJY8RqH6uDUCjUw0ZzAR3
         YMSqYRrEcOHYPnupPsVK1gtqVKmx23/mkYhLNs9gUBtAYmj4c9zSdhZEBDpVOo6dHTkc
         A0q46eybc+wepI81RQI+ZzcXweKTt0HzgJKL1rifIMRl7x5AHQrZ1huYyscyUcTEL4CS
         ot5p7nNermeuILQDXC90TSpD7hzpMBPa5RVRnF+laoPwKO1xthvnbi9WTNsg9AHETVGx
         81tqqaLDUuSZUrsIBlhKDKLW+ds08cuWTtY8Op7RjMAHA8yqrQST+wYtvlUflb01R+Ox
         Mitg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=dr+9DYk9VZwZlqFgLINZfAlaSLjQr+LqjJgnrnCG73M=;
        b=qqk8w9agvzR7Xamo0tlTY0Yawi8h/kfvd5gZs6Vwqw2PS+dS+U0uC8DyeMUN02tcSZ
         qdm24ZfjoTa/oeLmJFbTEett5rQoWVbiDzswpIVOZD/mwwvULaLd1aOF7U0uKUQR4mPd
         xUnZmp+XPxS1gWYuvkyqTQRoDeOhZWvjauAJnbl4y/bCFsJw0m1F565Z2XjQJxBDx4Ug
         W39b/dAQ7WzOhaoMnp4MK61015AUU2t1p2oAQg5wMH+Ao49Vm0LBU7eGC8y97IZhw8X3
         BrZd3rAmqlpreA+aNJaQq1ACcsM1gndYSHtddRCBg1E3MO1N/Jti5Z/RDwS97pLQXjl2
         phrA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532S4DI4zXH+LipvmBuK2nQZkrYIw+bu2E4+DFiD7EQ/zCZXN+c4
	dJinnm2+5z9X54pNPp+8HwE=
X-Google-Smtp-Source: ABdhPJx7HmNnJdYv8ZwtLj8SAXYXK+oDglX5qMeLN3TwUIlumFv2AgYGgLTgd7Id9BX+OpgW9UvlCQ==
X-Received: by 2002:a9d:be4:: with SMTP id 91mr16435390oth.33.1623153536638;
        Tue, 08 Jun 2021 04:58:56 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:51c6:: with SMTP id d6ls5541079oth.7.gmail; Tue, 08 Jun
 2021 04:58:56 -0700 (PDT)
X-Received: by 2002:a9d:6255:: with SMTP id i21mr18018478otk.284.1623153536140;
        Tue, 08 Jun 2021 04:58:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623153536; cv=none;
        d=google.com; s=arc-20160816;
        b=TSsonPoI+QP2+yLjjfKu2Wc/L3gSZUCp9wnM1PHTFbtSr2C3LvtMIaePnVZqJqjmXJ
         kTXUKwDJRaxZzOuh845kUY02ueOzamr1nYmBBUWErxfvNdUjjo0viUjtGuh5o4MDcgAs
         tiT8SzyEHhAAsf0a5vn/LLLUWrwlndwlqKOZG5QeX3ci702QcbCViulQBZR4uczPf+Wd
         68Pi+VUtS3ljuX9ENbF/JRP7G3GLlaL0KesYEelXllpGbMyYmpNswOFL0QvQVGgG48i4
         gcorKi+DCLhqtWvN7TGpxUKuSw+H9cK1eEt+m0RpaPzcGyY6Bo128Ff9rLYuNthslb2U
         1hrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=pQjLblChnuIfpXiSfjsO4DDErsoGyhjMaxXAnU/9jDc=;
        b=qMlOcdpPtkQLB22qLbGOxDi9VxNraYpAySJK15x9+poIKSAKa6eWb0Cr7SU1r+hSw6
         7+OLRqBKPO0LvkbKR02ftrR5yDHiWpOBHvcSHOE16N6opCylXJRSC5uSA0Q+lT/i62N8
         WmhXHaOELZA1YeHCIPeRB4RCcwqnavOX0Cj9xzJZVx4qIVPKC69C+OdT4eFfzDry81EY
         wrkMxxKt6vMuSWCy0VF4JOx1M63pi6eeVFQU7VE5Gg9InNe/wk94qkzLHc4Q/dP5scy+
         Sxf0RhUx3VqPAi7567NTHB60OPqnQIg+IYpZ3BawMoh0Jpcb3wZDyMkOzhSA82UXw4FE
         ZdDw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id a10si1751429oiw.5.2021.06.08.04.58.55
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Jun 2021 04:58:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 158BwqrD016768
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 8 Jun 2021 13:58:52 +0200
Received: from [167.87.44.81] ([167.87.44.81])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 158BnFqO017446;
	Tue, 8 Jun 2021 13:49:16 +0200
Subject: Re: install and run jailhouse on rpi4 board
To: Nikoleta Markela Iliakopoulou <nmiliakopoulou@gmail.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <10331404-4fab-410c-ba3f-77f4ed6ccbebn@googlegroups.com>
 <8a66aab0-1fff-007e-5a7a-dc150fb15031@oth-regensburg.de>
 <a2718c06-afe6-603e-e9bb-92e7518c48ab@siemens.com>
 <CAMPOHCnrnzQCiruXMCpoUzoq1t5-UgyyonGfXAwmCRiHvjeMtg@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <4711342e-5773-7cac-294c-604b70607cda@siemens.com>
Date: Tue, 8 Jun 2021 13:49:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CAMPOHCnrnzQCiruXMCpoUzoq1t5-UgyyonGfXAwmCRiHvjeMtg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

On 08.06.21 13:38, Nikoleta Markela Iliakopoulou wrote:
> Hello,=C2=A0
>=20
> Thank you all for the guidance.
>=20
> =CE=A3=CF=84=CE=B9=CF=82 =CE=A0=CE=B1=CF=81, 4 =CE=99=CE=BF=CF=85=CE=BD 2=
021 =CF=83=CF=84=CE=B9=CF=82 4:44 =CE=BC.=CE=BC., =CE=BF/=CE=B7 Jan Kiszka
> <jan.kiszka@siemens.com <mailto:jan.kiszka@siemens.com>> =CE=AD=CE=B3=CF=
=81=CE=B1=CF=88=CE=B5:
>=20
>     On 04.06.21 15:32, Ralf Ramsauer wrote:
>     > Hi Nikoleta,
>     >
>     > On 04/06/2021 12:24, Nikoleta Markela Iliakopoulou wrote:
>     >> Dear all,=C2=A0
>     >>
>     >> I am student in ECE NTUA and I am studying Jailhouse for my diplom=
a
>     >> thesis. So far I managed to install and run jailhouse in virtual
>     >> environment (QEMU) in x86 and use ready-to-use jailhouse images
>     for virt
>     >> environment for both x86 and arm architecture. Now I am assigned t=
o
>     >> install it on rpi4 board.=C2=A0
>     >>
>     >> I know there is this
>     repo=C2=A0https://github.com/siemens/jailhouse-images
>     <https://github.com/siemens/jailhouse-images>
>     >> with ready to use image for rpi4, but I would like to install it
>     >> manually to explore better all the options provided, write some
>     code on
>     >> my own and test it.=C2=A0
>     >>
>     >> I have already explored the internet and this google group for
>     further
>     >> information, and apart from some general guidance, I didnt find
>     anything
>     >> specific/(or maybe I coudn't understand some key points).=C2=A0
>     >>
>     >>
>     >> I would really appreciate it if someone could give me some
>     >> advice/guidance on this subject.
>     >
>     > It's basically just a few steps:
>     >=C2=A0 =C2=A0- Take the distro of your choice
>     >=C2=A0 =C2=A0- Clone Jailhouse
>     >=C2=A0 =C2=A0- Clone Jan's Linux/Jailhouse tree [1]=C2=A0
>=20
> I'm trying=C2=A0to build (cross-compile with=C2=A0gcc-linaro-7.5.0-2019.1=
2 ) and
> install the jailhouse-enabling linux-5.10
> from=C2=A0https://github.com/siemens/linux/tree/jailhouse-enabling/5.10
> <https://github.com/siemens/linux/tree/jailhouse-enabling/5.10>
> .=C2=A0
> =C2=A0
>=20
>     >=C2=A0 =C2=A0- Build & boot your own kernel (you can refer to the co=
nfig in
>     >=C2=A0 =C2=A0 =C2=A0jailhouse-images)
>=20
> So, regarding the configuration I found this file
> :=C2=A0=C2=A0https://github.com/siemens/jailhouse-images/blob/master/reci=
pes-kernel/linux/files/arm64_defconfig_5.10
> <https://github.com/siemens/jailhouse-images/blob/master/recipes-kernel/l=
inux/files/arm64_defconfig_5.10>
> .=C2=A0
> I copied the file to .config and ran : make oldconfig because it was the
> only way for the config options to get accepted. Then I am asked for
> other general config options as well, which I put at random.
>=20
> Am I doing something wrong here?=C2=A0
>=20

Randomly ;).

Use "make olddefconfig", that's what jailhouse-images does as well.

> After that I built the kernel and transferred the Image to the
> raspberrypi4 made the necessary adjustments in config.txt
> (kernel=3Dnewkernel.img) and ran sudo reboot.=C2=A0
>=20
> It doesn't boot at all..=C2=A0
>=20
>     >=C2=A0 =C2=A0- Build and run Jailhouse
>     >
>=20
>     In addition on this target:
>=20
>     =C2=A0- adjust the boot process to use TF-A
>=20
> I managed to do that as well.=C2=A0
>=20
>     =C2=A0- inject memory reservation as DT overlay
>=20
> I thought of compiling the latest jailhouse.dts and aliases.dts files as
> long as I boot the new kernel.
>=20

Get a booting kernel first, correct, then do the tuning.

Jan

>=20
>     Finding the right combination of versions yourself can be very tediou=
s
>     (I've already spent many hours on this, again and again). So it is be=
st
>     to follow what jailhouse-images does - or, even better, build your
>     customizations on top.
>=20
>     Jan
>=20
>     --=20
>     Siemens AG, T RDA IOT
>     Corporate Competence Center Embedded Linux
>=20
>=20
> Any comment on this is greatly appreciated.
>=20
> Thanks again in advance.
>=20
> Nikoleta


--=20
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/4711342e-5773-7cac-294c-604b70607cda%40siemens.com.
