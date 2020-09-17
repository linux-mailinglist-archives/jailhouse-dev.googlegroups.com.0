Return-Path: <jailhouse-dev+bncBDEN32754MOBBM6BRP5QKGQEV4KZBDQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x340.google.com (mail-wm1-x340.google.com [IPv6:2a00:1450:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id 0546226D209
	for <lists+jailhouse-dev@lfdr.de>; Thu, 17 Sep 2020 06:06:12 +0200 (CEST)
Received: by mail-wm1-x340.google.com with SMTP id m25sf254276wmi.0
        for <lists+jailhouse-dev@lfdr.de>; Wed, 16 Sep 2020 21:06:12 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1600315571; cv=pass;
        d=google.com; s=arc-20160816;
        b=GYFbAfpWYJEM9lMvRP4ItiTLNvY7jSLbQbbPacZhGTUx2FRniq/TreSnt5U2Gh97ry
         rnl/0gd9/Oa6tvMS4TGjQcJMGth0PW1fC2ioqnwNPAMulv9DgcvqDune+dDr+rSp1E8w
         T0AIyVJppXOJR68E4rcqS4ZPzwXEvJy2jk/iFGmKQlSSM5e16IINpzzfqoeLNHCvrniL
         xw1p+yZCAe7pluS/hfmdXPzMsizTBwEE0Cjk91wh+oCPixJeyWcg6+dCuqvsEynJ97Sm
         xB8/YHfdGLvLZvhYvJFkSq89DNRL8B9+87ii2DZuQAUOyVZa6tSHDYWvU2BQIEwPSB+5
         FPBg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=uADSYkPzQR4PFfdVSYNkCGIx5VT2Z6hKscFh0I+eBr0=;
        b=KvC5nn/GV8oECx4kEx9DbnktZA9BpSdaUbE7KEdOxwKiRabQ6e5kJ/BOANDZgGAjhV
         CphCUNYTbyNefy4fejS0pIbvwQWdsw2BOQy89Bve6FY6DlD6Ng1HxPYZkts415MosTlU
         rAkicqWnDTs87FCi67ZaHaO5Pnx8skT5Ie5vso8K0UAh82c1+XXG+UOa0KKqmxE1SZwL
         fu68ULx2SFjhaX141PYQmfmjJ6MyRlBsjELQp7nSpoJg9r7dF+9a4Fj9GjEZxwM40DPY
         3REv3rsGx/diSzahSHoMa51y5Obyi6o4q9nYJIgRvdOPgsiIKjUm9iTuwCijd6NSyCPG
         0LQg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=Wo6ld9CN;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.5.40 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=uADSYkPzQR4PFfdVSYNkCGIx5VT2Z6hKscFh0I+eBr0=;
        b=Y/e3Y8loD1eFJGrdy1knLG8JNSiTzK2bjpQ8cxWQc9OWJyDRskpYG67wo+PUTqWzR0
         lffQ3oXA3GvZgLFQl1/WG1WUAFPE628Illp5ju9LqPZU5kg0Xfbff47pd1DaRjUYryKG
         xUiiV7HaOwZoKZURUzAUSW5+r0LLvRVmsd7r+KqG0F2bYWYdVkh9M3rlwtXyDkh+DMmy
         6ZXZe77MI9faksXsTodC/TYZeVX4LXu6P1UIgBXsW7kHp7KkvrD0WQN9m0cfipB7labd
         WeaIsRiicE/34Uj5DzSi3bfq/nPQAjhQQgZpWfg7UIBGq8gh8ts0C8NtEMapVboCHQL1
         8srA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=uADSYkPzQR4PFfdVSYNkCGIx5VT2Z6hKscFh0I+eBr0=;
        b=pAkGQz3Ef4X0bLBlmcLVcZ4vmtc/9ENrUWJIPFIFFnVf83gu+/3D4pSqlKdNiID8Pp
         IFW9MPyHn0kkgG+8Q9uewxR3OcciLK/LywbjUUG0zyFkJhdP4aQxN1BpxmUwIcQOYWHX
         oKiZEF3daWGLiaqZWCaFiPXDo0cyLRgOUs5c085ZK8QCxYtxhL9bgisH0AchmVqO1V/v
         nyQZoYC5AtN1FPQ13aVF+mh6lV3lK4Oc/gU6qQmbxkGomd7/FxFwFoQA5gde2L/XNSkq
         T92qC73TBrfPp3xnLX/tMLRnXURCkO/tIAP3M2OB1GgqVRWBIFY1/nlaGE10EMa3PTJP
         I4kw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5336KudgDIr9cMLCKZJ+Yk/3MS7XuUTLG5mXrssEbPH9ehRWce6t
	23JZsqyQY0Dv8NmkfNEBH40=
X-Google-Smtp-Source: ABdhPJxgATFL23wwmC3b9caDloUkwBAOJiQDNMPfqEjxjjmz85TU2ce93vsg/BJIKPeAmZ+ewXwglg==
X-Received: by 2002:adf:ed12:: with SMTP id a18mr31506720wro.178.1600315571733;
        Wed, 16 Sep 2020 21:06:11 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6000:8:: with SMTP id h8ls580541wrx.3.gmail; Wed, 16 Sep
 2020 21:06:10 -0700 (PDT)
X-Received: by 2002:adf:a35d:: with SMTP id d29mr29946236wrb.307.1600315570729;
        Wed, 16 Sep 2020 21:06:10 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1600315570; cv=pass;
        d=google.com; s=arc-20160816;
        b=O9lrsxdBtWeynVVcdWg64Jb6wUoqbErraUeBIJLP+rvBfWzX1MZVXtmJao2n3HTRmA
         XHTUP8gut1PWupzQoQGDyr0dvgP6rm9cTykaNJUuL0OqLgtTJQvnP7WjL/YbAr8UyP+W
         u6z3pm5C4QGFKtB29wtp51V9IhWG0mFudw3N8qkwc5tM/Q9xM5H8+9lQUcJzOz9eJg3I
         vF4xFb5U/bVI5JbUQtP1QEY2fLaMxefiaNcoHqcEsBD/swTXuCj/2dazvH+V6u57kSxI
         9K7xL1ZuyOQPTgTgWqQgip9n4+76Qu9DLIgMJCxP3JbdxMkxAPjr22/N/VozYX4eagsY
         YsEQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ZJt/NlBDx8Nrpp6tW04usNSO3I3JgTZj0EBB4bNyDLs=;
        b=JUF2QI5OtPOb5KZVc0QRDrJtotocRrGYelPxUc1bSdVlH3yL5UNODC1Dcg9M5FqBdg
         KyaB6qQdNUhvjKTjVEhjLvUiEE2a5fvRYi2XzXOy9GYntsPn2ZKaPo7fiLVG32nu7zGO
         0BpI9no3HIv+pdnknalpCggw7kKDG7d8x+BluRx0PqZgWJKryaiDqlb0oyIZPYsMAt4+
         hyLu1hmoDnTuELHjSopZ+PRxYpJiZ5giONwbPzoENQC7DLb6PghGadiT8gk4n6NJr5Et
         i5t5OhpXzvX4xBPkhCDGOZOvYzA4XrrW+6dgD1/GdDvH5pUlvua1uEzQdX5FXGm51mcW
         bLaw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=Wo6ld9CN;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.5.40 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (mail-eopbgr50040.outbound.protection.outlook.com. [40.107.5.40])
        by gmr-mx.google.com with ESMTPS id f134si216805wme.4.2020.09.16.21.06.10
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Sep 2020 21:06:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of alice.guo@nxp.com designates 40.107.5.40 as permitted sender) client-ip=40.107.5.40;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HK/ZMej5IrkwMw6RNPWAKlf1Z3WyEx929PMof0t70kMmYZ6PKTB0+kupuEBYHDD7rbnBJM3CSZ56lR9KP182aG8zQepCoT6OohUOlEjixu3kLV8DQmtb/nuH+9qcHaRODuE/B5pUCDVpeOr/4fBKGey1vGFQs2rkRogfwFhqLmXZmTp5JpaGALWyVVNxoe+/hj8ib/xoS8LBGUBvi53F/cZS5PzWbROIpjBoqzazR1Itf7brB155xaGZEn2FYjf5xTiERVDybvcYX9USCnl2lFGgEioKHG0O/FZFyWN1RQIzn+8kNYQpB2WbRtBxMgmwcvDNBDbJ4RP63MDVTVZJkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZJt/NlBDx8Nrpp6tW04usNSO3I3JgTZj0EBB4bNyDLs=;
 b=DyR43uO8K9xUgA686q9hSHT5GQKD+NF3yIl+Rd9IG144j5Z4CofG3ggGaIX3FgxinyawSm/m5k12sgLZIJh0XaBujg0VKjoO0q0wyb6CS7NeDgImBmiSrtsKhdxOioHTWWLjcuwlwKExFu4sF/UOYIr+fVwHrJ+E1NOIqWOFpF9gkRaUONgDGm/QwuwwwMOBWXBUcP+k1IvgN+K8kKoJ7tt4ZVGpGJDmpNJEeU1fSUc/b+kjhFmvQ2+U5lp6TWIMirgF4mD/ahZ30y6AbRYJ4kfnze/v5HP/pvrSoEL+vIGsD2qJa1jBIpeq/QBybJH8njdemU7EOdpo//3PuZiIfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from VI1PR04MB7071.eurprd04.prod.outlook.com (2603:10a6:800:128::8)
 by VI1PR0401MB2398.eurprd04.prod.outlook.com (2603:10a6:800:2a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.13; Thu, 17 Sep
 2020 04:06:09 +0000
Received: from VI1PR04MB7071.eurprd04.prod.outlook.com
 ([fe80::c97:3a39:dcbb:117c]) by VI1PR04MB7071.eurprd04.prod.outlook.com
 ([fe80::c97:3a39:dcbb:117c%8]) with mapi id 15.20.3391.011; Thu, 17 Sep 2020
 04:06:09 +0000
From: Alice Guo <alice.guo@nxp.com>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Cc: peng.fan@nxp.com,
	Alice Guo <alice.guo@nxp.com>
Subject: [PATCH V4 2/5] cell-config: add support for MMU-500 configuration in cell-config.h
Date: Thu, 17 Sep 2020 12:05:51 +0800
Message-Id: <20200917040554.4599-2-alice.guo@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200917040554.4599-1-alice.guo@nxp.com>
References: <20200917040554.4599-1-alice.guo@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: SG2PR06CA0196.apcprd06.prod.outlook.com (2603:1096:4:1::28)
 To VI1PR04MB7071.eurprd04.prod.outlook.com (2603:10a6:800:128::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nxf55104-OptiPlex-7060.ap.freescale.net (119.31.174.71) by SG2PR06CA0196.apcprd06.prod.outlook.com (2603:1096:4:1::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend Transport; Thu, 17 Sep 2020 04:06:07 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: cc848469-93b9-4a40-4664-08d85abf022d
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2398:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB2398753696F72802BE23AC40E23E0@VI1PR0401MB2398.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1468;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7PzYtbbd0O10/wa9R3OK/X88TYH+8QyOWVVxDzEG5LQjRfYRxXo8IyMg9NZnsloi19kuqTP40824HZRIBDA4TiG/X60xWBFPQOlXLV9Rvz93FRAaeZUvvYshwMsstNyuFLnlYrA+1etNraM38ehwcvrSgTj05EPt1ePZ48cr7CzBSVe16x44mX5nC2+xtuJ97Po0N6mmdKHAo6gediOjlEwDoF/42MK4QwTvfx/cFe13dYWmz/1N5OCYpC2e0NdMrH9JP6eUR5EK4Y8F/PeBbje3n2yqnZTTFwFop5BHkazk7LezODm+Dle/Es+Xnr5hoT83FBrJAsmjWxwjehu4+A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7071.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(346002)(396003)(39860400002)(136003)(8676002)(6666004)(1076003)(6486002)(86362001)(66476007)(5660300002)(66946007)(6512007)(4744005)(66556008)(6506007)(316002)(52116002)(2906002)(8936002)(36756003)(26005)(956004)(44832011)(2616005)(16526019)(4326008)(478600001)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: tF6MpKM/AMVDNDLUqXigtj0wvNDGP+Nzti6BeSaTA3SEzofTtPBI6aDVON/gRWG4biYTLkUjZFYqqrPbe1aUwBtx1ghJ+KsBq1Rmd8Mnj1Dxue43w0v/U+dbMBWbD0un39UTGKTjO+eInDt4GQPYoKsY4TUe4rCPJgH8M+XyDOu28SL4c1oXftlujKROckwI3onu4WbOMBhWFhBEwtaMXaEi7KWyovDgA7SLaN6/r66rO2z/0FMXtGHURjuue8LEqy2QcQxn08kfsnwl0/hoW9ENXfFq+nkHifv2o4qH3uiCEnfAzTswsEKNBKGvYsBS9r4KG1K4RPiHqTItbk8WW2iIpJbfQfNcpxDdAWyZGSIRj/IXzSguki5QPux7C7kZgtXDEqMfzAtqkPAM5tLDFjj4Cb3ciFMr7pQbCplLUryofqFyyOIBh5M6qYQvcXso0JWIs+HvKPLAwYFkM0uuxX4BTY+eUx6yYGvbrRO3XGfooWOXvJkU3rzO+/b+a+BM3dh48ogQkQvaJDQSmF3l5xyVs2RVHHSogJJnvm5hfWOn7SNWXVRHJPZkgLYn6WRurILu7tpNjmg/5MM+A44d5/d3csyyJm8FE1Z0qNKppJLOzg1mvHM2XHS4yAyDPTUyCdzKm6SUn5OToOCyf3g9ag==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc848469-93b9-4a40-4664-08d85abf022d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7071.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2020 04:06:09.7955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5oURBj2PaXbaT7XA5ovhlRJiRyEiEwPvMc/buXeH1fdjt8ijaX9mB+XWM2U4KQGSK07xwag1iLnhNiePuqVpwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2398
X-Original-Sender: alice.guo@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=Wo6ld9CN;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of alice.guo@nxp.com
 designates 40.107.5.40 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
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

Add JAILHOUSE_IOMMU_ARM_MMU500 to the Jailhouse iommu type. Add
arm_sid_mask to struct jailhouse_iommu, and it is a mask of StreamID
bits irrelevant to the matching process.

Signed-off-by: Alice Guo <alice.guo@nxp.com>
---
 include/jailhouse/cell-config.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
index 2a968dd5..592341df 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -260,6 +260,7 @@ struct jailhouse_pci_capability {
 #define JAILHOUSE_IOMMU_INTEL		2
 #define JAILHOUSE_IOMMU_SMMUV3		3
 #define JAILHOUSE_IOMMU_PVU		4
+#define JAILHOUSE_IOMMU_ARM_MMU500	5
 
 struct jailhouse_iommu {
 	__u32 type;
@@ -279,6 +280,8 @@ struct jailhouse_iommu {
 			__u32 tlb_size;
 		} __attribute__((packed)) tipvu;
 	};
+
+	__u32 arm_sid_mask;
 } __attribute__((packed));
 
 struct jailhouse_pio {
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200917040554.4599-2-alice.guo%40nxp.com.
