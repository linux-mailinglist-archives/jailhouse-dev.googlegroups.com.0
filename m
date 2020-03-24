Return-Path: <jailhouse-dev+bncBDEN32754MOBBX4J4LZQKGQEPK3CY2Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33c.google.com (mail-wm1-x33c.google.com [IPv6:2a00:1450:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3F318F212
	for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Mar 2020 10:44:00 +0100 (CET)
Received: by mail-wm1-x33c.google.com with SMTP id n188sf3327080wmf.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Mar 2020 02:44:00 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1584956640; cv=pass;
        d=google.com; s=arc-20160816;
        b=XELSKF2SDmM3xSxXQ1EL1XHxUB/VuMDAdnm6bGl03e2ZEr6Bu/uUFeBc0eBop/fBMf
         CwSyoaUr4vAw+QKDommYLWV1yjqJNv2gsVs5NbxmDnnJymPhEw2PCkqsUY9o3PGcceg/
         RLcGM1+t+DDOT0azljEK1n92D81GEtWsaBv2gyy3gNiqzxHF2httpWcpI3VoIY0sshtM
         oajcqyrZLBiDOpsowry9g205Cg5eNrtODrC9RrZTd10egPmzfHQbcSpGor6ETuGi4lI5
         jR2N23YSZX0Qfl8FmHYIQoMuS7B5AqsP7O7KDp6jduwarrLPYOAhL4OYOP6A5LbTdHsL
         oMmQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=3p32nC1ivVOMXSrLNH0ZRZ4+lR9fGyYntAc1jHrYziI=;
        b=lLUWWZNgvS2oRYqoLLS6UThK/rxQHqDwO94xxYM3SYxZ6ZnGpOY7eMyOyTJrlper6N
         G6lCQ8GKKZmJvJ6+QiRu20ARwCp3hY77xGQaGfWwjCPPEVCiYbB2yRLGdhT7KeFnX0CJ
         y0X9wetNccLLNCoOzjenGqM7gavd4TD/DgFvlxJT2Ri6V1aoz0/PU2reDRbAaPn4ldLk
         4fFUKkPaXXIDO+OHxQREwbZqvUgF9SQAnvi5lxbwvnHVfQJvhPo8bmzhHKqZM1Wnwff8
         Df3AaI2cFnyciVALXBdW62PUE1mb2ft24//gVclKJ50lEuFxORruIPJwh/kKUsXT4zOS
         MCsA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=oFKsYQXr;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.7.70 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=3p32nC1ivVOMXSrLNH0ZRZ4+lR9fGyYntAc1jHrYziI=;
        b=UHffmvVaoHIdn0IhsIJeZGYyhpTe60veLk1/c2mr6U1hAQZ9S0MwX8E8hL9ZdAobgU
         oSz/nEgX1tSbogK/hUZitZJysVdvchXHhxA0nvG3k3f4h+BwAy+fRGx3QL3Zx1CO/i3c
         fCeQ8bp408v48ZILmwYOEeeaBeTbsS8HxB48y78qe7eJynsSKuNw9cVcjOeIZDezNm6g
         Vqxhavr4xj3YYpzRfvWbGrExgGR0EGkrZk4veWlvK36bLmpDzJBXLlC3zpGTirlC0dLM
         qM7cxAhZTj5rvsaJh9b3R4TJ28RFqADn7ENn9CZRHCZOvPvnq8ZEkNAXwQxJvyscbj78
         +eew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=3p32nC1ivVOMXSrLNH0ZRZ4+lR9fGyYntAc1jHrYziI=;
        b=NiDIi0P7sE38ump4jp4jjLUN0uDUUqMvLgNmmD+IOa3xvE833qkDAcGwJ4OS05qdUf
         fVavNocZAJM9FE8B2XXWXhQV8TycKKpFtiyd9JQYY8MLMkqTLVAvtkWPzq/glDDGZZwr
         2XqYpgElJJOl2pXLrG9ipGX/9p06XHSm2LNMBP/cRnpLS8Rx+0QG7oaaIXIupGDqNYvz
         bC0MwnURxSrR5wXxS6uNWca1mPpzB4V/LDfFU6t/BudCj8PEGyV9waypIo5NfyWLa7Ql
         JKHkg+RI+bWT6g3YZ+mYVDLvQsr3pH1tXXnxy9JKD5wjwirHMQ6x3H31Vp6rny1st03s
         qSDA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ0SW1W+Z0y/C9E7E6m4/ockLuFGXIF2zlcMZOI41m0trW125dQK
	t2dSkMXdulM36x7QIYbTmkk=
X-Google-Smtp-Source: ADFU+vtQWsc6VCVQ9ul+glV3LIx4emqbvKBkzSRpajE9L4ZS05dB7dKpYowUexgl7g7kYMTtVpiBjQ==
X-Received: by 2002:a5d:6104:: with SMTP id v4mr19908687wrt.213.1584956640019;
        Mon, 23 Mar 2020 02:44:00 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:fd03:: with SMTP id e3ls1895605wrr.0.gmail; Mon, 23 Mar
 2020 02:43:59 -0700 (PDT)
X-Received: by 2002:a05:6000:128a:: with SMTP id f10mr28173436wrx.242.1584956639376;
        Mon, 23 Mar 2020 02:43:59 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1584956639; cv=pass;
        d=google.com; s=arc-20160816;
        b=hdelZgTZp8UYAri43dyEtv57Xi25jQA0MeTgpaOPogi+lZcAPpdVrkmQCfljpVSHa4
         3b31F92hikEwu4OXbnZmih22AL4IBjHkIIOzaz4WyQvZYEo+NzxXDp6BlPrfA+ltbpOP
         GHui8Q2wXQkxJVCTb+vOEk+AQMsDpmuG0RfkZ14vfkRi/iP2h0xl1B3LdNSpMTLN+eB4
         0AJls7KfxSiUOU5Aoaf8//nbPLXhE+N4nCNr/retiPzW6DrffX01VAGmvbjvUUbNGQ92
         chi13S9lvo6OalwhPPaCTWaX8N7A2NNcHFd/4vDCn6UBeEt1C8S7AeSFKIWdLE7Ys/UF
         Y2Tg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=VbtRfBkRRuefTue2sEc+qWozukFx+9X4Y5YOv1MCFqE=;
        b=Eg7wUhNgkG8nz0o7mgU+W6Fn4UcEax8pnCPyl3UeMgH1GwVR9wglibiiCO2RrY4kXp
         yQP/b53F/YIoV5VkwKbYU8exw3gwhnLCGzEzrpOPZjlRhwYBTVU0bk5nYmMPijElWPiF
         /iErsIvwLAWDj5hWckxYrxymdZWY4bDWc0v/KRSnhvpxYj9YFLlxPJErgXOA97OOnGEY
         9h1P8tq+mXy5+Iac1/Pmu2CRydBW78yxBOzOZQ0guFr7ikitrt2s3X9HpM6mzbuGim9v
         pVo19YVOHYJP2ZR+gCLEPrUm2DwyisxDiPM7Cuqa86kbA1LZ4lQfTe8J8lge3DvUMzX0
         7cCg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=oFKsYQXr;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.7.70 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70070.outbound.protection.outlook.com. [40.107.7.70])
        by gmr-mx.google.com with ESMTPS id v12si742454wrp.5.2020.03.23.02.43.59
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Mar 2020 02:43:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of alice.guo@nxp.com designates 40.107.7.70 as permitted sender) client-ip=40.107.7.70;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BlT4fF54M6YL+SaPEWqaWPt0bstEhscoZwRGhEu/DgOpPkA6iHWij7a0LcStuNilnqrCdL69kOzAkS6oiZT00CaeP+aJdgOjLWklk67s1yeJ74XnIS4wFhtBw+9UzvZxKb1bQOHTLrmkTekEeAJ4qmo0WdgulvYpgAOkdYmp1fu1poieCHJRXyDcaLFn8legM1+CTArOOI5bW3xhJnHI8NUeQS791mU+DWlYRsvQvdXTPitwF0vxCGvKssznCMon+jyZexHqVyQChrtjTMXY8oYgXdy+7f/XO48TJJp8pk/jXigXVS0merCtf/LUIvZP5K3mY1dnecKNa+lRlqmXhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VbtRfBkRRuefTue2sEc+qWozukFx+9X4Y5YOv1MCFqE=;
 b=OB1jd0cfHlXj2E78FTM9aOW7S+091ujSfsblNzK6sggvZb+n2ca/73/21TOuCSWSg+f+DlSh1xE7DNdG0prd2sGQW54vTJFFXPkEl0QKG8DDCukXQFXTkUQapEkTSWbRWIQBrAZnVSpjQKYpIakC+3HKmafCiNidwrCCaYws++5JLVjEXXnnd5rF4NRTtDETqxR1wPrGyJlQd8z/YOlvr7QQenxvoM2htb55zxIkzgLVULVy1Ai3tJkhcTc/Mp+3gAhkV2DvuHIBMe6SPtn0yyHK7OzuzMEgBVEmBSJwuK94FWIXs3aAY0xcBNNreWeuGFXzZ6mmuIOvVZiaNc0XMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com (52.135.61.137) by
 DB8PR04MB6363.eurprd04.prod.outlook.com (10.255.170.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.20; Mon, 23 Mar 2020 09:43:58 +0000
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::55c:405c:271a:4c56]) by DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::55c:405c:271a:4c56%7]) with mapi id 15.20.2835.021; Mon, 23 Mar 2020
 09:43:58 +0000
