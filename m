Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBWMK7H4QKGQED5OKHHA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id E473C24B31F
	for <lists+jailhouse-dev@lfdr.de>; Thu, 20 Aug 2020 11:41:45 +0200 (CEST)
Received: by mail-wr1-x43a.google.com with SMTP id o10sf452790wrs.21
        for <lists+jailhouse-dev@lfdr.de>; Thu, 20 Aug 2020 02:41:45 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1597916505; cv=pass;
        d=google.com; s=arc-20160816;
        b=G/GvBy1aN8P5Bek2WYY6vDT9BwDWbZ4Fz5PIsxk67xmiwvsthnR/tJRMfh+9LAmxzT
         rEwX4djsfasu4hH0lQLKt6CUYKvmnX0uJRsgYx6fimh8zawPTnLX9W8BSE0aaJey7Rk2
         feG5btHlR7IVvOI2bwZ74zYsBCE0nZm32jfWn/QbY/IdxP2wK9nEDcRPJymrDIZq51Q0
         6kpSitKAhwUuvcROhtLo1TQl8kupJ6YMkL8gd8ZJywWGH76BUWeVVF8Cw4E7PyzZRK8X
         JK4yUW4Rq4GsAuC4DhiNlpjJukdGUPISEKyNstjE6OtGTMQ2zNRILydrlfp0DnAE9PW3
         hlYQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=E8g5Te8df4OJQAZ7M33WjX6IgYr4Ikhw1zYykOS+Ilo=;
        b=NQOhExI1Pn8+yIfUWZZgpu5gkHfPKOUIuiJ2Uc74hHiD9uvR1sJGfN4+6xL8bJnTZe
         w6dEAOg3KrRXnU61GxOj0Fk2+m0qZOhso81aZgReAzt8D7ODddup8x+OX5FVX1HH1ogD
         NztmHpyiI2GVQgqDo3IGf389dCkRFODfcUp99tl1Xde+hUJU8lHHmihke3zl2ir0Cvex
         XIch8ljHLUN6N5yvS+hmwTq+vEtMOUPsV+pxw9jDNYLVvwCdnmumSrDFUEMg/7wUh6Bi
         p9UPbzhqCSinGhAbFZv61sXGgj4Y8DV1yYusVV5eUCeekChN9lbONcUQ5cwQklsMVfwq
         5hTQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=gVGGglFc;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.3.55 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=E8g5Te8df4OJQAZ7M33WjX6IgYr4Ikhw1zYykOS+Ilo=;
        b=rLQ5+cV4PtQ3fVRnfutlm20U8/MQcYtjHVxqjT7BWvBzNMEZEjeGg5YQYRf0q2FDK5
         TaeapNeRtIULNZWkRB/FUgUnXE1RmwzIgnrQsAo+fTg2V2vuq8w2mBwTVJr16caGobNq
         xdpQzINPaL9AiCAjMl74wmc50ee7fELYDHdsx8oNBwRlWv8cJ6W80ToxvbcgXBGJvtnN
         K0fepvPBS4leJni/tUa/Dz8AKvLPMAM6/GLP7n69a9iPVOenfHiVU+5wMbRB6oIsvM+R
         XsRU33u96xGIuc08QIvqKllGbq4PZ3BcY+Rss25bhwp4gXJAVcpCILAvOhFKqPYM2cwm
         5V3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=E8g5Te8df4OJQAZ7M33WjX6IgYr4Ikhw1zYykOS+Ilo=;
        b=DFJCrrv6TOG7lQP2+iWFnIX01MRA+MszLQR7ayx8gBSoC0VL8fdzgMn8/vYlp7hTAV
         FpphBOQ00mDFbzlaFOCWvSTd2J/txbe/MR8z0UO7h7ywAtgxvaPHXbE7FAaaFDvIw3jw
         Ic8/RITDu+ef5HNBntnltlCUD5z/JDXJS++4B1r5r/8oh09NHOKeo+tJovdoihfXt5aQ
         80rfZBFBDDPNNSt61A98ReWNuNgZfQu3vQd6sy6xSqUvsbTAKmn73T9iOU4pVL3SY0S9
         Usvo0neerpouNOLC6WUgq/9UXdLHFh1FroG9kD9qsmYQB2Rgq8ROQIYu+BlyRDnaZGyj
         MfLA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531qwy/mVFh99FNhoBRtA9Wd9G/E9WPZCTRE3Bqfz1MowKyrOOUR
	lCMLIE7ArXfDLKzPxjVCkys=
