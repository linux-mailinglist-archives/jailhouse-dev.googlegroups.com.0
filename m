Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBZ5XZXXQKGQEPTVIV2Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33c.google.com (mail-wm1-x33c.google.com [IPv6:2a00:1450:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id 5691B11E0F6
	for <lists+jailhouse-dev@lfdr.de>; Fri, 13 Dec 2019 10:37:44 +0100 (CET)
Received: by mail-wm1-x33c.google.com with SMTP id o24sf1638752wmh.0
        for <lists+jailhouse-dev@lfdr.de>; Fri, 13 Dec 2019 01:37:44 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1576229864; cv=pass;
        d=google.com; s=arc-20160816;
        b=YnDUtxldvdr0xl3ka3optZFYVF+Vn5/XKFwrz9c03s0dacWNrGkV0Ts448kRPBVAoj
         /kW1WDrDA+/DDo7LzkdtyQkUbxoJuPTQ8WdJ9vVM9dM0LQJn5i2Q2fe9vJwkmMJqyMC5
         EBInBxzT1UxdW2pUaMjwlGX+Jtc0JygFfLaLY9RAK6x6oJo2Q/EdG/OeYawjXZRezuB9
         byDiUbD/05rUz159aHXf+lipeEFD2oTEjNjjw7zSGcBvjJ7mDXU3z4pmIhr9pWHlRD8j
         AXDs9tA2UK5YGw/S3k4Cz1a6+sqDy2XLNd99R2zsi03VgqzRPiRNmeOPDCrbdqsYG0Wh
         11qA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:sender:dkim-signature;
        bh=hUQXMNXRL53cShe3M8l7D63EFC1qS512HpOfEA/e7Eo=;
        b=jp+WmFtQ4ijHdrGxSVSh1UBTA58T4fcQZSvbTZP/Rqfh98kDlMybpRmiqcqTyDw8Br
         QugT9wUNvJCmfNdUja0BDOlGnBFG82PjT9sALXTMHutWYM5nSelPJuQHXjSvgb4uaedz
         r14Mo6+xBfzEamPCXQJU9V+ROIFGCozYx5AX2W0iui/mG6d257n35LTo8hHgwCOd82Z4
         oqbr/ZQnwViHY0bfVDbOkFkyz7iSsfrdiumLLsndEumDiHnZAXBce2SXcAioHMJzMwJv
         1sd9Yk4EOF5+/MvKNrQ2KyxRasdeuJiZtCjnzcODV2g4VzDu3BgkuSaPcRulSXxOziES
         nPwQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=RBNYlzcF;
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
        bh=hUQXMNXRL53cShe3M8l7D63EFC1qS512HpOfEA/e7Eo=;
        b=agLo2V/ymNOGrjQ6XSao5gaXVcLDCCw/rbWk3Ywt8ZJuv84DCOq99KdaKGSM34P08T
         z1k5RSfPU1ctYWN7XRtCnUIp4s6tzpTYvkb8WQVtKWf2zy2g/1QYBnmtDqVHUNBlxCzS
         +GVJQqlD/ntWL9iSiPAM+FAdRtO8tGSC09F7adtwSOaiho9EOi+wuNkPQQGIkzjaFs99
         Ro0WgUDUGvkOtF3pjPzhtjnbDu1plHtlV4k2FO9Ekkhl09J4w4DG2PFNsku/V2mFxU/V
         fMduiNLer9iTuRDMT477W+T4tCpnq2IMNzsmmFmSjqHnk+NHdwMWxegn4/LQjsLx80gT
         0I2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=hUQXMNXRL53cShe3M8l7D63EFC1qS512HpOfEA/e7Eo=;
        b=QSgXbZ364aVqE4Gg2peji1FPeNQ8YaqTHBNVpD1pIP6NyHFWd6EWQrZpsk7jfn1Mtg
         3VmLckMfhE+QsO7LuFmkdkJg4jFQeAr4aPB3kTlQ5FScoQF98OeAEvC1KsqKDOEoV6xi
         zdAqzUMfYVxbMGHCf8A51/sIZckQfUwbJz2HwCsdjhrEERev124iUMpQrYR6p6T4sywi
         goKb3XCzhx5B0IEeMESKo629ux586mpD8H7BwB8lZlI2XKClkcaDK9DycvCocA9t9tK2
         dGF5FunPdMvyTozOQO8PpogAOb997Zp8ojNgJzWG683PmCV8bopW9Rs/4mwZiwUGXNOA
         +8vQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXBiZW/Rh+WqJZ4QfUkRlkLgEvL4Le7A3XWwDBEPHr19hS7G5Ie
	8Eq4yCLySksq35pkLd3u15Y=
X-Google-Smtp-Source: APXvYqxY2MPahzc9+M3cqBl4X9zPJJxMroOc/AizvKhBi45tqR8J6XToFQzGBewyeLRQjnh5AOBpWw==
X-Received: by 2002:adf:e70d:: with SMTP id c13mr11679549wrm.248.1576229864007;
        Fri, 13 Dec 2019 01:37:44 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:7ec9:: with SMTP id z192ls4714894wmc.5.gmail; Fri, 13
 Dec 2019 01:37:43 -0800 (PST)
X-Received: by 2002:a1c:6404:: with SMTP id y4mr7866611wmb.143.1576229863359;
        Fri, 13 Dec 2019 01:37:43 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1576229863; cv=pass;
        d=google.com; s=arc-20160816;
        b=mgQPqZUTSYdw19GLvPKUcd4m34DIfHGP4jUzJRwZQ1Q/r1wvo5c501w62QFDPw0V6H
         SlUSG2yQmhShoGRfHCwTdfkQ7N4pPcG9tf/YjW0CNE+m7lQyZGnAHqOTlLOXxHS5drUA
         //Qlqx6lRVxzcl1alNlV70p4K4TdPHwnH7WlkMQpRebMr4y1TK9VR8IS1J8jnNhQsA9D
         aMvV//fsYFy5GsfkC+iuhym79J3gEX1rGhCPlX68wXjgjYbdKrAw4HWUagGAAT+FLPoK
         TnKBkjDDncDGou9rDGrOoQuNh41HtajqaUUOlgVnE7wnFOY0OlaPMXkafexkkko3gCu0
         fBFw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=FBtLdvNsMlo6RCfECdQGBGLd38YBclOR8dq889TEGZA=;
        b=yEgUB0VjkJsAnqsXfUROTDtOI8Ccgpfxurh9PApsukxXSn2JpKfwiOq1GxpzKl1zRp
         7Ow/mA+G7WQCKh+le2ActQrPSlSTqSWuv0dvE0lFf+ZUGQVvU37aDAw1/Ifowx0kRHA9
         98C2sWbw3fjpRNxHx3V2b1yB6aiDqSaL4IH1ui5hzWjqBYuBfP2JTdrldgZU1mmzUbL9
         WDkLJe07GMDyC8VpIBvYALADtcnHlOOZhXihaDRIzx2FycQxNKaJubOzL5q5uUiJuM73
         gIOkff2eanbwAjjaaz7wsK2dXhZD+g5JM9yIuVd1rvbJ+owMDch133JyaRnSZvt07AxI
         3qfA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=RBNYlzcF;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.8.59 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80059.outbound.protection.outlook.com. [40.107.8.59])
        by gmr-mx.google.com with ESMTPS id u9si210484wri.3.2019.12.13.01.37.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Dec 2019 01:37:43 -0800 (PST)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.8.59 as permitted sender) client-ip=40.107.8.59;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eRcLdxgoJmedhUKpd8d5/+L54LgMcsbUyCdhp24tSXJxO3CGG19dibZgi7pCDCyC54gOeWllzs0qV7AHfVcs0DArxeiSeo6o1H34PGQgPGvByfhxfNCJrVmSjsCBasMBjZ4f34u7vjHH8UT0yYSYUgnnhDA/WbsxP1mPDQXSXDuK0tNKu2TW7moT7iVf/PglKYVDFitk+8L4DYEhLERZbeC/n3mOGW+ql2vfYkNykZztlnCmMV/wHvvGfcj9bsEaJLsJLiS5KshJyWBEaYMQ+IPuO9A2LPZIrmgzkTX+SLTNy1rBXX+2Ar9a5AyB3HP0j4hOKviU/Ew2wKOTifJrqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FBtLdvNsMlo6RCfECdQGBGLd38YBclOR8dq889TEGZA=;
 b=AtFHNj8zG1aWXx/AvBXbckXsgDS+zWknBFAeA7qx/4/e7jimp0qO5DYpYk2tqxprFqRs7kd/67oxBX3fAislVgBwVJSIjUAEO56MRW+6Dl+Mvjm278Mrxbzzpia6bki+KbRPn2CqqJaQt7XGGzFqdEIjRE3Cm2G5RE7I5VME8DUcw0vQjq4WEEFz6g5YswZkzhMXNxq7tq2UsNvSm1CGrgXrO00sy+nOTydaWd7ab49+6EXEjJWmyE9pkH/03mzS3rbii4LLk7byTmc7CuipcQ+x/0cNQQ98sP85ue7MMaa1CwU1K7X1EnakEe1prIfpejJH+lA9Qhn29fYLPhQXjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com (52.135.147.15) by
 AM0PR04MB5139.eurprd04.prod.outlook.com (20.176.215.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.14; Fri, 13 Dec 2019 09:37:42 +0000
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::505:87e7:6b49:3d29]) by AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::505:87e7:6b49:3d29%7]) with mapi id 15.20.2538.017; Fri, 13 Dec 2019
 09:37:42 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