From: Alice Guo <alice.guo@nxp.com>
To: jailhouse-dev@googlegroups.com
Cc: peng.fan@nxp.com,
	Alice Guo <alice.guo@nxp.com>
Subject: [PATCH 2/2] Cell configs for imx8mm EVK board.
Date: Wed, 25 Mar 2020 00:43:43 +0800
Message-Id: <20200324164343.13403-2-alice.guo@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200324164343.13403-1-alice.guo@nxp.com>
References: <20200324164343.13403-1-alice.guo@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: SG2PR03CA0109.apcprd03.prod.outlook.com
 (2603:1096:4:91::13) To DB8PR04MB7065.eurprd04.prod.outlook.com
 (2603:10a6:10:127::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nxf55104-OptiPlex-7060.ap.freescale.net (119.31.174.71) by SG2PR03CA0109.apcprd03.prod.outlook.com (2603:1096:4:91::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.8 via Frontend Transport; Mon, 23 Mar 2020 09:43:56 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5ec3fdbe-7b88-41a5-1631-08d7cf0eb597
X-MS-TrafficTypeDiagnostic: DB8PR04MB6363:|DB8PR04MB6363:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB8PR04MB636384BD86C12572B7EA0FB9E2F00@DB8PR04MB6363.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 0351D213B3
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(346002)(376002)(136003)(39860400002)(396003)(199004)(52116002)(16526019)(36756003)(6512007)(30864003)(6916009)(1076003)(4326008)(26005)(6506007)(86362001)(956004)(6486002)(66556008)(66476007)(44832011)(2616005)(478600001)(186003)(316002)(6666004)(8936002)(81166006)(5660300002)(66946007)(81156014)(2906002)(8676002)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:DB8PR04MB6363;H:DB8PR04MB7065.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
Received-SPF: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Qu3BNqDLJsoZ24/E20KZFkzqWmAWiv1KDkdlsVUgpRVhs5Wh7+ERJd9GrNCHw9ilWzlzTxLgfVoC+H80o7jdeKn1d5RxRrxxV278v3GG24I3qpbITQHGmF5amo5HIVRJO0NroAsmUyk1hhGzFBfsPQPGiJSsnL+C7/jAD3cq3KAY5DBh+lVvsUijhXF1OSMqLjH9DiFsvXbDXwL3pV7EIk6hmjQ/k9LeUYQYxiayROfVkL5DDwzy0rl901KlIx7F/jayUkLgzZRS/TfwC+pWhYyMoMfC5DeHJ5JF0a3Q0J1UifjNYB6FsNOciNhfRlzuexCZDKwbTRiwUrovtqH+LNpERY/mMwoCHOrJnaiZ5UJTBhj4P3yjl0df9xmuLMFP0gXLdNAclvDPGraVmF8Q5FxbUxS9BY4qNJ1K01wokLmmbnkWTdHVdhV3pp7tfbhqfWBCWGH9H+hX+jbtuOn0Na8fwMY58vVyg6YnffYrKfQUFs0r+DXMzAVyyT40GT1S
X-MS-Exchange-AntiSpam-MessageData: H2EaGdvnHj84URF9uQQxwnDNsXZyoa6gEQeb+DFzasl+eiSEcitIAaModXgLUcrtawgmCvP8Izt9ncb7GCAIiVoWFMUWjdCBqBIz5iBM3oTS+hwun2HanyFFykUiRBMoHcQzzERfxHD0t6KrayOSVA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ec3fdbe-7b88-41a5-1631-08d7cf0eb597
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2020 09:43:58.2260
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kqDnRYh+jPhQgWuG9BOFkRCbkGSaTociyovhWVA/xc47TSt3umLrsOiIuxq/xHRunjTeHmplBMbTxvKHMg/55w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6363
X-Original-Sender: alice.guo@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=oFKsYQXr;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of alice.guo@nxp.com
 designates 40.107.7.70 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
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
 configs/arm64/imx8mm-inmate-demo.c  |  66 +++++++++
 configs/arm64/imx8mm-ivshmem-demo.c | 126 +++++++++++++++++
 configs/arm64/imx8mm-linux-demo.c   | 165 ++++++++++++++++++++++
 configs/arm64/imx8mm.c              | 203 ++++++++++++++++++++++++++++
 4 files changed, 560 insertions(+)
 create mode 100644 configs/arm64/imx8mm-inmate-demo.c
 create mode 100644 configs/arm64/imx8mm-ivshmem-demo.c
 create mode 100644 configs/arm64/imx8mm-linux-demo.c
 create mode 100644 configs/arm64/imx8mm.c

diff --git a/configs/arm64/imx8mm-inmate-demo.c b/configs/arm64/imx8mm-inmate-demo.c
new file mode 100644
index 00000000..6e672901
--- /dev/null
+++ b/configs/arm64/imx8mm-inmate-demo.c
@@ -0,0 +1,66 @@
+/*
+ * iMX8MM target - gic-demo
+ *
+ * Copyright 2018-2019 NXP
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
+	struct jailhouse_memory mem_regions[3];
+} __attribute__((packed)) config = {
+	.cell = {
+		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.name = "inmate-demo",
+		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
+
+		.cpu_set_size = sizeof(config.cpus),
+		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+		.num_irqchips = 0,
+		.num_pci_devices = 0,
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
+		/* UART2 */ {
+			.phys_start = 0x30890000,
+			.virt_start = 0x30890000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* RAM: start from the bottom of inmate memory */ {
+			.phys_start = 0xb3c00000,
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
+	}
+};
diff --git a/configs/arm64/imx8mm-ivshmem-demo.c b/configs/arm64/imx8mm-ivshmem-demo.c
new file mode 100644
index 00000000..073c034b
--- /dev/null
+++ b/configs/arm64/imx8mm-ivshmem-demo.c
@@ -0,0 +1,126 @@
+/*
+ * iMX8MM target - ivshmem-demo
+ *
+ * Copyright 2018 NXP
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
+		.name = "ivshmem-demo",
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
+			.phys_start = 0xbba00000,
+			.virt_start = 0xbba00000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xbba01000,
+			.virt_start = 0xbba01000,
+			.size = 0x9000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xbba0a000,
+			.virt_start = 0xbba0a000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xbba0c000,
+			.virt_start = 0xbba0c000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xbba0e000,
+			.virt_start = 0xbba0e000,
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
+			.phys_start = 0xb3c00000,
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
+		{ /* IVSHMEM 00:00.0 (demo) */
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
diff --git a/configs/arm64/imx8mm-linux-demo.c b/configs/arm64/imx8mm-linux-demo.c
new file mode 100644
index 00000000..2024ca79
--- /dev/null
+++ b/configs/arm64/imx8mm-linux-demo.c
@@ -0,0 +1,165 @@
+/*
+ * iMX8MM target - linux-demo
+ *
+ * Copyright 2019 NXP
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
+ * jailhouse cell linux imx8mm-linux-demo.cell Image -d fsl-imx8mm-evk-inmate.dtb -c "clk_ignore_unused console=ttymxc3,115200 earlycon=ec_imx6q,0x30890000,115200  root=/dev/mmcblk2p2 rootwait rw"
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
+		.vpci_irq_base = 74, /* Not include 32 base */
+	},
+
+	.cpus = {
+		0xc,
+	},
+
+	.mem_regions = {
+		/* IVHSMEM shared memory region for 00:00.0 */ {
+			.phys_start = 0xbba00000,
+			.virt_start = 0xbba00000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ ,
+		},
+		{
+			.phys_start = 0xbba01000,
+			.virt_start = 0xbba01000,
+			.size = 0x9000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE ,
+		},
+		{
+			.phys_start = 0xbba0a000,
+			.virt_start = 0xbba0a000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE ,
+		},
+		{
+			.phys_start = 0xbba0c000,
+			.virt_start = 0xbba0c000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		{
+			.phys_start = 0xbba0e000,
+			.virt_start = 0xbba0e000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		/* IVSHMEM shared memory regions for 00:01.0 (networking) */
+		JAILHOUSE_SHMEM_NET_REGIONS(0xbbb00000, 0),
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
+		/* SHDC1 */ {
+			.phys_start = 0x30b60000,
+			.virt_start = 0x30b60000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* RAM: Top at 4GB Space */ {
+			.phys_start = 0xbb700000,
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
+			.phys_start = 0x93c00000,
+			.virt_start = 0x93c00000,
+			.size = 0x24000000,
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
+			.pin_base = 96,
+			.pin_bitmap = {
+				0xf << (74 + 32 - 96)
+			},
+		},
+	},
+
+	.pci_devices = {
+		{ /* IVSHMEM 00:00.0 (demo) */
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 1,
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
diff --git a/configs/arm64/imx8mm.c b/configs/arm64/imx8mm.c
new file mode 100644
index 00000000..f6e96595
--- /dev/null
+++ b/configs/arm64/imx8mm.c
@@ -0,0 +1,203 @@
+/*
+ * i.MX8MM Target
+ *
+ * Copyright 2018 NXP
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
+	struct jailhouse_memory mem_regions[16];
+	struct jailhouse_irqchip irqchips[3];
+	struct jailhouse_pci_device pci_devices[2];
+} __attribute__((packed)) config = {
+	.header = {
+		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
+		.hypervisor_memory = {
+			.phys_start = 0xb7c00000,
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
+			/*
+			 * .pci_mmconfig_base is fixed; if you change it,
+			 * update the value in mach.h
+			 * (PCI_CFG_BASE) and regenerate the inmate library
+			 */
+			.pci_mmconfig_base = 0xbb800000,
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
+			.name = "imx8mm",
+
+			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+			.cpu_set_size = sizeof(config.cpus),
+			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+			.num_irqchips = ARRAY_SIZE(config.irqchips),
+			.vpci_irq_base = 51, /* Not include 32 base */
+		},
+	},
+
+	.cpus = {
+		0xf,
+	},
+
+	.mem_regions = {
+		/* IVHSMEM shared memory region for 00:00.0 */ {
+			.phys_start = 0xbba00000,
+			.virt_start = 0xbba00000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ ,
+		},
+		{
+			.phys_start = 0xbba01000,
+			.virt_start = 0xbba01000,
+			.size = 0x9000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE ,
+		},
+		{
+			.phys_start = 0xbba0a000,
+			.virt_start = 0xbba0a000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE ,
+		},
+		{
+			.phys_start = 0xbba0c000,
+			.virt_start = 0xbba0c000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		{
+			.phys_start = 0xbba0e000,
+			.virt_start = 0xbba0e000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		/* IVSHMEM shared memory regions for 00:01.0 (networking) */
+		JAILHOUSE_SHMEM_NET_REGIONS(0xbbb00000, 0),
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
+			.size = 0x73c00000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+		/* Inmate memory */{
+			.phys_start = 0xb3c00000,
+			.virt_start = 0xb3c00000,
+			.size = 0x04000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+		/* RAM 01 */ {
+			.phys_start = 0xb8000000,
+			.virt_start = 0xb8000000,
+			.size = 0x03700000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+		/* Loader */{
+			.phys_start = 0xbb700000,
+			.virt_start = 0xbb700000,
+			.size = 0x100000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+		/* RAM 02 */ {
+			.phys_start = 0xbbc00000,
+			.virt_start = 0xbbc00000,
+			.size = 0x02400000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+		/* OP-TEE reserved memory */{
+			.phys_start = 0xbe000000,
+			.virt_start = 0xbe000000,
+			.size = 0x2000000,
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200324164343.13403-2-alice.guo%40nxp.com.
