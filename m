Return-Path: <jailhouse-dev+bncBDEN32754MOBB5EHUP5AKGQE64R3YGA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53b.google.com (mail-ed1-x53b.google.com [IPv6:2a00:1450:4864:20::53b])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE672556AF
	for <lists+jailhouse-dev@lfdr.de>; Fri, 28 Aug 2020 10:44:37 +0200 (CEST)
Received: by mail-ed1-x53b.google.com with SMTP id r21sf67741edt.15
        for <lists+jailhouse-dev@lfdr.de>; Fri, 28 Aug 2020 01:44:37 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1598604276; cv=pass;
        d=google.com; s=arc-20160816;
        b=TFBJcqLcLhbaKoXOKTd/LtWPvc4Gbc+6dKoC3eOtyc/HZlCdDbPZT16YiWLBmPdh0Z
         gQY84z7hYJfw8CfkjhezKpQzdxwL6n7d9+KDwgk09nuTH0dzAtPAQNZTiWRxLAHwUm+e
         3Phv17zvR53WGOu9e2u8f5Ao/Yq7vblRNXbAGDZB1ravr5gv7YaOmb8m54+HTbJCbPbO
         ynG55ZCc99gfIccPQY34d60OZsumVtBc8B9LXWe/HeOLiV9ddo4zRzaGjSL0A4sINAIl
         MJAgYgkvqKjwQZbHAGBtMW4J9SbuRzADaJIJpXhkeeL7GsbbqAtEVCd9n0jjxHrzMg9x
         EMQQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=IBq6fLZKyU9hQT6WSPOnQjjxsUghqDzdegN1Wt5X7mg=;
        b=P4qGSkCs//+a7t9Plq0StOCHKIsuWFbWmKxIaL/BrN4LKkEBdP1mZ1dP1LLRy4MoG/
         7yUXyqZ4Kxmp+hZjBnW/+cVt9M4EeKXbbH3TKCuwryj0QLQMaWCYpXV3GHDpzG65z4nG
         fiDrQZHiVltR00qS7P2cRccQm4hjU3z7fkdnhK+vJlc7yR2g+JPZ6mtCCmleGrU4vmfX
         Hl/NHC1w8srapeV/aIj8qxvL+gEbmFmoSB3aCtB1vPeyjXjdPzaD+xU+FyDAecPSd5Qd
         UFaZH2LdmXmjzCgHo2+g5YPrFPm8o0/X85XVav36FiS+BpTinfi530PX0iEFwYuvXlVa
         /I6Q==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=WHvDYJy0;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.20.59 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=IBq6fLZKyU9hQT6WSPOnQjjxsUghqDzdegN1Wt5X7mg=;
        b=fZDXprtmjrge5VJqyEI371dxlmi+3x/g7Fcntl39OxcA5BskhhUtNAu9MBM+5XVEiH
         3zNGUot1VB4keFqqc7MNbLpq8N0QTPQQClyqSb5T3fvYsU6/kqU08DNK8/RDHE16fkQE
         TL4xZVHDNr1oEfTn2K1lc7gLaAOoiS+iodxsfHWwqFUucTuujtvSOKcjs1hoZHUrG3I2
         LnSHMOr4InVZ660dYRcg17o8mer7fA04+rbqX0FtlWJUSwxrZf74RJuiH94+yBAIsznb
         Q5uD8ZnqVuN3UGVmWzN8OzagrlarhwGISUi3RcQv/iLm708dtKf+Gh0n912b/HVXUNTO
         6wGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=IBq6fLZKyU9hQT6WSPOnQjjxsUghqDzdegN1Wt5X7mg=;
        b=dXqVwpQt7o2m5ieGv1XEpujfoe1AYqvEVC7YGzNhQeiaYbWDkyzlEUl6iMyNVrlYXD
         viGXhEJRF+5vg/EPBDsVG2tZZLKUGkFejiT9WnRX1iRePC26JzN4Bi37GFgIB0cyIIHa
         JxAmnEajo8wIgxaoPDgz/SDMGk2heyC6qyuWjOmMx3yKjGS7q1153uwn/AFGdfiqQ/cf
         sNGz7zrc8YyNPf/6tes711Z5C+EDqmz1K1mxQv0lvvVw9Q34KSOHBYEf7pZe40vn/tE9
         H6oJD4vWQVcdLNhkZQqcUOB/0bvqZFd3MXyeDFT6OldmK2icZZ8eMtzS4RQqYiR6O9CQ
         ojhg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531Cqcf7pHqEe+zkuIQ1l0HJUgxrXF/snfG7kdLZkXckMAVcgW/R
	hsmBia4PnUwqVb9KLPrQSwA=
X-Google-Smtp-Source: ABdhPJyqpPYf5mQ6VUkImy9ZzkV/hOWT6pX0V+dapdHQBbmSzAQNOGTbNPWOurcsOZiqyO/rbCbApg==
X-Received: by 2002:a17:906:1b04:: with SMTP id o4mr741497ejg.332.1598604276830;
        Fri, 28 Aug 2020 01:44:36 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:e44:: with SMTP id q4ls266084eji.3.gmail; Fri, 28
 Aug 2020 01:44:36 -0700 (PDT)
