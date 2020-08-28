Return-Path: <jailhouse-dev+bncBDEN32754MOBB4UHUP5AKGQEEDHLF4A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x539.google.com (mail-ed1-x539.google.com [IPv6:2a00:1450:4864:20::539])
	by mail.lfdr.de (Postfix) with ESMTPS id 4652F2556AE
	for <lists+jailhouse-dev@lfdr.de>; Fri, 28 Aug 2020 10:44:35 +0200 (CEST)
Received: by mail-ed1-x539.google.com with SMTP id dj21sf78148edb.2
        for <lists+jailhouse-dev@lfdr.de>; Fri, 28 Aug 2020 01:44:35 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1598604275; cv=pass;
        d=google.com; s=arc-20160816;
        b=eKyUnaXUDzKZgDpJxfLaRCrWGoZiUPdW2Be33XUKsFSmUdWz82dp5NMdvNanx472Zf
         BWc9rScTK9upXDEfCQuEkO9nYFBLXV50dFbAbeZUMrSbIIDnqjM6BpJJVkVHkXMVUI+H
         wg8Riqh4ghajSbA1CoXBuqPt7uaLhbqr0/LTruRBoYxGVLrW2x7maX4uY0KILdBN5dM9
         HmKuD+wK8jlhSFZH+VQd2TwQk3vxVVJAUDU/F50eiXN1gIhTHkiQeDM3+wKMb9sMAjFP
         bNoHet6+rkPAxI9LC3KTp2FcUnRcL6mbH3Rn8DysyX5ZBGS3KMWvJvZYqJXbVxBEhP83
         nDTg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=GT292k87tU/OdaJ6ejwccl0XsiKPlUum/lqu6gqDmDM=;
        b=W8+poKnt32Fi+iQ+aWJ+UPxeXoq2OGrdpaBNhZ1I2XO4nJkKBF/Tmc/7ltm91WiH02
         E7zwRaam6mGG6WqIGGvZfadJHdHmcT4emlgj6ecYNGtVpeyMcnA0TqMsPbu4htv6dEa7
         BjfoY6EglWRzsTgqRnCbxOLah1ZOEDCEZLvWmK1f5Diqs4qBFW8a+jC8NFkHddWz0orZ
         i67jX1EG0UuhSpIsx84JVp1pauq3ylMfl6k5tz+B1dO6BN389uk/prCmivShhCSJ9rZw
         PXj/h8nEJXQI60S/nDiHalZuUHfKHtV6JarTjqsHqoGX98S1eOajOzr9HtpJn5RiIvO5
         XzmA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=sv362hc8;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.0.56 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=GT292k87tU/OdaJ6ejwccl0XsiKPlUum/lqu6gqDmDM=;
        b=Uhlo/Ir6h+yqMDmV1i5b/acZm2QQW6uAFdVk4c3r7juxZr00+R+Fh8usKhxHo8Wa5B
         WK7Kl9pzkKNBqvXvHVEau6h/bBIBuT0wirWSy+Xb9IkbHkAWtnr0c9r4o/+9cGGqLDto
         elAizlyBSvzRqub1bhafW/oVSLCmMRLjiFvFnFCZ4w6iVtWbuC1QJhhktnJb215iDWjz
         7lONU0ogA18pus1MB1N1pLzY3lru2MXqdABPsTf/P9okXfxWyjGeZlr8Big16PHOd7a/
         +DHXeXQVjqhw0rGF8aPVd3t89LD6P3xSJV1qHNJdpZbCAdNRnojjAYHk1LGiGzwN9lce
         lTKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=GT292k87tU/OdaJ6ejwccl0XsiKPlUum/lqu6gqDmDM=;
        b=qRxV09/7D8ZASnY4dpm6yTJu1OIYEmBuYwoH1XBhwbzd6T06a+LYC+L2l6y/8+IvsQ
         mN0UzvB730zhZfQN9Jgmu/AgzeCtLXhFF64qoq8RYTFP2PsM4GyHaJh/fYfw9gvli/Cc
         e2Wq/xoEyl/H756cRQJyznT7PoU+iS2gU+rcQ34XE9fnBPBWF4I0zFAIMPkVDLMuUg0m
         8oB5eFNT6JkfDCbeXCwjtPgjxRqud9Wza1h9gziV0a4wCKZr51/w3tXc07zcchdJKe/9
         tr4443xSvIH+Hj+xR5qiQ4+wH8VQU5eQchV0QmgOHtqmJ6KanxJFIWzeRW7waHalgnX4
         bIlQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533xv+B2SKg9itwYFx+SPII+t/Lc9nr1FIKYBZUdTwbLfiXxNG1s
	ZNw7W1EsIaR4MNmk58j0eXI=
X-Google-Smtp-Source: ABdhPJwiRygDh9CEuHFrrgjqGaZaU1OZj8d7h+cEvw6q739w+Ixx63Gu5zYlu8D7Gk7m1zr0zDLnlA==
X-Received: by 2002:a17:906:fcad:: with SMTP id qw13mr702724ejb.389.1598604274774;
        Fri, 28 Aug 2020 01:44:34 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:907:7211:: with SMTP id dr17ls262933ejc.4.gmail; Fri, 28
 Aug 2020 01:44:33 -0700 (PDT)
X-Received: by 2002:a17:906:600f:: with SMTP id o15mr715073ejj.41.1598604273865;
        Fri, 28 Aug 2020 01:44:33 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1598604273; cv=pass;
        d=google.com; s=arc-20160816;
        b=dT/AZ3av6z5p5YreEVrwLSQ2O8UHxYZtJOfpSB4zUTzHtwi69EpzEZx1+CZ1Ts57ax
         7rzzLZ5mVeQyum7zBuP2rtykgrcf7oIDGZeFS3XTrY5yrJXpIG7S4o+TJkZcGi8HzetT
         WxnT1DfPLZAHvCDuF+uz2l4t+opi72uhMtoxSCaGJeRgdmXYeh7oDADTQpnLeAy4x6p3
         3/PNqGUnG6ZsZqbK/CtKSXmBRXKiX0utzRjtBp1UTiZ8cHITWR+1C7vmKkPpu6LyQn4+
         okhWjDH/jOYlp4JPRXw7nfF2e4Zt2U30U1j2yKoWGqY8dAX8jnrEn6p2xksE1ipMeaBE
         c+jQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=xRUvQjwzX3VDsajYhgF0PM3MgGgOy6ryc+xHNHWwDAs=;
        b=RmziA6Affh6LQ0x+/Tn2mM79U4AU7LiTXcnfYJwlAEYyWtJk2VCJ+8kLB5evxHbr1F
         H2U2GhEKwGlzo2jc57pE7N91dE3oN+OJ+gL3E/AhxJQF0UcEuagnFZKNLM1Cto1ki55j
         aTMygURZ9tPPE7g06bjG/9e7lc2AftKkNpsyOnP4ZWecGItH2WqZ5HHi1Y0IcXjjhfAZ
         TNzgcMGqNy03eGH7oxZe5HWyLAbTReeVSma/2xYumaL5FGYTLIc0q5WSyDmJb7Avkzhp
         6vLzFlO9hjXLVXBqpUkjmCueIA1657CcriA4g4xpecR+SwQNSw32gCtMai8NIUc5KIKi
         6EwQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=sv362hc8;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.0.56 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (mail-eopbgr00056.outbound.protection.outlook.com. [40.107.0.56])
        by gmr-mx.google.com with ESMTPS id m1si17703edq.4.2020.08.28.01.44.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 28 Aug 2020 01:44:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of alice.guo@nxp.com designates 40.107.0.56 as permitted sender) client-ip=40.107.0.56;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A49FmbGDm3be7hV11D613S/cd5v7DSvDW5jfWohALmdTJdDSqhA5b0hr5w+xkNtYLLgToeOi6M17XJ2vMOvGHctz/Rxk398Mj/KgoonjKvR07c2+LU0siMAIq0SSDZ5hNpuITQBmJcZQ+Y3vLBqV9lXJqQH6zu1ySx//D9Hv6tIuD2swnwAzvYOzHW57pr6N8S33V/Rors8I5S45zwzwPxmsIQnGtxn6iP/7aSRhxroQD460gTJiFpTGOBu6kt4gj7A5aM04hny7qPQzFOfF2zBg/gCoPzWFIzJ30l3E84XjCROqB9iIhzwCQ0Ysygr8/5qHTMtfASXUCqKUsWPVCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xRUvQjwzX3VDsajYhgF0PM3MgGgOy6ryc+xHNHWwDAs=;
 b=mdzQd/cMP6Uc40HAIOYfRj6bJav9zP9uLVmXaIlz44Lid9gXkLhNNtLMONnDxd+ZU3V4sH3VradiVEsKL0GbC+x8gcCaxdppT7FiFIoq9stqNQOMoA/hpxT326TeEYJKoouzilGKuGkmNcXO1kQSj1OoWNVzI5TKrppP6EPaOqkw3NYB9PsBQu2yGodS6wASXSMjB4GAVaeAhb7QijeR3C7AW0vrgsSu8sD2Fl/i83qv0cMXajYmcSreUWHemKBsCrwjo7gsOHsBr1sbsfwIPxKSKx7w+uk2H15oH0jsA7WcQBQVnyQFJ51CJDhbcaSVs8gRFt3JcPT5dFt6Fp8+sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com (2603:10a6:10:127::9)
 by DB8PR04MB6651.eurprd04.prod.outlook.com (2603:10a6:10:10e::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.21; Fri, 28 Aug
 2020 08:44:32 +0000
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::5042:d7a1:10c0:c40e]) by DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::5042:d7a1:10c0:c40e%6]) with mapi id 15.20.3305.032; Fri, 28 Aug 2020
 08:44:32 +0000
