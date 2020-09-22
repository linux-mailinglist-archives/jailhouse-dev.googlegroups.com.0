Return-Path: <jailhouse-dev+bncBDEN32754MOBBGF3U35QKGQEFAI2BXQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x140.google.com (mail-lf1-x140.google.com [IPv6:2a00:1450:4864:20::140])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AC8273B16
	for <lists+jailhouse-dev@lfdr.de>; Tue, 22 Sep 2020 08:45:45 +0200 (CEST)
Received: by mail-lf1-x140.google.com with SMTP id j17sf3332623lfm.9
        for <lists+jailhouse-dev@lfdr.de>; Mon, 21 Sep 2020 23:45:45 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1600757145; cv=pass;
        d=google.com; s=arc-20160816;
        b=I2huLI5X/N7pxaaU4zGw//TXjliRSmU9RNp+Wt8BBGciEXzK+tuhPl2JsYc5FmeoW7
         5pvkrunPGQLNvBWXBXe5tWyXA9+rFNqgQGTHZPO4H8cRYUOhmkNNvlx2Am8sDP/DuLSt
         Obzk1jGltSHPrtD6BExfDM7Y43j/gpzNPfjb1BRBo1GwwIoYQtB6Z85ozhmb/35iPs4E
         Rtrue6OtmmwaukilAOFGBsFYn25JF+NkOm6QQE/gngF7rMwI9mXZCD0DluUxbq3tsbkN
         /xXnFy+T6NQhLUxYBPhZodSx7qxd+v3cF8EdOhhiBSDKUUDznAiRV4usXIkxQ1gOS0Tu
         q2Qw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=VUrfydVEXe9mCxW3LyoCTlgxYgH0h6X3ctYK8SKLFnM=;
        b=g+sI/tUB3OFGqC+pO7m3rwSuXBfmQRIjk5nTjADcc+6hxR4ruCdFkwr5xrPj6EE2Gm
         4CbyxOuLOK/zYAUf/MZ0yJoC31B2mHfHaEjJ3faIL9aYBpx5uCxqSBaTvCyBGEPwxFll
         2nUDRLxIQMg8SZsmEY9Pstc4p5znH5jfVGX38qm3X+uPove3aP6wHP/SQAlTAezo7JxM
         LeDX0nn/X1jgPexcucjU7axpd3QSOHK/xMQWo3c5Tjly6jK8HGbLDtPyPqvZsjQSZud1
         L5G6cmR+H6Ylt8sLXNZutrvjJaalmz8mMd9t06akRmo3RHHwqQuKH74JAmU5ZrowLqet
         cULg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=ELAoe756;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.14.53 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=VUrfydVEXe9mCxW3LyoCTlgxYgH0h6X3ctYK8SKLFnM=;
        b=LtfZeCEqeNIdyW105BgUlWC9gcDQjeOlmliAsmay25fMY9dB/ZXe66/g4O+nFUHfhK
         Ya5Z6ZKReDiBb2nttRRT+l391OIIz+VRbtoEAMPeoMhXqSq8vak5eQGKkr4zFYxlEIDk
         unD/hFyGi9jBsYCEW/v9NtGD15pbny60jaWn/K4X1MDEg/+BzbaYTC8TjVwlnTW8BRmW
         l5rOm9gWv1wyUfavnINbZcD1BK/KqTpTnwpJPYj7BP8auHC5vRj1j8IwusH6M+N46pyE
         ZDx1Khku5a9vPE9Txub3nXQWqgRqeiq2USYIKgu5ehHqRvDPh7BctALMNqT7hcoNEQIM
         etZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=VUrfydVEXe9mCxW3LyoCTlgxYgH0h6X3ctYK8SKLFnM=;
        b=bg6qrXCU+apU/x5YtzNTgHJgBtk92dGrh8fVeK28eQ1v9OsUcCznQZBVFqEoneR+CK
         GHrRNfBpBB7kzy4eMgK+5JHAuUpCJsFhl3/NezgxlNlyHEQF3dinaHANhy1n+Yuwjf4w
         lid6w6njd7lmvbocydWJ7fCq6nN9N28JAEPUlIHGw9NEGdw7+2pGZjG8V7S53ZCRpGGt
         tzIZV0Jb8QouInsWZ7T3vJqMIXAi8hWk2pQefRG2q5jc6eMXEz1Lylg0A1wLM3lGnRVP
         eL374WMVBvfQIbPrIwGYe/574jd4yk9Ok++ViehuRSfRZT2D7s7LJL6+ehKfMu0GqPT2
         MveQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5314vXoHmhKtHXCELsTNPB8dL+R/5Uli1DWD+/Vft6V4W/P/H4/4
	sG3MSEFGf/t+o6+Kc1lp3+8=
