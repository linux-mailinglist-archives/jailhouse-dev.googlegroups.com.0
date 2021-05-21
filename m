Return-Path: <jailhouse-dev+bncBCY4NF5G6YJBB3HMT2CQMGQE7OIOO3Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23f.google.com (mail-lj1-x23f.google.com [IPv6:2a00:1450:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id 794D538C82C
	for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 15:32:29 +0200 (CEST)
Received: by mail-lj1-x23f.google.com with SMTP id f4-20020a2e97440000b02900e0cf71110dsf8864173ljj.14
        for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 06:32:29 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1621603949; cv=pass;
        d=google.com; s=arc-20160816;
        b=ghNJfSLPLWyGDeiJZZP0mTkEW1XkVozu2MnOPGPnU86b/hMLNVu0csKd72yUNkWoyJ
         F1xzZ1eR2oIFhaNeJ30kS2XItvpVJfn/ytSCBMGvKcP7zabNfihAdM/woL9sylQIEwpY
         WX/JFWt29jcK4X+dlhREAL58Ig5TvNK3RU50DO6jRgG0I0LsFoaBI1qv8P1SIEEt4oFB
         +JhhrsAq+dpA44n0OiftGComz3E48NdPeHVu5rus3GQmzqVtLk+N8qILCd6VyAxa6pqd
         +LrUdSQJot3SUfwJzmMyaFB2+F4/hw0CE64pqzLJiox7G740oGwwHxf8vV6ED0sOz05a
         2Hvw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:sender:dkim-signature;
        bh=MWzLCIoja7LfXLJ3Pe0J+KW8wzm89FyqIGxC8I9tLoI=;
        b=mnBA1a4Gxj/y5M4dDwRpqU+NOE9XSPrn88/fQDSPwbqROG3wawmIXL6annoykxPq5m
         h2t3CVIqJRGfrLYtiXk9JCMGuC679qJirVRyzGl9UoNriPw7TOZo331vVJdgaUiekiFZ
         i5DZ8k9NtL6ppvOCDtsPepuOA+Td+cLmCbEsEH+u39Rhub6IJt7joerrYQ9Q4j/8ODQc
         TpjJ9+xWbk1MWDTLeV6IV1Ds2NTYJWW8m+NxGqp3BaGnPVoLnyiwMSGGLe7REarBtIaY
         4/b7rN6Bda7Un6hUIvtPvs4gkXO7C7yKNBFGyNPDE2N6IMNBcajrS45e2A4RqMhtmQ3t
         kZSQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=TjxuuO4t;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of jiafei.pan@nxp.com designates 40.107.21.80 as permitted sender) smtp.mailfrom=jiafei.pan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=MWzLCIoja7LfXLJ3Pe0J+KW8wzm89FyqIGxC8I9tLoI=;
        b=i16n0rGYzbQ741wb0905mqTTlFpKneTuXcaFgCLyCYlOis9QGxlUguB0Lr7+ZHiGMk
         EyZ6XppjzE9PBx5LrD1Wq8Ausu8qkRjxGokHQ32z30iO0/xVd19DuPyGmWz0g/Flo/w8
         cD5bK2IKJFRuGp2q2fTa7i061l0BKzuHlowMpkcdb/utEXaR9sJZPHGWZ29+rniAXbpP
         n09tkcKWUzgxuj/eXJwYDXzt72GT6LTgJs9pW0JyJ517JAGQV8GuU3A/mf+oqJjvBelK
         dnj6xPY9UEt8Bs98sN9J+F+oAknWhUiqQnA6ALrTnlcXASs4T70C1HzV8VGhkFN9pYKU
         vgUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=MWzLCIoja7LfXLJ3Pe0J+KW8wzm89FyqIGxC8I9tLoI=;
        b=l43qSNJK0hCc+XHr5m4RlHKPW/CGROhJQxFywjEduuvKtIzbwjTDjkgXtnePFiJ/Ny
         xCVv8psSumMU3cLYuEJU9pUJB63GO6+uwVFJb350XLX2ozcOJs/s7MPIT3eDEj1Rw6/f
         1PFIcOA9RFz+V/uRx8Zz4w/jodNFBbnAfewsf8vW5cvVZTxDn7HnLrVIc+u0LEamWPkE
         bQylZh4MZQD4HAlh0T4uU6gHTSTi5TK/2dBa0dtliYKmI0YFNPal95222MYUPv9Di1qD
         pPxKeZ7dKwYONIjVFVyc3SKwTAoCyTLOidrEbRKGitl0ct+iXkLdqcv1S935kSEiEqg/
         3u8g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532DHYKVRpf8KSwO6aBTjy/xRDr5kJRmdevXLvquj+g/E0QXyzll
	rlgi/w2OCcH2t5oHsSpjiAo=
X-Google-Smtp-Source: ABdhPJzM136EsZoXr9lhOG53SoMg6wF/hDmzyGugAH78Cdu1dCKB/EI0a2/jyCAz9/Vh23nlDlkQFw==
X-Received: by 2002:a2e:bc1f:: with SMTP id b31mr7465630ljf.2.1621603949009;
        Fri, 21 May 2021 06:32:29 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:6c2:: with SMTP id u2ls698674lff.3.gmail; Fri, 21
 May 2021 06:32:27 -0700 (PDT)
X-Received: by 2002:ac2:55a8:: with SMTP id y8mr2248399lfg.211.1621603947904;
        Fri, 21 May 2021 06:32:27 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1621603947; cv=pass;
        d=google.com; s=arc-20160816;
        b=0ybDLNf9sAX2V6muVBbdrmHEVWKByOM/I8NAclAlTogqw6sygTZzeiAmsvndFp+gYs
         pfCi8FHYNy0xExsvgGVFbY6kHLjjEjGpXajhunL1l7FKUpD4HAx0pB5TElpBjoHRGwr/
         zErWXcZ0m8Vtq+VWSF0aqAHK/y2SQzgc/IhErvsvmB0fbL62N0SmKaP2tk3K8s8gZL3L
         BdpkySkCj1OSfsqoQJxFP/maqf/LOpP1HQuld/aSEMN0ip+Pw580RuFC8u5CSqgcPTWo
         vIJytEfKQ5ebTB2qqf11KZ0c6fO4Va9c422mUZFIJK5W20HwqTQojwllMxEgDubPOghJ
         yz3g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=IX23uZ4rg1eD2RyOl/Fz5y/a/DfpkSmzL/whXT1090M=;
        b=vM9BRbHPO4bTcRBoDlhjxjE/5qgSyU6LyLzRfRGAaUuUlMW+RYFpu8Ejm09hVymKuc
         nyX1m3Bqaq1aGRUWopy2XYV0pPR+jKeqzOADXTNqXcsdo5/hwQZkeB5Ipn8M3Gunk5sj
         cwg5poW4DSlzsPxCV4XpL1tsoxaLL8W7rvP4clFxkpSJHIDvm6vSjilPfsGBFABWsYsf
         UetdBfdfp6BigIjwTzTt26XE7G1iy461Ovtr8Njag46XE4CsWph2j4uU8Eb54y6NN7pU
         UspQ1RvL96wP255qYOzwNkxU8KoQvKmATAyrnfpqR6MmcvjXFq+FUT4e6Fb1cpg6hS0i
         tgCg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=TjxuuO4t;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of jiafei.pan@nxp.com designates 40.107.21.80 as permitted sender) smtp.mailfrom=jiafei.pan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2080.outbound.protection.outlook.com. [40.107.21.80])
        by gmr-mx.google.com with ESMTPS id b39si259450lfv.1.2021.05.21.06.32.27
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 May 2021 06:32:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of jiafei.pan@nxp.com designates 40.107.21.80 as permitted sender) client-ip=40.107.21.80;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DBGaM4jZVK/rXZvgRd51Fkej6i6jBvZWjpT4U/djzm6keg31O3Zfz+h18tv65uJ4VYcIrLosHgxIye3cBqHEXakhg2pGwzUS+reY1ceFvLKfuUyoheqv5r3+oKq5Kaik5E85VIdL2zbatOPbXNPBrPNGiWZbNb0d8nn0/U+G1TEm4xx7sspdQCbEJTJWcWC5jh8gb9MJhJ5D0lUXSxd2ce7Gz+Do2A57utsVxnctsje04LVs4MnBB/zufBYArbwFVPPpL2Nz6vr9FLcBaXDHtsy3Ek1Tg6HDrw59SbgACogHfgHPrvy29V6xJOUuapfQhOeNrETZb3QXTRPDw7+/9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IX23uZ4rg1eD2RyOl/Fz5y/a/DfpkSmzL/whXT1090M=;
 b=fRtiHiH71ZtXLU8EfCh7fa8nyeyEPR28xCgii5/lz9z3DfCw1EUafnN6xQKbGwgD9qijQnPAeAl/pfc6CN/aOIjhjIwZ7wn9sQszwM6noC27Vkn9uEy2ece2nJliSBEcjWyiUMWScbg6PvRAtZXoGzWB1iDIZE07SiNRiaoHlgnhGw4tVv88nF0x/3rdYhX0D+3iMDYPPXAARlRz961mtLU0sVQwjB/BLNxvVMj1Abxbl11iNaZD1mzhjeidNmjgXxPutbWj16ZrFy6wiziembjAFgHUEM+mQxg5eTxwUgu/2tO7OA3zxDAixtd3x7IVSfiNFpgsLizK/UUVc3WE1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from AS8PR04MB8182.eurprd04.prod.outlook.com (2603:10a6:20b:3b2::5)
 by AM6PR04MB5144.eurprd04.prod.outlook.com (2603:10a6:20b:a::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Fri, 21 May
 2021 13:32:26 +0000
Received: from AS8PR04MB8182.eurprd04.prod.outlook.com
 ([fe80::94cb:bd5d:6daa:1f0a]) by AS8PR04MB8182.eurprd04.prod.outlook.com
 ([fe80::94cb:bd5d:6daa:1f0a%9]) with mapi id 15.20.4150.023; Fri, 21 May 2021
 13:32:26 +0000
From: Jiafei Pan <jiafei.pan@nxp.com>
To: liandao <liandao@gmail.com>
CC: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>, Jiafei
 Pan <jiafei.pan@nxp.com>
Subject: RE: [EXT] Re: [PATCH] nxp: ls1046ardb: add configure file for running
 zephyr inmate
Thread-Topic: [EXT] Re: [PATCH] nxp: ls1046ardb: add configure file for
 running zephyr inmate
Thread-Index: AQHXTggbSMynffR8ukeaB2USg9pqCKrtzSgAgAAiAfA=
Date: Fri, 21 May 2021 13:32:26 +0000
Message-ID: <AS8PR04MB818293A8AD7EE178D696E0F38A299@AS8PR04MB8182.eurprd04.prod.outlook.com>
References: <20210521062144.11659-1-Jiafei.Pan@nxp.com>
 <CAMC3Yu3LC1b1yhgMOA1Vp2Vt7Wuu=O--qNWPE+cHOWrJXpUy7Q@mail.gmail.com>
In-Reply-To: <CAMC3Yu3LC1b1yhgMOA1Vp2Vt7Wuu=O--qNWPE+cHOWrJXpUy7Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [124.64.122.111]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 78fa44cf-02ba-4491-9727-08d91c5cdf7d
x-ms-traffictypediagnostic: AM6PR04MB5144:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB5144A9A1AA78BD8617437B558A299@AM6PR04MB5144.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Z509PH9XV15gOYgAxH4jPq3whaRXfrk5Ep+P7G/iJQEYpCO3zAGs7tf4D9EBVmlH/ydwKRJ76k6u/45ZT0Ga1xFRmBefHMPFR2BgFUE0CKuwA41r1Ibxe+DMFlhNdxsqWNkAn7gRPIpn0YD5YqhEDxSy9MJy0RguJgjmMxJ/nXpjYR2okdhXBD3jIYCAxcLzGJMpEuyG183JMBPEorEX+LbUjhjw5hZC6aJIHngx8imJRIx8nJMlv+NgE7sx6IgXMSBwfSi3Y30y7fHoMOimryxby/fmFOZlwR66MBbCaLAw8pYihuCG+WElswiELEGoA2N1vANxkvlsF/guUOPkEOnl+VHf4NFrKy5WtPWCvlr82Jhmp0SuFWv53zXv0N7RJgPSr2EE2wTH71mfk2op/zDvjd1xsA6V9TsE3pbC3+zgJM+8I+mog5dWMNA1NP7BKANj+zoaVgZhgDYVwQCjGRhmQ2uOX7wDw2Q74zwqMBNzrrBMAmSrMBqPSU3IUj6vVd/D6DNFK3c90a9YJ2ZIlinPXYVgLXPFz2YzLC7WVwnZhP62Ct8KLeXZKj19ATdcEOCrhpi4r3cKJvqVAHMxhWrQt3GmhQhpPyKNfp/OviIMTwW90RRQUCKaBR5LDstgybVykqNowSPu4K9ifLf1ChIOT2Gpx7JEErr4oezmS4GgDGjud/HRYepvHrXteXZIGgnlOR9oSwRrjZ5vGkPflIwYtIH0vNryuYiYxZAqO4E=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8182.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(136003)(346002)(366004)(376002)(64756008)(66476007)(66946007)(7696005)(66446008)(44832011)(66556008)(38100700002)(2906002)(8676002)(55016002)(86362001)(53546011)(71200400001)(54906003)(478600001)(76116006)(8936002)(316002)(45080400002)(26005)(6916009)(33656002)(4326008)(186003)(966005)(5660300002)(52536014)(6506007)(122000001)(83380400001)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?5o84K3V4G4ULp2hb9vxQzp40dhptkQFhcZ43RHQhZcVzzeE2kqJAumcqZQUZ?=
 =?us-ascii?Q?Fmyi/hREzKjkEHbcaiBDuaYa75IkAPhmBrb07DXIKFMDbDFWaqk6SGP+DTqt?=
 =?us-ascii?Q?CyMKHkgu+IbOutWLHZ6ME0v1zlYCWtGXCDkssiwZjE/v0DHBzPeQboCTFT/b?=
 =?us-ascii?Q?YJk8HmM1LPbzHws7QIiBGDI3OZfrcf8NTcOBh8uVd/gQIxb0LEQyeDZ/qk4s?=
 =?us-ascii?Q?MT8hSpic4TlWSlqmG1sl1woZbCF7xUjP4N954bIbONUjJgpRTeHjO4mMYHQX?=
 =?us-ascii?Q?UuVLKZXR6wkjYmlWCwBMk6U4FQBHDGIF7/o5SgRW1/GMqawx6rRjHsz6uc1f?=
 =?us-ascii?Q?FHUHZocR5IMytXKktycBLgc0nEY0Bi5OTv4o9Myf1UmxAWe0wWWII1m8j0B6?=
 =?us-ascii?Q?v9s1w6iRzNtsmyT4nSNBI9iaZEQHQFUQ2w+XKSFswah7PtuyeWf9s2UQWLml?=
 =?us-ascii?Q?APMutorRL2hkdP6LCtNtLkM+/vQ5Kre/2PsohL2fLapufcNpcCV6JghC44oM?=
 =?us-ascii?Q?FMtumzp9gxiR81QI8u2XVenFK+ZzImeaofa7WQ/pYvJxz75sXozEr0yz2r06?=
 =?us-ascii?Q?tqwiAxqK6EiGND05oMjBanK0vgFMgWGF/q6Y7+jafhX2njLxRFHz45vtbtuE?=
 =?us-ascii?Q?FTARgV5LHyTuBH+gEpzSSmUgfTPMwcqNE0NNKlmopPHCBONddKtqO9/BtzGa?=
 =?us-ascii?Q?xFDiW+SXU77FfCfCj5GAY3UWQ9VL+inByEtm8st3fu4jWgaJnCDKr+lfAxd+?=
 =?us-ascii?Q?deh4Byhnt584PsVUVHAvm4wcPVWrtDHoP1d0AH2b+K05gTndr0WQS4u4cETa?=
 =?us-ascii?Q?jiLpFXGHr0zJJ9Etir8zSNTQBoln9jsWstfHdNjfIz9Rtd9vlFw2QUwCCt/2?=
 =?us-ascii?Q?6QQ9QVtUlUFwOnAhRAgdGqsd73b90th3ZgSDm3OOhx8ZBtNdAc+W05+80/AG?=
 =?us-ascii?Q?cZHntIUb7HC0ggy3OxHDzB0o6/bmI5tQc5uICrZGJRgFvXtKmpyODXWly9fc?=
 =?us-ascii?Q?xINbUMGrE86d2KDrfys19+tkbqJspYTkjsIxXYyUbzudq66iJfX0o/nVEXPK?=
 =?us-ascii?Q?PPX+4qBhJAgRJ4iRj5PTclEAZwxW9OY5qtqTJm77I1ppAP7YIE4bJb56emxk?=
 =?us-ascii?Q?EYkiBdFRdNdY0bAKdpi7OhcKMsWj3C58w6PtdAvjH/9vyuzNT7oPcquKzUDT?=
 =?us-ascii?Q?a+X0pH0gCQZMuoABEi2VKcrk++A/TWvtqP9LZj5R3hEVximBJjfIlqpTmVbK?=
 =?us-ascii?Q?5a6hidq4Da/jQp1hv1WGUjndDVFv//BoQubnF5d95lTlP9hB56K/bJI97oZN?=
 =?us-ascii?Q?CuwISXhkLPp416+gA5/6k7O3?=
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8182.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78fa44cf-02ba-4491-9727-08d91c5cdf7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2021 13:32:26.0878
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fBZChQKADrjfJAJyzTAtTiwnuao8EVcC0hEt7iwD5G7p64Wp6GgxnPPfhZbSPWXv/g04ng/P1T9ITfknqo8pXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5144
X-Original-Sender: jiafei.pan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=TjxuuO4t;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of jiafei.pan@nxp.com
 designates 40.107.21.80 as permitted sender) smtp.mailfrom=jiafei.pan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
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

