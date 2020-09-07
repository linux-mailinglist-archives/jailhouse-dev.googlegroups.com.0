Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB3443D5AKGQE4IVXBMQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43d.google.com (mail-wr1-x43d.google.com [IPv6:2a00:1450:4864:20::43d])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8AA25F8A9
	for <lists+jailhouse-dev@lfdr.de>; Mon,  7 Sep 2020 12:41:52 +0200 (CEST)
Received: by mail-wr1-x43d.google.com with SMTP id l17sf5528964wrw.11
        for <lists+jailhouse-dev@lfdr.de>; Mon, 07 Sep 2020 03:41:52 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1599475312; cv=pass;
        d=google.com; s=arc-20160816;
        b=oGEwdBLuUs1b1whwkTd3ohmU+RYVSxy348Dq4l7Ro6uOuaxcRcxPBMjYcdFikR+pbJ
         qY+xvqQm4njB+hfebnNGNeSwGj8WzKqQmR5GF1FGQ9AxNcvHaVKn/W7mpMuOommwBhNm
         2SuNa7YBfYmnq56pjawIptyjzvgEr1IVPNDgcsiDcfkdpqqgLTb8qr2ydm7Kh1LzPZko
         nOci3hxpRFD1McOg5S8dvcF7sFAWt/ZxRpna+a4iwGd4ZaMRrK0nATtMDN8mloCxKudU
         fn9WN/gsSd1cZpbfFkanwkvhbh2FVkRzATmFI9/M7ot6Aj5yn99emhkKMdDiHN+xRIEp
         rDhA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=LSnKRvMeArmQiwJgiZaX0jVEbJtIU2u74q9KY7/vuo8=;
        b=gO73RJvTwLZNUmhAMGcX8ui2OudEWXb+qKP7iQFKrg13FJQ6R7kNPnnpxPUZk3L3k2
         rviYh5nrl9yzazIcXpLfwBs5CznuD1FFsMo/wLVa1EzqJIkadiB+EX5CW8lyGx48ZLYz
         9CToLf0KmoGsh7DDWuiozdiVLWZKAyeDiQvLl79pPl8HCTcx4X/4U8IZJ/96ZVKz8CZg
         AeqvKsuMfOEmZvPDzm1braaVary3/2Ze3jXtlaWQZtLgT1zVr8wI+cWPCQa68TvizNH6
         rCMlLexzDoUH5fvJM7XgKSdzzbQ6AxHkNZGDSLMRX2L9CVqxmPymdXWa3ZUAQhhewiJQ
         jUZA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=LSnKRvMeArmQiwJgiZaX0jVEbJtIU2u74q9KY7/vuo8=;
        b=AVSVWtS2+mf26FMmjJTEIR0TaBhZAIpx+z/6+g0+g1tWbdbTa52si2pRcFsR45geEv
         1qUCkFLYhmLLUVJl7uZ+mdYPM51ag4yelYIiJTNAKZiBUObjwzZZ9I4Ld/9S2TP8x1j4
         kr2zqKq6p2TiNiLCHPII6RFv7HuoxB+f9yAWNGDuHyn5EYwNxYpNDfosPLY75LugeETm
         lOABFaA/zkTDxI2gTRU1PSbMjlwFMdLWjuR8I4wrxpdagLGZ4wZK6s9C+KmGt6sGIAUA
         zGa2VXysils6r7HIdk6xS2f5uLWu9Qan6HC1rdgbxCSvms2wcCjlRJXpfHo0diZqwVz+
         W4Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=LSnKRvMeArmQiwJgiZaX0jVEbJtIU2u74q9KY7/vuo8=;
        b=cRy3g8m/nL3KChgIuBgT5ZAyTFnkszDHuCVwbPSAX/ZxOP1oKsvF3KKKyDJ3mOw+WZ
         aHxshrbgyBCSoDw9WKH4wyBvQe6Iw0PnH6689LarOKQft1xfz5gSBfo1P+N8kq6qqYh1
         dXg7wkXC3/4ujWDW4HoTCGFvNMJQr0EylDkFdQ29j2JdiE+UbG6bT36AmVVnPBc4MIpu
         RLbcDWSoYnkXqYFrsvUb1UCSozt0Y4QBWTDgYRsArTf5YaZqYoBLrr3lR2fpFpYl+Nkv
         o14ZAbNtj5dHRA1xxgddefkWGvqeKJFmWOxXL0XAri0B9U3lRYp85CzwqAFj04r+s8n6
         FlXA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531UEKlA0Jwt3cnaIGl15yjUN22wAVUPgvWsvsrWNRaCQqzknfDT
	mdxpbHSABmvDdNANxGy4KVc=
