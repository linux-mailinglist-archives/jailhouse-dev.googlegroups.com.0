Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBNGPTDXQKGQEQZXMMCQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13f.google.com (mail-lf1-x13f.google.com [IPv6:2a00:1450:4864:20::13f])
	by mail.lfdr.de (Postfix) with ESMTPS id E791510FA8A
	for <lists+jailhouse-dev@lfdr.de>; Tue,  3 Dec 2019 10:15:32 +0100 (CET)
Received: by mail-lf1-x13f.google.com with SMTP id q16sf731691lfa.13
        for <lists+jailhouse-dev@lfdr.de>; Tue, 03 Dec 2019 01:15:32 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1575364532; cv=pass;
        d=google.com; s=arc-20160816;
        b=k+Y5LyLY2vAMp0tmfBVJpIpBLfqKqmsJReMvi1BjW0H7J0eQuFmrUvmnwawUI1BJd3
         h6NaS92pULJQoTKTo6QO8NLz5D2X1xRPhaDFceVH7kD7gWwJ2yPiivFfenLtF4hg4sNk
         5PUOBwijsURNqKmIFZder2lzE1VPTcyt/ubO2iljgmDeYmvVa9WXmf6PHUj/7zHRKbk0
         0eNUlI21KGVxf5VKYndExsGTN2cRzx5rgUNbfbXB+jLwiMSBdC+MOc5Oiwh7XoqjkgNC
         lc+CbFDlrCgiRWiwUQs2WwNz1EBwVXyPGyHhtH8L3XLzomMbM+EiRjM8iS7oKIlMUsPF
         rGYQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:sender:dkim-signature;
        bh=3h1TxYY/Mq+/NqrlvDddEj/6mt/2Ipjd8EKCQyrTqIg=;
        b=w/iGQpkZf+JrCV7eDtj70RPfXbD6qkx4msAmBmsbtuCQv1vN6zu1dB+8PlJcoon6kw
         BBv4LsyOf/aQ4pCHMFLme2Nm8Ryz45JGGhs/Py+ZkAQPTOJLLOB2zGUj7zm2V/oFOKaX
         7o2YEgfd/ruX13tH1YC+u+zyhL9/O5e+Zl8hUbYpVo4OiuI7pAeml/vJX8xqLm/CxWqQ
         gCDxTixpn8btQo1hDVlmTycTgzMTAFKuVthwV7frLVnmDxCm2Q0GctXia9xcj/5z4SQc
         tNPGC+NvldvJD36YxIdIdY5aK5AoMwtnZm3gSc150ZmLCB9v0/nDtG5H0a8xNnXRGsvn
         pR1A==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=LOZDmC80;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.8.59 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=3h1TxYY/Mq+/NqrlvDddEj/6mt/2Ipjd8EKCQyrTqIg=;
        b=OxdYXbWF/NNNxqCa1FXyLb+gcij0MZchsIKLAlfsCnTLqjg8I5b1t2AakrCTII2P1k
         3uefE8tvlq7GomsOCUU2ycSBljgt/AzUVjro4Xl8MHerTVAd9VaqwtpvQgsXI91AciTe
         kQmITOl/hPHHbQSdzO+hqzWlyxdbkG6rpypUIIICOiJp7x/LHFWkzvSnnfCiEmokvaML
         f9wGFx9Lsbwj653Hk5Any8pGuSxvgzr6sZ3sM0ox151eZK9BI1HrifEPAVfWHIaW31t3
         DZirvJ7lXiWiWgqBSQHgzEzMCozoObmAa9u9QgP/aSWnur85RT1KuyGLdkmKgzLNbM2T
         Bl/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=3h1TxYY/Mq+/NqrlvDddEj/6mt/2Ipjd8EKCQyrTqIg=;
        b=UxB3FgEeGn+RM+vKNeq9trg99CTdFH8XECyRvcAQ3WyrYjAEgWqURT+WvEcjgdj0ze
         p/i8+9976y9roS/urWp2P1Fwxj45+sffFBJFD13YBADubXISspfSUzz03Nd8IwNmPEnL
         hZnn5RKcgSD8D1Tef4wl04RGRjzU4+HcjPRk97vD5k+yYvnAKdcz0Yxt9PsSrBxPhU9w
         HSJaC0qPrSBqW+9fI4QYU+TIBZkjhx9aLnZMABsWAAGa6eNVgEM5uxAcVR5iqPaJf3+5
         Do8PwDoSBYkM9SIkMf53lvh4FbeEuZlt4mdVd+oVrUMlx1BTQZTAJNp0DGxlI81Jd6Hm
         wu8w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVf+lUT2vMqi9/1BgHUHps+tK8xHbEJAiPBsDeM4CNk9a/+14cN
	sFUGRQYBZHH3psMx9H11UiE=
