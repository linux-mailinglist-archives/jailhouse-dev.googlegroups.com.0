Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBUM27GCAMGQE76C2XUA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x337.google.com (mail-wm1-x337.google.com [IPv6:2a00:1450:4864:20::337])
	by mail.lfdr.de (Postfix) with ESMTPS id E50B23806F9
	for <lists+jailhouse-dev@lfdr.de>; Fri, 14 May 2021 12:13:37 +0200 (CEST)
Received: by mail-wm1-x337.google.com with SMTP id b16-20020a7bc2500000b029014587f5376dsf1651177wmj.1
        for <lists+jailhouse-dev@lfdr.de>; Fri, 14 May 2021 03:13:37 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1620987217; cv=pass;
        d=google.com; s=arc-20160816;
        b=jNoF8gep/lyvvKOczvTG+eDcnGV5HVxiU3R82jbsWQhNObbrHRLFPNU8eJjBSiffim
         wxaf7roEhkLERMM0Ou/37oANB8Nwz1v6DOqgH4HZon5Ajhesjg6jNf4hR7/XfD6Eq0r7
         gjaFjH2eB05MSWAhhvp0KnFZKsv9YQatixQ1bUahtcTVZx+kzc1uO4xZOGY18/tsUipM
         x+rFpN5nLnVK833vHNFm4gnlShKqzT8U/MQu0UadKNe/Nhax40QOkcP3ACkBv27pzgha
         hza+IGuA8Ev9my8NPDOv13I1OqOmqkrJEGPxBummDAZeOZdjkkXQw4WEyyQzajuBthUP
         QWDw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=Ic8ACtKZsWgdidDmPEzQz9RWft+QPEh/K5ycyH8gVwo=;
        b=HvyxCBtKNHdyVer3QxK4rR5p41lMTN2RkqYfPdrLgEfR2YDIlUr1LWFy2fNoP55Tkd
         Mqval15p6A/0gk3tGTRwMTNUEaUBXGuMJOcajWdlFMzVdCFGUKPmPnwo+YMfVpt5H2Zk
         VEDjruYe+oZCzq00YhOOXsOIEJ3dCrJ9ZrgqG21FuxtjiCdubvRwbGixf0vq/V/jz1Xt
         9UvJEZ2QhqQOaV4ffQoI6CZ21L/3kjdFViDKoHuMNMIjAFQSGdtKo2Pqyk4HaXUqTjij
         itkRcXlel3wlh1b74dS509ibtbXlmURX+Cv477gVaczVJUF1zU7xcto8sSnWzZxjUi7u
         0Pbg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Ic8ACtKZsWgdidDmPEzQz9RWft+QPEh/K5ycyH8gVwo=;
        b=iCcORHAyloGihMv4dCru8VrDPXi02+T70r5rhLvOVD2IYdAE8YOuQODC1Xy4Nh9oFS
         AYnAXIXY3zHG87Ky8YN1grtcTIFZSDbeejWnGu0x8A3/tOt1JU4EtITovqG+BHe/msaI
         3m+OEFmHlaDZUq/90g2L0kGAyJgoubwCLs5Qbte9ZwAUCKueerEho8/dKaB5nIDFbGEM
         Ilm7SVU9+PvMrChjpzAnKJynjS2at4eGI2D6+dWRPkokC5UEJca8P8O6feNIQtXBuuzy
         T01xVGCF8z/3djwh6pb/e1aEGJ8cjQ7BBWmzF6nqZLXON96jmA3+MZouPXeHSXLRPCkZ
         GrnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Ic8ACtKZsWgdidDmPEzQz9RWft+QPEh/K5ycyH8gVwo=;
        b=aEsJvFroEkcGk1jiIiO1ES2W89DiF+DcITkcTWL7FzYF25K3of3ZgRYfobvEe4nndH
         ahDdePsS5K+9tr4yWI9uzUarUgppNtLhQDlbu8nQGyB1fpcjyFgJDMNq2r25tjiOL6cz
         DTQ01fS9Tq/17NNIEKm6kTwvOJluGl2Y+Bt0M1aA6Gay6wTVhqfppe9A0uQNX2Ly+z3z
         PlkcSW/un5MadhYHTc3S/hGfezUczUfAOcg4uj1ulbPJ1I98cRigHE7ZamaD0TzfrAFy
         s2rn/C+hqL837Fr7wPPxZks3R0ybW1FyplDBHs2zDOV47ZRo9+dTS5lZDep1zi3DghQt
         PZww==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531NOPAKyHjcMEFTeJNIyHCbSfFewTL+kc8zNbOEQDwkYjGuIBqu
	kRuZNnQVOJJF4oTAHtbovG8=
