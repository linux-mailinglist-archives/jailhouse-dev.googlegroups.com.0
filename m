Return-Path: <jailhouse-dev+bncBC44VTVY2UERBQ6PY2DAMGQEPE3I7GQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43e.google.com (mail-wr1-x43e.google.com [IPv6:2a00:1450:4864:20::43e])
	by mail.lfdr.de (Postfix) with ESMTPS id 957983AFFD5
	for <lists+jailhouse-dev@lfdr.de>; Tue, 22 Jun 2021 11:05:07 +0200 (CEST)
Received: by mail-wr1-x43e.google.com with SMTP id l13-20020adfe9cd0000b0290119a0645c8fsf9458846wrn.8
        for <lists+jailhouse-dev@lfdr.de>; Tue, 22 Jun 2021 02:05:07 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1624352707; cv=pass;
        d=google.com; s=arc-20160816;
        b=bC7qqsHrHBOVfT3sSlrkNxJM6YL3/A1DG3/QsWCM2N6PGnZjyAvf9CmgEaUXzVc7uV
         dn85/xjjXDnBou7RCjbzDugPhbKRAez7HHU76bLTxGFL4j9hnx0nh0WkdqnFb6AsmXt6
         zRCyDHyJ0N7WPgHvSJ2+QylAIWKP2mzP2iEN2d4MJ7swTd+Nu/R5eegdd5eNZHiGC0f2
         B18iHexvVQ7zksM1hOQWuxNh8T5CqsMx12GdGZbPxITPFxlVRaA+fr4uLphFsl9DA2KH
         LPv0YhuQJcuObXe0CHRhZcxdEnOvaw9EbpsJhxUu+W1QMOLJk6+Wk48PwZWgNDi5gQ4R
         O8vA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=dINbcZZ7u749JOxyfiYBjj1lDyIM3taCyxnDmpi+9Is=;
        b=TcQaEjYaLf796Us1kKSzs9VT35BX1c5B4p3prUe3Lmv1+8QObXaNpkBPxC1vfiLMIj
         F3s79Ncv2Ygj+CeCsRQoXm9uR8aXdDMdG3TkvLi+6kfVtt/Knn7lrAqT430htMN3Dp1m
         P9C+sLQghaiea5kBxAL3EnXdAkTeYCiikrsl9vodBYis6X60ujF3emVu+kxQlXY+fiFq
         /L0N2/WF+GXVe5wmWyLgHR1fltf9FokzV7VYaAEBE5CSqM2XzJP1UnoPwSm2MR6jgdtv
         MmE+7rAE5mi6HSHF0iJwdlXQLK5AAO9oxtiocyiZULQHRthxSFzZkRNxkJuOROL100xD
         YvyA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b="eGf/Xzk+";
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.4.75 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=dINbcZZ7u749JOxyfiYBjj1lDyIM3taCyxnDmpi+9Is=;
        b=lZAxmyqjFvUuA4okMeKq1de4rnkzgP15I2Mh31kgoUf3BYDlcOkcC2Vl1rkGtvMqnb
         C33lWalBFRwQ2jrDkPJLBWNGuyOCKA5NX6RQEAXps9lT+xFao32nsXmpKNTT01HHNXK7
         if+6Ne8sbBmeKhRPtbiymrmMm7yStAll6ZIX3pvibHpOrGPl4HNVlotBt2Omxomgg1Hx
         OxDs6dLKGIq5TKDzXv1apK4/FY90kbV73aCxrx2s+kFmqQ5NBI305B2hW6b/ZWYIrYM9
         C8W0BVUyVnan+pWrVNEPcZ8QOEQq22G1bNerFeh9+o6f2+qpT6PIqzO2EtoOXOZ+odpR
         5fAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=dINbcZZ7u749JOxyfiYBjj1lDyIM3taCyxnDmpi+9Is=;
        b=H6twqoVK+7ldoO96jrjjritpsfTJW6Rajtds9AZRuTBnbRerwJmQ2QDGnqkJDaehUx
         0jwVV44smuPI2lQBbfms4OZbke9jYj76tHzLDkpl3FvrNuNfdWyCGWoQCoHCGcaYoGER
         Uia2qS1zpzuTpzKtlszVYqfJna0/zZHYrZzSICz33E0G3N3g4OcSRor5eRQKsjuSq+1e
         HPlMYspRJ96ll2oGTAmX8JF4L6nbTKw0Y+qB3jeHeib6p5PjWrO+7QXF3Gzj+5gFZo5M
         lEyo7Sy0HFBB98lvtXMXrw1kjdliuXLB+L9yTWBLDldiC5i/ry+4pC9nh3325//W0PPG
         zsFA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531HwN3F6ZbmBpFGzODyQZYKpCI5wqhJvIf+HePU4qbHkW4uE1MK
	T2NfDNBPa2zo9KxHeMlWT0A=
