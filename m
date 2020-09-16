Return-Path: <jailhouse-dev+bncBDEN32754MOBBOESQ75QKGQEOR5OO7Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33e.google.com (mail-wm1-x33e.google.com [IPv6:2a00:1450:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id 5388C26BEE3
	for <lists+jailhouse-dev@lfdr.de>; Wed, 16 Sep 2020 10:13:45 +0200 (CEST)
Received: by mail-wm1-x33e.google.com with SMTP id m20sf719393wmg.6
        for <lists+jailhouse-dev@lfdr.de>; Wed, 16 Sep 2020 01:13:45 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1600244025; cv=pass;
        d=google.com; s=arc-20160816;
        b=1HVXz1RvfVfX6Xr1anKm8nRygLYz+ZoD0zMF2HKYqdQI876AMKJRiRC6nCTik74Sod
         9vK4m6P9MjMPZL+VGHwu16qUgQ1UyQ5iZ6xZOkunfUo6tctOwHNj63ccxLW31re29Yo7
         BhWMyPtzioGuNbmKQjUEQ+pSP4ckNWimH2BwX+NmZASiCG2E+xjYT5MFCYD8BZeqlnR3
         LK93Lek+bNDyTiJhx0sfQGlHInVB6xichcTinOHd/Ud7goGBOyuFAx3/criyjmojBQ98
         MzuPa/ztZuOzLgPho/aoSYuD5teQotbhQV64Wy4N0NewzqYUwmY4oXnAGT1WPu7x0AmB
         5Sgw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=V5O4k1ibrUIziBARKpUfky7JnwIT6T2Fic0UyHfIL+c=;
        b=K87g8zR+ISzuLjGQj6s1JzJM4fpLZDA+4CV9ZuMD73a2NWFr0fwXnyl0TUivvfhNcg
         Okyubp7wW6DieE/mfjOTz8ExoIp0AfU+YDBi13pUL6IE7q5MA/PTHkGhgZc8hdkBh2VB
         b37drSzk3TCXR+elZRoo9J9bN6i2MMflEU3HfY7OD4Nax6bb9nDdJcfSImKChXL/er1Q
         8ENz43CQxyshxpbIoM6L9jH2hLVCVvbYB3VRqwPU8+L6fIckVdCgyJyOKFm1YGKu1z39
         Y8PfQw7Bgm7jljjuzhQjvKSVcvO6tHTmVGbWCPdffLuNj3etkYVXqHhBzyLtSTlL3Ko1
         9pvQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=CHfiufq1;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.13.81 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=V5O4k1ibrUIziBARKpUfky7JnwIT6T2Fic0UyHfIL+c=;
        b=DxkRx309xcLCd7veBXLPPQzw8IKTu+5jRbQaEjj5/aowPOdur2Z1lL+Lgp01PoNNkR
         drvLDGTwO/wbJGGTrrz5RTFkffd6oOzEnS5OFQoR3E+H8oKC2DfuxKdgNsZpM16/tVX8
         C88UmT6o90vkWlQsIx0iE1yk2eJvc7p7+sEzToPxEGryyZM0kAAcetI4K6j9CgntjCfi
         U09zvGkpDb3ZhVQcdy5rAg9aAmd3j726XTJnca6YgSr/EyPS+h6NpmJ6YHiwrKpnVxfp
         ixKjq+2CDztDPl+0JtzY/1CFAU1+fkRhM5zXIbx5d3GFZFj/ZzSf4bDLVOC/vTCxAjXc
         ZLgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=V5O4k1ibrUIziBARKpUfky7JnwIT6T2Fic0UyHfIL+c=;
        b=HPBTIy9H043or1PCbTjpEq8BFVRy8qqBs8D28h59beefSl6E5BtPu89lDuzSFyo7s6
         G3x9v1AI3p2qTNhybDKHBDQbFKMN4UbHdcL2sJ6CxoHyGhPWAty528ROs5DF+5jV4g9X
         VPszQe1A+R6kAIvEl2kGLv2XzgUADCfBu2djgein2CKN+jM5nWZk2rLsxsm3UaNuJBNc
         Xto15g//Xj3gil0yWdaBq2Cuh3rcnI36kgHZCzuqnXp/1nvW3JNciRK6X4Hr1EDjDACE
         YJrtreniZZXJ2XZ3ZVLsKBOh0XkfrKQTlwvnX9c1XBdgBwybvcYm8vrgDVOGE/KzgQKm
         du6A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531ADpgjmEX5iZ5PymenCEhEJjiX3vsDGolzPoRcd9W68xF29LqB
	c22Up+hywZQlC6lUPckLlqw=
X-Google-Smtp-Source: ABdhPJxAG/KohViEHqYsZdiPNCq5J1jZkQgNIW6vWdoKburgI11fYtIabUptgrIDqwDspsyrJKPOdA==
X-Received: by 2002:a05:600c:228e:: with SMTP id 14mr3553568wmf.17.1600244025137;
        Wed, 16 Sep 2020 01:13:45 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:1b86:: with SMTP id b128ls564183wmb.3.canary-gmail; Wed,
 16 Sep 2020 01:13:44 -0700 (PDT)
X-Received: by 2002:a1c:8115:: with SMTP id c21mr3428459wmd.153.1600244024207;
        Wed, 16 Sep 2020 01:13:44 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1600244024; cv=pass;
        d=google.com; s=arc-20160816;
        b=Bfdl0DchPV+houzMk70WqVcG0vLm0pC7WBQ1TV7eTFexufhcwR6BX3rKnDiI3kXI7k
         Z4RsWf+hqwxnT7HCXuZY3OX96D2oX378sW9GM+ZKDtjnsjq/UynB8a4f1O7fRffD6Kdz
         lD3N0u15Ox/bWdgoWLHHLmDzuI8OrDYdofCRO8zqMkPkxV+7qadzcmj9yDqgwrcwpvwD
         h0GiNrVmsUQd7wj4YxqlG01ey+vzmV0Au+QM1fNR+dffCkSMuY9KJKh2tfclq5ldvF11
         apOP5ch+LVyM51gOxrLeP8YjInJCPXmKrU+qeBQF38SeUMLZqOL57moQGUleB04e8Bfp
         4ySA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ZJt/NlBDx8Nrpp6tW04usNSO3I3JgTZj0EBB4bNyDLs=;
        b=sibUs5i+BpbbgmM1pZ7Iwjy60nHSYKTyTMDXrjXW0BH3iK8qw6SH58JTAZsal1vHqV
         xsv9hO/iuwPvMy4gRnqI9bQ9sQTyVQE58XV3PzeNepaEh8kBJmz271kQpzaxDZ4NNikm
         pMsG6qodWywu0e9zcJTFHs9/OVqjbI1Em6kJ7jWAr+7kxyOoG9QkLwVX+toOQYL5H5Gl
         Kmsnf183l/B3Xh1wCGEzlsVUM/vL7xwNS1H8V5YT5sB9Ddsa9OK8lg6Ph+VgcpVOdA4e
         70bw9Uxk0KgbyN+QbItaldm4/sDGsftkoR3NrRqXPVe9fgg7GFsh/Wsqo05MzcZAZkIf
         24BQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=CHfiufq1;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.13.81 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-eopbgr130081.outbound.protection.outlook.com. [40.107.13.81])
        by gmr-mx.google.com with ESMTPS id f134si100783wme.4.2020.09.16.01.13.44
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Sep 2020 01:13:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of alice.guo@nxp.com designates 40.107.13.81 as permitted sender) client-ip=40.107.13.81;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PV+L/mkFMfrUw/s/htyWWAMjY7pfQ0o55YjTAGxBUbZcDjjW+VNFJjVhGkh8EK70n/URGtz+0Zuq50Hk7hrDh0mAVXhH01lz+3SzZpxwzqRpHlbIU3RZv8vlvLalO56wA9ivqZBfN1PELY+HLroAgsIdGvcuCuvl1WNh8hIki/+EOZk615htOWEpltw3hGj9kd0NTuf1VsYvOm2soMSV5emt1WP+Q6VtM13dvKWzqrO+32YZRfL8rQqzZNhL+11S0McxMXYoK3DMjmN/WBP95ki8Fo7Gl2C/aFlxDSy0+y+HvwpJ0G+Fx54/73o1LfRFXbNywCOFI1grFCzQKpeyPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZJt/NlBDx8Nrpp6tW04usNSO3I3JgTZj0EBB4bNyDLs=;
 b=N2yPo597e4tKwU3rNbq1X7cd78adBY/Tz3VdI6MdaQYlh+myUM0AO7SH123bBlEvG99m4QAPvHXUL4tQJ5/8+hO/uki4Tdn//s7av8lJvbw23OVv5fUbaFwui+7LYVsRKL04joFTaXZDMqLw6lQSNoXSgFLIl2I6Rd6rQ04e30xCGr1NYEX5mYI0IrOOh9YGiIiafjMCTHApaUq1r30xMHck91acsw5kTP9fPBygSNpJ2EQWOgwPdW6uxt5RoOGEXU22OCPrUEnQNr8II+J2/PdaJ0ZxAKjseSRM+Uv4GgT8h4U+Y42ygSl3EsgnY6gK00tZwNaD5v2zJEGPwUCxoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com (2603:10a6:10:127::9)
 by DB7PR04MB5291.eurprd04.prod.outlook.com (2603:10a6:10:24::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Wed, 16 Sep
 2020 08:13:42 +0000
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::ed87:8435:3012:9618]) by DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::ed87:8435:3012:9618%9]) with mapi id 15.20.3391.011; Wed, 16 Sep 2020
 08:13:42 +0000
