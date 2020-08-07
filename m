Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBVP6WL4QKGQEIRRI5FI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x237.google.com (mail-lj1-x237.google.com [IPv6:2a00:1450:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id D40F823E5EE
	for <lists+jailhouse-dev@lfdr.de>; Fri,  7 Aug 2020 04:41:25 +0200 (CEST)
Received: by mail-lj1-x237.google.com with SMTP id a20sf103771lji.17
        for <lists+jailhouse-dev@lfdr.de>; Thu, 06 Aug 2020 19:41:25 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1596768085; cv=pass;
        d=google.com; s=arc-20160816;
        b=u5UXF31Vt1ZU4+8iLuxKRCe+ySHtozM0peKQ/CSX9ump+T29eSx7A2pR6FWBwaJvDw
         rLDki+SH20mexhY+thQ6RPQnSsQxavgHfNuMF2/fqM4J76CSGFDA6pD/JGKrOVZspI8f
         JrSgf3nZIGJCzV0uc3HCsnw2XEY1GXYt9tasYwC5lPtolf5gIqO1psvwogeooShA0iw1
         u5MbJDk/8uIwVWzzYzJEPj65Ij7USjEO3RcGhW0s6wmqOkmir+xOx5ZHHAv0xU3Au5AC
         45sm1+b7oj8brNfO1MXBxONcR7TVSyvPYbOJCipVKfPCOxElsVNjZb1frMXBoX0uSIAh
         ACvQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=PIQyzaLRvaqKW584hsU3/IHZr4gv7P43Dnk3FSmNtX0=;
        b=P6zRqT7V2TNThKbV6u0Fu4O7aAwi94k1b8I1QcQp2yJEXcmExIOOajV+elTr3vwU90
         MO0K21qdB6O6lGRiECdDeuXQ8bpMlUjR2jdjrFCSrUp0uAzAaH89Mc/1wEeC6p5fK5yx
         Ckh/xmeArqgQURSjXuEv1red6Stz5yq0gzT2W2AHQjIVlGw9wJsT19bwKKqMO4kbiPKx
         0oID+YkwlNL9bKZhsnq91p+2C8LdGur+Aq3aVzdvaY1ipV7bCKXfL2i3sIE/4URBcRRP
         h+lTaMgEqqors1Q9fYe5E2vT4sCrkaUliiW1Kq9MzhRLrfafLo5xoWUYKJ5vybWTO1B8
         7chA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=rg213uMx;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.15.47 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=PIQyzaLRvaqKW584hsU3/IHZr4gv7P43Dnk3FSmNtX0=;
        b=gb4pf8i407e7oTAgt891UewVdqFIE5EZ3taCPtboZEkMm8YvxSautuK6FDwP7TlSem
         Iqfoy+yV8H9340H2xEW2ziTCvho+QRc3DFMxEtLU9GqhN1lffFVIPZFQewqFz+K09QQx
         +xLidsSaupNMf9MDOg+svXRAVTCBfrRJw5vhWqy1a5VetXhh1Ud6IJGHfgTt1MLF5hRp
         /ebyY5GFTwuNbtAOM/L4tGeHIuKjErZCF8mysMzqk75uNGW1LnoNE7mpCjBvJBubEEOa
         y9VDyeZAiUGYp3MpUxZJeEon+qOzil+U7dxjqLs1N5oWykBaBE+s2Q397QHYESAaxfkF
         QZbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=PIQyzaLRvaqKW584hsU3/IHZr4gv7P43Dnk3FSmNtX0=;
        b=rMAER96kDPQmCxPldQCbaeLlwqwD5v2/bLS9oD7XBrerHWoyZTmp6kgd8V2dhAuZmZ
         ZZAmUKSPKB/KU5Ji5XqzJg5H2Ci1PsWGd55b7Lh75+eRVuCLPcrREyEaztQbMzjYp8z8
         NDAG+hQQUDc6b8YSq6VjKpd31Lgv3u3zORpzduEUK81vJiLfKfMoazxu5wGrNT71w75l
         njo63+eaRjbGSOUQie+cmSZRefpA6ys4NmgnUyTxnmRPnKaDZk+AWmLBwVh6XxqIEaUJ
         UVlK9O1T/ny0gP9K+n1KKPbp9jmgH/qKr5jJeXKGYqnsIErnfwefEIfzawqCWgpbC5Ad
         34zw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531bVyyfxwHV87PkbaoS0n9LioNtWo+5FCcMvQV/EYi7JxrtwJtd
	Ja2VItKvvCp+Q2p3VhGsLyg=
X-Google-Smtp-Source: ABdhPJyg/5xmfRCbm46N52/imwXUFPKnWGLsY4nPkTMF1HQaOSvwsuznTLSHWuyLPWygM0TPDGN9wA==
X-Received: by 2002:a2e:8615:: with SMTP id a21mr5332419lji.357.1596768085343;
        Thu, 06 Aug 2020 19:41:25 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:8994:: with SMTP id c20ls1589052lji.0.gmail; Thu, 06 Aug
 2020 19:41:24 -0700 (PDT)
X-Received: by 2002:a2e:8193:: with SMTP id e19mr5673912ljg.80.1596768084589;
        Thu, 06 Aug 2020 19:41:24 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1596768084; cv=pass;
        d=google.com; s=arc-20160816;
        b=Be6JelR2VTdtBj87Rj3gpXOQjkzPOmHBGZc4x4vc1vHOFf21JbM0GYC2jI3alAKvp2
         0hPBmFFW/mogt74lZjtfPfvHRyjI3Cq/Pjvcm3f+G1AOpE+upYOiEcTJuoqHa+XYb3Cn
         /OTTW9zxFGuJKNYunouDTcUtWO5JgFwzf6uO2rjQyNKo4HWDOxOmN3XQ1TtVxQliE06s
         Fi1aQCjN4yKW9i3fJ17i5nI6K5yWBpZ+z4OgRnnxr73f2Qo01/w8Pn3N9R81l+KGimSZ
         L8LSHJcH9xthkfWWEhhuQEsDJNJbX1O6JxPxqdIPsv0H71s94Vz/LMg7NkXnvS9PfJ3G
         TvxA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=32lxPWEXLYy+yDqnYiCCQHULVsyit81J9xhWSdxlayg=;
        b=c6M69obvT7FcmUhoMJkOOVWJng3aOJZmZ8QvxeuAygg3nsc7wyQlHfgg7EFKSIicQ4
         fRubj8muQEZQ15KfdJwj59R509VorNtTOBKqGHjjiWDhfKKycvL1hmHSZj3TmBiRVy2q
         KtnXh+L1GhbD7rHyMrYaNuYd5s3sT42n4O6sL8wKBQEPFNFB6+h84Yk+rlHF4Kjzu0yn
         ylljRrtm7jjAxNNqTTzJBCUsF8YW8gYKkjDIcS76CE4nS5/+yWfbZ7+BBsSxODgXpsDF
         OpASRJsH7TGHCGuBZPkQpLnp177az99K/YviWPmnYZ4TswYdhwnZVopOCzODNODK1QXt
         rNVA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=rg213uMx;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.15.47 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-eopbgr150047.outbound.protection.outlook.com. [40.107.15.47])
        by gmr-mx.google.com with ESMTPS id a7si222439ljp.2.2020.08.06.19.41.24
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Aug 2020 19:41:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.15.47 as permitted sender) client-ip=40.107.15.47;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H7TzB4JWVvfrd6vgGQ/YYlyaoLoc3ne4K0jIgHNA43b41nN5a8QgVHlx4MZi6B/6BxE72TIP99qIYim3l34sdoonS3SvTGUGg1+yawfuZm6OMkbluu4Y61Vp9ThpX4nuIlLQddVIcY27YtUmg8C6z8lZXv2vmlr1eYZsGfNpfQEil56H1LkDAtJwCiPbapCi3Wrol7hdHFk4pDqzAGWH0/J4KCb7hOANwUhzGYZBHKyzFTAxohSIFK5pz/jsx1GpMYtkg0brmvq5FdweqjIA2jafT1Qn8oXDijemMK9EdSAi08eCP/KDwImB0FrIC3pUSvWFuI1jmPHh44Sb99DfSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=32lxPWEXLYy+yDqnYiCCQHULVsyit81J9xhWSdxlayg=;
 b=k5FMN0/KFGpqFaMYVKqIUSyLXoFLr2s0TfXXKb6z25kzQoBMYEO4+65cERKWxHjpjDLfVEoIBhg1qmseYYPCKC3kHArm5vnzbqU4rp5NMe1P0NlgGC117qYV/fgvvjrG515eO+ejsSSpvgxv+xMCWt3sxq5zH/Qo1ZUQBZ+afZvD5N1FFVLmgNSVlF6J0Ues2BdwCjPFGsUMxFNPQ46VTvJTpJh3kzVtmPbGxeNDj6+/W107FEZWn58+o5b/xw68XPVPUJ9PVLzYA945d3WxBwyQdwl8R5/Vziv12w5LtBdSk4DQAByUiaePtN9ecJVHJQL7Z8sJFkxW4uhXUwOOPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from AM5PR0402MB2756.eurprd04.prod.outlook.com
 (2603:10a6:203:99::22) by AM6PR04MB4087.eurprd04.prod.outlook.com
 (2603:10a6:209:4d::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.17; Fri, 7 Aug
 2020 02:41:23 +0000
Received: from AM5PR0402MB2756.eurprd04.prod.outlook.com
 ([fe80::485:d415:5f2f:e599]) by AM5PR0402MB2756.eurprd04.prod.outlook.com
 ([fe80::485:d415:5f2f:e599%10]) with mapi id 15.20.3239.023; Fri, 7 Aug 2020
 02:41:23 +0000
From: peng.fan@nxp.com
To: jan.kiszka@siemens.com
Cc: jailhouse-dev@googlegroups.com,
	alice.guo@nxp.com,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 01/10] inmates: arm-common: move mmio helpers to mmio.h
