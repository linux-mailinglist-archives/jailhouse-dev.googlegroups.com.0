Return-Path: <jailhouse-dev+bncBDEN32754MOBBJGBRP5QKGQEMLZAJIA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x438.google.com (mail-wr1-x438.google.com [IPv6:2a00:1450:4864:20::438])
	by mail.lfdr.de (Postfix) with ESMTPS id 7486B26D208
	for <lists+jailhouse-dev@lfdr.de>; Thu, 17 Sep 2020 06:05:57 +0200 (CEST)
Received: by mail-wr1-x438.google.com with SMTP id w7sf348778wrp.2
        for <lists+jailhouse-dev@lfdr.de>; Wed, 16 Sep 2020 21:05:57 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1600315557; cv=pass;
        d=google.com; s=arc-20160816;
        b=h/YIGJ0/qNJsXRLBFOqYqAom86toHgkVa+0sNia5hm+bnK0GHwg62Z6TnoFZQpK8Vj
         s5YRh1xV35vYhHS3rRMuQLtKy6Ok6aU26fRx4hqmFPSlbb20Xa5m2V6VUfmabAJcwd7f
         UtEJ/qc0K7V5PUJ6trjCLu87zB357o1BbTU68X9EclM44UEs2J+c4qf9ZlpCaxlVoQPK
         h+zgpRX1XyWm6ag0ISguosmVwMhHGr7mTjzyLva89OQuuGQh7XwKNNg759z9xUqc7Upk
         38kxshm97C7LLaDlWxK6biTYxMDFeu5HwFiSNBgIsEbasdBCoEDLgYXQ4MW67WDLnPj2
         vTJA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=WBU+TaqbYoETV9NVY1K9ZMXa0Zn9A1s9FoJxs2l2UaU=;
        b=IUB1Lio3W0fvoEBZ3V6JkNTEK8bUusdTnESHwFUdjwFE8XWp7ggJFgxZDRY/lxDyeW
         icnFg5RN784cGQ686fPEYCWHGw7HcTthWoJ5V5b8LAfMkagEZ2WCkqAYFDSoDMNiFz/4
         b48K2jVzuw9M8yUaT/Pf+7SFy9OdGsRa5xV8RML93n8ZL8GlClRGYNWb8eX1cQJxnAl4
         +uTxPbd7M+02xkdjh2T0Q5EZrkz54USVMTV9l4v8fJPWyyj0f3k8udngzN2w3/ja/Hbe
         GFkX5vn/Ke0Q+RnI/1jI1XQPhQiCxgSB9DnH9wtr1PSy1fzA5ArrpaiXt7AedAgwag1m
         oK7g==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=UPc1XBFk;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.5.45 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=WBU+TaqbYoETV9NVY1K9ZMXa0Zn9A1s9FoJxs2l2UaU=;
        b=QrMBmzROWhlijlCMbHWmb1ziqJZZ/8pnX7RHS2TTvJtK9G3xPAsNJeJewe3E0C9rAY
         Sf2gs2lZ0TNUqZKJYlDw3jcMiIncRJ4y+dWpHA6pQKGot/UQFJvprDI4xzaA/7kGiPk4
         s8ahiUYlSqUomcD8VabB1VkbTtFi9lcqx+XrZ2LpT9yCPrHM8jyO750YpxUeiN0lG+Np
         w/eeJTzq6XQNjzLBLF6goGOiLiHOyeNhExTv+KFR36o5valNzXXNu0KJIRmeplBjZOVK
         VdX6gxrmmBjhgxr0Y22HJSXUUj1aTFrTp8rSQF3cGBn1o+9NkWxIzdkSTrlrF5M39Fml
         zKTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=WBU+TaqbYoETV9NVY1K9ZMXa0Zn9A1s9FoJxs2l2UaU=;
        b=NcuRVpneGWqkEDx4QS79uiw22/x3rXY+9YsV74bhUVxFKv34DgOlorJwvdXAkxVxpx
         ZQ3RmTKDVF/pL3kaWZ4BqY3oEJMY4XlqiTRGyMAj8kCJRlXeXP2uosA3IJ1AOnbFZgHr
         dpgAmXqoDc+SPRr4KdYIEMe5hl3HG58Ipxhgc6Fm++916ebQU2BdgeX+rNTLs6nG/+UP
         Zsgm5I8N3NIKuEgYNTZtXfAN/BNtCc8Aeyro9ov+JycnTpKMj6M4c4IE1wsFu/G4Mw/v
         pbkdUPIv6sJnFE6TTQqRWAG2l3S9R8aOotcO1d47wwdUFrvjuQbeJE2FJoG3wHrRIbiL
         6E0Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530hS6sdbe+w6t5R0U35VkJXbnAHk7F0nxClX2Y2nwzpYPglJfUk
	Y0QOgAvhAPs8mesAHmf/bxM=
