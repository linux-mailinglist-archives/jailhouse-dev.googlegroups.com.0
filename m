Return-Path: <jailhouse-dev+bncBD7KJ5F42UDRBWWQULTAKGQEPMQ3AFI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43d.google.com (mail-wr1-x43d.google.com [IPv6:2a00:1450:4864:20::43d])
	by mail.lfdr.de (Postfix) with ESMTPS id 6254110077
	for <lists+jailhouse-dev@lfdr.de>; Tue, 30 Apr 2019 21:56:11 +0200 (CEST)
Received: by mail-wr1-x43d.google.com with SMTP id o16sf16506675wrp.8
        for <lists+jailhouse-dev@lfdr.de>; Tue, 30 Apr 2019 12:56:11 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1556654171; cv=pass;
        d=google.com; s=arc-20160816;
        b=J0BmaBfwE/oVIBTgYTapsj8eVmgFLSushfGNkEU8w7hR53gxwyQVAc7I3bxxT0jgKQ
         GbbthWP0U2b3MpT0qC4fT7B9W5N/vWooGk7Wfi7AjJPxmBRHfR1wM8ILmrOowjRJJn+4
         fjVuN4C7O3XGFNIlPgsYd0DkIaKRIVQ3SZjhZjFqiMG6ksY528v0ZDiHwWRSlkYvAkEw
         dVeN5E0KjI88PB14wd+be4JLPlEo/OQLd0joT65rt4Beex4Png9YNnzKhj5KkaiN8GX8
         CczPh43aNyK7x4k0wDsOkxPmHl+VB0bV4Y0iYFx33EyGUb1m6eridq4xp3HNJ6rUOfCo
         5ADQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-id:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:sender:dkim-signature;
        bh=Cx0wpFIlgOHWlQrlrSb1kgS9sm/ZGyVjWXKfSG13LLs=;
        b=SjePfZwB06D3BWE1qsd+wq2x82HHgnEJLHy1YFECor+G9yZJLMLVcwtqDo8RsASJ4J
         M0Km9FAVQR+NMcPhc1HMFy2EsX/dA21A4Xf4aMYqeVzVPkXSzWY6gGLKF5SVxtoDOXXW
         gGNQ9pLllGcU9UbxU8jZVIcSHYNviibEQHvTIaY0G3ztW+OGjlSyKwqqg+p2JFbfENdj
         cP14lJig4fbSQfsHQyEVDDQyBTC67Z7QObYzB2bFicLYkx9n4Wxft98XeP7zmPuB3WBi
         BOitvd0DuPLzDsHLPE1phgzPKAUYY48rCVaPIetMG2UaVC1i/ajCh6L4n6YxGqW7z9EY
         WX0A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@Softube.onmicrosoft.com header.s=selector1-softube-com header.b=givvN5ft;
       spf=pass (google.com: domain of arvid@softube.com designates 40.107.5.130 as permitted sender) smtp.mailfrom=arvid@softube.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language:content-id
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Cx0wpFIlgOHWlQrlrSb1kgS9sm/ZGyVjWXKfSG13LLs=;
        b=ZTpr2OxqQ/QlqIK3KstFqQPf2QOvJ5HCpor08MFT9erODfaWWexuVSQ9yiLWMWRHh8
         beODaDaWyXf7x4dR3xUjgqIqMzTIu16gijbZ5sxmn2xfF6JP2HrActg7K4M2LNPATll1
         H8jHjP+urOoEqBL8aeL81eoc95th29FnSTvGMU3HX8kIxIbIX6CrIkHkRLhRLiLoBOQl
         rTfGNDn+WooxHfs1DF2FuTe6fzGXFB5o36W5A57chHbZp6msJt+7eXga+uaTuktRBYGf
         z4rBC2RGUsT/H0Q2kMnFP9ECV8qnZJ4zsE2lf9iZK11BKVNNH+69MqD2TK/oAnm1V2K/
         7oug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:content-id:content-transfer-encoding:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Cx0wpFIlgOHWlQrlrSb1kgS9sm/ZGyVjWXKfSG13LLs=;
        b=AO49Gvj5an7YIIUHT44HFOHYkzYEUfiynV6TrNeRLSIDQ6vRqw/SqcEuFMfyBYp8cv
         vd4K3//2KHA5AaBD2N1nB4EoseLCxAy+cYKQsUuKaYjsPqJFfGY+TgJi7JDib42l18oF
         qYdda/55Er+85Cs6nhnT0kc6sHeQTRDIqpE9EfjBYHKQ7fpQ8cZqRwKYmAyYOUnKrH7n
         RrjoPAbCJxGrDb6d1vGtc+ruU18/LgOqMrMN2PDD2SpNGnMfNbD74drjmJ82vWUTtyxN
         dU+IOFlRFSlexTaec1KLZu8n+1Ja9pu60/RKFvfpq51ngzEIEA3hMjRpyzt76PcPeeFA
         L27A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWZSwyL6Tj3QHVzh7hoRxb1460yQ6FriurLziCOflveH4Lywsc6
	MCv6nJgB4L0wqThdSqNtJMY=