X-Google-Smtp-Source: ABdhPJz+H2Uzf0TmHiTSVtpN4FPhT7Tn3bCe/5l1MVo2fqUR7N3LMqOKCbuE7Wr7p9rSvOb3xm9L4w==
X-Received: by 2002:a05:600c:322a:: with SMTP id r42mr8850015wmp.187.1620987217632;
        Fri, 14 May 2021 03:13:37 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:11:: with SMTP id g17ls3665215wmc.3.gmail; Fri, 14
 May 2021 03:13:36 -0700 (PDT)
X-Received: by 2002:a1c:6754:: with SMTP id b81mr48662374wmc.16.1620987216605;
        Fri, 14 May 2021 03:13:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620987216; cv=none;
        d=google.com; s=arc-20160816;
        b=XiWFpseO8qmgq9QX+TRePX7gFpuLmdrJn8Lo9iJbB5aCLYL03zveUyIPmHXBBTBK0l
         2ARnZFPRyGHRS59/2wW24pb9uaiD81qygugZqDtSmlZD6qEZjeQRv4yqKGLCh6wz5kW7
         NJprMiojQFM6o1xAqvvQ2EFZEDPGQ7VAaNH2187qpRytdB0SXoeDDq/L0vUAZqUqbvuK
         X0IupCA2X3QgXrf1y5k4vEQJqk4Q/KHdDWmw0NucxiSmfQNUY2dQAQj6knMEV9yU3I+E
         USBTGj9MbYFgknwGkJ5fBKWe1v1sh4//TtO0W32Dky1iSGGq9pn/VtIlEHv87RcxNF4D
         ONqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=N2LYYLmy/o0qjx/wNUUeUJmrQ2oBpD809QJ6M501LsE=;
        b=f8AmYGAZWNG+hACqddlpTc4DwjZ+vYT+wrsY9mQUNiW/64dn3yjS6jYrH5sq5fQ1N/
         9HpjfyLRjsKuXPjbPsXYYhbza/Gs+0KyPLvlL3L4RvgUojCNdTJanngdHkdiDR93/LPc
         C7crrJaTdIIEgW2Uq1WQndrvHbAptR6leA4BNqGf4Mzj01PTiqValiubqJKcxcvAP0yS
         /sSRzfIECz3z+L5rvSb6OWLNgIVcTmfsgsx3/H3ZFXUvlpM8MaCFzQIcJVf7h4rM1K7K
         cyaZYBT9P0+zDG2Zg4nFiS8XNpxQNzZ8Zy9ji18scix911AIEiP1geHpm/8H41brVNd6
         lWag==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id s185si1304wmf.4.2021.05.14.03.13.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 May 2021 03:13:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 14EADZpa025287
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 May 2021 12:13:35 +0200
Received: from [167.87.89.54] ([167.87.89.54])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 14EA6KSS016119;
	Fri, 14 May 2021 12:06:20 +0200
Subject: Re: Can Jailhouse work with CentOS
To: along li <v6543210@gmail.com>, Jailhouse <jailhouse-dev@googlegroups.com>
References: <299a190c-72fb-1027-0efc-7a45b98bffe0@cimware.in>
 <AS8PR02MB666300B8BE60E746F395D53DB6579@AS8PR02MB6663.eurprd02.prod.outlook.com>
 <CACNW3nS7kc-PwpimTmWFtF-MpFar+3Hsx7RFgOCtfpOOdxFszw@mail.gmail.com>
 <20210510123616.15344255@md1za8fc.ad001.siemens.net>
 <22bbb8a9-2af9-4e79-9a71-81f20e8f564an@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <b0caae36-ca7a-f6e8-5ea9-d612b6d00d40@siemens.com>
Date: Fri, 14 May 2021 12:06:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <22bbb8a9-2af9-4e79-9a71-81f20e8f564an@googlegroups.com>
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

On 14.05.21 11:11, along li wrote:
> It's very easy to build jailhouse in Ubuntu 18.04.=C2=A0 But not ubuntu
> 20.04( produce link error)
>=20

Newer kernels no longer support retrieving missing symbols via kallsyms.
So you need to patch and recompile them. That's what you need to do
anyway when you want to use ivshmem devices.

