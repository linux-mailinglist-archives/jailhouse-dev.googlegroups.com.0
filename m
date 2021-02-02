Return-Path: <jailhouse-dev+bncBDGILGE54ELBB54C42AAMGQE7YA47VY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x340.google.com (mail-wm1-x340.google.com [IPv6:2a00:1450:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A5D30C645
	for <lists+jailhouse-dev@lfdr.de>; Tue,  2 Feb 2021 17:44:39 +0100 (CET)
Received: by mail-wm1-x340.google.com with SMTP id j204sf1703035wmj.4
        for <lists+jailhouse-dev@lfdr.de>; Tue, 02 Feb 2021 08:44:39 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1612284279; cv=pass;
        d=google.com; s=arc-20160816;
        b=qlUz2ueJRRn9qyZYjePCH9lYPH9HThfkIaJwQLrSwq/co/2jWWuGSm9Aovz+cjw/Sp
         LIaNoQimecAQ9olIlq0MH2C5MopIKl/3G2f8LPxIWDp8fUQX7pX3AuZKbCUqUuRRq3Gi
         aZC8KDsMJM6GiCLgKPon8E8VtPgNLbMtkW8ZYXv3Hhnix3TQlTOSrVGOQgOrc4f4nUX9
         u7HHidt86brKgUTj2vKmYjmjYG21iPyEvoeD7UZwArMCa22J43Fe/5Nj8txXClFfQ6Fr
         w87E76xNv1Bb3WQcJKjEOeTZdvelFSIB6qPU9LPuUO/vcP70O9kuRPsJ1Z+NWhcK2yVp
         TIgw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :to:from:sender:dkim-signature;
        bh=eR1oZFH9ABIEut+EF2eBMm5XuPz2YBBbaUrOEZE9CGo=;
        b=YigkmJTDCb6BMvJTYyK5v3WS0MYc9y7eyH9z+0IU0Dx4uDOJ1AEDBl2eaISfcdn+fM
         Iz5z7l/KQFFpSFItmpeGpoCe781d9B/3SPyThYXvcoKxZwwEmNzTHi8dCCAhytqRWUTW
         smDNBiuAYm0od4XZ/qayG91fA34dgDHAfWNh40yRTlj18obdDKoSvcUoHlPVtnMYQQx7
         nlReMI1zJ9Vu4cY7ABOI8/maILIafwbPFf4ZYX/6AaWM+bC0nYnDMYCXVLZeX9WikaRe
         jO+a8GdUVIvTYGQov2rQznsQl8EaYdIfme9VhZXG/w3srU5w3Sg0nZuYauPe15eDmZVk
         Ho1Q==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@prodrive-technologies.com header.s=selector1 header.b="E3UCz/Uc";
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.6.108 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :accept-language:content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=eR1oZFH9ABIEut+EF2eBMm5XuPz2YBBbaUrOEZE9CGo=;
        b=qlKPjdhNRNmVk2noOif6sJqptNqsXZoO0FwbCrSgJuMhCp+q1hAkzLe01CqjHcTEj8
         QKyAiKOMilvWwPln7LyQrYieoFILHaL5dIZJ6D3xOo3HKnlOS5V4rWLLTXiscs2mLcc/
         SNqdVfhcPs7WEPfCgWlDKWAgupi5WwvRelzfZX/EjFuB47RmSZ8RRlQyV0cbTRcdKHwt
         pITGaxNhxNy78hF9FajTrp/yQefzMNL5RAy0y2opy2x6QTgDMZQ9n0kJS9p76DmCceZW
         GrXOKjgp9NDiDzvtkC3gXXT94/z2raOAaBHJO7nXK5Awf2SyklJoDZCprx8udLruFwYq
         Y2+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:accept-language:content-language:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=eR1oZFH9ABIEut+EF2eBMm5XuPz2YBBbaUrOEZE9CGo=;
        b=B9Uudzhrw9+vltNgPS0ft5c5bGIdCctGYVsQZ+/LYJLlyYm7TPi3vL0b/0yzBS5P+U
         Kf3XpWpR7qYEVV0ig5a54BzyC4R17QwIrqE5c0XV9kf153i6wOcAjw7fiJvtLuViqGJv
         rwyFPM29hm8u9Hb97kKKElX5EA7O8D9Guvys5Z+c02GplyoH8Fvk1rGbXsxaLF5OyuxC
         d1uADC6k5uAKF24Y6/uKhip+L2BPI/h6ujVQ+RnwmLWL9KHyDLZpRlhlUEWlLE2ij7El
         kh+z1xzYal+Ahce1qvpOQ5RyHJpiokOsogHarkKMD2oRWgheXMvrKGr8P6BCCGsbZM2Y
         8v5A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533drcbNQxJGlPbaLzzcW6I8nviGqyo8SXXxxlab74HpyzNb32Qt
	zL8Pkx+fsvYlsQ1C2hUrKr0=
X-Google-Smtp-Source: ABdhPJy0zKcZ4j2IEO7CMnC094jNEbsaXdGlhIhT70KR7YzSFd1eK8G80l6HoaHdFh1ZSVbm5NbmIw==
X-Received: by 2002:a5d:60c2:: with SMTP id x2mr25569923wrt.248.1612284279492;
        Tue, 02 Feb 2021 08:44:39 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:4482:: with SMTP id r124ls1641782wma.1.canary-gmail;
 Tue, 02 Feb 2021 08:44:38 -0800 (PST)
X-Received: by 2002:a7b:c842:: with SMTP id c2mr4510123wml.100.1612284278544;
        Tue, 02 Feb 2021 08:44:38 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1612284278; cv=pass;
        d=google.com; s=arc-20160816;
        b=yCCqDduaT48OHbc8z+z5TxqKTPeMocE2VfdpvHiD9z+kXFE6FF8C/JH1hVg/7x3t5k
         uSmiZKHrZ8N2lr8v93wYjGEUgbrG/vLb9cvzGtdNjUxjZdoVb76F/XSR5hQTgXRJYMZc
         uEhpRjQAFSb7HNbYMret2+0vf0niYxhWsB1lWwPhJQAezkIn25htEfBXufEvZPixkZdq
         gyCzpKRV5OeklFBRXt01N8AmSv4pZcgMtDSlfr4P6dm4sxC2g6AiXP01LxAVKmlelU9L
         2LwY+snwWr/RDYunqOneE78/E0Cm71Awx5vfb+QhBpR9RuoysJ5iYpt3PQ/DKappAHs2
         qiMA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :to:from:dkim-signature;
        bh=ltPRh+bSPFVLv+n7Z4OXL3zVwGql0qCOnDuxOp430i8=;
        b=ZCCUkliIYXupaf5OBDUBJegWmVqI8ZatepcxDqEkntyFX8RCiRFo7OQjq25PXIAuGA
         Af2wOU1n4w2gf79dwmWl7q096LIz2Q/y3+836ZCRwG/R1IYkocUXUolmuzs2gaPy3Sde
         No5doVeA+w8m0fGlZGnpArkLrPI1HdglBiNJ7nf0ta54IpkgZH/iF5COWhBSDnc1Dvek
         xk26Y9OdF04qjMRzqh97r0/Ii8I9NCnGYTSyMUTfB3iS/YBoIb3MPye7sKPI/G/AsHb7
         SgE2ly1PUlDMDpna3RsvC4yQw6GMqbY+iOaUlA4xjtJVMliKnAcpUqD3QcFNXgac/fZE
         I1ew==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@prodrive-technologies.com header.s=selector1 header.b="E3UCz/Uc";
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.6.108 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60108.outbound.protection.outlook.com. [40.107.6.108])
        by gmr-mx.google.com with ESMTPS id s74si196440wme.0.2021.02.02.08.44.38
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Feb 2021 08:44:38 -0800 (PST)
Received-SPF: pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.6.108 as permitted sender) client-ip=40.107.6.108;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KAjRr5zEDXOcWPoqSabGlKyn2hORF63HJAOL4Wyx1mOwBcgW8cd/EkV89O2k8QMv4ycGOUkhsLjZrwbPwdERE1JS8vp5tD+EngKpCuSHzbtoikUQdlHG3hX/BPIjjnSvTFam0M8XpPju8HMyJbscY1ROxW6NEOpDqn7doOJhx0N7pykFOQDGGoZGgDnAdbaH263ZLRjG2fMuukqIXI0Tqmh3umcWu2v6lQKlOyiXEQr5gI+PgNmj2/I8Ol7HZzQ7PMmrU3qvjGuEUcyiWangI6usNq2K845DSUm3kPS8VpZ6CAje2sxbh67lMTc0m73dXuYkW4IcuRwisTwTSMfepw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ltPRh+bSPFVLv+n7Z4OXL3zVwGql0qCOnDuxOp430i8=;
 b=Lw5DNlwJkc9lfPjozhv59ES+PNks0hvhhcPEJpNpAzDb6LDGh9Db1GJHAYSvRFkbHP0HzKL5XtHRmIou4LcKRxuXtpKVFENB33aMPepipNohsGajLDtlMEOw0clusyZyhpMT+u/BZi5WrEsGv2UaHBj4n8RUnFZurVMd4xDrr5DH2y2zJgTBy5KrP+BbKFgDM9grlnRwW8bc8y8SezU4/fVWCzZasig2nb+oSnqUgsbl0HT9oePF4P/tmBXp1bC8MQjXQSwNUmQTwEcwdnXDKF35UrhvzJszMQZdpN2imrNENck2a884J81xlg3lRbAploh3/hVUJoKxYH4fGYz/Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prodrive-technologies.com; dmarc=pass action=none
 header.from=prodrive-technologies.com; dkim=pass
 header.d=prodrive-technologies.com; arc=none
