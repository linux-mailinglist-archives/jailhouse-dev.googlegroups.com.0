Return-Path: <jailhouse-dev+bncBDV3L7XXLYIKVK6LRMDBUBBSPUASA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33f.google.com (mail-wm1-x33f.google.com [IPv6:2a00:1450:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E3B4379AD
	for <lists+jailhouse-dev@lfdr.de>; Fri, 22 Oct 2021 17:15:54 +0200 (CEST)
Received: by mail-wm1-x33f.google.com with SMTP id b81-20020a1c8054000000b0032c9d428b7fsf986599wmd.3
        for <lists+jailhouse-dev@lfdr.de>; Fri, 22 Oct 2021 08:15:54 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1634915754; cv=pass;
        d=google.com; s=arc-20160816;
        b=qHbU6zEdgWL+zTlv+aI3ReHEsfqaVfAqBNy7c+5F7CyJl3/5N1OTty3WSqxrYGqTMy
         bWcVtg6qU3N8iO1Nbxg07C9osNr3oZ5pUmwehBt6lfWcDIcXX+DaGmco+3e7fifT4Y9S
         sY6PR9cLZtdU0yWjLtFg/bO+CY2SY3RtURaGWXhntJA9pvlzjo4w+mSAVoU6mfEGzTKe
         zdPFVjr2dkYlaE/DEc46wcNd2INXiF52z0OoShbjtKgcZhJCVCydhmAPN6qM0GTYz5+p
         qX892KLvxqjTHqwyKBAzOORnsG+HB+pEm3HIEU1XMpopt8+2ExvyyQ5/kACxWZ646+4O
         TrrQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=RF21I6FBHhBFutbdVGxdWBOp3A+LL9niH7MN41irt1I=;
        b=zox+lAVfm4KEkAw/K+8vwC8eMH7kl5bm9hoEra/9CetSMd7oXn1gvrAHzvSphBPTub
         awEyD7B8EAtEfgBGlZw0bYkX/zzo5RtKAd9cC45zkRyLXUsFy38fPFw5NfkJ42YT/wh/
         2oiaOtNs3NB3geJTsMy04poMWkl6DUajKZJHzVwSDt1YyWrXIwrMQN3wpCM+kaxlizj7
         bt2L9g/jPqUcJyDtRlFw/PoBjhx+C34dv8OtO9u8szklza3mSFzTYoNMzh7fs+7Z2pVh
         KhKKtJ4xLMdZV/z28gcxrclgr40J6F41oRgLI1vaG3axy3oXBCaA8QJVNWfY4yDvhq+U
         C42g==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=QPh3D9Kd;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of anda-alexandra.dorneanu@nxp.com designates 40.107.1.73 as permitted sender) smtp.mailfrom=anda-alexandra.dorneanu@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=RF21I6FBHhBFutbdVGxdWBOp3A+LL9niH7MN41irt1I=;
        b=mg5WSrpz8OwOylzJhPFPg6gb8EqaEVJ+OJVP9svQReXRjMnrtoMxn5saBrgXFjftvM
         nOKTwRjuGNNH6LA3Z4D9KWQEZVxNaPD15k9sSb9mvRDIxo/Yuj6v2kS2NHt++uz0qTjF
         cqLXQMroLucbDpDQgimKgvZLngej9sMggTs817T4stxhOJ1qq6Q4uLhauzwH63TMKCD/
         vVveseC4X2IQI5JONOxqgOCAXn1nP53uAmOmOnC2nX0ItgNJ0cPWUKXJ1GTyl2vncy2l
         YT3blm32gZKpz1BcgfcPj4Z/2ZTemKSFKjjND/q6kltDDgEm86Z+e+umxIzti/S3iolX
         LKew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=RF21I6FBHhBFutbdVGxdWBOp3A+LL9niH7MN41irt1I=;
        b=uMYRjoIyKCcQOqqQN9aw/NPUrj4I+NOW0Cxf8WpbkHBfkmYlJ6u1Z/KLjcJOgt+Y0a
         g3kVKAL2KPuZwGdDP5gVWyfPsgYm9fZRBEFRjjFyjlsJnacUTaTufpNXn8er81Fi/HMc
         j7/BKygMGC63p1V9b07jKZWC7Cqv4ThboMkoP4KpInLaVF90zKYru8E8WvSP3b2BRdXM
         jznYgcwAw/GeS0WNqn+LXMqKfm0syGBIkvmXCT0OetXOfW0f/gQleRcE5oaBIq8TTH/x
         T9VwsKTUBgR+E6X/1ra0/jgiJRa74zhwQsBTMtIPEvWLDpIzgT199AJk1Brfq+7bl9Zg
         MikQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532LHpjJowtfOVuP3dQLjysHXRwHMTZHpmhPt9MxBaq/Wtj4lYMx
	MQRRZ3q7sWH/JsSjc7z4Lzk=
X-Google-Smtp-Source: ABdhPJzQBOfq+YD+BRlbeBP7DFIRAacfS9SYk3MTshvjYrB2gckDx3e0uzBheSS9NkfD9qW1q/V9rA==
X-Received: by 2002:a05:6000:18ce:: with SMTP id w14mr592835wrq.230.1634915754521;
        Fri, 22 Oct 2021 08:15:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:508a:: with SMTP id a10ls74702wrt.1.gmail; Fri, 22 Oct
 2021 08:15:53 -0700 (PDT)
X-Received: by 2002:adf:c00a:: with SMTP id z10mr512347wre.315.1634915753556;
        Fri, 22 Oct 2021 08:15:53 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1634915753; cv=pass;
        d=google.com; s=arc-20160816;
        b=tEVqWD95rT7fiaGf9cce7+9sjlFnGPMSuYHCX9EVdQMW0+BV16Ez7FA7TafytzmB7r
         9aWKwSgsLCoq1PKhNA9/Wbhet+biOGMn3ULRP/yjOus999cY+va/JXVJj6Ww46uTbFyi
         0gJN5M41zsY+SxFxFvsPt6Q/sLJ1+okINgy8/zKry+jyPg+h9jFndT7JbJvXLXdMJoup
         Rr9v2muvCaIIRFBGLrEu4iNMNTUGR9UqtH8SyX7whItOTaM3f/+Mzk4dFD0MWrpR2mrT
         I3x54D4ss0PA4Apfi4f1GRm3Jd2XLpPbookoaVzOLaGzUx5t74WZ1clVit5l2sXW0Z2m
         FIMA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=GDq8gsrqofGrN4JpaXl0CzPpl14rt++f2Bvd3MPJ7aI=;
        b=K/0eXfRyWRQbbPnRvzwobNMOAEuFU7sW/MKgCHbBwdPUPadyPMsY4V/hYXIVFTZyPa
         C+dTeW1eAhVNOxf7h8UC8tXRZqtCN63GKi96vf/B64hRMYciEcmkg4VD0T2T6iUMWrU4
         W6MicXfNFQNLJaTZAl6aXQxFLeIi5MSic7jMVczbDSDTJDel2bbWn17FAL8UFCLqyEey
         UcPEULGzCPlALPMsfQYJSAX6ddEVOl7Rv7d4PPs1iArCKjMaHXd5mktwYlYHVJIJNhlA
         gMM4HY/mIRFrTGuoQhGc75rtF4vB/are//ghv2lOxAvyYxwd6iAuTvTErNsDa4sSl9/T
         FalA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=QPh3D9Kd;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of anda-alexandra.dorneanu@nxp.com designates 40.107.1.73 as permitted sender) smtp.mailfrom=anda-alexandra.dorneanu@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (mail-eopbgr10073.outbound.protection.outlook.com. [40.107.1.73])
        by gmr-mx.google.com with ESMTPS id i1si348536wrc.2.2021.10.22.08.15.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 22 Oct 2021 08:15:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of anda-alexandra.dorneanu@nxp.com designates 40.107.1.73 as permitted sender) client-ip=40.107.1.73;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lpkkbFaA3yRNP6H++fb5TyN20Npv4tTc+vr3f3s9fuH9QjxDfLtIaF6XJ2/N4JhIjvr/dv4moJD/ZRaOq+ZAnTDzu8VIErPiKe8MH1bffwi8IB304RXvo+/i6y1inmfPB04/lGkzvwOSIBC6LcCIvnKeOm+RJ7d1tnINpY5m/0NgD5ojoFS4M5Rse6T0RjwmlwhNtJrYsEbSlxEwwNMx53VyzYMtSsAViwXWkQ9FMv+dVAn5yOLeuclQEDprtCZpQzeqUmtcWHTUlSrog9SUFS8rooQNDwz4ZLOE+9+SntvITCjcL7tI2mEhT23WLi2zPLUq4B/7yT1ZqkDfSoqCOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GDq8gsrqofGrN4JpaXl0CzPpl14rt++f2Bvd3MPJ7aI=;
 b=fmELajY21NZzJOhPUpIdHXpl88Km6UZbolhCqASUJDx+5C+WS0kAsAF8xpHaudQnkqnFKBZ4+coZlnNbFEs9vd/d3HA2wlGjBGU2I1+McheOQhOcQkE/fIDkIvMvYX/41x1I5L84jfEePtpav9k2ABLoT7lf3rE1C3ipN+e/AaO9Y25qJElhe3O48oxnlDJuUs+bhQ/8PCqLctJ1cley716eQZm2IZlst2OIjcIpBGcvTITQBbfQpmtKVdZFukgBo0O8WbJjWyBShQ26XEZWGonoXGdhniiiYIFcVyneYoJlHohGI7xrZ9ouySlsEV1+YXmpciKATTNHkq/i2JOszA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from VI1PR04MB4719.eurprd04.prod.outlook.com (2603:10a6:803:61::13)
 by VI1PR04MB3312.eurprd04.prod.outlook.com (2603:10a6:802:9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Fri, 22 Oct
 2021 15:15:52 +0000
Received: from VI1PR04MB4719.eurprd04.prod.outlook.com
 ([fe80::10ba:7d8:8af8:2fc]) by VI1PR04MB4719.eurprd04.prod.outlook.com
 ([fe80::10ba:7d8:8af8:2fc%3]) with mapi id 15.20.4608.018; Fri, 22 Oct 2021
 15:15:52 +0000
From: Anda-Alexandra Dorneanu <anda-alexandra.dorneanu@nxp.com>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Subject: [PATCH 2/2] configs: arm64: Add Linux inmate DTS demo for NXP LS1088ARDB platform
Date: Fri, 22 Oct 2021 18:13:10 +0300
Message-Id: <20211022151310.6058-2-anda-alexandra.dorneanu@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211022151310.6058-1-anda-alexandra.dorneanu@nxp.com>
References: <20211022151310.6058-1-anda-alexandra.dorneanu@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: AM0PR10CA0082.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::35) To VI1PR04MB4719.eurprd04.prod.outlook.com
 (2603:10a6:803:61::13)
