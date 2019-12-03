Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBJ6HTDXQKGQEAPRXJOY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43f.google.com (mail-wr1-x43f.google.com [IPv6:2a00:1450:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C79810FA49
	for <lists+jailhouse-dev@lfdr.de>; Tue,  3 Dec 2019 09:58:16 +0100 (CET)
Received: by mail-wr1-x43f.google.com with SMTP id f17sf1407484wrt.19
        for <lists+jailhouse-dev@lfdr.de>; Tue, 03 Dec 2019 00:58:16 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1575363496; cv=pass;
        d=google.com; s=arc-20160816;
        b=hpHw5g19kzzp4zvxZPiR1ZwdPLxuAOwcH3m5fdzqzZ2+vKDSUZf7oCMOse3gdSUX1M
         O9W21U1FulfIyQ9q0EBWSQvWkN7i6J06+EUfBAFiLw17d/GatbEwtUUlGmb5QaY5OxL5
         xD6mDhTuGu1shGUA0BuBwqt9QcjhnAeEaxDzvjB6LIiY8JqoAccrAd88fNhpHUREm6e3
         ke+m1fAgltjVGJAgu8jAqlewToMTgsUrxBsnvG7dSu4z4BKTwfi1OYhZntRKEtRclQXg
         TJ8CQtTt/VxuKtQUSpB72s7nGnhkZIqtvn+FS93fKsN88adY7AzuDtxkrJxirhoJhMMd
         0tyQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:sender:dkim-signature;
        bh=IGwsF0YvquKRHhWF1x43t+eag+W7K7Z0eE42nj/em5Y=;
        b=bZGFCwyDGddTtGZ525HRLTzwRNxI56BYsZAbl0LkHTJKfm4gETbrsmLQvhn8IC9lot
         TIZbVQiTPc+kJbGs3TmLIhYni5JOVlA5jhGjFRBP9JWP+BugDbEHF1yzIyBfuuCYFpz4
         44OD6dz81LJyla3fCz+ldkCNmJlS+7zHZ2BvRDvvdxkrRkuHHvJzu2a6sf8teVHsTYvl
         slzqgAbFdGJynPN2dLh7lOMiio0nCeD7jKbvV29IhZhmWg9DqnSMXmxjbyvP7uC58UWh
         ShagChVt0dkazabhonU01yHmit8P98Hw3YQAA9FnR/cN8TSH/6QpEjM+ZyQvCADwG+2T
         +GHQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=NOgLb3Ba;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.8.44 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=IGwsF0YvquKRHhWF1x43t+eag+W7K7Z0eE42nj/em5Y=;
        b=S4xpSZE9ZyIcxwQhGsGo0oCUuDPugfNnfQFcS4X6FgjJyUC0KOp+idRqEm/vP7Y31R
         GHBi/BLMlU8sm7It7CsGzC8oGK9xLLHBdZZnRQR/KepggbLjAsXeHJzBJ37iF7HrMrLP
         5VqRWGo7FpRrbOu1aedFj3hSPWfNSyfoT0EN5cJuMjO8cmDyxtjHlu72agPmjIURJhkn
         G4JcwTm57BiIuPKPLhhYW/gWqEVWkSZA/hFwe6NVH8TJXsePDBL+K2n9hcG96u4Ng6sj
         O2VgQVdy7miZlZThxyTwql35MgapURFp5Rat9RPuGCi+AeQQOwFNXzzx87+DsSshjOgi
         Ya6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=IGwsF0YvquKRHhWF1x43t+eag+W7K7Z0eE42nj/em5Y=;
        b=WIV+FWYOVkPqBfrYXTu1fW1yu6B9JiAo9BfeQfqR2GaXQVB4oIDgdzoHhG7er760U0
         8Com2Yjnzey+b8njjV5od4v8/aL4J3v8C0xz+rDJYWm+N6q5BagO7dN1PxGjL1azeUhj
         GIjLh7SGqMZ5YWkst8rnbTVMAe4/wOIHESAdP9eE3GySYtXGSLhQoEAnCFvdkApXGqcD
         plwhmm1IeOYnA3xyOdXJz224fGhtA+uxHZUErCqkEyHAu0mmHORhu7e/GzSiz6EM54eV
         YnZHPfpiFG4TUOZVHzi3py3ub4jk3EJtXlMVM/oFTLy7fHHMLs1mkPjbEDI0GSBVoaXv
         jVaw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAW4tVTwZ1KxJqLIgCLTiUxtHXTLZQpANbEGLHL4LRR135i8rU6w
	DTY3YLsbIuwpGPlZhU5Jvvo=
X-Google-Smtp-Source: APXvYqx85yLj6T462iHL36X9bM8MZhP+UegmXSerAvA2poyK9+H4iuUc4jXju9HNz2dXGmkdu1nNLw==
X-Received: by 2002:a5d:6ac3:: with SMTP id u3mr3961074wrw.25.1575363495927;
        Tue, 03 Dec 2019 00:58:15 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:f417:: with SMTP id z23ls776759wma.5.canary-gmail; Tue,
 03 Dec 2019 00:58:15 -0800 (PST)
X-Received: by 2002:a1c:96c4:: with SMTP id y187mr34333762wmd.112.1575363495363;
        Tue, 03 Dec 2019 00:58:15 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1575363495; cv=pass;
        d=google.com; s=arc-20160816;
        b=cLRV0zDaOmEtE8koPYBR9bpCvR2gvLB0hDVqNcurP+2g+NMagEMvLQRrnMwBHwfrsu
         Q6AZyaWqWX6QOXhjWfVSDUiqdgbPN72HWEWJaTqfgstffWSQTlqP4ZL14Ioim2dkpHjN
         Wj+sBPiMUFB+DP2jmBOVOBwBnemz7SzbOHQcL4X8JEeDm4gmGMZ8A1NJKtNBKmv9nep4
         PdLx+Tx/FZMkYHoMLjaFDYPNc3zATn1187yFp3B+JtY9LKSI9ix2vqcziL3ABwicxfcD
         z64tHcExIBMJuqkFvYFYddsDBS/5FIf5CqwxfaMsmgsjNIQy1DC5G1073u+vJXNDosCR
         Naog==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=hmYsrjuSvR+ol6KPJssmj5MCD4DNRV5NPhbREz9izeU=;
        b=i1UlJaj/8j77F+8Vg4pz/0earSLk0WYDPJ3fArfArfwoG/GqGIRSirOmammjbf+FTg
         dUgtbjkdLK3G20BawWpMVhFd/gQ+ArdGZQaOSRZDPYTMSzkKoY5tBBsbgIjjrCRWpAwi
         re1LXMNUnjfYY8BAsywoQzxOqpnYE2uHrbkpFhj8DqWHerAy3RAMx0OZGhLjm/ca2bFZ
         rbH8QZr3OTe8QAk7qsjXReoqotjWBomWO4HhyCFEOU02yj7vK5th92R7U3JBNv5LxV26
         JmOmDrP3LzZG5/FY6e+dHrgbiYgB8E37thimqeUR3tqEVxSiN8yRv8IpSN9SksOVEE96
         Nrlg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=NOgLb3Ba;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.8.44 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80044.outbound.protection.outlook.com. [40.107.8.44])
        by gmr-mx.google.com with ESMTPS id h2si125223wre.0.2019.12.03.00.58.15
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Dec 2019 00:58:15 -0800 (PST)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.8.44 as permitted sender) client-ip=40.107.8.44;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jcwUMMoDTfUF50T1jHNDMR90CD2h6+pbHOLJVwqJGucdloVgWYBBjZSGGTOqiCPLYXm9ur/Y9wUGlcbkTiZDkT4plcOwXMA6HifCxcjis3PbeEJy/Es2XwYxh9nrW4S/CxP8UlwOZHtvWHv99NR0RULwv7dyi0SgLOAp1y3wdN9yoEG0Lx1uPPG+ABHSDVYx0G68DBYwMIoYBmpX9zaQmwzZED2+T1aUUnN7YwCeerT8bP9q/UjaddUVXd6WRjkQVGlS9NrqUJy1LqOs2DDboYLiuLm5XrYwboxZudA5mmRMTQiUqnBCctWKin0oZOyAhEgljgY3ILaJdDfoG7iAKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hmYsrjuSvR+ol6KPJssmj5MCD4DNRV5NPhbREz9izeU=;
 b=LuRczNnCuq1Dm0iM3Y8YK2VdVA5YJvKzlVVIT8DrOY8fBXxIodTj+DvLj0POUOWgAvW5LIi6AZJqC0486suMQK/QXACPiBv7bPxMEnu4AW/RC/bh/+w6hpu8ZPmJAwwTNBFif+1PufVZ0r92n88FPjtIPtEsHVKrqCOHMrFwWQw+rVNZh0p5PgLnnFT3AxJdBhA+kBMCkO2dwiXwOwAzsYCQD1uY8beShbQLWMLfCHhzFgs0Ow8h7o60eJn8LhnDYwXewXEw1tn6NSDqJO7Oj+4XPIQGrDn/JrBMSp+Y+REu3kZ2nhKQsfEVEijQvEV4nr9F1MPe/de8Dc+ACb9V8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com (52.135.147.15) by
 AM0PR04MB4292.eurprd04.prod.outlook.com (52.134.126.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.20; Tue, 3 Dec 2019 08:58:14 +0000
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::f16d:a26a:840:f97c]) by AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::f16d:a26a:840:f97c%4]) with mapi id 15.20.2495.014; Tue, 3 Dec 2019
 08:58:14 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
