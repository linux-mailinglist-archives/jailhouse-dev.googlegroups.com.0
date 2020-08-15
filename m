Return-Path: <jailhouse-dev+bncBDEN32754MOBBUX73H4QKGQENHQUBGA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13e.google.com (mail-lf1-x13e.google.com [IPv6:2a00:1450:4864:20::13e])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE5C2449A6
	for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Aug 2020 14:13:07 +0200 (CEST)
Received: by mail-lf1-x13e.google.com with SMTP id w138sf1961071lff.22
        for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Aug 2020 05:13:07 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1597407187; cv=pass;
        d=google.com; s=arc-20160816;
        b=MtB1YuwMf8e0/OdErmCxtZeZmwqu0nWXD0PwsxYIb7kcOvPzRBpmVVXSGFz8RVYjvb
         FUUaOkhk93P5sEMrJz2lYCMIsvK6Z73trFOW8+wFCZ26Usu+oO8cmadhdurPdUqKM6Gr
         f/DdMIa4/tjjxrOGA53yPvDXsN0eSLP55JesV4CV0dK3FJazZkFptIhEZV8wXJIDbHIL
         4ICkwRfl9OC6bkHYPZQvxy1e9o7gKIGqfBD1RG3Pv4NpBfw3IzL3ln1ydJeSWYwT4yws
         erKLIWJVeMGh6BYqw6XNHwM+FJFt8XRr94Pxznosufpr0dS7kGNmCpqIRWgEGv0bV5wY
         lb8w==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=hX56+ZZemS+H/yXJX0IDoBLl4G1J5ozK4+8yseaTCug=;
        b=BZTGQv9vPWVUFSpNsAV3/8GTnE54SouKiUlQ9mTWo1htmHpn74SpeYJMAQjjJsd0zG
         bLRAPI8t/eeewl2KkuQw906O9RB4V12awuGddq+edt7iv004Dkl0G2FzSyv2pLXVgNr6
         3wCfAsQuxfvgDfnLtTShVl4U9et40p6BjgZOTNhyXRr8WN1wjgQrYw7DWT9dKZSlIhI4
         SFCMm60MqfiTfHF++k/pw3pwnN/pKCQ5yaLhwWbnIdJM80W/BvXJ5B29LsRjhx6auJH8
         C8F9Uqh3WRjoq9mbMl6y1Upcq6wmJ4yVE8rHQegjaJ/bJdiPiQk9x9W9I3dN6jaAKtDA
         zeQQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=OOX41s6q;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.8.42 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=hX56+ZZemS+H/yXJX0IDoBLl4G1J5ozK4+8yseaTCug=;
        b=T46IMOgvCLVwn0Kfr5AxcUntL7aF4TUmYJ4Ox63PwvB5H4jXFpXscjnfEG77S6jfd8
         5apOQn81ciSQSlJ0dIYoTvZCdQpoWZmnQfHZMBazNg/BevMhX9fDPxzmHGCNvjUEsFlW
         cLVjG/1OAzVa43cJtavMBYA8CUgsXFR3iaXMY3OgywBeq8OIcDqvWc3WQhQ+748WlLn/
         kRHKZUWOpe/z3u8JhIhJ6AnfXl4pNlBbinCecDIM0ME/jgWk6rm15UBc5nCL2q75FCYh
         xTEsWSYCtGMcwILBf9jvUoQdNpeBg9WvL1rBrEsHf4Xna+3jOVn9E9aWQGsa2MmAZvWx
         xX8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=hX56+ZZemS+H/yXJX0IDoBLl4G1J5ozK4+8yseaTCug=;
        b=Q+RLOR08T5VnpkSZtKyY8HhFdeObq4OcMdh6p0b7k3mrTLu7KtJy6k7fbtyEONaF0s
         Flda+3d8vbrBf9vJwh7ZpvS8raOMV+ungIPUCZdXs8oc9DPAshBq6O2SXDRbrVduEemB
         6z9n331pq2KXN/PGxGYXAzEGTxuQmsgSiHFmjT+MWur1t2HezOsmIP5al39G9GC314Bt
         K7NEBSZIC+4BIRiD+96uqdouiSuP/UvvNz0onAw/6/wyF+dhN1pOk05vdrRnVRKONYMw
         G4iv4L+AMN9QePUKnSa+hAm+dNJhyV1EsjLB05SGwklxyK2WgC5z1+76XqXufQ7H4gZh
         pOCg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530oB0WqydJSh6AvbxCSPA26XQlvOWj0w/sD+KKvPrWrIrU7+YT2
	KMeYY5JZ3SLwJ7oNa/3qDxk=