X-Google-Smtp-Source: APXvYqz2BTqVrDZdtX1M+lR/d9Tlv8pVfw3JpASS+HKMlbrOZXUYfUfeo8jsrblXZ126AILMxCDYzg==
X-Received: by 2002:a5d:53c8:: with SMTP id a8mr22980576wrw.38.1556654171097;
        Tue, 30 Apr 2019 12:56:11 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:6b10:: with SMTP id v16ls7632985wrw.11.gmail; Tue, 30
 Apr 2019 12:56:10 -0700 (PDT)
X-Received: by 2002:adf:fe0c:: with SMTP id n12mr2399556wrr.285.1556654170492;
        Tue, 30 Apr 2019 12:56:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556654170; cv=none;
        d=google.com; s=arc-20160816;
        b=ZvWljDmBDet66ggM2q1vZ3NXTjsMvHRRKA9q9WSKgIr/bSPP4jkigZk8Piu31Kn9i1
         esGhykvDC6zk9+WSHuDErmLkz7h5eNOc2OE8LritlJa6JAKxrHpYMAmH44Qf9NVOCSl2
         vxWuDnpt2vZv79X6G/Z6YrQa86wV6toyznOdATO818gMeW/A7WCVqWIFOqQYHtY/yzBJ
         8JN3h9SeaAXmZDBF5sNY8kYCkmK4qySgXsi3MDHUtPYbQprI05EWsKlUekuEEakglqm1
         5+yInnDRaSRfxJerZukp+U23s7u9suoqdfTUTZJZLD5lGcPtG+wGf/U4qtLeXXm5zTsM
         t/0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-id:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature;
        bh=ktK/vxrUrmLoetEgrGyfTQoXDvl+/5M0qWDVT0VM77A=;
        b=rz+spQVyQlcw7zf56cwVth/KTSDM7nCwhhok4aWxjoC7hkhtaZlEvcd8199newpW2H
         uag9Bbsa4R4KTouNTVZtSFwac/mDi/7FiM9oVupMoua6UA/xi6fUT340rHBHDV+Ie5xJ
         shDNd3OLCjVv/lWEnjojODayAm5D/dRrCeZw0L+ySETwGUjgky/8HlF37kww9wK2LBX9
         o3AwOGm/8PhbNP7W/EDw4BGp++VP5sKMePrlP7NDyCH9tSQUM2AXYCVPrLuPR9L179iD
         p6TTnnXiY/HHcbZ+w1y/Ym1NxFu2lFe010LSf6qbZUFWuTGroznqr6AQAx1RuG7tLpK5
         8n+w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@Softube.onmicrosoft.com header.s=selector1-softube-com header.b=givvN5ft;
       spf=pass (google.com: domain of arvid@softube.com designates 40.107.5.130 as permitted sender) smtp.mailfrom=arvid@softube.com
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (mail-eopbgr50130.outbound.protection.outlook.com. [40.107.5.130])
        by gmr-mx.google.com with ESMTPS id f188si189340wme.0.2019.04.30.12.56.10
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 30 Apr 2019 12:56:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of arvid@softube.com designates 40.107.5.130 as permitted sender) client-ip=40.107.5.130;
Received: from HE1PR0201MB2332.eurprd02.prod.outlook.com (10.168.150.22) by
 HE1PR0201MB1532.eurprd02.prod.outlook.com (10.166.121.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.13; Tue, 30 Apr 2019 19:56:08 +0000
Received: from HE1PR0201MB2332.eurprd02.prod.outlook.com
 ([fe80::69ad:976d:5122:6b96]) by HE1PR0201MB2332.eurprd02.prod.outlook.com
 ([fe80::69ad:976d:5122:6b96%8]) with mapi id 15.20.1835.018; Tue, 30 Apr 2019
 19:56:08 +0000
From: =?utf-8?B?QXJ2aWQgUm9zw6lu?= <arvid@softube.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
Subject: Re: Building on Orange Pi
Thread-Topic: Building on Orange Pi
Thread-Index: AQHU/33X36/w3ziF40Wwhk63RnMw+6ZVFyAAgAAo64A=
Date: Tue, 30 Apr 2019 19:56:07 +0000
Message-ID: <225DD87D-67CA-4969-A334-B1B27FB05B9E@softube.com>
References: <F1D21E89-5762-4890-A51F-5BFC0F0B4E0A@softube.com>
 <75218ca9-fd8f-6afd-8972-0852c8121060@siemens.com>
In-Reply-To: <75218ca9-fd8f-6afd-8972-0852c8121060@siemens.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [81.230.58.122]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a2b4a911-a88c-4509-4d00-08d6cda5e2fe
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:HE1PR0201MB1532;
x-ms-traffictypediagnostic: HE1PR0201MB1532:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <HE1PR0201MB1532453B7873E6C6CE5A9F89A13A0@HE1PR0201MB1532.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 00235A1EEF
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39850400004)(346002)(366004)(396003)(376002)(136003)(199004)(189003)(8676002)(229853002)(85182001)(25786009)(305945005)(6246003)(6506007)(53546011)(71200400001)(6436002)(71190400001)(2906002)(7736002)(66066001)(53936002)(316002)(6306002)(6512007)(86362001)(64756008)(76116006)(66476007)(66446008)(66946007)(66556008)(73956011)(68736007)(508600001)(6116002)(76176011)(85202003)(99286004)(3480700005)(3846002)(110136005)(33656002)(5660300002)(36756003)(81156014)(486006)(81166006)(82746002)(6486002)(446003)(102836004)(26005)(2616005)(2501003)(8936002)(11346002)(186003)(476003)(966005)(256004)(83716004)(97736004)(14454004);DIR:OUT;SFP:1102;SCL:1;SRVR:HE1PR0201MB1532;H:HE1PR0201MB2332.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: softube.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: EAu/ktH2rizx7fd3DNJR7Ef27N55+BlNzWNdYVPrRcGpGglDeO+5JptI2PcqRlHmD29D3AkiUzm5xayafX68hgGmLS4MaH/kAm3qV+bQ40uhc+oYG745jWK15NnEFMchDWL4J5cIGLePka48pej7y6HNAQQM8K4ghmeIXDqHTtwiqNbgCa2nRha98rvvE5l/zxpDpYjianrOVCvcbjEDVRg16i1swO1AtFdMDXwKiycwlqA11XcgeJxKSu1klz/r8Kqa8f/3oXdnxOW4/USviP9HXyOGiJ8tSE4NpDwmljXulA5RuHWhi9u/SXIAMJt9u2pCP7P8N7ovP1v00ijnC9H0xYJbK5+e2WmBWRxC04s6TtvPHHA0ERxD6Lqsdfs0vThrqFX44cufgD3wxAGwNv1O56qx9UO6ByPFZbUPXEI=
Content-Type: text/plain; charset="UTF-8"
Content-ID: <A97E95EDB736194EB55AA4857549F9CA@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: softube.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2b4a911-a88c-4509-4d00-08d6cda5e2fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2019 19:56:07.9106
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8974e373-3f62-4142-9b7f-1b77262c89ea
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0201MB1532
X-Original-Sender: arvid@softube.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@Softube.onmicrosoft.com header.s=selector1-softube-com
 header.b=givvN5ft;       spf=pass (google.com: domain of arvid@softube.com
 designates 40.107.5.130 as permitted sender) smtp.mailfrom=arvid@softube.com
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

