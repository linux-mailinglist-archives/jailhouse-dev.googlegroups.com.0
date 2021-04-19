Return-Path: <jailhouse-dev+bncBDGILGE54ELBBVXS62BQMGQE255HVGQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x137.google.com (mail-lf1-x137.google.com [IPv6:2a00:1450:4864:20::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 356A93648C5
	for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Apr 2021 19:09:43 +0200 (CEST)
Received: by mail-lf1-x137.google.com with SMTP id v23-20020a05651203b7b02901abd47176ffsf6429647lfp.9
        for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Apr 2021 10:09:43 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1618852182; cv=pass;
        d=google.com; s=arc-20160816;
        b=PGNXtjBv1DAwcHuY3e0rN8tbkRarHOwN+BxqZvWKpepqEQPorbfXv6oY3gPXVQMysH
         ausqpHYpo6Yn8h0lcaVIb/X8VCfteBhu43+W3hVbUGfWhjPDW2hddS4EWG0xfpuTJe2i
         GFyv4IA2mED/e+ewp//t1jZavSxCVowPJYzMASUgfPmTgl9ikOvAl6vk7bQbmzMNi4Ve
         puImSUhBWqxjhKrspsTf4jA/f78pDEnClK4zZxLLVYvKnGkMK0YPV720brfDyf3cT0lu
         JC2slQBBTOH+Ed6PGRaXPK4oPMqvvQvhxeJ+bpCFSbh/qP4CwNU245EGKZZK+U88C4je
         IS/Q==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :to:from:sender:dkim-signature;
        bh=zOhOc5XFSbqAekjsel5xsJzTSUDkjRhhRgNHdWOUnN8=;
        b=cp5ks4dQllyb3E4jJK5aY7Lm+rKMwA9SxAL5yM3nHCjQXp94kPth6Q1GMvFMticImX
         n84amjDpwZ1vOwf/WA7n/lYGNzU+247eB2pYWDSTHz0jIE2uoZoPJUf+ywxhWZa6W0rj
         MQmMqUpGBj2WCKlfcVFgqzOXM+07AlK/c3rbCAb6Ek5yi3VmYnWU+NT3AK8lyQZaHloA
         TgZ4/9nzU89mx7W62hQoejb8rdryxpyG5Z+zGz1CX0mdWN3II+CyLF+rusKwPexQ8Ndj
         Ca33dKyZ+/rJreowemtypvMHt4f8CwWIH9+BtAWXIEsCuacYen8XW62JhocG2NGJ9ykD
         DuaQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@prodrive-technologies.com header.s=selector1 header.b=D8Sx5XdE;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.6.116 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :accept-language:content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=zOhOc5XFSbqAekjsel5xsJzTSUDkjRhhRgNHdWOUnN8=;
        b=R5gypO7NtOTNT85fCE00UO3v0W98xgJa6BKm1YiygXia5Ah5wCTnnvMF2W4Bfx8c0T
         g6xBYC3yD0WY7BDl7iek4zt4fP4TJAmKAzs+rz1n0NtM3pmzlpZPP/jTl3VXOGA7gRrF
         ySabQZl0fA6hWHWSunWms61iSPjVBcwj1Bw1PMb7iSq0VlM5hmAohvsk1cfrrxZYXHSR
         Qug3vuERT6DtGsPo9bkXe8Aza5hMca6vfKfFxiHyjsrETUbR5Yh7pyn7GWV3hDLlneza
         6WNJwRDZoCSJF4cVtE/5uvrr89ELT4F1OrvGAyIlxMZMtCrLC1CLHSQ4ySzmBPhRnhLL
         EsXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:accept-language:content-language:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=zOhOc5XFSbqAekjsel5xsJzTSUDkjRhhRgNHdWOUnN8=;
        b=qLRR+u7ue+Yxnmka4NdLR8CvH1FfeXo2RwFXRoEOjiZSQt2iDJSwsCfIWwOwsGrlqQ
         JjG1i2sGefvlZz5r42BMD1CvUmdtP2YocTcfwY5gU0N1WgSDYJC57dnxu6E+Wz8ZypLr
         LjfM0fN/mm8quE1HMV9v5cUSCWw4tuYLYB8GZFEfACEeozbbEbENiQTCinD1a+cWYDnF
         28r4NjNmEm3uoKe2uP1H9WIfxfdwd1g8wLeCTJjkAmED37Hq3poUTA5rQQY/3F7QP2Me
         XfmEr3n7hYW+5ctJZkE76GC4/+alQwg5rqLPCj8e9yO+uREJaN0BFGpzpvlQD9RrDjB5
         1sDg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532XwJdPc7Ra6JLcE3o7pqieJ3gz2CoEy/LWG/bmrqkiA33tPFmy
	bgfllJkUfdzRozteY8/QWT4=
X-Google-Smtp-Source: ABdhPJxcGX/lgEnhz1NFymM+Q5GhVqMh2/xDKm+bDXANfbYjNJ2//TS8gnEnnxS0dnaEzg4NMZxOQw==
X-Received: by 2002:a2e:87c9:: with SMTP id v9mr12022828ljj.321.1618852182783;
        Mon, 19 Apr 2021 10:09:42 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:5624:: with SMTP id b4ls1201752lff.0.gmail; Mon, 19 Apr
 2021 10:09:41 -0700 (PDT)
X-Received: by 2002:ac2:54b5:: with SMTP id w21mr12950587lfk.427.1618852181450;
        Mon, 19 Apr 2021 10:09:41 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1618852181; cv=pass;
        d=google.com; s=arc-20160816;
        b=rQF6Xe1rLeNVYboTbV1SUz1SJ1sRWXTTpmare2W7lnj8N0UFb2aTymKV+03l4WD71e
         Mz8Ii/q6NW9d1dQHHiinOlMBc3IpkQXZRJIIEmzCPN67CuMeWuiUlzdx70ln4Lj9oWGK
         E5SdAI/9m50N2xGo1pYKJXaJqPRAEgGPQFiX2zK+tdHm3qDw0LRqYBwcWe5dVXet9GZt
         QVHc2fcKdFHIEyjtMnNkRijwdh+6skVdB2IyEYfa2nDHPceisj7zkcS5WIs75zwwSzeW
         RwaZapFRJCxl5b3KS+tBBiDDh/3C89wrxhR6qBtX+J4ZS71TrHH0FI0BOjj88LhUbOge
         YGKw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :to:from:dkim-signature;
        bh=BniLAiJUnq19uj7CCuokMO26kUZuUorR9jAH4BVZEaI=;
        b=Q+zKqG4f2z1K5iyiSSRJm9LQB8usWlEo6bsI0B7niOHKETU/03CAife1SbujQwJ4tg
         4bf21R0xvHJPx5APgSSsgmmzqDj/zHiklZVCjbtCbrpIqT+f9oFASAxt9olhc/U5lfBk
         FzYDNp1FNIh/xpHtIravBRGEAxKxM/WOC0ybKJrUMIqM3mljcuoxpECqkISMQ+gTE5Cn
         LbXsQ1g4IUl1h3rkt/jMnTkWiPoh38M7UCPBZbIOzfFkTgG6DlkkVsMiyXT4vm2F2O7P
         L6r7T0Kpo3fhBgI287et18IeDn1ZcWDfl/kVcVN6TvUCM22Ino5F1YgGUD1JPIn4K6IS
         N2aw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@prodrive-technologies.com header.s=selector1 header.b=D8Sx5XdE;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.6.116 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60116.outbound.protection.outlook.com. [40.107.6.116])
        by gmr-mx.google.com with ESMTPS id l11si680980lfg.13.2021.04.19.10.09.41
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Apr 2021 10:09:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.6.116 as permitted sender) client-ip=40.107.6.116;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KRo8ApupCsQFUPMy86CW7gYi3bf96FxTUXMVRGMSH9NvEf+/JoepEYcAzDgPlk7ErqVL27cTegv738M5K71TjPRAbBONsiksMfIGLDP0aCHNaWAcLysDOJNVD3cwl1/ne6oAUnilycclX8bSOtTz7WxveltWWPd+4BL3BOhY8vYUD4QF6XamSWE9/qpGZtM3SwgawIWgpQBufFbaGfZzI3ARg+RuiH8GwL/ny1Rzj1Fg7TDn3mEhH/Khq3T9YUE857pTly5Siex44EAKxu9sc7pOv+4WxH8MS/DL8WGuQ5UDlWSOx/n4VEAN2KJLAE2s4n4qNdM0Q29bt+4ITch1UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BniLAiJUnq19uj7CCuokMO26kUZuUorR9jAH4BVZEaI=;
 b=MANWXnPIJpcJIeZmsXVYKb3jcFNQUbC8+aRrclYHjts4sZUcH4Fm+Xlwa27I4WvdlnjCSA+fvAvMZWKRqZgN2zoZ6ko1RRsIzdPWa5eP6DmrbDVcXfPfaXXP9V2m44eXtLFXy5qG+YQqWAhFbxz33VsKnFEq9v/tz/RzivFpI5VCwVt5XqG1LNHgtzwkQgaRSgriLOb4G5JxzLB1yl76CJ+Ac+fvThWpSyjCHN+LvHCMQvYuEUZsTZ1kdVcz5Gr+5vjr5vgbY5tbayog2ZUoFolHbLcNz2ndAXku5WBOdepAHNQbajPT+K5ChJV+O/EUqqCVUbSUvgRBwl//8COFvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prodrive-technologies.com; dmarc=pass action=none
 header.from=prodrive-technologies.com; dkim=pass
 header.d=prodrive-technologies.com; arc=none
