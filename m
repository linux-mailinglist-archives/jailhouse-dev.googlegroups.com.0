Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBSO73D3AKGQE46SZV7Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33f.google.com (mail-wm1-x33f.google.com [IPv6:2a00:1450:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D011EB9ED
	for <lists+jailhouse-dev@lfdr.de>; Tue,  2 Jun 2020 12:54:01 +0200 (CEST)
Received: by mail-wm1-x33f.google.com with SMTP id l26sf812195wmh.3
        for <lists+jailhouse-dev@lfdr.de>; Tue, 02 Jun 2020 03:54:01 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591095241; cv=pass;
        d=google.com; s=arc-20160816;
        b=cZPZ6jWuMVu9g1mNfny/hOMTvm795Cbm7lB8Hz/bpEntJ+AfxXYFLYYlP5e+WA/ZYX
         alotAeIcNlIPaYO0c91Vpn2UBS6lcxU+wWA77gVif6tJ/4WMrOJOP1bCzHly+8cMkiOz
         r0OPSLpNxwMGj6d0bALXt+Oed3AR6DrUOGlOVpccI6GDQR0Rsf4oPAtNtYWpribUi0MQ
         waH0zYrFrvjoJvbkhYqCp6L0Rg+MjO1QsQthfUoXbvf6EB+9lb2ylAphwoGMyFmtNGjt
         RSlojty5DnvCv37ZjtmP82xgahDiTw/Cf6Q0awHl1gvAcHxsxnN72QJH1CZNRUIvUdJv
         wyCA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=WL6Hob69TlkikOKuMYD9Ncj/gqL/oQJvfGmKtXgpBLs=;
        b=mR9aSQCxQejX619EXWS2KSuRwKzzm7GD/UFf9f5c09pxGhU3KUOznuNLYezQQgNtjy
         OQHR1a/dumGNVopLyjInT+Mtp9YjU9iRDHwSPuSAACkud0qrW//2ogWWzMV3N4VvASoN
         A8icft05K0Ny+zHnsoYgjjsfgXNHok1NTO475eVwep/JL+Cz6x4AH010uQbxdz0VYLq+
         2I1LEV1GHYv7P1BH2P3RpiQakQT6O+GJRK/XgXJZg7aJ2ohD8id5CrXFepp6Uoh7ltFE
         jdOoE+DnqCRwYWZlxwt2Df/ybRFB0Y8iQOQv5xdH+S6B9hSanlAujQ+CY7U9YXBtElWQ
         qwgA==
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
        bh=WL6Hob69TlkikOKuMYD9Ncj/gqL/oQJvfGmKtXgpBLs=;
        b=fl1DwKjZYdyrSesEM7PPR25RzJLFg/Bixt8eHzXaNZ86/9tyU/cuFtS509mLy4dNg9
         lO/DaibLsex00nkwr66ATsu5ItySd/++paGxvngvvyIAKy8QCNBh7pCI6GNwwAOkSnBb
         e455tADUQ4VRzg/n9IsaOlqja8mGKGLm7Zvcf9Hw5tFBrqGhU1eBsfRtljOJuB71bGTx
         Ss19iPdtlsK7JQEU9BHqp18FwWFy+dfJYzqoAEzE2edaShzcoOlnNQyLHcXo69yg9Xvb
         9r2dXTR9NxeADaLe9kSU+bnFn20aNjV2q02+3+lm8Bb9JPVWWMW+d60CXRoZHoV6KQHs
         +CYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=WL6Hob69TlkikOKuMYD9Ncj/gqL/oQJvfGmKtXgpBLs=;
        b=P6/Ae+YzzXtzhYXba0DTZ0SpdWvPQjmm65TFfs1LQfIfmhS/kLiq8UppChYf6ImBL8
         4jy8waIUF9oRjjrRyqiXLWqS4vpvak3ZN2oVJiTOe/rxE3P3+6YmcLiQXPvEusqdD10f
         Ly3EvMaW9DP8NEP0FEIGVeLkGmD2HPBTPoMBBENAnWR7cxTFDe0R2qqM6xZkynac3hxv
         t4l4r9a8fW2uPv0+yxqWCqe4VsfXBYz5751/iNn/sZmDbx5uowamLBAXyuq27qpwoHbv
         j+/iJ7P2Du41ivancFSi5L0Z/NvrO3szuTsn7ZWEXfiaOno2TOAjPfOY8poFOeaL5rdu
         1h5A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5333nT4hkOGyKpr+qu+mPbjmr2gJRua4uSowBIItxDV2cnV0EuxE
	1jXvBSXK8rCoYXZXVRZFTrw=
X-Google-Smtp-Source: ABdhPJxpUtHUdULCvnhDiA1n7Ljg40Lyd+1Bh49W7zjQrZHygqKPRfeGWdhLBUG8NCDFrhmzh2RlgA==
X-Received: by 2002:a7b:cd04:: with SMTP id f4mr3764782wmj.118.1591095241577;
        Tue, 02 Jun 2020 03:54:01 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:82ce:: with SMTP id 72ls20706348wrc.1.gmail; Tue, 02 Jun
 2020 03:54:00 -0700 (PDT)
X-Received: by 2002:a05:6000:7:: with SMTP id h7mr27926941wrx.55.1591095240802;
        Tue, 02 Jun 2020 03:54:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591095240; cv=none;
        d=google.com; s=arc-20160816;
        b=KjgaRgTismabNerCl+Hx2A/NFpCRQ1OhXq1jBjhSvzsBnUweBjyMFseb9azoaePTXi
         GymuXtQsqrS2w6KMbvGdr1dGHTIfjlae4i/Hl9KJQjdpVAiRGCyUgOK4ZJ3QAUf8dCmn
         jda9kXlaO9CXbhgMqkaUvH6nPSWQn72Qu9zTxHHGvn2jVxR+Atwhqf05xkerfBDgPpa2
         K0b4t8C7UGKo69Mt0x4AizODqffS1LRZ+WkSgW7OpOaehp9KFhOPFWwk11QykZTI1sPH
         9zgRBbQdidydSQ/m5XjyZPkIm/jVqyU2/0AHKnpaKVEPEF4hhjLqw70AVVqIIFr7b0sK
         KISw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=cmie7c6zyGl+H6awHj+2CbxL9YNypoDJMvdSk/F0dMI=;
        b=l77YHYi/6wyGE5mZ29OQhMkKT3JjAPBnhuDDmzH+H3zhzmfM89ut9vP8m/3MLFprx2
         Hrf8kb3+1Wpli7mnogTr6Sk5+85vULclTbhdZ8L2f5PifxJxP9Ifl/v1WsDeD/cjGE9r
         QEba1n5+AwQNV4cgY1cn0toKHDy88rEsa/87GqKP85ms5aZPP4t2jKG3U69ENSazjOkF
         POVm0T7xf4LGhEdUO7ap3PPK8ngNpTi9jwz7WJWWHip3w9nu2Gshi/OM9UXfWIgFdw7Q
         id6D+tovrMHrzfn1ctGDN/rfWjcti3zMhA8O6l+skTH3T3cqZSsYNYZEjK/LcxSiH576
         KFAg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id s137si112272wme.2.2020.06.02.03.54.00
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jun 2020 03:54:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 052AruxI003480
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 2 Jun 2020 12:53:56 +0200
Received: from [167.87.142.254] ([167.87.142.254])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 052ArrtT024246;
	Tue, 2 Jun 2020 12:53:54 +0200
Subject: Re: [Buildroot] [PATCH 2/2] package/jailhouse: add option to choose
 custom repo/branch
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        "Yann E. MORIN" <yann.morin.1998@free.fr>,
        Mario Mintel <mariomintel@gmail.com>
Cc: buildroot@buildroot.org, jailhouse-dev@googlegroups.com
References: <20200528144333.49268-1-mariomintel@gmail.com>
 <20200528144333.49268-3-mariomintel@gmail.com> <20200529204844.GR8737@scaer>
 <3806f122-f6b0-efba-e94a-64a3729fbe8a@oth-regensburg.de>
 <CAH3JsOrK+8F4xXhxm8ytEawBQ63jswzBG8PW2naq40M6MAyZQA@mail.gmail.com>
 <CAH3JsOrGo0k4S=VKfaXFbgkOv2jYvCB6nff0f+TihKz-1ok4JQ@mail.gmail.com>
 <20200601211902.GI8737@scaer>
 <8ede0323-ef3b-a405-81dc-80f92085ab93@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <08939374-fc1a-eebe-654b-a11d5d711e75@siemens.com>
Date: Tue, 2 Jun 2020 12:53:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <8ede0323-ef3b-a405-81dc-80f92085ab93@oth-regensburg.de>
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

On 02.06.20 12:04, Ralf Ramsauer wrote:
> Hi Yann,
>=20
> On 6/1/20 11:19 PM, Yann E. MORIN wrote:
>> Mario, Ralf, All,
>>
>> On 2020-06-01 18:23 +0200, Mario Mintel spake thusly:
>>> Am Sa., 30. Mai 2020 um 19:28=C2=A0Uhr schrieb Mario Mintel < [1]mariom=
intel@gmail.com>:
>>>   Am Fr., 29. Mai 2020 um 23:40=C2=A0Uhr schrieb Ralf Ramsauer < [2]ral=
f.ramsauer@oth-regensburg.de>:
>>>   On 5/29/20 10:48 PM, Yann E. MORIN wrote:
>>>   > Mario, All,
>>>   > On 2020-05-28 16:43 +0200, Mario Mintel spake thusly:
>>>   >> In addition to official releases of Jailhouse, allow to specify a =
custom
>>>   >> Git URI + branches. This adds more flexibility for custom
>>>   >> configurations.
>>>   > The overwhelming majority of packages do not allow selecting an
>>>   > alternate location. Why would jailhouse be different?
>>>
>>>   Jailhouse requires system-specific configurations. Those configuratio=
ns
>>>   are compiled from C source files to binaries during the build process=
.
>>>   While upstream Jailhouse comes with a lot of samples for supported
>>>   systems, you will need a lot of fine tuning to for a specific use cas=
e.
>>
>> I am not sure I entirely followed... Note that I am totally ignorant to
>> how jailhouse works (and I barely know what it is). So I had a quick
>> look into the github repo, and I noticed this:
>>
>>     A system configuration can be created on an x86 target system by
>>     running the following command:
>>
>>         jailhouse config create sysconfig.c
>>
>>     In order to translate this into the required binary form, place
>>     this file in the configs/x86/ directory. The build system will pick
>>     up every .c file from there and generate a corresponding .cell file.
>>
>> Is this what you were trying to explain?
>=20
> Yes. And that we want to use a git repository rather than a fixed
> release for development reasons.
>=20
>>
>> If so, then I think we need a way for people to indeed provide their
>> cells descriptions files, so that they do get compiled by jailhouse,
>> without resorting to using an OVERRDIE_SRCDIR.
>=20
> For the operational use-case, yes. For development purposes,
> OVERRIDE_SRCDIR is works fine.
>=20
>>
>> So I see a few options:
>>
>>  1- let people provide those .c files as a patch against jailhouse. This
>>     requires no infra in Buildroot, but this is not very convenient;
>>
>>  2- add a configuration option in jailhouse/Config.in, which people
>>     could set as a path to a directory with .c files; those would be
>>     copied into the jailhouse build directory before the actual build,
>>     so the documented way (see above) will be used; those files would
>>     have to be in a br2-external tree or whatever, but not in a package
>>     (because we'd have no way to ensure that package be extracted before
>>     jailhouse gets built).
>>
>>  3- let people write their own package(s) (e.g. in a br2-external tree)
>>     that only builds the cell files. That package would depend on
>>     jailhouse (or rather, the to-be-introduced host-jailhouse). And
>>     packages could also provide their own cell definitions, too...
>>
>> I think option 3 is the best solution, as it is the most flexible and
>> most generic one. However, it will depend on the possibility to
>> introduce a host-jailhoue package that can just install the 'jailhouse
>> cell cross compiler'. As far as I see, this is just a bunch of objcopy,
>> but this is quite tightly integrated into the kernel Kbiuld process, so
>> might not so simple to come up with.
>>
>> Option 2 is probably a good compromise if option 3 turns out to be too
>> difficult to come up with...
>=20
> True, option 3 would probably be the best way, though it could get a bit
> tricky.
>=20
> BTW, Jan, is there a reason why we don't (optionally) install the
> hypervisor's headers yet? This would probably be enough to allow us for
> compiling cell configurations apart from Jailhouse's build process.

No particular reason, we could indeed enable a -dev package.

Installation is a bit inconsistent so far. We also do not install the
generated configs and demo inmates in upstream, we do so in
jailhouse-images.

Jan

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/08939374-fc1a-eebe-654b-a11d5d711e75%40siemens.com.