X-Google-Smtp-Source: ABdhPJxjrxTkhSpppN/2YJ7KXvF5CjphgofK2chY/NS+7KIc5aJ5FD5dXHtCgYeKztsYFLELr6hp3A==
X-Received: by 2002:a19:c91:: with SMTP id 139mr1067690lfm.40.1600757145357;
        Mon, 21 Sep 2020 23:45:45 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:a556:: with SMTP id e22ls1997852ljn.9.gmail; Mon, 21 Sep
 2020 23:45:44 -0700 (PDT)
X-Received: by 2002:a05:651c:104c:: with SMTP id x12mr1070341ljm.285.1600757144096;
        Mon, 21 Sep 2020 23:45:44 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1600757144; cv=pass;
        d=google.com; s=arc-20160816;
        b=fPFbg3xBoeiauqNVecHjLg/HtxTXn0NoaTOHlnqM9ZM2T/L/xf8GeMWpAmLP+iWjYc
         Dc0a9QxwUKZpefjGcT8na9GhY90j2+eKb8jeg2pQOd/xOSL5/kRU4UMcUtEtokn+nW1W
         EjansjyDNtvj8h2XQx4fmGq5uzuuS/xMr8Xsu6rtunV+1fQxgokp0SqmHBbkSW9M6fC0
         vtXROnQe1IUDP2pnipbnsIX2ZdkIH2SDL2pnR5b6NvjDl/yhp4xjvyFhWVfI0ZL9cj8z
         uoho/yNQine0cLvfl4Nk8s6FF8ke1LOaK7GjAZGCqiENat7sWKXEUYR79M9vMBh3+YCH
         GvRA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=uvhg7VrGt8o5lz7FlP9x/t+Sq3vE790tEeinVndkDJg=;
        b=wcx+0mmeWkxNWKAvQd+D5yz3Q0O49bWj4d92YR7Mj3R02jJmd5HYerzUjn1Andta9d
         dYqflJavD6+HMsLB0Mya+zXpOoanhb0f5L8o4ylJCywa1wGkGMi8faZnMc+z59o/8+Sg
         tIN2C4pWiVdfnAsDzwQr7o3zUOAH1gur4C5E9Q8al5UMofpdh3zDdkqmHP03ASXzRYja
         TJMDRnorrER1kmzHib+Yg2RFhGB5cIb9AxaPyanJWmGYgoM1feIP+9Ul3PYJ1+SMLJAI
         aFasJ6aem3kE55YwAgJ/YvgmyoTgGdPXkuO6ZICPe4GpCXhiL3OIGLnESo7GPYZ7piTD
         80QA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=ELAoe756;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.14.53 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-eopbgr140053.outbound.protection.outlook.com. [40.107.14.53])
        by gmr-mx.google.com with ESMTPS id 11si321738lfl.4.2020.09.21.23.45.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Sep 2020 23:45:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of alice.guo@nxp.com designates 40.107.14.53 as permitted sender) client-ip=40.107.14.53;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ax+w+7oQ2dCbqbO2BZevpES9Wh2bKkN0B/KtqJl0kIQ5vWphOb0eRWi92z24RUqCne5xM+Lqnf1cpjZstNl48ihQsLLdnPI1xqbzGnzpwjGBRD8z7Yzq7Iw4/hcztlP75nGI9acBRYgv16OG6YQXl+KUnCBCY+8RMu7VV+czjAB3p4IvvDyMkxQa0FapQ6gwFjkiV8EIrRgiQ7ZRBCKNjB9ZYCv+fpowc2kL1svDka+wRIcwnxCDshkBAT1OLmPl4Z3HJOvURa7xPbtEdYkBHTG+ipwG5NPD4DH1jM5blrBzO0G9con6ZIk6ZxfBTlazA2OSxlQUzpx2XxIm5+9pvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uvhg7VrGt8o5lz7FlP9x/t+Sq3vE790tEeinVndkDJg=;
 b=cL8xdpXCZtwruk6yRGEclc72ZzQPHnavdE64l5/efCAYFYXBBcKEPhGt5RVWldwofwemgbCmJTIpuV6CQZGW4SGeHm6aTm0ufI0ZO3kGINZUlSmACmwpothDy3NCtViu4N0nE7B0fGLjUbpJOAMb+DGDAu8T/fPhVWZafslmrg5wUOGGn/SOEKpdftZ3oPVgkz0t3JZplhxS6UgCcQuD0qhszaH3QmaWFYAMILp2hewdar3dWXXLhKPjBpcgCrchdTR3EFA7TNgriwCDKgJYc6mmlWQ7kDi177qGqHxzE9sPV+YKADqD91M2nlshSYmqoeUQXxz7eDu7MhZtn6wSnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com (2603:10a6:10:127::9)
 by DB7PR04MB4268.eurprd04.prod.outlook.com (2603:10a6:5:24::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Tue, 22 Sep
 2020 06:45:42 +0000
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::ed87:8435:3012:9618]) by DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::ed87:8435:3012:9618%9]) with mapi id 15.20.3391.027; Tue, 22 Sep 2020
 06:45:42 +0000