Received: from AS8PR02MB6663.eurprd02.prod.outlook.com (2603:10a6:20b:257::14)
 by AM6PR02MB4519.eurprd02.prod.outlook.com (2603:10a6:20b:6a::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Mon, 19 Apr
 2021 17:09:40 +0000
Received: from AS8PR02MB6663.eurprd02.prod.outlook.com
 ([fe80::69b5:15e2:476c:e151]) by AS8PR02MB6663.eurprd02.prod.outlook.com
 ([fe80::69b5:15e2:476c:e151%3]) with mapi id 15.20.4042.024; Mon, 19 Apr 2021
 17:09:39 +0000
From: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, Ralf Ramsauer
	<ralf.ramsauer@oth-regensburg.de>, Jailhouse <jailhouse-dev@googlegroups.com>
Subject: [PATCH V2 0/1] Fix memory mapping x86
Thread-Topic: [PATCH V2 0/1] Fix memory mapping x86
Thread-Index: Adc1PUTzG9/OsJnIScmX2V2A2zEZRg==
Date: Mon, 19 Apr 2021 17:09:39 +0000
Message-ID: <AS8PR02MB666316084F377A507F418699B6499@AS8PR02MB6663.eurprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.127.64.7]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f374013d-fddb-4c05-4d22-08d90355eb08
x-ms-traffictypediagnostic: AM6PR02MB4519:
x-microsoft-antispam-prvs: <AM6PR02MB45195E62FF73734F4DF47873B6499@AM6PR02MB4519.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cM2MtGbxSeUkdzGYYOXEVehBMGsS9gJ2lI4QQBFZgu9o7h2PvKnUfJZ37dQkMvYAqeMPf3WlxV5JUjQb82OyVKb/L8zG/liY32YGYqmBQAuCmLgiMSvRm/1RUE2gzEhx2ydkpe86ajwpt+Y7IN1d/5DdgzpQFgiqKLCuTCWwSLvBFLTsXzsS4m0IYMrN08iU8FoZEePfVwylcBA2WNhgEzrfLZKt41faKZY/J+DUbkWPiBB2slGf3tTrBHtH1E71o3Wka2UaVg9+MOmU1CczwGJQZqFN/d2awEOWFvJrxCD3wUM8nv6ltEJnCBn2fz76zqFw0HRHfnJ61PtqLD+AJYpoUei29XwZAvPUrydbE363u5EMx4Wv/YP8Yd8q+iJOIphBNXsSg3i5xm+esePJHNvlIx+sFgQ3z7u+wleQ+nLrdJJ3/uHbUdKUiYs/1M/CeEkA7razQSTESCBjdprq0O1ea1K+wAPPHuYUgBtLNSbJtuUVC753QMBbkBZ/5avcWbx4Y4PgNfMl5i/Ef/YsFC0XFFpTnbmlyMg3cnLfAPNwQCIzi6OqbAMetlKshWhHkvGEnSzNC7TBUevjjWhcS6Bvs4cNwqXELDWCkToUfrs=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR02MB6663.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39840400004)(376002)(366004)(346002)(396003)(66446008)(2906002)(64756008)(7696005)(66556008)(478600001)(122000001)(38100700002)(4744005)(9686003)(66946007)(5660300002)(83380400001)(86362001)(76116006)(66476007)(110136005)(55016002)(52536014)(33656002)(44832011)(8936002)(8676002)(186003)(71200400001)(316002)(6506007)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?t2bBy9swM5JxosIo4WGIKcsNfWHU5xB0q1+GmDfqpuD9ZDIZ5QVos/oySAYb?=
 =?us-ascii?Q?IK+Gl2acrNOsw5WIbD+/1uF3PU8GAG+HYIahugFHmfw8br9S7x3GIriNVWOI?=
 =?us-ascii?Q?gA6GAVSgulekhTKOjwmH+DL24uWbE1N4c3sBC/CORcW+ppYqdJ2Sd1yXcnfk?=
 =?us-ascii?Q?vFM5MLP37H4Jz+rNwE3xNypnOl8g4wjcfEqLY7NU5J9nFRGMEdt8MPmjWJWJ?=
 =?us-ascii?Q?t/6bzwGaO54X+5p+sS8q370nEqByLNxeKjsK+qhcEjWq3VZYRmmh3JkjWWXi?=
 =?us-ascii?Q?gQ4C7SeNs3zxRnozjplPciUEQBucqn5Z/7jQP4nbHU4eZlCUDkAw1L3KDEMy?=
 =?us-ascii?Q?F1iceQwinBUEfjUQ0W/fVSChsC71GERcTh0dta5frZmWXqLReU7pkv/SrhBF?=
 =?us-ascii?Q?b//w9Sf3aUW7sLM48itCFXzd55o+gV3XfWpxNHTg77bzBe6gdXrGDgNomZpt?=
 =?us-ascii?Q?d+ZkKj7OWzHL8vJQYvZtpQ/QxnlH/3jUYE0kiUhIiHbs9/b++cCGpBSBisbT?=
 =?us-ascii?Q?0nJtK9hPlY5bzatFd4YpSv6LAzk+GxtD85/wk2tNl0kVH/XwGTTNg75SBsLF?=
 =?us-ascii?Q?T/1P4x97I1jthdH6V8mKwkyHJuwYGy2jRnW24jqqopaA50GnGrm/aVV9Mjwe?=
 =?us-ascii?Q?FdQWesbizX1R+j/k0Z8+3jPhruQqBhKSzIjkSZeom5DY2GariXntV8ZxsjEP?=
 =?us-ascii?Q?stF45FBENyCmQEV+DZX6rI8q+1PBcHd/oGgL1+Hb89APCOcxv5DlbOr09+ko?=
 =?us-ascii?Q?r45sT2MHaOfkY76+/7vZd06y8SanjJG95SKOi1Sl8B42LdH7OTccQi0tBI2z?=
 =?us-ascii?Q?qw+nLdZYNdOwWSQZ3ooXAPOolLaeGFnhWR8Qq992O5vPfXC9hZDLuLNqZjJY?=
 =?us-ascii?Q?tpUsKEoiAAnaHcSLS/SjB/9COsLuVgqVyTCu6zCL/bp9DvsA00p3lKXJ04JN?=
 =?us-ascii?Q?z8Z0flnSgBFXPXeMjHmrSgNtg490SEPafzURCZLi5fgTUiOst46hZAa4KeBV?=
 =?us-ascii?Q?Sufpk+AWVb3lmOkZaNSzRyY3m2po/HBkab5nPqfAT1ctUpCoNnibn5uNcr0C?=
 =?us-ascii?Q?BpWKMcZ5QFqjUocgjo+uZbm9nXTd6eTondWXm5BuFB5IZ6lhjb/s5zppNGl4?=
 =?us-ascii?Q?bBq+KYIF1ttv4bQRZHjdYLyb0fmxFjYUEei/QPjIWo9awSlrt6eo9fDSpIMA?=
 =?us-ascii?Q?gIynipKHj++rai6SEAmQlRN5v8ljFO5iMPthvz1OyuDEIV6aOP/w8xgxLkAB?=
 =?us-ascii?Q?DOzH0f60UOd85jOsEWVDW3F0nQcvTcbyihXuPFZxOP4xmJ+UoLKRdv0HY6PP?=
 =?us-ascii?Q?5BA=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: prodrive-technologies.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB6663.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f374013d-fddb-4c05-4d22-08d90355eb08
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2021 17:09:39.8913
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 612607c9-5af7-4e7f-8976-faf1ae77be60
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 54ezKCqepby64RZBolXnP8CLdDcCY926cz5C1koBAkFxzze3CBX6Cd8G0ZYntFWUC9nm/cIugTN5WPQ4mP8aZNgLa27yo2/jgySL929/T2bQaxiI38hZMlwdLPH81ShALdyJ5MADlNX9eMntXGllIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR02MB4519
X-Original-Sender: bram.hooimeijer@prodrive-technologies.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@prodrive-technologies.com header.s=selector1 header.b=D8Sx5XdE;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass
 dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com
 designates 40.107.6.116 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
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

Dear Jan, Ralf,

A new version of the patch, which now relies on a wrapper around alloc, zalloc(). 
I replaced usage of alloc in inmates/lib, as indicated by Ralf.

I was able to test this on x86, but I didn't have an Arm platform available.
Though I don't expect anything weird, giving a test might be good.

The zalloc implementation should traverse a natural word of the CPU. 
Other than that, I am not familiar with any optimization tricks. 

Any feedback is welcome, 

Thanks, Bram

Bram Hooimeijer (1):
  inmates/lib: Add zeroed alloc, and update usage

 inmates/lib/alloc.c                 | 13 +++++++++++++
 inmates/lib/arm-common/mem.c        |  3 +--
 inmates/lib/include/inmate_common.h |  1 +
 inmates/lib/x86/mem.c               |  4 ++--
 inmates/lib/x86/smp.c               |  2 +-
 5 files changed, 18 insertions(+), 5 deletions(-)

-- 
2.25.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/AS8PR02MB666316084F377A507F418699B6499%40AS8PR02MB6663.eurprd02.prod.outlook.com.
