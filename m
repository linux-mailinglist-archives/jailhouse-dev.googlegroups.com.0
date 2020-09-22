Return-Path: <jailhouse-dev+bncBDEN32754MOBBKN3U35QKGQEBGEHHCI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43d.google.com (mail-wr1-x43d.google.com [IPv6:2a00:1450:4864:20::43d])
	by mail.lfdr.de (Postfix) with ESMTPS id C99FF273B18
	for <lists+jailhouse-dev@lfdr.de>; Tue, 22 Sep 2020 08:46:01 +0200 (CEST)
Received: by mail-wr1-x43d.google.com with SMTP id b2sf835761wrs.7
        for <lists+jailhouse-dev@lfdr.de>; Mon, 21 Sep 2020 23:46:01 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1600757161; cv=pass;
        d=google.com; s=arc-20160816;
        b=knuXAAagTEzSODddsjg56imjLwEwrxhkE6idocmaEqmvvSw9ICN2i+NZ4OHD5//tXH
         Z0BxoA+G//4bG1WICpyU/cRwEfeUqkYgf+/9Lw3xvxt/f9eW1qOODqFkushdWvM/YOpc
         F2+cy7ejI+jHymZREI7bbXnKqBbmNOclIY6XzI7ScLp1/w/RWP2Gv/Zqt77UcOMS5v8R
         3wuTs8LGa6abA+RP1FXzlAMBnRWt8nuNMTNGxHPBHZIX55WLlUHMAhN5o8MTLhEP9z0S
         ZhLZap/4U8268shvtYBPPCeuSDc1/vgl7rlaEkIFmI/IKjOGPefM4uI5Mz1AEZR1TZky
         8UIQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=ANZtigyOj3qZjSpbaZ67fKDJzIT0foROkbfm4pMf1VU=;
        b=wvZe/EaxJF5pk0KgbTmUE4tx8ImIMhLJDaDTjcUGD52Gj9JzaSsc0gTJk/C6QyUhI/
         /SzHDPA4ZQzfgnSoSAszxaGCspWJXK/do1B79W9jEtbSeNfrwbEe3/MXEmQgE7AUAaH1
         BePYeM/dm+y73VInF5wp9sGzXkTgU4ie83LWLKrfKdqgY/S+Stv36SjbVAgqB/Okec89
         x9Chjwh6IbVtki4jsRYP2Vluj3mipeuz0UU4RsB/xMSXF85I0epQhnyN6SzhbnY+EoTQ
         ip8PZBiEoTRz5E4HR8+l5AnmpSDnOR+gdWfNr2LKjVCc2yxS/RVaKPgbmQp3WrN6vzMX
         CWIg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=lCdfgOO4;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.6.48 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ANZtigyOj3qZjSpbaZ67fKDJzIT0foROkbfm4pMf1VU=;
        b=cxjG5n7iVqKFc0M3gswecmmgbtqUnSJayccynRDIGM8JA9w/0Cb9B/dN8BFydhclRA
         6hCETjoowqyR1O4YHiJTy0GESHPFe2zej/VeHE7+r8Vd02X8ihk/sgQJPWBEsxXICmdS
         iC1zsnLrkodC23pEeoLE2tKfRh31nkjDkshqVmAX6cIRFHpKx3x+BKleQDPd4HqnRFlW
         A8bDSNw+aDwrc9r+6DLHozfmdmRTQAuQ/8cyByS2qAsaypD5+5eSIsLbswsYb1Udp7Cd
         1BBOyblmlZVjt55fC7VuBVN/yWhRx9MFjxM9pFVjMypOssXflmsydoXOxGiDuINnWnoQ
         9qyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ANZtigyOj3qZjSpbaZ67fKDJzIT0foROkbfm4pMf1VU=;
        b=BtsgW/PzE7rBQDLn+I3aQX/WknT8mOQeyUTlIDdtJPX5V6cMHt8py3VV1cmy9sAEBT
         BEj5hhs2Y9MwvSsTFwygshkfPSLcLGqwq3hsX5rG3g8bu8hg1R36nWVF9SE1ob2/rcWW
         3iB6+tB4qCtC/bzPvHSOZd2Dcjueymry9u/8kUkfkqN2CJRSNB890nvi/sZhjGkQMnD1
         WnLUedKUWf148F2Lv1Po2uspvsg1ndxHNZED1HDlQcYfw4v8xNe9HLO65lmtLOclV1gx
         ntcG0+gxJQZf8F3pIowlEn2HmPLJBFSzx0TPXFNLs3iso31wXVXBR9n740G9pKs7IM4f
         IYqg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530IVwSIDtYnITWCnwv8txKYUf6g8a/CysudnlRKrCyxl1kd0mKi
	PEhyZHcwibF0g7Urbv1jRRs=
X-Google-Smtp-Source: ABdhPJw/gqKfE+Y6rt48LDpuS9x9NxZyoX/3yWQUCHNj5zwQiG/7/jEh89LgTY2O7jEf5t0jBWS52Q==
X-Received: by 2002:a1c:5988:: with SMTP id n130mr2967666wmb.95.1600757161519;
        Mon, 21 Sep 2020 23:46:01 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:dd0a:: with SMTP id a10ls2622854wrm.2.gmail; Mon, 21 Sep
 2020 23:46:00 -0700 (PDT)