Patch queues are available at [1] and [2].

Jan

[1] https://github.com/siemens/linux/commits/jailhouse-enabling/5.10
[2]
http://git.kiszka.org/?p=3Dlinux.git;a=3Dshortlog;h=3Drefs/heads/queues/jai=
lhouse

> 1.install kernel-header
> 2.build jailhouse
> =C2=A0 make KDIR=3D/usr/src/linux-5.4.0=C2=A0 =C2=A0 =C2=A0 =C2=A0#KDIR i=
s set to the linux src dir
> or=C2=A0 header dir
>=20
> 3. install python and pip etc.
> apt install python-pip
> pip install wheel
> pip install setuptools
> pip install Flask
> pip install mako
>=20
>=20
> 4. install jailhouse=C2=A0
> sudo make install=C2=A0
>=20
> jailhouse should be install sucess.
> How to use ?=C2=A0
> 1.insmod=C2=A0 =C2=A0driver/jailhouse.ko
> 2.jailhouse enable configs/x86/machine.cell
>=20
> --------------------------------------------------
> The most=C2=A0 diffcult is how to write=C2=A0 good=C2=A0 machine.c to pro=
duce machine.cell.
> May this help you !
>=20
>=20
>=20
>=20
>=20
> =E5=9C=A82021=E5=B9=B45=E6=9C=8810=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=80 UT=
C+8 =E4=B8=8B=E5=8D=886:40:00<Henning Schild> =E5=86=99=E9=81=93=EF=BC=9A
>=20
>     There is no reason for "sudo" for a simple "make". It is likely you a=
re
>     missing kernel sources, or tools that the build process needs. Or -
>     given that distro - things are outdated. Jailhouse does not need much=
,
>     but also centos does not offer much ;)
>=20
>     try a fresh clone, no "sudo", "make V=3D1 -j1"
>=20
>     Henning
>=20
>     Am Sat, 8 May 2021 11:19:01 +0530
>     schrieb Prashant Kalikotay <pk...@cimware.in>:
>=20
>     > Thank you so much for your reply. While my installation I run sudo
>     > make and that fails with the error : /path/to/build no such file or
>     > directory is present. I checked the path/to/build and it exists and=
 i
>     > have also given superuser privileges to the user.
>     > Could anyone get me anything on this. I am using CentOS 8.
>     >
>     > Regards,
>     > Prashant K
>     >
>     > On Fri, 7 May 2021, 14:37 Bram Hooimeijer, <
>     > bram.ho...@prodrive-technologies.com> wrote:
>     >
>     > >
>     > > > Dear Sir/Madam,
>     > > >
>     > > > I am trying to install jailhouse in
>     > > > CentOS
>     > > but the installation did
>     > > > not work or it did not get installed. Whereas when I tried to
>     > > > install in
>     > > Ubuntu
>     > > > it readily installed. My query is does Jailhouse install in
>     > > > CentOS or is
>     > > there any
>     > > > additional things to be done to install it?.
>     > >
>     > > What errors do you get? Maybe there's someone on the list who
>     > > encountered those before.
>     > >
>     > > As far as I know, Jailhouse should run given that the kernel is
>     > > properly configured.
>     > > For newer Linux kernels, you might need some patches:
>     > >
>     http://git.kiszka.org/?p=3Dlinux.git;a=3Dsummary
>     <http://git.kiszka.org/?p=3Dlinux.git;a=3Dsummary>
>=20
>     > > I have it running with minimal modifications on Linux 5.4
>     > >
>     > > Best, Bram Hooimeijer
>     > >
>     > >
>     > > >
>     > > > Thanking you in advance.
>     > > >
>     > > >
>     > > > Regards,
>     > > >
>     > > > Prashant K
>     > > >
>     > > > --
>     > >
>     >
>=20
> --=20
> You received this message because you are subscribed to the Google
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send
> an email to jailhouse-dev+unsubscribe@googlegroups.com
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit
> https://groups.google.com/d/msgid/jailhouse-dev/22bbb8a9-2af9-4e79-9a71-8=
1f20e8f564an%40googlegroups.com
> <https://groups.google.com/d/msgid/jailhouse-dev/22bbb8a9-2af9-4e79-9a71-=
81f20e8f564an%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>.

--=20
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/b0caae36-ca7a-f6e8-5ea9-d612b6d00d40%40siemens.com.