X-Google-Smtp-Source: ABdhPJz3Pu9EEcEbE3wjlcYqb3RlrCNm/NoHrf6bgU8JQgDI8Z2z73NESmVft65XDDTFPEMe+5Uk3g==
X-Received: by 2002:a7b:cf22:: with SMTP id m2mr2776171wmg.46.1597916505641;
        Thu, 20 Aug 2020 02:41:45 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:81f4:: with SMTP id 107ls1679118wra.2.gmail; Thu, 20 Aug
 2020 02:41:44 -0700 (PDT)
X-Received: by 2002:a5d:4ad1:: with SMTP id y17mr2485636wrs.132.1597916504641;
        Thu, 20 Aug 2020 02:41:44 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597916504; cv=pass;
        d=google.com; s=arc-20160816;
        b=SyPYEsI2Ecn+sgC0Gpeo1k6c6PXSKf14yMx39i/gxa3RA96Bop5qygiI+XjAG6P5s3
         oA97K1Lpd5wbP24ejk1U4cIl/A28jsOytNQUb/8qpNI8dLjB9qI6+ZoCke3HZlibIuZB
         iqYjGRVF/81cK9MkHmct5NMuCdnq8W/jrWNnTVhWJcv7/KVwOpbqzjiH7jPM/3fiNeHV
         HMrSgLJb0h9/eFeNThgUypkeK2obkB+9vbpE7I8KUzw0SkjYvKj7lqLoqMuqCZl90BOW
         eOBYWnXr85pFSufTPI/BmTt7M+nmNhcmRMpD3liHq7I4/szGATmfoAJvPy3tfJBYw340
         quXA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=8Z0frBPoR1g64gI7ArQBUN6uFfV4k+RIkIMJDdID7GI=;
        b=ZpWsk4Ny3DXVjTHuuzqdaujzSMJNfxXqUyow/OVKSGIaoUR9uz1t96uKE+jiCDxBYN
         XeI5ggunSliCtFmsEsqhWqRoJ3eDL7em6ncmeUVvAXxON44YD9UA4saP3AqF8f3wv/h3
         GYBSrlT/bet9O7yHgfEM092aulh6e9l+0sJMH1H+b9OOFMyYPqDloeXKAQf9+nldtr8s
         b3hPpdsiSKkLFY1t1x+YUhomH4vYbEcUsSoahsYDWH0/CJONAIHv0cH3EY9kySmqRrxS
         kqkrhZSUDFeHJhBobNtFoMpbOrmIUrxH+WgZsQ3LPoqBeS+XMZEJncH6ppy1JFqm8n2A
         U5jw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=gVGGglFc;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.3.55 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (mail-eopbgr30055.outbound.protection.outlook.com. [40.107.3.55])
        by gmr-mx.google.com with ESMTPS id i11si62581wra.3.2020.08.20.02.41.44
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Aug 2020 02:41:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.3.55 as permitted sender) client-ip=40.107.3.55;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e50ku7FgV2YrKmwmuVteLBWipjqMptJ3v8lnMR+sfyurbgROb8Exz6JDAUUafq2QxkYWhkBcUe7g7exqhRoWbNhPPCNe/dbiZ8hHBEcnQAk1Cp4T8rx6Xpx1W/sDFU6CVSV4upMlwmr3OcnGzb4DbkOijE9W+ELg5TejjpcgSf2rosNQ4qLGqA8km+WPVw2uh4KgluUVyxJHFY0ufe93nSUU5VXCkT7MZtlfBt1nEkU5aymbKVe0GGgYI470JRXSKGX+j8INjnZH/s1ZxeQaO5qRFIhRCjBVIkkMrxTZnbVxjRKHyMu3hOJb1fCWX3q93Ckk3kmQZzXhoH30oLy/NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Z0frBPoR1g64gI7ArQBUN6uFfV4k+RIkIMJDdID7GI=;
 b=htfn5CtEWbxEPSv6ZsPeP22cXL8m15emfXu8cMPzOimBHAJeGBsBdoz+BObb+7mgdRtbXEjYsFT564JkUHoZ+YLKDByW4eTur8N12U71ZxU7JJSmYkSE9sWaecFvEVUm/TgxqVwA6r7dza4cUT3IcMUZrbs8PdHtK/+TJs6E2da4uOWN0nUwfEAcF2vmxVUaL4xu894mjQK+LJ6rarIW1Kv+B9k3k+V7lQNxTuOL5zyezpr6HXi9SPwt96aG82rJc4xXFt5LKYGFlqEf4Qki7UYmucXx1SXjQ5uICJPwkPmtc65ewtCclQ5EsRDrvlRL8Zhh4VtzroxPotjKhgZVQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB3PR0402MB3660.eurprd04.prod.outlook.com (2603:10a6:8:c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.23; Thu, 20 Aug
 2020 09:41:43 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::24d0:f783:3c7d:e232]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::24d0:f783:3c7d:e232%12]) with mapi id 15.20.3283.027; Thu, 20 Aug
 2020 09:41:43 +0000
