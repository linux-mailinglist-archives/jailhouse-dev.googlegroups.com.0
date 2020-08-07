Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBXH6WL4QKGQEASDTDYY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x337.google.com (mail-wm1-x337.google.com [IPv6:2a00:1450:4864:20::337])
	by mail.lfdr.de (Postfix) with ESMTPS id C763E23E5F2
	for <lists+jailhouse-dev@lfdr.de>; Fri,  7 Aug 2020 04:41:32 +0200 (CEST)
Received: by mail-wm1-x337.google.com with SMTP id u144sf196815wmu.3
        for <lists+jailhouse-dev@lfdr.de>; Thu, 06 Aug 2020 19:41:32 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1596768092; cv=pass;
        d=google.com; s=arc-20160816;
        b=0GW9m6REzhiGk3f/+SGCapUopxWGMoEnq8/IebdEiqp8L3WUnCQRBQgyoSk5BtQtkd
         S8O6SZPiqHe3bjrP2E7UUw/0YDiMC7Wq1nDv5CcAHengLg8J5odwCnGVEW9cAFhoFdLh
         Xm9sX9usOsVTPi5rFDUi6sgoMYk3HYFAUmi1TK/JhDArdBqtuYX6GUelqQzvdvCnPDX6
         FSmgwfSH8dqYuE8hQnejIQN+fq+WRnb60l/N3iaRIcMhzPeGysIorW2ZnUDgKe37sNN7
         Z1cgl/ilytPVf6Wx+YWrowqFNHy75/XHUsmBKPJv3MIjO+dNjvp3Gz0fACKf8q90/HK4
         2J4Q==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=5Kl6pMbUYdljQ0LXKOHd8+G7fUBhI/QXKHYgu338TVU=;
        b=oev0sxMn/zzJDdeF8vavG60gG4tnhbem7e3vNaMZ5oWQj776vysYUuanTeF4UYz7lJ
         byAMrGM1UPpXxOwCpdA1KEvZ8tlqp94H50bfjBwhrx9AqyoB0ragujdaxAfHzp1wAggS
         hh9lRMSzWBOpwXN5UAKSayutCE6a2mSKLYigssqvXv2CA152engapW67y3kQb4Ytpuj9
         ckDA5I2vMFNxbzmaa4qqMPwWDjlLCoQHEN3f8Ct/aTin7EwZsYGW5rTUmooaJGc3v1A5
         5cz4WA3mBDyDU7kvbe2a3NVj9oDj8mEPxKBTkks2UHSCnsiB6mVmrpGfDggRlbCq7nxq
         kNIg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=KCay2g7S;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.15.52 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=5Kl6pMbUYdljQ0LXKOHd8+G7fUBhI/QXKHYgu338TVU=;
        b=ltrt6et2j/yrz7GQzEosJV+GVNFP2SH0I3GHDqaDwu7eBl1kjD+HvpFwZSvwIsa0Nc
         43wUL1bwXV7cyDv0xXGF9rKe2PihsSMS3lhPadIn6T4XAFDd+r2obgqaNOKEuvKLJlGG
         1YuUc/hAu5+PyvmA+d44EHVn20k7oe0/LmjQAeSb+DIEGUZmcdsQ0fWzfEcQnm8o8AvS
         sNLaInJ1WwM/iK4MD6qkQMPWh5IdwA0Bvk97IMLnZL0Iy2O2IoxkSvu/PI37XpssqC0E
         nD0g6oeJPj35vsvXjZSY1vmGjY1L+oDmp2ONd0GtW3arStXKutYeBT7CZA+WHhvYpJKS
         5iYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=5Kl6pMbUYdljQ0LXKOHd8+G7fUBhI/QXKHYgu338TVU=;
        b=G/0oOQJAsKMSyaoZy4PwdVGt+63bFGublqclAtX+hEnT4191ma1JK7lwoyv5Zl/QtR
         4+z+L4RcXt+Rix+GpXg14CR/PUKz1fH+WgJ7AXWt374xsVIjTv3+Gsgk2fxQ3ESr4paH
         yAMQ0mT3WwwqVqysQzdvsPpB/M4l+GmoRvHr9qmsMFaVnlMhSchnHPEmOsmbyoC/U+vw
         PAFlvqucj1/3fcEU6E/63nH9rGcBp5KTV/DHB/kaxBbIwsoznilZ4DAFu9zpT1+of4Ia
         LlzpmBxytegoN7gAl/Lnx4yWbgM9CCx7RmODgjhvmvgovASliSeoFcHGpRvkZID+aWqr
         Hanw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533pkEGMRruy7l5vF68c00SGPnC3DA4LtOvsmbqZxhKkbOwcPQUJ
	r/se59f+uD+mzcR4nyCWuKE=
