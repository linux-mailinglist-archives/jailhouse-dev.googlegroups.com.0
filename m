Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBB477ZPXQKGQEX4IOG7Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23b.google.com (mail-lj1-x23b.google.com [IPv6:2a00:1450:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DB411DC63
	for <lists+jailhouse-dev@lfdr.de>; Fri, 13 Dec 2019 04:05:23 +0100 (CET)
Received: by mail-lj1-x23b.google.com with SMTP id d14sf289399ljg.17
        for <lists+jailhouse-dev@lfdr.de>; Thu, 12 Dec 2019 19:05:23 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1576206323; cv=pass;
        d=google.com; s=arc-20160816;
        b=mNKgrAD5KPL0S34QCBJtdUTAtwqHbQMfP8Ps5bywXUIZdhw9D8hrHEZku+MxesLGkk
         bjY5Qjor+voAWr8Lb6cX/DKFEF6Zc7EqnumWdN96tOb7+bWowDd68xPMfjU5aWaEliSB
         p3wWpTtbYJo5WJCkMZ8SLYQhqp4wq8Ihv1SqpsnT0oVQjX3K+3IoaJmjqr8PHAsPZ3u+
         ESimi4SPU8oLHbuTF36kCD9+yY+fHvX+sT9WT453Im5+7pDVceE5EuezG+RZ0nlPR3Xe
         BJXCDEPp0L45CCPWwkNX+rWIPUwaFFEY5KOPuv3AvIj0NqnapRPNTOc/n6BFoEnl8oUd
         xZ4A==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:sender:dkim-signature;
        bh=KqeOcRhFdjjeuJ9xshVtfLhhgKkY1E2uoBUXSUu1Qfc=;
        b=IrgAnPlrpxXEIqPPdgl0cKfYxbRllAZgIL9UDfUOqimK4HKISf2yzBAqxGZdzTSICD
         zbBrvTtTL4F7tpLJowLw0u7Xoydy95I/PkDxXdwKX0TBPuTX+I8uWBB5yUAe2WFWtTwi
         DnCBQ0BkZ8aYvohHKdKderQ6PgH6U5AnuUxgBrUFBs5GPqsOv8/9Buy4/btPq4GhuJP+
         lnMZAsgd3CrEXDtcZHIvem4uyBLUPI5k4LqSo39mQEs+42ETstoSXvZPF/Yjx4NrZV0T
         sqTgm3x5J2953MRrR86E+ANkD/tjGKUeBcw0cAunIR+rhFJQiK9EENoUqoPXmns90FC0
         cMBA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=REGdD3St;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.3.89 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=KqeOcRhFdjjeuJ9xshVtfLhhgKkY1E2uoBUXSUu1Qfc=;
        b=J+h0rZP2JbPRROKOYhJGDveaIoFKtF11l0ydkB/uh2MX4GueKynarY1ITqiDQxwKrt
         GuPJfPYq9Ncl6nG0YhaTdTiUnkSZ2fuFd3tLULaVMgaybLVHK6+pLhKKakKJrjVs4a6a
         ZJ/H+7/qAGd6tX6ibJuibA/yGDWFplwRgYYPOfrMn9u/5fRikIXozYrD1VgXxb7vLpZX
         qi4EmA4bLGRqIiz+6VCO83Ld3Ou1eIIDRulA5v0oUIi4mx/wfM6Vdg8DKAew2H0sXtbj
         lz4/9oxNBROvhR/Lt6hCQiW9gp/3UiKBbLa4Ac2lwyQsyxH3iyEMhNLjBIphRgjUimqs
         cHow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=KqeOcRhFdjjeuJ9xshVtfLhhgKkY1E2uoBUXSUu1Qfc=;
        b=NrY7pCwdDcXb6DEq4P0HBAcG0GfvFS2BRtcnbWQl3Qso0mw6NVh62Czy5iezZxYpCF
         DIBDvlOJrvbT8WRAFKo+ZGGxSOsWRRm1Nf28st6yzeyvwFm0oA1/6hEawArjA1uyoaKX
         HwSWdSEci/QLiIEl/2UgsqmX1o8zCBskEqKtou32M12Sygzxej+CrstT6JeyfKCiTCDD
         okEN6bDXEH9k93PsWWf/F3PWBIXXP+kbGxXP6bqmCFerBMHq4unTxrhjEPdx7Nh5regq
         b2a6HpcpFC950PQTVj3LmH0Da3tIX4I99sAVfgZCxPJW75puDIaRCvhsL7r90p90DFci
         p/dw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVaGRaS760iVqsjtH87447R1PF/ifxd0QmaXMzJRVJ7icfe5tKX
	/c5etf1v1Qtbpk2mr1JgDqE=
X-Google-Smtp-Source: APXvYqy1R2/afVE9e0hSrKvXXAkqQm38SG/VOxbtESJa/IibKWNHuhaS05WtIr23ZymVb5+igQQoxQ==
X-Received: by 2002:a05:651c:104:: with SMTP id a4mr8037829ljb.104.1576206323235;
        Thu, 12 Dec 2019 19:05:23 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:6a05:: with SMTP id f5ls1104663ljc.2.gmail; Thu, 12 Dec
 2019 19:05:22 -0800 (PST)
X-Received: by 2002:a2e:585e:: with SMTP id x30mr8302976ljd.141.1576206322603;
        Thu, 12 Dec 2019 19:05:22 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1576206322; cv=pass;
        d=google.com; s=arc-20160816;
        b=0W0Sex4mYeDi7YX0N62tJFDglqDm2P0j/N8wT40Qy9YXjwqc3QzP3OfGf85ikF6+GG
         eVeH+1Y+7yeulkk2EOQVdf/z4Rhm+Pz/GjbOTU4gB/885fEECdBzpxnV78wb4F+tKKRG
         PU+F9peHCQUyFgBSp4cFaRnUwiD5p1xiBwBao6Ad3Vo9b2X+4TPD0O+z4wWz9NyAds3s
         TVOSpmv8MEFCxlRfc5XcpGqzJKImsnHg+DtTtq1fJsMa+p7nabKZG2cLPDqABFTF4qe6
         G1qLfp0NCnFbC1eqYQcjbhwB176dkZA+grbfPKCnOGP/O8xqkMZzlnrdEhE/1OdsgKIB
         gPpQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=GgAmowXkcfubxz+JuEwPu8ZyMRV9dnWGnriwcDU+aew=;
        b=Vzt8aaw4U1/aOHI9WxBbFEw6xafpxQCgNhA/hXRu1pC4kxFQeAdGuGca/Tw33QpEcP
         yZKtokC0RSVwiOJ71sT63A6qkFfAkj0GoSgPn7RpHLKad87oDS3bNRCpeAv0e5AKQ7zn
         hZfncx9sFZS/Zp16f8eezuRciNk+n1ZFD7u0KgVmXxelMKSAsqvBHzliS2Yh5dC7FnfV
         EWU9+r2WUpjqV7ZXbC+sSWDcMXvJebyvvndW7AaUXlV90J+fdZlaJgXg67HMRUqV5zYn
         stt3wb2lxqV2YI2BG5syQkDt16rXhpewhezjehtCZdZG0X3TpEnDSZQAzO3Az67T13Y3
         i+ZQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=REGdD3St;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.3.89 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (mail-eopbgr30089.outbound.protection.outlook.com. [40.107.3.89])
        by gmr-mx.google.com with ESMTPS id x5si295950ljh.5.2019.12.12.19.05.21
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 Dec 2019 19:05:21 -0800 (PST)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.3.89 as permitted sender) client-ip=40.107.3.89;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lKak3TAvCbnGO/1u54V/l2RFTtLHocDTOzM/sCxnp4/70zhF28jbZ1SfuJkqsACtXnURYpg9CcDgrFQTzlJE6kEA4o87ZfHnlbpqjFFruM31JNthIWRR6hyJlm8sB8f54Wap1wPx53Z6Exutqg2NF1pBdQ91e7YihtCpNSUrvzANbLm/OuOJuKajllTiVwVXpXoDbx/LNa70IY1qYzaW5kfMzS1nff0N050SIfNPvdiX/zjJIiKEjPf5FD36jiBmkrDbEy8TPVTWF+O2j53/InDNtAf4uJ+dsZMekFiu8GBJwQfpGffbYyr1Y+DAHT5dQHUOBpPHW8RhIyWy+jubUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GgAmowXkcfubxz+JuEwPu8ZyMRV9dnWGnriwcDU+aew=;
 b=XhUspzpVMxamv+R50cjM+/EdoWSrNr+XpHV/91WB2kwCK+Lv771rXQmqmHyoD6j7WdvAXsADSu/nM9ZZs6a4HXzzlIX0m4xjT0DXDzHCvpAzPo6Z5R/V6jajTWEjEaJjSFG0p31azfRsyRSgIbV4usyryIs5nqwugCYMJN+keUutGc96R1Z8v7pnBv3Jjklzv2RvS+Pkea639/0xw/xYlPJG2onmeEnztf/TajmlL0Um+ApBTg9DAlTMORPCpBuWe8syqEWWZ7tWmloA/8En4x+Rk24wh/g4NGMau0CIco9IzzyavrIer+bt3XLFSXw9ju3unE3UKCgkAF2eVBAVaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com (52.135.147.15) by
 AM0PR04MB7123.eurprd04.prod.outlook.com (10.186.129.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.16; Fri, 13 Dec 2019 03:05:20 +0000
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::505:87e7:6b49:3d29]) by AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::505:87e7:6b49:3d29%7]) with mapi id 15.20.2538.017; Fri, 13 Dec 2019
 03:05:20 +0000
