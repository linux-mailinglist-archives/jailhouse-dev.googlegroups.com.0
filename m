Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBB3UHQPZQKGQEJK2BPEA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1D717A21D
	for <lists+jailhouse-dev@lfdr.de>; Thu,  5 Mar 2020 10:18:39 +0100 (CET)
Received: by mail-wr1-x440.google.com with SMTP id q18sf2055818wrw.5
        for <lists+jailhouse-dev@lfdr.de>; Thu, 05 Mar 2020 01:18:39 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1583399919; cv=pass;
        d=google.com; s=arc-20160816;
        b=rWdr5igJOejNfHvEwWA7LIN1e4yljUHdUEAgcHRhtgrXt2T82BtiTEiO4tPDy9Ee9G
         5Ct4m4x7zZtufenib2tWw/7mp/ffpigces85fg2eGaHLuqgn7GV/HHmMye2XRk29t7jB
         VClOM5JD324c4R6qi5TErOiA78qWgClrTOuETNd7+YS50Q+UAYF9jv4+kZnNEBqDd4+Q
         dNhSbDUs4+9Q1NcX4JgofKO42vo8vTcUE1y2QzKDWAoaVrReI/a9JZykybfGGlIvtjwz
         6J//FhpFJzyz303Uur7ncYPQ+baPo7cvS2dFhrtzDZWGxsuBpO0EyZ9lt88TPmRLgBbo
         rfCA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=sFokvQ9tJoxSJKn0WWiOqW1t/miSPtPmGmLZihn+s+E=;
        b=0KfdaPypV9JQukBmN7rXNVqgRNUZkjKM6wWEat8h2/WabJS/hJkw4wbrcZotd55syv
         Bf1hk6fR22BrGIsCidOlFIShWbDjMNG3/xGmNnEK+vF0I8ovqyQhcm/XzKbZJUiRojbt
         IdVTDm9MFNt32YI42UaUZ0IiHl9aUdXkk4+VbTagD96l/PCQ3E+lBnVY3v0AZP+RiR0S
         JMCBpb2bNY1BuUb2V4qksW2JFr/95ncGU1iqYW70S0AUGK3LfTd/dMAICffMU8/tz9LU
         u0nNwzv2SDdHs/emUV43ncNxIq10ahG+8CFNoORB39CDmX1hkbzOYJw6RCLRxM/usEVi
         sSYA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b="LOw/yO1R";
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.7.53 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=sFokvQ9tJoxSJKn0WWiOqW1t/miSPtPmGmLZihn+s+E=;
        b=SSD0YT9hTID+7/WfxY4e4FsxqB4yajKV+K5nKa4WbywvwcbDMU15cJnV/zzQjhSuyf
         4Js7bqKopCl+Y3fC+Y2SWGubMcdilk6KlFTKnO6EWXEfvDkayNYLVTsFrKmBIrX4VGNX
         ewpKe5/qS28aU8AgBYaWlwGdvvE5NTjffbWkmZISi93clCHHe/XD0En8Am8fTs09PssL
         NvoEEGKQj36UK41JVocFfNULje4Zo597tpZXWEDRiAC21ys+8RKW18RBz7bKDiPEbxBa
         qfyUJRUHuK1gbHhVZUr0I1ouTQfM0h71YsHHe/NbBodXuc0usNybt6Kje2IyxzyMNMv1
         0sUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=sFokvQ9tJoxSJKn0WWiOqW1t/miSPtPmGmLZihn+s+E=;
        b=P0sqCLlaGC5Ryxe56Uap5erk6FM2R3FAnisw3MmRXTz2Ja4oVckf5BRifPecr1CHRU
         6O2y2mrHHN9s2QedQ7+hteoH45sU6s0YBZIcnnRctYwMNUB8K5Bb7Y4mxKvjdFV9ESSn
         ZCN/8yLpN3cTZxzEsryHTCLa4uEs8qYYcV/IcW8PjHIylbeWfRQhWtzSZ4iSYgNdIIkh
         /UD1WK3ZYYlZHl75Wem3wt5d1eUFjRmgOKRgbh+7aKDhKJmA7YODgpAxTqdJknl1fe6B
         Jyd/WiytOBxhxWaO+UYQ7BIKspZkzuFTozrwagK4iSXTxbE+aXuow1YTL0pTeFlBUh+2
         AzDQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ2pGei9Zcdnu0IT/PEon3P3EAe7Nsw3o/7RWjKjqMC3/bqvlHoc
	w4lPjhA/lWaf66mtScefvnY=
