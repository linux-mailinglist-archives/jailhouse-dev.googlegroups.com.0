Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBB44HQPZQKGQETM67FXI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13e.google.com (mail-lf1-x13e.google.com [IPv6:2a00:1450:4864:20::13e])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D2F17A21E
	for <lists+jailhouse-dev@lfdr.de>; Thu,  5 Mar 2020 10:18:44 +0100 (CET)
Received: by mail-lf1-x13e.google.com with SMTP id j3sf1736720lfe.10
        for <lists+jailhouse-dev@lfdr.de>; Thu, 05 Mar 2020 01:18:44 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1583399924; cv=pass;
        d=google.com; s=arc-20160816;
        b=wP+VLUMAwfbolLnXvmfhWCpBxW52iI9yKbYTplGjEZqszGr4uPZ4iiDl6Cj0Z8ku75
         LcsjIZq61cI0OF/vfCoYiS87FHC9X6fYwFSU2cdxcjEpMzwOxnuXRA86verIxgvBpIKj
         JF4BMVZe3Qtmf4/L5dAa1wNsJnEfrIe5PnGQYtb8Sr9bbXaM2VqLtFQhyLK2pyRibiSv
         pJfxVr5KuYbH0VuTLfhJosTU/HNSkB7dGN0lTZBRf2PJm7h5VYCorTgaF1UnARjFQGoe
         Qm1rA5/OOjPoIuYaQGWV6dotTl2NjC6mj0PpMCIVvS2/Irw5VGb/S+zlnvvR26LcDPOx
         8dHQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=V30G6OHKjrypEkCETDZ/j9lxpZgjdPet6RLYYMTeevY=;
        b=K8198MQonTvmLlBccphZQAUwtUaU9QZB4nzVLUEmubxlOl4GnU664AeaTgyWnxasxA
         lwOErcwVM5rJfxjrTvg6JNk1C4838MalYLwfzeYBHqACK9UV5vxl2CwXIe2oShRYq4HN
         NxJ4VLj4Vu9XdP0qLSVVH4DlK54+GoWJcmABO+0mO+rFKBAO1772ICYoWn6WFy1G1Zur
         Eh/gZbBPW8ItS+RICCbnpSJVIiVrBziRrFmIdiqB/OQN2NenFjVP5jaivJma5DQgOD5v
         izDDJGiKKdqSIixACnOoHBGWhZBEDv5e0kJJ/s9o4h86XFm2YvIUH8PIWoQVSvCvKGuk
         XgyQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=CqV7Phrv;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.7.75 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=V30G6OHKjrypEkCETDZ/j9lxpZgjdPet6RLYYMTeevY=;
        b=BwmfifBnS1y2Vb+5uD/4cj/twAIsQ6DOXjjY0Ha9/krFYqTl8aMyiaXBjWUR25GmU7
         IzI9eVu3fktof3sqAkI5zoODjFpZC4tkdgvP+J5q/KyBBmDAcIqUU/KT5Ylvc7lC0Z7O
         1QUjIoqmsPcl7IEvY/UgdgBbK73Hw48bTR7GAVCXg2rff2aj8BkX2z6GH4G3Lm/QBeoH
         aHtebxYofRva2zXT+TsYWFqtJhSQ00T8YdEZ49/gSGm+4H7mjeaiBdYKsNPhltDcMCs6
         hu+Cp9ltzuesKxq1hdL8rDcY6NVzHCS6lcDeqfdAyQNkzYvuipxU8NDknQZCje2vmxDx
         dobw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=V30G6OHKjrypEkCETDZ/j9lxpZgjdPet6RLYYMTeevY=;
        b=EmO9g+uFcxYh2to4jUtRuBVvjlu2GGhhFfk0+3ELfqGwsa38Qj6ycvp7nOMCZxLOZw
         ZRMTWdjknG7MdMEeoRoTYud0tEt+v8hOwrKnaij4xDzgBXzTIRCK/CrvblBq33RRNs+I
         iKb3Q1VzMcgQO6k9CijBDzBVPCXdwwcRC6iwdsGawx/2iLzDo06ijXSkI7UYyblUO8n6
         szKVUw4JhrzcsDxh0JC46soXgm76t6w0zAFcNsnc0lJn/OGPgwssOvLgpFQCvpzLC5iR
         l+Bp/TVxXsS37NjdwHtbyxhkbRbwMOmuXnfpWWFPOAl1ei2VXGfR8h+0FDeEp8bl0Epa
         CZrg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ27MYrf16w9gtmNOrZdEqJiSm4+6DgrOkq9JD1WumWypDv9Sct6
	jyxlDvqXCAZnsTivsUBx8SE=
X-Google-Smtp-Source: ADFU+vtZXivlCCKjKoRZoKrW5n9w7vWT5IDVPsNpmbUq1dGbllMo9EV+4drEZ6Y6cPkMUvp5ZIEo1A==
X-Received: by 2002:a05:6512:10d2:: with SMTP id k18mr4883932lfg.72.1583399923571;
        Thu, 05 Mar 2020 01:18:43 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:5c47:: with SMTP id s7ls261371lfp.1.gmail; Thu, 05 Mar
 2020 01:18:42 -0800 (PST)
X-Received: by 2002:a19:cbca:: with SMTP id b193mr1313621lfg.58.1583399922573;
        Thu, 05 Mar 2020 01:18:42 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1583399922; cv=pass;
        d=google.com; s=arc-20160816;
        b=vpXqENr2AeTB21+ic6uAJ0XQLoR7IAxUKJND6nUtaK+OCviYl/uz6EqWkm2pZdM0Zc
         gzB7vFeI7reA6x/6iWT9I7eRWa9rU7DLs7lwVsmF3pCDNHwgbiwGJM599WaE0o604pnd
         tXT2U9WGlu0DUgV4omzOgnKVNK8HkYwaALykP0dP71hV6xCiL+y9o7m6ez+3M2l/CgYT
         /LeUTCHTv+TFEQeHbLKj5KULZlpX++76WuP+8o4s/V4W9ZdpzZuzmYi0Ha2+qE0mL0Sa
         +Xuo7CTxnuYIsmVfk6B5u7lURTlEXohANAcE0BKFjVSFkpCscgNbP1yaA5W9nk7aObjb
         FNsQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=QfwdsT/5bCgGEsdrUXB7JPRQcMsKsevjya1UHT02wEg=;
        b=wylew9wOhFr/fMhB4fes3Y3q5SYGUlhSxRy7sCxAzvoeLh6llK01oZyBnDS9Ave4Fg
         kbKcA92DZg/XWqkkQoWGp1sYMSD3NhEpiPYn7cr76ItMYlkCvrBqa03KGTd3YENwguJe
         7pH/W2NIFwScS5un7T5zGXOcFZHspiTaMI9LWZiyZ9LFu90gPcuQnAtUYIrXIfjBS6xp
         S4gy/DO5Pn3513YcsEijJTWtpZOyhKxuPyQBPboycE1rdcvZvkIUXIURLhbAZbFuMkOA
         rVDP7kpqX/ulUGx0gzfVMz6gmABwxFxS2tZhdohvEXPE0YE+HXlneSUYrb1TPSNm+cTP
         NjCw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=CqV7Phrv;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.7.75 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70075.outbound.protection.outlook.com. [40.107.7.75])
        by gmr-mx.google.com with ESMTPS id r6si106245ljk.1.2020.03.05.01.18.42
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Mar 2020 01:18:42 -0800 (PST)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.7.75 as permitted sender) client-ip=40.107.7.75;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ORzz4vkIOiaVD9NGMrxs84CtN5CLwDIgOlnXJFnSeQPkJLY0r+dfc4n491MAH31B5qe4hgemULEmXm4p8OpFCEAL+WeqgSb2bzrODqYvadXd9DP0BTTTTuxXcG5kgbC9nZPY+1aAx7Iy7W10tlQTwUNNgmtmI8MbuCOnPEESStJOgswKxOLFOxW6S2L7SSoHGnbcfzcbL/T4SXbOSfjoTscbF3AUCjkl3TwuI9785PVlWqM0NbbeNoog/g9WU8U8vJ+IydDhp+I9ihkOv/82nTtOahUgVJB4kJBshwh5jxSRlydufJYWvkP6G4AlRFdq9WY8CAMdSM2Ty54hrA5w9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QfwdsT/5bCgGEsdrUXB7JPRQcMsKsevjya1UHT02wEg=;
 b=M5Z/r3+DxNpKThUfF3E15M3XpqhrcuyWI87ubmK/OLNJKANfN50NEqGVw/krO6l7JjhkUcTEohdHP7fo3acf2LdOyy2bcRfW6n0hzCrbzWQ9ZgSVaqYSU6FYMJGXknsQUQuU2RfGlc4NAhgstkwARoW96guwsJhWCLRbLol3DmP3WzkNt+VG5kvx0dLGo0OaIFtohqCPw9KD8zb0m7+SkXv0YKxeCqpIL+sgdVj/J4m3p+hqLfeGUaXiB8zlIQ5UoFKGBsE20bwvjpAKmCdp2LpnO2XKBOwz27PhiR4UnhHC3dcxApEts6NSIL+7rzcSaYx+KvF0j5nqIqNACFmsVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com (52.135.147.15) by
 AM0PR04MB5442.eurprd04.prod.outlook.com (20.178.116.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.18; Thu, 5 Mar 2020 09:18:39 +0000
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::91e2:17:b3f4:d422]) by AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::91e2:17:b3f4:d422%3]) with mapi id 15.20.2772.019; Thu, 5 Mar 2020
 09:18:38 +0000