X-Received: by 2002:a5d:460c:: with SMTP id t12mr3512971wrq.225.1600757160526;
        Mon, 21 Sep 2020 23:46:00 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1600757160; cv=pass;
        d=google.com; s=arc-20160816;
        b=vy7zsRZ1Hw9xa1VX9BX3NgmUBsTTHNgx8KxAEq4dBa7D9RNYRU0PeWCOH1rM0mcKQM
         5AP5/MA+HUKDuPvwPAWcwESU/AvOMSbIWn9Qj0eIMLI9+GIhtqQsJ458+YoxMS4X8Hsq
         CzjbwTZAvRbP9TUn6FeYRcEbLs6lurspzA6/F9rzjo6Tl+HgGYjVN6Bv3LHbjQ32s8fF
         0R1WgtdSnIQPk+ig8GosrGJjZlG3wgwHmeOH/hYAC5oiWp/wgg0doMKil1fYXJH8bsPG
         7s6Dgk1/gtd+U2XuaqeE54GP/CfLF+9bZVfzn07/AkeZE9pZg1FxAQKN3u5IZWZia+H+
         l5Tg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=6q7wfNvzXzpQzDs19oUsfyExIbGV0sGmB3IrxNBcKkA=;
        b=jPY+kIllPKgrZPjMUrwwLOnPosEeaY8Gevmy7td7pkvBtOL9kIlNWbvR0f9C3Jv2Ja
         u+0DV7Glf9EUbz5SOhEqrQ31l39ixy+IYU86e3Mh9RXvnrlZpCL8itv1UeJM4d1JMDNB
         OpXkmzPnzPdfXH3pepNdxSHjQmcvbY0Irt9TmyIEuoaJdRat57eAkkRwDainZ/lDkMrw
         qkceRXl3Ungmj1NEKW9EBx99prPqq6t/8TftmP45YZQLtgn0FoPa97Q9szUa6bqdJ1Fq
         GFBFtTHI9v4MRI04ZE9TEohA2wrPpIgFFVz0jyCtZi1Oc1i+AuAQWq0Tbbi6ZA8SPIYG
         dp8w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=lCdfgOO4;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.6.48 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60048.outbound.protection.outlook.com. [40.107.6.48])
        by gmr-mx.google.com with ESMTPS id h2si69926wml.4.2020.09.21.23.46.00
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Sep 2020 23:46:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of alice.guo@nxp.com designates 40.107.6.48 as permitted sender) client-ip=40.107.6.48;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m+SCIuoGPjl3r5u24v72qEgJ61CCz0OpX/Av/HP6mObDF4Hj+Ol9d+r5SWY6P1Qq3sGhUl4Y5L/apLarWA5QV5NSY8cbqjl+QJ+CUgCnGSa0Brw+/+8Jsk4Rud6OqYpzX3/j6wuMod3F6LmzSFm8j8pLW24v+RA+6Tpl7F7hJP49d8/Bpsfr3ajf6+89n0krwFlA8qihWejjWPTv7xcO03d4D82eJdWkxW9u1QnePIxovzn6YFHtc58Y9UltZf4+eZ/MgKSAgUwW2yAiaEP2j5nA9rFIcnnjY1hicyHEGIcnoeRLeX+J7foWhWWDYOpt6LonkjSeghSGXH0Z8/xBtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6q7wfNvzXzpQzDs19oUsfyExIbGV0sGmB3IrxNBcKkA=;
 b=ZnzltfhPflkUTx24zxFR4dgRtjXkQ1FkDvn02BMtv18j5hPHr2PwqK50LPHcoCwoDxlntHzu3qo9rPEmZmosZCq6yaiol9D6pw8SeH7OWvvQdFTaVJ15XX/RG89z+kfKcShODopHSFNDeE2fw3yyA8tT34hGF5tWytjr9wQcC9w0kFxj+vOiKG6cCG/TzcVkBOr1X1lo+Aoy5vT/DvOnf/fKG4TlmFFdefQOuFKfBJfy98zkgGPLrtJ6FP2ZFcHZOXr9b/EAk76JYvbWi+i1oVGhHlOFod8OxQOYzRMUphsPdnpD6Sui2ubdFAA8NnwUqy3Z43rcWLFdqdc3yDkzyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com (2603:10a6:10:127::9)
 by DBAPR04MB7415.eurprd04.prod.outlook.com (2603:10a6:10:1aa::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.19; Tue, 22 Sep
 2020 06:45:59 +0000
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::ed87:8435:3012:9618]) by DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::ed87:8435:3012:9618%9]) with mapi id 15.20.3391.027; Tue, 22 Sep 2020
 06:45:59 +0000
From: Alice Guo <alice.guo@nxp.com>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Cc: peng.fan@nxp.com,
	Alice Guo <alice.guo@nxp.com>
