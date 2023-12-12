Return-Path: <jailhouse-dev+bncBCWKP54GYYIRBAUR36VQMGQEJKYM4AQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-vk1-xa3d.google.com (mail-vk1-xa3d.google.com [IPv6:2607:f8b0:4864:20::a3d])
	by mail.lfdr.de (Postfix) with ESMTPS id D68B280E200
	for <lists+jailhouse-dev@lfdr.de>; Tue, 12 Dec 2023 03:42:12 +0100 (CET)
Received: by mail-vk1-xa3d.google.com with SMTP id 71dfb90a1353d-4b2a0f7a423sf1300354e0c.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 11 Dec 2023 18:42:12 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1702348931; cv=pass;
        d=google.com; s=arc-20160816;
        b=Djj3Xo/I+K8p4+rQzeHloywICEnWAtAKC0ETYCgz+ovaw8bo1SDASrUcHuv31F73Fv
         NRPL36FQKFqcCJ/tCrvzaBRCKaL0OvT1SCzd5uwhbpCseIBlBQWk/0unp72Btt1c6YUP
         /1CGDJgfZTHHXgbt7mWvh2BY9/JM5+NDfzvzFo3mbgbC+vp+KSxB2Z2evlLj3KMse236
         HFMGX/Os9S8+NGSCnwdrQQaBwD+HlKbMn+5M1w+/LKazUUjcKX1LECKsqFBYqlfw6vOJ
         KUidRfybp3d70i+MYxouMQFj0C/rBndfLwAkrSiyVgjN1yDIfZ7ynfzMt7WyQypYaBQQ
         Pbhw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :cc:to:from:sender:dkim-signature;
        bh=N+gmrjFT7aVb90nNPKCO8WyDvlHUcYfkcA12mZSpYDs=;
        fh=Jrk2FyvBDGdnrX+clnvk9wz5bMnUSBNTpIhJy4RqJ3Y=;
        b=Bh70rmy8zqPxHTITWZq1Y6vI3Oeel3hBtn7V7o2z2yzjSZfMHMTofqeY41mXvG1Ul+
         ZErZxSLgoIuHoW82URgBFLuTt/6IAhe9L1InZ/K8aOqC1VvP4swEYRgc1WtYFu++OmsV
         7S7iQTyS/9Z2S+fsKIklFOqWYwX0B13Ft8CUq5BKZFVkDKrTv9ACULDFhGiXbs9ctCRk
         E/OJz9r7yf7Ae+FIfyBrGnPHuIcGq8CUeFY08TndSoJIR3COPf6Qt5fpeJkrH8wWlKfN
         I/1mUMDLusRJG/vB4wl8w1vgp6xsvy8g+tV50THuB3/sHr3Z6+MrnMtbR8pLB5XhicMz
         F/Iw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=Pt3xRtG7;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 2a01:111:f403:260e::601 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1702348931; x=1702953731; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:content-language:accept-language
         :message-id:date:thread-index:thread-topic:subject:cc:to:from:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N+gmrjFT7aVb90nNPKCO8WyDvlHUcYfkcA12mZSpYDs=;
        b=bwz4UgIMRSnKOiL1holFAGB/VMtm8Dm5FjIyELXLjtiQJYhAgFjWMmMC54wBuQmROj
         ILdO2v4uD39obgSTMc3n6S17BJMzPuaXd75GuJtYfl0SQr5sR+ZiQMCf9O4Y29BGfyv4
         Q1ZfCmN7uDOllUg00uiKfojM/xk9L1efX+DPsTBMytRNKrfbvQrfB0P4aHseFe9eGgBZ
         uRTsBQgn6uux82bwIdwXCpLjL+s7i4YLAcfojpEBzDeU9PZsEuMh2jQOybnn9GN0ZsbI
         BSEKaufUcP2R7fhpt2gR4VyNAAeZojDNA5RI8vLbP+6aXMVHAXXlHurVb+Ed38tJ04gt
         83iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702348931; x=1702953731;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :content-language:accept-language:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:x-beenthere:x-gm-message-state
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=N+gmrjFT7aVb90nNPKCO8WyDvlHUcYfkcA12mZSpYDs=;
        b=aN/jP0R1pOLRmKilwUZP3BJjkoxfv064q+xEiLBKxRdjVeZfQDEHiX2SajMUffBEwy
         uotauKeYhpUWV/7l101haKpD2uQxeCz8RnGUV7BRkSwFRhEmx6Ias50Fg3aCcGEZJdci
         +wB3p78ImGNNu/jLO+I3VpxYl0AxFNfP5tne+niCc6Wh1zGrSjZwITb9q1YOX5uuKGX7
         VQbpTY32DgmDfrFc1vSoX9luFaLLVyPAP8su+pVW7HRkOpwZBi9gLxQretObGiNZus5p
         rCYvXNOk42NAxjP8P4TWlQKB/EsS/kHD06RcnMBG9c9J4X6CAAeAJhFpUSS3UPJeQn5N
         kh+g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0Yzhtxf9e/8meKV9NvmCGsNJi4KUtYjHudCtDr1K2GSwzmdDZyDw
	26RAMvH76vy5+96vJhUYYo4=