X-Google-Smtp-Source: APXvYqzHSAISScrhOFjDc47EVfJrchkU7S9NErqDGSlyjKhDNv+n+ynD3gUD6V8ruqt23FIVLGSOyQ==
X-Received: by 2002:a2e:99c5:: with SMTP id l5mr1973388ljj.229.1575364532407;
        Tue, 03 Dec 2019 01:15:32 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:cbce:: with SMTP id b197ls284919lfg.5.gmail; Tue, 03 Dec
 2019 01:15:31 -0800 (PST)
X-Received: by 2002:a19:4a:: with SMTP id 71mr2080142lfa.50.1575364531658;
        Tue, 03 Dec 2019 01:15:31 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1575364531; cv=pass;
        d=google.com; s=arc-20160816;
        b=qLiUopE/0EQTHbIraN45ZXnCraSk+dDLb+BMb5VjyRNftv9d/BtXuoleYqiptoukwP
         5IrwhqMFo3G/gnEmkK3zNHuh2iGv0jxd+1A9XJdRQ9juZ6OPXLWn2Q7/dcPYZxCBTvTA
         kCrcIUKRHkuV6wUUsMlSjc/ffRlCMaevh5ZAekelUBXZ4qd3xXY3QoRPelwzUzMhMcTy
         xXlpG8AbxvYz12GU+6Tx84dFHLgipL5RwpMqKIVFTdkWhC0om/sdSbSDobnqM/pQIRrZ
         TQfSppHNM5I/zYTnxdVZz5n/Wt4syXC3Jc3eD+d32ZyrNVzS4Fxi9asXyM06C4gmzmI7
         Up+g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=Y2egajamhqhuYwVW2L7rWvGHEHU8tCSk9bAW7ihusjo=;
        b=yYfutcLQITZozKrWKobtEgP253BfTV1GtoRCmaKZHYpy0yGoO9TpEFIHKksLZmqOqF
         XT1eYvqCOVCIoteujz1TK3LdUj6trnfWaRP+tWbLpO20OGQiRM8+WnzIyvay0nOr5ZX7
         UwboZZxSSmLP0DTErcLsSMYlsBWqYccvBVchPJG1goT/FJAzWr0orAfdfVFAhT32bAo7
         mz8zAzThIxAx8qM2DRZYaqkWPEyiuxYo45lhi++o98McQ742jbWogcHPA0lpHa2HNs0D
         jx9eBk1sU15Z9EzC+jo/BpT1OfeaVFJ+D9xumfwcvsvU/7nHAbbQ1lxqEa21Ix7u31Gf
         pR8Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=LOZDmC80;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.8.59 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80059.outbound.protection.outlook.com. [40.107.8.59])
        by gmr-mx.google.com with ESMTPS id f1si124788ljg.2.2019.12.03.01.15.31
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Dec 2019 01:15:31 -0800 (PST)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.8.59 as permitted sender) client-ip=40.107.8.59;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lhbj27ZIBGV34opTGDcl5cayB+VFVCd8C7FC478LJDeoWmNmwYv0hsEkh2cAxNSvhTKTzKaotBGj0RTVZdDP5JI8HcYhzjTzCFQ5wofoLGnW0l9+s3FaQaE/0ZQ56mXo1de3Qa63ZmMW6NqN5frcZb9Uk94JtE5lqWzzUVAT7UCE+pdyho8qndKUPPVzy7P0oTI5hzqCcwvKphu59nmVetXk5ekcLP2I3RYaprCcM8S6uEX0FRXZX/b1eAuO/TRRPDfFKrtkVRPWnR6i1yR9Zld4sztS1aV2Dm8hazWuVQylZfIY+ElUkxArf/Ffk32OuawCAaZ5OCzUeasKfpKh7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y2egajamhqhuYwVW2L7rWvGHEHU8tCSk9bAW7ihusjo=;
 b=eISXfzDw0MCIEqbtE2pHCFipwXMbsYrCwG8mmRW8zoWR1hBJoCgZ/ZISMwyRfL2k7aOlP4JhkSIQmgwnv275/kwPgyvvioabcROYynQT+MNCPSC2V1GrdFO4yrHsY1hzL2OhvQFdEZQ9oXYOXxjSDbpn35GjFLk0KZpll5nria1O+4GB8ZSl9Ie6VDmleZOLf3zJRRe3Fd2QoYzTV85LtTFSPzxLto5GFencgK5KwBwL2+P2g7nzkPeBNTUIBpHbqQPZRi2JdBdhSRzuX2++brNDsBI5ZB+N/zAszeKlqGvnykeuBeDUXlCRI+DrwpaiouLedR0VlysAvNlzVL8g/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com (52.135.147.15) by
 AM0PR04MB5938.eurprd04.prod.outlook.com (20.178.112.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.20; Tue, 3 Dec 2019 09:15:30 +0000
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::f16d:a26a:840:f97c]) by AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::f16d:a26a:840:f97c%4]) with mapi id 15.20.2495.014; Tue, 3 Dec 2019
 09:15:29 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