X-Received: by 2002:a17:906:a00d:: with SMTP id p13mr697304ejy.535.1598604276116;
        Fri, 28 Aug 2020 01:44:36 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1598604276; cv=pass;
        d=google.com; s=arc-20160816;
        b=b2g6sgVWN0zw3OAZZBpWZZDGqh0CUpE7B/vJHxjoNIZOgKUZiVuHC6Y9MJ6KFim6Ch
         WB1PoWXKnT5cNQ5W5JUNgFn3GbtuG6S0KEVtag5xuvb4AnDB54ul4fD4sykyv+Jogzb4
         J97ZffVh+jkj4/1J/ZFQmGqfjs4V/mPmkOzBdpFFeE9UMTtudYgggi9ZKT6sQJDNK/xZ
         cMn/uFOu08cJN6QrpD+9UVqdR6yafIN2wWxUqre65jOH+7t6o+zIC5s3HHM5FSF0l7Ag
         NmpxtS4FJ+8Odf/wUn3VZyCMPTJXvTb9ioKyYTttgcheyPnHXzF3E/fiw2VkC8PkT7IE
         vkVQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=VqC3T9vB7sHdSgE0315OyMOfurrhAUb7c4MCZKwNDd0=;
        b=gwqV53vCG+uhfpzAat5TI7I0f7CZmt0ovmVBqqLwtM8bJ5f3QW4GQ26A5BVhThe3pP
         Z6v05iXoWRzHCNPMtGvBQlRGmR2Yv31K4hschdgLBKuqwXHktMCRvg86bLLiinkWWbjd
         YvQQ7zapddgI92O+y7wS5buD703VTijB1Rm6kaJDIQC6T/k9yMrLzG2pLW3ai1UNN+7D
         F+Bx5vuh7o/d3Vsh7yfDb20YAXrx95dsWZiDx6n9GpTqJk4H/otTE1suGyx0nBKjtylP
         fBu0W4cS8gX1s5QerVY/yyoTsTt8/w9cx3HUmBuTDe5Ggk9EfL7g7ynZC8qfRZWCh3m1
         7y9Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=WHvDYJy0;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.20.59 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2059.outbound.protection.outlook.com. [40.107.20.59])
        by gmr-mx.google.com with ESMTPS id e13si21967ejd.1.2020.08.28.01.44.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 28 Aug 2020 01:44:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of alice.guo@nxp.com designates 40.107.20.59 as permitted sender) client-ip=40.107.20.59;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MqQdswv0eNHDsHoeLCHHCfW3MFu1Q2YgANdHq2j/QJ0xRA3pHCyxVXLp0Mp50Ixfz9MQ8FakYOlU1K9fWlUOykhV9l2Bt5o17eq/7oT725yu6qhEHa7ILYvGNnhK8mgq9/OqEutXaymrYKBlZpX6uMsfquda/IIcLAx/hW6bHWWKeVbQ+jNRe+iwMSOiwrHClvqLVPJdRtkF+ae4KNoWTxdyJ6wJv8GcrtuwYzsQoj4HTT9xXuNOIHElh0KFQ1B4pltCxId37ab62fj7lO4GJSJTbheEp3GWdwTidQmSlxzRwZ4yCQ9HcKX0Rxc2MW5QSt+lG/FtiNXTjKb6UA0YeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VqC3T9vB7sHdSgE0315OyMOfurrhAUb7c4MCZKwNDd0=;
 b=JWUL3oTIlzaQbaPjfdUfCeSbm4KoYXxZHy0oG2GD6gfwZQqAEYGESVDLezgvz0V/FlIWhMefgkOoHDXsS0aDrysBQDenulPfwMxHl3i+rbKEMxrO/cBMgybRY/X2nfEE9wV4rpe+vV5iTKVzXVuU214lKz3K0U5ItQtDdSkVIx1FsPjhENxzKK+QHFU2pMQgaScvRlbkchjgAkfQ6On0aR1t4VgisBDiQ0XDIHOIEU93j2Cv37q9pWBCWtGV7y5JUW4dkdv2yt1oYzwgTI7tIESu3AdG+NZzjUjOhRhyvXa2Y9eaBzdu1iIBxrT09kJJ60kyzWx81avnASjcqMGyBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com (2603:10a6:10:127::9)
 by DB8PR04MB6651.eurprd04.prod.outlook.com (2603:10a6:10:10e::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.21; Fri, 28 Aug
 2020 08:44:35 +0000
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::5042:d7a1:10c0:c40e]) by DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::5042:d7a1:10c0:c40e%6]) with mapi id 15.20.3305.032; Fri, 28 Aug 2020
 08:44:35 +0000
From: Alice Guo <alice.guo@nxp.com>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Cc: peng.fan@nxp.com,
	Alice Guo <alice.guo@nxp.com>