X-Google-Smtp-Source: ABdhPJzmMkuPlUa7pkzTPX/EDsB875yB1ShM76ZVbgrSxf5sytyNkOkqfN99ZtR+Jj5ozwSnLlR9dg==
X-Received: by 2002:a5d:4a49:: with SMTP id v9mr32633228wrs.153.1600315557197;
        Wed, 16 Sep 2020 21:05:57 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:428e:: with SMTP id k14ls594219wrq.0.gmail; Wed, 16 Sep
 2020 21:05:56 -0700 (PDT)
X-Received: by 2002:adf:9f10:: with SMTP id l16mr31955435wrf.77.1600315556280;
        Wed, 16 Sep 2020 21:05:56 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1600315556; cv=pass;
        d=google.com; s=arc-20160816;
        b=TnnxpY9QdR08p3KE4Ja+uOaAJSaOHIRcx3snixVd+qXyMhYWeVKv4VRqUD61WzRXOc
         IbRWYtAxiSmQEsuD0Obahi2T61AfKIzNaIaQSAQrPeC/+Bev73mJ/z766Ad+PxWlVLco
         Egtr/5TpJ3tH1H1G+H+Rn1yN2QpwuyVm+ZTUu9ua7IlEURq4rO81Qt9fFMd5GAcx5Xwx
         mLMCqPDZTGNL1GQeHTUDTOMSgGhyO8dleXqAHj5GafIJaHEiPQNkwYoi8aCdI/8v70ct
         oeSXZe5EkekOG9iGSfXlrdsfA8jcPJWe6Bo9wGeJ4rLPPy0pvKXtnSnBBya+/g0mEoNt
         nM0w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=uvhg7VrGt8o5lz7FlP9x/t+Sq3vE790tEeinVndkDJg=;
        b=DIXGccqcckOIpd699UOiKD9fWzeRNP2i+moEYoW9VjygOugBOQQtSQ8HCut7PNqPSD
         v/egzTdtrquJofLOwnSNuQrdeD6adE0cbkJqAe/kE19VMMlu2ar8cB7Ue5/G+gH7hlg1
         sA2yaSVpYGYYfHVAcBKqtOL1Jv33Mq6vCeQJcboJ3y1bfeHQZruzF/IpTVQF+LL0jGBo
         aLkHfYflt/7GBuSb2Notq2atoQOaohwczwXBs/kdMZOr/rIvYPbZzNGO4BmaIAOXljTw
         m6Yc/oO/vjHQgesWdc+pf7P2WNKy1dP+NiT0hbdggljAbiIlqpC+A4R884w//LsNN1oP
         AFoQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=UPc1XBFk;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.5.45 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (mail-eopbgr50045.outbound.protection.outlook.com. [40.107.5.45])
        by gmr-mx.google.com with ESMTPS id 21si122274wmj.2.2020.09.16.21.05.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Sep 2020 21:05:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of alice.guo@nxp.com designates 40.107.5.45 as permitted sender) client-ip=40.107.5.45;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U9CeZn7MYleRFlxq2w8AiHz0dydH0pADgtfAoN8e3dXTdoW2ROu0gDPcBO7EpFnw9m/2eHjlgqu61DRcYyWKOvL75K391VlGn1jlk+5yBh35avGfA1RMIJ7421bm2OlDwnWJ1ffkEZ3BrIOD1JS0fKofiiLA9nVSZZ5laNNOKYTQT+WvzNgQRhAETBEgQgZXb5jN4V/+AFR+NAVSZIQgJ/uDWozHrSdMN8s7yf1gEnQyh4DK+HrUaJTlrIwT6LQw/DJisWs/xAR+Uggsvri3MIp/yq5IN0EiUO8eCaAGznoirkiJmiSL7IXg4XBA5TJPj6o1zEa6/lTFVlvL73u+oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uvhg7VrGt8o5lz7FlP9x/t+Sq3vE790tEeinVndkDJg=;
 b=arh4kAn+WONQ7CJu12TVS5t/30bMHb1Ixfw6qjjAH/sD8UR3wEOOzDltw51nUFgJfmLZoTDSStk/yHqU35W9Af9WEuNkwWp2dc58Qul3+ASg7JFiFBgblFbIzmsBvdz4B/SPu823NXWgiWn71m/4xLphXbna07qXACVxxfU07b4+T4fZM5rSY7/pP71sAD64j1YNfnukAhQ1IO8ox/fB6R8rsVtrf1C4olwxyf4/COADV/7+/ft/jg1flXnw+ybXCR2oAT7cGJn9pHbhc4wmk1usjqpknDekEuKFHRpA+nX9pmKPec2Zo0GlzoHwzPM7IY9dxCwcVvHBglKCGcWXPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from VI1PR04MB7071.eurprd04.prod.outlook.com (2603:10a6:800:128::8)
 by VI1PR0401MB2398.eurprd04.prod.outlook.com (2603:10a6:800:2a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.13; Thu, 17 Sep
 2020 04:05:54 +0000
Received: from VI1PR04MB7071.eurprd04.prod.outlook.com
 ([fe80::c97:3a39:dcbb:117c]) by VI1PR04MB7071.eurprd04.prod.outlook.com
 ([fe80::c97:3a39:dcbb:117c%8]) with mapi id 15.20.3391.011; Thu, 17 Sep 2020
 04:05:54 +0000
From: Alice Guo <alice.guo@nxp.com>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Cc: peng.fan@nxp.com,
	Alice Guo <alice.guo@nxp.com>
Subject: [PATCH V4 1/5] include: add macros of different sizes
Date: Thu, 17 Sep 2020 12:05:50 +0800
Message-Id: <20200917040554.4599-1-alice.guo@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: SG2PR06CA0196.apcprd06.prod.outlook.com (2603:1096:4:1::28)
 To VI1PR04MB7071.eurprd04.prod.outlook.com (2603:10a6:800:128::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nxf55104-OptiPlex-7060.ap.freescale.net (119.31.174.71) by SG2PR06CA0196.apcprd06.prod.outlook.com (2603:1096:4:1::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend Transport; Thu, 17 Sep 2020 04:05:52 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0aebbeee-806b-4808-efe5-08d85abef8c0
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2398:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB23981EC8CF02EAA03435FAA7E23E0@VI1PR0401MB2398.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 73ShxBvkiM+zG6/rIQHThgJDnPNCWI3fG4WeUtL+n6AbSiA3orAkRWHVszpKtp9kpkX572MuH+LOOkwjSiejrpErLwRrEHMDw4FgpQwVtAPpRCu8samlGnOk4MkSmTQQIZVp8kKkkYDNjF14lk+4VDaWk0ZsyrfP83vApb5PhCrXxhz0oseDVSfj+suBV38QBYL+8lrOfnvlHrtsCUMOC2DGl+R/qXKHtYjci+JZ6wYtc7Lt5E9phYJVx1FE5nNR+OfL60wwAFxXV9hJP62H+2R11dVD/QrE1BJrps3JaxT1pZCpVskYymRn1v9Q0sUr8K6uzkA1IaoT3sm+86k2t72lpyaEDjeM8OEKv8BTBMXXZ5FNnVaG6/XLLWfHCeO+
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7071.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(346002)(396003)(39860400002)(136003)(8676002)(1076003)(6486002)(86362001)(66476007)(5660300002)(66946007)(6512007)(66556008)(6506007)(316002)(52116002)(2906002)(8936002)(36756003)(26005)(956004)(44832011)(2616005)(16526019)(4326008)(478600001)(186003)(2004002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: BIXz6uz+SZfmYErexeCdZRijct7IFaocajz8WWSyjKZEvgBLRieFmkSkhD1200fK41QS2AT7gpAf+ASjcBPqcfQf3n66dWt6AS3naK6+8yq1tay1akK/vFVjcDHRp8HENSfTrN+egZIOG0Pk6qg+ZhcaFJJURWjT38jmDVsPCe2kXe79Iag9vY6Lp1IVaIOJkrmtpZICt1aoAWH2loCoFOnOSZelN+mbQ++KMSaATcrqONRQ2ElXek7om/9K5gnM8RhCgij0XbHwrJcIpKuOmsXmEceMjINOwCN8l4vCCKqMVSLTxTQY/Ixh8FSco1KLHZSaaezGglwIE0IL/Y6IG2z61aYVhcmj5OQkTmWDib7zO4RIKleV2Mjw7awFe9VjMGTfJvrsgyiqed91IMm792K0tX+K7NxbGH1WMNW+46nDwbIAZuDh9daYF1989Ykjbk+D4t0sTboiTobr596SmPLYt7F0nHxPcYU6TWkZ+paC10mmOq+GJQdsM4OLESDXmp8HEA49mhyzXVQ9mGf0LD6rs9aS3Mjlg50SsbuwyEk8lTKDgRluFLnfklwcNESrOn+qadDf1+nCMjvfM4wfqzU19lUAgsAg9LD41m1ZiCbW2lGQSYtbpyKHN2iHABw+vka5lLYL4ONBlN8deREyzA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aebbeee-806b-4808-efe5-08d85abef8c0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7071.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2020 04:05:53.9333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G3VTybhABN/YYWgbzFK8uS53WjyczchOuQYmJMqETL2JqR9vTISXC2Dr/8MpTwj0cOjI0kWmnu54irf1KLifHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2398
X-Original-Sender: alice.guo@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=UPc1XBFk;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of alice.guo@nxp.com
 designates 40.107.5.45 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200917040554.4599-1-alice.guo%40nxp.com.
