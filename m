Return-Path: <jailhouse-dev+bncBDEN32754MOBBHEMXP2AKGQEIXAA2BI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53b.google.com (mail-ed1-x53b.google.com [IPv6:2a00:1450:4864:20::53b])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1341A2F80
	for <lists+jailhouse-dev@lfdr.de>; Thu,  9 Apr 2020 08:52:13 +0200 (CEST)
Received: by mail-ed1-x53b.google.com with SMTP id i10sf9288708edk.13
        for <lists+jailhouse-dev@lfdr.de>; Wed, 08 Apr 2020 23:52:13 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1586415133; cv=pass;
        d=google.com; s=arc-20160816;
        b=VtFR2BXtaUX+PaEVy+l8ezVB2xlQ5qIUBp1QKW/uAzU+ioTpv6v9fbUUSasrxm9ChA
         0gkTwc1Y9HPL/4EOxAZBjQTRtzwAX8LyCaFX9UjdiApxgpBXZDvkHoe0KG4lkEczDL1/
         H7IuRFgW0ussa6NPkVT779l1nuEqzPFfJjr2JoccBv42sZUSTTWZ8OZltlLgIFUn2mjw
         B9eFnYoSF7+nDRE8Xd/bD+UG2DxwzEAFpiVd6grd1++P2KKDlPNAQQlger29pVtkb7/R
         4JHRxMQcSiTq+vmsmTD0wW8SdApRZQZo0iQeu6Ic1ldHc0oAYbMJKwRuXaaWalBW7Na9
         hPKQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=u8PHJvHOaL5WtZH8JLFhlmCe+OTwQO8Sp6LkznZ2CG0=;
        b=rHbg+FexmFhAjxMwTGmvlc3Rzl2p+fsO79svvbhQebiBt/RdOGnnz9DU7EcaRGlM0K
         2J+GdQITyWly6jOVDEzZ+VZ2eOwE3WEnq+Sv2G+rsHZl4ahMUX2unx4Ho6+zyuS+Quvu
         mogVtBEATBj4NT0y6mU5XocDJbdTdt21NnvuLMSNpFciGe2UnErxIVsBibESh4nmSKXu
         3mbSoeepCodIPaR+SIvKtjtSEnPK4O+wB3LAXV4osTMFlbsYaMgHl7G/ZMfVg21MgNj2
         jDqMnB20jCczoKeRe/rzRAgKkEZGgY5n3F0ctDHzxpPoi7NoAsNQp5y2tQRWElwk7Gsu
         ByAQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=K06tepXu;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.21.62 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=u8PHJvHOaL5WtZH8JLFhlmCe+OTwQO8Sp6LkznZ2CG0=;
        b=dfk/zc03225rk75GGfSam+Pjd2hrqLkKOxzH1qBEVp5ZI4iALjJYy0uMkgl+eTF/D/
         PTcwctycGkuQDeWZSDHluWw1YlRz7Dy5p0AFJ78zA7qK2XWybiCszesYR15W6Fujwe65
         0CMJVHqmBRgRaCRjMEu48hLFvrjhV+SJ5TUpitnBqdmNteyMIyclSV0DakS577whuC4i
         kuwrXcOUlz1mLDz0VnwMAcUJZD0HOirdGhu9WRfgZAjLKpXJFGcc4IuVeejFA/m9GvYp
         DMmM/cj1hUfDIFqa1v7e2zT576poyF1qOJtmyAFYcaZumggZRaDHBvPoD9XAqrT+zIcw
         VWIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=u8PHJvHOaL5WtZH8JLFhlmCe+OTwQO8Sp6LkznZ2CG0=;
        b=XWT/JUdtDzWPrzfNKuO5G4vkw4Ppjx9JDFRgJewCfnAPD4BU57qx00qnk2zun8OSke
         9NsKqn7vA+FdZ/In3eAnGxkTq36zQrcvWUUTR3nT7ra2aC+A0YyLCSQWF8YVvlkBVINY
         vKHw5VE+6ctnskWysiR2+wJivBJjW98JeKZlAzX/7TDyF6PaPBdM/b3BUBHPrDmlG7Bv
         Rz/XScSJc/ofsn+9H2ULCCQurNAgiOOqlZIbd7/Vcez/IAOwHFGEt/yFa7dDjvF/b1sJ
         8+QAsfw4aNeJ7S/US4sjeW4iYWhsxk9eK9uWhJl+d36NT8/PG2asXgQDSL1WeI5gs2X6
         +7nA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PuZCn42vEcKafgj2bwcE/C4VQ7ka8Nd7CbyVyDM/Zm7ycHpvDsYx
	68a4zhWlvTQ2gwun99Sfrk0=