Date: Fri,  7 Aug 2020 11:06:23 +0800
Message-Id: <20200807030632.28259-2-peng.fan@nxp.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200807030632.28259-1-peng.fan@nxp.com>
References: <20200807030632.28259-1-peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: SGBP274CA0019.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::31)
 To AM5PR0402MB2756.eurprd04.prod.outlook.com (2603:10a6:203:99::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by SGBP274CA0019.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19 via Frontend Transport; Fri, 7 Aug 2020 02:41:21 +0000
X-Mailer: git-send-email 2.16.4
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 394b0655-5208-49f4-008b-08d83a7b5f60
X-MS-TrafficTypeDiagnostic: AM6PR04MB4087:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB4087FF4E7F417C000EC9CE3288490@AM6PR04MB4087.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ohBGNNVN/Oe2fJMe4e3B9PA/FrhtQgRjksHLMr9Jzy7u+POAbdp1LjoyuCIBbOeN4U0irio5+ji2dt/U67x/DhFiR6nacHzTKnqwP57xl1t8/FE21Ir0sn0scFw/qMOdeRSYUS8hSCSx0CfKB31t7puYqAuCf+++GDzXywqcv3/SFjwl5I9UFsnRXFPYpyzMmx/lfjz+7hSR0UNonfk1Gao75JwHp+7gc/Yo55o8DsVPzKcDGcCFVqAxta/M9y1KBZSdF/es9Kh5tX79OmFGLjrUGhWu2awp/20aMgCBtItkAlOwwiMVluyIWiFpbb9UdnCcuindCutT2hFONW9iCA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR0402MB2756.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(396003)(346002)(136003)(376002)(366004)(8676002)(52116002)(478600001)(6916009)(1076003)(6506007)(83380400001)(9686003)(6512007)(8936002)(66946007)(66556008)(66476007)(2906002)(16526019)(26005)(956004)(2616005)(4326008)(5660300002)(316002)(36756003)(86362001)(186003)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: CkIhYPJQ6JB8QeCcT0baLL7eEYeGI6cG9f7m8+YPRwHAP2rhARr9VQH+WZSlyLGfU+KhRlDFXwDjj2OUVMmwQVAQxFpXZbkQMb9pfmnwpeAvSCqMfaV9iM+IgdTHGgsDFrJFoL/pk4UgKi+IjfrpgwrWABHSrwKEjm0qF3lzSs2Xs6pEa54QSoVHVFdQYqFMbSL/iZp+vZpSPyhSX4XtAIp7/mD37b16JX5cCtP5yjnZPyuRUu9Uae1hwc1H1r+L50MnaGD5I/c30s20mj6+bA5NujRAVxYnvwi1uKMpKR7NnbG6RNedrbvRAwl3gTc24F72xFeQr9iZKt7OZeLvS7Du++xhxmyLbosL89SavNYx9js2b0GOjYhzJ9NiClPidwI+yQz4aXv9xo/kKnhecJBGkotWzTUy+RcJJFSaA04p210HVPbTpOb2suddCrLCUC1I5kHZi6be+itiz+uO6vilDrOSHSUmHZG+kgSxlh5l1rmiVI7RkzCXDATr2sdOpkyWLoc1AhTKOVJmkUjrgJf8+blj8/mVrAyMCMZWPggYBVq+neZqzfBXt4rlWMdteNcoWUNJSUJ9lUs/kozb8060bs9qcHkpBxofIX/XOk4b1OEK5NCghb61e4o36qTmH26835fK9rIj71beqViijQ==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 394b0655-5208-49f4-008b-08d83a7b5f60
X-MS-Exchange-CrossTenant-AuthSource: AM5PR0402MB2756.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2020 02:41:23.0209
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zslyLLPB2D99NQ+1DICWZp70eOCp3cRulBowPSnSDVGMV0MfqwDMAQWuxA0QgJLdpUL8HcXb6kKffP7/2sbUtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4087
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=rg213uMx;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.15.47 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

Move mmio helpers to mmio.h to prepare mmio.h be moved out
to libbaremetal

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 inmates/lib/arm-common/include/inmate.h | 49 +-----------------
 inmates/lib/arm-common/include/mmio.h   | 88 +++++++++++++++++++++++++++++++++
 2 files changed, 90 insertions(+), 47 deletions(-)
 create mode 100644 inmates/lib/arm-common/include/mmio.h

diff --git a/inmates/lib/arm-common/include/inmate.h b/inmates/lib/arm-common/include/inmate.h
index ab5681d6..76d3ace3 100644
--- a/inmates/lib/arm-common/include/inmate.h
+++ b/inmates/lib/arm-common/include/inmate.h
@@ -39,56 +39,11 @@
 #ifndef _JAILHOUSE_INMATE_H
 #define _JAILHOUSE_INMATE_H
 
+#include <mmio.h>
+
 #define COMM_REGION_BASE	0x80000000
 #define PAGE_SIZE	(4 * 1024ULL)
 
-typedef signed char s8;
-typedef unsigned char u8;
-
-typedef signed short s16;
-typedef unsigned short u16;
-
-typedef signed int s32;
-typedef unsigned int u32;
-
-typedef signed long long s64;
-typedef unsigned long long u64;
-
-static inline u8 mmio_read8(void *address)
-{
-	return *(volatile u8 *)address;
-}
-
-static inline void mmio_write8(void *address, u8 value)
-{
-	*(volatile u8 *)address = value;
-}
-
-static inline u16 mmio_read16(void *address)
-{
-	return *(volatile u16 *)address;
-}
-
-static inline void mmio_write16(void *address, u16 value)
-{
-	*(volatile u16 *)address = value;
-}
-
-static inline u32 mmio_read32(void *address)
-{
-	return *(volatile u32 *)address;
-}
-
-static inline void mmio_write32(void *address, u32 value)
-{
-	*(volatile u32 *)address = value;
-}
-
-static inline u64 mmio_read64(void *address)
-{
-	return *(volatile u64 *)address;
-}
-
 static inline void __attribute__((noreturn)) halt(void)
 {
 	while (1)
diff --git a/inmates/lib/arm-common/include/mmio.h b/inmates/lib/arm-common/include/mmio.h
new file mode 100644
index 00000000..df7a2312
--- /dev/null
+++ b/inmates/lib/arm-common/include/mmio.h
@@ -0,0 +1,88 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) ARM Limited, 2014
+ *
+ * Authors:
+ *  Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
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
+#ifndef _JAILHOUSE_MMIO_H
+#define _JAILHOUSE_MMIO_H
+
+typedef signed char s8;
+typedef unsigned char u8;
+
+typedef signed short s16;
+typedef unsigned short u16;
+
+typedef signed int s32;
+typedef unsigned int u32;
+
+typedef signed long long s64;
+typedef unsigned long long u64;
+
+static inline u8 mmio_read8(void *address)
+{
+	return *(volatile u8 *)address;
+}
+
+static inline void mmio_write8(void *address, u8 value)
+{
+	*(volatile u8 *)address = value;
+}
+
+static inline u16 mmio_read16(void *address)
+{
+	return *(volatile u16 *)address;
+}
+
+static inline void mmio_write16(void *address, u16 value)
+{
+	*(volatile u16 *)address = value;
+}
+
+static inline u32 mmio_read32(void *address)
+{
+	return *(volatile u32 *)address;
+}
+
+static inline void mmio_write32(void *address, u32 value)
+{
+	*(volatile u32 *)address = value;
+}
+
+static inline u64 mmio_read64(void *address)
+{
+	return *(volatile u64 *)address;
+}
+#endif
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200807030632.28259-2-peng.fan%40nxp.com.