MIME-Version: 1.0
Received: from fsr-ub1864-119.am.freescale.net (92.120.5.1) by AM0PR10CA0082.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18 via Frontend Transport; Fri, 22 Oct 2021 15:15:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c508a9b0-c4b6-4092-9510-08d9956ed608
X-MS-TrafficTypeDiagnostic: VI1PR04MB3312:
X-Microsoft-Antispam-PRVS: <VI1PR04MB33124211C5717A2BAB1ED326BA809@VI1PR04MB3312.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M/E+PqNUs6X8x+dPDjGVPrOuj5v1ahr9nzbtFEkO5SXMuHbF5lfjhCT0DRsrIlMVXhnZ+dHSJbD9o76SGrXQ+Jmjd1nXxKqdoA6M2BHJMrQ2wug9KwoPi7UMpKgeAjbEyd9jeL7hcgsQx56hmhO7u58n30SyOhT/BvsKOlQhElwp8gioCXouT2b/J4lNNbcCfgMxrCMUjHmCwjUgomVLVXQahAT/r9n0G+5DgvWmfk5v4KPKpY46KBHs61h/7NdBuWNpIiBoiM8k20SB6J7dYH3VSaSMdO/CtRD+ZMDiIfoVYeFhQ+ZXhTh62kWryBP5mjB8zt/ibYqwILI+QIol2zV757qWc9sJzNT959P9zTmtBlnQnvBy2y6Z6Ip3CEKVRDtp5+a0mcjSDcpfc7bDT+inA0L5jldrT2leByXxAcRgMQfwnh8BUh+B6Pk5pQ+jQ77T9mfjkhT6OqWDLbg3DIlAtvC3EN9kiF7xnlh5n9KJzatUF6svj7Gs7ePr3PKw/v/MWGk4Be/CYFpDvG0KP/HKL3thPlSQ6OTNaOZB43+1biZ/CJMl56HU6lBN75e78Msr44PKREKzR4xU9dVUg1q7wJ8Lq95+Giw4pClaEehUq5VXG19+IsS4RBL0sBseepC+y3qfqjcD19DeMnRScjcXRkt6b2u8LJ6NadGo+EGnKZxWw7x/sRqqLMlkzSsu5NbUXlcbHv+uSvPrwCpHBA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4719.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(8676002)(8936002)(52116002)(66556008)(66476007)(6666004)(6506007)(38100700002)(316002)(5660300002)(508600001)(36756003)(956004)(38350700002)(1076003)(2616005)(83380400001)(26005)(6512007)(86362001)(186003)(2906002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?I8n0qZNXl9pKHY2NHTmqsXumO9gAIuUaqBnJHpJRUSOg/bjawZvZLEt9fkQ2?=
 =?us-ascii?Q?A5V/7kN6VfHAV9kQ0FxZCucuyoCYC4u4NLwp6FUIYvbsylBZau0ZVqf3FOYI?=
 =?us-ascii?Q?Z61du+u0mNPyPeDXZKnQwkRDGDuxpq/h94yl2tgO9LHw6jmzh3Ng1/Q2jHX1?=
 =?us-ascii?Q?gpPT7lmWdQqaAGLcMHxCwh1lUzTVWpZy7Mkid6+wru+e2c2syOdVwhdZiR+Q?=
 =?us-ascii?Q?gpeMOqoecAMd5DNAfaovtUWER+GMCrIdUp5i1JTieCshwWIPYnQrDUN/SaQl?=
 =?us-ascii?Q?y73Nf1gw4H0DE/RccO12HmIUMGuV6Ypg3tehF7ndT049tlrfSwHF+LLv6y15?=
 =?us-ascii?Q?PsZ1pjn9V0pD1hOmp8fAg0GzJUOe2cd+JSCUNCHG6hy58yWou3wJKBvMvIu1?=
 =?us-ascii?Q?vQ/G5LssePyBsokrvQLJfkHgkl8m9zrdYQZujvcO5FCBttb4BTVEeOSzHGPl?=
 =?us-ascii?Q?beCG2M3DUuQ1qeluOGNn+0uUc0aU+PRsf5vahIENZqq/+b8+pojpoOTlo1QX?=
 =?us-ascii?Q?C1q/VJUj4nkKQ3TLC4972Hm/UMCz5m0L0NTfhDVkSeUIfstFf9umnr5gD6rc?=
 =?us-ascii?Q?0zj53LUlVyAJJDAwreiJuNXjXwAwrcYFjMGWtHWNF0IfusjbjuTYsjb4HU5Z?=
 =?us-ascii?Q?M104o9RbCKoIcDzBZYYq+eNwUzYkhQogTXNgK7adQiSM90coD/4OF/Kdo7G+?=
 =?us-ascii?Q?j1XyZPXfCJ9cNiSTwUmS5BqN0JUoccVIwfX2UzSKeyNltTev5dvpuPv8lbpj?=
 =?us-ascii?Q?C96mVNB6hsqim3bmjQCXnRcGmYd912IUN0nRjlLXXROeBLzQmkElHbcfbmjZ?=
 =?us-ascii?Q?LRmK8osOLT3ZsZ23d6rVlQD7R3RooMM6bmEkpSNyzVYJr3tyFnVNVxp2S9F+?=
 =?us-ascii?Q?rCO1C+F/AY0mhEQ8MYJWP2IcRAcwXlMT0EAkUTLtm6V9IP2sCF7hHdnaGD0H?=
 =?us-ascii?Q?AAO2s33uaoQNEBemH0tbmYv42LqZ7lrybfxCGGk5nh4KalxDhZnyIfrVocXM?=
 =?us-ascii?Q?tYTTsOOSqzp08EDTJOKeFmY7M7EN4jXR0T9iaV50prHmA754ct44471BXRfa?=
 =?us-ascii?Q?RcKuHAxt/onfzt0py/gXwbTz43axyqy/aIrWKY/6Kb+9b2jiJWJ3/jsYmrkj?=
 =?us-ascii?Q?+5x9myxeECyNBsMK6okYLfkujcC5tUC3FXxbyRzYRDZq3F4m1PmtfSiDxkHM?=
 =?us-ascii?Q?UN8yPMuaJONcim57I7OVFPK7rJg3izZXYJZ2AsJvAfnYBrc+AVydzQ0SGnuI?=
 =?us-ascii?Q?s+dtn74LzR+ZknD64zlOSt9cD/U2B567LW7nUK/806q/RQkuN3Xqgs7IaIOh?=
 =?us-ascii?Q?d2vyA/IuNJIaDEctVRfuuc7h?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c508a9b0-c4b6-4092-9510-08d9956ed608
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4719.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2021 15:15:52.1542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: anda-alexandra.dorneanu@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3312
X-Original-Sender: anda-alexandra.dorneanu@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=QPh3D9Kd;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of
 anda-alexandra.dorneanu@nxp.com designates 40.107.1.73 as permitted sender)
 smtp.mailfrom=anda-alexandra.dorneanu@nxp.com;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=nxp.com
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