X-Google-Smtp-Source: ABdhPJy/k40q/OuBXIjb1lHXt1uD8TiGB/oY8uXJb3NCAeJ27LUpWkN0FFxQT1pB8xPM3QUTFa01mg==
X-Received: by 2002:adf:cc8c:: with SMTP id p12mr21749233wrj.92.1599475312316;
        Mon, 07 Sep 2020 03:41:52 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:e3c3:: with SMTP id k3ls9336997wrm.1.gmail; Mon, 07 Sep
 2020 03:41:51 -0700 (PDT)
X-Received: by 2002:adf:9591:: with SMTP id p17mr21739252wrp.237.1599475311371;
        Mon, 07 Sep 2020 03:41:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599475311; cv=none;
        d=google.com; s=arc-20160816;
        b=O3SyHmmh7HEzF+DWddK/8DLYDFmc+o7HEo2l0x2kxDVlkjVZ9odb38TWxPw2Tqc9oR
         RfJkHBfTvHO8vJAV/qdATfTZ8HVGijm6m6m3lyGa4Nmcxiuby2JPCl/EmXIf6WbfAu0s
         I7y0VY62OoMFKkQAMOjFqhg2NFaVGQ1Tr0Kn9RpT8sWauVAZmjnpRBI/MhT7ww5nP3Li
         Ebs42ZWtGDKHoG6lskuzU4Hp36QVflIJY43Ay5XYoOby32+NKmhaedhWxlnLSPzlPz6Z
         XE3qojr9rKcY02Gaj1eVIj0PmMAtYnl1Ccmss8MvGqJOQVl0x5PEiff6fSX1BsQmybMd
         q7ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=jwJ6BtvjXuLJJGVV1+gje1ie2YRLKHItcM+gybC7Ue8=;
        b=QiZNuhN9sRb94oba5YRYDln8EQWW48IUjQSXQ+Ui/A4iahzctOSql6+UI2E5ZyZ9+n
         ZHxVHoaFoI+p8KHpqUh0we0G8vCfu6GqzYw+XFZp4AJngsUrccQqi8+SwheDnpVUXBcq
         G2k/dpOoERcHSo9P3Toq30uNwITAm7bRXHjYu8gJCavOqyqYnfYDBU+L6PWC6qXiUtGT
         c3cJmRsOYggYNZbAyS85+AA4c65IkkdNaJgg4rzybw67RWT3uMrl+JTI03d8mf9PHCob
         Q8QioMTClA0T3abed0kgG7Q0U1CDd/RoDa7/RdbCUh9KfozgjUDlbJP1YAyWMI6JPl2S
         Pu5A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id v5si174669wrs.0.2020.09.07.03.41.51
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Sep 2020 03:41:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 087Afo7w020521
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Sep 2020 12:41:50 +0200
Received: from [167.87.17.27] ([167.87.17.27])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 087AfnNM007520;
	Mon, 7 Sep 2020 12:41:49 +0200
Subject: Re: Build jailhouse on embedded target
To: Jan-Marc Stranz <stranzjanmarc@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <bccfc16d-0fb3-47e7-8a25-9c85ebf4b5e6o@googlegroups.com>
 <629cee36-86a7-4239-a997-baa2d165f08dn@googlegroups.com>
 <716a1db0-3392-40d6-a6ac-051ca2a52ce7n@googlegroups.com>
 <0153a372-c0c8-48d7-a595-aa502f81b09bn@googlegroups.com>
 <f7aa0d56-f1a8-ff95-c565-d1f7edc707a3@siemens.com>
 <7ce9ec5d-5e58-4b39-ac21-2f6a1d391ce4n@googlegroups.com>
 <6aaac5b2-1c88-699a-6568-0642e4a1a4a7@siemens.com>
 <2533b2ec-3ff2-4c01-8899-d1ada8d578e9n@googlegroups.com>
 <dd5c252f-516e-3758-917f-a0cd5ca0f4c4@siemens.com>
 <CAOOGbpg5t1ykh1OaS_rKXMzfL2u9F+igLuoA3wSg4boAhxtuWQ@mail.gmail.com>
 <9ff0b838-a854-3ef0-6487-dbda6d488184@siemens.com>
 <CAOOGbpgwq0=B85FFAaPCGC+W3UsFYtp6ROAsCbUdD2=g_Ak1kw@mail.gmail.com>
 <b501a3d0-70cd-2126-8fa0-fff217caa20c@siemens.com>
 <6765e219-706a-4124-9ac2-d40109d69f7cn@googlegroups.com>
 <2924a8c6-5b7f-427a-846e-9fc0e64bad53n@googlegroups.com>
 <6ab98ec9-0255-830c-589d-781da3bd2838@siemens.com>
 <cc674085-e9fe-4bd9-a591-47593459c6f2n@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <138c5784-6dbd-add0-2364-9fef4b7a9ea6@siemens.com>