From: Alice Guo <alice.guo@nxp.com>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Cc: peng.fan@nxp.com,
	Alice Guo <alice.guo@nxp.com>
Subject: [PATCH V2 3/4] arm64: support SMMU-v2
Date: Fri, 28 Aug 2020 16:44:24 +0800
Message-Id: <20200828084425.21282-3-alice.guo@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200828084425.21282-1-alice.guo@nxp.com>
References: <20200828084425.21282-1-alice.guo@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: SG2PR01CA0157.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::13) To DB8PR04MB7065.eurprd04.prod.outlook.com
 (2603:10a6:10:127::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nxf55104-OptiPlex-7060.ap.freescale.net (119.31.174.71) by SG2PR01CA0157.apcprd01.prod.exchangelabs.com (2603:1096:4:28::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend Transport; Fri, 28 Aug 2020 08:44:30 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d51dc7df-a480-4c89-e7d7-08d84b2e951e
X-MS-TrafficTypeDiagnostic: DB8PR04MB6651:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB8PR04MB6651DFFEFAB13B08B4874586E2520@DB8PR04MB6651.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9GNzpaI2jZ7sNGveqgGSqukw6Yn/BUqXfvLHJJFQmHLhVhcbVI8xlE02ipKfSpMi/HMrLIzKfXchGzgFkXgwAgznRc+s28tO391wqGfuAaogAIVU3J0mJysC7KsG193F2yNo2zD+oF+mg2W2tfDFRvvIre09NrfG8ce3A9nNL/+frtPSS/gL02WqwJgwbi8NiNuAnkTqF2iMlkuGG17sO4qA8C6GUwPBGkLzqsTjiK02XBGnM9lQ10BX4ZbBFO6DB/wDqZy/XLZ8Ftie/0p6wQgzUYJzEQSe/EUs1h4YxpJ2zDSIJvJ34nt/hjn/l97Kq8NugjW/VlN9O1F53llSCvZceMpHGdLgIrCaq2ts62F/XWKRFnUwP/sW23BeXoMh
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB7065.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(346002)(39860400002)(376002)(136003)(8936002)(2616005)(316002)(4326008)(36756003)(52116002)(956004)(26005)(16526019)(6506007)(6512007)(2906002)(6486002)(186003)(44832011)(6666004)(8676002)(66556008)(83380400001)(86362001)(66946007)(478600001)(30864003)(5660300002)(1076003)(66476007)(2004002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: TO6RtxkdA1Io6lLJfqjbi5BX2dBNu0Xn9EHWWxzQC/CX4fMUFsBWCSpH2U21OPV7h0OL4Bh7/7Kic1Ndkw3VTjZPOvdEmoagpSYLToBQ3hkzHgumbZD5pBh6mpw/Lqx0Td0sMThzaRDhNl4+luKOpph2EW6e3//Suig3AK47a17NgV0MqmU5gl0ja0p3ePC3BaWPD2+gg4TP2EVK+oswmgXw2874jj3cfIzhkD+9A0qJVF7K4+yZu97W5+c0kVS88mQiHGmvPFKiDYyt/CFOCGecIqyOS5ElqUa33mGg3O1UYd09vaBdxRyCOOB3H/adDVKYbBIauBWDf6rX1pmNM3Z2Cp+l61LOWYAHdqxl1of+B5aGEuZ9NB06lWj+F+Ojck1EdfAqrUzUwtbRAzrzmHSpHRDmflXfCYIl2GMlOW8nVGHu8VmAKWW56rysgac/cfWgKNwZpRjGwFu2AyiIxVRQT16P5/a//hGKzSKp7dz0+szBd5n0NbttQjmFV2yVuZOTYBWpdYE5dceSBNogml7fD92KZNPA4D3Q8brMMghuoAsb+JaN0iSXnMd24LBQDLNNlLwfpnE2gIISIsiQRRkwSXTwnxoJIwxiiJ96N05eEUdjTt8VdttLG5mky0vlS+L1HWkvgrqvk+Cy4lQhHw==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d51dc7df-a480-4c89-e7d7-08d84b2e951e
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7065.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2020 08:44:31.9765
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vldpQrMtbeNlefcl4id4XNTfNjlmP7fLlAXJCxfdmTI4slkLn88rNEgC6Ji6iT7ypM392wYfgvHCsMsgcF3I5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6651
X-Original-Sender: alice.guo@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=sv362hc8;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of alice.guo@nxp.com
 designates 40.107.0.56 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
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

Enable SMMU for processors which use MMU-500 to implement the ARM SMMU
architecture v2.

Signed-off-by: Alice Guo <alice.guo@nxp.com>
---
 hypervisor/arch/arm64/Kbuild                |    1 +
 hypervisor/arch/arm64/include/asm/sysregs.h |    7 +
 hypervisor/arch/arm64/smmu.c                | 1092 +++++++++++++++++++
 include/jailhouse/cell-config.h             |   15 +
 include/jailhouse/sizes.h                   |   47 +
 5 files changed, 1162 insertions(+)
 create mode 100644 hypervisor/arch/arm64/smmu.c
 create mode 100644 include/jailhouse/sizes.h

diff --git a/hypervisor/arch/arm64/Kbuild b/hypervisor/arch/arm64/Kbuild
index c34b0f32..e87c6e53 100644
--- a/hypervisor/arch/arm64/Kbuild
+++ b/hypervisor/arch/arm64/Kbuild
@@ -22,3 +22,4 @@ always := lib.a
 lib-y := $(common-objs-y)
 lib-y += entry.o setup.o control.o mmio.o paging.o caches.o traps.o
 lib-y += iommu.o smmu-v3.o ti-pvu.o
+lib-y += smmu.o
diff --git a/hypervisor/arch/arm64/include/asm/sysregs.h b/hypervisor/arch/arm64/include/asm/sysregs.h
index 5acd6d12..32391937 100644
--- a/hypervisor/arch/arm64/include/asm/sysregs.h
+++ b/hypervisor/arch/arm64/include/asm/sysregs.h
@@ -182,4 +182,11 @@
 
 #endif /* __ASSEMBLY__ */
 
+/* Context Bank Index */
+#define S2CR_CBNDX(s2cr)		SET_FIELD((s2cr), 7, 0)
+/*  Register type */
+#define S2CR_TYPE(s2cr)			SET_FIELD((s2cr), 17, 16)
+/* Privileged Attribute Configuration */
+#define S2CR_PRIVCFG(s2cr)		SET_FIELD((s2cr), 25, 24)
+
 #endif
diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
new file mode 100644
index 00000000..39c0cd35
--- /dev/null
+++ b/hypervisor/arch/arm64/smmu.c
@@ -0,0 +1,1092 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright 2018-2020 NXP
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ *
+ * Modified from Linux smmu.c
+ */
+
+#include <jailhouse/control.h>
+#include <jailhouse/ivshmem.h>
+#include <jailhouse/mmio.h>
+#include <jailhouse/paging.h>
+#include <jailhouse/pci.h>
+#include <jailhouse/printk.h>
+#include <jailhouse/sizes.h>
+#include <jailhouse/string.h>
+#include <jailhouse/unit.h>
+#include <asm/iommu.h>
+#include <asm/spinlock.h>
+#include <asm/sysregs.h>
+#include <asm/timing.h>
+#include <jailhouse/cell-config.h>
+
+#define ARM_32_LPAE_TCR_EAE		(1 << 31)
+#define ARM_64_LPAE_S2_TCR_RES1		(1 << 31)
+
+#define ARM_LPAE_TCR_EPD1		(1 << 23)
+
+#define ARM_LPAE_TCR_TG0_4K		(0 << 14)
+#define ARM_LPAE_TCR_TG0_64K		(1 << 14)
+#define ARM_LPAE_TCR_TG0_16K		(2 << 14)
+
+#define ARM_LPAE_TCR_SH0_SHIFT		12
+#define ARM_LPAE_TCR_SH0_MASK		0x3
+#define ARM_LPAE_TCR_SH_NS		0
+#define ARM_LPAE_TCR_SH_OS		2
+#define ARM_LPAE_TCR_SH_IS		3
+
+#define ARM_LPAE_TCR_ORGN0_SHIFT	10
+#define ARM_LPAE_TCR_IRGN0_SHIFT	8
+#define ARM_LPAE_TCR_RGN_MASK		0x3
+#define ARM_LPAE_TCR_RGN_NC		0
+#define ARM_LPAE_TCR_RGN_WBWA		1
+#define ARM_LPAE_TCR_RGN_WT		2
+#define ARM_LPAE_TCR_RGN_WB		3
+
+#define ARM_LPAE_TCR_SL0_SHIFT		6
+#define ARM_LPAE_TCR_SL0_MASK		0x3
+#define ARM_LPAE_TCR_SL0_LVL_2		0
+#define ARM_LPAE_TCR_SL0_LVL_1		1
+
+#define ARM_LPAE_TCR_T0SZ_SHIFT		0
+#define ARM_LPAE_TCR_SZ_MASK		0xf
+
+#define ARM_LPAE_TCR_PS_SHIFT		16
+#define ARM_LPAE_TCR_PS_MASK		0x7
+
+#define ARM_LPAE_TCR_IPS_SHIFT		32
+#define ARM_LPAE_TCR_IPS_MASK		0x7
+
+#define ARM_LPAE_TCR_PS_32_BIT		0x0ULL
+#define ARM_LPAE_TCR_PS_36_BIT		0x1ULL
+#define ARM_LPAE_TCR_PS_40_BIT		0x2ULL
+#define ARM_LPAE_TCR_PS_42_BIT		0x3ULL
+#define ARM_LPAE_TCR_PS_44_BIT		0x4ULL
+#define ARM_LPAE_TCR_PS_48_BIT		0x5ULL
+#define ARM_LPAE_TCR_PS_52_BIT		0x6ULL
+#define ARM_MMU500_ACTLR_CPRE		(1 << 1)
+
+#define ARM_MMU500_ACR_CACHE_LOCK	(1 << 26)
+#define ARM_MMU500_ACR_S2CRB_TLBEN	(1 << 10)
+#define ARM_MMU500_ACR_SMTNMB_TLBEN	(1 << 8)
+
+#define TLB_LOOP_TIMEOUT		1000000	/* 1s! */
+#define TLB_SPIN_COUNT			10
+
+/* Maximum number of context banks per SMMU */
+#define ARM_SMMU_MAX_CBS		128
+
+/* SMMU global address space */
+#define ARM_SMMU_GR0(smmu)		((smmu)->base)
+#define ARM_SMMU_GR1(smmu)		((smmu)->base + (1 << (smmu)->pgshift))
+
+/*
+ * SMMU global address space with conditional offset to access secure
+ * aliases of non-secure registers (e.g. nsCR0: 0x400, nsGFSR: 0x448,
+ * nsGFSYNR0: 0x450)
+ */
+#define ARM_SMMU_GR0_NS(smmu)						\
+	((smmu)->base +							\
+		((smmu->options & ARM_SMMU_OPT_SECURE_CFG_ACCESS)	\
+			? 0x400 : 0))
+
+/* Translation context bank */
+#define ARM_SMMU_CB(smmu, n)	((smmu)->cb_base + ((n) << (smmu)->pgshift))
+
+#define MSI_IOVA_BASE			0x8000000
+#define MSI_IOVA_LENGTH			0x100000
+
+/* Configuration registers */
+#define ARM_SMMU_GR0_sCR0		0x0
+#define sCR0_CLIENTPD			(1 << 0)
+#define sCR0_GFRE			(1 << 1)
+#define sCR0_GFIE			(1 << 2)
+#define sCR0_EXIDENABLE			(1 << 3)
+#define sCR0_GCFGFRE			(1 << 4)
+#define sCR0_GCFGFIE			(1 << 5)
+#define sCR0_USFCFG			(1 << 10)
+#define sCR0_VMIDPNE			(1 << 11)
+#define sCR0_PTM			(1 << 12)
+#define sCR0_FB				(1 << 13)
+#define sCR0_VMID16EN			(1 << 31)
+#define sCR0_BSU_SHIFT			14
+#define sCR0_BSU_MASK			0x3
+
+/* Auxiliary Configuration register */
+#define ARM_SMMU_GR0_sACR		0x10
+
+/* Identification registers */
+#define ARM_SMMU_GR0_ID0		0x20
+#define ARM_SMMU_GR0_ID1		0x24
+#define ARM_SMMU_GR0_ID2		0x28
+#define ARM_SMMU_GR0_ID7		0x3c
+#define ARM_SMMU_GR0_sGFSR		0x48
+
+#define ID0_S1TS			(1 << 30)
+#define ID0_S2TS			(1 << 29)
+#define ID0_NTS				(1 << 28)
+#define ID0_SMS				(1 << 27)
+#define ID0_PTFS_NO_AARCH32		(1 << 25)
+#define ID0_PTFS_NO_AARCH32S		(1 << 24)
+#define ID0_CTTW			(1 << 14)
+#define ID0_NUMSIDB_SHIFT		9
+#define ID0_NUMSIDB_MASK		0xf
+#define ID0_EXIDS			(1 << 8)
+#define ID0_NUMSMRG_SHIFT		0
+#define ID0_NUMSMRG_MASK		0xff
+
+#define ID1_PAGESIZE			(1 << 31)
+#define ID1_NUMPAGENDXB_SHIFT		28
+#define ID1_NUMPAGENDXB_MASK		7
+#define ID1_NUMS2CB_SHIFT		16
+#define ID1_NUMS2CB_MASK		0xff
+#define ID1_NUMCB_SHIFT			0
+#define ID1_NUMCB_MASK			0xff
+
+#define ID2_OAS_SHIFT			4
+#define ID2_OAS_MASK			0xf
+#define ID2_IAS_SHIFT			0
+#define ID2_IAS_MASK			0xf
+#define ID2_UBS_SHIFT			8
+#define ID2_UBS_MASK			0xf
+#define ID2_PTFS_4K			(1 << 12)
+#define ID2_PTFS_16K			(1 << 13)
+#define ID2_PTFS_64K			(1 << 14)
+#define ID2_VMID16			(1 << 15)
+
+#define ID7_MAJOR_SHIFT			4
+#define ID7_MAJOR_MASK			0xf
+
+/* Global TLB invalidation */
+#define ARM_SMMU_GR0_TLBIALLNSNH	0x68
+#define ARM_SMMU_GR0_TLBIALLH		0x6c
+#define ARM_SMMU_GR0_sTLBGSYNC		0x70
+#define ARM_SMMU_GR0_sTLBGSTATUS	0x74
+#define sTLBGSTATUS_GSACTIVE		(1 << 0)
+
+/* Stream mapping registers */
+#define ARM_SMMU_GR0_SMR(n)		(0x800 + ((n) << 2))
+#define SMR_VALID			(1 << 31)
+#define SMR_MASK_SHIFT			16
+#define SMR_ID_SHIFT			0
+
+#define ARM_SMMU_GR0_S2CR(n)		(0xc00 + ((n) << 2))
+#define S2CR_CBNDX_SHIFT		0
+#define S2CR_CBNDX_MASK			0xff
+#define S2CR_EXIDVALID			(1 << 10)
+#define S2CR_TYPE_SHIFT			16
+#define S2CR_TYPE_MASK			0x3
+enum arm_smmu_s2cr_type {
+	S2CR_TYPE_TRANS,
+	S2CR_TYPE_BYPASS,
+	S2CR_TYPE_FAULT,
+};
+
+#define S2CR_PRIVCFG_SHIFT		24
+#define S2CR_PRIVCFG_MASK		0x3
+enum arm_smmu_s2cr_privcfg {
+	S2CR_PRIVCFG_DEFAULT,
+	S2CR_PRIVCFG_DIPAN,
+	S2CR_PRIVCFG_UNPRIV,
+	S2CR_PRIVCFG_PRIV,
+};
+
+/* Context bank attribute registers */
+#define ARM_SMMU_GR1_CBAR(n)		(0x0 + ((n) << 2))
+#define CBAR_VMID_SHIFT			0
+#define CBAR_TYPE_SHIFT			16
+#define CBAR_TYPE_S2_TRANS		(0 << CBAR_TYPE_SHIFT)
+#define CBAR_IRPTNDX_SHIFT		24
+
+#define ARM_SMMU_GR1_CBA2R(n)		(0x800 + ((n) << 2))
+#define CBA2R_RW64_32BIT		(0 << 0)
+#define CBA2R_RW64_64BIT		(1 << 0)
+#define CBA2R_VMID_SHIFT		16
+
+#define ARM_SMMU_CB_SCTLR		0x0
+#define ARM_SMMU_CB_ACTLR		0x4
+#define ARM_SMMU_CB_TTBR0		0x20
+#define ARM_SMMU_CB_TTBR1		0x28
+#define ARM_SMMU_CB_TTBCR		0x30
+#define ARM_SMMU_CB_CONTEXTIDR		0x34
+#define ARM_SMMU_CB_FSR			0x58
+
+#define SCTLR_CFCFG			(1 << 7)
+#define SCTLR_CFIE			(1 << 6)
+#define SCTLR_CFRE			(1 << 5)
+#define SCTLR_AFE			(1 << 2)
+#define SCTLR_TRE			(1 << 1)
+#define SCTLR_M				(1 << 0)
+
+#define FSR_MULTI			(1 << 31)
+#define FSR_SS				(1 << 30)
+#define FSR_UUT				(1 << 8)
+#define FSR_ASF				(1 << 7)
+#define FSR_TLBLKF			(1 << 6)
+#define FSR_TLBMCF			(1 << 5)
+#define FSR_EF				(1 << 4)
+#define FSR_PF				(1 << 3)
+#define FSR_AFF				(1 << 2)
+#define FSR_TF				(1 << 1)
+
+#define FSR_IGN				(FSR_AFF | FSR_ASF | \
+					 FSR_TLBMCF | FSR_TLBLKF)
+
+#define FSR_FAULT			(FSR_MULTI | FSR_SS | FSR_UUT | \
+					 FSR_EF | FSR_PF | FSR_TF | FSR_IGN)
+struct arm_smmu_s2cr {
+	enum arm_smmu_s2cr_type		type;
+	enum arm_smmu_s2cr_privcfg	privcfg;
+	u8				cbndx;
+};
+
+struct arm_smmu_smr {
+	u16				mask;
+	u16				id;
+	bool				valid;
+};
+
+struct arm_smmu_cb {
+	u64				ttbr[2];
+	u32				tcr[2];
+	u32				mair[2];
+	struct arm_smmu_cfg		*cfg;
+};
+
+#define ARM_SMMU_FEAT_COHERENT_WALK	(1 << 0)
+#define ARM_SMMU_FEAT_STREAM_MATCH	(1 << 1)
+#define ARM_SMMU_FEAT_TRANS_S1		(1 << 2)
+#define ARM_SMMU_FEAT_TRANS_S2		(1 << 3)
+#define ARM_SMMU_FEAT_TRANS_NESTED	(1 << 4)
+#define ARM_SMMU_FEAT_TRANS_OPS		(1 << 5)
+#define ARM_SMMU_FEAT_VMID16		(1 << 6)
+#define ARM_SMMU_FEAT_FMT_AARCH64_4K	(1 << 7)
+#define ARM_SMMU_FEAT_FMT_AARCH64_16K	(1 << 8)
+#define ARM_SMMU_FEAT_FMT_AARCH64_64K	(1 << 9)
+#define ARM_SMMU_FEAT_FMT_AARCH32_L	(1 << 10)
+#define ARM_SMMU_FEAT_FMT_AARCH32_S	(1 << 11)
+#define ARM_SMMU_FEAT_EXIDS		(1 << 12)
+#define ARM_SMMU_OPT_SECURE_CFG_ACCESS (1 << 0)
+struct arm_smmu_device {
+	void	*base;
+	void	*cb_base;
+	u32	num_masters;
+	unsigned long			pgshift;
+
+	u32				features;
+
+	u32				options;
+	enum arm_smmu_arch_version	version;
+	enum arm_smmu_implementation	model;
+
+	u32				num_context_banks;
+	u32				num_s2_context_banks;
+	struct arm_smmu_cb		*cbs;
+
+	u32				num_mapping_groups;
+	u16				streamid_mask;
+	u16				arm_sid_mask;
+	u16				smr_mask_mask;
+	struct arm_smmu_smr		*smrs;
+	struct arm_smmu_s2cr		*s2crs;
+	struct arm_smmu_cfg		*cfgs;
+
+	unsigned long			va_size;
+	unsigned long			ipa_size;
+	unsigned long			pa_size;
+	unsigned long			pgsize_bitmap;
+
+	u32				num_global_irqs;
+	u32				num_context_irqs;
+	unsigned int			*irqs;
+
+	spinlock_t			global_sync_lock;
+} smmu_device[JAILHOUSE_MAX_IOMMU_UNITS];
+
+enum arm_smmu_context_fmt {
+	ARM_SMMU_CTX_FMT_NONE,
+	ARM_SMMU_CTX_FMT_AARCH64,
+	ARM_SMMU_CTX_FMT_AARCH32_L,
+	ARM_SMMU_CTX_FMT_AARCH32_S,
+};
+
+struct arm_smmu_cfg {
+	u8				cbndx;
+	u8				irptndx;
+	union {
+		u16			asid;
+		u16			vmid;
+	};
+	u32				cbar;
+	enum arm_smmu_context_fmt	fmt;
+};
+#define INVALID_IRPTNDX			0xff
+
+#define s2cr_init_val (struct arm_smmu_s2cr){	\
+	.type = S2CR_TYPE_BYPASS,		\
+}
+
+static unsigned long pgsize_bitmap = -1;
+
+static void arm_smmu_write_smr(struct arm_smmu_device *smmu, int idx)
+{
+	struct arm_smmu_smr *smr = smmu->smrs + idx;
+	u32 reg = smr->id << SMR_ID_SHIFT | smr->mask << SMR_MASK_SHIFT;
+
+	if (!(smmu->features & ARM_SMMU_FEAT_EXIDS) && smr->valid)
+		reg |= SMR_VALID;
+	mmio_write32(ARM_SMMU_GR0(smmu) + ARM_SMMU_GR0_SMR(idx), reg);
+}
+
+static void arm_smmu_write_s2cr(struct arm_smmu_device *smmu, int idx)
+{
+	struct arm_smmu_s2cr *s2cr = smmu->s2crs + idx;
+	u32 reg = S2CR_TYPE(s2cr->type) | S2CR_CBNDX(s2cr->cbndx) |
+		  S2CR_PRIVCFG(s2cr->privcfg);
+
+	if (smmu->features & ARM_SMMU_FEAT_EXIDS && smmu->smrs &&
+	    smmu->smrs[idx].valid)
+		reg |= S2CR_EXIDVALID;
+	mmio_write32(ARM_SMMU_GR0(smmu) + ARM_SMMU_GR0_S2CR(idx), reg);
+}
+
+static void arm_smmu_write_sme(struct arm_smmu_device *smmu, int idx)
+{
+	if (smmu->smrs)
+		arm_smmu_write_smr(smmu, idx);
+
+	arm_smmu_write_s2cr(smmu, idx);
+}
+
+/* Wait for any pending TLB invalidations to complete */
+static int __arm_smmu_tlb_sync(struct arm_smmu_device *smmu,
+				void *sync, void *status)
+{
+	unsigned int spin_cnt, delay;
+
+	mmio_write32(sync, 0);
+	for (delay = 1; delay < TLB_LOOP_TIMEOUT; delay *= 2) {
+		for (spin_cnt = TLB_SPIN_COUNT; spin_cnt > 0; spin_cnt--) {
+			if (!(mmio_read32(status) & sTLBGSTATUS_GSACTIVE))
+				return 0;
+			cpu_relax();
+		}
+		delay_us(delay * 1000 * 1000);
+	}
+	printk("TLB sync timed out -- SMMU may be deadlocked\n");
+
+	return trace_error(-EINVAL);
+}
+
+static int arm_smmu_tlb_sync_global(struct arm_smmu_device *smmu)
+{
+	int ret;
+	void *base = ARM_SMMU_GR0(smmu);
+
+	spin_lock(&smmu->global_sync_lock);
+	ret = __arm_smmu_tlb_sync(smmu, base + ARM_SMMU_GR0_sTLBGSYNC,
+			    base + ARM_SMMU_GR0_sTLBGSTATUS);
+	spin_unlock(&smmu->global_sync_lock);
+
+	return ret;
+}
+
+#define ARM_SMMU_CB_VMID(cfg)		((cfg)->cbndx + 1)
+static void arm_smmu_init_context_bank(struct arm_smmu_device *smmu,
+				       struct arm_smmu_cfg *cfg,
+				       struct cell *cell)
+{
+	struct arm_smmu_cb *cb = &smmu->cbs[cfg->cbndx];
+	struct paging_structures *pg_structs;
+	unsigned long cell_table;
+	u32 reg;
+
+	cb->cfg = cfg;
+
+	/* VTCR */
+	reg = ARM_64_LPAE_S2_TCR_RES1 |
+	     (ARM_LPAE_TCR_SH_IS << ARM_LPAE_TCR_SH0_SHIFT) |
+	     (ARM_LPAE_TCR_RGN_WBWA << ARM_LPAE_TCR_IRGN0_SHIFT) |
+	     (ARM_LPAE_TCR_RGN_WBWA << ARM_LPAE_TCR_ORGN0_SHIFT);
+
+	reg |= (ARM_LPAE_TCR_SL0_LVL_1 << ARM_LPAE_TCR_SL0_SHIFT);
+
+	switch (PAGE_SIZE) {
+	case SZ_4K:
+		reg |= ARM_LPAE_TCR_TG0_4K;
+		break;
+	case SZ_64K:
+		reg |= ARM_LPAE_TCR_TG0_64K;
+		break;
+	}
+
+	switch (smmu->pa_size) {
+	case 32:
+		reg |= (ARM_LPAE_TCR_PS_32_BIT << ARM_LPAE_TCR_PS_SHIFT);
+		break;
+	case 36:
+		reg |= (ARM_LPAE_TCR_PS_36_BIT << ARM_LPAE_TCR_PS_SHIFT);
+		break;
+	case 40:
+		reg |= (ARM_LPAE_TCR_PS_40_BIT << ARM_LPAE_TCR_PS_SHIFT);
+		break;
+	case 42:
+		reg |= (ARM_LPAE_TCR_PS_42_BIT << ARM_LPAE_TCR_PS_SHIFT);
+		break;
+	case 44:
+		reg |= (ARM_LPAE_TCR_PS_44_BIT << ARM_LPAE_TCR_PS_SHIFT);
+		break;
+	case 48:
+		reg |= (ARM_LPAE_TCR_PS_48_BIT << ARM_LPAE_TCR_PS_SHIFT);
+		break;
+	case 52:
+		reg |= (ARM_LPAE_TCR_PS_52_BIT << ARM_LPAE_TCR_PS_SHIFT);
+		break;
+	default:
+		printk("Not supported\n");
+		break;
+		/* TODO */
+		//goto out_free_data;
+	}
+
+	reg |= (64ULL - smmu->ipa_size) << ARM_LPAE_TCR_T0SZ_SHIFT;
+
+	cb->tcr[0] = reg;
+
+	pg_structs = &cell->arch.mm;
+	cell_table = paging_hvirt2phys(pg_structs->root_table);
+	u64 vttbr = 0;
+
+	vttbr |= (u64)cell->config->id << VTTBR_VMID_SHIFT;
+	vttbr |= (u64)(cell_table & TTBR_MASK);
+	cb->ttbr[0] = vttbr;
+}
+
+static void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx)
+{
+	u32 reg;
+	struct arm_smmu_cb *cb = &smmu->cbs[idx];
+	struct arm_smmu_cfg *cfg = cb->cfg;
+	void *cb_base, *gr1_base;
+
+	cb_base = ARM_SMMU_CB(smmu, idx);
+
+	/* Unassigned context banks only need disabling */
+	if (!cfg) {
+		mmio_write32(cb_base + ARM_SMMU_CB_SCTLR, 0);
+		return;
+	}
+
+	gr1_base = ARM_SMMU_GR1(smmu);
+
+	/* CBA2R */
+	if (smmu->version > ARM_SMMU_V1) {
+		if (cfg->fmt == ARM_SMMU_CTX_FMT_AARCH64)
+			reg = CBA2R_RW64_64BIT;
+		else
+			reg = CBA2R_RW64_32BIT;
+		/* 16-bit VMIDs live in CBA2R */
+		if (smmu->features & ARM_SMMU_FEAT_VMID16)
+			reg |= cfg->vmid << CBA2R_VMID_SHIFT;
+
+		mmio_write32(gr1_base + ARM_SMMU_GR1_CBA2R(idx), reg);
+	}
+
+	/* CBAR */
+	reg = cfg->cbar;
+	if (smmu->version < ARM_SMMU_V2)
+		reg |= cfg->irptndx << CBAR_IRPTNDX_SHIFT;
+
+	/*
+	 * Use the weakest shareability/memory types, so they are
+	 * overridden by the ttbcr/pte.
+	 */
+	if (!(smmu->features & ARM_SMMU_FEAT_VMID16)) {
+		/* 8-bit VMIDs live in CBAR */
+		reg |= cfg->vmid << CBAR_VMID_SHIFT;
+	}
+	mmio_write32(gr1_base + ARM_SMMU_GR1_CBAR(idx), reg);
+
+	/*
+	 * TTBCR
+	 * We must write this before the TTBRs, since it determines the
+	 * access behaviour of some fields (in particular, ASID[15:8]).
+	 */
+	mmio_write32(cb_base + ARM_SMMU_CB_TTBCR, cb->tcr[0]);
+
+	/* TTBRs */
+	if (cfg->fmt == ARM_SMMU_CTX_FMT_AARCH32_S) {
+		mmio_write32(cb_base + ARM_SMMU_CB_CONTEXTIDR, cfg->asid);
+		mmio_write32(cb_base + ARM_SMMU_CB_TTBR0, cb->ttbr[0]);
+		mmio_write32(cb_base + ARM_SMMU_CB_TTBR1, cb->ttbr[1]);
+	} else {
+		mmio_write64(cb_base + ARM_SMMU_CB_TTBR0, cb->ttbr[0]);
+	}
+
+	/* SCTLR */
+	reg = SCTLR_CFCFG | SCTLR_CFIE | SCTLR_CFRE | SCTLR_AFE | SCTLR_TRE |
+		SCTLR_M;
+
+	mmio_write32(cb_base + ARM_SMMU_CB_SCTLR, reg);
+}
+
+static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
+{
+	void *gr0_base = ARM_SMMU_GR0(smmu);
+	int i, ret;
+	u32 reg, major;
+
+	/* clear global FSR */
+	reg = mmio_read32(ARM_SMMU_GR0_NS(smmu) + ARM_SMMU_GR0_sGFSR);
+	mmio_write32(ARM_SMMU_GR0_NS(smmu) + ARM_SMMU_GR0_sGFSR, reg);
+
+	/*
+	 * Reset stream mapping groups: Initial values mark all SMRn as
+	 * invalid and all S2CRn as bypass unless overridden.
+	 */
+	for (i = 0; i < smmu->num_mapping_groups; ++i)
+		arm_smmu_write_sme(smmu, i);
+
+	if (smmu->model == ARM_MMU500) {
+		/*
+		 * Before clearing ARM_MMU500_ACTLR_CPRE, need to
+		 * clear CACHE_LOCK bit of ACR first. And, CACHE_LOCK
+		 * bit is only present in MMU-500r2 onwards.
+		 */
+		reg = mmio_read32(gr0_base + ARM_SMMU_GR0_ID7);
+		major = (reg >> ID7_MAJOR_SHIFT) & ID7_MAJOR_MASK;
+		reg = mmio_read32(gr0_base + ARM_SMMU_GR0_sACR);
+		if (major >= 2)
+			reg &= ~ARM_MMU500_ACR_CACHE_LOCK;
+		/*
+		 * Allow unmatched Stream IDs to allocate bypass
+		 * TLB entries for reduced latency.
+		 */
+		reg |= ARM_MMU500_ACR_SMTNMB_TLBEN | ARM_MMU500_ACR_S2CRB_TLBEN;
+		mmio_write32(gr0_base + ARM_SMMU_GR0_sACR, reg);
+	}
+
+	/* Make sure all context banks are disabled and clear CB_FSR  */
+	for (i = 0; i < smmu->num_context_banks; ++i) {
+		void *cb_base = ARM_SMMU_CB(smmu, i);
+
+		arm_smmu_write_context_bank(smmu, i);
+		mmio_write32(cb_base + ARM_SMMU_CB_FSR, FSR_FAULT);
+		/*
+		 * Disable MMU-500's not-particularly-beneficial next-page
+		 * prefetcher for the sake of errata #841119 and #826419.
+		 */
+		if (smmu->model == ARM_MMU500) {
+			reg = mmio_read32(cb_base + ARM_SMMU_CB_ACTLR);
+			reg &= ~ARM_MMU500_ACTLR_CPRE;
+			mmio_write32(cb_base + ARM_SMMU_CB_ACTLR, reg);
+		}
+	}
+
+	/* Invalidate the TLB, just in case */
+	mmio_write32(gr0_base + ARM_SMMU_GR0_TLBIALLH, 0);
+	mmio_write32(gr0_base + ARM_SMMU_GR0_TLBIALLNSNH, 0);
+
+	reg = mmio_read32(ARM_SMMU_GR0_NS(smmu) + ARM_SMMU_GR0_sCR0);
+
+	/* Enable fault reporting */
+	reg |= (sCR0_GFRE | sCR0_GFIE | sCR0_GCFGFRE | sCR0_GCFGFIE);
+
+	/* Disable TLB broadcasting. */
+	reg |= (sCR0_VMIDPNE | sCR0_PTM);
+
+	/* Enable client access, handling unmatched streams as appropriate */
+	reg &= ~sCR0_CLIENTPD;
+	reg &= ~sCR0_USFCFG;
+
+	/* Disable forced broadcasting */
+	reg &= ~sCR0_FB;
+
+	/* Don't upgrade barriers */
+	reg &= ~(sCR0_BSU_MASK << sCR0_BSU_SHIFT);
+
+	if (smmu->features & ARM_SMMU_FEAT_VMID16)
+		reg |= sCR0_VMID16EN;
+
+	if (smmu->features & ARM_SMMU_FEAT_EXIDS)
+		reg |= sCR0_EXIDENABLE;
+
+	/* Push the button */
+	ret = arm_smmu_tlb_sync_global(smmu);
+	mmio_write32(ARM_SMMU_GR0_NS(smmu) + ARM_SMMU_GR0_sCR0, reg);
+
+	return ret;
+}
+
+static int arm_smmu_id_size_to_bits(int size)
+{
+	switch (size) {
+	case 0:
+		return 32;
+	case 1:
+		return 36;
+	case 2:
+		return 40;
+	case 3:
+		return 42;
+	case 4:
+		return 44;
+	case 5:
+	default:
+		return 48;
+	}
+}
+
+static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
+{
+	unsigned long size;
+	void *gr0_base = ARM_SMMU_GR0(smmu);
+	u32 id;
+	bool cttw_reg, cttw_fw = smmu->features & ARM_SMMU_FEAT_COHERENT_WALK;
+	int i;
+
+	printk("probing hardware configuration...\n");
+	printk("SMMUv%d with:\n", smmu->version == ARM_SMMU_V2 ? 2 : 1);
+
+	/* ID0 */
+	id = mmio_read32(gr0_base + ARM_SMMU_GR0_ID0);
+
+	/* Restrict stage 2 */
+	id &= ~(ID0_S1TS | ID0_NTS);
+
+	if (id & ID0_S2TS) {
+		smmu->features |= ARM_SMMU_FEAT_TRANS_S2;
+		printk("\tstage 2 translation\n");
+	}
+
+	if (!(smmu->features &
+		(ARM_SMMU_FEAT_TRANS_S1 | ARM_SMMU_FEAT_TRANS_S2))) {
+		printk("\tno translation support!\n");
+		return -ENODEV;
+	}
+
+	/*
+	 * In order for DMA API calls to work properly, we must defer to what
+	 * the FW says about coherency, regardless of what the hardware claims.
+	 * Fortunately, this also opens up a workaround for systems where the
+	 * ID register value has ended up configured incorrectly.
+	 */
+	cttw_reg = !!(id & ID0_CTTW);
+	if (cttw_fw || cttw_reg)
+		printk("\t%scoherent table walk\n", cttw_fw ? "" : "non-");
+	if (cttw_fw != cttw_reg)
+		printk("\t(IDR0.CTTW overridden by FW configuration)\n");
+
+	/* Max. number of entries we have for stream matching/indexing */
+	if (smmu->version == ARM_SMMU_V2 && id & ID0_EXIDS) {
+		smmu->features |= ARM_SMMU_FEAT_EXIDS;
+		size = 1 << 16;
+	} else {
+		size = 1 << ((id >> ID0_NUMSIDB_SHIFT) & ID0_NUMSIDB_MASK);
+	}
+	smmu->streamid_mask = size - 1;
+
+	if (id & ID0_SMS) {
+		smmu->features |= ARM_SMMU_FEAT_STREAM_MATCH;
+		size = (id >> ID0_NUMSMRG_SHIFT) & ID0_NUMSMRG_MASK;
+		if (size == 0) {
+			printk("stream-matching supported, but no SMRs present!\n");
+			return -ENODEV;
+		}
+
+		/* Zero-initialised to mark as invalid */
+		smmu->smrs = page_alloc(&mem_pool,
+					PAGES(size * sizeof(*smmu->smrs)));
+		if (!smmu->smrs)
+			return -ENOMEM;
+		memset(smmu->smrs, 0, PAGES(size * sizeof(*smmu->smrs)));
+
+		printk("\tstream matching with %lu register groups", size);
+	}
+	/* s2cr->type == 0 means translation, so initialise explicitly */
+	smmu->s2crs = page_alloc(&mem_pool, PAGES(size * (sizeof(*smmu->s2crs) + sizeof(*smmu->cfgs))));
+	if (!smmu->s2crs) {
+		page_free(&mem_pool, smmu->smrs,
+			  PAGES(size * sizeof(*smmu->smrs)));
+		return -ENOMEM;
+	}
+
+	smmu->cfgs = (struct arm_smmu_cfg *)(smmu->s2crs + size);
+
+	/* Configure to bypass */
+	for (i = 0; i < size; i++)
+		smmu->s2crs[i] = s2cr_init_val;
+
+	smmu->num_mapping_groups = size;
+
+	if (smmu->version < ARM_SMMU_V2 || !(id & ID0_PTFS_NO_AARCH32)) {
+		smmu->features |= ARM_SMMU_FEAT_FMT_AARCH32_L;
+		if (!(id & ID0_PTFS_NO_AARCH32S))
+			smmu->features |= ARM_SMMU_FEAT_FMT_AARCH32_S;
+	}
+
+	/* ID1 */
+	id = mmio_read32(gr0_base + ARM_SMMU_GR0_ID1);
+	smmu->pgshift = (id & ID1_PAGESIZE) ? 16 : 12;
+
+	/* Check for size mismatch of SMMU address space from mapped region */
+	size = 1 << (((id >> ID1_NUMPAGENDXB_SHIFT) & ID1_NUMPAGENDXB_MASK) + 1);
+	size <<= smmu->pgshift;
+	if (smmu->cb_base != gr0_base + size)
+		printk("SMMU address space size (0x%lx) differs from mapped region size (0x%tx)!\n",
+		       size * 2, (smmu->cb_base - gr0_base) * 2);
+
+	smmu->num_s2_context_banks = (id >> ID1_NUMS2CB_SHIFT) & ID1_NUMS2CB_MASK;
+	smmu->num_context_banks = (id >> ID1_NUMCB_SHIFT) & ID1_NUMCB_MASK;
+	if (smmu->num_s2_context_banks > smmu->num_context_banks) {
+		printk("impossible number of S2 context banks!\n");
+		return -ENODEV;
+	}
+	/* TODO Check More */
+	smmu->num_context_irqs = smmu->num_context_banks;
+
+	printk("\t%u context banks (%u stage-2 only)\n",
+	       smmu->num_context_banks, smmu->num_s2_context_banks);
+
+	smmu->cbs = page_alloc(&mem_pool, PAGES(smmu->num_context_banks * sizeof(*smmu->cbs)));
+	if (!smmu->cbs) {
+		/* TODO: Free smrs s2cr */
+		return -ENOMEM;
+	}
+
+	/* ID2 */
+	id = mmio_read32(gr0_base + ARM_SMMU_GR0_ID2);
+	size = arm_smmu_id_size_to_bits((id >> ID2_IAS_SHIFT) & ID2_IAS_MASK);
+	/* Reuse cpu table */
+	smmu->ipa_size = MIN(size, get_cpu_parange());
+
+	/* The output mask is also applied for bypass */
+	size = arm_smmu_id_size_to_bits((id >> ID2_OAS_SHIFT) & ID2_OAS_MASK);
+	smmu->pa_size = size;
+
+	if (id & ID2_VMID16)
+		smmu->features |= ARM_SMMU_FEAT_VMID16;
+
+	/*
+	 * What the page table walker can address actually depends on which
+	 * descriptor format is in use, but since a) we don't know that yet,
+	 * and b) it can vary per context bank, this will have to do...
+	 * TODO: DMA?
+	 */
+
+	if (smmu->version < ARM_SMMU_V2) {
+		smmu->va_size = smmu->ipa_size;
+		if (smmu->version == ARM_SMMU_V1_64K)
+			smmu->features |= ARM_SMMU_FEAT_FMT_AARCH64_64K;
+	} else {
+		size = (id >> ID2_UBS_SHIFT) & ID2_UBS_MASK;
+		smmu->va_size = arm_smmu_id_size_to_bits(size);
+		if (id & ID2_PTFS_4K)
+			smmu->features |= ARM_SMMU_FEAT_FMT_AARCH64_4K;
+		if (id & ID2_PTFS_16K)
+			smmu->features |= ARM_SMMU_FEAT_FMT_AARCH64_16K;
+		if (id & ID2_PTFS_64K)
+			smmu->features |= ARM_SMMU_FEAT_FMT_AARCH64_64K;
+	}
+
+	/* Now we've corralled the various formats, what'll it do? */
+	if (smmu->features & ARM_SMMU_FEAT_FMT_AARCH32_S)
+		smmu->pgsize_bitmap |= SZ_4K | SZ_64K | SZ_1M | SZ_16M;
+	if (smmu->features &
+	    (ARM_SMMU_FEAT_FMT_AARCH32_L | ARM_SMMU_FEAT_FMT_AARCH64_4K))
+		smmu->pgsize_bitmap |= SZ_4K | SZ_2M | SZ_1G;
+	if (smmu->features & ARM_SMMU_FEAT_FMT_AARCH64_16K)
+		smmu->pgsize_bitmap |= SZ_16K | SZ_32M;
+	if (smmu->features & ARM_SMMU_FEAT_FMT_AARCH64_64K)
+		smmu->pgsize_bitmap |= SZ_64K | SZ_512M;
+
+	if (pgsize_bitmap == -1UL)
+		pgsize_bitmap = smmu->pgsize_bitmap;
+	else
+		pgsize_bitmap |= smmu->pgsize_bitmap;
+	printk("\tSupported page sizes: 0x%08lx\n", smmu->pgsize_bitmap);
+
+
+	if (smmu->features & ARM_SMMU_FEAT_TRANS_S1)
+		printk("\tStage-1: %lu-bit VA -> %lu-bit IPA\n",
+		       smmu->va_size, smmu->ipa_size);
+
+	if (smmu->features & ARM_SMMU_FEAT_TRANS_S2)
+		printk("\tStage-2: %lu-bit IPA -> %lu-bit PA\n",
+		       smmu->ipa_size, smmu->pa_size);
+
+	return 0;
+}
+
+static void arm_smmu_test_smr_masks(struct arm_smmu_device *smmu)
+{
+	void *gr0_base = ARM_SMMU_GR0(smmu);
+	u32 smr;
+
+	if (!smmu->smrs)
+		return;
+
+	/*
+	 * SMR.ID bits may not be preserved if the corresponding MASK
+	 * bits are set, so check each one separately. We can reject
+	 * masters later if they try to claim IDs outside these masks.
+	 */
+	smr = smmu->streamid_mask << SMR_ID_SHIFT;
+	mmio_write32(gr0_base + ARM_SMMU_GR0_SMR(0), smr);
+	smr = mmio_read32(gr0_base + ARM_SMMU_GR0_SMR(0));
+	smmu->streamid_mask = smr >> SMR_ID_SHIFT;
+
+	smr = smmu->streamid_mask << SMR_MASK_SHIFT;
+	mmio_write32(gr0_base + ARM_SMMU_GR0_SMR(0), smr);
+	smr = mmio_read32(gr0_base + ARM_SMMU_GR0_SMR(0));
+	smmu->smr_mask_mask = smr >> SMR_MASK_SHIFT;
+}
+
+static int arm_smmu_find_sme(u16 id, u16 mask, int n)
+{
+	struct arm_smmu_device *smmu = &smmu_device[n];
+	struct arm_smmu_smr *smrs = smmu->smrs;
+	int i, free_idx = -EINVAL;
+
+	/* Stream indexing is blissfully easy */
+	if (!smrs)
+		return id;
+
+	/* Validating SMRs is... less so */
+	for (i = 0; i < smmu->num_mapping_groups; ++i) {
+		if (!smrs[i].valid) {
+			/*
+			 * Note the first free entry we come across, which
+			 * we'll claim in the end if nothing else matches.
+			 */
+			if (free_idx < 0)
+				free_idx = i;
+			continue;
+		}
+		/*
+		 * If the new entry is _entirely_ matched by an existing entry,
+		 * then reuse that, with the guarantee that there also cannot
+		 * be any subsequent conflicting entries. In normal use we'd
+		 * expect simply identical entries for this case, but there's
+		 * no harm in accommodating the generalisation.
+		 */
+		if ((mask & smrs[i].mask) == mask &&
+		    !((id ^ smrs[i].id) & ~smrs[i].mask)) {
+			return i;
+		}
+		/*
+		 * If the new entry has any other overlap with an existing one,
+		 * though, then there always exists at least one stream ID
+		 * which would cause a conflict, and we can't allow that risk.
+		 */
+		if (!((id ^ smrs[i].id) & ~(smrs[i].mask | mask)))
+			return -EINVAL;
+	}
+
+	return free_idx;
+}
+
+static bool arm_smmu_free_sme(struct arm_smmu_device *smmu, int idx)
+{
+	smmu->s2crs[idx] = s2cr_init_val;
+	if (smmu->smrs) {
+		smmu->smrs[idx].id = 0;
+		smmu->smrs[idx].mask = 0;
+		smmu->smrs[idx].valid = false;
+	}
+
+	return true;
+}
+
+#define for_each_smmu_sid(sid, config, counter)				\
+	for ((sid) = jailhouse_cell_stream_ids(config), (counter) = 0;	\
+	     (counter) < (config)->num_stream_ids;			\
+	     (sid)++, (counter)++)
+
+static int arm_smmu_cell_init(struct cell *cell)
+{
+	struct jailhouse_iommu *iommu;
+	enum arm_smmu_s2cr_type type = S2CR_TYPE_TRANS;
+	struct arm_smmu_s2cr *s2cr;
+	struct arm_smmu_cfg *cfg;
+	struct arm_smmu_smr *smr;
+	const __u32 *sid;
+	unsigned int n;
+	int ret, idx, i;
+
+	if (!iommu_count_units())
+		return 0;
+
+	/* If no sids, ignore */
+	if (!cell->config->num_stream_ids)
+		return 0;
+
+	iommu = &system_config->platform_info.iommu_units[0];
+	for (i = 0; i < iommu_count_units(); iommu++, i++) {
+		if (iommu->arm_smmu_arch != ARM_SMMU_V2)
+			continue;
+
+		s2cr = smmu_device[i].s2crs;
+		cfg = &smmu_device[i].cfgs[cell->config->id];
+
+		if (smmu_device[i].features & (ARM_SMMU_FEAT_FMT_AARCH64_64K |
+					       ARM_SMMU_FEAT_FMT_AARCH64_16K |
+					       ARM_SMMU_FEAT_FMT_AARCH64_4K))
+			cfg->fmt = ARM_SMMU_CTX_FMT_AARCH64;
+
+		cfg->cbar = CBAR_TYPE_S2_TRANS;
+
+		/* We use cell->config->id here, one cell use one context */
+		cfg->cbndx = cell->config->id;
+
+		if (smmu_device[i].version < ARM_SMMU_V2) {
+			/* TODO */
+		} else {
+			cfg->irptndx = cfg->cbndx;
+		}
+
+		cfg->vmid = cfg->cbndx + 1;
+
+		arm_smmu_init_context_bank(&smmu_device[i], cfg, cell);
+		arm_smmu_write_context_bank(&smmu_device[i], cfg->cbndx);
+
+		smr = smmu_device[i].smrs;
+
+		for_each_smmu_sid(sid, cell->config, n) {
+			ret = arm_smmu_find_sme(*sid,
+						smmu_device[i].arm_sid_mask, i);
+			if (ret < 0)
+				printk("arm_smmu_find_sme error %d\n", ret);
+			idx = ret;
+
+			if (type == s2cr[idx].type &&
+			    cfg->cbndx == s2cr[idx].cbndx)
+				printk("%s error\n", __func__);
+
+			s2cr[idx].type = type;
+			s2cr[idx].privcfg = S2CR_PRIVCFG_DEFAULT;
+			s2cr[idx].cbndx = cfg->cbndx;
+
+			arm_smmu_write_s2cr(&smmu_device[i], idx);
+
+			smr[idx].id = *sid;
+			smr[idx].mask = smmu_device[i].arm_sid_mask;
+			smr[idx].valid = true;
+
+			arm_smmu_write_smr(&smmu_device[i], idx);
+		}
+
+		printk("Found %d masters\n", n);
+	}
+
+	return 0;
+}
+
+static void arm_smmu_cell_exit(struct cell *cell)
+{
+	const __u32 *sid;
+	unsigned int n;
+	int ret, idx, i;
+	int cbndx = cell->config->id;
+	struct jailhouse_iommu *iommu;
+
+	if (!iommu_count_units())
+		return;
+
+	/* If no sids, ignore */
+	if (!cell->config->num_stream_ids)
+		return;
+
+	iommu = &system_config->platform_info.iommu_units[0];
+	for (i = 0; i < JAILHOUSE_MAX_IOMMU_UNITS; iommu++, i++) {
+		if (iommu->arm_smmu_arch != ARM_SMMU_V2)
+			continue;
+
+		for_each_smmu_sid(sid, cell->config, n) {
+			ret = arm_smmu_find_sme(*sid,
+						smmu_device[i].arm_sid_mask, i);
+			if (ret < 0)
+				printk("arm_smmu_find_sme error %d\n", ret);
+			idx = ret;
+
+			if (arm_smmu_free_sme(&smmu_device[i], idx))
+				arm_smmu_write_sme(&smmu_device[i], idx);
+
+			smmu_device[i].cbs[cbndx].cfg = NULL;
+			arm_smmu_write_context_bank(&smmu_device[i], cbndx);
+		}
+	}
+}
+
+static int arm_smmu_init(void)
+{
+	int err, i, num = 0;
+	struct jailhouse_iommu *iommu;
+
+	iommu = &system_config->platform_info.iommu_units[0];
+	for (i = 0; i < iommu_count_units(); iommu++, i++) {
+		if (iommu->arm_smmu_arch != ARM_SMMU_V2)
+			continue;
+
+		if (iommu->base) {
+			num++;
+
+			smmu_device[i].features &= ~ARM_SMMU_FEAT_COHERENT_WALK;
+			smmu_device[i].version = iommu->arm_smmu_arch;
+			smmu_device[i].model = iommu->arm_smmu_impl;
+			smmu_device[i].arm_sid_mask = iommu->arm_sid_mask;
+
+			smmu_device[i].base = paging_map_device(iommu->base,
+								iommu->size);
+			if (!smmu_device[i].base)
+				return -ENOMEM;
+
+			smmu_device[i].cb_base = smmu_device[i].base +
+						 iommu->size / 2;
+
+			err = arm_smmu_device_cfg_probe(&smmu_device[i]);
+			if (err)
+				return err;
+
+			if (smmu_device[i].version ==ARM_SMMU_V2 &&
+			    smmu_device[i].num_context_banks !=
+			    smmu_device[i].num_context_irqs) {
+				printk("found only %d context interrupt(s) but %d required\n",
+				       smmu_device[i].num_context_irqs,
+				       smmu_device[i].num_context_banks);
+				/* TODO: page free smr s2cr cbs */
+				return -ENODEV;
+			}
+
+			/* TODO: request irq */
+
+			err = arm_smmu_device_reset(&smmu_device[i]);
+			if (err)
+				return err;
+
+			arm_smmu_test_smr_masks(&smmu_device[i]);
+		}
+	}
+
+	if (num == 0) {
+		printk("No SMMU\n");
+		return 0;
+	}
+
+	/*
+	 * For ACPI and generic DT bindings, an SMMU will be probed before
+	 * any device which might need it, so we want the bus ops in place
+	 * ready to handle default domain setup as soon as any SMMU exists.
+	 */
+	/* TODO: How handle PCI iommu? */
+
+	return arm_smmu_cell_init(&root_cell);
+}
+
+DEFINE_UNIT_MMIO_COUNT_REGIONS_STUB(arm_smmu);
+DEFINE_UNIT_SHUTDOWN_STUB(arm_smmu);
+DEFINE_UNIT(arm_smmu, "ARM SMMU");
diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
index 2a968dd5..ad8f6550 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -279,6 +279,10 @@ struct jailhouse_iommu {
 			__u32 tlb_size;
 		} __attribute__((packed)) tipvu;
 	};
