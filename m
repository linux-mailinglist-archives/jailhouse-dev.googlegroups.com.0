Return-Path: <jailhouse-dev+bncBDEN32754MOBBW4J4LZQKGQEBNOHJ6A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x438.google.com (mail-wr1-x438.google.com [IPv6:2a00:1450:4864:20::438])
	by mail.lfdr.de (Postfix) with ESMTPS id 046C218F210
	for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Mar 2020 10:43:56 +0100 (CET)
Received: by mail-wr1-x438.google.com with SMTP id m15sf2664553wrb.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Mar 2020 02:43:56 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1584956635; cv=pass;
        d=google.com; s=arc-20160816;
        b=YelUhSWLh2yDEJhJafEKm7c9ikNe8jEPqUKuJuWQbZOtXuoSa7wnBe5739f9rBE5LN
         Ee+8k7RdHD8hr69Ow5yYcOd8BAwnqJVwcr2pnqK+PtDr4DBwNDS/dglLApeNTNW/zw+X
         /qwF8D22seiJpbQH9JuNyQ09cHX3+uhIJWIDeIY8qMBG8icjRls7cp5i0Zsdh68mb1Ku
         b5EkAIHxsx0Va0VeR31PVk08LQ5ONEF9ni0Zb5ssVjJikFpuzS8OgANU3qC5q3rOVrvG
         47x1MWvXQ5I1+ZM08sKnuv9yOitSh1dJLSsKW5JbrYrXvzd7o4jknRMtxEe453mWlgXY
         vzvQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=Ht/hmr91WPitupfuP9CsnGSJqhJoW97/eYVEIxOLK0o=;
        b=gJgUSKbVshlUz0nZuOG5xewzFq+U9xKsbY83DC1YyXrQH7boYvKZSywlvI01G/nnZk
         6ShcrKo3k1wEPkoK7cXzpXJnkniwDSQcKibVqtAxM7Z+tqDC57a74VqkHZftZjEzeKNH
         HZZE+TB2Oe0w8IkTlIBsaSeh22r0HUYgteyzZWGq2v4CksI1qZNpMpNQklfaI3jUn1bP
         rSV5yzsbZ0tSuGJSB1EfpgEqBydHz194rb+eHnwqLIkpLmqXDBMvs0JdY0wTXh5NlbBs
         kfI8jcnbIN/iJRuL075PLyTmReZW8OtS8Dq7H7I8AAPu0OZFfnhKsBgc4T1GySLcEe9T
         wYxA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=LDT2V2ds;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.0.43 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Ht/hmr91WPitupfuP9CsnGSJqhJoW97/eYVEIxOLK0o=;
        b=YNxeV3Eyy+Ir327gtjLUX7j6a3DD+p2E22gY61VvmMflFaY9LHlexSDouT8opH23mv
         L3cz0eGQM87oxxz0IJUC6mtbZW0d2lLmFRqXhwkba2BuLCAkjLOwMCUMoX9046X8qLiB
         GSAvPXSwst1s8irufFGEEJSz0Uz6aqvXP1zKz8rG/Hrvc3TnQRP7wk+SLVYczRqUuVT9
         H0pvH1P2Swfkh5gm1eu9v9rTLP/8mqrfUQ9ElaEs+7qbq2SoyzoBXxVpNG0A4fB+Rdom
         7rzeVhfxI1l1NhLUmQHTEfZTT9CF7E2hCAoC7uoLvr4iFyRpYArm6sCC3iK1UI+FqUFh
         SjFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Ht/hmr91WPitupfuP9CsnGSJqhJoW97/eYVEIxOLK0o=;
        b=O44lnX8SqJHwiIE+AdQHBWsu8f1HLwGB74Zca5HgCV0ndqIrMZLDRSP/+h6JUWBW4U
         abxvbhZT33yx+hLoa4B1ZdK72E6Dr3Jta1gaqfdZYKrtKVfjbT8lPYFguSL2yXB1WNPC
         WPLarT3iucq8AvWYYVrOMBYSBjLpwfFxLWUmMLOL6GAdziGkJv25vt6uW6FEpjzGWt2c
         i5ANVjP9SiZGbUjSgE1Xsn5FZJu6g6J4ECpOtSJvAj5f4XasC+fEd78AgjLTyGSc8NlR
         gEcj2bPW0sD3czh189BGZOb0YTctU5n1TMx8wFbmqHYks1K2nZeLjYBBftEC3lTSnkwn
         vLiw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ0hMCAX9reA2bDyMbb0s32XtlB4Narv4e8Ex2dqP+5uh6/JIoJN
	iLPf5TFg/mMaI9d4EBF20mA=
