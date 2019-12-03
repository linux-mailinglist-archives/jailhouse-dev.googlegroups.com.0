Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBB3FYTDXQKGQEU4NNYWI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x140.google.com (mail-lf1-x140.google.com [IPv6:2a00:1450:4864:20::140])
	by mail.lfdr.de (Postfix) with ESMTPS id E043310F9CF
	for <lists+jailhouse-dev@lfdr.de>; Tue,  3 Dec 2019 09:27:24 +0100 (CET)
Received: by mail-lf1-x140.google.com with SMTP id q17sf683208lfo.14
        for <lists+jailhouse-dev@lfdr.de>; Tue, 03 Dec 2019 00:27:24 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1575361644; cv=pass;
        d=google.com; s=arc-20160816;
        b=cOun23BW5NpHn4V82abyqokaL1/KA7wnyAiLkvfEd5eTQJkzKm/QvPPw1NNSA69HLK
         jkajXiWKOt1Tu5B9KX4N4fmaEHEHzzTcJZwhtGtdo0GnhaX34lfAVm+o2gjtufYDW79T
         5QejCy01jYC4ZVkfS1h3LT6zPjsB9AV9dzun/SNwDECH27WFWsBfD/2LPx8EoAF2Da+x
         QRu/3KH1dkHLScZp0WXZaegVOdCarlHk8JxMoqFEYHQMmNQwv5zrUW0iwQEBY0KFivq4
         RYTYmEC021DdvfjlmVYEL0SF8MytxCZDIut0uGO6UqfrKML1BnyK2HQ/L+/OiNoNGZl4
         AE1Q==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:sender:dkim-signature;
        bh=V+vUtWNJlqh4evBYoEbt+Zg01QdpvLYqdhIOIZSzc0A=;
        b=NhNZ2w1KDF1UEGmNsPYhBHFdDIHtFu6g6A/ltxtwqp6nhMDKyuVrqW+7AjbULxesep
         FdC1ubYgQ7ehS6QdgGeV56FdDNIKJM5WNdbWX5qALn00AzYjEg2BKZgd8YNfZs3GbPA8
         0Bc1duSdU94hfN7N08J/m4SID9g9j8gCSvxHa7DXsAijMaKkgsZSZFiQGivsUu9EMMPP
         cweStfOTS8SW+Sth9II5flL3XvDJ89FTgd0oW/JfXf3tEd06swZ2qdjv3HlpIF2V+7bT
         vj36sW4pU+85kNUqVSaA0r6W/alN/xt1mS2cP3pJoYb5Y5rY0oCLW0E4S/BLQDm1MKKk
         65eQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b="rzzPrv/E";
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.0.77 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=V+vUtWNJlqh4evBYoEbt+Zg01QdpvLYqdhIOIZSzc0A=;
        b=Qciite9C2lAfltRycBSD+i18bY2ik59SsTnYNA9rwe+ave+v3nqBRLbZVSALF9YA2K
         2BcVVDk01aS5kdh4pqifTtZm8YoV+kpdQ9i3qd0qWrdw6L4g0LyHx6ZDAv+Nbb/TDDFn
         hGV4nmLYGa28+57dTioS1Zd59grqu7fQDbKT1wmfvmo/TlQZJRKlHJd2LM046JlnsJoQ
         PVCSV8ReRvkGHOA8Eh1VbVqiibNIDQyY3o/VcmZLedFRZeE32w7qel4N5YT1SfcLLzvA
         u4sLWdRFVpKQqGfOT8BYO9chF8aOi2bO/VZrWyVJ3/BBX/iDvscxJaGd9SUtvJq0GdNH
         ytJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=V+vUtWNJlqh4evBYoEbt+Zg01QdpvLYqdhIOIZSzc0A=;
        b=sn67tDayyiWb7h5oReKhJSTTTLV33rvtayZhUUZo2JCIbzAmWKUQQUY4wmcTH1Ax9Y
         Xs/sHB7JJHFudyL0vYURMrkTeEqsSsowcD9TOavKZlYiOAA+LTCcLwBqF+SFlDPEpfnO
         AC18lN30xOB2dQuZ9gfAb70zcmr/vNKcL3QwEFf3+uElsZdCJmRz8K82hY1/29Gjv3pF
         QdyaWsYr6mwoftPePqImkq8u9+Bw08jnLuPuU9XJPJEEsBMwo564v9sV/U0M/445kCkO
         C7BfwkS8Ybc4GHy8pNtxN1Hwb3J3DD7yIpa6dgkgvz6F54jhX62JM5s8PhYNEOWKCWf2
         UBdw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU3HTvi3rVaNOM5lCdhZcZamy94dyL68wp3RArTg86XBMLWNrGG
	gJLTjsffiN7dKUs3nbKYc20=