+
+	__u32 arm_sid_mask;
+	__u32 arm_smmu_arch;
+	__u32 arm_smmu_impl;
 } __attribute__((packed));
 
 struct jailhouse_pio {
@@ -303,6 +307,17 @@ struct jailhouse_pio {
 #define SYS_FLAGS_VIRTUAL_DEBUG_CONSOLE(flags) \
 	!!((flags) & JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE)
 
+enum arm_smmu_arch_version {
+	ARM_SMMU_V1,
+	ARM_SMMU_V1_64K,
+	ARM_SMMU_V2,
+};
+
+enum arm_smmu_implementation {
+	GENERIC_SMMU,
+	ARM_MMU500,
+};
+
 /**
  * General descriptor of the system.
  */
diff --git a/include/jailhouse/sizes.h b/include/jailhouse/sizes.h
new file mode 100644
index 00000000..ce3e8150
--- /dev/null
+++ b/include/jailhouse/sizes.h
@@ -0,0 +1,47 @@
+/*
+ * include/linux/sizes.h
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+#ifndef __LINUX_SIZES_H__
+#define __LINUX_SIZES_H__
+
+#define SZ_1				0x00000001
+#define SZ_2				0x00000002
+#define SZ_4				0x00000004
+#define SZ_8				0x00000008
+#define SZ_16				0x00000010
+#define SZ_32				0x00000020
+#define SZ_64				0x00000040
+#define SZ_128				0x00000080
+#define SZ_256				0x00000100
+#define SZ_512				0x00000200
+
+#define SZ_1K				0x00000400
+#define SZ_2K				0x00000800
+#define SZ_4K				0x00001000
+#define SZ_8K				0x00002000
+#define SZ_16K				0x00004000
+#define SZ_32K				0x00008000
+#define SZ_64K				0x00010000
+#define SZ_128K				0x00020000
+#define SZ_256K				0x00040000
+#define SZ_512K				0x00080000
+
+#define SZ_1M				0x00100000
+#define SZ_2M				0x00200000
+#define SZ_4M				0x00400000
+#define SZ_8M				0x00800000
+#define SZ_16M				0x01000000
+#define SZ_32M				0x02000000
+#define SZ_64M				0x04000000
+#define SZ_128M				0x08000000
+#define SZ_256M				0x10000000
+#define SZ_512M				0x20000000
+
+#define SZ_1G				0x40000000
+#define SZ_2G				0x80000000
+
+#endif /* __LINUX_SIZES_H__ */
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200828084425.21282-3-alice.guo%40nxp.com.