From: peng.fan@nxp.com
To: jan.kiszka@siemens.com
Cc: jailhouse-dev@googlegroups.com,
	alice.guo@nxp.com,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 3/5] arm64: allow accessing simd/floating-point registers in inmate
Date: Thu, 20 Aug 2020 18:07:05 +0800
Message-Id: <20200820100707.20013-3-peng.fan@nxp.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200820100707.20013-1-peng.fan@nxp.com>
References: <20200820100707.20013-1-peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: SG2PR02CA0073.apcprd02.prod.outlook.com
 (2603:1096:4:90::13) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by SG2PR02CA0073.apcprd02.prod.outlook.com (2603:1096:4:90::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend Transport; Thu, 20 Aug 2020 09:41:41 +0000
X-Mailer: git-send-email 2.16.4
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0c1780c5-538d-4aaa-b626-08d844ed3f57
X-MS-TrafficTypeDiagnostic: DB3PR0402MB3660:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB3PR0402MB36608CC775F4FBB96635D415885A0@DB3PR0402MB3660.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MqrVQhamAUt30uYMIObfKovCp9bUEliF55evTcAp3Zx5ZD7JIC4jHkRlAKJ+ewUQjCc+knIhmPGAQdXMy8SC0XuPKb+P2sRQx6MFQkxUXja4EIvKUbkTPv8BgKlk1FmOQ2RCm4l9M5E9WrhGx5rX1P2IJPy9lYLlfmn1RcK7gTiRLOHfzFP3bTRKNCsb2Z8CMeFDcxOtL8OdBBKiy8MYXr4L10GuWl65wQvZ9uQMZTu61qICZg0ZPhishbVy20EUySfkCcQLzhViP7Ui3UtcApGcQBmFug+lBaNa1ekSWsSamA4ARYWvqSX2fW3r5QY+rLzDy1VcoCZctWE8x/AB/A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(346002)(366004)(396003)(376002)(6916009)(66946007)(9686003)(6506007)(83380400001)(66476007)(52116002)(186003)(8676002)(66556008)(6512007)(8936002)(6666004)(16526019)(4326008)(36756003)(316002)(5660300002)(2906002)(956004)(478600001)(6486002)(86362001)(1076003)(26005)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: KpiH7Pe8sURrJDO2uiz6sfM4ESutfJSH51+z4UbFghPbZV+KGxiC4Wy2AD9eW54ktukS7q4xc7UbGuS5CoptLeXgrYIu0pzOnVfQiqlRUl8UEQnrtqezRy6qSzRyOz2ahiSc/bOpS8hkDyZaiR2+IFlD/9nvu+roQpl2kQDRJtG3EFLMq7Z8FIsMz4qi+BXLvfvHaE64afYAfPrSibp/ZjaqMBxcwaS3HUVBqmcPltTPAulBJNK6g8TRbbgbf98K6QB36iDHlwAYiJLLQLce3kGSAJZMZsDD/35qNQXpLmcyzNzEUibQmUPqUMm/Y8AwE2B6nPsa2fMJ1S7j2q+tTMQ+8T+mEoRVr3NeHwrSFofoy9k9ohE9YDSP4XZw61xighF1wq8dBSWgfLjbzGsHnQ+Yulp0Yv3P760kE6u5kIOKY2LgnzP7xkO8MjfKQy6dl5d298kVqnuZM3MLqb7C29U81GRRTBmjeXHXGwv5FBIOvzTBkwsIFXaqq1uJGhXHDTzwmr7c7Pr4mv1p5039Rap6Gw3FgsqZTMOxe5Ch/UafEhiWcJO6Ph2AREETYEslOvcH7QQB1e/z4Pm0RgYz+ZltBRdvlf4paRXZV/5aR3UVeZUhUZZ0kNUKYyJ9x9T9lnXJpPsVo9cHm5VBGSU5kg==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c1780c5-538d-4aaa-b626-08d844ed3f57
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2020 09:41:43.6994
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TeD0pcxnXbaJ817WTinVX3JnjZXwpHw7Yso0JKeflPRO0jQ7M2oap3Dd6JON2a83cxkdlXH+yrsVN0Xivhbm4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3660
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=gVGGglFc;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.3.55 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

From: Peng Fan <peng.fan@nxp.com>

Set bit 30 of FPEXC32_EL2 to enables access to the Advanced SIMD and
floating-point functionality from all Exception levels.

Set CPACR_EL1.FPEN to not trap accessing to SIMD or floating point
registers.

Reported-by: Alice Guo <alice.guo@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 hypervisor/arch/arm64/control.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/hypervisor/arch/arm64/control.c b/hypervisor/arch/arm64/control.c
index 7bc3cab1..a45a5d32 100644
--- a/hypervisor/arch/arm64/control.c
+++ b/hypervisor/arch/arm64/control.c
@@ -21,6 +21,7 @@
 void arm_cpu_reset(unsigned long pc, bool aarch32)
 {
 	u64 hcr_el2;
+	u32 fpexc32_el2;
 
 	/* put the cpu in a reset state */
 	/* AARCH64_TODO: handle big endian support */
@@ -43,7 +44,7 @@ void arm_cpu_reset(unsigned long pc, bool aarch32)
 	arm_write_sysreg(AFSR1_EL1, 0);
 	arm_write_sysreg(AMAIR_EL1, 0);
 	arm_write_sysreg(CONTEXTIDR_EL1, 0);
-	arm_write_sysreg(CPACR_EL1, 0);
+	arm_write_sysreg(CPACR_EL1, 0x300000);
 	arm_write_sysreg(CSSELR_EL1, 0);
 	arm_write_sysreg(ESR_EL1, 0);
 	arm_write_sysreg(FAR_EL1, 0);
@@ -57,6 +58,11 @@ void arm_cpu_reset(unsigned long pc, bool aarch32)
 	arm_write_sysreg(TTBR1_EL1, 0);
 	arm_write_sysreg(VBAR_EL1, 0);
 
+	arm_read_sysreg(FPEXC32_EL2, fpexc32_el2);
+	fpexc32_el2 |= (1 << 30);
+	arm_write_sysreg(FPEXC32_EL2, fpexc32_el2);
+	arm_read_sysreg(FPEXC32_EL2, fpexc32_el2);
+
 	/* wipe timer registers */
 	arm_write_sysreg(CNTP_CTL_EL0, 0);
 	arm_write_sysreg(CNTP_CVAL_EL0, 0);
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200820100707.20013-3-peng.fan%40nxp.com.