X-Google-Smtp-Source: ABdhPJwAVxIUvzj74FdlU4IRUIYV+vkbCFM6xoOwtFYImDq8c6EnLbCT/emaeKYK3vkXxRici98T5Q==
X-Received: by 2002:a05:600c:4ecd:: with SMTP id g13mr3147970wmq.174.1624352707364;
        Tue, 22 Jun 2021 02:05:07 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:edc4:: with SMTP id v4ls542494wro.0.gmail; Tue, 22 Jun
 2021 02:05:06 -0700 (PDT)
X-Received: by 2002:a5d:525a:: with SMTP id k26mr3343970wrc.303.1624352706425;
        Tue, 22 Jun 2021 02:05:06 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1624352706; cv=pass;
        d=google.com; s=arc-20160816;
        b=EGDZ/pxjMupKoVFu2F5WH2HHZqFfVWXLNjxXOrmKuEIuf+hpNJTknluaCPcUbl5Pgf
         mOm08uFvdkORf/o9fKhTeEmDsK+r+SEr/v7p9gGoAgjH+Oll7LDrMgG0ZBfTiz1MIyU8
         5J1cD9FkK4II6YmGQyRvCL1P4LFkbXLvCIpGPtDgg7iYcsHE0vgBAz5P0ySysSQ9Ed4O
         K/n/etiXpE/LLmrCJLKDYkVYFbse++t9F2auBzYFb/tyfL2AiwN0FByFofB8qmEEGbpQ
         S0KBHipWj6bmqQJ2459c8C0apnKtIsQh2fPVonHuWyZIjHVuwHPp6VdslgGNvXDQuP1F
         r4Hg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=fYkOrlDilOhCF/bZCyioZHGiecmRuvib2ZTkG1P601Q=;
        b=ky6hxXYiQormtSrV4nJT0jp2fCTmdP7EF3POFwARv4i7hEgs58+DYLYFuk56H1Z34O
         IN52d7d2SLMUmuNDzjEspc6/LdHYLiNpTkrie0wjon8vCSdEeZDqC3mdej41LgUgw+tI
         usca/+Bsly8GaDF43Fs0WAaMvgiDwo00dlVsIAWU+7ZCxqSVJPcYFvDtmQj4k8pkkBpM
         vEXoKDSfS7ZXmfe+No1/WOgFEaA8nDGO6we0rUNOt/bI8MePvvCx37G+9A+XcWOIXWUG
         gPFfKXSJ64A7abvJvHB5PxazrUG+8ujATNMu0LuTUOQejsFnhYXeApVy/WfIoSy+fein
         zoaw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b="eGf/Xzk+";
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.4.75 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (mail-eopbgr40075.outbound.protection.outlook.com. [40.107.4.75])
        by gmr-mx.google.com with ESMTPS id k18si142046wmj.0.2021.06.22.02.05.06
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Jun 2021 02:05:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.4.75 as permitted sender) client-ip=40.107.4.75;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fhHi1viN2e8FqveKFtSjdnKs/V0QS3MPDgmmCLqldqUibbBSNRJSvdgQ75OtGppji8zp29iunfu4voFQA4Y83ezXy64o17+Q5I7WO7zCQngz+0k1OpzFQCSLhNriB/v2+AL2lJZ54sjf2O/i4K2Whh/A8np4U2J1I5ri+RRKqo68FfKms3OmNkdAonjOMTY0bJCiBTX5q/9bG8xlZu0Lz8PzuypjzAVtuoldB9+xMpkd54PhhitZ1iQd5OGi3XXpUU/jjtLdeoYdhsYmyhmrDjxp43hgSc9vL5iPoDWxt//fILdsxnGOTD2LgFnPYDrjve5/Qnsywiwjl/DAZhzf9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fYkOrlDilOhCF/bZCyioZHGiecmRuvib2ZTkG1P601Q=;
 b=XntDS7/3gqv8sYbBeJmiFtdWO8rR9iCcJNJEkNLn71BndWavmqy59aY3il74+g+/xcqmHt4Fc/TYP5d4KdR1BaC9RasVDnNi1myJyoO+DIJCMEZfRcz0eym/pW4+gCXKqfi2TLWnrdWRA+cb6EjYIG4Rk0/G9xKV6v8X3T0cOoKOpyBk6MQLDPqKNKBfSPrky/FSxbEjOYU0hGRPQw/5mDPsRkWiKx3xHmpathLasveQ29vWW+GxQMsMsbUNFu4GUfP/X6yt+bCfGK14f1OLzq1fO8V7NP1zHJshcUU6VJMwEvdEf/LG23APmp9uvEMVVWUnxWiXai06U+Na/gmXfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:49::10)
 by AM0PR10MB1907.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:4b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Tue, 22 Jun
 2021 09:05:05 +0000
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bda0:21a9:36c7:c9f6]) by AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bda0:21a9:36c7:c9f6%7]) with mapi id 15.20.4242.023; Tue, 22 Jun 2021
 09:05:05 +0000
