Return-Path: <jailhouse-dev+bncBDEN32754MOBBG45RH3AKGQE3D7WPJY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x238.google.com (mail-lj1-x238.google.com [IPv6:2a00:1450:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id 281791D7365
	for <lists+jailhouse-dev@lfdr.de>; Mon, 18 May 2020 11:00:12 +0200 (CEST)
Received: by mail-lj1-x238.google.com with SMTP id e18sf895178ljg.7
        for <lists+jailhouse-dev@lfdr.de>; Mon, 18 May 2020 02:00:12 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1589792411; cv=pass;
        d=google.com; s=arc-20160816;
        b=VnGY+Q0cQBwulYcsAdjImCpr8sOscM/KqaFo7WTgjoNefugJ3QbfT9t5zXatYlgsAZ
         b10MWTzKVW0G7WeQvOjtcecxq6xPpxi0+nzu16MTq34EcxJeprAo4BwFzLB82T8KvDST
         IQOSgn3jIMiJeDKsuWz9Q6IDjOhx+NnRXTlTiRDfvE0vDXW3wevcSiq9VlzpStShlMYG
         JDxocfY5eDfUxokXzALcmhsGrL0qGra0ow5qthF8IzKkYFeuizGJmLJsdQ+RR7iDfRij
         lXR8prGaZgKiENY5lIZnRuOqAJ7gKfIq8vec0SrDBjUDsXoA8TOVpYU10iB/bDXYMZ1D
         sV8Q==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=jxq0neLHNYw5cYUabS9zf3bj05Mqz+30EV2g7DPnGLE=;
        b=BUqEQ95or26+N/Hfx/cscf+AvE2FPflHP6SsCfLkHkjyMqPgzGJt/pMFKbn/hCNK5c
         j8+xoXpgQidj2oSoXp56a2xzV6NMZ5u46rpm20SuQNBUhXW7Hf0sPS5yll/NlHT1/DBM
         E2NDq6z1mTT6U88996+zMOcbMjc+Caj9NfXhN3Ys3ODAYTl6V0UdukWDEsplypEGa+bO
         tp81D1ykh5PsDwABkkWe9SFrz+hF45boPv91pDCTu902kffEvGUd8zP8nuW+PYRiXprQ
         qk0AlIAag2Yl6SKDCCsvj+HH3XDWOhSOFjHznvJpqaYpqnLX4hCzZi+/GBtmo67fezMi
         gYsg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=NJyGN3iC;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.14.52 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=jxq0neLHNYw5cYUabS9zf3bj05Mqz+30EV2g7DPnGLE=;
        b=RN/wKH/CvHByWdviSIp5DL8EzOQxoiDg0CXPd9NcJ0fYobA/dKHTH+PbwWtazLRH58
         SX8bD5BVrbcuGzn3cmnm8OO+4os6Kg4J/xJKC5E8tOkQ3+a4KMbxmJUKqOptv+tIcP8+
         B3bXfx1VZL7bJ/m44mQK/MMFycJF/HoUVekYZWOYTbg6pHIc7uzGCg3DFbCPWO9igztp
         ctXtg5AYjZgi8UePodwK6nzJf0rVs1EOQ7UVK2jvAf/kd7IBE5cyGQMupU7hfjJMADsy
         AYKJCKlVo9xbEP4yy2/88tTJtIqCZPty9C+rOLMfppcomt/sVLi9DQHUMi2urVE+G0cG
         Rinw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=jxq0neLHNYw5cYUabS9zf3bj05Mqz+30EV2g7DPnGLE=;
        b=XPqnS98Q2hn/9e1M6+8MMmc1gJUZ7BQzBKuvDn8B6qT+ArMmUkk5djRtpQq3RufaQz
         LTOIEM1EN0eZSAWMo/L/ghB8S8ZtS6NAndr0R64MFBy47GzXknpq0oUqmnGcf9OnHJJs
         cr+oZwC1yrEKe8uSs16QZ8H6VuIr4yfySOo3CavYQhAgIbwOwefC194jnr6StiIlLpZH
         nzsj09AxWpye43UOYkVza8yjFpC1/cXohISlexjOtuMkewR+UlqF41uA+yn23VGm14nX
         r45mr4dM7UVCdtvm00YIAweRBMtDH1ZmC/5KiaqnkZ+TZta8xZxr2Evk4d3sA+uCuK8+
         SB4w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532Xk5UW/y5VhcMKfZSd9U1W8wAyYK0Mry0wCSFvkhRRKCSH38bL
	pBa9o04PAccgyuneJEY9KG0=
X-Google-Smtp-Source: ABdhPJxRVxw5H0BgwI44XvhlqbmGJpEnmM8O8XgA+qi1tkwagU7Bvv93WO4/cITG9O1DmrGhCIckBw==
X-Received: by 2002:a05:651c:549:: with SMTP id q9mr10030731ljp.236.1589792411644;
        Mon, 18 May 2020 02:00:11 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9ad6:: with SMTP id p22ls1581182ljj.9.gmail; Mon, 18 May
 2020 02:00:10 -0700 (PDT)
X-Received: by 2002:a2e:9bc3:: with SMTP id w3mr9914647ljj.170.1589792410458;
        Mon, 18 May 2020 02:00:10 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1589792410; cv=pass;
        d=google.com; s=arc-20160816;
        b=A44BTzn9XZAnxeD5O4LIn7UE6lEO8TKhEMhn+YDoJYsszaO2om79ioJ4MQTASnTiSX
         NBFPohshRuxewbF6FEIo3AJbERm41XS4uFS/WUKVBx5xwlkjbJs1v4dMtdxSr6QTQmpc
         gCV//CtcOiBixIwzkYFC+uh5mSi2hn2ekXywRthTljqZpZLGQOLgEW4h/PsK50gRWpEB
         cyr+AwHNqB0Kw9fXCRJMnzhpGPVLCb3aG1S4l/JgXh8PMTdWyNrb3A2rzqztb4SSChAz
         hvXE1vqVjisvJOpLmw8afajGPFRUUs1J2IIVDEqZYy9WaK1YsPNsSUEgA01tK7JN8hBd
         ikrw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=4nlrNjBSCmAfqJqNHKISVtJ+9Pd6Gu7gNZEgfIaPYhI=;
        b=hanLSzznTS0rILanQQYO70fDjFPPsjGsPdqxceSs9Iz3Lh4Vfdld9qt3CfGLxBCFF5
         wGBBwDUKdB317hZc/jvC3108Sp3pZT2k9Lvv2ODukbJuAKJ0h96CSF3kPGqTD12iK0E6
         bHDvEvxj33k2MTuqOdVDJghF3UQuLfdW/jgDRU38k8jC5/gyQ5WSbDs/1C+QvWeJ5OqK
         K3mq+e5v7+uyQlURGAqaAEiX3u71Irep4gvK2C/9lsvHNer9fUkN2t0UI0z5b4FoXkEL
         p8jcyLe8vhXxL3MXXSCQpuFiz8huBTBiY8gzx6n7oJ9R2XJkN6OyAfPeobLfn6ZqnGf5
         t9Kw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=NJyGN3iC;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.14.52 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-eopbgr140052.outbound.protection.outlook.com. [40.107.14.52])
        by gmr-mx.google.com with ESMTPS id i186si372032lji.0.2020.05.18.02.00.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 May 2020 02:00:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of alice.guo@nxp.com designates 40.107.14.52 as permitted sender) client-ip=40.107.14.52;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AAIi9NG0IPrHKV1WEaimcnJNAdNPm9lX53Me5jFI/aRyTfzAjb6jhEBCD/D+BJFhGuoKifHRwq/G6bxKlTpWb8i1sEr6LnvOlVCB3KRUAsob88+Lk13CzBs73kM7EfUBIf/bEf4UAM9aD+WMEDCtbljnl5bXrb8ONStejp1dg5q6mnLfzg+11fC3MunlV2SZCgLoiqF+UOsdOnyBzCf5d3slQMc+CJXsUzb7gMNABdGeXxS+aLxeIwwAXzm1apr/JFSf/oMN8qiVltflYNXO7uTrw3GRLlIvd6p6+m8n2ixgh/ivBOYNv9AjQF2n7nflPLRaTicOUHmo3gIXDizOYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4nlrNjBSCmAfqJqNHKISVtJ+9Pd6Gu7gNZEgfIaPYhI=;
 b=DvTw6Y0DAXWMLonaleDwTir0PN4+D77E403EuajZfOQmKdYgSDZ+Nsl+tnuUVAh+C0cY3ghILyvqQIA91TShFyXVNaDTjeMriuOAZXIwCjKB8aL8qUlLzAF1jycjOat2r1y3mSsuPiHKJhimZy7AJh2Qa+MHHYFLnf47/cgxCdegr8L7QdDVDkhrsDiHyK7B5dHaJrcl25Ab5KOnbYe2PkeVD766bE5/NbPA/x1jWKAXS4kxr33KFyMC145QwKFA8tPr2Sr+n3HW/hL2LitUaEeUrHU6NEfTkAh4vkIrvQHxF+TlVmbDguSbQV017Q3ZPBVsyuFhhdxYCxI1ix02XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com (2603:10a6:10:127::9)
 by DB8PR04MB6780.eurprd04.prod.outlook.com (2603:10a6:10:f9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.25; Mon, 18 May
 2020 09:00:08 +0000
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::780f:6f6c:db24:2418]) by DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::780f:6f6c:db24:2418%8]) with mapi id 15.20.3000.033; Mon, 18 May 2020
 09:00:08 +0000