CC: Alice Guo <alice.guo@nxp.com>
Subject: RE: [PATCH 1/2] arm: irqchip: add lock in irqchip_inject_pending
Thread-Topic: [PATCH 1/2] arm: irqchip: add lock in irqchip_inject_pending
Thread-Index: AQHVqbN5/wzTXUO1YEaDqJRJvOGoW6eoGqIAgAAAlhCAAANTAIAAAjbA
Date: Tue, 3 Dec 2019 09:15:29 +0000
Message-ID: <AM0PR04MB44811BEC3EDE072313C1F3B888420@AM0PR04MB4481.eurprd04.prod.outlook.com>
References: <20191203084553.20669-1-peng.fan@nxp.com>
 <3408fd87-22fa-31bc-657d-8661ad3998f3@siemens.com>
 <AM0PR04MB4481FCD642715C2D03DA78EB88420@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <81533a5d-8385-9872-ef22-4bcaa30c98f5@siemens.com>
In-Reply-To: <81533a5d-8385-9872-ef22-4bcaa30c98f5@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0cce6baf-9f54-4782-0f86-08d777d157b8
x-ms-traffictypediagnostic: AM0PR04MB5938:|AM0PR04MB5938:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR04MB5938C015725FBA05678EEE1588420@AM0PR04MB5938.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 02408926C4
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(376002)(136003)(346002)(39860400002)(396003)(366004)(199004)(189003)(44832011)(446003)(316002)(110136005)(11346002)(66946007)(86362001)(64756008)(76116006)(66556008)(71190400001)(53546011)(102836004)(71200400001)(6506007)(14454004)(5660300002)(76176011)(2501003)(52536014)(7696005)(66476007)(8936002)(81166006)(2906002)(81156014)(478600001)(8676002)(4326008)(229853002)(6116002)(3846002)(9686003)(74316002)(6436002)(25786009)(55016002)(186003)(66446008)(99286004)(305945005)(14444005)(256004)(26005)(6246003)(7736002)(33656002);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB5938;H:AM0PR04MB4481.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: r8IdHmCnR402Cm1J71xrFbfPRSrAj1ocbv8tR+Gruoi6l6jNH107UwV5F3u3ovqij8IQxZo/kcdj84rMVMQ2/u4WudPBIjoQttuR+60tpGi12WSEz4+WIJv5thldMv/VHqbdS9mxC8Z2i4mdCVYKwhrugrd2rpO43bDEY46nh4q/tbCPQwhYprl32x49w9X9YhA/FdyPPo6RLCHALGqp8ZSPkfcjeUTpq6WbfW5oCUPkBEOG69RMG3bnw5C+AV2llyJLpeAbcNJbDzK1Ue7W7XdO89lSV0DTkHr/+h9B0/m0sleoWOnZx1mFuwo2McVwjw7Y6w5sU0TWiQ3LowykSruioyByhXGITDi8Ea+/oWonOGzARHD1g4OzO2P1QZ57Bw7JMAgo2wui690cHsoxXNSjuOJT3dboXD70eOofdhrfLlTReJeQ6JCg3lTrrFVe
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cce6baf-9f54-4782-0f86-08d777d157b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2019 09:15:29.8525
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +QJIJQWy4buGwUBWCNMp0FZ9nODArnnRmRDiljHn3SXAWVLXeocbhcyBUASiF6E7O4MOZiueEqMdWDQaSgFTnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5938
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=LOZDmC80;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.8.59 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