X-Google-Smtp-Source: ADFU+vvw6hv9A6p92WZvdgvIBnMnzhbGnQfaB6Qtrc0pf5zWopU6sLkAG6NdQmT7Py4D3Qisd6/KFA==
X-Received: by 2002:a5d:6ac8:: with SMTP id u8mr30370430wrw.53.1584956635592;
        Mon, 23 Mar 2020 02:43:55 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:a98b:: with SMTP id s133ls2095415wme.3.gmail; Mon, 23
 Mar 2020 02:43:54 -0700 (PDT)
X-Received: by 2002:a1c:80d3:: with SMTP id b202mr26720999wmd.16.1584956634810;
        Mon, 23 Mar 2020 02:43:54 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1584956634; cv=pass;
        d=google.com; s=arc-20160816;
        b=qDkVBlTojWzwgCtlYhgpyaGZtHAlRZytF3rj3rHlhohZiT0NVEPf1z/Vl/yVaXRL3H
         bDHMYCsK+mpY6ie9s/Ba0wBO/ZjFilSC66EwhzzywgiziPXejz8JAqnsM5oAhlXFH3VT
         9JqCH9bvQ8CCeMVCaSMJzutFCkiWB9l8l48TRuLAhZz8k2WXtNMzpuvCt9VlBXBpZosN
         JJdg83wAyKEfB1fSHh0uyX4FYAeKIIFHbzi2hxmleza6pBiVwPwhOYjtRjmsXC5PX7T3
         6B7znAZedvtp5/5gFA00FOoVKSufAcVj8B3jUKh5HxsaXSD3RaBuE2NE+0lp1QdY8NYs
         MTAQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=9PM7UYb0sCg2XIVz26IKo7WjIBWqESocJlX0KM4B1zE=;
        b=MNYtE4KRD8N/nb/glPXPK9xiqpZ/5ELd/+aw9LnbxD78QrEyJcg/2I8h/hhsZbRGJq
         dE5pXQpqXil8zGyqc+mnVBPm2NvGDcWzAbUq5KqlOQScTzZeqm1Qtb5/3aoXcaBcnuSB
         7J8y2Yl1+yPlknExnvVEsXppAFVH227xkJw7s5iHvVKD8UqVlz3BayOjM2xtmkJCDVvi
         E2sfp3tYebWm/wFmBE5CP9OrP7DeNFL0WKAwyXqA8ULJ2D3OxtJzWbmqKZhY7Y+ABYd3
         W3aoOQFRCLjqPkTTAkpX9BG6LoprlfBf0tFcDf96B8egVAgGtnvHUnqcu14VY46CMlnP
         tAzQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=LDT2V2ds;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.0.43 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (mail-eopbgr00043.outbound.protection.outlook.com. [40.107.0.43])
        by gmr-mx.google.com with ESMTPS id v12si742439wrp.5.2020.03.23.02.43.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Mar 2020 02:43:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of alice.guo@nxp.com designates 40.107.0.43 as permitted sender) client-ip=40.107.0.43;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gJPVwNdopLPTSuEPcbbIQgN9nwIw2El8kLW55noW+PxdABa04PY+mAV9o+RcbEBhjQJiwm7GWmc9JJ03nCHFaFvPPlqa4PKndqzlTKkK0vBA2xylpalaf77SX0N15ffQaBgUV/aNl0eUkuSlUFI6MTHL1AduRThe6gmXqJ1SOzn/HNxo3AAjgo/sDADcqGDMiGkDUQmy+Tu4DoKSgtriq0NJun9S96lQ9zlyH7dM9uQtcRwj5mXlOBNJetaDx1hOYCYZuuPTnBTpx+eCmaaNK9hQ92Wy6cNv/Zo9Sg5bAyRr+vkMuiSPmLlptaBrnKvDXTaG7LwPmVcfBGclDkvC1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9PM7UYb0sCg2XIVz26IKo7WjIBWqESocJlX0KM4B1zE=;
 b=C9fS5wFoh820mrOqBp074lhsjBf8mee+MdiKp/o0SBM10/LjPi6blKcvoQ7Bhrqc5gsdFfRHi6PNG0Ud3BCKNBjG1ONxaAUETnZJarOBkck/NycOtKcKAeJBdCI18ohODLOCyHtu1PJcRLinAky2NnuYy9ByZa6SmCTrw6gJQjpo6XSEtEQ9b52awtFNcSR5+5dYvXpvNW6sUcUnAy4YWANdRp1LpmN0/tvUTTxp5dbi1lW8lEZGTM5ZdY8p/I1qlIoQurzijev+wFDNpbgE7g0yWgukd/brx3ykkvk1o1UFgFSGTNfum0iB/I2VruuGGaI3v5sNSnVKm9qEDnGECA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com (52.135.61.137) by
 DB8PR04MB6363.eurprd04.prod.outlook.com (10.255.170.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.20; Mon, 23 Mar 2020 09:43:53 +0000
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::55c:405c:271a:4c56]) by DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::55c:405c:271a:4c56%7]) with mapi id 15.20.2835.021; Mon, 23 Mar 2020
 09:43:54 +0000