From: Alice Guo <alice.guo@nxp.com>
To: jailhouse-dev@googlegroups.com
Cc: peng.fan@nxp.com,
	Alice Guo <alice.guo@nxp.com>
Subject: [PATCH V1 1/2] imx8: add lpuart support
Date: Wed, 20 May 2020 00:00:16 +0800
Message-Id: <20200519160017.19881-1-alice.guo@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: SG2PR02CA0044.apcprd02.prod.outlook.com
 (2603:1096:3:18::32) To DB8PR04MB7065.eurprd04.prod.outlook.com
 (2603:10a6:10:127::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nxf55104-OptiPlex-7060.ap.freescale.net (119.31.174.71) by SG2PR02CA0044.apcprd02.prod.outlook.com (2603:1096:3:18::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.31 via Frontend Transport; Mon, 18 May 2020 09:00:06 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3b11cb5f-f7be-4006-c4f5-08d7fb09dd10
X-MS-TrafficTypeDiagnostic: DB8PR04MB6780:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB8PR04MB67807FA4DDCA96DC835640F7E2B80@DB8PR04MB6780.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 04073E895A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1Zcsd7Isg0Pu0Yn+BkC6x6MxY8KzIN7FPjV0e8/MgyiBM5w0DD6zISU7RGhuZJXHaq2Thef/laZ+Du3UtnB6V+3BZvLb0GrMFWF6y9a27TSrhZILi2BYQlqCMkis5Ay9S8ncHfmbOAxR/ATE4Fx/hCRY8cvLP2jrdT3AnVByUoiFYbfekzviZ8hyPeXhOlh5T2YwS9C0noxULc5ik2ImgZU7pGwxBvSvvPyXSPBFCLkZgCABfslnjXQpY+KKDw919ohni1ldSjiHIHI7Fcmsq6u3OUAlTLsE15nD/lox9hGXupuMSwxits9n2X5+m8rbQsqCZkqxsFTHwwF6IldStkNFB0LuvMTsLrcydMNbNnrYL4B+WtECD1a6r0NbdJlotWHQn3KLDM798N7oHTfTgSXntdqbq9fh8pqy9fodSvP3mMa55uyb0khJJwWQRtCZ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB7065.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(346002)(396003)(366004)(39860400002)(136003)(8936002)(5660300002)(8676002)(186003)(16526019)(2906002)(86362001)(66946007)(44832011)(66476007)(66556008)(2616005)(956004)(6916009)(6486002)(6512007)(6506007)(6666004)(478600001)(316002)(52116002)(26005)(4326008)(1076003)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: zrgLkpxFrrgULb4E8/pkis0J65YIZLxQjp1S0LwL8T5gQ0IfN5y/wKfOp5BQY41Z2RX/yeZscWaIANnurhsDZLxvjs7Z6P7MERjB42dWV4dS8k6n783OpH+m7LK7phVfbmpdcvJDtuayys4UVSkv7oiwOl0V6hW+mW2mVNqo7qlZnckHrIh1cchjuTK/b0QOY71NKwOkyploJGuuBFilrBGQkhFJKPMrazdp9woN7BS8o3ivnDVRSkFuV5ZSBOQ1lQdKJjLfLnwWF5whWBvtUI9MyEn4MWFlUlfbDa4ad73FNRkLy7WlK9EyIS4w8M6gd1u36nGxWa6VlqonCRMB1Fs3fa/HOLHZ6ySsj5P3uxBTFUEET7J0ndS2g1oH7Mk9Eps4ux8OR34glqelwRC5JSiJ/h2O4rCG5EP8ARLp1VZMYhRzQl1E6BCCNo7hKeYbD0w/bC5gnYk1MIftRiHhubJ4GwXkYGMwNNhiW1aJSLc=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b11cb5f-f7be-4006-c4f5-08d7fb09dd10
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2020 09:00:08.0127
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hZvhHN1FbcN1uY0h7ImstXhEjP65X8LZVfCRNId4T3C29ezcm+IzOxpHUtLs4Y9tuyGuHuHslyD9RN/RLARKUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6780
X-Original-Sender: alice.guo@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=NJyGN3iC;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of alice.guo@nxp.com
 designates 40.107.14.52 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
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

On i.MX8/8X family, there is only LPUART. So introduce lpuart support.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Alice Guo <alice.guo@nxp.com>
---
 hypervisor/arch/arm-common/Kbuild             |  2 +-
 hypervisor/arch/arm-common/dbg-write.c        |  2 +
 hypervisor/arch/arm-common/include/asm/uart.h |  3 +-
 hypervisor/arch/arm-common/uart-imx-lpuart.c  | 38 ++++++++++++
 include/jailhouse/console.h                   |  1 +
 inmates/lib/arm-common/Makefile.lib           |  2 +-
 inmates/lib/arm-common/uart-imx-lpuart.c      | 58 +++++++++++++++++++
 inmates/lib/arm-common/uart.c                 |  2 +
 8 files changed, 105 insertions(+), 3 deletions(-)
 create mode 100644 hypervisor/arch/arm-common/uart-imx-lpuart.c
 create mode 100644 inmates/lib/arm-common/uart-imx-lpuart.c

diff --git a/hypervisor/arch/arm-common/Kbuild b/hypervisor/arch/arm-common/Kbuild
index 78b9e512..ab86eca6 100644
--- a/hypervisor/arch/arm-common/Kbuild
+++ b/hypervisor/arch/arm-common/Kbuild
@@ -16,7 +16,7 @@ ccflags-$(CONFIG_JAILHOUSE_GCOV) += -fprofile-arcs -ftest-coverage
 
 objs-y += dbg-write.o lib.o psci.o control.o paging.o mmu_cell.o setup.o
 objs-y += irqchip.o pci.o ivshmem.o uart-pl011.o uart-xuartps.o uart-mvebu.o
-objs-y += uart-hscif.o uart-scifa.o uart-imx.o
+objs-y += uart-hscif.o uart-scifa.o uart-imx.o uart-imx-lpuart.o
 objs-y += gic-v2.o gic-v3.o smccc.o
 
 common-objs-y = $(addprefix ../arm-common/,$(objs-y))
diff --git a/hypervisor/arch/arm-common/dbg-write.c b/hypervisor/arch/arm-common/dbg-write.c
index 64dfef20..d4cd4399 100644
--- a/hypervisor/arch/arm-common/dbg-write.c
+++ b/hypervisor/arch/arm-common/dbg-write.c
@@ -38,6 +38,8 @@ void arch_dbg_write_init(void)
 		uart = &uart_scifa_ops;
 	else if (con_type == JAILHOUSE_CON_TYPE_IMX)
 		uart = &uart_imx_ops;
+	else if (con_type == JAILHOUSE_CON_TYPE_IMX_LPUART)
+		uart = &uart_imx_lpuart_ops;
 
 	if (uart) {
 		uart->debug_console = &system_config->debug_console;
diff --git a/hypervisor/arch/arm-common/include/asm/uart.h b/hypervisor/arch/arm-common/include/asm/uart.h
index 9317446f..f620501d 100644
--- a/hypervisor/arch/arm-common/include/asm/uart.h
+++ b/hypervisor/arch/arm-common/include/asm/uart.h
@@ -11,4 +11,5 @@
  */
 
 extern struct uart_chip uart_pl011_ops, uart_xuartps_ops, uart_mvebu_ops,
-			uart_hscif_ops, uart_scifa_ops, uart_imx_ops;
+			uart_hscif_ops, uart_scifa_ops, uart_imx_ops,
+			uart_imx_lpuart_ops;
diff --git a/hypervisor/arch/arm-common/uart-imx-lpuart.c b/hypervisor/arch/arm-common/uart-imx-lpuart.c
new file mode 100644
index 00000000..aa8a0897
--- /dev/null
+++ b/hypervisor/arch/arm-common/uart-imx-lpuart.c
@@ -0,0 +1,38 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
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
+#include <jailhouse/mmio.h>
+#include <jailhouse/uart.h>
+
+#define UART_DATA		0x1c
+#define UART_STAT		0x14
+#define STAT_TDRE		(1 << 23)
+
+static void uart_init(struct uart_chip *chip)
+{
+}
+
+static bool uart_is_busy(struct uart_chip *chip)
+{
+	return !(mmio_read32(chip->virt_base + UART_STAT) & STAT_TDRE);
+}
+
+static void uart_write_char(struct uart_chip *chip, char c)
+{
+	mmio_write32(chip->virt_base + UART_DATA, c);
+}
+
+struct uart_chip uart_imx_lpuart_ops = {
+	.init = uart_init,
+	.is_busy = uart_is_busy,
+	.write_char = uart_write_char,
+};
diff --git a/include/jailhouse/console.h b/include/jailhouse/console.h
index a6efd37a..34dd7209 100644
--- a/include/jailhouse/console.h
+++ b/include/jailhouse/console.h
@@ -49,6 +49,7 @@
 #define JAILHOUSE_CON_TYPE_HSCIF	0x0006
 #define JAILHOUSE_CON_TYPE_SCIFA	0x0007
 #define JAILHOUSE_CON_TYPE_IMX		0x0008
+#define JAILHOUSE_CON_TYPE_IMX_LPUART	0x0009
 
 /* Flags: bit 0 is used to select PIO (cleared) or MMIO (set) access */
 #define JAILHOUSE_CON_ACCESS_PIO	0x0000
diff --git a/inmates/lib/arm-common/Makefile.lib b/inmates/lib/arm-common/Makefile.lib
index 3d7b335d..c13696f3 100644
--- a/inmates/lib/arm-common/Makefile.lib
+++ b/inmates/lib/arm-common/Makefile.lib
@@ -40,7 +40,7 @@ objs-y := ../string.o ../cmdline.o ../setup.o ../alloc.o ../uart-8250.o
 objs-y += ../printk.o ../pci.o
 objs-y += printk.o gic.o mem.o pci.o timing.o setup.o uart.o
 objs-y += uart-xuartps.o uart-mvebu.o uart-hscif.o uart-scifa.o uart-imx.o
-objs-y += uart-pl011.o
+objs-y += uart-pl011.o uart-imx-lpuart.o
 objs-y += gic-v2.o gic-v3.o
 
 common-objs-y = $(addprefix ../arm-common/,$(objs-y))
diff --git a/inmates/lib/arm-common/uart-imx-lpuart.c b/inmates/lib/arm-common/uart-imx-lpuart.c
new file mode 100644
index 00000000..bbbb53f2
--- /dev/null
+++ b/inmates/lib/arm-common/uart-imx-lpuart.c
@@ -0,0 +1,58 @@
+/*
+ * Copyright 2020 NXP
+ *
+ * Authors:
+ *  Peng Fan <peng.fan@nxp.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ *
+ * Alternatively, you can use or redistribute this file under the following
+ * BSD license:
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions
+ * are met:
+ *
+ * 1. Redistributions of source code must retain the above copyright
+ *    notice, this list of conditions and the following disclaimer.
+ *
+ * 2. Redistributions in binary form must reproduce the above copyright
+ *    notice, this list of conditions and the following disclaimer in the
+ *    documentation and/or other materials provided with the distribution.
+ *
+ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
+ * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+ * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
+ * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
+ * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
+ * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
+ * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
+ * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
+ * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
+ * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
+ * THE POSSIBILITY OF SUCH DAMAGE.
+ */
+
+#include <inmate.h>
+#include <uart.h>
+
+#define UART_DATA		0x1c
+#define UART_STAT		0x14
+#define STAT_TDRE		(1 << 23)
+
+static void uart_imx_lpuart_init(struct uart_chip *chip)
+{
+}
+
+static bool uart_imx_lpuart_is_busy(struct uart_chip *chip)
+{
+	return !(mmio_read32(chip->base + UART_STAT) & STAT_TDRE);
+}
+
+static void uart_imx_lpuart_write(struct uart_chip *chip, char c)
+{
+	mmio_write32(chip->base + UART_DATA, c);
+}
+
+DEFINE_UART(imx_lpuart, "IMX-LPUART", JAILHOUSE_CON_TYPE_IMX_LPUART);
diff --git a/inmates/lib/arm-common/uart.c b/inmates/lib/arm-common/uart.c
index 8855d476..90a322b5 100644
--- a/inmates/lib/arm-common/uart.c
+++ b/inmates/lib/arm-common/uart.c
@@ -42,6 +42,7 @@
 DECLARE_UART(8250);
 DECLARE_UART(hscif);
 DECLARE_UART(imx);
+DECLARE_UART(imx_lpuart);
 DECLARE_UART(mvebu);
 DECLARE_UART(pl011);
 DECLARE_UART(scifa);
@@ -51,6 +52,7 @@ struct uart_chip *uart_array[] = {
 	&UART_OPS_NAME(8250),
 	&UART_OPS_NAME(hscif),
 	&UART_OPS_NAME(imx),
+	&UART_OPS_NAME(imx_lpuart),
 	&UART_OPS_NAME(mvebu),
 	&UART_OPS_NAME(pl011),
 	&UART_OPS_NAME(scifa),
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200519160017.19881-1-alice.guo%40nxp.com.