From: peng.fan@nxp.com
To: jailhouse-dev@googlegroups.com
Cc: alice.guo@nxp.com,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 2/2] support booting jailhouse before root cell linux
Date: Thu,  5 Mar 2020 17:39:50 +0800
Message-Id: <20200305093950.848-3-peng.fan@nxp.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200305093950.848-1-peng.fan@nxp.com>
References: <20200305093950.848-1-peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: SG2P153CA0014.APCP153.PROD.OUTLOOK.COM (2603:1096::24) To
 AM0PR04MB4481.eurprd04.prod.outlook.com (2603:10a6:208:70::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-ljuv.ap.freescale.net (119.31.174.71) by SG2P153CA0014.APCP153.PROD.OUTLOOK.COM (2603:1096::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.1 via Frontend Transport; Thu, 5 Mar 2020 09:18:37 +0000
X-Mailer: git-send-email 2.16.4
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bdf2fa72-21d8-4d6f-6dc6-08d7c0e63091
X-MS-TrafficTypeDiagnostic: AM0PR04MB5442:|AM0PR04MB5442:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB5442941209A0EC64D631E80A88E20@AM0PR04MB5442.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-Forefront-PRVS: 03333C607F
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(4636009)(376002)(366004)(136003)(39860400002)(346002)(396003)(189003)(199004)(1076003)(8676002)(2906002)(81166006)(8936002)(36756003)(66556008)(66476007)(66946007)(6916009)(478600001)(81156014)(4326008)(30864003)(5660300002)(52116002)(6512007)(86362001)(26005)(9686003)(16526019)(186003)(2616005)(6506007)(956004)(6486002)(6666004)(316002);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB5442;H:AM0PR04MB4481.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
Received-SPF: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sdg11xgPmSbglLtQuhLFut4beelKxpy8ZyTDbRyeQdPejHjR6KVbwMjaEtqs/OXRIU9fsfkTn0cQWYPnRo4MGQ2n1xtWatBe58Lpo+GV3JGdRGjADwMHRDoqmsO+kpyKqzaRFUdVJ3rscMdzvXzZEaUau1wzUPavhdhPL4Au70FUK+wk80E8mK8UEG+YFChAxz2HcXLJHkzDzVXQKqnpcxunL7GoSjteV++w8ulnk1RWuGoPSmkMNPaynPuKshIH1+s2ckiCXKIedxbKzaVAB9pYrHab0IDAicQWN5GyyWREuwhTugrdjgLYLEO0dmYCEIA6ox9LbmG6/iDKPXKYADHNP8iDsm2KrtI8taTkfcp677fDvx4waWQh17tbHRAuMOEqYS9VOB6vTbOYaUDnalu2b79Dnzti7+BDUkdy4xBup+GHz9GAgOBEIdNsITFa
X-MS-Exchange-AntiSpam-MessageData: ylf3L7Yg0oYE69RkZLuaGIpXnu1QJUAJ1cYWeCvKnN/uRJOcvrcQigNkL9TSy26j11KS3PCpKvj4lJi+weEEPdZDPGUdYY+8R56dNN9eUR3tfC5kY6cTu+1Woxe2PeOGsCbnNQOFffAPTne3fhbx3A==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdf2fa72-21d8-4d6f-6dc6-08d7c0e63091
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2020 09:18:38.9420
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UPEO0aIKeevoFbUPGOM7bTdNgk9yyOlAHVSzkZVO0KdCld37Hp7wtXzremGPISUChiS0nGzgdBinJQlskTfuZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5442
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=CqV7Phrv;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.7.75 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

To boot jailhouse before linux, we need a preloader to initialize
GIC, boot up all cores, did basic EL2 initialization, then kick
inmate/root cell.

This patchset only supports ARM64 with GICv3 and tested on
i.MX8MN DDR4 EVK board.

The gicv3 initialization is mostly reused from Linux Kernel.

The images are all packed into a FIT image, and U-Boot load
the FIT images. When bootm, U-Boot will parse the FIT image and
copy payload to address specific in fit image.

The fit file in the patch is fit.its, currently the address are
hardcoded. Later, a script would be used to automatic generate it.

The script to generate the FIT image for U-Boot

cp hypervisor/jailhouse.bin loader/
cp configs/arm64/imx8mn.cell loader/
cp configs/arm64/imx8mn-gic-demo.cell loader/
cp inmates/demos/arm64/gic-demo.bin loader/
cp <Linux>/arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk-root.dtb ./loader
cp <Linux>/arch/arm64/boot/Image ./loader
cd loader
mkimage -E -f fit.its loader.itb
cd -

Currently only root cell linux plus inmate cell gic demo work.
root cell will not able manage inmate cell.

But I think root cell could manage, if we modify the jailhouse driver
to get the cell information.

Intercell communication currently not supported, this could added later.

The boot command:
fatload mmc 1:1 0x60000000 loader.itb
bootm 0x60000000

Post this as RFC, hope we could have an good direction and got this
feature accepted by Jailhouse community.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 Kbuild                                          |   2 +-
 hypervisor/arch/arm-common/include/asm/gic.h    |   3 +
 hypervisor/arch/arm-common/include/asm/gic_v3.h |  18 ++
 loader/Makefile                                 |  49 ++++
 loader/configs.h                                |  30 +++
 loader/fit.its                                  |  85 ++++++
 loader/gic-v3.c                                 | 154 +++++++++++
 loader/head.S                                   | 327 ++++++++++++++++++++++++
 loader/inmate.c                                 |  63 +++++
 loader/lib.c                                    |  56 ++++
 loader/loader.h                                 |  15 ++
 loader/loader.lds.S                             |  66 +++++
 loader/main.c                                   | 194 ++++++++++++++
 loader/mmio.h                                   |  21 ++
 loader/psci.h                                   | 119 +++++++++
 15 files changed, 1201 insertions(+), 1 deletion(-)
 create mode 100644 loader/Makefile
 create mode 100644 loader/configs.h
 create mode 100644 loader/fit.its
 create mode 100644 loader/gic-v3.c
 create mode 100644 loader/head.S
 create mode 100644 loader/inmate.c
 create mode 100644 loader/lib.c
 create mode 100644 loader/loader.h
 create mode 100644 loader/loader.lds.S
 create mode 100644 loader/main.c
 create mode 100644 loader/mmio.h
 create mode 100644 loader/psci.h

diff --git a/Kbuild b/Kbuild
index 0b25e26e..1751f13a 100644
--- a/Kbuild
+++ b/Kbuild
@@ -51,7 +51,7 @@ GEN_PCI_DEFS_PY := $(obj)/pyjailhouse/pci_defs.py
 $(GEN_PCI_DEFS_PY): $(src)/scripts/gen_pci_defs.sh
 	$(call if_changed,gen_pci_defs)
 
-subdir-y := hypervisor configs inmates tools
+subdir-y := hypervisor configs inmates tools loader
 
 subdir-ccflags-y := -Werror
 
diff --git a/hypervisor/arch/arm-common/include/asm/gic.h b/hypervisor/arch/arm-common/include/asm/gic.h
index e851d375..af9c3b4c 100644
--- a/hypervisor/arch/arm-common/include/asm/gic.h
+++ b/hypervisor/arch/arm-common/include/asm/gic.h
@@ -33,10 +33,13 @@
 #define GICD_SGIR			0x0f00
 #define GICD_CPENDSGIR			0x0f10
 #define GICD_SPENDSGIR			0x0f20
+#define GIC_DIST_CONFIG			0xc00
 #define GICD_IROUTER			0x6000
 
 #define GICD_PIDR2_ARCH(pidr)		(((pidr) & 0xf0) >> 4)
 
+#define GICD_INT_ACTLOW_LVLTRIG		0x0
+
 #define is_sgi(irqn)			((u32)(irqn) < 16)
 #define is_ppi(irqn)			((irqn) > 15 && (irqn) < 32)
 #define is_spi(irqn)			((irqn) > 31 && (irqn) < 1020)
diff --git a/hypervisor/arch/arm-common/include/asm/gic_v3.h b/hypervisor/arch/arm-common/include/asm/gic_v3.h
index 853721d6..c8990d00 100644
--- a/hypervisor/arch/arm-common/include/asm/gic_v3.h
+++ b/hypervisor/arch/arm-common/include/asm/gic_v3.h
@@ -21,6 +21,23 @@
 #define GICDv3_PIDR2		0xffe8
 #define GICDv3_PIDR4		0xffd0
 
+#define GICD_IGROUPRnE		0x1000
+#define GICD_ICENABLERnE	0x1400
+#define GICD_ICACTIVERnE	0x1C00
+#define GICD_IPRIORITYRnE	0x2000
+#define GICD_ICFGRnE		0x3000
+#define GICD_IROUTERnE		0x8000
+
+#define GICD_CTLR_RWP		(1U << 31)
+#define GICD_CTLR_ENABLE_G1A	(1U << 1)
+#define GICD_CTLR_ENABLE_G1	(1U << 0)
+
+#define GICD_TYPER_ID_BITS(typer)	((((typer) >> 19) & 0x1f) + 1)
+#define GICD_TYPER_NUM_LPIS(typer)	((((typer) >> 11) & 0x1f) + 1)
+#define GICD_TYPER_SPIS(typer)		((((typer) & 0x1f) + 1) * 32)
+#define GICD_TYPER_ESPIS(typer)						\
+	(((typer) & GICD_TYPER_ESPI) ? GICD_TYPER_SPIS((typer) >> 27) : 0)
+
 #define GICR_CTLR		0x0000
 #define GICR_IIDR		0x0004
 #define GICR_TYPER		0x0008
@@ -39,6 +56,7 @@
 #define GICR_IPRIORITYR		GICD_IPRIORITYR
 #define GICR_ICFGR		GICD_ICFGR
 
+#define GICD_TYPER_ESPI		(1U << 8)
 #define GICR_TYPER_Last		(1 << 4)
 #define GICR_PIDR2_ARCH		GICD_PIDR2_ARCH
 
diff --git a/loader/Makefile b/loader/Makefile
new file mode 100644
index 00000000..7ddf8035
--- /dev/null
+++ b/loader/Makefile
@@ -0,0 +1,49 @@
+-include $(GEN_CONFIG_MK)
+
+LINUXINCLUDE := -I$(src)/../hypervisor/arch/$(SRCARCH)/include \
+	     -I$(src)/../hypervisor/include \
+	     -I$(src)/../include/arch/$(SRCARCH) \
+	     -I$(src)/../hypervisor/arch/$(SRCARCH)/include \
+	     -I$(src)/../hypervisor/arch/arm-common/include/ \
+	     -I$(src)/../include \
+	     -I$(src)
+
+KBUILD_AFLAGS := -D__ASSEMBLY__ -fno-PIE
+KBUILD_CFLAGS := -g -Os -Wall -Wstrict-prototypes -Wtype-limits \
+		 -Wmissing-declarations -Wmissing-prototypes \
+		 -fno-strict-aliasing -fno-pic -fno-common \
+		 -fno-stack-protector -fno-builtin-ffsl \
+		 -D__LINUX_COMPILER_TYPES_H -mstrict-align
+CORE_OBJECTS = head.o gic-v3.o main.o lib.o inmate.o
+
+ifneq ($(wildcard $(INC_CONFIG_H)),)
+KBUILD_CFLAGS += -include $(INC_CONFIG_H)
+endif
+
+define BUILD_loader_template
+always += loader$(1).bin
+
+$$(obj)/arch/$$(SRCARCH)/lib$(1).a: $$(obj)/arch/$$(SRCARCH)
+	@true
+
+loader$(1)-y := $$(CORE_OBJECTS) loader.lds
+targets += $$(loader$(1)-y)
+
+loader$(1)_OBJS = $$(addprefix $$(obj)/,$$(loader$(1)-y))
+
+LDFLAGS_loader$(1).o := --whole-archive -T
+
+targets += loader$(1).o
+$$(obj)/loader$(1).o: $$(src)/loader.lds $$(loader$(1)_OBJS)
+	$$(call if_changed,ld)
+
+OBJCOPYFLAGS_loader$(1).bin := -O binary -R .eh_frame
+
+targets += loader$(1).bin
+$$(obj)/loader$(1).bin: $$(obj)/loader$(1).o
+	$$(call if_changed,objcopy)
+endef
+
+ifeq ($(SRCARCH),arm64)
+$(eval $(call BUILD_loader_template,))
+endif
diff --git a/loader/configs.h b/loader/configs.h
new file mode 100644
index 00000000..fce5f366
--- /dev/null
+++ b/loader/configs.h
@@ -0,0 +1,30 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
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
+#define	LOADER_ADDR		0x40000000
+#define JAILHOUSE_ADDR		0x40200000
+
+#define CELL_STRIDE		0x10000
+
+#define CELL0_CONF_ADDR		0x40300000
+#define CELL0_CONF_FILE		"imx8mn.cell"
+#define CELL0_FDT_FILE		"imx8mn-ddr4-evk-root.dtb"
+#define CELL0_FDT_ADDR		0x43000000
+#define CELL0_INMATE_ADDR	0x40480000
+
+#define CELL1_CONF_ADDR		0x40310000
+#define CELL1_CONF_FILE		"imx8mn-gic-demo.cell"
+#define CELL1_INMATE_ADDR	0xb3c00000
+#define CELL1_INMATE_FILE	"gic-demo.bin"
+
+#define GICD_ADDR		0x38800000
+
diff --git a/loader/fit.its b/loader/fit.its
new file mode 100644
index 00000000..84d5eb37
--- /dev/null
+++ b/loader/fit.its
@@ -0,0 +1,85 @@
+/dts-v1/;
+
+/ {
+	description = "Configuration to load Images";
+
+	images {
+		kernel {
+			description = "linux";
+			os = "Linux";
+			data = /incbin/("loader.bin");
+			type = "kernel";
+			arch = "arm64";
+			compression = "none";
+			load = <0x40000000>;
+			entry = <0x40000000>;
+		};
+
+		hypervisor {
+			description = "Jailhouse hypervisor";
+			os = "jailhouse";
+			data = /incbin/("jailhouse.bin");
+			type = "standalone";
+			arch = "arm64";
+			compression = "none";
+			load = <0x40200000>;
+		};
+
+		cell@0 {
+			description = "i.MX8MN cell";
+			data = /incbin/("imx8mn.cell");
+			arch = "arm64";
+			type = "standalone";
+			compression = "none";
+			load = <0x40300000>;
+		};
+
+		inmate@0 {
+			description = "ROOT CELL image";
+			os = "linux";
+			arch = "arm64";
+			data = /incbin/("Image");
+			type = "standalone";
+			compression = "none";
+			load = <0x40480000>;
+		};
+
+		cell@1 {
+			description = "i.MX8MN GIC-CELL";
+			data = /incbin/("imx8mn-gic-demo.cell");
+			arch = "arm64";
+			type = "standalone";
+			compression = "none";
+			load = <0x40310000>;
+		};
+
+		inmate@1 {
+			description = "i.MX8MN GIC-DEMO";
+			data = /incbin/("gic-demo.bin");
+			arch = "arm64";
+			type = "standalone";
+			compression = "none";
+			load = <0xb3c00000>;
+		};
+
+		fdt {
+			description = "fdt";
+			data = /incbin/("imx8mn-ddr4-evk-root.dtb");
+			type = "flat_dt";
+			compression = "none";
+			arch = "arm64";
+			load = <0x43000000>;
+		};
+	};
+
+	configurations {
+		default = "config@1";
+
+		config@1 {
+			description = "imx8mp-evk";
+			kernel = "kernel";
+			fdt = "fdt";
+			loadables = "hypervisor", "cell@0", "inmate@0", "cell@1", "inmate@1";
+		};
+	};
+};
diff --git a/loader/gic-v3.c b/loader/gic-v3.c
new file mode 100644
index 00000000..02fd1dcb
--- /dev/null
+++ b/loader/gic-v3.c
@@ -0,0 +1,154 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2002 ARM Limited, All Rights Reserved.
+ */
+
+#include <jailhouse/types.h>
+#include <asm/gic.h>
+#include <asm/gic_v3.h>
+#include <jailhouse/mmio.h>
+#include <loader.h>
+#include <mmio.h>
+#include <configs.h>
+
+#define GICD_INT_DEF_PRI                0xa0
+#define GICD_INT_DEF_PRI_X4             ((GICD_INT_DEF_PRI << 24) |\
+                                        (GICD_INT_DEF_PRI << 16) |\
+                                        (GICD_INT_DEF_PRI << 8) |\
+                                        GICD_INT_DEF_PRI)
+struct rdists {
+	unsigned int		gicd_typer;
+	bool			has_vlpis;
+	bool			has_direct_lpi;
+};
+
+struct gic_chip_data {
+	void 		*dist_base;
+	struct rdists		rdists;
+};
+
+static struct gic_chip_data gic_data;
+
+#define min(x, y)	((x) < (y) ? (x) : (y))
+#define GIC_ID_NR	(1U << GICD_TYPER_ID_BITS(gic_data.rdists.gicd_typer))
+#define GIC_LINE_NR	min(GICD_TYPER_SPIS(gic_data.rdists.gicd_typer), 1020U)
+#define GIC_ESPI_NR	GICD_TYPER_ESPIS(gic_data.rdists.gicd_typer)
+
+static void gic_dist_config(void *base, int gic_irqs,
+			    void (*sync_access)(void))
+{
+	unsigned int i;
+
+	/*
+	 * Set all global interrupts to be level triggered, active low.
+	 */
+	for (i = 32; i < gic_irqs; i += 16)
+		writel(GICD_INT_ACTLOW_LVLTRIG,
+					base + GIC_DIST_CONFIG + i / 4);
+
+	/*
+	 * Set priority on all global interrupts.
+	 */
+	for (i = 32; i < gic_irqs; i += 4)
+		writel(GICD_INT_DEF_PRI_X4, base + GICD_IPRIORITYR + i);
+
+	/*
+	 * Deactivate and disable all SPIs. Leave the PPI and SGIs
+	 * alone as they are in the redistributor registers on GICv3.
+	 */
+	for (i = 32; i < gic_irqs; i += 32) {
+		writel(0xffffffff, base + GICD_ICACTIVER + i / 8);
+		writel(0xffffffff, base + GICD_ICENABLER + i / 8);
+	}
+
+	if (sync_access)
+		sync_access();
+}
+
+static void gic_do_wait_for_rwp(void *base)
+{
+	u32 count = 0xffffffff;
+
+	while (readl(base + GICD_CTLR) & GICD_CTLR_RWP) {
+		count--;
+		if (!count) {
+			return;
+		}
+		cpu_relax();
+	}
+}
+
+/* Wait for completion of a distributor change */
+static void gic_dist_wait_for_rwp(void)
+{
+	gic_do_wait_for_rwp(gic_data.dist_base);
+}
+
+#define MPIDR_EL1	SYSREG_32(0, c0, c0, 5)
+static unsigned long phys_processor_id(void)
+{
+	unsigned long mpidr;
+
+	arm_read_sysreg(MPIDR_EL1, mpidr);
+	return mpidr & MPIDR_CPUID_MASK;
+}
+
+void gic_dist_init(void)
+{
+	unsigned int i;
+	u64 affinity;
+	void *base;
+	u32 typer;
+
+	gic_data.dist_base = (void *)GICD_ADDR;
+
+	base = gic_data.dist_base;
+	typer = readl(gic_data.dist_base + GICD_TYPER);
+	gic_data.rdists.gicd_typer = typer;
+
+	/* Disable the distributor */
+	writel(0, base + GICD_CTLR);
+	gic_dist_wait_for_rwp();
+
+	/*
+	 * Configure SPIs as non-secure Group-1. This will only matter
+	 * if the GIC only has a single security state. This will not
+	 * do the right thing if the kernel is running in secure mode,
+	 * but that's not the intended use case anyway.
+	 */
+	for (i = 32; i < GIC_LINE_NR; i += 32)
+		writel(~0, base + GICD_IGROUPR + i / 8);
+
+	/* Extended SPI range, not handled by the GICv2/GICv3 common code */
+	for (i = 0; i < GIC_ESPI_NR; i += 32) {
+		writel(~0U, base + GICD_ICENABLERnE + i / 8);
+		writel(~0U, base + GICD_ICACTIVERnE + i / 8);
+	}
+
+	for (i = 0; i < GIC_ESPI_NR; i += 32)
+		writel(~0U, base + GICD_IGROUPRnE + i / 8);
+
+	for (i = 0; i < GIC_ESPI_NR; i += 16)
+		writel(0, base + GICD_ICFGRnE + i / 4);
+
+	for (i = 0; i < GIC_ESPI_NR; i += 4)
+		writel(GICD_INT_DEF_PRI_X4, base + GICD_IPRIORITYRnE + i);
+
+	/* Now do the common stuff, and wait for the distributor to drain */
+	gic_dist_config(base, GIC_LINE_NR, gic_dist_wait_for_rwp);
+
+	/* Enable distributor with ARE, Group1 */
+	writel(GICD_CTLR_ARE_NS | GICD_CTLR_ENABLE_G1A | GICD_CTLR_ENABLE_G1,
+		       base + GICD_CTLR);
+
+	/*
+	 * Set all global interrupts to the boot CPU only. ARE must be
+	 * enabled.
+	 */
+	affinity = phys_processor_id();
+	for (i = 32; i < GIC_LINE_NR; i++)
+		mmio_write64(base + GICD_IROUTER + i * 8, affinity);
+
+	for (i = 0; i < GIC_ESPI_NR; i++)
+		mmio_write64(base + GICD_IROUTERnE + i * 8, affinity);
+}
diff --git a/loader/head.S b/loader/head.S
new file mode 100644
index 00000000..323551da
--- /dev/null
+++ b/loader/head.S
@@ -0,0 +1,327 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Low-level CPU initialisation
+ * Based on arch/arm/kernel/head.S
+ *
+ * Copyright (C) 1994-2002 Russell King
+ * Copyright (C) 2003-2012 ARM Ltd.
+ * Authors:	Catalin Marinas <catalin.marinas@arm.com>
+ *		Will Deacon <will.deacon@arm.com>
+ */
+
+/* AArch64 SPSR bits */
+#define PSR_F_BIT	0x00000040
+#define PSR_I_BIT	0x00000080
+#define PSR_A_BIT	0x00000100
+#define PSR_D_BIT	0x00000200
+#define PSR_SSBS_BIT	0x00001000
+#define PSR_PAN_BIT	0x00400000
+#define PSR_UAO_BIT	0x00800000
+#define PSR_V_BIT	0x10000000
+#define PSR_C_BIT	0x20000000
+#define PSR_Z_BIT	0x40000000
+#define PSR_N_BIT	0x80000000
+
+#define PSR_MODE_EL1h	0x00000005
+#define CurrentEL_EL2           (2 << 2)
+#define CPTR_EL2_TZ     (1 << 8)
+#define ZCR_ELx_LEN_MASK        0x1ff
+
+#define __emit_inst(x)			.inst (x)
+
+	.irp	num,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30
+	.equ	.L__reg_num_x\num, \num
+	.endr
+	.equ	.L__reg_num_xzr, 31
+
+	.macro	mrs_s, rt, sreg
+	 __emit_inst(0xd5200000|(\sreg)|(.L__reg_num_\rt))
+	.endm
+
+	.macro	msr_s, sreg, rt
+	__emit_inst(0xd5000000|(\sreg)|(.L__reg_num_\rt))
+	.endm
+	/*
+	 * mov_q - move an immediate constant into a 64-bit register using
+	 *         between 2 and 4 movz/movk instructions (depending on the
+	 *         magnitude and sign of the operand)
+	 */
+	.macro	mov_q, reg, val
+	.if (((\val) >> 31) == 0 || ((\val) >> 31) == 0x1ffffffff)
+	movz	\reg, :abs_g1_s:\val
+	.else
+	.if (((\val) >> 47) == 0 || ((\val) >> 47) == 0x1ffff)
+	movz	\reg, :abs_g2_s:\val
+	.else
+	movz	\reg, :abs_g3:\val
+	movk	\reg, :abs_g2_nc:\val
+	.endif
+	movk	\reg, :abs_g1_nc:\val
+	.endif
+	movk	\reg, :abs_g0_nc:\val
+	.endm
+
+#define BIT(nr)                 ((1) << (nr))
+#define SCTLR_EL2_RES1  ((BIT(4))  | (BIT(5))  | (BIT(11)) | (BIT(16)) | \
+                         (BIT(18)) | (BIT(22)) | (BIT(23)) | (BIT(28)) | \
+                         (BIT(29)))
+
+#define SCTLR_EL1_RES1	((BIT(11)) | (BIT(20)) | (BIT(22)) | (BIT(28)) | \
+			 (BIT(29)))
+
+#ifdef CONFIG_CPU_BIG_ENDIAN
+#define ENDIAN_SET_EL1		(SCTLR_EL1_E0E | SCTLR_ELx_EE)
+#else
+#define ENDIAN_SET_EL1		0
+#endif
+
+
+#define HCR_HOST_NVHE_FLAGS (HCR_RW | HCR_API | HCR_APK)
+
+#define HCR_APK		((1UL) << 40)
+#define HCR_API		((1UL) << 41)
+#define HCR_RW_SHIFT	31
+#define HCR_RW		((1UL) << HCR_RW_SHIFT)
+
+#ifdef CONFIG_CPU_BIG_ENDIAN
+#define ENDIAN_SET_EL2          (SCTLR_ELx_EE)
+#else
+#define ENDIAN_SET_EL2          0
+#endif
+
+/*
+ * ARMv8 ARM reserves the following encoding for system registers:
+ * (Ref: ARMv8 ARM, Section: "System instruction class encoding overview",
+ *  C5.2, version:ARM DDI 0487A.f)
+ *      [20-19] : Op0
+ *      [18-16] : Op1
+ *      [15-12] : CRn
+ *      [11-8]  : CRm
+ *      [7-5]   : Op2
+ */
+#define Op0_shift       19
+#define Op0_mask        0x3
+#define Op1_shift       16
+#define Op1_mask        0x7
+#define CRn_shift       12
+#define CRn_mask        0xf
+#define CRm_shift       8
+#define CRm_mask        0xf
+#define Op2_shift       5
+#define Op2_mask        0x7
+
+#define sys_reg(op0, op1, crn, crm, op2) \
+        (((op0) << Op0_shift) | ((op1) << Op1_shift) | \
+         ((crn) << CRn_shift) | ((crm) << CRm_shift) | \
+         ((op2) << Op2_shift))
+
+#define ID_AA64PFR0_GIC_SHIFT           24
+#define ID_AA64DFR0_PMUVER_SHIFT        8
+#define ID_AA64DFR0_PMSVER_SHIFT        32
+#define SYS_PMBIDR_EL1                  sys_reg(3, 0, 9, 10, 7)
+#define SYS_PMSCR_EL2                   sys_reg(3, 4, 9, 9, 0)
+#define SYS_LORC_EL1                    sys_reg(3, 0, 10, 4, 3)
+#define SYS_ZCR_EL2			sys_reg(3, 4, 1, 2, 0)
+#define ID_AA64MMFR1_LOR_SHIFT          16
+#define ID_AA64PFR0_SVE_SHIFT		32
+
+	.text
+	.global el2_entry
+
+el2_entry:
+	msr	SPsel, #1			// We want to use SP_EL{1,2}
+	mrs	x0, CurrentEL
+	cmp	x0, #CurrentEL_EL2
+	b.eq	1f
+	b	.
+
+1:	mov_q	x0, (SCTLR_EL2_RES1 | ENDIAN_SET_EL2)
+	msr	sctlr_el2, x0
+
+	/* Set Stack */
+	mrs	x1, mpidr_el1
+	and	x1, x1, #0xff
+	mov	x2, #0x200
+	mul	x1, x1, x2
+	mov	x0, #0x910000
+	add	x0, x0, x1
+	msr	sp_el1, x0
+
+	mov	x2, xzr
+
+	/* Hyp configuration. */
+	mov_q	x0, HCR_HOST_NVHE_FLAGS
+	msr	hcr_el2, x0
+	isb
+
+	/*
+	 * Allow Non-secure EL1 and EL0 to access physical timer and counter.
+	 * This is not necessary for VHE, since the host kernel runs in EL2,
+	 * and EL0 accesses are configured in the later stage of boot process.
+	 * Note that when HCR_EL2.E2H == 1, CNTHCTL_EL2 has the same bit layout
+	 * as CNTKCTL_EL1, and CNTKCTL_EL1 accessing instructions are redefined
+	 * to access CNTHCTL_EL2. This allows the kernel designed to run at EL1
+	 * to transparently mess with the EL0 bits via CNTKCTL_EL1 access in
+	 * EL2.
+	 */
+	cbnz	x2, 1f
+	mrs	x0, cnthctl_el2
+	orr	x0, x0, #3			// Enable EL1 physical timers
+	msr	cnthctl_el2, x0
+1:
+	msr	cntvoff_el2, xzr		// Clear virtual offset
+
+#ifdef CONFIG_ARM_GIC_V3
+	/* GICv3 system register access */
+	mrs	x0, id_aa64pfr0_el1
+	ubfx	x0, x0, #ID_AA64PFR0_GIC_SHIFT, #4
+	cbz	x0, 3f
+
+	mrs_s	x0, SYS_ICC_SRE_EL2
+	orr	x0, x0, #ICC_SRE_EL2_SRE	// Set ICC_SRE_EL2.SRE==1
+	orr	x0, x0, #ICC_SRE_EL2_ENABLE	// Set ICC_SRE_EL2.Enable==1
+	msr_s	SYS_ICC_SRE_EL2, x0
+	isb					// Make sure SRE is now set
+	mrs_s	x0, SYS_ICC_SRE_EL2		// Read SRE back,
+	tbz	x0, #0, 3f			// and check that it sticks
+	msr_s	SYS_ICH_HCR_EL2, xzr		// Reset ICC_HCR_EL2 to defaults
+
+3:
+#endif
+
+	/* Populate ID registers. */
+	mrs	x0, midr_el1
+	mrs	x1, mpidr_el1
+	msr	vpidr_el2, x0
+	msr	vmpidr_el2, x1
+
+#ifdef CONFIG_COMPAT
+	msr	hstr_el2, xzr			// Disable CP15 traps to EL2
+#endif
+
+#if 0
+	/* EL2 debug */
+	mrs	x1, id_aa64dfr0_el1
+	sbfx	x0, x1, #ID_AA64DFR0_PMUVER_SHIFT, #4
+	cmp	x0, #1
+	b.lt	4f				// Skip if no PMU present
+	mrs	x0, pmcr_el0			// Disable debug access traps
+	ubfx	x0, x0, #11, #5			// to EL2 and allow access to
+4:
+	csel	x3, xzr, x0, lt			// all PMU counters from EL1
+
+	/* Statistical profiling */
+	ubfx	x0, x1, #ID_AA64DFR0_PMSVER_SHIFT, #4
+	cbz	x0, 7f				// Skip if SPE not present
+	cbnz	x2, 6f				// VHE?
+	mrs_s	x4, SYS_PMBIDR_EL1		// If SPE available at EL2,
+	and	x4, x4, #(1 << SYS_PMBIDR_EL1_P_SHIFT)
+	cbnz	x4, 5f				// then permit sampling of physical
+	mov	x4, #(1 << SYS_PMSCR_EL2_PCT_SHIFT | \
+		      1 << SYS_PMSCR_EL2_PA_SHIFT)
+	msr_s	SYS_PMSCR_EL2, x4		// addresses and physical counter
+5:
+	mov	x1, #(MDCR_EL2_E2PB_MASK << MDCR_EL2_E2PB_SHIFT)
+	orr	x3, x3, x1			// If we don't have VHE, then
+	b	7f				// use EL1&0 translation.
+6:						// For VHE, use EL2 translation
+	orr	x3, x3, #MDCR_EL2_TPMS		// and disable access from EL1
+7:
+	msr	mdcr_el2, x3			// Configure debug traps
+#endif
+
+#if 0
+	/* LORegions */
+	mrs	x1, id_aa64mmfr1_el1
+	ubfx	x0, x1, #ID_AA64MMFR1_LOR_SHIFT, 4
+	cbz	x0, 1f
+	msr_s	SYS_LORC_EL1, xzr
+#endif
+1:
+
+	/* Stage-2 translation */
+	msr	vttbr_el2, xzr
+
+	cbz	x2, install_el2_stub
+
+	isb
+	ret
+
+install_el2_stub:
+	/*
+	 * When VHE is not in use, early init of EL2 and EL1 needs to be
+	 * done here.
+	 * When VHE _is_ in use, EL1 will not be used in the host and
+	 * requires no configuration, and all non-hyp-specific EL2 setup
+	 * will be done via the _EL1 system register aliases in __cpu_setup.
+	 */
+	mov_q	x0, (SCTLR_EL1_RES1 | ENDIAN_SET_EL1)
+	msr	sctlr_el1, x0
+
+	/* Coprocessor traps. */
+	mov	x0, #0x33ff
+	msr	cptr_el2, x0			// Disable copro. traps to EL2
+
+	/* SVE register access */
+	mrs	x1, id_aa64pfr0_el1
+	ubfx	x1, x1, #ID_AA64PFR0_SVE_SHIFT, #4
+	cbz	x1, 7f
+
+	bic	x0, x0, #CPTR_EL2_TZ		// Also disable SVE traps
+	msr	cptr_el2, x0			// Disable copro. traps to EL2
+	isb
+	mov	x1, #ZCR_ELx_LEN_MASK		// SVE: Enable full vector
+	msr_s	SYS_ZCR_EL2, x1			// length for EL1.
+
+	/* Hypervisor stub */
+7:	adr	x0, __hyp_stub_vectors
+	msr	vbar_el2, x0
+
+	/* spsr */
+	adr	x1, entry
+	mov	x0, #(PSR_F_BIT | PSR_I_BIT | PSR_A_BIT | PSR_D_BIT |\
+		      PSR_MODE_EL1h)
+	msr	spsr_el2, x0
+	msr	elr_el2, x1
+	mrs	x0, mpidr_el1
+	eret
+
+.macro	ventry	label
+	.align	7
+	b	\label
+.endm
+	.align 11
+
+	.global __hyp_stub_vectors
+__hyp_stub_vectors:
+	ventry	.
+	ventry	.
+	ventry	.
+	ventry	.
+
+	ventry	.
+	ventry	.
+	ventry	.
+	ventry	.
+
+	ventry	el1_sync			// Synchronous 64-bit EL1
+	ventry	.
+	ventry	.
+	ventry	.
+
+	ventry	.
+	ventry	.
+	ventry	.
+	ventry	.
+
+
+	.align 11
+
+#define HVC_SET_VECTORS 0
+el1_sync:
+	cmp	x0, #HVC_SET_VECTORS
+	b.ne	9f
+	msr	vbar_el2, x1
+	b	9f
+9:	mov	x0, xzr
+	eret
diff --git a/loader/inmate.c b/loader/inmate.c
new file mode 100644
index 00000000..de61ce6b
--- /dev/null
+++ b/loader/inmate.c
@@ -0,0 +1,63 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
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
+
+#include <configs.h>
+#include <loader.h>
+#include <psci.h>
+#include <jailhouse/cell-config.h>
+#include <jailhouse/header.h>
+#include <jailhouse/hypercall.h>
+#include <jailhouse/string.h>
+#include <generated/version.h>
+
+
+#define MAX_CELL	16
+
+/* TODO: Handle PCI */
+int inmate_cell(void)
+{
+	struct jailhouse_cell_desc *config;
+	int i, err;
+
+	/* Ignore ROOT CELL */
+	for (i = 1; i < MAX_CELL; i++) {
+		config = (struct jailhouse_cell_desc *)(CELL0_CONF_ADDR + i * CELL_STRIDE);
+		if (memcmp(config->signature,
+			   JAILHOUSE_CELL_DESC_SIGNATURE,
+			   sizeof(config->signature)) != 0)
+			break;
+
+		if (config->revision != JAILHOUSE_CONFIG_REVISION)
+			break;
+
+		config->name[JAILHOUSE_CELL_NAME_MAXLEN] = 0;
+
+		config->id = i;
+
+		err = jailhouse_call_arg1(JAILHOUSE_HC_CELL_CREATE, (unsigned long)config);
+
+		if (err)
+			asm volatile("b .\r\n");
+
+		err = jailhouse_call_arg1(JAILHOUSE_HC_CELL_SET_LOADABLE, config->id);
+		if (err)
+			asm volatile("b .\r\n");
+
+		err = jailhouse_call_arg1(JAILHOUSE_HC_CELL_START, config->id);
+		if (err)
+			asm volatile("b .\r\n");
+	}
+
+	return 0;
+}
diff --git a/loader/lib.c b/loader/lib.c
new file mode 100644
index 00000000..096bd317
--- /dev/null
+++ b/loader/lib.c
@@ -0,0 +1,56 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) Siemens AG, 2013
+ *
+ * Authors:
+ *  Jan Kiszka <jan.kiszka@siemens.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <loader.h>
+#include <jailhouse/string.h>
+#include <jailhouse/types.h>
+
+void *memset(void *s, int c, unsigned long n)
+{
+	u8 *p = s;
+
+	while (n-- > 0)
+		*p++ = c;
+	return s;
+}
+
+int strcmp(const char *s1, const char *s2)
+{
+	while (*s1 == *s2) {
+		if (*s1 == '\0')
+			return 0;
+		s1++;
+		s2++;
+	}
+	return *(unsigned char *)s1 - *(unsigned char *)s2;
+}
+
+void *memcpy(void *dest, const void *src, unsigned long n)
+{
+	const u8 *s = src;
+	u8 *d = dest;
+
+	while (n-- > 0)
+		*d++ = *s++;
+	return dest;
+}
+
+int memcmp(const void *s1, const void *s2, unsigned long n)
+{
+	const unsigned char *_s1 = s1, *_s2 = s2;
+
+	while (n-- > 0)
+		if (*_s1++ != *_s2++)
+			return _s1[-1] < _s2[-1] ? -1 : 1;
+	return 0;
+}
+
diff --git a/loader/loader.h b/loader/loader.h
new file mode 100644
index 00000000..acd142be
--- /dev/null
+++ b/loader/loader.h
@@ -0,0 +1,15 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) Siemens AG, 2013-2016
+ *
+ * Authors:
+ *  Jan Kiszka <jan.kiszka@siemens.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+int memcmp(const void *s1, const void *s2, unsigned long n);
+int inmate_cell(void);
+void gic_dist_init(void);
diff --git a/loader/loader.lds.S b/loader/loader.lds.S
new file mode 100644
index 00000000..58aaa4cb
--- /dev/null
+++ b/loader/loader.lds.S
@@ -0,0 +1,66 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) Siemens AG, 2013-2017
+ *
+ * Authors:
+ *  Jan Kiszka <jan.kiszka@siemens.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <configs.h>
+#include <jailhouse/header.h>
+
+#include <asm/paging.h>
+#include <asm/sections.h>
+
+SECTIONS
+{
+	. = LOADER_ADDR;
+	.header		: { *(.header) }
+
+	. = ALIGN(16);
+	.text		: {
+		__text_start = .;
+		*(.text)
+	}
+
+	. = ALIGN(16);
+	.rodata		: { *(.rodata) }
+
+	. = ALIGN(16);
+	.data		: { *(.data) }
+
+	. = ALIGN(8);
+	.init_array	: {
+		__init_array_start = .;
+		*(SORT(.init_array.*)) *(.init_array)
+		__init_array_end = .;
+	}
+
+	.units		: {
+		__unit_array_start = .;
+		*(.units);
+		__unit_array_end = .;
+	}
+
+	ARCH_SECTIONS
+
+	/* The console section shall only contain the hypervisor console. This
+	 * section and the next section must be aligned to PAGE_SIZE, as we
+	 * will map the console section, and only that section, as a whole page
+	 * to the root cell. */
+
+	. = ALIGN(PAGE_SIZE);
+	.console	: { *(.console) }
+
+	. = ALIGN(PAGE_SIZE);
+	.bss		: { *(.bss) }
+
+	. = ALIGN(PAGE_SIZE);
+	__page_pool = .;
+
+	.eh_frame	: { *(.eh_frame*) }
+}
diff --git a/loader/main.c b/loader/main.c
new file mode 100644
index 00000000..e2d76b80
--- /dev/null
+++ b/loader/main.c
@@ -0,0 +1,194 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
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
+#include <configs.h>
+#include <loader.h>
+#include <psci.h>
+#include <jailhouse/string.h>
+#include <jailhouse/types.h>
+#include <jailhouse/cell-config.h>
+#include <jailhouse/header.h>
+#include <jailhouse/hypercall.h>
+#include <generated/version.h>
+
+#define PSCI_POWER_STATE_TYPE_STANDBY           0
+#define PSCI_POWER_STATE_TYPE_POWER_DOWN        1
+
+#define PSCI_FN_NATIVE(version, name)   PSCI_##version##_FN64_##name
+
+static unsigned long call_smcc64(unsigned long fid, unsigned long a0,
+				 unsigned long a1, unsigned long a2,
+				 unsigned long a3, unsigned long a4,
+				 unsigned long a5, unsigned long *ret)
+{
+	register unsigned long x0 asm("x0") = fid;
+	register unsigned long x1 asm("x1") = a0;
+	register unsigned long x2 asm("x2") = a1;
+	register unsigned long x3 asm("x3") = a2;
+	register unsigned long x4 asm("x4") = a3;
+	register unsigned long x5 asm("x5") = a4;
+	register unsigned long x6 asm("x6") = a5;
+
+	asm volatile ("smc #0\n"
+		      : "+r" (x0), "+r" (x1), "+r" (x2), "+r" (x3),
+		      "+r" (x4), "+r" (x5), "+r" (x6)
+		      :
+		      : "x7", "x8", "x9", "x10", "x11", "x12",
+		      "x13", "x14", "x15", "x16", "x17" );
+
+	if (ret) {
+		ret[0] = x0;
+		ret[1] = x1;
+		ret[2] = x2;
+		ret[3] = x3;
+	}
+
+	return x0;
+}
+
+static int psci_cpu_on(unsigned long cpuid, unsigned long entry_point)
+{
+	int err;
+	u32 fn;
+
+	fn = 0xC4000003;
+	err = call_smcc64(fn, cpuid, entry_point, 0, 0, 0, 0, NULL);
+	return err;
+}
+
+static int psci_cpu_off(void)
+{
+	u32 fn;
+
+	fn = 0x84000002;
+	u32 state = PSCI_POWER_STATE_TYPE_POWER_DOWN <<
+		    PSCI_0_2_POWER_STATE_TYPE_SHIFT;
+
+	call_smcc64(fn, state, 0, 0, 0, 0, 0, NULL);
+
+	asm volatile("b .\r\n");
+
+	return 0;
+}
+
+extern void *el2_entry;
+extern void *__hyp_stub_vectors;
+
+struct jailhouse_header *header;
+struct jailhouse_system *config_header;
+struct jailhouse_system *config;
+struct jailhouse_memory *hv_mem;
+int i;
+static unsigned long hv_core_and_percpu_size;
+long max_cpus = 4;
+unsigned long config_size;
+void *hypervisor_mem;
+
+int entry(int);
+extern void gic_dist_init(void);
+
+/* Run in EL1 mode */
+static void enter_hypervisor(void *info, int cpu)
+{
+	struct jailhouse_header *header = info;
+	int (*entry)(unsigned int);
+
+	entry = header->entry + (unsigned long)hypervisor_mem;
+
+	entry(cpu);
+}
+
+int entry(int cpuid)
+{
+	/* Jump into Linux Kernel*/
+	void (*kernel_entry)(void *fdt_addr, void *res0, void *res1, void *res2);
+
+	/* TODO: refine */
+	if (cpuid & 0xff) {
+		enter_hypervisor(header, cpuid & 0xff);
+		/* Wait all initialized? */
+		/*asm volatile("1: wfi; b 1b\r\n");*/
+		asm volatile("wfi;\r\n");
+		psci_cpu_off();
+	}
+
+	header = (struct jailhouse_header *)JAILHOUSE_ADDR;
+	config_header = (struct jailhouse_system *)CELL0_CONF_ADDR;
+	hv_mem = &config_header->hypervisor_memory;
+
+	//max_cpus = get_max_cpus(config_header.root_cell.cpu_set_size, arg);
+	//
+	if (memcmp(header->signature, JAILHOUSE_SIGNATURE, sizeof(header->signature)) != 0)
+		asm volatile("b .\r\n");
+
+	hv_core_and_percpu_size = header->core_size +
+		max_cpus * header->percpu_size;
+
+	config_size = jailhouse_system_config_size(config_header);
+
+	if (hv_core_and_percpu_size >= hv_mem->size ||
+	    config_size >= hv_mem->size - hv_core_and_percpu_size)
+		asm volatile("b .\r\n");
+
+	hypervisor_mem = (void *)config_header->hypervisor_memory.phys_start;
+	/* Copy hypervisor's binary image at beginning of the memory region
+	 * and clear the rest to zero. */
+	memcpy(hypervisor_mem, header, header->console_page);
+	memset(hypervisor_mem + header->console_page, 0,
+	       hv_mem->size - header->console_page);
+
+	header = (struct jailhouse_header *)hypervisor_mem;
+	header->max_cpus = max_cpus;
+	header->arm_linux_hyp_vectors = (unsigned long long)__hyp_stub_vectors;
+	header->arm_linux_hyp_abi = HYP_STUB_ABI_OPCODE;
+
+	header->online_cpus = 4;
+
+	config = (struct jailhouse_system *)(hypervisor_mem + hv_core_and_percpu_size);
+	memcpy(config, config_header, config_size);
+
+	/* Init GIC */
+	gic_dist_init();
+
+	/* PSCI CPU ON */
+	for (i = 1; i < max_cpus; i++) {
+		psci_cpu_on(i, LOADER_ADDR);
+	}
+
+	/* Do we need to enable MMU to let CPU0 check CPU1/2/3/x done jailhouse initialization? */
+	/* TODO: refine */
+	enter_hypervisor(header, cpuid & 0xff);
+
+	/* Do we need to Wait Secondaries off? */
+	/* TODO: not needed? */
+	for (i = 1; i < max_cpus; i++) {
+		//jailhouse not support this.
+		//psci_cpu_kill(i);
+	}
+
+	asm volatile("sev;\r\n");
+
+	/* Create inmate cells */
+	/*asm volatile ("b .\r\n");*/
+	inmate_cell();
+
+	/* Add some logic to manage cpus for linux
+	 * need call psci_cpu_off for cpus not used by inmate cell
+	 */
+
+	kernel_entry = (void (*)(void *fdt_addr, void *res0, void *res1,void *res2))CELL0_INMATE_ADDR;
+
+	kernel_entry((void *)CELL0_FDT_ADDR, 0, 0, 0);
+
+	/* Not reach here */
+	return 0;
+}
diff --git a/loader/mmio.h b/loader/mmio.h
new file mode 100644
index 00000000..d50d20e7
--- /dev/null
+++ b/loader/mmio.h
@@ -0,0 +1,21 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
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
+static inline void writel(u32 value, void *address)
+{
+	mmio_write32(address, value);
+}
+
+static inline u32 readl(void *address)
+{
+	return mmio_read32(address);
+}
diff --git a/loader/psci.h b/loader/psci.h
new file mode 100644
index 00000000..2fcad1dd
--- /dev/null
+++ b/loader/psci.h
@@ -0,0 +1,119 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * ARM Power State and Coordination Interface (PSCI) header
+ *
+ * This header holds common PSCI defines and macros shared
+ * by: ARM kernel, ARM64 kernel, KVM ARM/ARM64 and user space.
+ *
+ * Copyright (C) 2014 Linaro Ltd.
+ * Author: Anup Patel <anup.patel@linaro.org>
+ */
+
+#ifndef _UAPI_LINUX_PSCI_H
+#define _UAPI_LINUX_PSCI_H
+
+/*
+ * PSCI v0.1 interface
+ *
+ * The PSCI v0.1 function numbers are implementation defined.
+ *
+ * Only PSCI return values such as: SUCCESS, NOT_SUPPORTED,
+ * INVALID_PARAMS, and DENIED defined below are applicable
+ * to PSCI v0.1.
+ */
+
+/* PSCI v0.2 interface */
+#define PSCI_0_2_FN_BASE			0x84000000
+#define PSCI_0_2_FN(n)				(PSCI_0_2_FN_BASE + (n))
+#define PSCI_0_2_64BIT				0x40000000
+#define PSCI_0_2_FN64_BASE			\
+					(PSCI_0_2_FN_BASE + PSCI_0_2_64BIT)
+#define PSCI_0_2_FN64(n)			(PSCI_0_2_FN64_BASE + (n))
+
+#define PSCI_0_2_FN_PSCI_VERSION		PSCI_0_2_FN(0)
+#define PSCI_0_2_FN_CPU_SUSPEND			PSCI_0_2_FN(1)
+#define PSCI_0_2_FN_CPU_OFF			PSCI_0_2_FN(2)
+#define PSCI_0_2_FN_CPU_ON			PSCI_0_2_FN(3)
+#define PSCI_0_2_FN_AFFINITY_INFO		PSCI_0_2_FN(4)
+#define PSCI_0_2_FN_MIGRATE			PSCI_0_2_FN(5)
+#define PSCI_0_2_FN_MIGRATE_INFO_TYPE		PSCI_0_2_FN(6)
+#define PSCI_0_2_FN_MIGRATE_INFO_UP_CPU		PSCI_0_2_FN(7)
+#define PSCI_0_2_FN_SYSTEM_OFF			PSCI_0_2_FN(8)
+#define PSCI_0_2_FN_SYSTEM_RESET		PSCI_0_2_FN(9)
+
+#define PSCI_0_2_FN64_CPU_SUSPEND		PSCI_0_2_FN64(1)
+#define PSCI_0_2_FN64_CPU_ON			PSCI_0_2_FN64(3)
+#define PSCI_0_2_FN64_AFFINITY_INFO		PSCI_0_2_FN64(4)
+#define PSCI_0_2_FN64_MIGRATE			PSCI_0_2_FN64(5)
+#define PSCI_0_2_FN64_MIGRATE_INFO_UP_CPU	PSCI_0_2_FN64(7)
+
+#define PSCI_1_0_FN_PSCI_FEATURES		PSCI_0_2_FN(10)
+#define PSCI_1_0_FN_SYSTEM_SUSPEND		PSCI_0_2_FN(14)
+#define PSCI_1_0_FN_SET_SUSPEND_MODE		PSCI_0_2_FN(15)
+#define PSCI_1_1_FN_SYSTEM_RESET2		PSCI_0_2_FN(18)
+
+#define PSCI_1_0_FN64_SYSTEM_SUSPEND		PSCI_0_2_FN64(14)
+#define PSCI_1_1_FN64_SYSTEM_RESET2		PSCI_0_2_FN64(18)
+
+/* PSCI v0.2 power state encoding for CPU_SUSPEND function */
+#define PSCI_0_2_POWER_STATE_ID_MASK		0xffff
+#define PSCI_0_2_POWER_STATE_ID_SHIFT		0
+#define PSCI_0_2_POWER_STATE_TYPE_SHIFT		16
+#define PSCI_0_2_POWER_STATE_TYPE_MASK		\
+				(0x1 << PSCI_0_2_POWER_STATE_TYPE_SHIFT)
+#define PSCI_0_2_POWER_STATE_AFFL_SHIFT		24
+#define PSCI_0_2_POWER_STATE_AFFL_MASK		\
+				(0x3 << PSCI_0_2_POWER_STATE_AFFL_SHIFT)
+
+/* PSCI extended power state encoding for CPU_SUSPEND function */
+#define PSCI_1_0_EXT_POWER_STATE_ID_MASK	0xfffffff
+#define PSCI_1_0_EXT_POWER_STATE_ID_SHIFT	0
+#define PSCI_1_0_EXT_POWER_STATE_TYPE_SHIFT	30
+#define PSCI_1_0_EXT_POWER_STATE_TYPE_MASK	\
+				(0x1 << PSCI_1_0_EXT_POWER_STATE_TYPE_SHIFT)
+
+/* PSCI v0.2 affinity level state returned by AFFINITY_INFO */
+#define PSCI_0_2_AFFINITY_LEVEL_ON		0
+#define PSCI_0_2_AFFINITY_LEVEL_OFF		1
+#define PSCI_0_2_AFFINITY_LEVEL_ON_PENDING	2
+
+/* PSCI v0.2 multicore support in Trusted OS returned by MIGRATE_INFO_TYPE */
+#define PSCI_0_2_TOS_UP_MIGRATE			0
+#define PSCI_0_2_TOS_UP_NO_MIGRATE		1
+#define PSCI_0_2_TOS_MP				2
+
+/* PSCI version decoding (independent of PSCI version) */
+#define PSCI_VERSION_MAJOR_SHIFT		16
+#define PSCI_VERSION_MINOR_MASK			\
+		((1U << PSCI_VERSION_MAJOR_SHIFT) - 1)
+#define PSCI_VERSION_MAJOR_MASK			~PSCI_VERSION_MINOR_MASK
+#define PSCI_VERSION_MAJOR(ver)			\
+		(((ver) & PSCI_VERSION_MAJOR_MASK) >> PSCI_VERSION_MAJOR_SHIFT)
+#define PSCI_VERSION_MINOR(ver)			\
+		((ver) & PSCI_VERSION_MINOR_MASK)
+#define PSCI_VERSION(maj, min)						\
+	((((maj) << PSCI_VERSION_MAJOR_SHIFT) & PSCI_VERSION_MAJOR_MASK) | \
+	 ((min) & PSCI_VERSION_MINOR_MASK))
+
+/* PSCI features decoding (>=1.0) */
+#define PSCI_1_0_FEATURES_CPU_SUSPEND_PF_SHIFT	1
+#define PSCI_1_0_FEATURES_CPU_SUSPEND_PF_MASK	\
+			(0x1 << PSCI_1_0_FEATURES_CPU_SUSPEND_PF_SHIFT)
+
+#define PSCI_1_0_OS_INITIATED			BIT(0)
+#define PSCI_1_0_SUSPEND_MODE_PC		0
+#define PSCI_1_0_SUSPEND_MODE_OSI		1
+
+/* PSCI return values (inclusive of all PSCI versions) */
+#define PSCI_RET_SUCCESS			0
+#define PSCI_RET_NOT_SUPPORTED			-1
+#define PSCI_RET_INVALID_PARAMS			-2
+#define PSCI_RET_DENIED				-3
+#define PSCI_RET_ALREADY_ON			-4
+#define PSCI_RET_ON_PENDING			-5
+#define PSCI_RET_INTERNAL_FAILURE		-6
+#define PSCI_RET_NOT_PRESENT			-7
+#define PSCI_RET_DISABLED			-8
+#define PSCI_RET_INVALID_ADDRESS		-9
+
+#endif /* _UAPI_LINUX_PSCI_H */
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200305093950.848-3-peng.fan%40nxp.com.