X-Google-Smtp-Source: APiQypKk3URIKo38FIC3pn2bRFLxwMwFtENqJLWauTO2FIej2csHupwMYzKG1HHfO2W3eyLtE2gb+g==
X-Received: by 2002:aa7:df0b:: with SMTP id c11mr3066191edy.140.1586415133122;
        Wed, 08 Apr 2020 23:52:13 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:d8b0:: with SMTP id qc16ls8636910ejb.1.gmail; Wed,
 08 Apr 2020 23:52:12 -0700 (PDT)
X-Received: by 2002:a17:906:6b82:: with SMTP id l2mr10425804ejr.238.1586415132329;
        Wed, 08 Apr 2020 23:52:12 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1586415132; cv=pass;
        d=google.com; s=arc-20160816;
        b=Ad+Dz2vRYHC8avlCEjSjscobh/tmAhbv/dqruhWEwKwpmFZxd0OpZgiF4rFdcppPBS
         G4qdaHNredlhDBqKUsFeP2vRjc4rUXw2uFTUeTb16P/WUYGAAY1ELE5JQG6Gpyowva7R
         2YYZ7D4vKK+8MF2NoGjGBk/++5qzlk5cOnzANycPoIldbDn/wg0mM/LYKtkzTTRwPqHc
         7P1HyYp53/RiU5U+siDeGaB0Yo5QspQJPUvJiVYaVBF7zfUBJGzX5gcaLFUhKYklrn9T
         SkTNTamaIamFOUaqp3dCx80QdGdbLdVBIcSkbULpE58uwyPnkov/OBXBQga2M0kPgxpg
         S+zA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=P7T2kBM4vHzJph91tM+R9UQlQrMg5MV9ivxs80Ow304=;
        b=BCkdsj+w5LViHP3uLBRKLW5m/KyQhqYwsiF+y8CVMzvb/gfWwR4EesMOb2xkkfaLl6
         YVZNYWXq5v1oDx9vDIJi4/uIk2n4BTJUJgJ0bacyPe3f2/gH2ET2VkGwUmJe0JWOg/p1
         Lisrav7aQ8ZscDUIXIdWI0fJrIQlZuzN/WY4hIXmtYOud4OdEG12gbAiaExHRZuSctaW
         2F8f/kVzCMyhMpSMqRMWcSiDXglpEWfdzlU7OOaz15HRNJEm6VAKXk/l0/4QOFVBq+FO
         VesfVmqT/ZuRBuyOUbYi/51M8+nLH9nhbxLHewR5FhtEiT9cr0ISEEoWqsXjqvOvUu3V
         0uuQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=K06tepXu;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.21.62 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2062.outbound.protection.outlook.com. [40.107.21.62])
        by gmr-mx.google.com with ESMTPS id n19si352588edy.0.2020.04.08.23.52.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 Apr 2020 23:52:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of alice.guo@nxp.com designates 40.107.21.62 as permitted sender) client-ip=40.107.21.62;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UGZvzhkf2n+gsrX1uMKBuehgczHfA+rj+DFbybzSVN7OzzQlh/JJK0Q539gcXph/6awvPjBvOAj0kwh2mxg1pFqKn26x9Fo4ZPX2k/kX069WL239RvRJu6KSHFw04AqXyGkpyFhhIaOfyT8HlUPM0lUGc6doI85xoUkqhXnR+ihG4mPE2i8Ddze+QEN3iOCea+3XKl62R/4IUi+s5+6vcVzrQDYlDci8dVyWwV+e2CWsd06WKHZxSrodB5Dl8gQPet8iXUecUAvjDDGRZuIRwMTJxCj/0/qFhgHW2xTaeHFjN+zZpC1JTG927DILaofGYaATDDkcnUvK7uD+I4pP4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P7T2kBM4vHzJph91tM+R9UQlQrMg5MV9ivxs80Ow304=;
 b=RlAb87N+4bl0tXD1DrsKNCsaH2dtAf6ZS6ap/bkmoFoABIYLYEU4VF6MR+GVM94cIyCIaYoYVANtwFjdERqEoNstQZQzHq/gDFN0IC9boggxwoviikCfzkeCdvkRcy04saifa1kL+HtjfCpMw1QdreQbQF097OpXfR+rv1+b82D/vgcx5McJwmQf4yLElHVAgCFo8MVrlSe0g/eQTMQPdz0FwtuQXJ0WXvyViyMLKmvNAczlBRfI6UL+qgTmTzf5nhYkQ0N4JbSDIqGXlqtLy0cHvOKysaxEKpOqX5Kgx7elhxtCzCxfc5E3no9PdQLHU8WWbCOsvERoQmLYAeQO1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com (2603:10a6:10:127::9)
 by DB8PR04MB6763.eurprd04.prod.outlook.com (2603:10a6:10:10b::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.17; Thu, 9 Apr
 2020 06:52:10 +0000
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::55c:405c:271a:4c56]) by DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::55c:405c:271a:4c56%7]) with mapi id 15.20.2878.018; Thu, 9 Apr 2020
 06:52:10 +0000