Date: Mon, 7 Sep 2020 12:41:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <cc674085-e9fe-4bd9-a591-47593459c6f2n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

On 07.09.20 12:28, Jan-Marc Stranz wrote:
> The line
> #!/usr/bin/env python3
> =C2=A0is already included in script
> "/usr/libexec/jailhouse/jailhouse-config-create" as first line!

Was apparently patched by the installation procedure of Yocto. Then you
should be covered by the python3-mako support of Yocto. If not, it's
likely a Yocto bug.

We effectively just do this:

# python
>>> from mako.template import Template

What does that report when run manually?

Jan

>=20
> I can not use a distro form SUSE or Debian.
> I have to build our own distro with Yocto (here: "warrior").
> And Yocto always installs "python" ("python2") and - as a runtime
> dependency of "jailhouse" - "python3" and "python3-mako" also.
>=20
> The is no package "python2-mako" at all; only "python-mako".
> And the packages "python-mako" and "python3-mako" clash with the file
> "/usr/bin/mako-render".
>=20
> Has anyone already created a BSP with "jailhouse" using "Yocto" and
> solved these problems?
>=20
> j.kiszka...@gmail.com schrieb am Montag, 7. September 2020 um 12:01:46
> UTC+2:
>=20
>     On 07.09.20 11:23, Jan-Marc Stranz wrote:
>     > I've build a Linux kernel with CONFIG_STRICT_DEVMEM and
>     > CONFIG_IO_STRICT_DEVMEM deactivate, but the hardware check still
>     not works.
>     > From now I'll ignore the hardware check.
>     >
>     > I've tried to create the configuration for the root cell on the
>     > targetwith " jailhouse config create sysconfig.c" without success.
>     > I get an error message "This script requires the mako library to
>     run".
>     >
>     > My root-fs contains "python3-mako", but "python" ist still "python
>     2.7.18".
>     > What version of python is the script unsing?
>     >
>=20
>     Distro default. Likely still python2.
>=20
>     > In my image recipe I can't add the package "python-mako" because
>     is is
>     > already provided by package "python3-mako".
>     > How do I get out of this dilemma again?
>=20
>     Try "python2-mako"? Or use a distro that does not have such problems:
>=20
>     SUSE:
>     python3-Mako-1.0.7-lp152.3.3.noarch
>     python2-Mako-1.0.7-lp152.3.3.noarch
>=20
>     Debian:
>     ii python-mako 1.0.7+ds1-1 all fast and lightweight templating for
>     the Python platform
>     ii python3-mako 1.0.7+ds1-1 all fast and lightweight templating for
>     the Python 3 platform
>=20
>     As a workaround, you may also write
>=20
>     #!/usr/bin/env python3
>=20
>     into tools/jailhouse-config-create.
>=20
>     Jan
>=20
>     --=20
>     Siemens AG, Corporate Technology, CT RDA IOT SES-DE
>     Corporate Competence Center Embedded Linux
>=20
> --=20
> You received this message because you are subscribed to the Google
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send
> an email to jailhouse-dev+unsubscribe@googlegroups.com
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit
> https://groups.google.com/d/msgid/jailhouse-dev/cc674085-e9fe-4bd9-a591-4=
7593459c6f2n%40googlegroups.com
> <https://groups.google.com/d/msgid/jailhouse-dev/cc674085-e9fe-4bd9-a591-=
47593459c6f2n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>.

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/138c5784-6dbd-add0-2364-9fef4b7a9ea6%40siemens.com.
