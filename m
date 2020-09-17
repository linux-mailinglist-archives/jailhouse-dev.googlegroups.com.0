Return-Path: <jailhouse-dev+bncBDEN32754MOBBQ6BRP5QKGQERX6RSMQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 853A326D20C
	for <lists+jailhouse-dev@lfdr.de>; Thu, 17 Sep 2020 06:06:28 +0200 (CEST)
Received: by mail-lf1-x138.google.com with SMTP id a4sf97651lff.21
        for <lists+jailhouse-dev@lfdr.de>; Wed, 16 Sep 2020 21:06:28 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1600315588; cv=pass;
        d=google.com; s=arc-20160816;
        b=VU+dUbDWYZGlbi0S8CgoO9PrgULUUd/B6mbRyjaCwR2v4O/+E+9YR/KtBovblGx9Fl
         noloHkZAU4cOdgy2XSofmUpPlDM1WwQbsn8FYQPMv//aVMbZhGCH14wzxu8O4fG5Th4F
         mAem5PFZ9ad5Q38P1kxg4VBP/u7Ds07FOY+/Aqc1OUGVMQnWUf9Y19gf9d//jW+NnN1s
         co9M+VoEAxb6zOzrFzPbPnOuUwTZKvMavEZG6rFbfe57AsbypRjSDpsmSSiUHhJS9lXp
         4k003wyPJlZ8EoSOxYovxdAsgFzq/kCzZVzWy3ZcvirLoGD94tWprkIr5LkObAkZfgf7
         jUZA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=h/dldw/GmNeqKAqTTBmjM5GB2tLVYik1Y479Yz9H4zw=;
        b=n7+T2ciDnBGZTuZq3ccnRb5erNyCqyJ14rNaHuARU/vpPZ6b6Klw7mEfrK/lp6wvSh
         6D2otVE0AaVmxRG1srSvn4JBa7uYDvyVyDolfMs9KkCJc/qs4vWCaT37keYrCkV4TWLS
         Afui6oUP6+f+tpFzcvxOGlhfEI5fcWItufKkEPpTZwWXL2/oc6fTcQyk3Xw2bT69VsGc
         2fGlUfThARHi6TeZWRcyQE7CVsfuYY4YXypJNdQpW2BsmWCBwFFzlqZnJre2uua+rf2J
         Eiv2d2ILcZM/JdhF0QwdttJ/X+v5z45atJep3ydk+tn/tPTzknoWp5J035MdH+21+Rs1
         Q+0Q==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=G7U5j3g2;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.21.77 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=h/dldw/GmNeqKAqTTBmjM5GB2tLVYik1Y479Yz9H4zw=;
        b=Y5pTSc9UAT6SVgV8C0WZPk40kWPDqM9h6B47cDpjgt34vsG07daf/k87LdtxXLko2G
         zeq9UD/MixrNfpLhMZpGj1rozStCurUTLZHWBiuFbxbkAPzB4CqNQf6rrnBIojs4Z4Hl
         skgGWo4oHb0mdYUGuLnUjOTpDXCL7bdJcdamPDt26GCNpEsMbmxdhlOZ5WMpnUV6i8FH
         VMVeuioUvkea/V/02ildPHTCHhp3ZNdJ+assQi9H1V11kIY05ePXPn95odqoL86ihDG6
         uEcsEucT0udHtkW6JVpRWcUz6MtYGSCXlrAwyPltzvVxbxJWKiHhDzeg0OnY1xoBvhHT
         q83Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=h/dldw/GmNeqKAqTTBmjM5GB2tLVYik1Y479Yz9H4zw=;
        b=shMZApH3mj3xexMPCIDi1bGh7918iSQA/cMBUbKnYuQaRizeJKJjI+CuITnBsmhk5m
         loKJ5tMtdhVdEh54NFUNiF1rk0cqsl1uaZqGmCNVTJ2yA3lLjN4zuA0jb1Vc4hAUuJy9
         x3wmPJxSQ8edbLAPhmW9B6wRa9TURw+Iy361aWpYwq4p0EkgN8XfYxx/zijanij+8c4E
         PZ1euM6OmnhYnJPr65cnAkfYxiPF3T1t2Ht+vNAWE3yKPWqyXSPbsXz3/TqTvWDGUeqM
         cNndBHfnlcY8ECMKEeFnPUYSkiavRNwFLV/ybQaFrW6pX0iG9a7NvuAs1LtaNKXqaMfb
         7BBQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531Tk85DXTKvB0eIoTCdj9JaAkXJ/DrceStMMfRk4WbjTxB5UvPf
	RESugr3R8PpNsBBTzooSCJY=