X-Google-Smtp-Source: APXvYqwFCv6ea1XaC55yX2usjwANaxxS4FYrk8TN+2Mva4EFRHe9lYnB9LW1KjKUg1hXbkLQEZoJ0Q==
X-Received: by 2002:a19:84d:: with SMTP id 74mr1922508lfi.122.1575361644504;
        Tue, 03 Dec 2019 00:27:24 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9912:: with SMTP id v18ls355815lji.5.gmail; Tue, 03 Dec
 2019 00:27:23 -0800 (PST)
X-Received: by 2002:a2e:9110:: with SMTP id m16mr1810851ljg.140.1575361643722;
        Tue, 03 Dec 2019 00:27:23 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1575361643; cv=pass;
        d=google.com; s=arc-20160816;
        b=TahIErHiRNJwq81Ti80gZEYHqwPMeBWCyPMi9JDGx2d8kzWJnzZm84EmlcZbuUqxtU
         kUYdpDafrciqhfYmfYR9117FZkxD0EQ9ukNdvYnGBWddiUMa7w636s1c2ViKghlI8bcp
         A+XLUBMvHBgQYsjpz/ZRsnVU2D9dm2pjLS1CiKHDPFhK/pQa6FOegXHo7e0cqeFYBBF3
         FCf2sHZyvXTgvg2AhghO1jOquZjORpr5FEjWYEmXaSNwYfB9OEl6PkXMscd30EtZXrum
         KxexlRWed+QGS1dbwfIHCl5mcTSO4k1NZjqYB8Cjpw08ZRgM/ruIkqfPQq1d79Gxzb1/
         x4aA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=+mmAnBsvSmf0wWG4eFLXbd2RLWI/8zd7wi8DV2m1cTk=;
        b=TbOnTedNZDZuqszSe3E4DazBMu3/O25pnWPis6QH2gVURGEnPw3SGNEiLiBp76Nyja
         fa04uI+1b34dc8hewotTmd3ZrfNq1R2tQbH9kuecHZGu91BOGZjDNIyScENoV+uaTbFK
         GavcMsNz91J9iZ55d4PVxNVhcIFGDEJCvTw0/kDSGcAuJHrAMTUbHZd4CYJ3vqktuqdp
         FW5QmA0a6tkG5P7DeUfTmVObO8adI9lkbr5+cui7sGTmcDTiRKVMiEMd1jwN2a3/f1hT
         0tUgQfwzf3PUX2qolc/HSAW3pr71gCQVPbJsshcQh9WOWxZLU+6COIzsxF576pMEr47t
         qs+A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b="rzzPrv/E";
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.0.77 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (mail-eopbgr00077.outbound.protection.outlook.com. [40.107.0.77])
        by gmr-mx.google.com with ESMTPS id t3si73397ljj.1.2019.12.03.00.27.23
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Dec 2019 00:27:23 -0800 (PST)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.0.77 as permitted sender) client-ip=40.107.0.77;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gaRYKVhLkVon/OJmfY8VMJ+wtKlMp4kUd1o4KGSqGc/pAG5e7g4/zTIlt4CnpWnlPKWFC2YluLvF2CSXPP7QLNdp+IwljG3N18em6biSJMKbWwm5mcS2oVHgxMfUIYlfNWkcuJzPGRdf3B6lHupAxo03ru7QsHG7T5vHP4RbptIKItApfCKAsSW7ChdRhXca0MKhKoWjN5nSgztSMY2us/eavLxS+hOWMBkY+8SJt3FIh7/verj7hqQbineZryxNqEECj66XlTnUDvift3WGoJ36/9Tz5+b8nZNYBKKbaB3krzgMrTYxHsMp34OUSW5Tiw1mzJZ8GFXcSWx5rvSLzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+mmAnBsvSmf0wWG4eFLXbd2RLWI/8zd7wi8DV2m1cTk=;
 b=KIy0AhBPruwvnhTn1vimyCxAqJk1XczESh9NiWg76W9NaBvZWef5Zbxfwm9fHgmYmOxN8RTftdAhBHZN2+kO1J60LYnmpE2UEJgaRePMSbN1vSXSRzsRIwdZAWPwaWabwOTGRRlH8F99t+kVHExI7As/D4WC78dIQuiDtLbeEvsAQWzk2OsNtGMacu5yOI0pCjXO8Q7j8L0/7gpTIJLzooacT8IGhEL5q/0wV8+cqyVuJtZ3syralKcJtumf91+LTyWtZmJFpWNj5QrvJQZXn89dgcX5+o6BwR67W7BqurtzBD9L6TsQWbG/yeSwXa3fGbXci7C1eF6CO4CHUqQohA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com (52.135.147.15) by
 AM0PR04MB3970.eurprd04.prod.outlook.com (52.134.92.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.20; Tue, 3 Dec 2019 08:27:21 +0000
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::f16d:a26a:840:f97c]) by AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::f16d:a26a:840:f97c%4]) with mapi id 15.20.2495.014; Tue, 3 Dec 2019
 08:27:21 +0000
