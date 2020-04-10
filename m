Return-Path: <jailhouse-dev+bncBDEN32754MOBBRVUXP2AKGQELYIRGGY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE8E1A30C0
	for <lists+jailhouse-dev@lfdr.de>; Thu,  9 Apr 2020 10:18:15 +0200 (CEST)
Received: by mail-wr1-x43a.google.com with SMTP id d4sf5975495wrq.10
        for <lists+jailhouse-dev@lfdr.de>; Thu, 09 Apr 2020 01:18:15 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1586420295; cv=pass;
        d=google.com; s=arc-20160816;
        b=Qr7OHEAzuWpuCzWdPUYDQO+MBGmZ8jdTfOYwPawge+Njpd78ROOI5/o0hR0xiWa2rK
         DnuEwTn8fDVmjwF7Vb3VF47FIJnUi5IoNkoOezM5ZJbdUt6KruKLfL7vQEzteUJPPCH6
         CfTVSl6s0TJCBTAoRuWUakvbnJQR4WadGjARVBbRYy2COvGJR9aV8M2hqSAdnBvqrwdU
         XBnTUtTgEpF7GWqhm/ow0FRSoc99eGT2joqfSyZ66jwCooCa88Rns+LsWpCK0lb0Sgje
         UvUtWAzv7FomSzZ5AERFajiyylvEGtj5APlH5lQdgRhnDEi14hS9UjkZEfvtZmELwhbg
         Avbw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=FrLwhWGTgxgB7daZ2zLcllzK8md/XNS9D7tGeV5BUQ4=;
        b=p4GVBKcJ3bZHt8B89ZZ0LVcX/I2RZxaPI9t7ogTdDxfMMgC8eYicc7nzFV0mskST1v
         zHIxCpDkcRc/3vj8uLBvlwY5/N/hw1xVqnYf8BPdw03oL7PjoJ1aEWfHewGRUDYclWuB
         23u8cicWw0beqOsmmhMJIOMr89subAjn1kWQmi1qY2SL7/SZKdRHwvHFy7tJaAldvXU3
         Qy1lXqeoHwo85+7wEZcyX+neKuARL3yS7SIv4VLJreSk7rLxwncxsTFcD1Ec7Yb4sDMo
         tJNwEYnR5Go9TfhwTyRQO2yBnVW0AjfwLKPdPwf8kSMFc9XxHoAvHV1gWmYus2pYAzBt
         Enpw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=PR5XKHGk;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.20.62 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=FrLwhWGTgxgB7daZ2zLcllzK8md/XNS9D7tGeV5BUQ4=;
        b=EdPj5jBLfH/zaRlXJV30z4GycN0LoDvntdmizaErBjoDONkbH7QaDeXi+LeHtMB4rc
         JD1oh5aesnYRQ+fSyf7k48Ym4nFWuGDN5ogYjJ8JLD5Pjta9w8+CKJEkN9PwSwbhsDdr
         UPmxYdqbNRodfZvHyj23QUdU7FFVlc/iINdofJ/lkoOtk7aeAbwdJwP/YTwMayar1g64
         5vHJUEVegIbKuPTzMk3hZKsIiRXZLMXE0fKDJ2wOYdfjEaeHXchP033q+RY2D5UzEgU7
         mFOJ7fAZwkcG8e8aQmo2/iz1bcYlnpV+8t+uJjGKvcmgTMurWvta6+UuTEaFcFklIBUi
         3G+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=FrLwhWGTgxgB7daZ2zLcllzK8md/XNS9D7tGeV5BUQ4=;
        b=dBaeg3UcMHeNMQ/SNX0EzpupmBfSU/+TfG8myzCqWBq8OgI9apg3k6V5T/xIB8eRCA
         2zkwIkjhjN73koXccrIYERZTnODRE+RMc/gTPRrtxPcz0lZLMt1qzy1bEO3sx1CLHrej
         Mx87E1oo+AWXFVC9Q5kU6tvsDOKmt5V5wIEz0yZlfuDu1jmZIJFaUXAA2TzBp342JmAQ
         cUW1KAvRw89xv6Xq0pFfZn85vtFZBiKOV1KWz1sHo5iS8FI5moMWURNer6xwEl+bsgqA
         orgAd7gH3WmJhu0MY4zGuQdjyFodymugK8qOdxP2CoSCdgHU60BuVu9EazcDQu6Ev423
         r+Eg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PuYm2B3mkpVTkhc8OSM8BY6t1OUz+4hhagGCYkjsVszW8bjFWCPz
	nP59OwtyBCv91Ubg8sgPrxs=