X-Google-Smtp-Source: ADFU+vufGtGb4R/u6MBn9iKDl6alpX4DQY5od0rdmR7JPNYz3C0E6nbjSDVHMZ4RZ7pn0bTZn8VNNA==
X-Received: by 2002:adf:e94c:: with SMTP id m12mr9589308wrn.71.1583399919025;
        Thu, 05 Mar 2020 01:18:39 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:cb93:: with SMTP id m19ls637050wmi.1.canary-gmail; Thu,
 05 Mar 2020 01:18:38 -0800 (PST)
X-Received: by 2002:a7b:c957:: with SMTP id i23mr8589995wml.174.1583399918122;
        Thu, 05 Mar 2020 01:18:38 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1583399918; cv=pass;
        d=google.com; s=arc-20160816;
        b=gycuUV6RAN4fnISjqBbyp4w2bQV6JETOmb9SSBFXbjVprmNCy/XsQDriwOZFKJhYwU
         7Irt/UU82AnA33eZe3RQWa480BhbAB33d9RlniVM7hTaUsPZJ4fxToLboqP4AAefUDPB
         WnOtrOZONbDf0p9206j9Ek0Pc3VR/7QTpc6sL3jVCNH0kSThvgULYQDx2A0+aeX4Ejpw
         6uIfxNhTxCj8AuMcYIMKk1ubpd3VPNAxemav7ZXyCH4OCk7BKMsSKAWFRkTAcwQhoFYF
         qRQf7VmeBySIjKELyA0KTrACQfYLXJKcD73B7yiXjRVVvepP7DdQ+LHUILHLGf2j8x/p
         nuMw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=8TMC3R7Bn5dyNiz21yP5vV0NEm4nmflqX98CaDhe2AI=;
        b=Ronvn86e4MlDj1kBYJt3ezJ4LgO/vny3uZPlMneze8FxCM8q78K653eAnrm90a+6Zf
         L0qLXgY8BMuhjprb0Pi4J6gdraznZ0WlA9at5dEHqzlwC7GGdlK7JdbMkfZMY2Ggj/8P
         iH7ZgoR2Gm5yWnMPOhA5GowKHUO9HnosKUNjIbyq35iy06fyGFjSGJO5D4kRyN+2u+ru
         LeucCKaSOmnfd9Jayn/DyQZ18o1/bbrukpk3xyZkLY7WXEIXKpJxEi1wTZoecBGodzw1
         B0qm1h0t7kCRu20eptC6Kq+gCbqmWHisWcZkvfHawWr39GHMwwICR7LSwoayVPBYytIu
         gR7Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b="LOw/yO1R";
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.7.53 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70053.outbound.protection.outlook.com. [40.107.7.53])
        by gmr-mx.google.com with ESMTPS id m2si333429wmi.3.2020.03.05.01.18.37
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Mar 2020 01:18:37 -0800 (PST)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.7.53 as permitted sender) client-ip=40.107.7.53;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GKqp8ONtFonh+PlPEj/zdykK1j/M+lg//7sm6Qydpji4pXWWslINe5Y3I3Uw96DIXGqZTmFvXbZmXJvpwP3arxk4P8G8r4KNIDYqsLTRkZS9qWYgU6KZXGIriEPzRXh8pULmmaAJuH0AmlpBbqegZrP1MzufJhd0Y160D71y7Nrhq7alxduRJgoRQWipOlUABe7HS4FE//AWAgj/xf5fZ0AugtZ09SazK2/M2/lcpJUOzr89JBbvSUjJJ5a2Nd0xoMyVNfshJ2z4zxvNyQIFFwrWKsO1UiXKquAR/EAOxd/UMI5Bqam/wFGzrlJb3Jy7WhNGFGQNr9BhNGqyltu/cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8TMC3R7Bn5dyNiz21yP5vV0NEm4nmflqX98CaDhe2AI=;
 b=X05s0agGz9SWMH7+aoqCf21rcNU0o0cLiThQjKi/fCFm6Gsvtjbj7rJK96/ijhJdbGaUDAjYpE8pf/l/QruNoyNXgZcTt2FG1jBFXcwKrHgx4wfTOn0yR39qwj0OAgjpW76ji5tVgXvDZUD9fodCobexdvgk33M7itELJgbep402SZpyc4IU+LRHjxwR12LcwERlQIVtpQw3wJ7LgilgJOLQCeHfkftdyIG+JAjezWlYD7K0gd8tBMbiqHs6eFlVvMYyTw9d9ait3naa+48i5VvMemHJOglF80lxmZ5WQLZHsG/1JtIg8FxpMqy4/4sULbJ37wCye7R3w8cwQnyn1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com (52.135.147.15) by
 AM0PR04MB5442.eurprd04.prod.outlook.com (20.178.116.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.18; Thu, 5 Mar 2020 09:18:37 +0000
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::91e2:17:b3f4:d422]) by AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::91e2:17:b3f4:d422%3]) with mapi id 15.20.2772.019; Thu, 5 Mar 2020
 09:18:37 +0000
