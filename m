Return-Path: <jailhouse-dev+bncBDGILGE54ELBBMVB2KCQMGQE63X4XLI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x238.google.com (mail-lj1-x238.google.com [IPv6:2a00:1450:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id 34902395622
	for <lists+jailhouse-dev@lfdr.de>; Mon, 31 May 2021 09:30:59 +0200 (CEST)
Received: by mail-lj1-x238.google.com with SMTP id z14-20020a2e964e0000b02900e9ad576f5asf3101414ljh.20
        for <lists+jailhouse-dev@lfdr.de>; Mon, 31 May 2021 00:30:59 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1622446258; cv=pass;
        d=google.com; s=arc-20160816;
        b=Pt0OJQZy0HQKdd+ddeMzH5sN4YsqYNIwuTLijJ1BHODVuG5fpaz7d0OgK9XjCLvzF3
         SusBcRzqRnJTSWEX8ZfCCXyz8UqRnYnzj3pKQQxpXGkmmu3gJLFtVPfRIEWCOOvnX2fF
         z6AY30eJpcZkYh651GFo863xClpY4yfAxtyxYR2KvodSZxviF3Y/LV8/IgcKZ/KaMvRS
         6c1LvgtAIAFA9UwzUl21laD5lL2e66FsUC7ZhHnz6HeRW+hFEtvfnDNfAMhBb9ki7shu
         tQeXco3P8gsrHsSnMTO3ZJD1R4k2kZD4QkZLd943RMqdDEzZMWC6+4H20VesAehfDJXW
         jNHQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:sender:dkim-signature;
        bh=364r5rPDVoMjnpf5oh5SxSYfN9tEcDLFUHJKR12Kpfw=;
        b=a74MpOcT3sAJ/CIbM0ewkqrZbtlchJcAPRMCDyWZd3Sz/jf/IXIjxRWYRO34Ws27BH
         IPIRvBQFxT6DavyIsScDZqctfzZ96YmDEWf5C8O8CUm8mpdup0nkozGBrjIpWKBkPL5E
         4r98URsFYqfgedXCqiyyy0zFobD3F+wjrLRGBgPoz6OSrA5gPY1u78wvx/vL8680XJXW
         EewytJDl3ezuUvFJZX9C6R4PwpuUTMTNKAuOurN9Jk2pnL8MhoDPdb0/L5tablUy7VXo
         hnQa0vE8vJYw0V57uPEyLdaIsWooIaP22Rr6/xMJhCAtM/Wd/SL6SU6/i2hPT+9LLWgG
         IFGg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@prodrive-technologies.com header.s=selector1 header.b=lc8aacTb;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.1.139 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=364r5rPDVoMjnpf5oh5SxSYfN9tEcDLFUHJKR12Kpfw=;
        b=RAchSzjJygIhJL2141xgaUii6y4x31voqgylwl9ovPbjH/OLIIkyrntyPnGBZbv54I
         uwvJal3CZP1M7tLAkbJ8TWjJ25jrk7rNB1URVemxphSsPT6Xxrk8qLJBzKhQlLAWp4vI
         F0mWH4GtFFLBuk+QZzuCFUX13jtW2c1g0OShrcuD9IdSLROBGDoSCyhWI7LYUaP0AzD8
         gr2XqLDrJwZc8YBAkZpe8oF+KcAI96oNxPR279vrld8r2Doeey9KIfBV9ElWPCDzh60t
         y5+KmcyQdwKhmH6q7r3OrpoXzCUXRbMn72oROSx0h/nAn2xPtcO3RTqn8GtfKzLJqAjV
         ouCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=364r5rPDVoMjnpf5oh5SxSYfN9tEcDLFUHJKR12Kpfw=;
        b=kwITeerf2jLWWHr2QaCxtHc4bhjPhtbKPaokq/4RDuishEhTikCvvs1BAQ9fXqpwiO
         FLvzloimon7DN8pOYLcNOU0PV2EDlMHx6fF2L4BvrRoGXCIXssgvIDvEyCQuvl2/e7Ri
         xzOq/+d89zo2A2HedZy4BzuODU0hEzYMHzNjjj5SjYGICq/XuAdzh4rrJdLKNX5uwgrJ
         s99LMJMOIXCxhRdGU2MXjxYyUsEw0Ueo5pMqFzn1R1Vbra6jH9q9WumOFyll2sEL79aU
         jBOnakuHfFxpoWb+0lCDBASOyU10Eo7mBLwN4brWm2IlLwzSv/F5siPpAPTKXmWrStw8
         Znpg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532NnNq8HZQR4TPr9OAaRErfUlLW0fC/zPixguxjiPQYj/0rXJS9
	7O49VsQDuuCGCPAfXd63Bs4=
X-Google-Smtp-Source: ABdhPJygfGwkSNLHrk5oWeYIJTjvfmkCo4Nbe/5BXJzeYI41G1n69AYNm78NVdCIJPG4yqmHlxNyOg==
X-Received: by 2002:a2e:7e06:: with SMTP id z6mr15528595ljc.55.1622446258644;
        Mon, 31 May 2021 00:30:58 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:1409:: with SMTP id u9ls2401544lje.1.gmail; Mon, 31
 May 2021 00:30:57 -0700 (PDT)
X-Received: by 2002:a05:651c:3db:: with SMTP id f27mr15398647ljp.241.1622446257616;
        Mon, 31 May 2021 00:30:57 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1622446257; cv=pass;
        d=google.com; s=arc-20160816;
        b=hGPru4ic/a+E1lHYF5Qi+K/J0G9CHEa9r8Rau4DFvXrshsABzrSri1YDdvkCdf8C03
         KNGr7FbWa0Q52lY1gbKmqWSci3Ji+jh979eTBroeaUf2gfua1NFJN9sRes/PC9mLSr0G
         0Xi7lM8VoTEhO6EIScCM2pMbVgvc9RAOCs8RbEGaaOFr2KlsSQbAO0JNAB7Juxh1ImMS
         fAb7cUXg0q33moLnNN288RZxLn8E5Rn6KVWrpQPKxgbauYymWNf1xV2I4h8oEXNseKhZ
         srdQySYQ8ZfIkHNCQJ7AuE/f+mU9+MYBFF3Sz1PCX8DlZzTZ0M13hWumVyEeT/r11cMw
         9k+w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature;
        bh=7Q8zjIr5Iby2G8aaZfpwO+F1em/LVB3eMEVi94rbbj4=;
        b=sBa6rZHUfjN/MXnGw/tOPqqCE76pN/CFY2aYYa6JsipyYJXnbJUUaiXI6ssSl+DGag
         ea0iFR1s7cLskmrHgtRcMmsSLXlpfVAP870zkcvYw0R1maF1SwZyQOJNj2q9wtiY6SGp
         NQdoPpz+SZInDigmqStsFhBSAX9LEdbKB17NiUEH2rACW3EffLG/Z3gs2zKm82Ghlusn
         fM95roKxStAz8h21M/7l5PX9kcydXnx7xgBLPsbDUgbRqjjo3bbTub+CVlPe8hMs83f6
         WiQjWrQfM/ZwYuMkZ+7PAZWQ4ZFvBQv7DFf3DRqCgpaVbOk4gwy8KrfiHNUwJYwayGuC
         gaOg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@prodrive-technologies.com header.s=selector1 header.b=lc8aacTb;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.1.139 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (mail-eopbgr10139.outbound.protection.outlook.com. [40.107.1.139])
        by gmr-mx.google.com with ESMTPS id i184si188646lji.1.2021.05.31.00.30.57
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 31 May 2021 00:30:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.1.139 as permitted sender) client-ip=40.107.1.139;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GbegO3yijOwCXjYdWvQ+7Mp8V++7+olBjXQ0HzsV/NX8+VQZtkm4mnHCj5XMgCf3zgzOcMW+OQwm4JnI/dSEuR1Tjgml3SbcBGsSvMTH+WZGlsWYTY8AhoYFTI4X43kladQorEen6kFvjzGAQMwVI+u36Duyz2URiyaA/awR9i4NIfMsJJB5Ut5RxKsoyeo1K9MWYuzWh/ONbzqqHMr0MX2N1Ll1aBdt54TguoXFNse7OrO8jMs5WE3wM5nnsBLyI9k5QfJecSIsKaUOSxb5ORwFvnSADnvJvjcNb9a1NBWvhH7k3qKLcKZk5g21Vm/Ici8GIceZEY1Sxy0sj/DPIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Q8zjIr5Iby2G8aaZfpwO+F1em/LVB3eMEVi94rbbj4=;
 b=Zqfu1VIdYckJXfnuUJIPQaw2dvfkorh7tompVwwdZy5JQw/d/bVORHnERgLtkFQkBTiHNfK9BeeonRULA3M3fhZThT90re9Dk8QIgCDex6zCkJiXCjnxZGq4uqluuF0tDFMMnDOtTsR4IgrakKKNOAljEVgH1RFPG4L2jUv1e8bG88OJam0DfeYj42IRGsuMZDPLNPt4KDXlHJVIG4+eoCnkiUZuQDVdkVRcqzfS0UPtstifldPCDmPaS6IKj9X+Iwxco8ADYDynW4Ubd5WOvLWvAD2YVH0RPvIep63X7cKfGAEhdIrf0zk9P5RwqMhCK4a/+fvqaTyhPYeapOzkhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prodrive-technologies.com; dmarc=pass action=none
 header.from=prodrive-technologies.com; dkim=pass
 header.d=prodrive-technologies.com; arc=none
Received: from PA4PR02MB6670.eurprd02.prod.outlook.com (2603:10a6:102:fe::22)
 by PR3PR02MB5977.eurprd02.prod.outlook.com (2603:10a6:102:6f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.21; Mon, 31 May
 2021 07:30:56 +0000
Received: from PA4PR02MB6670.eurprd02.prod.outlook.com
 ([fe80::cd4a:3f33:abcc:9629]) by PA4PR02MB6670.eurprd02.prod.outlook.com
 ([fe80::cd4a:3f33:abcc:9629%7]) with mapi id 15.20.4173.030; Mon, 31 May 2021
 07:30:56 +0000
From: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
To: Kannan Sivaraman <kannan@cimware.in>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
Subject: RE: Error when building jailhouse on debian - arm64
Thread-Topic: Error when building jailhouse on debian - arm64
Thread-Index: AQHXU4F8bKEtM9fzi0izjtoYzF7hEKr9DdAAgAAnO6A=
Date: Mon, 31 May 2021 07:30:55 +0000
Message-ID: <PA4PR02MB6670AFAD2B49D463C676F1D5B63F9@PA4PR02MB6670.eurprd02.prod.outlook.com>
References: <CALeLWRiLpL3v0c5BDkmNFeObjfqs83MU8L4_4US=BygPkHMnPA@mail.gmail.com>
 <CALeLWRiU3q5Ubd3NZepHK_yeVYkicU7AejgCXpwf8MMdHrue9Q@mail.gmail.com>
In-Reply-To: <CALeLWRiU3q5Ubd3NZepHK_yeVYkicU7AejgCXpwf8MMdHrue9Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.127.65.146]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d4183ab7-4b82-4b9c-2ebe-08d92406074e
x-ms-traffictypediagnostic: PR3PR02MB5977:
x-microsoft-antispam-prvs: <PR3PR02MB59770FD3AAF8191E2958B86AB63F9@PR3PR02MB5977.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tDAb/HIatCQ45u3as5DC21XtuSkxpMmY3SrBGV7cp0T7ryjvrLseTB47DGwcTuwttjtDcUmUsV2k4y4bLl6J4VVJQi0tvV0ZpiW19OIT09Kei6KjzfRNUw+fMirTUHCIQvqDyNH9X/ADtDbWD8SjE5bXJewi2qtAz6yPbw9wuE6r88SwBsYOWQxuTVR7B3PItzyFuqoeTtzk1Q+3CqgV7V6fIlG0lZoT/LVRgGZwPL60BqeZL/YGel8dH4rkgHWlR7uDiIDIiOfLMr4+iw2mRMN7L9T1IavRQN5TCpOqTNGpHPiq5D1RIVhzocXbeynxWpabfGVROx/V6ODcNOpRKZwBK6vyiRi/5nzYiKGc5Td5adYYVI07C0uzO+zrdq6vXZ7LvwwnYkouTQf3CQBNYWMbzlk7wHeGq7uXYhGt/qVGobOyZqB7iQFJWndKvQjty2uNREWbxXNI807tMCvbqgv+W6XLpe7SMyMrwPeJ0sVgEabJ3ERO7kZHxTQKBkVpgOifnu/t1RFbTVkclZGjNH0Y9+thWq2NA+fEwb8MEF6sEH8Givq8ZtNdJ2ubPQRJYxbD/6C8CUJCSYNQEf38emA+7oxzuxEn7IwNr+KJPn4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR02MB6670.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(346002)(376002)(366004)(39850400004)(9686003)(66946007)(33656002)(71200400001)(5660300002)(316002)(66556008)(122000001)(7696005)(110136005)(64756008)(76116006)(44832011)(66446008)(66476007)(86362001)(26005)(52536014)(83380400001)(478600001)(38100700002)(8936002)(2906002)(55016002)(186003)(8676002)(6506007)(53546011);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?w5V4BQra9REkT6xRFHyxgQ/Rt12p3vI87jEze7enlKGDQAaipP47aK2v3R6N?=
 =?us-ascii?Q?DZdsN7+I7vtbm+tgOiJzOQXjC7mduPOtaI4pB1vRAhVcPg+I9P4BCdxMwVLG?=
 =?us-ascii?Q?ora7AQWUR0rNjwujzWMIWKDj6GVd5ChAt8NOOmNGW6dDyCsbG0i13Ou1i2pY?=
 =?us-ascii?Q?Y71f+/cFj7ShOCMAtD/HN5eSn5HJDINQzsfyivb5kRmBZTV65vf6UW2JMUJ+?=
 =?us-ascii?Q?ZDS/KvTOo/GfLCcXE4g0ood25xz4i8J02lVa+xrXD1Tvta8+hmBzBwJUVbEC?=
 =?us-ascii?Q?t8ASxzLV3RL0yiIOs/hkQJwTH7abTy4iyf2bH6JvoAXt0/1bZNSLBI/Upz2B?=
 =?us-ascii?Q?QR6Evs/EzpCEs1kklulBMklrs53tGeX8rIVYSKKqWectchhNlaUMg7z2VSzt?=
 =?us-ascii?Q?Xh9IMyw+TzsVAHgEvUdy1bmQV5cIb/eJJ5avcnIhbH5TuRZDKFAmxGqrwhBr?=
 =?us-ascii?Q?VH9ELKVOX39EPivvy8kuxDyYMm54MvYiNPDz0CqQON3LjPBp7gug+1HMIwly?=
 =?us-ascii?Q?IZxWuCyA/SFOsWdLObbfbZi/98A/lru1tNnhIzQ3utEUG1EvCVTwscmZtCeb?=
 =?us-ascii?Q?bxDNFbOE5QFmtggjZzqJ7NLcgHmNxXhGg5+ZZtwb4dPQregw1KHSs8IOMvTp?=
 =?us-ascii?Q?aqCQmUHRSXeXoLIRYGKc9sP2agb1ZCfRqGvgkpSZ2VXU0iS+4GTg5vjRHPU8?=
 =?us-ascii?Q?CNhMkPfak+tDdGYXwJ3YzGfQILav/5lcuh79vctPxqSbuhZw/UO4LfTQ8syl?=
 =?us-ascii?Q?1cDPhG62oOIVmt/YECaGrcSAYUTwXHYKb00fN7HpUkl95y8bGsyGvMW5z3Lg?=
 =?us-ascii?Q?HEHhzShJUpqTfr3huuP+H21B9N7uu5VKURuwhQzFe0kxEu+ZGTBNIjaAsJ7Y?=
 =?us-ascii?Q?LnqSDWShDToc9pXUM38b5Pre1zn7sSZ03/tq9Gw/H8i8Vk9hrjTSegFtKDp7?=
 =?us-ascii?Q?fBc/shbhs5KEqd/U4/KUaiTbsQM1UYk932yaIFtN?=
x-ms-exchange-antispam-messagedata-1: cTw4fIgA3MrdQrRmGbVe0he6e9T2qC5X9tIDrrqIBCi8bKiy3blecnrBOfI7Eukaeml9792GPmKFKWjYEvch8x/LaH7Tn/9O4IhFGMv/x9r2c65zIPKWCSg4IeIcPya6tJCaNy3xxnxkOVJRUFBN8/d7YQz1wU2BKL5MH8R06hF6WJdYa9x2yKwz5kbCpPGIJwAPxI6ScU4b1hOW4YJ7i10fXt4TEQ/VPk4DdvGwBwnnFm3ljRyQB9Lch9fG5hVafSDHVH4Hgw73dLvC046/gg4twrE1vY9WV+58Ggq3XOgmbbUER9TCmPFHmBYi0+tTq01u4pJIoKW13eQkGtzNa7W4
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: prodrive-technologies.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR02MB6670.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4183ab7-4b82-4b9c-2ebe-08d92406074e
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2021 07:30:55.7955
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 612607c9-5af7-4e7f-8976-faf1ae77be60
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xwXEXbraQ4s7ruwjCIFsEoRIci6UE5hQw4xH6JtcrkJhZ5Ut4SK9iR+vKBQ0scngN+RmhE4LYl0xzx33czg1p56Gzow+qCs+9xOmZERqln9pTZctLtrSUJHPq02LpTboppZdHy3nihaptDkJraToEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR02MB5977
X-Original-Sender: bram.hooimeijer@prodrive-technologies.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@prodrive-technologies.com header.s=selector1 header.b=lc8aacTb;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass
 dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com
 designates 40.107.1.139 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
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

> Hi,
>    Can anyone help me with this issue.
>
> Thanks
> Kannan
>
> On Fri, May 28, 2021 at 10:52 AM Kannan Sivaraman <mailto:kannan@cimware.in> wrote:
> Good morning,
> I get the following error when building on Debian Linux - arm64 platform.
>
> Can someone help with this?
>
> make[5]: *** No rule to make target '/home/parallels/jh/jailhouse/configs/arm64/dts/inmate-amd-seattle.dtb', needed by '__build'.  Stop.

I haven't used the Arm version of Jailhouse a lot, but as far as I know, these
.dtb files (device tree blobs) are generated from the device tree source files
(.dts) in the same directory. Do you have the device tree compiler (dtc)
installed?

Best regards, Bram

> make[4]: *** [/usr/src/linux-headers-4.19.0-14-common/scripts/Makefile.build:549: /home/parallels/jh/jailhouse/configs] Error 2
> make[3]: *** [/usr/src/linux-headers-4.19.0-14-common/Makefile:1568: _module_/home/parallels/jh/jailhouse] Error 2
> make[2]: *** [Makefile:146: sub-make] Error 2
> make[1]: *** [Makefile:8: all] Error 2
> make: *** [Makefile:40: modules] Error 2
>
> thanks,
> Kannan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/PA4PR02MB6670AFAD2B49D463C676F1D5B63F9%40PA4PR02MB6670.eurprd02.prod.outlook.com.