Add device tree demo for Linux inmate running on NXP LS1088ARDB platform

Signed-off-by: Anda-Alexandra Dorneanu <anda-alexandra.dorneanu@nxp.com>
---
 configs/arm64/dts/inmate-ls1088a-rdb.dts | 135 +++++++++++++++++++++++
 1 file changed, 135 insertions(+)
 create mode 100644 configs/arm64/dts/inmate-ls1088a-rdb.dts

diff --git a/configs/arm64/dts/inmate-ls1088a-rdb.dts b/configs/arm64/dts/inmate-ls1088a-rdb.dts
new file mode 100644
index 00000000..91fac3f7
--- /dev/null
+++ b/configs/arm64/dts/inmate-ls1088a-rdb.dts
@@ -0,0 +1,135 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Device Tree for inmate cell on NXP LS1088ARDB platform
+ *
+ * Copyright 2021 NXP
+ *
+ * Anda-Alexandra Dorneanu <anda-alexandra.dorneanu@nxp.com>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	compatible = "fsl,ls1088a";
+	model = "LS1088A RDB Board";
+	interrupt-parent = <&gic>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	aliases {
+		serial0 = &duart1;
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu2: cpu@2 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x2>;
+			clocks = <&clockgen 1 0>;
+			cpu-idle-states = <&CPU_PH20>;
+			#cooling-cells = <2>;
+			enable-method = "psci";
+		};
+
+		cpu3: cpu@3 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x3>;
+			clocks = <&clockgen 1 0>;
+			cpu-idle-states = <&CPU_PH20>;
+			#cooling-cells = <2>;
+			enable-method = "psci";
+		};
+	};
+
+	idle-states {
+		entry-method = "psci";
+
+		 CPU_PH20: cpu-ph20 {
+			compatible = "arm,idle-state";
+			idle-state-name = "PH20";
+			arm,psci-suspend-param = <0x0>;
+			entry-latency-us = <1000>;
+			exit-latency-us = <1000>;
+			min-residency-us = <3000>;
+		};
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	sysclk: sysclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+		clock-output-names = "sysclk";
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <1 13 IRQ_TYPE_LEVEL_LOW>,
+			     <1 14 IRQ_TYPE_LEVEL_LOW>,
+			     <1 11 IRQ_TYPE_LEVEL_LOW>,
+			     <1 10 IRQ_TYPE_LEVEL_LOW>;
+	};
+
+	gic: interrupt-controller@6000000 {
+		compatible = "arm,gic-v3";
+		#interrupt-cells = <3>;
+		interrupt-controller;
+		reg = <0x0 0x06000000 0 0x10000>, /* GIC Dist */
+			<0x0 0x06100000 0 0x100000>, /* GICR(RD_base+SGI_base)*/
+			<0x0 0x0c0c0000 0 0x2000>, /* GICC */
+			<0x0 0x0c0d0000 0 0x1000>, /* GICH */
+			<0x0 0x0c0e0000 0 0x20000>; /* GICV */
+		interrupts = <1 9 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	soc: soc {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		clockgen: clocking@1300000 {
+			compatible = "fsl,ls1088a-clockgen";
+			reg = <0x0 0x1300000 0x0 0xa0000>;
+			#clock-cells = <2>;
+			clocks = <&sysclk>;
+		};
+
+		duart1: serial@21c0600 {
+			compatible = "fsl,ns16550", "ns16550a";
+			reg = <0x00 0x21c0600 0x0 0x100>;
+			clocks = <&clockgen 4 1>;
+			status = "okay";
+		};
+	};
+
+	pci@13000000 {
+		compatible = "pci-host-ecam-generic";
+		device_type = "pci";
+		bus-range = <0 0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		#interrupt-cells = <1>;
+		interrupt-map-mask = <0 0 0 7>;
+		interrupt-map = <0 0 0 1 &gic GIC_SPI 49 IRQ_TYPE_EDGE_RISING>,
+			<0 0 0 2 &gic GIC_SPI 50 IRQ_TYPE_EDGE_RISING>,
+			<0 0 0 3 &gic GIC_SPI 51 IRQ_TYPE_EDGE_RISING>,
+			<0 0 0 4 &gic GIC_SPI 56 IRQ_TYPE_EDGE_RISING>;
+		reg = <0x0 0x13000000 0x0 0x100000>;
+		ranges = <0x02000000 0x00 0x10000000 0x0 0x10000000 0x00 0x10000>;
+	};
+
+	psci {
+		compatible = "arm,psci-0.2";
+		method = "smc";
+	};
+};
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20211022151310.6058-2-anda-alexandra.dorneanu%40nxp.com.