X-Google-Smtp-Source: ABdhPJxzrmK4VNZ1zqvey86v2UQpD/UXTc+W0UO0uD4965AgLIUBAID3sW/PWPDvB+T3MiLvjZf+Jg==
X-Received: by 2002:a2e:9111:: with SMTP id m17mr1303425ljg.263.1597407187055;
        Fri, 14 Aug 2020 05:13:07 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:8994:: with SMTP id c20ls1719729lji.0.gmail; Fri, 14 Aug
 2020 05:13:06 -0700 (PDT)
X-Received: by 2002:a2e:9396:: with SMTP id g22mr1284017ljh.446.1597407186346;
        Fri, 14 Aug 2020 05:13:06 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597407186; cv=pass;
        d=google.com; s=arc-20160816;
        b=PmMFOSWKmtG3wpJ9G0piZATjtZLoRGFAWxb5nu1YYpJtIcbRIFcZ0Ox09mquPXd+SM
         oOlFYRlc+Bsih48XGc0XDA1HJptq2z2fNHEorj4JWsJ6ePKOjOU9K5A52ZAS/NUEWb9O
         d+ct+mzL2Z4iswdAvJqTBuIdV9o6kWXZ4V53HY8/mCXXMC8Kbf4EWf8MEe91ReIPuuuV
         LTev2ctF3h9fRDO91JTyIGgoPhogAPJDwU80NKejZLsoPDJcceEDZioyVzdIymbZg//g
         uQ58e5dFL6NAn+UnZ2PjPpd5GzBWe11j16jtP0P9IvbVyLDwGmo0NhsXfzZvz4QMmswM
         ByMA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=IN644hnL91HKn5DdE9e0txQJc97/KGt5TfSIHgNf4JU=;
        b=H5a10O187cWkxGvpMNwd3W8vQu+Hju4BWJBraJWWCidu0+S36fuSczdD5EpetbzMYx
         HwruhbkMQ/i8nXlT9ae3mbnikLOC8pzMFPlvEX54S7qiiOkFxT9S7GPEoM9QGSWVMlvU
         E30M73XDbR8AMhU/M8ZRI4u0HDu490L3gDiM6N9iSu0FEAKd0K4Tvs9IigTjSFOFlGWZ
         HHyPZcHu3c4VAKVzsKnv1JUWObZ3f2mQ7Dy67yhbgwM3n7blRwb3B4kdVW3foAavl78w
         geLC7lwDddOqFtwypAgxZ0KBV9Uo6rij6abg6D0OhNqmFUkHo/By/Y+xTB1BqTP/gX3X
         Jmtw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=OOX41s6q;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.8.42 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80042.outbound.protection.outlook.com. [40.107.8.42])
        by gmr-mx.google.com with ESMTPS id f16si270426ljk.5.2020.08.14.05.13.06
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Aug 2020 05:13:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of alice.guo@nxp.com designates 40.107.8.42 as permitted sender) client-ip=40.107.8.42;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rtwqagt0IJvU5I1x0OUxn1PrqCI3UGMrEF2jlEtqQ9o4ctqmHghjQ2ZNL1cbssUjC/dLDNcjMO7wC14pKQrjgSMKxPQ8wExZLzQd3kMUb1jfytmMInJ4trpaL5Zy7wYsP9DyREaEodLAqfQcQeUhQfOgIjd3LiYTJ77gi8Vfw92gsBaLdy1WVSaVIjliAByBebFwmrQcBc2UkyObICE3pF0vNwmdkApBkewyNQVyjwkqMb4+5qT1EUQdcsKOiB576lg79iMu6hNVQSi1FlAeX5O4lVrn5kVE7bceSYi83v2jU+AdCcLfq6gIFCDk56AXgtGf92A1D7geGX76lmY46w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IN644hnL91HKn5DdE9e0txQJc97/KGt5TfSIHgNf4JU=;
 b=Yu2DIikuwD238rnp74I1rAkdpo8NEvI3cy7AYwrej1bKb3w46JmcZ9y2YqBAVn/Hry5SX64NugC965tm2t/J7grlhA/ES/lqJu2fkplLiSzXRjbIrF3RcJJPq8u7Ji8hOUTUKfJXg+1ir5OquQeKQqnSajWkEHDI/2dWilxZdoEqQ5LOA91e6uDbJJ3kgdpr79BTbpXK2ivPuiHxl91OHmlQSbqmFNZ1HizrF8UTURYn6V3HE8ejI/cr7J/qnalMBogxev5+B85g+sdMBGuehoz6E+hqnkSUqiO/88sG+A61APuXuG7N5f2PdtiktEwwdHXoLl3BK3YcDcblc2ZDJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com (2603:10a6:10:127::9)
 by DB7PR04MB4730.eurprd04.prod.outlook.com (2603:10a6:10:1c::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.20; Fri, 14 Aug
 2020 12:13:04 +0000
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::5042:d7a1:10c0:c40e]) by DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::5042:d7a1:10c0:c40e%6]) with mapi id 15.20.3283.018; Fri, 14 Aug 2020
 12:13:04 +0000
