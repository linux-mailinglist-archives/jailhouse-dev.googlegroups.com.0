Return-Path: <jailhouse-dev+bncBDEN32754MOBBC4SQ75QKGQEMFQVLOI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23b.google.com (mail-lj1-x23b.google.com [IPv6:2a00:1450:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F07F26BEE1
	for <lists+jailhouse-dev@lfdr.de>; Wed, 16 Sep 2020 10:13:00 +0200 (CEST)
Received: by mail-lj1-x23b.google.com with SMTP id b17sf2094643ljp.3
        for <lists+jailhouse-dev@lfdr.de>; Wed, 16 Sep 2020 01:13:00 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1600243979; cv=pass;
        d=google.com; s=arc-20160816;
        b=L4r4YmBw4bJX8odLjVMSMbwztDvMbZ3R743YdflsYCczkGKEI6SbyRzFBqQGX8uBHP
         hfr25MiFfjf7kKVDCnQlvJ8z/9OYbzs0SbFRuinYuso7pB+J0oRFAT3FsAzCQsZC3LrB
         m+GccNfPCYr2yff+kkH2zB0KHOMABqh35g+b/trs764RJl7wbQ2nmybvFLjMGq/xKjO6
         vCOuOmpWGjIuQC9GRfoOLaPmw3lkO2mmtlbOO2AWeYJkrGl0VvR1NDkXgjuDx6JiRpTV
         9AuYjpM9J6DYWhccnxIpGbJjfm7L8xkVik1CEugPywjoVUqRZGqUSM1EHAvt48GQPGLh
         NmZw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=X/PigXs9KWUWCBFPHoderPjRaOmsy6umeFSnKK+Wdfo=;
        b=c2eZ+RM2ITaQFepoZPRIJRTjCos04r9mTDQYVNPZV9U8gNL8Lp9qEapjVe5Xem1ksS
         WgZgMpnIj+HShNfDq2pv4Mm2Af1cfjpwmGMkddHKMNU4OkI61aiGWbcznrdHW192xNuP
         pG7zw7F1cDB1RoHBNEL7QB0ZAn8rK7OuD3+s3GhJ8iAMxMkp0U4OoTkDNdiV5xG3QwKh
         8D/suNKgFcMFPoBkk5dqBKLyE/hgur5RVzmaREZKMFNiEWiJYWiDfygZ4hhaDiREpDn3
         I/6R1SIzOZN8g8afBJyyv66Fb3o5rBWGQTzhikDdJgSLUN4+sK9rsUf+Kwf2T1iFY8+G
         Nd9A==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=UXCV+DfW;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.5.73 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=X/PigXs9KWUWCBFPHoderPjRaOmsy6umeFSnKK+Wdfo=;
        b=KE8ELkohZ/jkrG/xPOklUTkneArla0GSw8WHwmLCGpL3B9yScdwQHm1SXDtB6iGvDl
         LwvWUjxR1jdZ+PqLdO163o9uf/YgUu5nTq/P6roNi4kHte0ekogmYm/dYfpC/dQhrLBJ
         XIwLRD6HtgIHv8lVo2xuhNuXE9yn5BdvKTTWojqa69pjWRhv5pbC5Lw42h3zVBsWHeen
         zNDa8RljsXoIqRVfw72qYkjvZ5l7IhQEgMVEvNlfR2kmS9Mdi8h2vLu1lezS7DGah9EU
         xW9HJgRV04GHFUalU3nhiYMDdgIN7IkXHZ2OVpo/hnmqdF4/1Hh2qoqp67gm4+a2euG8
         Qxww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=X/PigXs9KWUWCBFPHoderPjRaOmsy6umeFSnKK+Wdfo=;
        b=AHgApm3lMo35FoUXKJXiSKKIMaYwtCViAnXsYAHiH/rAEjIVmniTRil1Qx9EdY+BGn
         fIdPQcaTSh41WXqs+sgF2gCsEj5dOE8suRK2Eeq1MYanLlIgH7yS/b+Jyi7ZXrBn7W68
         NoFTgEukd6c3mTan00GugeeNtI5Wx89iazEBU55YR+9JtqnlPKsJSeqLb+ef0MkfqiSk
         Yx7EfMTivbdJMXjBwuu/sQMJxnPh+7fX/WJqclpYLVrGTwZLnEf8z+eCS00yG95/J1NZ
         A5uOGFT4dl8axpd+t/qqwcYV6xQuxI9ygpeQZYTX8BhIZO6FMv6hcD3nLSD3HZImmgj/
         fU2A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5322mEJO3C3jKBm4+ua5QcIYAe4VrXEe0Gv6qvXNA5EOtoybME/s
	/kV5Wn5Sk/ud+Vy9rAxIT2w=
X-Google-Smtp-Source: ABdhPJy1BRec5QdAc1/hJFeoAuoeIyBlmo3bRYNtSaZEf5qYB6q602jFXu9MsKSXKhsDLxfN7Hsanw==
X-Received: by 2002:a2e:8257:: with SMTP id j23mr8067913ljh.49.1600243979582;
        Wed, 16 Sep 2020 01:12:59 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9a93:: with SMTP id p19ls164169lji.7.gmail; Wed, 16 Sep
 2020 01:12:58 -0700 (PDT)
X-Received: by 2002:a2e:808a:: with SMTP id i10mr8782294ljg.313.1600243978435;
        Wed, 16 Sep 2020 01:12:58 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1600243978; cv=pass;
        d=google.com; s=arc-20160816;
        b=N0K9/lHUpT5C1T6k4konmuWNh0+Hdhlpb9vc+fkAtq04JC1S+eXuQF5/ONTi1oKP0u
         gTzKNlVRYVHcHgP1VJNjrEH8srywTTZ8JNhQmlYWoshVjyM00+DGNKx+JqJnDob2aT77
         ne1JiImE7potop0GsR1AlErw5GZYiSergEsYwh3kzSKI+ww3VpThm1cliL7SavB5qI9F
         SYAWJPNOf10P4PSV5lVE3pltYccO8OiCxH/K1vOIcPe8i/zWhmmQjc5G/aO6qdFBxOhD
         9mUfHbtP2r8DXPXuuXb9V4LR1dylW2elSOw6Gqwq7b1qJuz9nSXZPfqJPNKohc4SLNrv
         BXvw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=uvhg7VrGt8o5lz7FlP9x/t+Sq3vE790tEeinVndkDJg=;
        b=z1Gy6VBXjDsAWvgu4nvlrLcc0039TJjucBqhLL6+NOByAU36BtYjtvxBOqvNcAu1iA
         i2ryDqjDrtdMRHUdVxH1ud039GXbVNIZCV+awOaGxW8cyrmpBtdXEkrtKD/4aR0lH41+
         x0BWO6KvXAZ0C4A9SvUY8x7rEqVq6VMuuMKegSgMpPTL+8CaRZxy4/QWFWZ2kP8705mw
         zMPSTbXcAJ901ZyBu/kp+/crBZpXu9yll7FRAOGtwq3RiLA3dXbY7xaLKOs+HGSEp2Kz
         TMScfeTcp9IcNikTuRxrvz8TnZ2a2M8cHtN0QhYPVuKegCoDQhlMSlAjqZ27F/pxGr/Y
         R79g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=UXCV+DfW;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.5.73 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (mail-eopbgr50073.outbound.protection.outlook.com. [40.107.5.73])
        by gmr-mx.google.com with ESMTPS id 14si498952lfq.5.2020.09.16.01.12.57
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Sep 2020 01:12:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of alice.guo@nxp.com designates 40.107.5.73 as permitted sender) client-ip=40.107.5.73;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hOImzZ8s6oge8glQOT+2wy1l1Wrt/8nkW1JnXLfMQNlVCPj/ZKZaNkFaYQJ7/bJmaJJL164RO8z3bkyoHmNaUar/az+kolMw7/kIpQj0nRYmlSndVXv1PBIMVG2E31BwmrcL/s3OBy0pt24qjDIs2pmsM8ugIOX6Whlr4sh7kwf9+S5aRCowxYFMKD2567XBKZcdRwCEUQ589QBv4mjGT2b9g1dM2tx0PIzQtCJmISjfKbfMhocPK/ulHiGYlbAQoDC0bm/PDmafutmSClbwcXdZOiUGgeM1/FGai2dYIby7C8D5SDLSrP1EUP6qI8ne2Nvi111X5peZehoh/JFtCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uvhg7VrGt8o5lz7FlP9x/t+Sq3vE790tEeinVndkDJg=;
 b=A/ZR+oUvi7LO5a7oC5SfH2DGk3I3Gre07cfPhzprzo/5JZKwzQxge+iTrII3joh9cfXa5sKPQpIS6GVBboT23q/sqmW14DrhvzTQ5/AVR+JOPvZgjVFsX66hhCM7uvpKQ9F/kOpmPg+cVmxqDfGHiOVMMjnvpvyG8CAWbRRPBuOR+fNb0f6x2eAA5/Remh26Beg5USOksH/7MMumXGzgYYtttg8wYVFAXk8Ek+sEHSE0rXYy6r9YYww9RvmsMZBqAhWJhz1POeNyEZsgCKxRlIMVC+YfACn6Oyg6Uu+BMIJaL/a+QXMhMLr2ge3M7sJrCKKUnUP5M22ksh5YUKYpUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com (2603:10a6:10:127::9)
 by DBAPR04MB7208.eurprd04.prod.outlook.com (2603:10a6:10:1a8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Wed, 16 Sep
 2020 08:12:56 +0000
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::ed87:8435:3012:9618]) by DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::ed87:8435:3012:9618%9]) with mapi id 15.20.3391.011; Wed, 16 Sep 2020
 08:12:56 +0000