X-Google-Smtp-Source: ABdhPJx4J+kCa+kjb3sTv9GYPz1NP5dOXuUdm21KMIR9VIazghQUSLQ9S4yVvHfemHn9qhjr+1S7dA==
X-Received: by 2002:a19:7902:: with SMTP id u2mr9377796lfc.515.1600315587937;
        Wed, 16 Sep 2020 21:06:27 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:544e:: with SMTP id d14ls70059lfn.2.gmail; Wed, 16 Sep
 2020 21:06:26 -0700 (PDT)
X-Received: by 2002:ac2:546f:: with SMTP id e15mr7882826lfn.358.1600315586738;
        Wed, 16 Sep 2020 21:06:26 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1600315586; cv=pass;
        d=google.com; s=arc-20160816;
        b=GYffSVZrJDPL+vw0H09po6/ykzjKNz51r6XDh9Kq6+uDgSzoNZuDRI+WNRQmsderJH
         3un/EyX7kXFVq4bAXisav008j9TVb5nW9HJKp0teN9li2eOl20e08ogxoUhURSF82G1x
         gm9CLphtosfJ088Q7ontmXnJs9DJz35MPyKNeBK1hE643GTnGk3LPTjebRQKrC8LmkWE
         zt+VUJRc00IHfT6SybpADN9RxtSsLPx5nxKwbJt9ySDECF28o7ujl2cIryh3+7Ava62b
         TqBgKuqHsBHXCD8C7oAgIRoq0/Ubej5gsqwYZRaI3HEeNMCSz9JS6VDHDw2L+YOU4l5z
         6gMA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=9pyWfHnDbS0r1kABMsBc1IDCaxdLVhOEWXGomktUMSA=;
        b=cEbi+Ms/rhb2sUtM+v5ct7+XyEBQGsk/G6XMK3ObvSmmWOH6lD5WbncS5wyzRskSkd
         4tFPkNPhwpUUMKURjq2U1J6VqOVowdmaRdCvj9B9p78WiYot9gw9/q8yxFOYsdTOHDxz
         WUBh8Oq/ycq3U+mjeKAYYYAp9E8W7IRfqE4f+RZC2y2sYDN8T8a9dtblD7AZl1BZmPiJ
         yllOLrmDU2pIIt+NfMm/qEQAAe1S0mB/oN1iTMPB3Hn91mf55/j8cH+S3h7UheuSolkk
         4LsAN25PJsXQdJHQzxP9GeGhEyLE0DoJEew7RI/ercr2F2npuNbfOaE6fjf//yK+DdFE
         DGeA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=G7U5j3g2;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.21.77 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2077.outbound.protection.outlook.com. [40.107.21.77])
        by gmr-mx.google.com with ESMTPS id p25si216148lji.8.2020.09.16.21.06.26
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Sep 2020 21:06:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of alice.guo@nxp.com designates 40.107.21.77 as permitted sender) client-ip=40.107.21.77;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dgo4iT+3pQ8D3A5OOTx1RVj4EFHnWheg2LO/pxj4l8BbSnPk5HZ7qLMGb4G5HNV6A6cbUL5bvygKbL3cXZThg9+0Cz6Rl9Tg5oYqb7/pBxlq+3GcGnOMdgjOSUIENrhdG0VFk8Q02oByfdfhGAkPe8dpdwmPwpc0t7N+vVc6o+TnIWrGvpJfV5WZ/JO1aPUtaDa5lO8ke8KDigUj25n578pi2B1plqPdbS92VE0t94QLk9/mfN3xvNO/pqJfpFz/a6bjTxgKqVREnV2P4/RyQDtgXMQQjd3+GKNrfG/+fDMaIBSrucWIwLhU0aQk4CvYUeAMY9hG2GErqJYRm7pPLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9pyWfHnDbS0r1kABMsBc1IDCaxdLVhOEWXGomktUMSA=;
 b=k6qEKyx8mlxina1aVyirneKyqYbvROnOeTuiAqMknNmBaYXfqhJcV3i2U8DI7PhmuKKa+go3OgTslMNVaifCVQ8fzOYmSHg2mCI8UazSAcyNtv183wJb/0JrhWcPujDjRfMUzFFXsIldT7heEQ0aLLwVOfX91/nQqHAsqKPc8m5QBGXoa+1XSGDsKkqHPak3eFFNJ6t2YNXxW5lRznur4QPLEpNTFzdWvF+c6VFbIH9Zi5iSArEhG3udvgXUAg6+j6RmmZY5ymTAqEFyXXHK1VWH5LiV/AcCUDhObKQN2qX6jeWXNZ+QvntGj9pk9jGYF3MwNkPQxpWRKtXLfwtpcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from VI1PR04MB7071.eurprd04.prod.outlook.com (2603:10a6:800:128::8)
 by VE1PR04MB6654.eurprd04.prod.outlook.com (2603:10a6:803:129::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14; Thu, 17 Sep
 2020 04:06:24 +0000
Received: from VI1PR04MB7071.eurprd04.prod.outlook.com
 ([fe80::c97:3a39:dcbb:117c]) by VI1PR04MB7071.eurprd04.prod.outlook.com
 ([fe80::c97:3a39:dcbb:117c%8]) with mapi id 15.20.3391.011; Thu, 17 Sep 2020
 04:06:24 +0000
From: Alice Guo <alice.guo@nxp.com>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Cc: peng.fan@nxp.com,
	Alice Guo <alice.guo@nxp.com>
Subject: [PATCH V4 5/5] configs: imx8qm: add configuration files
Date: Thu, 17 Sep 2020 12:05:54 +0800
Message-Id: <20200917040554.4599-5-alice.guo@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200917040554.4599-1-alice.guo@nxp.com>
References: <20200917040554.4599-1-alice.guo@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: SG2PR06CA0196.apcprd06.prod.outlook.com (2603:1096:4:1::28)
 To VI1PR04MB7071.eurprd04.prod.outlook.com (2603:10a6:800:128::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nxf55104-OptiPlex-7060.ap.freescale.net (119.31.174.71) by SG2PR06CA0196.apcprd06.prod.outlook.com (2603:1096:4:1::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend Transport; Thu, 17 Sep 2020 04:06:22 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 28587b63-91de-422f-84bc-08d85abf0b0f
X-MS-TrafficTypeDiagnostic: VE1PR04MB6654:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB66543FCDD5DFC96E737FB471E23E0@VE1PR04MB6654.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q/KDeTI4EdVgqbkJym5mKRf4vLoDQIfy8ApzDc1Y4qoByyf66e24W62C8gp9pPGrYO1IwAWKjGaI/GdWPc5Rrjd2kKigc41+elRzVnCR/rliQ0k1HT+XcZtzNxrDae9tCn3+iMsAZcRLTk/n6kooycjY8JfR9hsX2tDLmVChZdXX5/tl+F8B9cSMriKZpybBml8j+LbfEJAzZ1I4rLOaDGBIpLS+mFS6Tvl3Ed3/i2I1UC6qwVKPsTcwioC3iOViY1ws9UAvvwLpbPJaKG7EHHTe6y4xCl6ASfoJYC03MZhxFpynSz1ytuZbGZ+UzBiFZt0Rwc7xyit2qB1sGzogLsRLVYBjM8gdqr1wOivW8xU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7071.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(396003)(346002)(39860400002)(376002)(6512007)(86362001)(8936002)(30864003)(316002)(52116002)(6486002)(44832011)(478600001)(2616005)(26005)(16526019)(66946007)(66476007)(8676002)(186003)(4326008)(956004)(66556008)(6506007)(5660300002)(36756003)(2906002)(83380400001)(6666004)(1076003)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: +wKrI/AlwTPknEUXbiCuHPZes8DAmLQIHcdMORt0e/4Vt11UD3Jf4aAtwLa8sH0LyYMWGhCvgX6sHWO+1C3UQnU828bOaakwOtGmBbJKue6Bqn5URQgivpr7H4DUtv8snEm47Dy2smPyENIeo1HLSQtH/t1N9nETUNz160ML0TuHtPEGs+9EsbPQ7stL0Pkp8X+hx1956dXOgk+v8BpU3XOyn4sTDgupUb+gN9xFj8Nu4usoALbD894/0P5zCmpmlhO3U7lWX3HGtEDyRcyyQu8iCxGQl2gsWkJtyom7mFGT5XQGkHxQqXuE82/X+taWSaVBpx1YwdsQ0cQAhVLGs+VfYEgIqhQ2xfELZbUgyj6tAiScjPBGcmBqVA8rC7oSJLNKyOzyrt9RWzb/RhEI+e+HRCrUPioZU5MzfyQaf+Kk3FoJxd3xiTiNrIr321cD3bIHDEX3+v3veSf43mcWIIIa/8VqgujCTlwghqvVW99k0MMWCgB+XbZyrBe0gUpBAfl6TdloygF5WnPmlqRtvk6OzbsSMqDI7Ux2NAmfkR6BsuuHBPXhNu5/XvQ1qeQqxdrHyg7QhlFnmBgrN+SjM1BSacSHfuO7kXyxyTxYiASeOqCkDaaESVxK8UC8JuW86s0A+Vrriw1eLsYOyGehzg==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28587b63-91de-422f-84bc-08d85abf0b0f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7071.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2020 04:06:24.5925
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SQWpX5ScBFNbuiUE+j2Tbe5FTy5h2bxZG5Rufv13k045qCS59Sjt1Jc3zgRlLbiO4wyX+7HIaGzStDpqrchJJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6654
X-Original-Sender: alice.guo@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=G7U5j3g2;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of alice.guo@nxp.com
 designates 40.107.21.77 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
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

Add root cell and inmate cell configuration files for imx8qm.

Signed-off-by: Alice Guo <alice.guo@nxp.com>
---
 configs/arm64/imx8qm-ivshmem-demo.c | 124 ++++++++++++++++
 configs/arm64/imx8qm-linux-demo.c   | 199 ++++++++++++++++++++++++++
 configs/arm64/imx8qm.c              | 213 ++++++++++++++++++++++++++++
 3 files changed, 536 insertions(+)
 create mode 100644 configs/arm64/imx8qm-ivshmem-demo.c
 create mode 100644 configs/arm64/imx8qm-linux-demo.c
 create mode 100644 configs/arm64/imx8qm.c

diff --git a/configs/arm64/imx8qm-ivshmem-demo.c b/configs/arm64/imx8qm-ivshmem-demo.c
new file mode 100644
index 00000000..2bfe88d5
--- /dev/null
+++ b/configs/arm64/imx8qm-ivshmem-demo.c
@@ -0,0 +1,124 @@
+/*
+ * iMX8QM target - ivshmem-demo
+ *
+ * Copyright 2020 NXP
+ *
+ * Authors:
+ *  Peng Fan <peng.fan@nxp.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <jailhouse/types.h>
+#include <jailhouse/cell-config.h>
+
+struct {
+	struct jailhouse_cell_desc cell;
+	__u64 cpus[1];
+	struct jailhouse_memory mem_regions[8];
+	struct jailhouse_irqchip irqchips[1];
+	struct jailhouse_pci_device pci_devices[1];
+} __attribute__((packed)) config = {
+	.cell = {
+		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.name = "ivshmem-demo",
+		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
+
+		.cpu_set_size = sizeof(config.cpus),
+		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+		.num_irqchips = ARRAY_SIZE(config.irqchips),
+		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+		.vpci_irq_base = 90, /* Not include 32 base */
+
+		.console = {
+			.address = 0x5a060000,
+			.type = JAILHOUSE_CON_TYPE_IMX_LPUART,
+			.flags = JAILHOUSE_CON_ACCESS_MMIO |
+				 JAILHOUSE_CON_REGDIST_4,
+		},
+	},
+
+	.cpus = {
+		0x8,
+	},
+
+	.mem_regions = {
+		/* IVHSMEM shared memory region for 00:00.0 (demo )*/ {
+			.phys_start = 0xfd900000,
+			.virt_start = 0xfd900000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xfd901000,
+			.virt_start = 0xfd901000,
+			.size = 0x9000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xfd90a000,
+			.virt_start = 0xfd90a000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xfd90c000,
+			.virt_start = 0xfd90c000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xfd90e000,
+			.virt_start = 0xfd90e000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* UART1 */ {
+			.phys_start = 0x5a060000,
+			.virt_start = 0x5a060000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* RAM: from Inmate memory of imx8qm.c */ {
+			.phys_start = 0xdf700000,
+			.virt_start = 0,
+			.size = 0x00010000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
+		},
+		/* communication region */ {
+			.virt_start = 0x80000000,
+			.size = 0x00001000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_COMM_REGION,
+		},
+	},
+
+	.irqchips = {
+		/* GIC */ {
+			.address = 0x51a00000,
+			.pin_base = 96,
+			.pin_bitmap = {
+				0x1 << (90 + 32 - 96) /* irq 122 */
+			},
+		},
+	},
+
+	.pci_devices = {
+		{ /* IVSHMEM 00:00.0 (demo) */
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 0,
+			.bdf = 0 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 0,
+			.shmem_dev_id = 1,
+			.shmem_peers = 1,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
+		},
+	},
+};
diff --git a/configs/arm64/imx8qm-linux-demo.c b/configs/arm64/imx8qm-linux-demo.c
new file mode 100644
index 00000000..f13ca7bc
--- /dev/null
+++ b/configs/arm64/imx8qm-linux-demo.c
@@ -0,0 +1,199 @@
+/*
+ * iMX8QM target - linux-demo
+ *
+ * Copyright 2020 NXP
+ *
+ * Authors:
+ *  Peng Fan <peng.fan@nxp.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <jailhouse/types.h>
+#include <jailhouse/cell-config.h>
+
+struct {
+	struct jailhouse_cell_desc cell;
+	__u64 cpus[1];
+	struct jailhouse_memory mem_regions[18];
+	struct jailhouse_irqchip irqchips[4];
+	struct jailhouse_pci_device pci_devices[2];
+	__u32 stream_ids[1];
+} __attribute__((packed)) config = {
+	.cell = {
+		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.name = "imx8qm-linux-demo",
+		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
+
+		.cpu_set_size = sizeof(config.cpus),
+		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+		.num_stream_ids = ARRAY_SIZE(config.stream_ids),
+		.num_irqchips = ARRAY_SIZE(config.irqchips),
+		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+		.vpci_irq_base = 124, /* Not include 32 base */
+	},
+
+	.cpus = {
+		0xc,
+	},
+
+	.mem_regions = {
+		/* IVHSMEM shared memory region for 00:00.0 (demo )*/ {
+			.phys_start = 0xfd900000,
+			.virt_start = 0xfd900000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xfd901000,
+			.virt_start = 0xfd901000,
+			.size = 0x9000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xfd90a000,
+			.virt_start = 0xfd90a000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xfd90c000,
+			.virt_start = 0xfd90c000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xfd90e000,
+			.virt_start = 0xfd90e000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* IVSHMEM shared memory regions for 00:01.0 (networking) */
+		JAILHOUSE_SHMEM_NET_REGIONS(0xfda00000, 1),
+		/* UART0 earlycon */ {
+			.phys_start = 0x5a060000,
+			.virt_start = 0x5a060000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* UART2*/ {
+			.phys_start = 0x5a080000,
+			.virt_start = 0x5a080000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* UART2_LPCG*/ {
+			.phys_start = 0x5a480000,
+			.virt_start = 0x5a480000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* SHDC0 */ {
+			.phys_start = 0x5b010000,
+			.virt_start = 0x5b010000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* SHDC0_LPCG */ {
+			.phys_start = 0x5b200000,
+			.virt_start = 0x5b200000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* MU2 */ {
+			.phys_start = 0x5d1d0000,
+			.virt_start = 0x5d1d0000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* RAM: Top at 4GB Space */ {
+			.phys_start = 0xdf700000,
+			.virt_start = 0xdf700000,
+			.size = 0x1e000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
+				JAILHOUSE_MEM_LOADABLE,
+		},
+		/* RAM: Bottom at 4GB Space */ {
+			.phys_start = 0xfdb00000,
+			.virt_start = 0,
+			.size = 0x10000, /* 64KB */
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
+		},
+		/* communication region */ {
+			.virt_start = 0x80000000,
+			.size = 0x00001000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_COMM_REGION,
+		},
+	},
+
+	.irqchips = {
+		/* IVSHMEM */ {
+			.address = 0x51a00000,
+			.pin_base = 128,
+			.pin_bitmap = {
+				0xf << (124 + 32 - 128)
+			},
+		},
+		/* MU2_A */ {
+			.address = 0x51a00000,
+			.pin_base = 192,
+			.pin_bitmap = {
+				(1 << (178 + 32 - 192))
+			},
+		},
+		/* sdhc1 */ {
+			.address = 0x51a00000,
+			.pin_base = 256,
+			.pin_bitmap = {
+				(1 << (232 + 32 - 256))
+			},
+		},
+		/* lpuart2 */ {
+			.address = 0x51a00000,
+			.pin_base = 352,
+			.pin_bitmap = {
+				(1 << (347 + 32 - 352))
+			},
+		},
+	},
+
+	.pci_devices = {
+		{ /* IVSHMEM 00:00.0 (demo) */
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 0,
+			.bdf = 0 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 0,
+			.shmem_dev_id = 2,
+			.shmem_peers = 3,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
+		},
+		{ /* IVSHMEM 00:01.0 (networking) */
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 0,
+			.bdf = 1 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 5,
+			.shmem_dev_id = 1,
+			.shmem_peers = 2,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
+		},
+	},
+
+	.stream_ids = {
+		0x10,
+	},
+};
diff --git a/configs/arm64/imx8qm.c b/configs/arm64/imx8qm.c
new file mode 100644
index 00000000..20451cf5
--- /dev/null
+++ b/configs/arm64/imx8qm.c
@@ -0,0 +1,213 @@
+/*
+ * i.MX8QM Target
+ *
+ * Copyright 2020 NXP
+ *
+ * Authors:
+ *  Peng Fan <peng.fan@nxp.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <jailhouse/types.h>
+#include <jailhouse/cell-config.h>
+
+struct {
+	struct jailhouse_system header;
+	__u64 cpus[1];
+	struct jailhouse_memory mem_regions[15];
+	struct jailhouse_irqchip irqchips[3];
+	struct jailhouse_pci_device pci_devices[2];
+	__u32 stream_ids[3];
+} __attribute__((packed)) config = {
+	.header = {
+		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
+		.hypervisor_memory = {
+			.phys_start = 0xfdc00000,
+			.size =       0x00400000,
+		},
+		.debug_console = {
+			.address = 0x5a060000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_CON_TYPE_IMX_LPUART |
+				 JAILHOUSE_CON_ACCESS_MMIO |
+				 JAILHOUSE_CON_REGDIST_4,
+			.type = JAILHOUSE_CON_TYPE_IMX_LPUART,
+		},
+		.platform_info = {
+			/*
+			 * .pci_mmconfig_base is fixed; if you change it,
+			 * update the value in mach.h
+			 * (PCI_CFG_BASE) and regenerate the inmate library
+			 */
+			.pci_mmconfig_base = 0xfd700000,
+			.pci_mmconfig_end_bus = 0x0,
+			.pci_is_virtual = 1,
+			.pci_domain = 0,
+
+			.iommu_units = {
+				{
+					.type = JAILHOUSE_IOMMU_ARM_MMU500,
+					.base = 0x51400000,
+					.size = 0x40000,
+					.arm_sid_mask = 0x7f80,
+				},
+			},
+
+			.arm = {
+				.gic_version = 3,
+				.gicd_base = 0x51a00000,
+				.gicr_base = 0x51b00000,
+				.maintenance_irq = 25,
+			},
+		},
+
+		.root_cell = {
+			.name = "imx8qm",
+
+			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+			.cpu_set_size = sizeof(config.cpus),
+			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+			.num_stream_ids = ARRAY_SIZE(config.stream_ids),
+			.num_irqchips = ARRAY_SIZE(config.irqchips),
+			/*
+			 * vpci_irq_base not include base 32
+			 */
+			.vpci_irq_base = 53,
+		},
+	},
+
+	.cpus = {
+		0x3f,
+	},
+
+	.mem_regions = {
+		/* IVHSMEM shared memory region for 00:00.0 (demo )*/ {
+			.phys_start = 0xfd900000,
+			.virt_start = 0xfd900000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		{
+			.phys_start = 0xfd901000,
+			.virt_start = 0xfd901000,
+			.size = 0x9000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE ,
+		},
+		{
+			.phys_start = 0xfd90a000,
+			.virt_start = 0xfd90a000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE ,
+		},
+		{
+			.phys_start = 0xfd90c000,
+			.virt_start = 0xfd90c000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		{
+			.phys_start = 0xfd90e000,
+			.virt_start = 0xfd90e000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		/* IVSHMEM shared memory regions for 00:01.0 (networking) */
+		JAILHOUSE_SHMEM_NET_REGIONS(0xfda00000, 0),
+		/* MMIO (permissive): TODO: refine the map */ {
+			.phys_start = 0x00000000,
+			.virt_start = 0x00000000,
+			.size =	      0x80000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+
+		/* RAM */ {
+			.phys_start = 0x80200000,
+			.virt_start = 0x80200000,
+			.size = 0x5f500000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+		/* Inmate memory */ {
+			.phys_start = 0xdf700000,
+			.virt_start = 0xdf700000,
+			.size = 0x1e000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		/* Loader */{
+			.phys_start = 0xfdb00000,
+			.virt_start = 0xfdb00000,
+			.size = 0x100000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+		/* OP-TEE reserved memory */{
+			.phys_start = 0xfe000000,
+			.virt_start = 0xfe000000,
+			.size = 0x2000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		/* RAM2 */ {
+			.phys_start = 0x880000000,
+			.virt_start = 0x880000000,
+			.size = 0x100000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+	},
+
+	.irqchips = {
+		/* GIC */ {
+			.address = 0x51a00000,
+			.pin_base = 32,
+			.pin_bitmap = {
+				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
+			},
+		},
+		/* GIC */ {
+			.address = 0x51a00000,
+			.pin_base = 160,
+			.pin_bitmap = {
+				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
+			},
+		},
+		/* GIC */ {
+			.address = 0x51a00000,
+			.pin_base = 288,
+			.pin_bitmap = {
+				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
+			},
+		},
+	},
+
+	.pci_devices = {
+		{ /* IVSHMEM 0000:00:00.0 (demo) */
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 0,
+			.bdf = 0 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 0,
+			.shmem_dev_id = 0,
+			.shmem_peers = 3,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
+		},
+		{ /* IVSHMEM 0000:00:01.0 (networking) */
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 0,
+			.bdf = 1 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 5,
+			.shmem_dev_id = 0,
+			.shmem_peers = 2,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
+		},
+	},
+
+	.stream_ids = {
+		0x11, 0x12, 0x13,
+	},
+};
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200917040554.4599-5-alice.guo%40nxp.com.