> Subject: Re: [PATCH 1/2] arm: irqchip: add lock in irqchip_inject_pending
> 
> On 03.12.19 09:58, Peng Fan wrote:
> >> Subject: Re: [PATCH 1/2] arm: irqchip: add lock in
> >> irqchip_inject_pending
> >>
> >> On 03.12.19 09:27, Peng Fan wrote:
> >>> Thinking about core0 is inject SGI to core1, core1 is handling SGI
> >>> interrupt.
> >>>
> >>> That means core0 might be in path to enqueue SGI into the
> >>> pending_irqs array, core1 might be in path handling SGI and pick one
> >>> from pending_irqs array. So need to use lock to protect unqueue, not
> >>> only enqueue.
> >>>
> >>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> >>> ---
> >>>
> >>> V1:
> >>>  The best case is only lock one entry, so no good solution, because
> >>> there is possibility that inject fail.
> >>>
> >>>  hypervisor/arch/arm-common/irqchip.c | 5 +++++
> >>>  1 file changed, 5 insertions(+)
> >>>
> >>> diff --git a/hypervisor/arch/arm-common/irqchip.c
> >>> b/hypervisor/arch/arm-common/irqchip.c
> >>> index 1c881b64..fbaa3099 100644
> >>> --- a/hypervisor/arch/arm-common/irqchip.c
> >>> +++ b/hypervisor/arch/arm-common/irqchip.c
> >>> @@ -279,11 +279,14 @@ void irqchip_inject_pending(void)
> >>>  	struct pending_irqs *pending = &this_cpu_public()->pending_irqs;
> >>>  	u16 irq_id, sender;
> >>>
> >>> +	spin_lock(&pending->lock);
> >>> +
> >>>  	while (pending->head != pending->tail) {
> >>>  		irq_id = pending->irqs[pending->head];
> >>>  		sender = pending->sender[pending->head];
> >>>
> >>>  		if (irqchip.inject_irq(irq_id, sender) == -EBUSY) {
> >>> +			spin_unlock(&pending->lock);
> >>>  			/*
> >>>  			 * The list registers are full, trigger maintenance
> >>>  			 * interrupt and leave.
> >>> @@ -295,6 +298,8 @@ void irqchip_inject_pending(void)
> >>>  		pending->head = (pending->head + 1) % MAX_PENDING_IRQS;
> >>>  	}
> >>>
> >>> +	spin_unlock(&pending->lock);
> >>> +
> >>>  	/*
> >>>  	 * The software interrupt queue is empty - turn off the
> maintenance
> >>>  	 * interrupt.
> >>>
> >>
> >> Did you see real corruptions?
> >
> > No. just code inspection currently. We met some SGI inject return
> > -EBUSY, so go through the code, and think this piece code needs a lock.
> >
> >>
> >> The idea behind this was that the injection to the lock-less queue
> >> happens in a way that it won't make changes visible to the consumer
> >> that are inconsistent, hence the barrier in irqchip_set_pending.
> >> Looking that again, though, we possibly need another barrier, right
> >> before updating
> >> pending->tail.
> >
> > Barrier could not prohibit enqueue/unqueue contention.
> > enqueue will check head, unqueue will update head.
> 
> Some topic as with lockless enqueuing: We need a barrier to shield the
> readout of the head entry from the update of pending->head. So, we are
> definitely lacking barriers here, but I don't think we need the spinlock
> between producer and consumer because there is only one consumer.

Lock-free should be possible, let me work out a non-lock solution.

Regards,
Peng.

> 
> Jan
> 
> --
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE Corporate
> Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/AM0PR04MB44811BEC3EDE072313C1F3B888420%40AM0PR04MB4481.eurprd04.prod.outlook.com.