From: peng.fan@nxp.com
To: jailhouse-dev@googlegroups.com
Cc: alice.guo@nxp.com,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 1/2] cell-config: reserve an entry to align jailhouse_system
Date: Thu,  5 Mar 2020 17:39:49 +0800
Message-Id: <20200305093950.848-2-peng.fan@nxp.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200305093950.848-1-peng.fan@nxp.com>
References: <20200305093950.848-1-peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: SG2P153CA0014.APCP153.PROD.OUTLOOK.COM (2603:1096::24) To
 AM0PR04MB4481.eurprd04.prod.outlook.com (2603:10a6:208:70::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-ljuv.ap.freescale.net (119.31.174.71) by SG2P153CA0014.APCP153.PROD.OUTLOOK.COM (2603:1096::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.1 via Frontend Transport; Thu, 5 Mar 2020 09:18:35 +0000
X-Mailer: git-send-email 2.16.4
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 83f52ff2-c4bc-4806-eabd-08d7c0e62f6e
X-MS-TrafficTypeDiagnostic: AM0PR04MB5442:|AM0PR04MB5442:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB54429A80B105885B52108AFC88E20@AM0PR04MB5442.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:854;
X-Forefront-PRVS: 03333C607F
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(4636009)(376002)(366004)(136003)(39860400002)(346002)(396003)(189003)(199004)(1076003)(8676002)(2906002)(81166006)(8936002)(36756003)(66556008)(66476007)(66946007)(6916009)(478600001)(81156014)(4326008)(5660300002)(52116002)(6512007)(86362001)(26005)(9686003)(16526019)(4744005)(186003)(2616005)(6506007)(956004)(6486002)(6666004)(316002);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB5442;H:AM0PR04MB4481.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
Received-SPF: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: imXBaFk4w4AASmgv4n7Bw7aEIfR5cUK5FUybEXQr2Wa0Vdoh/JrhgSNkquiOIi5AfYHb+IlpTKRuLmOmz5vIYqATKu1XHVhnk+bR2p39YPx4R8rMOOQCj6bm1xTTjAzBbKw88vNeALH1CmgCnlS5xRRPD6MLvdEbnIYVsNeppUDeOIMv0YeCG1VFmz52rk3mPRbuxPzcZf/j14d/SZ0R5snsbWba5d/5qUIkso33Tt3g9oBfyott4iZ4kpPq79/UfqI6aZ8xHCzwWBj8rGbRTd25DB6f1IxQqjb+JP98O3KDpXO9Dkmg8Ji6CYCUeX2WwyiB/4CRLu+ADzhl7FKPGZ4lzWLwNzazA/znBQ41mc1WST7TRkY7cBsF1dtP2NTrweRE1Wa/JKpcWYgKPa6vXU+ijXaeL6b93vjyyumlu5BAwCcVQw+kFNpgtEva+d2G
X-MS-Exchange-AntiSpam-MessageData: g1IZiX4N5gJ3qLj7z4bVpcyOeN7OEQ4XEUJ99r7HFTxh1k+Vk8PIiJ7Cec6G/DunVzYs2xf7+4EWIWla3Q0jbdi0YUDtTaXef3OoM7bnuQEU4Re8HSxUm8gMz7Cp9FFJwqpyp+w9lYpTygVFc0/ypg==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83f52ff2-c4bc-4806-eabd-08d7c0e62f6e
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2020 09:18:37.0501
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dg1kvo6f4crt+8+BFzcXWMndG5ungLfwvEofyrLA3DeKc8j1B/pIyi5v5oTve5UJWd/a0fjpch1xR81qy5vmkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5442
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b="LOw/yO1R";       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.7.53 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 include/jailhouse/cell-config.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
index 30ec5d06..86aed42a 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -297,6 +297,7 @@ struct jailhouse_system {
 	char signature[6];
 	__u16 revision;
 	__u32 flags;
+	__u32 reserved;
 
 	/** Jailhouse's location in memory */
 	struct jailhouse_memory hypervisor_memory;
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200305093950.848-2-peng.fan%40nxp.com.
