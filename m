Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBB3P7ZPXQKGQEWRTCKFY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x540.google.com (mail-ed1-x540.google.com [IPv6:2a00:1450:4864:20::540])
	by mail.lfdr.de (Postfix) with ESMTPS id 10AE211DC62
	for <lists+jailhouse-dev@lfdr.de>; Fri, 13 Dec 2019 04:05:18 +0100 (CET)
Received: by mail-ed1-x540.google.com with SMTP id n27sf560223edb.20
        for <lists+jailhouse-dev@lfdr.de>; Thu, 12 Dec 2019 19:05:18 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1576206317; cv=pass;
        d=google.com; s=arc-20160816;
        b=G+GEB361SiGc7W2jmJNaX3k3ZD+/HlgbgO+/dlSCH5JTdxWKWbEKmAgEABUGMIpXFb
         saeCQy+Xld3jBYMhWX6IU5JuX3VhGNkOHZcqKuNUPeXbKJzCqUqkduiPbRjE8JmxCuIE
         iFrDDTfECl9EGI6bshc88qpiG5+KdqKMocuKtiotMwHEBm7k72kJcQVPR4QoaSZ4OQck
         +DEx+UvAmqa9P7+UxH2Na1T8qBjg4909NuL3kfDpnwLOZSFEsJ/m/GVDjheaXVZSbblS
         XDAYD+Ed5jrcOstZs2zwRuVQiQl4I2F6IWBe4tNrhSVMQPMz0MEcZfiQD7JCEAlbwsOG
         KmUQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :cc:to:from:sender:dkim-signature;
        bh=bBK9UrC73OF7AIkcdwmh1pXm758P/tY+3KVZ0pIsMcs=;
        b=0NjTlc3USsSyOEb//970/4lZOLkljZtbU+ZMtandH/vGIJKqIJr//xEFC2O0mMjukV
         ywVSHkqSC4iw4qeP9V+yUMTP01nzXSp4Gv3miifAl3RXBpGQ7tgxlGphpBEFAseKADjk
         4bZqRwGk6Xhlw4bv+tVohcWLa4615CnfBAbkZThJx1ro0SzGopH4sEHmjA4lTlMX11uZ
         OrYdYZTEsukrUEsSkGgR29aWmY+g/OOmV7iFg402kk49+gf1lCSInCkGWrkacEMRLBa8
         FwwJTw0kWOJdfMU9mQm6ja8Y2QA8Hxjk2nE7O1P6HxMDbfZdOzAQcSHsUkkuUdSTktqr
         EcCg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=G0vNDo34;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.3.68 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :accept-language:content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=bBK9UrC73OF7AIkcdwmh1pXm758P/tY+3KVZ0pIsMcs=;
        b=AZYEvLT4q0GtLUtFD9M6krcMCEp2xrdYkmsbXCD41he6ZbNsKk8OhBQB0r4WsqCnPL
         TFwH8/ohYpZHlkPH/3tBD5DZImKaOiS95m3+16IT7MO7DUmYArC0FfhpoqRCnO6wUu/G
         Xs0qkZUXDZ8lU/lGlK8m+3jtPqSyfQTRZwnXC61m4gT364gQCTf6L3wK4EPXeQfWjSHe
         q1FYdyU8W6JSRNXfGJDFdFxnfMbwTkWHMVhGw3r4XKEzjifJVahZ4XDFXNfa7JWWFEiP
         0/TioisCDaJNZnzaRxee4U3c7B2d0qkT4Y3s5NFIddYiJp0hmyAEt1frRYVAJROusZUj
         +XLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=bBK9UrC73OF7AIkcdwmh1pXm758P/tY+3KVZ0pIsMcs=;
        b=N+hTyvqDpWvFUqnjVE0GAclU/TIMYKlyKk05FEA/9z9aBjtoEd0qjFKUbqZxj4l+Bg
         PpKv94ok1LVn12zOodD6t5pDaCI9uGQ50EWX3PQDE33GIj+wrCyIoX27gMWmRgNIYs5/
         c9WmTbk1/rZdMLn9svo8XoeaHGh7ZCgZ10GHWcNMBxZBVVN+4X8ac7y6Rstmon/2MttS
         140DSL0OMuid17SYbFag5HUY5ndxg6ML+O0K6+f1j0CeDh2H8tm14A5CFww3Bf2FHmws
         cVAqLb0x6UekLnm6KrRp+v5XYUkAJrWo/DIhVxz/PXnfr+U6GFYoPtC8fqh/BKew0ljO
         X8bw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAV1xr7y2jwaKty8W5kfj0XkmYmxkfp6faeCTR0uGwHsR3C+DllS
	iXPhm0ci4iPXIKjAesyht/4=