X-Google-Smtp-Source: ABdhPJw0tIOrz7eEObGJo02bFmOD5GoJFUOfMUv7qzWs51T7CY8a0/IPtAOTpmSyHWLdOFAkX49wew==
X-Received: by 2002:a7b:c002:: with SMTP id c2mr11119237wmb.51.1596768092560;
        Thu, 06 Aug 2020 19:41:32 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:b1cf:: with SMTP id r15ls2481547wra.3.gmail; Thu, 06 Aug
 2020 19:41:32 -0700 (PDT)
X-Received: by 2002:a5d:4c8f:: with SMTP id z15mr10325899wrs.9.1596768091985;
        Thu, 06 Aug 2020 19:41:31 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1596768091; cv=pass;
        d=google.com; s=arc-20160816;
        b=In22d4hhQrCOYm/SyqT5Ivhy02qj5FkcofKqsbYaPoHFWI2KIl3t8QJXh56nPc6HAm
         n3SBMhgDdfrKWMqzDu6NKLaE1TAojQyfZUPngwxtBt8wOZ/ItZHJikpI4dYbIh91r3Ac
         k1ljRdxy8vAlOUMQbcYZxEes/0uW0D+ccPxNLmetwD4VIqVFo/mWZNBoDp0sxR3m9wbm
         icUakyBevfjorJBDPpSkhj3N30XFL2Z82WAGCi2WQmNXNCxgDUVQO3XECKsgwb0/xrpb
         AvyvYSYNvX6UkVmwEp8w76wWBI1+wjhU0e2gIHiXhBbSvR/fE1GTvGdxISoAU6h6qxR/
         XZdw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=0QQ2heoQSgwMEWLrLkbAV9FT/RPrZuOzEd0U4s4YZdE=;
        b=YXhord5KZChtfpr3H/mzVj6cJKmkYjF22hYVCjM0i7+JcLbu1wXw5GcPD+2KkqXMmE
         QSzqO2cUvR/xUx2crHtR0kcKQK9N1FMWgY5FW3gDlJSTJjw7O+jxd7otznvLk0LKxCHt
         I96++tYYPD23Ow2t76Zqqr24XCo+t+McrEIAGSXQTu4DEn03tymDK94NaTRT/uJW0QDC
         Cr3imQFYzx1xupCZpzNwNrW5XQD36H0MvXqpd+xn4W5qF3G+WMyb+5JLD4t7DbuaJ45e
         BlHYUJnLdpg154fEkPjtEMCCzt6ZDPBefwuvlLGldJPcHG6pIcjUbprFS32+SclSh4AQ
         kuvA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=KCay2g7S;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.15.52 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-eopbgr150052.outbound.protection.outlook.com. [40.107.15.52])
        by gmr-mx.google.com with ESMTPS id f23si493664wml.3.2020.08.06.19.41.31
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Aug 2020 19:41:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.15.52 as permitted sender) client-ip=40.107.15.52;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KiLYxFMA9zOtFVUhl/0gNN2MZpozg08O+K3En9a05RmCVFvXccx9qDJIAT6lh6t8Fw5F/GRmrlwul1w4D5MFVNJndw8QLAPfg6wX50QCSW0eL2g/nPZV1OSihO4kj49xdEeB6333QSImO/PWT69tvuTrB/TOhX6D4ZJW466236bYxOa6BdmYn6cc//oguBXo73dD9daJ+BlS5+R4xSPOYFF9OXWxJOBPRjJFbvk265Pz5HeTxMefdC5FpP873M1X2OVdT44gElyz2mQN5SHK5/Z0lwS4aWRBy4/NBCcbxzBaPIPvFe7EI152GBoruYBip9GLOzty1lKURYmB4OuHLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0QQ2heoQSgwMEWLrLkbAV9FT/RPrZuOzEd0U4s4YZdE=;
 b=ah4Lkb/m0XCIWOglGGYeAhr0aynNjRgOc/MWvJx9JjEZ8chowuQuhavbUI8pu3ccjxhE6y5Bhl1rN4ROasnXL403GmrAxDeX5+nC+OfX/hozcgvBLGAqf6XDNkz493/cSfVoki5550sLNi1KKRar0UXOtLnEGYaoB0MJbe3pzyKYPSWDwPU6wSkBk8NpETOalA6u3t/Ao7l9RmaqKR71yhndRVhl3tkfm6Gz6GRQ2RexcfjXxUf4VdiSwHo3mBa1+lUC5LIe+HvPToV/VVFplA4wyhJOJIc1/DowdBQerPT4OOpIVHVE53Oq1oyrU3NEIzfaUS/3Anmzrwq9IxjkLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from AM5PR0402MB2756.eurprd04.prod.outlook.com
 (2603:10a6:203:99::22) by AM6PR04MB4087.eurprd04.prod.outlook.com
 (2603:10a6:209:4d::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.17; Fri, 7 Aug
 2020 02:41:31 +0000
Received: from AM5PR0402MB2756.eurprd04.prod.outlook.com
 ([fe80::485:d415:5f2f:e599]) by AM5PR0402MB2756.eurprd04.prod.outlook.com
 ([fe80::485:d415:5f2f:e599%10]) with mapi id 15.20.3239.023; Fri, 7 Aug 2020
 02:41:31 +0000
From: peng.fan@nxp.com
To: jan.kiszka@siemens.com
Cc: jailhouse-dev@googlegroups.com,
	alice.guo@nxp.com,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 05/10] inmate: lib: string: use header file from libbaremetal