Ls1046a-rdb platform support in Zephyr has been upstreamed to Zephyr community.

Best Regards,
Jiafei.

> -----Original Message-----
> From: liandao <liandao@gmail.com>
> Sent: Friday, May 21, 2021 7:30 PM
> To: Jiafei Pan <jiafei.pan@nxp.com>
> Cc: jailhouse-dev@googlegroups.com
> Subject: [EXT] Re: [PATCH] nxp: ls1046ardb: add configure file for running
> zephyr inmate
> 
> Caution: EXT Email
> 
> where is Zephyr demo source code for ls1046a-rdb?
> 
> On 5/21/21, Jiafei Pan <Jiafei.Pan@nxp.com> wrote:
> > 1. Use virt_addr to be same with phys_addr for memory 2. Loading
> > inmate binary from start of virt_addr 3. Use 1M bytes memory in order
> > to load Zephyr 4. Using CPU Core2 and Core3 to demo Zephyr SMP
> >
> > Signed-off-by: Jiafei Pan <Jiafei.Pan@nxp.com>
> > ---
> >  configs/arm64/ls1046a-rdb-zephyr-demo.c | 141
> > ++++++++++++++++++++++++
> >  1 file changed, 141 insertions(+)
> >  create mode 100644 configs/arm64/ls1046a-rdb-zephyr-demo.c
> >
> > diff --git a/configs/arm64/ls1046a-rdb-zephyr-demo.c
> > b/configs/arm64/ls1046a-rdb-zephyr-demo.c
> > new file mode 100644
> > index 00000000..55c0e78f
> > --- /dev/null
> > +++ b/configs/arm64/ls1046a-rdb-zephyr-demo.c
> > @@ -0,0 +1,141 @@
> > +/*
> > + * ls1046a RDB - inmate demo
> > + *
> > + * Copyright NXP 2020
> > + *
> > + * Authors:
> > + *  Jiafei Pan <jiafei.pan@nxp.com>
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2.
> > +See
> > + * the COPYING file in the top-level directory.
> > + */
> > +
> > +#include <jailhouse/types.h>
> > +#include <jailhouse/cell-config.h>
> > +
> > +struct {
> > +     struct jailhouse_cell_desc cell;
> > +     __u64 cpus[1];
> > +     struct jailhouse_memory mem_regions[8];
> > +     struct jailhouse_irqchip irqchips[2];
> > +     struct jailhouse_pci_device pci_devices[1]; }
> > +__attribute__((packed)) config = {
> > +     .cell = {
> > +             .signature = JAILHOUSE_CELL_DESC_SIGNATURE,
> > +             .revision = JAILHOUSE_CONFIG_REVISION,
> > +             .name = "inmate-demo",
> > +             .flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
> > +
> > +             .cpu_set_size = sizeof(config.cpus),
> > +             .num_memory_regions =
> ARRAY_SIZE(config.mem_regions),
> > +             .num_irqchips = ARRAY_SIZE(config.irqchips),
> > +             .num_pci_devices = ARRAY_SIZE(config.pci_devices),
> > +             .vpci_irq_base = 60 - 32,       /* vPCI INTx */
> > +
> > +             .cpu_reset_address = 0xc0000000,
> > +
> > +             .console = {
> > +                     .address = 0x21c0600,   /* Uart1 in DUART1
> */
> > +                     .divider = 0xbd, /* baudrate: 115200 */
> > +                     .type = JAILHOUSE_CON_TYPE_8250,
> > +                     .flags = JAILHOUSE_CON_ACCESS_MMIO |
> > +                             JAILHOUSE_CON_REGDIST_1,
> > +             },
> > +     },
> > +
> > +     .cpus = {
> > +             0xc,
> > +     },
> > +
> > +     .mem_regions = {
> > +             /* IVSHMEM shared memory region for 00:00.0 */ {
> > +                     .phys_start = 0xfb700000,
> > +                     .virt_start = 0xfb700000,
> > +                     .size = 0x1000,
> > +                     .flags = JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_ROOTSHARED,
> > +             },
> > +             {
> > +                     .phys_start = 0xfb701000,
> > +                     .virt_start = 0xfb701000,
> > +                     .size = 0x9000,
> > +                     .flags = JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_WRITE |
> > +                             JAILHOUSE_MEM_ROOTSHARED,
> > +             },
> > +             {
> > +                     .phys_start = 0xfb70a000,
> > +                     .virt_start = 0xfb70a000,
> > +                     .size = 0x2000,
> > +                     .flags = JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_ROOTSHARED,
> > +             },
> > +             {
> > +                     .phys_start = 0xfb70c000,
> > +                     .virt_start = 0xfb70c000,
> > +                     .size = 0x2000,
> > +                     .flags = JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_WRITE |
> > +                             JAILHOUSE_MEM_ROOTSHARED,
> > +             },
> > +             {
> > +                     .phys_start = 0xfb70e000,
> > +                     .virt_start = 0xfb70e000,
> > +                     .size = 0x2000,
> > +                     .flags = JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_ROOTSHARED,
> > +             },
> > +             /* DUART1 */ {
> > +                     .phys_start = 0x21c0000,
> > +                     .virt_start = 0x21c0000,
> > +                     .size = 0x10000,
> > +                     .flags = JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_WRITE |
> > +                             JAILHOUSE_MEM_IO |
> JAILHOUSE_MEM_ROOTSHARED,
> > +             },
> > +             /* RAM: Top at 2GB DRAM1 Space */ {
> > +                     .phys_start = 0xc0000000,
> > +                     .virt_start = 0xc0000000,
> > +                     .size = 0x00100000,
> > +                     .flags = JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_WRITE |
> > +                             JAILHOUSE_MEM_EXECUTE |
> JAILHOUSE_MEM_LOADABLE,
> > +             },
> > +             /* communication region */ {
> > +                     .virt_start = 0x80000000,
> > +                     .size = 0x00001000,
> > +                     .flags = JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_WRITE |
> > +                             JAILHOUSE_MEM_COMM_REGION,
> > +             },
> > +     },
> > +
> > +     .irqchips = {
> > +             /* GIC-400 */ {
> > +                     .address = 0x1410000,
> > +                     .pin_base = 32,
> > +                     .pin_bitmap = {
> > +                             1 << (60 - 32), /* vPCI */
> > +                             0,
> > +                             0,
> > +                             0,
> > +                     },
> > +             },
> > +             /* GIC-400 */ {
> > +                     .address = 0x1410000,
> > +                     .pin_base = 160,
> > +                     .pin_bitmap = {
> > +                             0,
> > +                             0,
> > +                             0,
> > +                             0,
> > +                     },
> > +             },
> > +     },
> > +
> > +     .pci_devices = {
> > +             { /* IVSHMEM 00:00.0 (demo) */
> > +                     .type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> > +                     .domain = 0,
> > +                     .bdf = 0 << 3,
> > +                     .bar_mask =
> JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> > +                     .shmem_regions_start = 0,
> > +                     .shmem_dev_id = 1,
> > +                     .shmem_peers = 1,
> > +                     .shmem_protocol =
> JAILHOUSE_SHMEM_PROTO_UNDEFINED,
> > +             },
> > +     },
> > +
> > +};
> > --
> > 2.17.1
> >
> > --
> > You received this message because you are subscribed to the Google
> > Groups "Jailhouse" group.
> > To unsubscribe from this group and stop receiving emails from it, send
> > an email to jailhouse-dev+unsubscribe@googlegroups.com.
> > To view this discussion on the web visit
> >
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgroups
> .google.com%2Fd%2Fmsgid%2Fjailhouse-dev%2F20210521062144.11659-1-Ji
> afei.Pan%2540nxp.com&amp;data=04%7C01%7CJiafei.Pan%40nxp.com%7C5
> ebb6ac421734ff1e81608d91c4bc0ea%7C686ea1d3bc2b4c6fa92cd99c5c3016
> 35%7C0%7C1%7C637571933949905985%7CUnknown%7CTWFpbGZsb3d8ey
> JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D
> %7C3000&amp;sdata=%2BenZUziveuQ2rXXZ26vosUTS29X3p7KXjgDjcLOX5dA
> %3D&amp;reserved=0.
> >

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/AS8PR04MB818293A8AD7EE178D696E0F38A299%40AS8PR04MB8182.eurprd04.prod.outlook.com.