X-Google-Smtp-Source: APXvYqwdpTM+BsoPgxyeBXQjJPCspRYanmuT6IWUMBR0IWQRfcXIPrpdtHHlnhO+yI3k0C3/PX/WnA==
X-Received: by 2002:a17:906:6b89:: with SMTP id l9mr14020815ejr.130.1576206317710;
        Thu, 12 Dec 2019 19:05:17 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:69d3:: with SMTP id g19ls1058909ejs.16.gmail; Thu,
 12 Dec 2019 19:05:17 -0800 (PST)
X-Received: by 2002:a17:906:af92:: with SMTP id mj18mr14076406ejb.11.1576206317007;
        Thu, 12 Dec 2019 19:05:17 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1576206317; cv=pass;
        d=google.com; s=arc-20160816;
        b=taFijK4vGKu5gWeYqnBZlUKDojfr69PBh9N7Ori8iHXIY9t7Dwjxko7zVBlcc53m2i
         ZE3phm7MrlKpC9On61vpoLz5QTEqvdLVK9+ns/sV1mQGRJsOGZT0RdNkiYrkNxchbclw
         48V1dWN2fAw4nOA9kNk3bXwvVOlbsM9hlPMJyspIy/MXWyXKQoPTDStVX8GzbiVcp+dk
         /XbcZU34N617fCHzpZzOlBB+KUpumqOB7Z9K5KJaXk6/vOjXpyDo8VRbpNUQNwx/qZOE
         daZCESPdQYR8pci6NI0shwaEoN3rjlTp5AuYU5oj5YIZf1zzq7s7D28oNeh2sEqOMHya
         UXKg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :cc:to:from:dkim-signature;
        bh=CEY5ewsA5CDep1d9IUy/aNB3u3GV4euJmC5ZPTZRbxA=;
        b=YkZjSQkgcQRTpKorZQASWEJ4sC9GqJXuIkYlQR+orOKABy2hYi7RyMOyEIqGs7mhkr
         mvu/eklvPRYJ7zhlKPvEYNPLlZxG1SyryWW8NN7Wu0XK0JWkDNAl5fUMH5eJPycoaBJY
         csLzFThc1KOMG+GBqSgbsxQDsfpsqlCeid+UFczYc7wu1ffmu3S5806j66el/4vrnQn0
         StbmxsogyvkBg5GOpDGkaC+hwWIPwbPJwHfigbPxVsHZ4Au5+Potza+SVrMcoMrMQh+r
         7ZmKD986PO/RZ1Pzr8N9chY6eIwnDuZqMMwXrQTkokiZFpwp2vDwKI3cH/Agvy2/QSWz
         Utgw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=G0vNDo34;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.3.68 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (mail-eopbgr30068.outbound.protection.outlook.com. [40.107.3.68])
        by gmr-mx.google.com with ESMTPS id j19si373344edv.5.2019.12.12.19.05.16
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 Dec 2019 19:05:16 -0800 (PST)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.3.68 as permitted sender) client-ip=40.107.3.68;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lsvEGP8KeirqTB7E8HnLrtacFePXrq9W0daiHf8iQbjn75WzTt6wHXUut/5+Bt6NKwondhMCo8X0tH1OblRdPmepwuWKQfM7nNF+/m00NK0pUiLMhwNmi9gxILnxuM61p1wyxaTR1BPcLqL5Pw4ryvZnpOVoYkd7qGoNaSYMHjcHgK3z5BlEIEnLi+wbf9OK5iUMan1zC9vEyyc55/hID43Uppj1wlJerGgmwSSIDhe4XW/iIEL0uFdRq/TqRkUT66glprLB5t0tHBAueU9+K2AApXL/UDtOuDtvEkMqTGakIDVbPFaghAlFaNtoaFFhJda9K+dfAwgoreT0D9Zz5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CEY5ewsA5CDep1d9IUy/aNB3u3GV4euJmC5ZPTZRbxA=;
 b=QWAQDhqQnLF4W1xyAEus2BPtK7+fHqvVzZ9IUFuSec46vS5jRJDHhv/4c1UD5Zpqaydoel36GKSJIGamBLG/pEUvYu9U+NMkdLEL7Dy5TkqSbDoU2n/3VaY8Umd1O0BKx+Qoohb6PGI7tsd3tTPPvFmjvguYqiIKD4nH6AO3+k1bhfLuCs2BR5HFqjIpmH6fBjJ1U7Y34JZZO9/uPC9gaTzB7dGUk0eUexCqSpqZI2hDHYd+FGyIcYVxEaYOX3vUOLH5ibrZIx5mJ4G0Gn7PBWpIr2oZX39FDjwfU0dF/ZlGJUKSHZZ3bAut/OlvOfBnIA+loybgmiN63NyFUYbMTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com (52.135.147.15) by
 AM0PR04MB7123.eurprd04.prod.outlook.com (10.186.129.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.16; Fri, 13 Dec 2019 03:05:16 +0000
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::505:87e7:6b49:3d29]) by AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::505:87e7:6b49:3d29%7]) with mapi id 15.20.2538.017; Fri, 13 Dec 2019
 03:05:16 +0000
