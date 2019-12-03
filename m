Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBB2NYTDXQKGQEXNPA7MQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF9610F9CE
	for <lists+jailhouse-dev@lfdr.de>; Tue,  3 Dec 2019 09:27:21 +0100 (CET)
Received: by mail-wr1-x440.google.com with SMTP id d8sf1375434wrq.12
        for <lists+jailhouse-dev@lfdr.de>; Tue, 03 Dec 2019 00:27:21 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1575361641; cv=pass;
        d=google.com; s=arc-20160816;
        b=I4gymasQHz1mcBAqmsMPAyHXFUlSWYI5wqm8VCWJBw1JcWwdx8P1etba/3RQOZTHHI
         g4agScFo1FwqXoyV1BifuQL8CY6clXvsTxbOTFdlAi2owee7msz2JlARGv8T4MPzR/8f
         d9jf3PcCnjcNFNLNPxvGd0IHNmSIKzxZBdtHI9+gAohOsq0NpmBZVhXuDVd4YKdZZ7V9
         92OuA8C1bpyIRwAk4FE8VQUeO7Rrp1TRIl3AUGRf29cvHkSsTSRuGLkPfQAPBc8eiX5b
         Mhu1R2LLV38KCQpP+lm0PPG6URh9hYvZP+pYXJRVMa4/ZkVgwzYDA7Z38DafDEZz/RzG
         mNPA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :cc:to:from:sender:dkim-signature;
        bh=YnjobH418tHdQHO7o+IrlEeE3c+nNa5STarG7UMAEmc=;
        b=yxGDaeVGQOws2CE2CagbZ8IFaWCr0P62Sh3gyAHtSgfFpTtO/FERS2nwhLrK1Wxb/B
         X7W1H2ZmGyCCrvCOUUkGXhOTwn1DFTsMw7zflocVN0KnPoxBlfApwkx0SSaspIv1zjlQ
         WP3K6yT44xzqr9RhDq6C8+Sc4KQ/LfWFmZ4gE2xyLKjHaXa73S4BmMdkBWQM0lDqP0W0
         41OJf7WACYLATxH5e+ODmRexzHif3tFl8pI4Mev80yWNu+Ea8htonFsCqtU/wGXCaG0h
         GqpINB4ZSUHl4SQ7OvsxtmHIPNLNHcy6l6rW0CVGQpVDtn8jMF9s8wjnVwZy0JMG5A9W
         U63w==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=cLFCTolE;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.0.56 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :accept-language:content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=YnjobH418tHdQHO7o+IrlEeE3c+nNa5STarG7UMAEmc=;
        b=Ljg+qERc58fYlnBw3u4QZO7CWlshMRdDU1YOHGlX9i8EjTDnW9xLcgH4xGmbIywcS+
         q/R87igrDBcRE+kRq71k4fOvnSC0JftY3KRAdZIErCsytZcbqS6hYgT0llwDhIOzZ1vL
         QG9v2o0Ti8pvLdS0UAY0I2sAapRYnajlSVFwnLrXt9PqNXWMDlRkrYhNSrX4PkmuBCqL
         OMZ9ngKvOt9gwg0eC4KitGePonhz4B9n3ORhJlVtQgyAigNIDSHaxf+purM+DpwGHln/
         AxXgekV0ixoSujIzsL3XhNNfQhmKqa/ivXNjGhyDgoDQd+76Ow44U/dedm0UDCyt6/PL
         nWUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=YnjobH418tHdQHO7o+IrlEeE3c+nNa5STarG7UMAEmc=;
        b=O7ttYJpVYEZWCn3rQHVsAYygs0xAC+YxoYEIufth1g4YOYH5Q5CBgeQ6V0flUxoYpi
         LPgB2ueFO6iHr8g5f9fDMVs5foCOjsyvWSBb9v1HT+4LRwMv0NHuUt2I5MH5BIOaEL18
         M5uvagtHL9tfw2jkZrZJXXI4lbIdeCC2RV9ou8HL+oEVw8F+RlmUExmHN8snYxJBwJxG
         rSMyUBnzgOgJqarYScPbDqBo+wU1ckO4D2GfliMXNQC6MtLr+VepJl6u4ZHDZgOhRDNT
         2uIbv2aCRu1OQnYayycwiSR6xEPaqoEY/LophPwGh04nA9Xyuadw+xa3mZOh33J17vHf
         S4rQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWEWyy3aELcy0O8gZsO9U/b3RDrZwK98wYH7+KXy7CedjsQ6H8P
	ReJ/jGgVF/RnKRtH2qhaicw=