From: Alice Guo <alice.guo@nxp.com>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Cc: peng.fan@nxp.com,
	Alice Guo <alice.guo@nxp.com>
Subject: [PATCH V2 4/4] configs: arm64: imx8dxl: add cell configuration files
Date: Sun, 16 Aug 2020 03:09:49 +0800
Message-Id: <20200815190949.6837-4-alice.guo@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200815190949.6837-1-alice.guo@nxp.com>
References: <20200815190949.6837-1-alice.guo@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: AM0PR08CA0001.eurprd08.prod.outlook.com
 (2603:10a6:208:d2::14) To DB8PR04MB7065.eurprd04.prod.outlook.com
 (2603:10a6:10:127::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nxf55104-OptiPlex-7060.ap.freescale.net (119.31.174.71) by AM0PR08CA0001.eurprd08.prod.outlook.com (2603:10a6:208:d2::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15 via Frontend Transport; Fri, 14 Aug 2020 12:13:02 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ffe52c29-aed5-4910-7d4f-08d8404b6560
X-MS-TrafficTypeDiagnostic: DB7PR04MB4730:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB473056D7BE3F7B6B6BB60DD9E2400@DB7PR04MB4730.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s94Vk5VyR6svf8QP1VpVltdK2sWP3VwXn3tA+anozBnu+feEk/WgFU7qkvosKVrQLH42A1zq1sa9QwirbR6ZjRJiOOW+SZ+iqxsRCvdC1Cbr34SA7fT+iQ7Qs+2OhyxmNUz1opYQV6thDCgjbesj+stGYRFIWLBzbzGAUCRtWobz+TF+6PoUNvyppaPZybahVbu2p/eRJpDAdpVwY5CkuzL+X4EKaerFqATiK+8rbHVUr9GvcqGtKhI2RHiEyN4JFrDzC4K3bPXuLADn3BX4u70CsWBaLfHKi7YN4zC2XXrLxuEabmYLGpW5Lp9E8dssXFWrL/OdSrmdakA0bb34Dov7bezn0jOMXAvQPzuRDWlhDdKwjvGfD++Awb9yooyt
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB7065.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(366004)(136003)(39860400002)(8936002)(6506007)(2906002)(6486002)(83380400001)(16526019)(26005)(186003)(66946007)(44832011)(6512007)(52116002)(8676002)(478600001)(1076003)(5660300002)(66556008)(36756003)(6666004)(4326008)(86362001)(316002)(2616005)(956004)(66476007)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: peYUoWQBaBRUa79z3+vvTr9nocV9iTpsjbJNsjMyAFGivBc+WU+n4Kj4J38XsJBPBzZ/2JjGF1cu6yNHL6HJTvixaiHwisbHdc9q7nNJtAMlLlCa930RKy9LtK3WoC9b4qMvncB+p2a9L2lc6J+VkKTDZORpohhoGTBUhaVFSAbnLtJgSONwNUSVuzLhODC26xNcGN8GGNqpF8wfVadSilqlto9USwO9HtuYlXzs46eUd/lNyCDhLXSuELpv+RGkU/WPtHVmpw65LjyC5us41B7kNz0OkMKXzZdKqZ0bPAL/LPh7SjNRkrFC+lAjw9AoRG6CZe3fBjOx6sjuRIAYzDv0dPGV87ftsKf8nTY7cJtjo/LESmfJ4FmvQejEXRqE0CiY1SK14I48NqTrDY2vkm7yNTPViH3ClBVsPGr4XhzBP5+vqAZ76sgFnQzU4wz4BqHh63AueWYe4TTn1/b66TPrpDwgVckrq14yDBN0VaV51rd+JYWxewt+nk2xGrijrhfUJ5x5P9MrzXDmxRY1rbKL92sMwzi0jJDyfolAC2JFu12Tt19ATqnWX9+KZqy9ACKhGH8aeVR1BagTX9slz3mwgKSdNSJiXS08MmEdsnGLeClvcFRzL292lJ0BqQlKrT7w2SIlyy2ptQOyEIvE/A==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffe52c29-aed5-4910-7d4f-08d8404b6560
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7065.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2020 12:13:04.6794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xwnRsiBnPXniK0hMoyo62ep9aD09yg3bi3aR/pdFwJvqbfDVPoQ//00uqEXt/7GYYvhboaNx6IqPODf6l55w1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4730
X-Original-Sender: alice.guo@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=OOX41s6q;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of alice.guo@nxp.com
 designates 40.107.8.42 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
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

Add imx8dxl-gic-demo-aarch32.c to support AArch32 VM on the imx8dxl
platform. Distinguish whether it is AArch32 inmate cell by the macro
JAILHOUSE_CELL_AARCH32.

Add "imx8dxl-gic-demo-aarch64.c" for AArch64 VM.

"imx8dxl.c" is used for the root cell.

Signed-off-by: Alice Guo <alice.guo@nxp.com>
---
 configs/arm64/imx8dxl-gic-demo-aarch32.c |  64 +++++++++
 configs/arm64/imx8dxl-gic-demo-aarch64.c |  64 +++++++++
 configs/arm64/imx8dxl.c                  | 173 +++++++++++++++++++++++
 3 files changed, 301 insertions(+)
 create mode 100644 configs/arm64/imx8dxl-gic-demo-aarch32.c
 create mode 100644 configs/arm64/imx8dxl-gic-demo-aarch64.c
 create mode 100644 configs/arm64/imx8dxl.c

diff --git a/configs/arm64/imx8dxl-gic-demo-aarch32.c b/configs/arm64/imx8dxl-gic-demo-aarch32.c
new file mode 100644
index 00000000..80dbd366
--- /dev/null
+++ b/configs/arm64/imx8dxl-gic-demo-aarch32.c
@@ -0,0 +1,64 @@
+/*
+ * iMX8DXL target - gic-demo
+ *
+ * Copyright 2020 NXP
+ *
+ * Authors:
+ *  Alice Guo <alice.guo@nxp.com>
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
+	struct jailhouse_memory mem_regions[3];
+} __attribute__((packed)) config = {
+	.cell = {
+		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.name = "gic-demo-aarch32",
+		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG | JAILHOUSE_CELL_AARCH32,
+		.cpu_set_size = sizeof(config.cpus),
+		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+		.num_irqchips = 0,
+		.num_pci_devices = 0,
+		.console = {
+			.address = 0x5a060000,
+			.type = JAILHOUSE_CON_TYPE_IMX_LPUART,
+			.flags = JAILHOUSE_CON_ACCESS_MMIO |
+				 JAILHOUSE_CON_REGDIST_4,
+		},
+	},
+
+	.cpus = {
+		0x2,
+	},
+
+	.mem_regions = {
+		/* UART1 */ {
+			.phys_start = 0x5a060000,
+			.virt_start = 0x5a060000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* RAM: Top at 4GB Space */ {
+			.phys_start = 0xa1700000,
+			.virt_start = 0,
+			.size = 0x00100000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
+		},
+		/* communication region */ {
+			.virt_start = 0x80000000,
+			.size = 0x00001000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_COMM_REGION,
+		},
+	}
+};
diff --git a/configs/arm64/imx8dxl-gic-demo-aarch64.c b/configs/arm64/imx8dxl-gic-demo-aarch64.c
new file mode 100644
index 00000000..88d436fe
--- /dev/null
+++ b/configs/arm64/imx8dxl-gic-demo-aarch64.c
@@ -0,0 +1,64 @@
+/*
+ * iMX8DXL target - gic-demo
+ *
+ * Copyright 2020 NXP
+ *
+ * Authors:
+ *  Alice Guo <alice.guo@nxp.com>
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
+	struct jailhouse_memory mem_regions[3];
+} __attribute__((packed)) config = {
+	.cell = {
+		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.name = "gic-demo",
+		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
+		.cpu_set_size = sizeof(config.cpus),
+		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+		.num_irqchips = 0,
+		.num_pci_devices = 0,
+		.console = {
+			.address = 0x5a060000,
+			.type = JAILHOUSE_CON_TYPE_IMX_LPUART,
+			.flags = JAILHOUSE_CON_ACCESS_MMIO |
+				 JAILHOUSE_CON_REGDIST_4,
+		},
+	},
+
+	.cpus = {
+		0x2,
+	},
+
+	.mem_regions = {
+		/* UART1 */ {
+			.phys_start = 0x5a060000,
+			.virt_start = 0x5a060000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* RAM: Top at 4GB Space */ {
+			.phys_start = 0xa1700000,
+			.virt_start = 0,
+			.size = 0x00100000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
+		},
+		/* communication region */ {
+			.virt_start = 0x80000000,
+			.size = 0x00001000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_COMM_REGION,
+		},
+	}
+};
diff --git a/configs/arm64/imx8dxl.c b/configs/arm64/imx8dxl.c
new file mode 100644
index 00000000..f94692bc
--- /dev/null
+++ b/configs/arm64/imx8dxl.c
@@ -0,0 +1,173 @@
+/*
+ * i.MX8DXL Target
+ *
+ * Copyright 2020 NXP
+ *
+ * Authors:
+ *  Alice Guo <alice.guo@nxp.com>
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
+} __attribute__((packed)) config = {
+	.header = {
+		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
+		.hypervisor_memory = {
+			.phys_start = 0xbfc00000,
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
+			.pci_mmconfig_base = 0xbf700000,
+			.pci_mmconfig_end_bus = 0x0,
+			.pci_is_virtual = 1,
+			.pci_domain = 0,
+			.arm = {
+				.gic_version = 3,
+				.gicd_base = 0x51a00000,
+				.gicr_base = 0x51b00000,
+				.maintenance_irq = 25,
+			},
+		},
+		.root_cell = {
+			.name = "imx8dxl",
+			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+			.cpu_set_size = sizeof(config.cpus),
+			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+			.num_irqchips = ARRAY_SIZE(config.irqchips),
+			.vpci_irq_base = 2, /* Not include 32 base */
+		},
+	},
+
+	.cpus = {
+		0x3,
+	},
+
+	.mem_regions = {
+		/* IVHSMEM shared memory region for 00:00.0 (demo )*/ {
+			.phys_start = 0xbf900000,
+			.virt_start = 0xbf900000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		{
+			.phys_start = 0xbf901000,
+			.virt_start = 0xbf901000,
+			.size = 0x9000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE ,
+		},
+		{
+			.phys_start = 0xbf90a000,
+			.virt_start = 0xbf90a000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE ,
+		},
+		{
+			.phys_start = 0xbf90c000,
+			.virt_start = 0xbf90c000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		{
+			.phys_start = 0xbf90e000,
+			.virt_start = 0xbf90e000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		/* IVSHMEM shared memory regions for 00:01.0 (networking) */
+		JAILHOUSE_SHMEM_NET_REGIONS(0xbfa00000, 0),
+		/* MMIO (permissive): TODO: refine the map */ {
+			.phys_start = 0x00000000,
+			.virt_start = 0x00000000,
+			.size =	      0x80000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* RAM */ {
+			.phys_start = 0x80200000,
+			.virt_start = 0x80200000,
+			.size = 0x21d00000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+		/* Inmate memory */{
+			.phys_start = 0xa1700000,
+			.virt_start = 0xa1700000,
+			.size = 0x1e000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		/* Loader */{
+			.phys_start = 0xbfb00000,
+			.virt_start = 0xbfb00000,
+			.size = 0x100000,
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
+};
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200815190949.6837-4-alice.guo%40nxp.com.