Received: from PA4PR02MB6670.eurprd02.prod.outlook.com (2603:10a6:102:fe::22)
 by PA4PR02MB6910.eurprd02.prod.outlook.com (2603:10a6:102:10f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Tue, 2 Feb
 2021 16:44:37 +0000
Received: from PA4PR02MB6670.eurprd02.prod.outlook.com
 ([fe80::91a7:f5cd:50df:e378]) by PA4PR02MB6670.eurprd02.prod.outlook.com
 ([fe80::91a7:f5cd:50df:e378%7]) with mapi id 15.20.3805.019; Tue, 2 Feb 2021
 16:44:37 +0000
From: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
To: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
Subject: [PATCH 2/6] x86/cat.c: Fix CBM for non-root cell w/ root COS.
Thread-Topic: [PATCH 2/6] x86/cat.c: Fix CBM for non-root cell w/ root COS.
Thread-Index: Adb5f4HiGhqrMBl0RNyUOg6lMin2rg==
Date: Tue, 2 Feb 2021 16:44:37 +0000
Message-ID: <PA4PR02MB66709EAFB592AB3A984173B0B6B59@PA4PR02MB6670.eurprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [212.61.153.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 473949fa-128a-4c4e-747e-08d8c799d44d
x-ms-traffictypediagnostic: PA4PR02MB6910:
x-microsoft-antispam-prvs: <PA4PR02MB6910520855384C37C3E1B729B6B59@PA4PR02MB6910.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 27KYVKMmLIwmpdjrP19RS0EdEj/CSJkZOkBH1UodzO7vL3IK2F/Em2VzXaYuW0IeSXs2oBjBKhCrMD1mwcWA9PWUmrs/iLYNacQu8B4WFjQe64GyeF/HVTktAg5lCRSMUuFGyWiWF7Q4XbLipJ3KswIWyhyVateTx0nwcB8ycVOPY0NB7FcNF33FfFd5tXoQE7idmpjXZIBS+ITCbzzi/qnLKrnFyrz/NNxwvFai1fc1Or2OCTraWDLMZPFqnvQOhVOLF+cxa///WTarWih6jFsDxU9n91nXdsRlt8gGbD4yrrWCTayoc6rLeD+a3Vt2BqyY/JPjIGMTIYFr7qexXTCONqgFCICLg3GFxDBFikMDhbHsZBxHo9Fc1B3fMg75Loajz7F8s/VBQMZ4U51+kgshfWY7ONJFY2+JYLpiW4SApehAm+ZeWkl4swH2Fhe+Q+pmJs9/8zy0juc7/DOhWVL6OSD5odSbhjHX2CxFjHtGzQ7gsYCMFVXFoodetkvOWoy6Q0CIpmYYwa3bpKgeoQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR02MB6670.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(396003)(136003)(39850400004)(33656002)(83380400001)(66946007)(6916009)(8676002)(52536014)(9686003)(2906002)(478600001)(26005)(6506007)(8936002)(76116006)(66556008)(7696005)(186003)(44832011)(86362001)(66476007)(5660300002)(71200400001)(316002)(55016002)(64756008)(66446008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?BkyFoqEeRWX/EeBjwoK9wfc6mH6Oh3+JfBNM/QUk+qiOliYgZC3hXca3RR26?=
 =?us-ascii?Q?wzxxGtwdXUsDYiMVZxSAv1cRqJ/Z9N5cyKOtmi2gVzvqquU57Xtj+PDyZ1gI?=
 =?us-ascii?Q?3xYjPFUikyMfYBYK6LO94NG6xQ1I2HsjnBjGiS0aCQn2Dx6zmGLdWt41Jfb8?=
 =?us-ascii?Q?ub9q/FrjpHBbUT4fsKZgxyIiiH3SLJJ/ZCsI43g0u0qWSLNW8Mi0W2yR9mqF?=
 =?us-ascii?Q?udvEWTStiv6bAx5iVDqAog6YcT8YlJgKyLWhmRv88qEeUpfwbL0dD6a3ywxN?=
 =?us-ascii?Q?isQdcIaASkuaoRz5bydd1/KEMXWLQZnDwQUPd8DwUZYtCz4ciE1drfzg8XFa?=
 =?us-ascii?Q?s7Z+9zyYsB0j/5PKAJRFRoK6fKPggdqeEgdAF/aS3Pdq9sXgOypHUWG4xjuq?=
 =?us-ascii?Q?+j53YNYnSHin9EL21ZLAOYg3JWJmIlwI0LZ+l1nquS8l9eSIXKJuE8N8t4Rp?=
 =?us-ascii?Q?C6RWVm4RFKFFvLFegjzvo/HfzqOO1iJ62TaA/Dq1pXZ4TCam66YyTpOQsAJQ?=
 =?us-ascii?Q?YxHovfAT+91sz1DtrdhQz6p/Yu07VRg7AS6lUlcabWweyGU61XHih5lqybAA?=
 =?us-ascii?Q?dj+Y9w9llOdLTPZfmp/qL3FieOaKSOACXkj82+84mmZNJQRM+hqNb8n0gEWY?=
 =?us-ascii?Q?r473PyLyA/06HLe6eyB0PKMPD6YFHtQHZWuRpVXwPpjokzyJ4Nh3RKgWV42P?=
 =?us-ascii?Q?h6z1TGyVcqL5eWE2M0KgilkgtBEXj7JjqeQeQJboo1RKTMYaDBeUWVJeOYF5?=
 =?us-ascii?Q?wBp/lUXUAIHX3md9uw9aD44n/0TEsBtYVa1PdD81ShFd0WDzWD8W9Qf4/THA?=
 =?us-ascii?Q?bWTPH+e1QT62odrj61a16+T1vplpuWhh8FnpkyPZDHuXEXXmySOV0yOrQpob?=
 =?us-ascii?Q?n6VII3eR758E9W09rtoRfWKnoJuG5xBchQDB4+l/FOYPoHXie/LtQGDG1FS6?=
 =?us-ascii?Q?5r/BXiOfF9JEUv/Cedri5FY7ImgN4AfqmRgq3MtFXzAiWCuDQlTbKsDcj3IH?=
 =?us-ascii?Q?7RtRNelj+GXCfqq8efXPpdI4nehRzCNl8Csomia5TIcnn0CToReW3j60uv2e?=
 =?us-ascii?Q?th0v24VF?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: prodrive-technologies.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR02MB6670.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 473949fa-128a-4c4e-747e-08d8c799d44d
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2021 16:44:37.7500
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 612607c9-5af7-4e7f-8976-faf1ae77be60
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wivGgTLaCLoZ3b9E3zB1YUClH8uPgVYdvT2YVGf+m9Q5Iu5pntPyR3tdw5V5VzXYx2Y/0sWnOGx+xOysoRncvOY111lasshOGgl4bipB2krMou/4qHKqBZ43guugl3zeYYRYAXVW4Km1gZ8PQ69wWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR02MB6910
X-Original-Sender: bram.hooimeijer@prodrive-technologies.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@prodrive-technologies.com header.s=selector1 header.b="E3UCz/Uc";
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass
 dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com
 designates 40.107.6.108 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
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

The procedures for shrinking and extending the cat_mask of the rool cell
affect other, non-root, cells as well, if these cell use the root COS.
That is, when cells are configured without cache regions. The code is
updated to reflect these changes not only in the root-cell, but in the
struct corresponding to these non-root cells as well.

Fixes: 3f04eb1753bb ("x86: Introduce Cache Allocation Technology support
for Intel CPUs")

Signed-off-by: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
---
 hypervisor/arch/x86/cat.c | 31 +++++++++++++++++++++++++++----
 1 file changed, 27 insertions(+), 4 deletions(-)

diff --git a/hypervisor/arch/x86/cat.c b/hypervisor/arch/x86/cat.c
index f6719b1e..42fd83d9 100644
--- a/hypervisor/arch/x86/cat.c
+++ b/hypervisor/arch/x86/cat.c
@@ -60,6 +60,13 @@ retry:
 	return cos;
 }
 
+/**
+ * Merge available bits in the CBM back to root by modifying the cat_mask of
+ * the root.
+ *
+ * It is the callers responsibility to call cat_update_cell(&root_cell), and
+ * to modify the cat_mask of the non-root cells sharing the root's COS.
+ */
 static bool merge_freed_mask_to_root(void)
 {
 	bool updated = false;
@@ -86,6 +93,7 @@ static bool shrink_root_cell_mask(u64 cell_mask)
 {
 	unsigned int lo_mask_start, lo_mask_len;
 	u64 lo_mask;
+	struct cell *cell;
 
 	if ((root_cell.arch.cat_mask & ~cell_mask) == 0) {
 		/*
@@ -125,8 +133,17 @@ static bool shrink_root_cell_mask(u64 cell_mask)
 		}
 	}
 
-	printk("CAT: Shrunk root cell bitmask to %08llx\n",
-	       root_cell.arch.cat_mask);
+	/* Cells using the root COS are also affected by shrinking. */
+	printk("CAT: Set COS %d bitmask to %08llx for root cell",
+	       root_cell.arch.cos, root_cell.arch.cat_mask);
+	for_each_non_root_cell(cell)
+		if (cell->arch.cos == root_cell.arch.cos) {
+			cell->arch.cat_mask = root_cell.arch.cat_mask;
+			printk(", %s", cell->config->name);
+		}
+	printk("\n");
+	/* However, updating the bitmask once suffices. This can be done
+	 * during code execution, no suspense required. (SDM 17.19.6.3) */
 	cat_update_cell(&root_cell);
 
 	/* Drop this mask from the freed mask in case it was queued there. */
@@ -201,8 +218,14 @@ static void cat_cell_exit(struct cell *cell)
 	freed_mask |= cell->arch.cat_mask & orig_root_mask;
 
 	if (merge_freed_mask_to_root()) {
-		printk("CAT: Extended root cell bitmask to %08llx\n",
-		       root_cell.arch.cat_mask);
+		printk("CAT: Extended COS %d bitmask to %08llx for root cell",
+		       root_cell.arch.cos, root_cell.arch.cat_mask);
+		for_each_non_root_cell(oth_cell)
+			if (oth_cell->arch.cos == root_cell.arch.cos) {
+				oth_cell->arch.cat_mask = root_cell.arch.cat_mask;
+				printk(", %s", cell->config->name);
+			}
+		printk("\n");
 		cat_update_cell(&root_cell);
 	}
 }
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/PA4PR02MB66709EAFB592AB3A984173B0B6B59%40PA4PR02MB6670.eurprd02.prod.outlook.com.