From: Peng Fan <peng.fan@nxp.com>
To: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
	"jan.kiszka@siemens.com" <jan.kiszka@siemens.com>
CC: Alice Guo <alice.guo@nxp.com>, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 1/2] arch: arm64: add comment for spin lock/unlock
Thread-Topic: [PATCH 1/2] arch: arm64: add comment for spin lock/unlock
Thread-Index: AQHVsWIksU0xgft8KEiSF+xA4GnpxQ==
Date: Fri, 13 Dec 2019 03:05:15 +0000
Message-ID: <20191213032352.8915-1-peng.fan@nxp.com>
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
x-ms-office365-filtering-correlation-id: 72c2f6f6-8249-4745-35eb-08d77f7946f7
x-ms-traffictypediagnostic: AM0PR04MB7123:|AM0PR04MB7123:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR04MB712316432BE45288F7444CA088540@AM0PR04MB7123.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2582;
x-forefront-prvs: 0250B840C1
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(136003)(39860400002)(376002)(396003)(346002)(199004)(189003)(8676002)(186003)(8936002)(316002)(26005)(81166006)(5660300002)(54906003)(64756008)(66556008)(66446008)(66946007)(6486002)(66476007)(1076003)(110136005)(2906002)(4326008)(44832011)(71200400001)(52116002)(478600001)(36756003)(81156014)(6512007)(6506007)(86362001)(2616005);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB7123;H:AM0PR04MB4481.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gRcy1xOVoHmJby6xVdDePTTdUvXhLOCrlhzqyBGKj3PrnvzO/QVxg9HAhTN79o0eZDdKbcfnZBWxfYuDm1WNYCAdeXT70O91N9PBLLGNsSTMK2eXqicUgDTHgvP73D1F4KUrtoNBwstnk+WxvS66qxm2pylNwYzuvqDhm/yfV8jmYQ+OjE/5YSvw5ylSwAUoAeHTG0Omlx6cW8MKWJqPwdqlGO9F8akdf+OQz9bqAw2K574CkFV7hTbRJWFfr59sVnUqcRsGjUrL4xvRplCyNeZPSSr90DiiGotGhLA48CkTuOjIyHKMijB+hl79mPp2VO84+HQpU4JPpMU98zoYQD9hATT4HSof6vuf9UZaFDH02TA2gyfF2UUudp75RVeArPCdUic0dxYKDxTD4YUq3jbttL3/2PHyt6sfBdwA44kqmcECbBS1vHSeemY4JlpY
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72c2f6f6-8249-4745-35eb-08d77f7946f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2019 03:05:15.9108
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LC9+EEaG0pKIoFZ7hT31wvEx442JMJ3I/J5rj0cmLiJo2t3f8Sg8DrJvu2dEd7OHnSavno6XfTgJBSfFtlYWTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7123
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=G0vNDo34;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.3.68 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

According to ARMv8 DDI 0487D.a, B2-108:
"The Load-Acquire, Load-AcquirePC, and Store-Release instructions
 can remove the requirement to use the explicit DMB instruction."

Document this to avoid explicit memory_barrier binded with spin_lock/unlock

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 hypervisor/arch/arm64/include/asm/spinlock.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hypervisor/arch/arm64/include/asm/spinlock.h b/hypervisor/arch/arm64/include/asm/spinlock.h
index de814bc2..9cb3c3e7 100644
--- a/hypervisor/arch/arm64/include/asm/spinlock.h
+++ b/hypervisor/arch/arm64/include/asm/spinlock.h
@@ -30,6 +30,13 @@ typedef struct {
 	u16 next;
 } spinlock_t __attribute__((aligned(4)));
 
+/*
+ * According to ARMv8 DDI 0487D.a, B2-108:
+ * "The Load-Acquire, Load-AcquirePC, and Store-Release instructions
+ *  can remove the requirement to use the explicit DMB instruction."
+ *
+ *  So no need explicit memory_barrier binded with spin_lock/unlock
+ */
 static inline void spin_lock(spinlock_t *lock)
 {
 	unsigned int tmp;
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20191213032352.8915-1-peng.fan%40nxp.com.