From: Alice Guo <alice.guo@nxp.com>
To: jailhouse-dev@googlegroups.com
Cc: peng.fan@nxp.com,
	Alice Guo <alice.guo@nxp.com>
Subject: [PATCH V1] Cell configs for imx8mn EVK board.
Date: Fri, 10 Apr 2020 21:50:24 +0800
Message-Id: <20200410135024.21413-1-alice.guo@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: SG2PR0302CA0006.apcprd03.prod.outlook.com
 (2603:1096:3:2::16) To DB8PR04MB7065.eurprd04.prod.outlook.com
 (2603:10a6:10:127::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nxf55104-OptiPlex-7060.ap.freescale.net (119.31.174.71) by SG2PR0302CA0006.apcprd03.prod.outlook.com (2603:1096:3:2::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.6 via Frontend Transport; Thu, 9 Apr 2020 06:52:08 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4eba5397-5239-4b4f-012a-08d7dc528698
X-MS-TrafficTypeDiagnostic: DB8PR04MB6763:|DB8PR04MB6763:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB8PR04MB6763FEDAE631EE1CD6624833E2C10@DB8PR04MB6763.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 0368E78B5B
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB7065.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(39860400002)(366004)(376002)(346002)(396003)(136003)(1076003)(66476007)(8676002)(956004)(8936002)(30864003)(2616005)(44832011)(2906002)(36756003)(86362001)(16526019)(66556008)(66946007)(5660300002)(6512007)(478600001)(6486002)(186003)(6666004)(81156014)(81166007)(52116002)(26005)(4326008)(6506007)(6916009)(316002)(32563001);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ns14zvqu10CwohrOYg1y+xMlp+SYlRqhep8wDQ1X/q0q+DhGOQolIG5hCeZMOMPwosjOHcBk9LgH/+EVDQs0oOtUQn4wr8YEOnTJWP7pfbIDJBWlT2vPrH4TmHK5HPQgAnK7YM/52E8Gkako7onbFbs1vfl2kObf8J/Kwl4WB5oKQzhZmnApmZ0yOuizcR4dKXHI0F4Id6oEX+nujf7rNsCGE6EfdR643tYuiWSK4rVV58EVhs/iv0t/mIkYCccOtRVOR73Aa2isKEcK6u9HeyaKo5oyCOoCmSlp+8etUzMN31dCCo/gTmt2x7kkGo0nH3SIDofI7moPNDGKvhdKWZgdLTfzCwbkauXlVZC/oT9K0kxy8ZtzKMDdxEQb5zXL4oB+7BkaBOZ6aMarwZYijZndd//jL8/a4h1/Lmzd6pTWuKbbthMSJvGKW6VF0z5pYoh6ALTOaRgNoEZoGH4zcS/7RwAdHDfXcx5PvPuZDirOAQ1s+47cvGmheIajo3XV
X-MS-Exchange-AntiSpam-MessageData: 63APiJ00hrBpXar/llWWyarv/KU0e1/cX584vX7qGo9/JbFFa6qoLT0gZkmXjSnZizRB3615xP4rlhy26doTkzGyMbUEr1v3wRiWstsMiQ/pTEHcYWiDfZrdTCwrt/t38v9abhCfWW+3lT4Mtjn4RQ==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eba5397-5239-4b4f-012a-08d7dc528698
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2020 06:52:10.2958
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FyFWkqMfPB8q0V80hpqXFgqSQlkesCs8rIOxLoaAw3zPXMEamK0Nw5bX7b/mfauIbZ1Da8ThcXEOJup7gu8QgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6763
X-Original-Sender: alice.guo@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=K06tepXu;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of alice.guo@nxp.com
 designates 40.107.21.62 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
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

Signed-off-by: Alice Guo <alice.guo@nxp.com>
---
 configs/arm64/imx8mn-inmate-demo.c | 126 ++++++++++++++++++
 configs/arm64/imx8mn-linux-demo.c  | 167 ++++++++++++++++++++++++
 configs/arm64/imx8mn.c             | 198 +++++++++++++++++++++++++++++
 3 files changed, 491 insertions(+)
 create mode 100644 configs/arm64/imx8mn-inmate-demo.c
 create mode 100644 configs/arm64/imx8mn-linux-demo.c
 create mode 100644 configs/arm64/imx8mn.c

diff --git a/configs/arm64/imx8mn-inmate-demo.c b/configs/arm64/imx8mn-inmate-demo.c
new file mode 100644
index 00000000..6f04a5b3
--- /dev/null
+++ b/configs/arm64/imx8mn-inmate-demo.c
@@ -0,0 +1,126 @@
+/*
+ * iMX8MN target - inmate-demo
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
+		.name = "inmate-demo",
+		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
+
+		.cpu_set_size = sizeof(config.cpus),
+		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+		.num_irqchips = ARRAY_SIZE(config.irqchips),
+		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+		/* IVSHMEM_IRQ - 32 */
+		.vpci_irq_base = 124, /* Not include 32 base */
+
+		.console = {
+			.address = 0x30890000,
+			.type = JAILHOUSE_CON_TYPE_IMX,
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
+		/* IVSHMEM shared memory regions (demo) */
+		{
+			.phys_start = 0xbba00000,
+			.virt_start = 0xbba00000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xbba01000,
+			.virt_start = 0xbba01000,
+			.size = 0x9000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xbba0a000,
+			.virt_start = 0xbba0a000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xbba0c000,
+			.virt_start = 0xbba0c000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xbba0e000,
+			.virt_start = 0xbba0e000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* UART2 */ {
+			.phys_start = 0x30890000,
+			.virt_start = 0x30890000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* RAM: start from the bottom of inmate memory */ {
+			.phys_start = 0xb3c00000,
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
+			.address = 0x38800000,
+			.pin_base = 128,
+			.pin_bitmap = {
+				0x1 << (124 + 32 - 128) /* SPI 124 */
+			},
+		},
+	},
+
+	.pci_devices = {
+		{
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
diff --git a/configs/arm64/imx8mn-linux-demo.c b/configs/arm64/imx8mn-linux-demo.c
new file mode 100644
index 00000000..1618cfc1
--- /dev/null
+++ b/configs/arm64/imx8mn-linux-demo.c
@@ -0,0 +1,167 @@
+/*
+ * iMX8MN target - linux-demo
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
+/*
+ * Boot 2nd Linux cmdline:
+ * export PATH=$PATH:/usr/share/jailhouse/tools/
+ * jailhouse cell linux imx8mn-linux-demo.cell Image -d imx8mn-ddr4-evk-inmate.dtb -c "clk_ignore_unused console=ttymxc3,115200 earlycon=ec_imx6q,0x30890000,115200  root=/dev/mmcblk2p2 rootwait rw"
+ */
+#include <jailhouse/types.h>
+#include <jailhouse/cell-config.h>
+
+struct {
+	struct jailhouse_cell_desc cell;
+	__u64 cpus[1];
+	struct jailhouse_memory mem_regions[16];
+	struct jailhouse_irqchip irqchips[2];
+	struct jailhouse_pci_device pci_devices[2];
+} __attribute__((packed)) config = {
+	.cell = {
+		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.name = "linux-inmate-demo",
+		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
+
+		.cpu_set_size = sizeof(config.cpus),
+		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+		.num_irqchips = ARRAY_SIZE(config.irqchips),
+		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+		.vpci_irq_base = 74, /* Not include 32 base */
+	},
+
+	.cpus = {
+		0xc,
+	},
+
+	.mem_regions = {
+		/* IVHSMEM shared memory region for 00:00.0 (demo )*/ {
+			.phys_start = 0xbba00000,
+			.virt_start = 0xbba00000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xbba01000,
+			.virt_start = 0xbba01000,
+			.size = 0x9000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xbba0a000,
+			.virt_start = 0xbba0a000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xbba0c000,
+			.virt_start = 0xbba0c000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xbba0e000,
+			.virt_start = 0xbba0e000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* IVSHMEM shared memory regions for 00:01.0 (networking) */
+		JAILHOUSE_SHMEM_NET_REGIONS(0xbbb00000, 1),
+		/* UART2 earlycon */ {
+			.phys_start = 0x30890000,
+			.virt_start = 0x30890000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* UART4 */ {
+			.phys_start = 0x30a60000,
+			.virt_start = 0x30a60000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* SHDC1 */ {
+			.phys_start = 0x30b60000,
+			.virt_start = 0x30b60000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* RAM: Top at 4GB Space */ {
+			.phys_start = 0xbb700000,
+			.virt_start = 0,
+			.size = 0x10000, /* 64KB */
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
+		},
+		/* RAM */ {
+			/*
+			 * We could not use 0x80000000 which conflicts with
+			 * COMM_REGION_BASE
+			 */
+			.phys_start = 0x93c00000,
+			.virt_start = 0x93c00000,
+			.size = 0x24000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
+				JAILHOUSE_MEM_LOADABLE,
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
+		/* uart4/sdhc1 */ {
+			.address = 0x38800000,
+			.pin_base = 32,
+			.pin_bitmap = {
+				(1 << (24 + 32 - 32)) | (1 << (29 + 32 - 32))
+			},
+		},
+		/* IVSHMEM */ {
+			.address = 0x38800000,
+			.pin_base = 96,
+			.pin_bitmap = {
+				0xf << (74 + 32 - 96) /* SPI 74-77 */
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
+};
diff --git a/configs/arm64/imx8mn.c b/configs/arm64/imx8mn.c
new file mode 100644
index 00000000..ecd00a90
--- /dev/null
+++ b/configs/arm64/imx8mn.c
@@ -0,0 +1,198 @@
+/*
+ * i.MX8MN Target
+ *
+ * Copyright 2020 NXP
+ *
+ * Authors:
+ *  Peng Fan <peng.fan@nxp.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ *
+ * Reservation via device tree: reg = <0x0 0xffaf0000 0x0 0x510000>
+ */
+
+#include <jailhouse/types.h>
+#include <jailhouse/cell-config.h>
+
+struct {
+	struct jailhouse_system header;
+	__u64 cpus[1];
+	struct jailhouse_memory mem_regions[16];
+	struct jailhouse_irqchip irqchips[3];
+	struct jailhouse_pci_device pci_devices[2];
+} __attribute__((packed)) config = {
+	.header = {
+		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
+		.hypervisor_memory = {
+			.phys_start = 0xb7c00000,
+			.size =       0x00400000,
+		},
+		.debug_console = {
+			.address = 0x30890000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_CON_TYPE_IMX |
+				 JAILHOUSE_CON_ACCESS_MMIO |
+				 JAILHOUSE_CON_REGDIST_4,
+			.type = JAILHOUSE_CON_TYPE_IMX,
+		},
+		.platform_info = {
+			.pci_mmconfig_base = 0xbb800000,
+			.pci_mmconfig_end_bus = 0,
+			.pci_is_virtual = 1,
+			.pci_domain = 0,
+
+			.arm = {
+				.gic_version = 3,
+				.gicd_base = 0x38800000,
+				.gicr_base = 0x38880000,
+				.maintenance_irq = 25,
+			},
+		},
+		.root_cell = {
+			.name = "imx8mm",
+
+			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+			.cpu_set_size = sizeof(config.cpus),
+			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+			.num_irqchips = ARRAY_SIZE(config.irqchips),
+			.vpci_irq_base = 123, /* Not include 32 base */
+		},
+	},
+
+	.cpus = {
+		0xf,
+	},
+
+	.mem_regions = {
+		/* IVHSMEM shared memory region for 00:00.0 (demo )*/ {
+			.phys_start = 0xbba00000,
+			.virt_start = 0xbba00000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		{
+			.phys_start = 0xbba01000,
+			.virt_start = 0xbba01000,
+			.size = 0x9000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE ,
+		},
+		{
+			.phys_start = 0xbba0a000,
+			.virt_start = 0xbba0a000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE ,
+		},
+		{
+			.phys_start = 0xbba0c000,
+			.virt_start = 0xbba0c000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		{
+			.phys_start = 0xbba0e000,
+			.virt_start = 0xbba0e000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		/* IVSHMEM shared memory regions for 00:01.0 (networking) */
+		JAILHOUSE_SHMEM_NET_REGIONS(0xbbb00000, 0),
+		/* IO */ {
+			.phys_start = 0x00000000,
+			.virt_start = 0x00000000,
+			.size =	      0x40000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* RAM 00*/ {
+			.phys_start = 0x40000000,
+			.virt_start = 0x40000000,
+			.size = 0x73c00000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+		/* Inmate memory */{
+			.phys_start = 0xb3c00000,
+			.virt_start = 0xb3c00000,
+			.size = 0x04000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+		/* RAM 01 */ {
+			.phys_start = 0xb8000000,
+			.virt_start = 0xb8000000,
+			.size = 0x03700000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+		/* Loader */{
+			.phys_start = 0xbb700000,
+			.virt_start = 0xbb700000,
+			.size = 0x100000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+		/* RAM 02 */ {
+			.phys_start = 0xbbc00000,
+			.virt_start = 0xbbc00000,
+			.size = 0x02400000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+		/* OP-TEE reserved memory */{
+			.phys_start = 0xbe000000,
+			.virt_start = 0xbe000000,
+			.size = 0x2000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+	},
+
+	.irqchips = {
+		/* GIC */ {
+			.address = 0x38800000,
+			.pin_base = 32,
+			.pin_bitmap = {
+				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
+			},
+		},
+		/* GIC */ {
+			.address = 0x38800000,
+			.pin_base = 160,
+			.pin_bitmap = {
+				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
+			},
+		},
+		/* GIC */ {
+			.address = 0x38800000,
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200410135024.21413-1-alice.guo%40nxp.com.