From: Alice Guo <alice.guo@nxp.com>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Cc: peng.fan@nxp.com,
	Alice Guo <alice.guo@nxp.com>
Subject: [PATCH V3 1/5] include: add macros of different sizes
Date: Wed, 16 Sep 2020 16:12:49 +0800
Message-Id: <20200916081253.27536-1-alice.guo@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: AM3PR04CA0141.eurprd04.prod.outlook.com (2603:10a6:207::25)
 To DB8PR04MB7065.eurprd04.prod.outlook.com (2603:10a6:10:127::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nxf55104-OptiPlex-7060.ap.freescale.net (119.31.174.71) by AM3PR04CA0141.eurprd04.prod.outlook.com (2603:10a6:207::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11 via Frontend Transport; Wed, 16 Sep 2020 08:12:53 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 11453eb9-bfc6-49bb-4115-08d85a185122
X-MS-TrafficTypeDiagnostic: DBAPR04MB7208:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBAPR04MB720842104CE7F2240F3209A8E2210@DBAPR04MB7208.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3/0adZfdpU3PzRH5XaapSLch3rVmVQESAdMZ7WuDT5S3a7nkcxJuMAQlWsQ2qwEdEfTyRhuqLrHgubxHOQvmdMXxq3tlu5mQrotro8OLeFTMWk3TcPSxY5HfmlHVTv8+0aHDs8JCUxjhE8ehfbatmrRlq0mQ8Ovy0BwpVTPXkjkfObdevce4a8tRoWOtWAIxnjwID8nhAaT8QjYBUUovkNWfwMCv8UMWl6089BF5BbKFZ8/sySzFnh8HYc+BdswnFV0DEBLMAhpXIWvqdQ216ls2sF2exZKIb5ft3oVdC47kQrjkxWxfAwEXNegfG20F7P1EQl09Qo8tPPYNbVKKWVK5OrlY/Nv2mZzbJRYNSgZ3OMksRimzJzwPQFcTxwBY
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB7065.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(4326008)(1076003)(6666004)(44832011)(86362001)(5660300002)(956004)(2616005)(2906002)(52116002)(8676002)(26005)(6506007)(16526019)(8936002)(186003)(498600001)(66946007)(66556008)(66476007)(36756003)(6512007)(2004002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 56cZnNRNcZOA8OIrA1n2C/A7i9Q380Azj3XbpqsJMzdoECsi5vte+5BpJNPg9fbwSghTACnXpGs/uVwN6SmACVziMtegDIGykRgfzy4+pd6FKLRdTaKCMpIAhBIxaxwg5yEF3iV/5Atnm+Wg2LMWTy3dXHUeXkLmaCu33w7SXMQVHIq6si4Ix3eLgvoPUhzCHSi2oXlqmgGIuiTWHN06PPfPHfmN8SIgHQ8YnxLdFbl38aqew0edlAobd7mTunARG/c3vUzFGIqTP1D3X2g5QZMeIMA7oyPmZgdYyGYowCfLrNz7ZKwEsY1cFo9X8ph/659UlDxF8D4vPkpEtpYJi80Mn+k526ASph3rBDkvwwuHJj6xgJsvPdnrRbAA42ZJukjC4fS+OUoXic8K2+Ip2cyTwNYPZxTWUPjr+txZdgzoUiOj6lXSgPC0IYp5drSGxj8FjHdD2Q5G4MgiP7eM/a+AGlrhRIEJbwSIUXXA9fSaAeerZw1DoICObPrBDi9LGqkJAs/LxArpugCyU8KC4cJl+6yicFE3QxXaHW+3jc6ZG3MlIQYBEXv1xft1bCLW3aENv5kzqchO642pakcYdXUc/M3K2RlFim+JBBUA59jsmoBsmp5P6ibomQN7cDrwUyeMejspoQyyAq8lqC8WJA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11453eb9-bfc6-49bb-4115-08d85a185122
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7065.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2020 08:12:56.5345
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hQngCEoq8FNKsNGBTtCOqKPEEqbd/dDSahhdjQUMO+YMgqi8GYKvVytTPiwG2Fp9cR6x9winHQhd7PCGILMb+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7208
X-Original-Sender: alice.guo@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=UXCV+DfW;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of alice.guo@nxp.com
 designates 40.107.5.73 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
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

Using macros of different sizes makes code easy to understand.

Signed-off-by: Alice Guo <alice.guo@nxp.com>
---
 include/jailhouse/sizes.h | 47 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 include/jailhouse/sizes.h

diff --git a/include/jailhouse/sizes.h b/include/jailhouse/sizes.h
new file mode 100644
index 00000000..ce3e8150
--- /dev/null
+++ b/include/jailhouse/sizes.h
@@ -0,0 +1,47 @@
+/*
+ * include/linux/sizes.h
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+#ifndef __LINUX_SIZES_H__
+#define __LINUX_SIZES_H__
+
+#define SZ_1				0x00000001
+#define SZ_2				0x00000002
+#define SZ_4				0x00000004
+#define SZ_8				0x00000008
+#define SZ_16				0x00000010
+#define SZ_32				0x00000020
+#define SZ_64				0x00000040
+#define SZ_128				0x00000080
+#define SZ_256				0x00000100
+#define SZ_512				0x00000200
+
+#define SZ_1K				0x00000400
+#define SZ_2K				0x00000800
+#define SZ_4K				0x00001000
+#define SZ_8K				0x00002000
+#define SZ_16K				0x00004000
+#define SZ_32K				0x00008000
+#define SZ_64K				0x00010000
+#define SZ_128K				0x00020000
+#define SZ_256K				0x00040000
+#define SZ_512K				0x00080000
+
+#define SZ_1M				0x00100000
+#define SZ_2M				0x00200000
+#define SZ_4M				0x00400000
+#define SZ_8M				0x00800000
+#define SZ_16M				0x01000000
+#define SZ_32M				0x02000000
+#define SZ_64M				0x04000000
+#define SZ_128M				0x08000000
+#define SZ_256M				0x10000000
+#define SZ_512M				0x20000000
+
+#define SZ_1G				0x40000000
+#define SZ_2G				0x80000000
+
+#endif /* __LINUX_SIZES_H__ */
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200916081253.27536-1-alice.guo%40nxp.com.