X-Google-Smtp-Source: AGHT+IE3SzK6FVUU+75MAiANYfiVvPcpo7kJG+D8DU42ry4Q44wim7+++VNprDclqAOHqdfMpl3r5A==
X-Received: by 2002:a05:6122:4c18:b0:4b2:c554:fbb8 with SMTP id ff24-20020a0561224c1800b004b2c554fbb8mr3489352vkb.26.1702348931255;
        Mon, 11 Dec 2023 18:42:11 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a0c:d648:0:b0:67a:203f:dbc7 with SMTP id e8-20020a0cd648000000b0067a203fdbc7ls976399qvj.1.-pod-prod-06-us;
 Mon, 11 Dec 2023 18:42:10 -0800 (PST)
X-Received: by 2002:a05:6102:cd2:b0:45d:9a4d:dc1b with SMTP id g18-20020a0561020cd200b0045d9a4ddc1bmr4020382vst.3.1702348930001;
        Mon, 11 Dec 2023 18:42:10 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1702348929; cv=pass;
        d=google.com; s=arc-20160816;
        b=I20D8TK2HTVleLxIzcCKPJDl+b5PpxDmjcrJVivxaBgRk5dzxwguPBW0HjuOsC1n/E
         HoxQz/d7UqYfZwi5ZJrGV6iv3Bi8ijNbmW+k+2NNkPGG+4r1AXTlBTJ0OKpGjLR45xP2
         7q8Y1uL+eGxp2lKMAbzzbOz/7DKD0TwnBrVHeTR015agA3SI0vJdtdubbL/muJpugsI8
         DVGvaIdZ/IzTzAwq7iS45D5gnF41HuDEgCLXBOereRHhRKrn2QesOnArsIakUh8N/Wqv
         6ZV2xFYudzBJgRQDhXNDzogfv0TnoL4j1S5ciKk2ulRxZEijWRksr5GZrI5ytRmX+8RT
         6obQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :cc:to:from:dkim-signature;
        bh=c2405hZZr2P9+ictIArUhQaexB/Hj9RJdZVyTRW7STE=;
        fh=Jrk2FyvBDGdnrX+clnvk9wz5bMnUSBNTpIhJy4RqJ3Y=;
        b=tZQwfuzcD/VyYxbbb1uQHs2Y0wtEwHfnPDcnDYz1kgAN4k56WvkXTVMq9eSInS/ha+
         HymwTMzZ6oBBK2NDHdq8Poe9hEEp4etRay7oGcNxsx/NxS1GjralyYcjZSRz3Wc2nwYA
         xMikI78sMZ27y3GwCdRTgTfXe+FVF77p6NtJicjgUg+6OocoAsYLk21++70xBVjdrVKq
         xQS9hafmkYHo0N4AXnuiFXj/qnGMT++UXs/5xWGUeTuMLHWHhVhZA0TqMDA9ES6Rkg5Q
         F58tJNEC4iZ41Uki0ATF9IbF1Z3TIsfQ0xBo+v+3OsLNsZA1AF2JyFz16nSBDoBTnc6U
         6foA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=Pt3xRtG7;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 2a01:111:f403:260e::601 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on20601.outbound.protection.outlook.com. [2a01:111:f403:260e::601])
        by gmr-mx.google.com with ESMTPS id az23-20020a056130039700b007c56697eaefsi937465uab.1.2023.12.11.18.42.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Dec 2023 18:42:09 -0800 (PST)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 2a01:111:f403:260e::601 as permitted sender) client-ip=2a01:111:f403:260e::601;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gHs9hWOyt2lIXFOv3g2D927hKdu3nMr4lmutGaCt1DsugIgLqVFcbKBoZGrD5IADxrO2VUsFnc+n67yWMt94Y4TRo0E4YgWJTOmBDUDZRSbc0rh5xWgViiKdKPiyMWeRHNVG4BdY8V/dEcDt+9MqwLHsjIU/E0SCV5Wqi1n+DgMurKHh+ZowC5j/Be/WFIxnNHc+MvDxjvtTkhsPZSkyFf6JUtUM/sSBwfptiDTU3CZc2xP3lbY9NeLCNC1bXMsTW087PdsBvAKMAn3L7M40ZHB5LJQRZxanuW0kg9qqdTYyezdkgTpJw+Yb6dfjrWxgzTMLA3B18VRyJQjNlZCo5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c2405hZZr2P9+ictIArUhQaexB/Hj9RJdZVyTRW7STE=;
 b=hODvPkhNGsLa71nAdGeNDqNzZ6kHiZx51luXe4FChr886mKDdDt9Us+nWMa13HLMHJ3vLqlmgelIitAErmbgb8pP/YQBs7YGXa4SVUHaKvoH9tFbplr+gbjxfoAa9jrb8bSNjIWSgTLhzny8AEjA6rvYbDlo1YACSpTOItSZ/4RKvhdSiSypIAQnIOAO7ScC9qJdfSCa/31CisY9kjyZRMl1/CIC9n9VWep+rfruVSOL8qXWrRsJ6YzofSNZxNw6kjUFln5Zcc7NjA2aFr2exZI5WJeSbsqAGuIcKzdkhbZOIzS2ru41Yva8wBLaBwxKMLMmsMBaNdIfBhRJX3Cp4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by AS8PR04MB7943.eurprd04.prod.outlook.com (2603:10a6:20b:2a1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Tue, 12 Dec
 2023 02:42:07 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::ff06:bbb2:c068:5fb3]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::ff06:bbb2:c068:5fb3%7]) with mapi id 15.20.7046.015; Tue, 12 Dec 2023
 02:42:07 +0000