X-Google-Smtp-Source: APiQypLDxIjIy3mYN7Cp5IwfRhf3gB3JpNxTA3L2fvFQx4kAVIEf0jkhr0a/uBBVqfTnuIosdzWL2w==
X-Received: by 2002:a1c:2007:: with SMTP id g7mr8750278wmg.70.1586420294871;
        Thu, 09 Apr 2020 01:18:14 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:f2cf:: with SMTP id d15ls7208980wrp.8.gmail; Thu, 09 Apr
 2020 01:18:14 -0700 (PDT)
X-Received: by 2002:adf:db41:: with SMTP id f1mr13743524wrj.247.1586420294163;
        Thu, 09 Apr 2020 01:18:14 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1586420294; cv=pass;
        d=google.com; s=arc-20160816;
        b=LdiB2gduQtjtGL5R9hh5JJY9+I259FsebIDQSRHyoLIeasGNqUFI9gn8X7Pf75SEdb
         zi3h6dt4a2+kLsv2OP/vYYdtt2IAtJMGMyj2cAAteCDfXBZZKCXOdCXNx+fYqZN1oX6C
         U1VeHHsJRy+k8K2KUgr2M5GNNIbvhxs11VJH5WDBMMWNRuPRnvEEB648jFrO6rpLAjgr
         5lg6Ohizabq44xogAqcyAbXNq4uqdaZd3hFeNMqo/Q9F4Sb1fDOkV86P4CZG/gwYjT6F
         hN61WefWdRz3n81mF4IhdLImRDZxZru9XlrkASmnps19pPKiaGiRf/oj0w0/putS8HQM
         tX8Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=1RUKqC7mEYGNce02/wAdRAT1MD3MyyxuDH5zS2iZG3s=;
        b=RxSjWX4OdgVyV7xMA4AmKfXQNFeRBbYr/laHyBJRA7K8BrnIsJ9V2Ec1JsozIC9pVZ
         4GqNRstB5z3aD7NOzgOucUs3cw/D92CSUUwix6FyqN94o2Pn8atwUmz/uYuafdt1pmV8
         DFgBPp3nPCX+1tc/M6UwCNf2+Rd3cO1jeUmniNyjmQkjUzq7qVU5PD4v9pF8mvighvqy
         65BNT+Neu/5uZ53oPi0GxlZMJUESsn2Hz7sa5BiUP60VSOkrZt2f6PwmwmR7b6zbMD0D
         ROH3kdpXG5AsQmVbjfJJpoIDKpDZFr5MW3hsH4qCY6FCeDP+cwJNjCKosxn+RnIoxJDU
         iRlg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=PR5XKHGk;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.20.62 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2062.outbound.protection.outlook.com. [40.107.20.62])
        by gmr-mx.google.com with ESMTPS id q2si436993wrc.2.2020.04.09.01.18.13
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Apr 2020 01:18:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of alice.guo@nxp.com designates 40.107.20.62 as permitted sender) client-ip=40.107.20.62;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jcC2KtrAdsBCRuuzoCsLQK9ILQA5OS7zxaZfaN2kbnYeG7Qemh/1zeJKi+BDHRPpp/yTMs2eylyA/7Rf6DLH57nXgv12o6B5zRkxOp2G7QSwuCGq/UBejnT12gIvnrFlEyI/JWwv4P90sktn6dSMBY5kdUp2Viipm9VZravTg3SegZxAOq/J1SNms6n282owQ4bIUiE4u1kgrIudBw+ZHd5bi5DikWH6K1Y7zq44VBG5aGDkaZs6nyGy1AkX2+vNLDb3g2X9ZjlyOpLvysJtNLY0O1f+0c7xIgFJvS3Vd9AfGkM7tpmAMe5pMdlCdjz4wzQ42zxOUabS90ScWOkRbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1RUKqC7mEYGNce02/wAdRAT1MD3MyyxuDH5zS2iZG3s=;
 b=d54IAZNb1fwkvYf5BiODjloE56yLmyNW+dPBE3G16nphEt6ZPBuf/IL6RXItRkWvjkQaN2tVPnu0gb08ieJ/Didy16QQfnoYt//0ZYFSf+QHUYVGA/UlE3EhiMnAFw5NQQd7H3hQ1Dtph2l7pKjCxz4kVb2ohyZD/XmhCRi1zlwSe4OKem4bs4gV4hr91C2yLzLXu2B6BiR55h3znwgfCO3BiDSanPrm/tZjxhmOb6n8J9Gwy9b+R1PDNYVCD42wwCpiBN7YDc6Rxy0N867l4gsT7ZFqgZtvMFhS+d1I1PnsLRCa2wkebkniJGQ8mQlC2dB8QBgfTGofM84BeZnd7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com (2603:10a6:10:127::9)
 by DB8PR04MB6473.eurprd04.prod.outlook.com (2603:10a6:10:106::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.20; Thu, 9 Apr
 2020 08:18:12 +0000
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::55c:405c:271a:4c56]) by DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::55c:405c:271a:4c56%7]) with mapi id 15.20.2878.018; Thu, 9 Apr 2020
 08:18:12 +0000