From: Alice Guo <alice.guo@nxp.com>
To: jailhouse-dev@googlegroups.com
Cc: peng.fan@nxp.com,
	Alice Guo <alice.guo@nxp.com>
Subject: [PATCH 1/2] Cell configs for imx8mq EVK board.
Date: Wed, 25 Mar 2020 00:43:42 +0800
Message-Id: <20200324164343.13403-1-alice.guo@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: SG2PR03CA0109.apcprd03.prod.outlook.com
 (2603:1096:4:91::13) To DB8PR04MB7065.eurprd04.prod.outlook.com
 (2603:10a6:10:127::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nxf55104-OptiPlex-7060.ap.freescale.net (119.31.174.71) by SG2PR03CA0109.apcprd03.prod.outlook.com (2603:1096:4:91::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.8 via Frontend Transport; Mon, 23 Mar 2020 09:43:52 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: eee3d2bc-8437-4491-d745-08d7cf0eb302
X-MS-TrafficTypeDiagnostic: DB8PR04MB6363:|DB8PR04MB6363:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB8PR04MB63633E48570B5AD0AD5EC8CFE2F00@DB8PR04MB6363.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-Forefront-PRVS: 0351D213B3
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(346002)(376002)(136003)(39860400002)(396003)(199004)(52116002)(16526019)(36756003)(6512007)(30864003)(6916009)(1076003)(4326008)(26005)(6506007)(86362001)(956004)(6486002)(66556008)(66476007)(44832011)(2616005)(478600001)(186003)(316002)(6666004)(8936002)(81166006)(5660300002)(66946007)(81156014)(2906002)(8676002)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:DB8PR04MB6363;H:DB8PR04MB7065.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
Received-SPF: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nxm1NTLiQ4HwIsxbQUf9oc1nl8iO01Oc5C4V6CHeuqzcAshr1T7srGEyWf7wrYj7VuGSJa3jExTw/lhn5tmwaXdpXGZGtFixyQfy+IZUBFs8T3ijO98L8v+m/vVUYq+b8y89n435cCFcDAQOWvmEPtyR7qL8Bop7JUb6ugGNFAmbE9HuJlo4Av1n3rU11mk/caKHBAiIyuGSFVXklxX+6f1cPZnxHuYB2UjwBYfnOuQZkv+UO6NOpG4bl1kTDV/akG7UG3wc/6e2HAzcfag+VfCD4BltX1Dd3nTNgThgmC2fIaD7bBgp6stjH6/wEeJpMyqMo/n1jep1IwcD8GlkU2YNCgEzrRrdHmAYXs6C9+ruPsBLjQX4NKXJVsBBxsTW+WXJYp/6HtwPl1cTaI/mrR3rlldlkOsB/B3zE3GKt/Fia5Z3DYZgNT5MnNpy/M3njE7BknHCYvBBRobf1F7nJgtsAgFiD8K3f1iFlSDTTaI=
X-MS-Exchange-AntiSpam-MessageData: VLf3M8P54A98rJIuJPWB2Ct2uFLNGF1qk2R59vHlxAaPej1G9UjnxyWiINtwKQj5z6SRL5cPEI3ffFz29bJxnF7KBYPv3BTp5BiYtWTG6BMJdm0NlkTekItkALrrIeqftJ3uvNp7xpw2C0cABF823A==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eee3d2bc-8437-4491-d745-08d7cf0eb302
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2020 09:43:53.9150
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KjdWznc3yUs+RCAJsGinVb07YBXQh6yKopgHOUNi5V3NjQmaOwV7DOlrJG47yXcE8oFSUrU+Bpfac6W2jnHhIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6363
X-Original-Sender: alice.guo@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=LDT2V2ds;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of alice.guo@nxp.com
 designates 40.107.0.43 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
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
 configs/arm64/imx8mq-inmate-demo.c  |   4 +-
 configs/arm64/imx8mq-ivshmem-demo.c | 124 ++++++++++++++++++++++
 configs/arm64/imx8mq-linux-demo.c   | 158 ++++++++++++++++++++++++++++
 configs/arm64/imx8mq.c              |  93 ++++++++++++++--
 4 files changed, 369 insertions(+), 10 deletions(-)
 create mode 100644 configs/arm64/imx8mq-ivshmem-demo.c
 create mode 100644 configs/arm64/imx8mq-linux-demo.c

diff --git a/configs/arm64/imx8mq-inmate-demo.c b/configs/arm64/imx8mq-inmate-demo.c
index 8c1ad624..af57ebe9 100644
--- a/configs/arm64/imx8mq-inmate-demo.c
+++ b/configs/arm64/imx8mq-inmate-demo.c
@@ -1,7 +1,7 @@
 /*
  * iMX8MQ target - inmate demo
  *
- * Copyright NXP 2018
+ * Copyright 2018-2019 NXP
  *
  * Authors:
  *  Peng Fan <peng.fan@nxp.com>
@@ -50,7 +50,7 @@ struct {
 				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
 		},
 		/* RAM: Top at 4GB Space */ {
-			.phys_start = 0xffaf0000,
+			.phys_start = 0xc0000000,
 			.virt_start = 0,
 			.size = 0x00010000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
diff --git a/configs/arm64/imx8mq-ivshmem-demo.c b/configs/arm64/imx8mq-ivshmem-demo.c
new file mode 100644
index 00000000..d7b8f0a6
--- /dev/null
+++ b/configs/arm64/imx8mq-ivshmem-demo.c
@@ -0,0 +1,124 @@
+/*
+ * iMX8MQ target - ivshmem-demo
+ *
+ * Copyright 2018 NXP
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
+	struct jailhouse_memory mem_regions[12];
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
+		.vpci_irq_base = 108, /* Not include 32 base */
+
+		.console = {
+			.address = 0x30860000,
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
+		/* IVHSMEM shared memory region for 00:00.0 */ {
+			.phys_start = 0xbfd00000,
+			.virt_start = 0xbfd00000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xbfd01000,
+			.virt_start = 0xbfd01000,
+			.size = 0x9000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xbfd0a000,
+			.virt_start = 0xbfd0a000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xbfd0c000,
+			.virt_start = 0xbfd0c000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xbfd0e000,
+			.virt_start = 0xbfd0e000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* UART1 */ {
+			.phys_start = 0x30860000,
+			.virt_start = 0x30860000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* RAM: Bottom at 4GB Space */ {
+			.phys_start = 0xc0000000,
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
+				0x1 << (108 + 32 - 128) /* SPI 109 */
+			},
+		},
+	},
+
+	.pci_devices = {
+		{ /* IVSHMEM 00:00.0 (demo) */
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 1,
+			.bdf = 0 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 0,
+			.shmem_dev_id = 1,
+			.shmem_peers = 1,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
+		},
+	},
+};
diff --git a/configs/arm64/imx8mq-linux-demo.c b/configs/arm64/imx8mq-linux-demo.c
new file mode 100644
index 00000000..a59dd934
--- /dev/null
+++ b/configs/arm64/imx8mq-linux-demo.c
@@ -0,0 +1,158 @@
+/*
+ * iMX8MQ target - linux-demo
+ *
+ * Copyright 2018 NXP
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
+	struct jailhouse_memory mem_regions[15];
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
+		.vpci_irq_base = 108, /* Not include 32 base */
+	},
+
+	.cpus = {
+		0xc,
+	},
+
+	.mem_regions = {
+		/* IVHSMEM shared memory region for 00:00.0 */ {
+			.phys_start = 0xbfd00000,
+			.virt_start = 0xbfd00000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xbfd01000,
+			.virt_start = 0xbfd01000,
+			.size = 0x9000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xbfd0a000,
+			.virt_start = 0xbfd0a000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xbfd0c000,
+			.virt_start = 0xbfd0c000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xbfd0e000,
+			.virt_start = 0xbfd0e000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* IVSHMEM shared memory regions for 00:01.0 (networking) */
+		JAILHOUSE_SHMEM_NET_REGIONS(0xbfe00000, 1),
+		/* UART1 earlycon */ {
+			.phys_start = 0x30860000,
+			.virt_start = 0x30860000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* UART2 */ {
+			.phys_start = 0x30890000,
+			.virt_start = 0x30890000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* SHDC1 */ {
+			.phys_start = 0x30b40000,
+			.virt_start = 0x30b40000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* RAM: Top at 4GB Space */ {
+			.phys_start = 0xbff00000,
+			.virt_start = 0,
+			.size = 0x10000, /* 64KB */
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
+		},
+		/* RAM: Top at 4GB Space */ {
+			.phys_start = 0xc0000000,
+			.virt_start = 0xc0000000,
+			.size = 0x3dc00000,
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
+		/* uart2/sdhc1 */ {
+			.address = 0x38800000,
+			.pin_base = 32,
+			.pin_bitmap = {
+				(1 << (27 + 32 - 32)) | (1 << (22 + 32 - 32))
+			},
+		},
+		/* IVSHMEM */ {
+			.address = 0x38800000,
+			.pin_base = 128,
+			.pin_bitmap = {
+				0x1 << (108 + 32 - 128) /* SPI 109 */
+			},
+		},
+	},
+
+	.pci_devices = {
+		{ /* IVSHMEM 00:00.0 (demo) */
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 1,
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
diff --git a/configs/arm64/imx8mq.c b/configs/arm64/imx8mq.c
index 7d113264..3292bd29 100644
--- a/configs/arm64/imx8mq.c
+++ b/configs/arm64/imx8mq.c
@@ -1,7 +1,7 @@
 /*
  * i.MX8MQ Target
  *
- * Copyright 2017 NXP
+ * Copyright 2017-2018 NXP
  *
  * Authors:
  *  Peng Fan <peng.fan@nxp.com>
@@ -18,25 +18,31 @@
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[4];
+	struct jailhouse_memory mem_regions[14];
 	struct jailhouse_irqchip irqchips[3];
+	struct jailhouse_pci_device pci_devices[2];
 } __attribute__((packed)) config = {
 	.header = {
 		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
 		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
 		.hypervisor_memory = {
-			.phys_start = 0xffc00000,
+			.phys_start = 0xfdc00000,
 			.size =       0x00400000,
 		},
 		.debug_console = {
 			.address = 0x30860000,
 			.size = 0x1000,
 			.type = JAILHOUSE_CON_TYPE_IMX,
-			.flags = JAILHOUSE_CON_ACCESS_MMIO |
+			.flags = JAILHOUSE_CON_TYPE_IMX |
+				 JAILHOUSE_CON_ACCESS_MMIO |
 				 JAILHOUSE_CON_REGDIST_4,
 		},
 		.platform_info = {
+			.pci_mmconfig_base = 0xbfb00000,
+			.pci_mmconfig_end_bus = 0,
+			.pci_is_virtual = 1,
+
 			.arm = {
 				.gic_version = 3,
 				.gicd_base = 0x38800000,
@@ -47,9 +53,11 @@ struct {
 		.root_cell = {
 			.name = "imx8mq",
 
+			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
 			.cpu_set_size = sizeof(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
+			.vpci_irq_base = 51, /* Not include 32 base */
 		},
 	},
 
@@ -58,6 +66,38 @@ struct {
 	},
 
 	.mem_regions = {
+		/* IVHSMEM shared memory region for 00:00.0 */ {
+			.phys_start = 0xbfd00000,
+			.virt_start = 0xbfd00000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ ,
+		},
+		{
+			.phys_start = 0xbfd01000,
+			.virt_start = 0xbfd01000,
+			.size = 0x9000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE ,
+		},
+		{
+			.phys_start = 0xbfd0a000,
+			.virt_start = 0xbfd0a000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE ,
+		},
+		{
+			.phys_start = 0xbfd0c000,
+			.virt_start = 0xbfd0c000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		{
+			.phys_start = 0xbfd0e000,
+			.virt_start = 0xbfd0e000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		/* IVSHMEM shared memory regions for 00:01.0 (networking) */
+		JAILHOUSE_SHMEM_NET_REGIONS(0xbfe00000, 0),
 		/* MMIO (permissive) */ {
 			.phys_start = 0x00000000,
 			.virt_start = 0x00000000,
@@ -68,14 +108,28 @@ struct {
 		/* RAM */ {
 			.phys_start = 0x40000000,
 			.virt_start = 0x40000000,
-			.size = 0xbfb00000,
+			.size = 0x7fb00000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_EXECUTE,
 		},
-		/* IVSHMEM shared memory region for 00:00.0 */ {
-			.phys_start = 0xffb00000,
-			.virt_start = 0xffb00000,
+		/* Linux Loader */{
+			.phys_start = 0xbff00000,
+			.virt_start = 0xbff00000,
 			.size = 0x100000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+		/* Inmate memory */{
+			.phys_start = 0xc0000000,
+			.virt_start = 0xc0000000,
+			.size = 0x3dc00000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+		/* OP-TEE reserved memory */{
+			.phys_start = 0xfe000000,
+			.virt_start = 0xfe000000,
+			.size = 0x2000000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
 		},
 	},
@@ -103,4 +157,27 @@ struct {
 			},
 		},
 	},
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
 };
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200324164343.13403-1-alice.guo%40nxp.com.