From: Florian Bezdeka <florian.bezdeka@siemens.com>
To: jailhouse-dev@googlegroups.com
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Florian Bezdeka <florian.bezdeka@siemens.com>
Subject: [PATCH v4 0/4] Support building and running on Debian 11
Date: Tue, 22 Jun 2021 11:04:58 +0200
Message-Id: <20210622090502.231179-1-florian.bezdeka@siemens.com>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [178.27.125.62]
X-ClientProxiedBy: VI1PR09CA0054.eurprd09.prod.outlook.com
 (2603:10a6:802:28::22) To AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:49::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (178.27.125.62) by VI1PR09CA0054.eurprd09.prod.outlook.com (2603:10a6:802:28::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16 via Frontend Transport; Tue, 22 Jun 2021 09:05:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 52eaed88-6b10-4425-5f4d-08d9355cd396
X-MS-TrafficTypeDiagnostic: AM0PR10MB1907:
X-LD-Processed: 38ae3bcd-9579-4fd4-adda-b42e1495d55a,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR10MB1907C3410CCBC30F74E6057DF6099@AM0PR10MB1907.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Dd6ToFJuUzhDq2/IYNuVRH8IR53qjpNcd7EXLayyLxrjZZqhZ0ufQwm/dFO+m8skLUl6ofv4unXQdMV9wgnDe7J/6ZmaBH445vZ6b/hLM9n8Dkg6cpFBTcwaAn6zAJNI27P/OnRJKPy71fTsCJ/EI/OSJ29hcjU9XPQ09aK+O3omByaS/RK/m2B5lPWtyFLJhIXi/74Z2D2WljMOFA8uNNvMhL7ltFRXu6YBePPfkPqRg9JO5j5MaBgl6h8YLLL7fgzPrq7k9SDXKlCrkssVkrPEPiwnTg6KIklK3PF4HyYfXlbMvg9lYoBR62u0ro+xljilpV/LgtliBkXDfADneNO1jKpJEZ9cmrIcPeIbHHK1aCzDO8bhnMiSCjlJNt9Y6EH3NuyaMPySjFrKmJZaYr1trgBZAz2WgtSnpNhGtbYfvJbEzhArtkrYlumwe5IiWhTW27gqGqStuBSaA9MSha7iE/40tZQqQhAZUD4HZFd8aGwQFHBXI+4ogJ6ttFov4LaWw7kKTB5n9jzrW+kYe3STLN1VMd8Gp1ZK9J/wt/Ni6bGlJ2K1tsNmgEf1QElpsMxpBELZYgdup9JLr+lo0Yj8O203aD3Xb1hnKBdnKfk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(366004)(396003)(346002)(39860400002)(86362001)(107886003)(66556008)(16526019)(186003)(1076003)(6666004)(6486002)(66476007)(36756003)(26005)(2616005)(83380400001)(66946007)(38100700002)(2906002)(4326008)(44832011)(956004)(6916009)(8676002)(478600001)(316002)(5660300002)(54906003)(8936002)(6496006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZjDnpFlPuB1wTXvqmhRXPIT2uBbG6TXnllPBtqhWaGoXvnIDBIXSp0arEil6?=
 =?us-ascii?Q?fypbDUH2JbRvK+k3bnjVHfELf8g+6uQnEyRS/ZZxT4Z1KOZXptQ1RBEoEnmb?=
 =?us-ascii?Q?XRo6xXAVXmdDBbBjqVuVokKE6C5UkH8neQQ0L0Wg0rYE7D4b5m+4FR8y8vwq?=
 =?us-ascii?Q?UDmHIyFJ6Ex9U/PKvAP3a5TCm8ImyCETJ3aXqfPrjhwAlqf48qjhCeUaxsBY?=
 =?us-ascii?Q?L2MKCwFD1Z6AE/C6ouAvzasIBSTspsKW7mTKnyD/y1PGGhvkN4ArlqJ3EGOB?=
 =?us-ascii?Q?NmiMUtvWIgxGq2e5DoVFwv1DIeclZ1gpKTGAGMrTuR4Fqb/lgxbueA6h6QlN?=
 =?us-ascii?Q?9Oru59157yHdpcL5sI8vSnwNChKIleCloErlzfjcuhtaXWm9FI4KbMtvfEMO?=
 =?us-ascii?Q?GuGhivJahae2x3QGIPq9v3TyIdGnj8cEHRn7qpqXdckLCuDIw8QBGZCEHkka?=
 =?us-ascii?Q?4DqCq8FUGA4Rr04NMpG1e3lB7iRhU0/V7aw1VftKMAvvt1vqs68FFCfBKq8r?=
 =?us-ascii?Q?KPMTqpB1jqH1jct4c9ZZ+vwBh7XLqGgacMVQwOszZfT9BT0OXCZuHpLLj5IU?=
 =?us-ascii?Q?tyZkMjfforTr1lcb6ip0T+GxOjlKhJEB6qHeUcuwQMq4EGXJYMWrngXJPMGk?=
 =?us-ascii?Q?C1S7U1LVswxtacg/GoOMEaFHIjupKlgdRQBB3pzztWY4KyHsaKLm+MbCqkdu?=
 =?us-ascii?Q?aNpgsRB3aJGd/RUJsmQZ8Hdjq5YkcOhTbCNIwiO2kMY6fAVvxV6+8plmdpVu?=
 =?us-ascii?Q?b3HkpebXlt1SECYhtmT7uAplQL6ue/K60eL8MfphpkW/xWXY+Z1Z/nuL9GZf?=
 =?us-ascii?Q?2P1++Nx8Je+GyWWGQcVAB3jykKDs7iJ2phnK27xQLtlyOJZJrIvDpF5KnAwP?=
 =?us-ascii?Q?piM6kmpklpNRwTR606aREtCkhra61ZZLENAT8U+GmIGHFj85Z2MCCFXt/TJy?=
 =?us-ascii?Q?+p2ig34RE60hYd2tLyK70ywr2qrDbmRXg8D8f+KDk/OwNTxgRfTIOYXa7a/D?=
 =?us-ascii?Q?tB4Pi5y7zbnGqXzYBIK+v5tobSJ9arnK1bJ3nvJblZlceuNJ98WWlsNSB7wg?=
 =?us-ascii?Q?Bcp35/LxU3FpAWbp36t0CzFzSlHwgqR1G/8eNWKWmfIOlmrbdWw5szZeyccg?=
 =?us-ascii?Q?0HoIG5kSQa7XVyjxYXn1325GQN+nj7Vvp0xx7I4MzRMdhF1m4iLmefgzA31S?=
 =?us-ascii?Q?N9uAwPqMYit7y7OLdcKTrz2lCgIDk64Av4CEn2S9T4lQ2UKU7wMp60w5bNdc?=
 =?us-ascii?Q?5fo2u37NCBz3D+qCj9uVZ2goa7CoWn8lujewsbXCPkqL5bjj5F7Uht+2fOXf?=
 =?us-ascii?Q?t9zFgUc/4NWoqZofGQLTrZHZ?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52eaed88-6b10-4425-5f4d-08d9355cd396
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 09:05:05.3426
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0SfPp2eqbC1G+fPakHhf8MJGMQVH/S/Bz3z4wBp1pJvZr/7abLMl8yjpQt7Gv764/e8wqWg8l9Zgfn92Ja7BXSi8UxP6fAjWS8fiYgia5ec=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB1907
X-Original-Sender: florian.bezdeka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com
 header.b="eGf/Xzk+";       arc=pass (i=1 spf=pass spfdomain=siemens.com
 dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates
 40.107.4.75 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

Hi!

This are the necessary changes for building and running Jailhouse on a
Debian 11 system. As Debian 11 will no longer support Python 2, most of
the changes are related to the Python2 -> Python3 migration.

Testing was done on x86 only so far.

Best regards,
Florian

Changes in v4:
  - patch 3: Take care of python2 specifics in sysfs_parser.py

Changes in v3:
 - patch 3: Fix typo in commit msg
 - patch 3: Retest, correct ExtendedEnum(metaclass=...)

Changes in v2:
 - Address review comments from Jan and Ralf
   - Cleanup ExtendedEnum
   - Remove "from __future__ import print_function"
   - Migrate shebang of scripts/arm64-parsedump.py to python3 as well
   - Update CONTRIBUTING.md to mention python3 only

Florian Bezdeka (4):
  Makefile: Update build dependency from python to python3
  tools: Update shebang from python to python3
  tools/scripts: Remove python2 specific code
  doc: Migrate docs from python 2 to python 3

 CONTRIBUTING.md                               |  2 +-
 Documentation/setup-on-banana-pi-arm-board.md |  2 +-
 pyjailhouse/config_parser.py                  |  1 -
 pyjailhouse/extendedenum.py                   | 15 +--------------
 pyjailhouse/sysfs_parser.py                   |  7 ++-----
 scripts/arm64-parsedump.py                    |  3 +--
 scripts/include.mk                            |  4 ++--
 tools/Makefile                                |  2 +-
 tools/jailhouse-cell-linux                    |  3 +--
 tools/jailhouse-cell-stats                    |  3 +--
 tools/jailhouse-config-check                  |  3 +--
 tools/jailhouse-config-create                 |  3 +--
 tools/jailhouse-hardware-check                |  7 +------
 13 files changed, 14 insertions(+), 41 deletions(-)

-- 
2.31.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210622090502.231179-1-florian.bezdeka%40siemens.com.