From: Alice Guo <alice.guo@nxp.com>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Cc: peng.fan@nxp.com,
	Alice Guo <alice.guo@nxp.com>
Subject: [PATCH V3 2/5] cell-config: add support for MMU-500 configuration in cell-config.h
Date: Wed, 16 Sep 2020 16:12:50 +0800
Message-Id: <20200916081253.27536-2-alice.guo@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200916081253.27536-1-alice.guo@nxp.com>
References: <20200916081253.27536-1-alice.guo@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: AM3PR04CA0141.eurprd04.prod.outlook.com (2603:10a6:207::25)
 To DB8PR04MB7065.eurprd04.prod.outlook.com (2603:10a6:10:127::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nxf55104-OptiPlex-7060.ap.freescale.net (119.31.174.71) by AM3PR04CA0141.eurprd04.prod.outlook.com (2603:10a6:207::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11 via Frontend Transport; Wed, 16 Sep 2020 08:13:39 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: db4efc25-cce5-4326-4ec3-08d85a186c9a
X-MS-TrafficTypeDiagnostic: DB7PR04MB5291:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB5291036F62F41EF45B89181BE2210@DB7PR04MB5291.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1468;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i/dOEpDHS40CGtzLP6AnY5Z/8tyNwJ7rCLWhKG0ag43ZNq2uzRi4mV39H4NcYS60Bc5paqSIro9FQ5zpVo2k46VDwIOU3DkN2SuTsbhJBdywUIcJi4Z8+aYl9eZhrrF6ukZDcbghQckUt8UQrjSNXu5E8aat/FcKpL2MtlvE2NH3n2DQnWXGAtA3OQ6M1HHJTQpoV46/KsVSD1io6+fMlBuIFgmCiPyp/C24bquuwODUjMRr6TJ1ITN7anIT2McwLjHcwqJS9fqETcyL8bhJlRR9jJN4tGpQI2iReeptgNexWHAbtcXRDZwT7nV3HiJcUa92ENPSZhSFsAXtrWVCs0e7Q7SusgRmQVzuSEQ7PbLO7KUPLagJ8mJoIeDjCvyk
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB7065.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(956004)(2616005)(44832011)(66556008)(1076003)(66476007)(66946007)(86362001)(6486002)(5660300002)(2906002)(36756003)(6506007)(8676002)(26005)(4744005)(498600001)(6512007)(52116002)(186003)(6666004)(16526019)(8936002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 6d4LlvjtX9VNGYviUXVepD+RAKHwcqI88zCFNfGRI4g9mCgnlpXBDNWQ3inIlMZ4yRcHGUguX3fX4i8hDn8TfnvDNIZLe4uNr7gqg1MOPqxkrQHaxXtmC+MJLVuW1bQwZzyXLprl8GiXwvdqAtxAw+7CR94Mc4s8CUJumxHXLb/63l2L7M7sAbJG7rRHoyWh2v/mK03k0TklFaOUsZQ5GJock1KPfyBZeZxvkkl7T9RPxiYMB8kpc516qR7TS40FzFilervpA9jlZhDP1mWAhs37yzXj/ohXjPZliE3Mt4Dl3Y1MNP2PwIWWQbYfgkbInkLgTxkdsqdscsw90DSoM5UEfZJl8ai/mCY3aZJuOOE3xa+/nIQ1lT3kturxIeUz9XjI8ENUXs/1rpkFEskBoKfBRg52ZjwPL3Vm1EeEK5FGQym4gcGNPctatFw8u+EHEn2m3PxkR8aNK7w/dTHxeo3AwLUUKGl3E9mFNt7D6Nd7x/rayRAiwpP0kDEp5ly47DYyOZUt71e0BREIwRvGQ9P6N045+0t6BFpvNBi14kBw9DjzD7vvSucoA1esq6bqNsQrK0DuqtCIBo7F6F8OqLTo62jPN2B9fHOWZhv5c6QfAnUetlxuBtg3lGDkB49d09KgI7ulzubjrUPKhzWObg==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db4efc25-cce5-4326-4ec3-08d85a186c9a
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7065.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2020 08:13:42.5590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VBG1S98zPT81rPmOrDoHDHOVYISf2awbQX1+Mcw9aBlurslGIJmRRQ0/2baW5/nKct1nd1qypr8peGXF0BcT6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5291
X-Original-Sender: alice.guo@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=CHfiufq1;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of alice.guo@nxp.com
 designates 40.107.13.81 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200916081253.27536-2-alice.guo%40nxp.com.