Subject: [PATCH V5 2/5] cell-config: add support for MMU-500 configuration in cell-config.h
Date: Tue, 22 Sep 2020 14:45:39 +0800
Message-Id: <20200922064542.26274-2-alice.guo@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200922064542.26274-1-alice.guo@nxp.com>
References: <20200922064542.26274-1-alice.guo@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: SG2PR06CA0223.apcprd06.prod.outlook.com
 (2603:1096:4:68::31) To DB8PR04MB7065.eurprd04.prod.outlook.com
 (2603:10a6:10:127::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nxf55104-OptiPlex-7060.ap.freescale.net (119.31.174.71) by SG2PR06CA0223.apcprd06.prod.outlook.com (2603:1096:4:68::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.15 via Frontend Transport; Tue, 22 Sep 2020 06:45:58 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ed53f440-c87f-49ff-ff77-08d85ec32a59
X-MS-TrafficTypeDiagnostic: DBAPR04MB7415:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBAPR04MB7415B970C3179B08E41A0600E23B0@DBAPR04MB7415.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1468;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pNivoV8D4isctLGbaX749VSy2zfhViGyXQEBtMXlPKjG/zOfkNicYNLO0zZuFA/Xgumgwb5l/RiwiklQp3lOeEkp2cWcKgr/qyUNAwu1u3EtxRe9+0kk0yJtRb9DuQyRJhnpjVvfytk1OTo0jYujUMDApmVw1pfkjzyEOXtV/V7JtZViJuflMGm5ZDTVJb0YPbXPv7nvuuyuKcdSw/vznNZ5rX2dta2pR3mMRJFvHD/bLYkmReS4aQeQCtwasfLYr/Roq2VXnU7UXpOebYfSRwHLaV+S6BmMZeJrLZMgCQH8FxlFyTE92BbS/USd9OQl93q+DWdWWTYFmwTNV795xg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB7065.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(136003)(366004)(346002)(396003)(26005)(66476007)(66946007)(66556008)(6506007)(6666004)(186003)(16526019)(4326008)(52116002)(36756003)(316002)(2906002)(6486002)(6512007)(8676002)(4744005)(2616005)(1076003)(956004)(86362001)(5660300002)(44832011)(478600001)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 1lDfmCPQoGv7PZ5u/OPcduamCJDx5JrMeDQOKkogt21iormGblXhfJPb6TM2B2rLFYaE/q15D/J2ZYRjagSCnECyD/6Exnw4xW87EkEAVVSnH9QlaOBVRt3iR57DOxcQ7lHQklaRPd+MTHrOZO2mYmeFFnuPJjC9irnV/2kHR89QCHzmx1TadgfiHnGSo/T4iRoclEyUOJl3SUBAAy/5TdYOKaa353u2oFPhte0h1GmEZOzIMSw18GP0VamLvJNwNyY8wUE87AmsqrpncZYvaphbByX3bLdrperdAGsTB/ZrgTzbiiSrLuXEnNYk5/Vrw/APAHWuC2MTBTSOnxHM2WH0VB0VTL6PF5dt0dNlCt5WdqgfdGrdzgEQaddWiKAKKzBjTA4xN5QRnWEaYRVLgxaJZY7qxx59Z7Y126IGij28s+vkPgM3yzPWJUORbDBZCMIrb7IA2u0A+xFSZQhkqvb+6KHB2rnJv+91yXVKFsLMuIvn3FuTvMx/QE8VFtR/1L+xlfJrrzXvG31vYte7RyLwEOlLyJzpqTEtBW1FfMWbzgyG3TEpjPrcLwdXQAmU3+2G4YpzlEfoFWY75qiSmzkp2e34rZyQAyFk0HIYSDNFPNiVW8MWT3OSg5QYMwsBAAyQAXD1Hink3LQ+DRw3ng==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed53f440-c87f-49ff-ff77-08d85ec32a59
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7065.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2020 06:45:59.8803
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +MPEZ/IGv/VbfZOxLksyxFYi6RT0uG4/nIK31N6qrK4fNL5Y7tlewfaXvAuFa3wyKVjakqlufKbR0P44oJ9DLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7415
X-Original-Sender: alice.guo@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=lCdfgOO4;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of alice.guo@nxp.com
 designates 40.107.6.48 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
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
 include/jailhouse/cell-config.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
index 2a968dd5..fcc58cfb 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -260,6 +260,7 @@ struct jailhouse_pci_capability {
 #define JAILHOUSE_IOMMU_INTEL		2
 #define JAILHOUSE_IOMMU_SMMUV3		3
 #define JAILHOUSE_IOMMU_PVU		4
+#define JAILHOUSE_IOMMU_ARM_MMU500	5
 
 struct jailhouse_iommu {
 	__u32 type;
@@ -278,6 +279,10 @@ struct jailhouse_iommu {
 			__u64 tlb_base;
 			__u32 tlb_size;
 		} __attribute__((packed)) tipvu;
+
+		struct {
+			__u32 sid_mask;
+		} __attribute__((packed)) arm_mmu500;
 	};
 } __attribute__((packed));
 
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200922064542.26274-2-alice.guo%40nxp.com.