Hi Jan,

Thanks! Sorry for top posting and also being unclear. I can pull the source=
s from the repo, and download kernel sources for the running kernel. Howeve=
r, when I try to build it, just by typing "make", I get a build error relat=
ed to the syntax used in .S files and also something that I think is relate=
d to tumb2 instructions. I presumed that I either needed some special toolc=
hain, or some custom configuration in the jailhouse tree or maybe some patc=
h or something. Or is this supposed to work out of the box?

Cheers,
Arvid

On 2019-04-30, 21:29, "Jan Kiszka" <jan.kiszka@siemens.com> wrote:

    On 30.04.19 19:55, Arvid Ros=C3=A9n wrote:
    > Hi!
    >=20
    > I have successfully been testing jailhouse using an Orange Pi Zero, a=
nd the=20
    > pre-built images. Very cool!
    >=20
    > However, for some more testing, it would be convenient to be able to =
compile the=20
    > inmate code on the device itself, rather than trying the set up every=
thing with=20
    > Yocto or however the images are built. I tried to compile the latest =
Jailhouse=20
    > source on Debian installed on the board, but that doesn=E2=80=99t wor=
k out of the box at=20
    > least. Has anyone here any experience regarding this? What would be t=
he simplest=20
    > way of getting started to compile some code for running various inmat=
es on an=20
    > Orange Pi Zero?
    >=20
   =20
    First, you will need "gcc", "make" and "build-essential" packages. Then=
 look at=20
    the development dependencies of the Jailhouse in its control file at=20
    https://github.com/siemens/jailhouse-images/blob/master/recipes-jailhou=
se/jailhouse/files/debian/control.=20
    The kernel-headers can be actually also from debian when you only want =
to=20
    rebuild the inmates. Then you should be able to pull everything from de=
bian=20
    repos, and from github (for Jailhouse itself).
   =20
   =20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