From: Peng Fan <peng.fan@nxp.com>
To: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
	"jan.kiszka@siemens.com" <jan.kiszka@siemens.com>
CC: Alice Guo <alice.guo@nxp.com>, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 2/2] arm: irqchip: fix memory barrier usage
Thread-Topic: [PATCH 2/2] arm: irqchip: fix memory barrier usage
Thread-Index: AQHVsWIncu+svSN0AUKz5pHUEDyf+g==
Date: Fri, 13 Dec 2019 03:05:19 +0000
Message-ID: <20191213032352.8915-2-peng.fan@nxp.com>
References: <20191213032352.8915-1-peng.fan@nxp.com>
In-Reply-To: <20191213032352.8915-1-peng.fan@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.16.4
x-clientproxiedby: HK2PR0401CA0018.apcprd04.prod.outlook.com
 (2603:1096:202:2::28) To AM0PR04MB4481.eurprd04.prod.outlook.com
 (2603:10a6:208:70::15)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 6605bed4-29ac-4cf9-a025-08d77f794966
x-ms-traffictypediagnostic: AM0PR04MB7123:|AM0PR04MB7123:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR04MB7123104176E66619DD7BE36988540@AM0PR04MB7123.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:612;
x-forefront-prvs: 0250B840C1
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(136003)(39860400002)(376002)(396003)(346002)(199004)(189003)(8676002)(186003)(8936002)(316002)(26005)(81166006)(5660300002)(54906003)(64756008)(66556008)(66446008)(66946007)(6486002)(66476007)(1076003)(110136005)(2906002)(4326008)(44832011)(71200400001)(52116002)(478600001)(36756003)(81156014)(6512007)(6506007)(86362001)(2616005);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB7123;H:AM0PR04MB4481.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tq6747nyvbedsM4dHFWIIxSZ+Il43rV4CMKmsPvgU9DxbGlR7zF6o48MXGKrkOBBOh1V/kUH3wIFo5yFbdmjaXrCyAlHK40Ovr7vUpPyD/K9NI2dQXox3vEKixDOVQmXUCS9Q4HcIGNweuVUEPb0AjL4DKDHdRpA4N/60kP6NBMvqEXUu9PKXAinmyqyZP4xd9M+5XQWyocvdGhdlEHwev5RUp2d13z6a8Jo9Ez9S74zTF7abiTxqczVwnmgXaL1UW3QB64u81suL7psuBMdNdluYL4HnWnC17jy6VQo429RQdgUG22+tpYdDJIGIEWOAPuXHjfrCrK0tocxEi2/jqfdtuVgSAvazu+gSAJRJicW5GN2ypeNSQTQYP6AEecUsEn4ojo7hVcqaMWE8VK3IALLU9UMp3ay2b354uDd22fy6TV0Kuzr2cXdUwp3jVrv
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6605bed4-29ac-4cf9-a025-08d77f794966
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2019 03:05:19.9335
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Qz6TnaqnTg9XoZnQR8KLUi0vPEBHWE2hwGB6Mlj/n5R4cU8qrE7H4oBt0FRhZ5tkCZJzYDUgJHyqXQ4ajkTkog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7123
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=REGdD3St;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.3.89 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