CC: Alice Guo <alice.guo@nxp.com>
Subject: RE: [PATCH 1/2] arm: irqchip: add lock in irqchip_inject_pending
Thread-Topic: [PATCH 1/2] arm: irqchip: add lock in irqchip_inject_pending
Thread-Index: AQHVqbN5/wzTXUO1YEaDqJRJvOGoW6eoGqIAgAAAlhA=
Date: Tue, 3 Dec 2019 08:58:14 +0000
Message-ID: <AM0PR04MB4481FCD642715C2D03DA78EB88420@AM0PR04MB4481.eurprd04.prod.outlook.com>
References: <20191203084553.20669-1-peng.fan@nxp.com>
 <3408fd87-22fa-31bc-657d-8661ad3998f3@siemens.com>
In-Reply-To: <3408fd87-22fa-31bc-657d-8661ad3998f3@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 08380eda-dcb9-438b-6ed1-08d777ceee7a
x-ms-traffictypediagnostic: AM0PR04MB4292:|AM0PR04MB4292:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR04MB4292B0F5E61784DFB72231B988420@AM0PR04MB4292.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 02408926C4
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(346002)(366004)(396003)(136003)(376002)(189003)(199004)(5660300002)(74316002)(76176011)(7696005)(76116006)(7736002)(52536014)(66946007)(66476007)(66556008)(66446008)(110136005)(4326008)(25786009)(2906002)(2501003)(6246003)(11346002)(64756008)(305945005)(53546011)(71200400001)(71190400001)(6506007)(478600001)(446003)(44832011)(55016002)(102836004)(99286004)(9686003)(186003)(33656002)(229853002)(14454004)(8676002)(6116002)(3846002)(316002)(81156014)(81166006)(26005)(14444005)(6436002)(86362001)(8936002)(256004);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4292;H:AM0PR04MB4481.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KcnnPZr4/6gqu5hWNQpLRAgMwqcxvCKTVM1Lrr/IZmXd9kVZgVqxhtTSQl0CqaFKug5cH0MmO5zkbAXnc9+2O0+60z+pelPRATKticskNnSHB7EYoeZOZA1RhAZ6Irxo9tmcOTHwq25/pyty9tVIsaZpeGm04JawJZC7rUDxGuN5v3VEH1WK2NiiW9stVkxrUkqZWQt/s6MZOnSKV2plSQ2JuqsCJqSThGYz1Bu/TtB3CulAZEtNf6/yeXo1wY3kTabZkxxFE1Bc97avDxUgLaykAgCG9vf00Znn1UoiAubegzvZfwc3E7OFyqjfsYxvZ791BppOtYIGsJUE3NHHaO6VSDCE0jQVwar5/F8NkAojLEgQy57p6GZMSj9NhGisO8891TjpkiaNyZTeUU8mEhDF3w6RvVDbIAhGBzVlEuUoBSXfiRKTipRb2OTOwhlF
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08380eda-dcb9-438b-6ed1-08d777ceee7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2019 08:58:14.2744
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZTjBMKOev9FMQxmwfqcBDQkOkMB3CdX2QW6QjoEi0gm67AUdD9roX/yEKY3tiT6GLoR2bZEjwdOcujXfyXk2fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4292
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=NOgLb3Ba;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.8.44 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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
> On 03.12.19 09:27, Peng Fan wrote:
> > Thinking about core0 is inject SGI to core1, core1 is handling SGI
> > interrupt.
> >
> > That means core0 might be in path to enqueue SGI into the pending_irqs
> > array, core1 might be in path handling SGI and pick one from
> > pending_irqs array. So need to use lock to protect unqueue, not only
> > enqueue.
> >
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >
> > V1:
> >  The best case is only lock one entry, so no good solution, because
> > there is possibility that inject fail.
> >
> >  hypervisor/arch/arm-common/irqchip.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/hypervisor/arch/arm-common/irqchip.c
> > b/hypervisor/arch/arm-common/irqchip.c
> > index 1c881b64..fbaa3099 100644
> > --- a/hypervisor/arch/arm-common/irqchip.c
> > +++ b/hypervisor/arch/arm-common/irqchip.c
> > @@ -279,11 +279,14 @@ void irqchip_inject_pending(void)
> >  	struct pending_irqs *pending = &this_cpu_public()->pending_irqs;
> >  	u16 irq_id, sender;
> >
> > +	spin_lock(&pending->lock);
> > +
> >  	while (pending->head != pending->tail) {
> >  		irq_id = pending->irqs[pending->head];
> >  		sender = pending->sender[pending->head];
> >
> >  		if (irqchip.inject_irq(irq_id, sender) == -EBUSY) {
> > +			spin_unlock(&pending->lock);
> >  			/*
> >  			 * The list registers are full, trigger maintenance
> >  			 * interrupt and leave.
> > @@ -295,6 +298,8 @@ void irqchip_inject_pending(void)
> >  		pending->head = (pending->head + 1) % MAX_PENDING_IRQS;
> >  	}
> >
> > +	spin_unlock(&pending->lock);
> > +
> >  	/*
> >  	 * The software interrupt queue is empty - turn off the maintenance
> >  	 * interrupt.
> >
> 
> Did you see real corruptions?

No. just code inspection currently. We met some SGI inject return -EBUSY,
so go through the code, and think this piece code needs a lock.

> 
> The idea behind this was that the injection to the lock-less queue happens in
> a way that it won't make changes visible to the consumer that are
> inconsistent, hence the barrier in irqchip_set_pending. Looking that again,
> though, we possibly need another barrier, right before updating
> pending->tail.

Barrier could not prohibit enqueue/unqueue contention.
enqueue will check head, unqueue will update head.

Thanks,
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/AM0PR04MB4481FCD642715C2D03DA78EB88420%40AM0PR04MB4481.eurprd04.prod.outlook.com.