From: Peng Fan <peng.fan@nxp.com>
To: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
	"jan.kiszka@siemens.com" <jan.kiszka@siemens.com>
CC: Alice Guo <alice.guo@nxp.com>, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 2/2] arm: irqchip: drop unneeded barrier
Thread-Topic: [PATCH 2/2] arm: irqchip: drop unneeded barrier
Thread-Index: AQHVqbN7EERnN636K0i0ki9WNfrMIg==
Date: Tue, 3 Dec 2019 08:27:21 +0000
Message-ID: <20191203084553.20669-2-peng.fan@nxp.com>
References: <20191203084553.20669-1-peng.fan@nxp.com>
In-Reply-To: <20191203084553.20669-1-peng.fan@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.16.4
x-clientproxiedby: KU1PR03CA0031.apcprd03.prod.outlook.com
 (2603:1096:802:19::19) To AM0PR04MB4481.eurprd04.prod.outlook.com
 (2603:10a6:208:70::15)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a1a5a279-13df-4ccc-a491-08d777ca9d98
x-ms-traffictypediagnostic: AM0PR04MB3970:|AM0PR04MB3970:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR04MB3970DE087CA6191151AB9A7188420@AM0PR04MB3970.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1303;
x-forefront-prvs: 02408926C4
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(396003)(346002)(376002)(39860400002)(136003)(189003)(199004)(25786009)(3846002)(6116002)(86362001)(2906002)(110136005)(54906003)(2501003)(316002)(6512007)(4326008)(478600001)(14454004)(14444005)(6486002)(256004)(6436002)(446003)(1076003)(2616005)(11346002)(44832011)(76176011)(5660300002)(52116002)(99286004)(36756003)(26005)(4744005)(186003)(6506007)(386003)(102836004)(66946007)(66556008)(66476007)(66446008)(64756008)(50226002)(7736002)(66066001)(305945005)(8676002)(81166006)(81156014)(71190400001)(71200400001)(8936002);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB3970;H:AM0PR04MB4481.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fUev4kfNI7nOc/yhDmD8AqHIL4g41aozbh9yTWYXgTDHbQ1qQYcxGpAQoDuwuAJF0N/YUimtNXyj8vqelGO2fzUQ9W0ObrEbCQsE97pwguvvBkMRT22EQk8DkvbSBp4Pm0v1oBxURzJrhMHvaK6aXgC6RPD3ROvbJfe6BLQ6Kyw04l1WZNXvvp6htIHflNpdIKTFSdsMZIir+qlsAmNDDYHBF8EKZzsbttxeW67RUUgpf7J0gcyrvatSwevGxUPMxNRGBpsjhgWr+c5++FystLWTc+PdzD8dqvgxYf1oH68DpsSiR4z+BshrzmqJiVn0MnouvhEKdLZ+dmmbNq1n4W3yLfJyUtiCKE6lXL1fWfNfoUkYk3FpahRLuTXoQSwanznMMRS/XrxilrUFojhasHSFDt/eLW1uFKoWhd4USTdjh30la0xBuk6Q6rPJ59uY
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1a5a279-13df-4ccc-a491-08d777ca9d98
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2019 08:27:21.1487
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +d0C2wmfaeR2tZ5Tji6EvY4XZEu3esRpRYiFVpNBI59VhQ2X1iM6HJAbf2S4ayV9L2B9Sg2Omwl09rWYMhZ3hQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB3970
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b="rzzPrv/E";       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.0.77 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

spin_unlock implies memory barrier, no need explicit memory barrier.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 hypervisor/arch/arm-common/irqchip.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/hypervisor/arch/arm-common/irqchip.c b/hypervisor/arch/arm-common/irqchip.c
index fbaa3099..eb6258df 100644
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
+	 * spin_unlock will make the change to pending_irqs.tail
+	 * visible before the caller sends SGI_INJECT.
+	 */
 	spin_unlock(&pending->lock);
 
 	/*
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20191203084553.20669-2-peng.fan%40nxp.com.