CC: Alice Guo <alice.guo@nxp.com>
Subject: RE: [PATCH 2/2] arm: irqchip: fix memory barrier usage
Thread-Topic: [PATCH 2/2] arm: irqchip: fix memory barrier usage
Thread-Index: AQHVsWIncu+svSN0AUKz5pHUEDyf+qe3qxSAgAAiuKA=
Date: Fri, 13 Dec 2019 09:37:42 +0000
Message-ID: <AM0PR04MB4481C5F25BF12B3DB60194D088540@AM0PR04MB4481.eurprd04.prod.outlook.com>
References: <20191213032352.8915-1-peng.fan@nxp.com>
 <20191213032352.8915-2-peng.fan@nxp.com>
 <12b01559-b4a0-ab1c-c0ac-346cd687b7b2@siemens.com>
In-Reply-To: <12b01559-b4a0-ab1c-c0ac-346cd687b7b2@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 81fed4c3-ef50-4fe0-d6c0-08d77fb019f8
x-ms-traffictypediagnostic: AM0PR04MB5139:|AM0PR04MB5139:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR04MB51392900C1EEF595C800A52F88540@AM0PR04MB5139.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 0250B840C1
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(396003)(136003)(376002)(39860400002)(346002)(189003)(199004)(6506007)(7696005)(53546011)(478600001)(9686003)(2906002)(110136005)(55016002)(316002)(8936002)(33656002)(71200400001)(86362001)(4326008)(5660300002)(81166006)(81156014)(8676002)(26005)(44832011)(76116006)(64756008)(66946007)(66446008)(66556008)(186003)(66476007)(52536014);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB5139;H:AM0PR04MB4481.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EqmIZ+jkxTV3ABHQ8zSw+bnT5l+zCtI+okIXzzvL9XjZTmC/qvlcE4UmvDAH+P1zcqnBY6sPBrcm/Ss/RglWfvZL7dy6Qampe0C9cRxnnfobQMTnHP+r1Gxz0Tq+TG5/SzFfMXCV2M1v4TNGeot1kqaltwGdSdlJPtAbzmdfK+WSJMIzNwqy7VpV+cO8hWhSP6lMxW1Jdz7AoAt532s9MMmkekNVAbXL5Buh5TbAYAjnmi2A++ccByXuwiWEVnUAwZ47V8N6AF1gdJ0eimY3xBme7UFHWloP1uLKQCtdnNdPD5Yvroz9kpjuz0RdAXxLBfVuOl3fH6kKefatfvLTUElJUE7hxz/+toD5Sxa0G1aWdViyxYz6xQy+Nvp1SL/nw7kkue0nZwGK1Wce/EFEln69xYKCeDVq/PzSHz8LDpjK9OHoOUBIvoVzMgyU1Sn8
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81fed4c3-ef50-4fe0-d6c0-08d77fb019f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2019 09:37:42.2094
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V3qSe+OdnCWESgCIPlBc3pRNKEJ3fK9T2M8g74xrA1iXBiDiIMCiTd8VhvqJln2KpFsiUZmogq+QE7iFlBvOCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5139
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=RBNYlzcF;       arc=pass (i=1
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

> Subject: Re: [PATCH 2/2] arm: irqchip: fix memory barrier usage
> 
> On 13.12.19 04:05, Peng Fan wrote:
> > spin_unlock implies memory barrier, so no need explicit memory_barrier
> > when enqueue irq. When irqchip_inject_pending, need a explicit
> > memory_barrier after updating pending->header to make it visible to
> > enqueue.
> >
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >  hypervisor/arch/arm-common/irqchip.c | 12 +++++++-----
> >  1 file changed, 7 insertions(+), 5 deletions(-)
> >
> > diff --git a/hypervisor/arch/arm-common/irqchip.c
> > b/hypervisor/arch/arm-common/irqchip.c
> > index 1c881b64..5abf1c37 100644
> > --- a/hypervisor/arch/arm-common/irqchip.c
> > +++ b/hypervisor/arch/arm-common/irqchip.c
> > @@ -247,13 +247,12 @@ void irqchip_set_pending(struct public_per_cpu
> *cpu_public, u16 irq_id)
> >  		pending->irqs[pending->tail] = irq_id;
> >  		pending->sender[pending->tail] = sender;
> >  		pending->tail = new_tail;
> > -		/*
> > -		 * Make the change to pending_irqs.tail visible before the
> > -		 * caller sends SGI_INJECT.
> > -		 */
> > -		memory_barrier();
> 
> As we are discussing lockless access to pending from inject_pending, we still
> need a barrier prior to updating tail so that irqs and sender are visible and
> consistent. We do not need /another/ barrier (like now) before sending the
> SGI, though. So:
> 
> --- a/hypervisor/arch/arm-common/irqchip.c
> +++ b/hypervisor/arch/arm-common/irqchip.c
> @@ -246,12 +246,12 @@ void irqchip_set_pending(struct public_per_cpu
> *cpu_public, u16 irq_id)
>  	if (new_tail != pending->head) {
>  		pending->irqs[pending->tail] = irq_id;
>  		pending->sender[pending->tail] = sender;
> -		pending->tail = new_tail;
>  		/*
> -		 * Make the change to pending_irqs.tail visible before the
> -		 * caller sends SGI_INJECT.
> +		 * Make the entry content visible before updating the tail
> +		 * index.
>  		 */
>  		memory_barrier();
> +		pending->tail = new_tail;
>  	}
> 
>  	spin_unlock(&pending->lock);
> 
> >  	}
> >
> > +	/*
> > +	 * spin_unlock will make the change to pending_irqs.tail and
> > +	 * entry content visible before the caller sends SGI_INJECT.
> > +	 */
> >  	spin_unlock(&pending->lock);
> >
> >  	/*
> > @@ -293,6 +292,9 @@ void irqchip_inject_pending(void)
> >  		}
> >
> >  		pending->head = (pending->head + 1) % MAX_PENDING_IRQS;
> > +
> > +		/* Make the change to pending->head visible to enqueue. */
> 
> Misplaced. We need to make the pending entry visible prior to updating head.

ok, then please use your diff patch, yours are fine with just remove one memory_barrier
after spin_unlock.

I got wrong understanding previously. The memory_barrier should be put
before updating index to make sure order, not after.

Please check whether are you find with 1/2 to add comment.

Thanks,
Peng.

> 
> Jan
> 
> > +		memory_barrier();
> >  	}
> >
> >  	/*
> >
> 
> --
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE Corporate
> Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/AM0PR04MB4481C5F25BF12B3DB60194D088540%40AM0PR04MB4481.eurprd04.prod.outlook.com.