spin_unlock implies memory barrier, so no need explicit memory_barrier
when enqueue irq. When irqchip_inject_pending, need a explicit
memory_barrier after updating pending->header to make it
visible to enqueue.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 hypervisor/arch/arm-common/irqchip.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/hypervisor/arch/arm-common/irqchip.c b/hypervisor/arch/arm-common/irqchip.c
index 1c881b64..5abf1c37 100644
--- a/hypervisor/arch/arm-common/irqchip.c
+++ b/hypervisor/arch/arm-common/irqchip.c
@@ -247,13 +247,12 @@ void irqchip_set_pending(struct public_per_cpu *cpu_public, u16 irq_id)
 		pending->irqs[pending->tail] = irq_id;
 		pending->sender[pending->tail] = sender;
 		pending->tail = new_tail;
-		/*
-		 * Make the change to pending_irqs.tail visible before the
-		 * caller sends SGI_INJECT.
-		 */
-		memory_barrier();
 	}
 
+	/*
+	 * spin_unlock will make the change to pending_irqs.tail and
+	 * entry content visible before the caller sends SGI_INJECT.
+	 */
 	spin_unlock(&pending->lock);
 
 	/*
@@ -293,6 +292,9 @@ void irqchip_inject_pending(void)
 		}
 
 		pending->head = (pending->head + 1) % MAX_PENDING_IRQS;
+
+		/* Make the change to pending->head visible to enqueue. */
+		memory_barrier();
 	}
 
 	/*
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20191213032352.8915-2-peng.fan%40nxp.com.