From: Alice Guo <alice.guo@nxp.com>
To: jailhouse-dev@googlegroups.com
Cc: peng.fan@nxp.com,
	Alice Guo <alice.guo@nxp.com>
Subject: [PATCH V1] Cell configs for imx8mp EVK board.
Date: Fri, 10 Apr 2020 23:18:04 +0800
Message-Id: <20200410151804.28069-1-alice.guo@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: SG2PR03CA0111.apcprd03.prod.outlook.com
 (2603:1096:4:91::15) To DB8PR04MB7065.eurprd04.prod.outlook.com
 (2603:10a6:10:127::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nxf55104-OptiPlex-7060.ap.freescale.net (119.31.174.71) by SG2PR03CA0111.apcprd03.prod.outlook.com (2603:1096:4:91::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.12 via Frontend Transport; Thu, 9 Apr 2020 08:18:10 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 883190ca-5e0e-4ccd-59d1-08d7dc5e8b70
X-MS-TrafficTypeDiagnostic: DB8PR04MB6473:|DB8PR04MB6473:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB8PR04MB64734B3D4457E57D48D4952AE2C10@DB8PR04MB6473.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 0368E78B5B
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB7065.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(136003)(366004)(39860400002)(346002)(396003)(376002)(44832011)(478600001)(86362001)(8936002)(6512007)(66946007)(66476007)(6666004)(6486002)(81156014)(6916009)(36756003)(66556008)(2616005)(2906002)(8676002)(4326008)(26005)(16526019)(956004)(81166007)(6506007)(316002)(5660300002)(186003)(1076003)(30864003)(52116002)(32563001);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OUii6FO6WHs5K2aVdmhCGJUEiDCP4LWWGdWd2saqvbHcAV9bAL/6v1HjZg1m+uEjDuewAfFVc4Xv3CTqs1Fa7ZHlVrisQYujvrsL+JBDiUn3MekMD2NY5Tg3YugXh6wjO2HAztHeCORcZfKChMfIauL5MBNaQyikZp/Ugm5ycWDY3dRwhqETLstziA4+ZHmCnnX2/1zKao6BVsseGYgWoymIzQBlPmmIo8naFK1qlclhHUe5GrrknMMlx3Fwj9c7dKnJ4zTQjDwmHCoy0xLjJzb88Tm/5OmXAkY/6KdBmXQqhlE0dHUh84hF9RHr5gZ04db6Fl8Rodyq3keS8ySuVwGSfZgAEE56y0r+xD9Oh8CvL8Et2r913+EvtB4HPkoWFO6677YLWGLejsotmvEeGB3Fw3VbaIhlLqwPT9If+AFg90iBl3TkHbQpUJQhL/jkbyPyHCuh78aH6cdQC7sryaytpUiDquWGwejg3ta3g44se+EFlEst+ZFmnQcTsaoJ
X-MS-Exchange-AntiSpam-MessageData: 3HwogLHorPbCiul4n5nBIEgGcCztDRleE7x61914iT7f6k4OfH/QC4T7EX3VzZoq6JQI8HbPriGyAHL4qZSBplys/Ny4HD3tWAGvLoEoPsJzz3tePn0LLuDRIgvqXZnNxenlCFO40g/UcrYP267XHQ==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 883190ca-5e0e-4ccd-59d1-08d7dc5e8b70
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2020 08:18:12.3793
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wALShAi4clACJl5xPnXpa2EzyQ/mtmnpXxcVpFEfJ2ayDW/7c0Sz2n3ybhcScfu0bSPI4K2c3ouKPASsezJsRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6473
X-Original-Sender: alice.guo@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=PR5XKHGk;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of alice.guo@nxp.com
 designates 40.107.20.62 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
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

Signed-off-by: Alice Guo <alice.guo@nxp.com>
---
 configs/arm64/imx8mp-inmate-demo.c | 126 +++++++++++++++++++
 configs/arm64/imx8mp-linux-demo.c  | 167 +++++++++++++++++++++++++
 configs/arm64/imx8mp.c             | 191 +++++++++++++++++++++++++++++
 3 files changed, 484 insertions(+)
 create mode 100644 configs/arm64/imx8mp-inmate-demo.c
 create mode 100644 configs/arm64/imx8mp-linux-demo.c
 create mode 100644 configs/arm64/imx8mp.c

diff --git a/configs/arm64/imx8mp-inmate-demo.c b/configs/arm64/imx8mp-inmate-demo.c
new file mode 100644
index 00000000..795c616f
--- /dev/null
+++ b/configs/arm64/imx8mp-inmate-demo.c
@@ -0,0 +1,126 @@
+/*
+ * iMX8MM target - inmate-demo
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
+		.name = "inmate-demo",
+		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
+
+		.cpu_set_size = sizeof(config.cpus),
+		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+		.num_irqchips = ARRAY_SIZE(config.irqchips),
+		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+		/* IVSHMEM_IRQ - 32 */
+		.vpci_irq_base = 76, /* Not include 32 base */
+
+		.console = {
+			.address = 0x30890000,
+			.type = JAILHOUSE_CON_TYPE_IMX,
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
+		/* IVSHMEM shared memory regions (demo) */
+		{
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
+		/* UART2 */ {
+			.phys_start = 0x30890000,
+			.virt_start = 0x30890000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* RAM: start from the bottom of inmate memory */ {
+			.phys_start = 0xc0000000,
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
+			.address = 0x38800000,
+			.pin_base = 96,
+			.pin_bitmap = {
+				0x1 << (76 + 32 - 96) /* SPI 76 */
+			},
+		},
+	},
+
+	.pci_devices = {
+		{
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 1,
+			.bdf = 0 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 0,
+			.shmem_dev_id = 1,
+			.shmem_peers = 1,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
+		},
+	},
+};
diff --git a/configs/arm64/imx8mp-linux-demo.c b/configs/arm64/imx8mp-linux-demo.c
new file mode 100644
index 00000000..ff0cdffb
--- /dev/null
+++ b/configs/arm64/imx8mp-linux-demo.c
@@ -0,0 +1,167 @@
+/*
+ * iMX8MM target - linux-demo
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
+/*
+ * Boot 2nd Linux cmdline:
+ * export PATH=$PATH:/usr/share/jailhouse/tools/
+ * jailhouse cell linux imx8mp-linux-demo.cell Image -d imx8mp-evk-inmate.dtb -c "clk_ignore_unused console=ttymxc3,115200 earlycon=ec_imx6q,0x30890000,115200  root=/dev/mmcblk2p2 rootwait rw"
+ */
+#include <jailhouse/types.h>
+#include <jailhouse/cell-config.h>
+
+struct {
+	struct jailhouse_cell_desc cell;
+	__u64 cpus[1];
+	struct jailhouse_memory mem_regions[15];
+	struct jailhouse_irqchip irqchips[2];
+	struct jailhouse_pci_device pci_devices[2];
+} __attribute__((packed)) config = {
+	.cell = {
+		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.name = "linux-inmate-demo",
+		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
+
+		.cpu_set_size = sizeof(config.cpus),
+		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+		.num_irqchips = ARRAY_SIZE(config.irqchips),
+		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+		.vpci_irq_base = 154, /* Not include 32 base */
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
+		/* UART2 earlycon */ {
+			.phys_start = 0x30890000,
+			.virt_start = 0x30890000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* UART4 */ {
+			.phys_start = 0x30a60000,
+			.virt_start = 0x30a60000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* SHDC3 */ {
+			.phys_start = 0x30b60000,
+			.virt_start = 0x30b60000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* RAM: Top at 4GB Space */ {
+			.phys_start = 0xfdb00000,
+			.virt_start = 0,
+			.size = 0x10000, /* 64KB */
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
+		},
+		/* RAM */ {
+			/*
+			 * We could not use 0x80000000 which conflicts with
+			 * COMM_REGION_BASE
+			 */
+			.phys_start = 0xc0000000,
+			.virt_start = 0xc0000000,
+			.size = 0x3d700000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
+				JAILHOUSE_MEM_LOADABLE,
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
+		/* uart2/sdhc1 */ {
+			.address = 0x38800000,
+			.pin_base = 32,
+			.pin_bitmap = {
+				(1 << (24 + 32 - 32)) | (1 << (29 + 32 - 32))
+			},
+		},
+		/* IVSHMEM */ {
+			.address = 0x38800000,
+			.pin_base = 160,
+			.pin_bitmap = {
+				0xf << (154 + 32 - 160) /* SPI 154-157 */
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
+};
diff --git a/configs/arm64/imx8mp.c b/configs/arm64/imx8mp.c
new file mode 100644
index 00000000..b870a788
--- /dev/null
+++ b/configs/arm64/imx8mp.c
@@ -0,0 +1,191 @@
+/*
+ * i.MX8MM Target
+ *
+ * Copyright 2020 NXP
+ *
+ * Authors:
+ *  Peng Fan <peng.fan@nxp.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ *
+ * Reservation via device tree: reg = <0x0 0xffaf0000 0x0 0x510000>
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
+			.address = 0x30890000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_CON_TYPE_IMX |
+				 JAILHOUSE_CON_ACCESS_MMIO |
+				 JAILHOUSE_CON_REGDIST_4,
+			.type = JAILHOUSE_CON_TYPE_IMX,
+		},
+		.platform_info = {
+			.pci_mmconfig_base = 0xfd700000,
+			.pci_mmconfig_end_bus = 0,
+			.pci_is_virtual = 1,
+			.pci_domain = 0,
+
+			.arm = {
+				.gic_version = 3,
+				.gicd_base = 0x38800000,
+				.gicr_base = 0x38880000,
+				.maintenance_irq = 25,
+			},
+		},
+		.root_cell = {
+			.name = "imx8mp",
+
+			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+			.cpu_set_size = sizeof(config.cpus),
+			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+			.num_irqchips = ARRAY_SIZE(config.irqchips),
+			/* gpt5/4/3/2 not used by root cell */
+			.vpci_irq_base = 51, /* Not include 32 base */
+		},
+	},
+
+	.cpus = {
+		0xf,
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
+		/* IO */ {
+			.phys_start = 0x00000000,
+			.virt_start = 0x00000000,
+			.size =	      0x40000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* RAM 00*/ {
+			.phys_start = 0x40000000,
+			.virt_start = 0x40000000,
+			.size = 0x80000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+		/* Inmate memory */{
+			.phys_start = 0xc0000000,
+			.virt_start = 0xc0000000,
+			.size = 0x3d700000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+		/* Loader */{
+			.phys_start = 0xfdb00000,
+			.virt_start = 0xfdb00000,
+			.size = 0x100000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+		/* OP-TEE reserved memory?? */{
+			.phys_start = 0xfe000000,
+			.virt_start = 0xfe000000,
+			.size = 0x2000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		/* RAM04 */{
+			.phys_start = 0x100000000,
+			.virt_start = 0x100000000,
+			.size = 0xC0000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+	},
+
+	.irqchips = {
+		/* GIC */ {
+			.address = 0x38800000,
+			.pin_base = 32,
+			.pin_bitmap = {
+				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
+			},
+		},
+		/* GIC */ {
+			.address = 0x38800000,
+			.pin_base = 160,
+			.pin_bitmap = {
+				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
+			},
+		},
+		/* GIC */ {
+			.address = 0x38800000,
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
+};
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200410151804.28069-1-alice.guo%40nxp.com.