X-Google-Smtp-Source: APXvYqyqeATnFrETTAzbdWi96hkq13FHgNEw1t7Z4sfavyF1sS+RNCWfNyvwf7xnazLnbibXrVJMpA==
X-Received: by 2002:adf:fd87:: with SMTP id d7mr3761519wrr.226.1575361641477;
        Tue, 03 Dec 2019 00:27:21 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:6650:: with SMTP id f16ls828708wrw.4.gmail; Tue, 03 Dec
 2019 00:27:20 -0800 (PST)
X-Received: by 2002:adf:fa46:: with SMTP id y6mr3869647wrr.263.1575361640926;
        Tue, 03 Dec 2019 00:27:20 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1575361640; cv=pass;
        d=google.com; s=arc-20160816;
        b=A3Z9zczoUSgU9PkQaiEZrwG7oQDUZ97afi5yAbueNh7kdS/f/h9mMdKdq870L4SYwf
         kh4eJWkO3xmP8UcqEy/ZM7Vc8WIwVY53SkyBZbXIHAPa0St8GsflrtTsdJzcoBlWtGfj
         3Kk2peiWEhCaPx55zTDewbK4iJwKukuMCaT19CzxvudR74msgPVLLv8Yize+AmAxdrfB
         WlgyeKGFFUbCWkuOeLvVSLya5n5h72wgVcZzooIvP6W8B2iv0N4gotPUeeh26N6sghks
         TkYprR74+GoQbo5ZbNC03QCGkb0R0OKUaNLODsIsIx+k/rsGn0+rpe+2lzHRoQNdKJ7U
         AKbw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :cc:to:from:dkim-signature;
        bh=7N1++5HhqOrhQmO63HEM/vYBWNgnzVLsuWSaJWiWSf4=;
        b=dZlEPJJavquia5TczxXkmSQH98qMymhc7CgcigPm0YWwJSG8Jfx3ddT29fRDi27WMz
         GT6tLlJ92JpbpLM1HBuCg7P+9l+Vi/U1gApI5BzwmM4GL56cLHb/nz+wRjo4jsSBiPgb
         amsjP04gpLmcvK6ObYh5mnwCOn5y+TJc8B150147JRgXf21rGUeipA7x4sG3d99KjP+q
         cc5qJKtqT7YNzbo7nVo5+Lv4CxMLtVOis4ROVLa2nYuMHk3hlvpWbtfFIHUSClNJxe7T
         oirKG7SomyMih3UYzwL71VMItydveoF6yLex4wIjUHNHNuHfcGhVTCRFUVz3IdBil7ak
         /wEQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=cLFCTolE;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.0.56 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (mail-eopbgr00056.outbound.protection.outlook.com. [40.107.0.56])
        by gmr-mx.google.com with ESMTPS id w6si169440wmk.3.2019.12.03.00.27.20
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Dec 2019 00:27:20 -0800 (PST)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.0.56 as permitted sender) client-ip=40.107.0.56;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mOYL2NO4N63fSuMdM14QBIHxgo6r3SOOw0MTCm3pS6QFFqXcXEnWUl+prP667Zl3OT0TLb4XUtfU0u8ld4PfkxJiM5+oseIkG0mfvfNA4UiKR3U9CMy711RrWCS/A4ADqJUfPGU+nM2qNwtfGZvrxeNIPWxlcuFfkSlHWtU27tUHNC6/ATFiTWRmscaCYmO3t/39X0YiiularnvqUd9TD9/7/k4CGKoAt51ZFZN83yLjRCVs2DgYR+d5hfzMq8HqBgxKCV8TqxG/izPQ0qoI3UVdbEn+782gK9+sSnCuGpLPSsJ/VcJtUp/7YAB1H40kWLHYUTkVkCKZ8dnzEg/tSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7N1++5HhqOrhQmO63HEM/vYBWNgnzVLsuWSaJWiWSf4=;
 b=OkB5m1HQYhcI15P0c8kskZh7sgO5+XHKzpTNrC+pZKiSvABXQzLNuFfqQTdUtjSu9EaX7FSprVlC58pxLjhWRzMJRx2zMAb4jtyHJMH38KYWRSZEjjw9eCgU6N2g7N0fq5pMqSTt3sfgqCeA+0m0IpX1CKPl7mD1AEz4+ELm/J88kjneuhhsagMNvH4/fxQfYDU9C9H4tN/Q9q8c1J1kB4fEmt44I1NKYackBV3iyKNrRstKq9cFwZ96txgDQgknLbcRUWFBc4y8e0eh/v7002G2m+3atQO6ti33YolP7qiD8MB896PmA0fpuIa/qivP8oeyz9sgUJASOQYaCldImg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com (52.135.147.15) by
 AM0PR04MB3970.eurprd04.prod.outlook.com (52.134.92.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.20; Tue, 3 Dec 2019 08:27:19 +0000
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::f16d:a26a:840:f97c]) by AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::f16d:a26a:840:f97c%4]) with mapi id 15.20.2495.014; Tue, 3 Dec 2019
 08:27:18 +0000