Subject: [PATCH V2 4/4] configs: imx8qm: enable SMMU-v2
Date: Fri, 28 Aug 2020 16:44:25 +0800
Message-Id: <20200828084425.21282-4-alice.guo@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200828084425.21282-1-alice.guo@nxp.com>
References: <20200828084425.21282-1-alice.guo@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: SG2PR01CA0157.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::13) To DB8PR04MB7065.eurprd04.prod.outlook.com
 (2603:10a6:10:127::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nxf55104-OptiPlex-7060.ap.freescale.net (119.31.174.71) by SG2PR01CA0157.apcprd01.prod.exchangelabs.com (2603:1096:4:28::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend Transport; Fri, 28 Aug 2020 08:44:33 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 42dfe6b6-2f95-44c9-7436-08d84b2e9702
X-MS-TrafficTypeDiagnostic: DB8PR04MB6651:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB8PR04MB66516B18C4C85DC97829617EE2520@DB8PR04MB6651.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N1XFs++VS+n2TRozcW83RGEOmMdBrI9tqxaCqsNnViUleCsMI1i1FAumbD1lXJCRLXbafpaB+kK0J8jBhXI0iMov2tBOyA48CEIMEQ11oqtzDB+BB+pBD+E68NSAen+p9S8RGW7rhBV4ZY/KvEeA9mTqibD9YbjrBs4/ZZVRwf4FIF9VBWUBkHywztTAxyBCZntOeEegqMLCzgSTDtV8ci+ntGgDDFbgvVjVp7iXL6MywxSolU7t+iII0EoxeUVfD0DC1gn3C3aE4PSG6nfSbeDU9vS5jDZ986+m9CNBqQ/ilCe9YMEs9qFjeeC/AOgV6+xM4Z2Sd1TelheYUL+akKp/VaWvuLE4jT6ksQaHAaQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB7065.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(346002)(39860400002)(376002)(136003)(8936002)(2616005)(316002)(4326008)(36756003)(52116002)(956004)(26005)(16526019)(6506007)(6512007)(2906002)(6486002)(186003)(44832011)(6666004)(8676002)(66556008)(83380400001)(86362001)(66946007)(478600001)(30864003)(5660300002)(1076003)(66476007)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: /yfJKLO6mj7vJZqzskMZJCt3wtilnukoECh9jCYhRDyfuDLv9AIGMIAI4Ei5qcbFRhriEE3LwUnCBqe3zwXflGeiPNcaMHt4HZt77vnqrHdJPzfANbrbC0UvmnX/Kmucg5lyEGx39DFvuUB0W6Fuw5FPrMJnxo7kv4B3HPQFsWyLTHxFc2n5T0je11UTzDLRC2FKS1MWYdQYUNIixjHtybsQ0gwx4nnZjf9tt7je8piZ6kyjgJZRKJIWKD9Zx7CTL5segFCLwP58K+ede3qLkg6CeNe+jsd05IdQua9vGLaGVUeQY9Q9/91gTvzCFbsLhi6UMJ/zW4pAI7HjiRAXN54DAv8etF469sqFl+FLypyozDSh4BNF+6Yon5SDu75lwAdrWpoR4M2Urw2HFknoiYOmnpTT7GvjAzyB6PpoP7BOlPbtkdhuoiN9rryD3xhh8j42yeW/y8T4leA8RUUboM4PLQAi8TtL2gp+XcY/xugGfzdVAwqFJpd/HZxxCdJoUTTfhk3eGXindKO88UyL/ybgeU8UQ87o8sdvIqqJ6q58d6NuFVM34Cbn01lOFNTXLLsfjC3cDvslNFOoUTqRN+vnJFYQXnUAUClovs1+Y2FV+Hawwe21l07ZYE65uuStFJflmFkEcR860HNv0suUBQ==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42dfe6b6-2f95-44c9-7436-08d84b2e9702
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7065.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2020 08:44:34.9354
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: td3exb7NQmxK4tbCMhly5i0ZJQfllAmRv34wCdWuQLOoAHK4+ZriS/f47Y7ofqOGjjzP3ubEFPrvOTDa1XWHXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6651
X-Original-Sender: alice.guo@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=WHvDYJy0;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of alice.guo@nxp.com
 designates 40.107.20.59 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
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

Add root cell and inmate cell configuration files for imx8qm, which
enable SMMU-v2 on the imx8qm platform.

Signed-off-by: Alice Guo <alice.guo@nxp.com>
---
 configs/arm64/imx8qm-ivshmem-demo.c | 124 ++++++++++++++++
 configs/arm64/imx8qm-linux-demo.c   | 199 ++++++++++++++++++++++++++
 configs/arm64/imx8qm.c              | 214 ++++++++++++++++++++++++++++
 3 files changed, 537 insertions(+)
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
index 00000000..f57540f4
--- /dev/null
+++ b/configs/arm64/imx8qm.c
@@ -0,0 +1,214 @@
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
+					.base = 0x51400000,
+					.size = 0x40000,
+					.arm_sid_mask = 0x7f80,
+					.arm_smmu_arch = ARM_SMMU_V2,
+					.arm_smmu_impl = ARM_MMU500,
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200828084425.21282-4-alice.guo%40nxp.com.