From: Alice Guo <alice.guo@nxp.com>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Cc: peng.fan@nxp.com,
	Alice Guo <alice.guo@nxp.com>
Subject: [PATCH V5 1/5] include: add macros of different sizes
Date: Tue, 22 Sep 2020 14:45:38 +0800
Message-Id: <20200922064542.26274-1-alice.guo@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: SG2PR06CA0223.apcprd06.prod.outlook.com
 (2603:1096:4:68::31) To DB8PR04MB7065.eurprd04.prod.outlook.com
 (2603:10a6:10:127::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nxf55104-OptiPlex-7060.ap.freescale.net (119.31.174.71) by SG2PR06CA0223.apcprd06.prod.outlook.com (2603:1096:4:68::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.15 via Frontend Transport; Tue, 22 Sep 2020 06:45:40 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 895a5187-a520-490f-1a1e-08d85ec31ff7
X-MS-TrafficTypeDiagnostic: DB7PR04MB4268:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB4268603DA03BF22104CEEC10E23B0@DB7PR04MB4268.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8DLqvlFR4Reig0WBxn0g2sZWmMnUQ3k8j4d1zQpKHlGPsE9lP4dgMO04YSru3diM4ZijTLUchP5dKOOer1Ld9EidyStSFqQvZH7q00mbyn8EqBhOOKD6CWla13wHEW0/LGuBLf2mPJVbp5ev0Y37pohO74OinyEONhFw9G0eG913lsU0FfnVakOBYUKZnVMFdEkxuF+T6c0v998ySJEde0+jttApI130p4lcxgpmkG1x3mBa2bYrBaqPNlLh9m756a/eEnVN72VXlG+66Azyi1VX/vNjbPAFQwLcXHexAJlhll8hKtMdcxOPuEAZRFZtyCXOoeFQWukEqjQIuc3HNYvOadGJNtbJ3Ug3qGHTZ/d01lY/lBwW794qywC7Q6aR
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB7065.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(366004)(39860400002)(136003)(86362001)(2616005)(956004)(66946007)(1076003)(66556008)(66476007)(8676002)(8936002)(6512007)(4326008)(44832011)(26005)(5660300002)(6506007)(478600001)(52116002)(186003)(36756003)(6486002)(16526019)(2906002)(316002)(2004002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: E2/SyRcnErEEPL5wQFX/FWy/sBa47UqBA5OaRuvZzbnuFiWi364FzXzXmqG4PG2rCo5bTIMrr/izAeaKbhQHXQe1aNqtFw0UdUKOCv+OQ90XY7eldOptdek9zWXuOWDMenZFzvgGLOyYWFRnnT0lf+HnAQT+Eel9ZOzZZRimGYEk3WPyHMNFM/RXgZW1qMA62jWeXPqTejr5mnk+T8mB9/oXxdbPWgfyWVDPBpG1pwcCYGtB9beHPn8euQtNN28483slOFJEUT7JHjaM1gBum6GHyTAWgSB1JSwY8CAjrwjl002EcQuVoMhfsk4AYabdSoBv0JndeOIJEXIZmLIA+G57zzDQAzrebSHxL8T5ftxSgJb3C307jSMen41oYoBG3ulEHOUjIfBbvsDG5XnOj7D2uuWB7lmI7VkWkHBE2inpnWjnEOxFEoo7uGFLKV1um4BmzLbVgPc/s6AFRyL53Lnpkb5yFUCMVz0g9zM2pkOf55PINSHK8nlE5INufglaJNkSFkNVkm1/WvGiM2C5hlVVD6YrV3m4+ZeuxCk+IvNH1ryR5/RsqqgosN2KxTrsyejsKLcvQ/Sl/WSVb4oNLuUM9oNuX2zEr5zFgCXQsbJTQ7EG4cGxwCHB2W92VYvzaVVU9yIAJBhS7MZQMJYBfg==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 895a5187-a520-490f-1a1e-08d85ec31ff7
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7065.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2020 06:45:42.3395
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v8PvxWbRTpte+l2pt/YIB2R1mj7bxNSMTK5dlAfjTTRvAi3Af/8njxGnMgA5dnfleJX9mimyHRmNBl2A6XVk8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4268
X-Original-Sender: alice.guo@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=ELAoe756;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of alice.guo@nxp.com
 designates 40.107.14.53 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200922064542.26274-1-alice.guo%40nxp.com.