From: Peng Fan <peng.fan@nxp.com>
To: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
	"jan.kiszka@siemens.com" <jan.kiszka@siemens.com>
CC: Alice Guo <alice.guo@nxp.com>, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 1/2] arm: irqchip: add lock in irqchip_inject_pending
Thread-Topic: [PATCH 1/2] arm: irqchip: add lock in irqchip_inject_pending
Thread-Index: AQHVqbN5/wzTXUO1YEaDqJRJvOGoWw==
Date: Tue, 3 Dec 2019 08:27:18 +0000
Message-ID: <20191203084553.20669-1-peng.fan@nxp.com>
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
x-ms-office365-filtering-correlation-id: 1d4310a2-4904-4770-9e8b-08d777ca9c59
x-ms-traffictypediagnostic: AM0PR04MB3970:|AM0PR04MB3970:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR04MB3970BDED25ED37B0AC00BD4388420@AM0PR04MB3970.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 02408926C4
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(396003)(346002)(376002)(39860400002)(136003)(189003)(199004)(25786009)(3846002)(6116002)(86362001)(2906002)(110136005)(54906003)(2501003)(316002)(6512007)(4326008)(478600001)(14454004)(14444005)(6486002)(256004)(6436002)(1076003)(2616005)(44832011)(5660300002)(52116002)(99286004)(36756003)(26005)(186003)(6506007)(386003)(102836004)(66946007)(66556008)(66476007)(66446008)(64756008)(50226002)(7736002)(66066001)(305945005)(8676002)(81166006)(81156014)(71190400001)(71200400001)(8936002);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB3970;H:AM0PR04MB4481.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TLldO33J8L7Sz45PHxq31pS+f45TUI3ajYj3DgSmW3leUfAfxuBKVU/H7gXJIs/u1lKvWw4awSMwsX9yhSPzwOkaKU++wNFV/Dy9Wyf3JVOvsG6DlA8EFjCzGMoj/sbFgZJMK9UEMzs5bsVKS+pHc3Wckp+xgsdqREYrW8W+dl1Wg/vhMeq3QzW+0vzauS9QwE6tsU/53Lf+n+x9C88ac9ZRFBFSA0q/xsTz8zgQeKTHbBL0Ib10R2CnJIN+3MN2aS8/+hm0Nukm8g6KVMc9Pic66pumfhLDcIs3JEHZlB5LZC7532sWkUBo+iA1A88SYaB53d9rapoKZ3IMSaRMYljbmhibx7I4aOSqE/Ny270iPQ532Rk1biBS8O3eCJK4lCS1DiKb4urMhft9sDiPuuHRi9XPShGYu7l9cHa5BA+pTIwASEKAkDn09bi8c5Nw
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d4310a2-4904-4770-9e8b-08d777ca9c59
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2019 08:27:18.8811
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OtVb3Ol5m+GeCbYRmGQ1LXpq9wpUgLDEcng2CCaUKw8QUT0nkxrZTc2qhn0rKBACso/miXVhtk+AjC2EZjXEOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB3970
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=cLFCTolE;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.0.56 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

Thinking about core0 is inject SGI to core1, core1 is handling SGI
interrupt.

That means core0 might be in path to enqueue SGI into the pending_irqs
array, core1 might be in path handling SGI and pick one from
pending_irqs array. So need to use lock to protect unqueue, not only
enqueue.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---

V1:
 The best case is only lock one entry, so no good solution, because
 there is possibility that inject fail.

 hypervisor/arch/arm-common/irqchip.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hypervisor/arch/arm-common/irqchip.c b/hypervisor/arch/arm-common/irqchip.c
index 1c881b64..fbaa3099 100644
--- a/hypervisor/arch/arm-common/irqchip.c
+++ b/hypervisor/arch/arm-common/irqchip.c
@@ -279,11 +279,14 @@ void irqchip_inject_pending(void)
 	struct pending_irqs *pending = &this_cpu_public()->pending_irqs;
 	u16 irq_id, sender;
 
+	spin_lock(&pending->lock);
+
 	while (pending->head != pending->tail) {
 		irq_id = pending->irqs[pending->head];
 		sender = pending->sender[pending->head];
 
 		if (irqchip.inject_irq(irq_id, sender) == -EBUSY) {
+			spin_unlock(&pending->lock);
 			/*
 			 * The list registers are full, trigger maintenance
 			 * interrupt and leave.
@@ -295,6 +298,8 @@ void irqchip_inject_pending(void)
 		pending->head = (pending->head + 1) % MAX_PENDING_IRQS;
 	}
 
+	spin_unlock(&pending->lock);
+
 	/*
 	 * The software interrupt queue is empty - turn off the maintenance
 	 * interrupt.
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20191203084553.20669-1-peng.fan%40nxp.com.