Date: Fri,  7 Aug 2020 11:06:27 +0800
Message-Id: <20200807030632.28259-6-peng.fan@nxp.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200807030632.28259-1-peng.fan@nxp.com>
References: <20200807030632.28259-1-peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: SGBP274CA0019.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::31)
 To AM5PR0402MB2756.eurprd04.prod.outlook.com (2603:10a6:203:99::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by SGBP274CA0019.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19 via Frontend Transport; Fri, 7 Aug 2020 02:41:29 +0000
X-Mailer: git-send-email 2.16.4
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d8a810cb-b38b-4c27-2ed0-08d83a7b6429
X-MS-TrafficTypeDiagnostic: AM6PR04MB4087:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB40874D866607EB7C820CDCFD88490@AM6PR04MB4087.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:186;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yLF8yc6KtrhwWVy6+GhzneyVo2PQfZnwDLuLb6KTpUb6L4dYSou19KaF4MfUpqBOAWRx825jdhMTgzILOoLH6m9U6tJXWoK/CHc+qA4DBuTOXMJi8Q4zYwdYrG6uKy2zOADLqUDhwtOsoqBPfBfzQDigfG9mamqFFtiMSYpj9566mo758NYbfqYB4xCPChXLv7thENuQF44uOPiZiG/txL4p+nYZlVrpDTJNfYedjZBGdza3KRaTzbJWVQsxK0xInNX42BFYR64y9bDZxZZLZ1kJrxUXJc7W9iQRpMA7yf/V+xbdVLrbpBcwqefQYNs5dVAhSL08eZVtLT3Pt/TM1w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR0402MB2756.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(396003)(346002)(136003)(376002)(366004)(8676002)(52116002)(478600001)(6916009)(1076003)(6506007)(83380400001)(9686003)(6512007)(8936002)(66946007)(66556008)(66476007)(2906002)(16526019)(26005)(956004)(2616005)(4326008)(5660300002)(316002)(36756003)(86362001)(186003)(4744005)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 5EooDbDeMu8wKoV9KWgDpsWBdu7dCl8UCAGo1/3IictwjE0HHxXnKU7OkwKTdLyXunDygc5bXdF8M1aXVDOEUCPF2pTPf+zf5EP3jw/LSCW14nxSTeTr1lZ56RfvF16sdLNbyda45Qy/+FNgiJ8bQ20PUC4eLqA6tzthdl9uHkFQ/ztxv1U880FJjtVOJKQMzYg8iHo6Q5Z48kLjZYLnudGS4y6qfYtR7psYsdoN1QRO1x1LTg3gMgqVCNieMRSznI4XIki5emH1Iug7ZdZObp+zSEvIkrAMH8UlxUSKlQ2IisRWODMYTFzrb3mxngFK83MsTUoE++UGUiYXPcps9ncCyPaAIaj5E/9bHF8AmeG8AcxtZK+z5hoqlDhLeWEs5BTwXCKigYSWeEktVKBdIuK/huaryyDsUCB7dAWBcd5jadOqR9nZZPQmMH4P45u+OJVym4b92yaAcJWqueGn2zxknvJ9nsa74eK2phd8h2UoxdzsmbybUYm0ifKnNSWDwGvP8GEpXgaFDhfKEof2sW0x3rhnjd4AO/8h2gSFV5zNjV25offdzmqQ8WKqUngTUcKff+zDoJXHydAlCerTHS5RWBk2ef3SMzACvNarWt+uSoWXWbkd3mBSk8JzWi4i4GPClWwI1h5rlAfgxsdWBA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8a810cb-b38b-4c27-2ed0-08d83a7b6429
X-MS-Exchange-CrossTenant-AuthSource: AM5PR0402MB2756.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2020 02:41:31.1682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ovr3RBADFZFXCkQXqlqiKztvh00IDG9qa8S3JKVywRqQr6M7p1t62gEN9DH+UQje3/Jk11NvCOauJIY9E5ZIrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4087
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=KCay2g7S;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.15.52 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

Use header file from libbaremetal.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 inmates/lib/string.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/inmates/lib/string.c b/inmates/lib/string.c
index d3ba5abc..baade353 100644
--- a/inmates/lib/string.c
+++ b/inmates/lib/string.c
@@ -36,7 +36,8 @@
  * THE POSSIBILITY OF SUCH DAMAGE.
  */
 
-#include <inmate.h>
+#include <mmio.h>
+#include <string.h>
 
 static inline int tolower(int c)
 {
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200807030632.28259-6-peng.fan%40nxp.com.