From: Peng Fan <peng.fan@nxp.com>
To: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
	"mark.rutland@arm.com" <mark.rutland@arm.com>, Jan Kiszka
	<jan.kiszka@siemens.com>
CC: Peng Fan <peng.fan@nxp.com>
Subject: str     wzr, [x1, #16]! triggers EL2 unhandled data abort
Thread-Topic: str     wzr, [x1, #16]! triggers EL2 unhandled data abort
Thread-Index: AdospGOy+zvECLGeToGWrLF6L62+QQ==
Date: Tue, 12 Dec 2023 02:42:07 +0000
Message-ID: <DU0PR04MB9417D1CFA35D02279D40EA6A888EA@DU0PR04MB9417.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9417:EE_|AS8PR04MB7943:EE_
x-ms-office365-filtering-correlation-id: d807b612-1425-493c-e9c4-08dbfabbeec6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eUmuhmGwTNDy4eESe4TkMSlxRsvJAkd2Xz/4gRO7riBxILOcEuaJE7DrbGQHsdCVCusBLHAmFVGligO9SztgVg5/ljyLD5NBb1QnNMsOaFykeljpFzVV8vSSPe8fSrOmELr8K61iEiWYBHJkss6Zm01RMW0XVAWBGh+rZmakOYkOF4sfBVqOW+DUhRTK8CAZx29gyxxIUx0l4BqYoOzUYxeZvGlTJEWf38oYdhq8DU1TvxfWyq3mqUcDnIT4gxa8JtsNw7mJVRekdIE2OvPOs9TBS035TTdHsoZfXxTeME2jEhN9+xR51CNPKvn/L375mTI49FXcmEop1ID0WzwcN/vDDwmf6pjH6H41myEC1CFnymSr/z5+8kfQUozgYSD0h/+kpIS1y6xZSfCTxw3CVSrszYmqksle9Pk83brlljonJJzAwS42iObNyUOA4EA6dPFPanZM5pYUXxdkkzUx3eNqv5OSDpYfI1roB1H03gmH3h6n8iP7Damwa7cD+KnyhJOVHl4t5XDIUp7xNNdvYsCWceGlRw8CjCQhOUMUDTN9GA1efoDS+iWRkCpBoYJgS3fl/Ml5bjSXfdAnyJG12MqNMIRjn7pCGcfJhN9RRvx9BYnFeh5uirv+AtnnMx3M
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(346002)(396003)(366004)(136003)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(5660300002)(26005)(71200400001)(6506007)(7696005)(9686003)(52536014)(41300700001)(478600001)(2906002)(4326008)(8676002)(8936002)(66946007)(76116006)(66556008)(44832011)(66476007)(64756008)(316002)(66446008)(110136005)(33656002)(122000001)(86362001)(38100700002)(558084003)(38070700009)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Uep8wj/jckP01bhcAm1MKfDlNQi8SxvH87ehF2ol/qsD/nGK5d4IGdSJK8SJ?=
 =?us-ascii?Q?3wG3RozqMaaLUnuyDLjLOUvTbc2XaVI2/fUM6atEUcGrwtlF3g+jRlK6nCtP?=
 =?us-ascii?Q?gA53FYAvpgMeFV7T2ClsIAUrCbsMAe5IHc4+pJdaK4vDQ9zj8XgXbGjXo0Fp?=
 =?us-ascii?Q?QbkF8TcO+SnpWyqTMdhog7NUal7QBrcaE4ITOnd/gZJALA87tolJn9JUukFO?=
 =?us-ascii?Q?xCOYCZNQ8qURs32lOBUuRFej+VqJQLjb47YW6xpXKVQsmRERnPnf7GQcdw5x?=
 =?us-ascii?Q?4tCsrHbSHEtX5ygahU5Uhbm5QvB7CA6spNPYGv6JgmTGRlgy/Bo9JZAL6+HH?=
 =?us-ascii?Q?8HLdDw9DLqsQ9oNlgjdRknNLg/atptPioYbh1x94eJbWQ/M3ENdm/Y67UG+d?=
 =?us-ascii?Q?uWDojGmgEjveHPeO3406S8an1tpL2jHsvxonNvPXiTS1ysNngQhyxifoD9yd?=
 =?us-ascii?Q?z9XRNHVZP1HoAdIiFLjWJaxI9yBvH0kIRJWe7d/1+unOkg+FENftDbFXDxik?=
 =?us-ascii?Q?d9/a97K/vfNjmGrT8Lw/pH/dKqi5Y45LDV0M5XAgCixjQwc7rrV69ri34dwV?=
 =?us-ascii?Q?eOT6EpI0Ucw6XiQ3GQmJGYzCnL5PpXcMf1P+AoyMeoZiJF1XPVigUeS3aJ0D?=
 =?us-ascii?Q?f253H/W6xCzzS5MNufdMNr06qO050Kha458zchcX+P3ap+jHGFGrPJG6glOf?=
 =?us-ascii?Q?rv30WPB+P581C7zUT0NWyHdSh2lY4wUlVsQuC/jAsoWto3//S9UwJk7xQjF1?=
 =?us-ascii?Q?aodgNueHxSaBpjlGDrvoLqgLY9EO+FLEkgKpxFmGRQG3dFmqOKg+YKPDqG4E?=
 =?us-ascii?Q?4Xp5vLwL3NL+z7csjPKLRcu6noDuianIg4q0e+tR2KUQmQAw00Q7dKth78B7?=
 =?us-ascii?Q?Mj8TOWs1PufJEpT9vi/54X+IPzWtkXrdRoWd8yhOGUbsBPOvErVbCm8C0zHa?=
 =?us-ascii?Q?9QfQy1IOS/1meundAg5T5lv7bwL2ecB49qF1yv8ejTK2RHtiaKjz2z9US4yF?=
 =?us-ascii?Q?QMT+/g7DrGKChpSOYnD7awZdU0TS6yOb88Ffgm8OtpMdvyJiUy8cj/O2lHuo?=
 =?us-ascii?Q?tCxATm9oD2UOSYCVSMneWzIPZC+/LW8NUqG+IEsW1WDSE5q8U9Zq84MGLpVV?=
 =?us-ascii?Q?y0l7sXEo1TooQnBpv+dIGpJQgDrG8stw0msm1Zi6kjWguBZvCJnOwsL1FQhs?=
 =?us-ascii?Q?S3amuoODoBOkLI7eOQNCMa/GGCaqty0xgVX7KifdpETU8bV5GU9iQj285XHP?=
 =?us-ascii?Q?f9W4cJENzyt6A+6H/CExBFClNZrRWyWUaY0Mk3QXiou3XhvOiESmN2M6kSRv?=
 =?us-ascii?Q?2xEkjf6PuKrrwRFnDzTfqjRPzcvDGvgfgJCWg0D9SfzNf1aCjl2t4Q7N35xZ?=
 =?us-ascii?Q?yNL4QCImiL2C7F3hzpjIQQvwwpNSDn+bWlefh+HYjSMeW8rg4XmY2I34XJhm?=
 =?us-ascii?Q?GgqnqbBxZQPcyfl2wSL22BX2LpJmxM/bneOhxG70zCm1RHQyslrTperOSH8L?=
 =?us-ascii?Q?VWxEEV6f0JhCUuN2qNk8vslI/FZz0brFHMCR8SjXW+TA2eSy1Qt/Wzs0i9QC?=
 =?us-ascii?Q?3nJRPpdviUGA6rCAXNY=3D?=
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d807b612-1425-493c-e9c4-08dbfabbeec6
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2023 02:42:07.4288
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8ViSIWWfHtTT+sAYLYhln5Ba05jTVklhpJ25YXCPA4H+NCe687Yp2+dGt3jYseTW5hsu45H+CxdK5iCucLFmmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7943
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=Pt3xRtG7;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 2a01:111:f403:260e::601 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

Hi All,


I am running jailhouse on i.MX9 Cortex-A55, and meet an issue.
" str     wzr, [x1, #16]! " this instruction in EL0 triggers unhanlded
Data abort in EL2, with ISS is data abort, ISV is 0.

I am not sure why this instruction trigger DC with ISV 0.
Any ideas are appreciated.

Thanks,
Peng.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/DU0PR04MB9417D1CFA35D02279D40EA6A888EA%40DU0PR04MB9417.eurprd04.prod.outlook.com.
