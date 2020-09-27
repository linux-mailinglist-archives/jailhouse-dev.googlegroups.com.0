Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBEGLX75QKGQES24F7KI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x140.google.com (mail-lf1-x140.google.com [IPv6:2a00:1450:4864:20::140])
	by mail.lfdr.de (Postfix) with ESMTPS id 34451279D42
	for <lists+jailhouse-dev@lfdr.de>; Sun, 27 Sep 2020 03:06:25 +0200 (CEST)
Received: by mail-lf1-x140.google.com with SMTP id 20sf785954lfg.23
        for <lists+jailhouse-dev@lfdr.de>; Sat, 26 Sep 2020 18:06:25 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1601168784; cv=pass;
        d=google.com; s=arc-20160816;
        b=ZWj9TsxNqz2zjvFQlJp6XjUTNa7z6wE1/Q89poMLk2DvRY1gsfMSfcmoErDL1ETgwx
         +O7sgXv1e+6czEndEvaoBt6IF4p7SumwInZ7H7gj3qIL2hRjXfl206910ye9M7TXMpNI
         wj6W2V4a31N6OaVJSJ7l1bf9+GnYw+PRHWWzZVXCpCRX80z8V69lWW5TvS1XR1uREcOe
         Pp5rQ+jnKlHxsajXQeMEqlxBQPABAzPt91Vt+6SRVF9ismcYGYChtwbRAmn2I7bjrdQ8
         A5jEclWUJypA+vnfmReScWx2BFh75E0GIWwItlEhdgqD8L1rkoHyGRmiM+Xi3+Cq2yit
         pMWw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:sender:dkim-signature;
        bh=Lm0yXGWALv5OtH02UfOcml8xq9WAPl+ehDUjIFoMd1o=;
        b=ZzjTZomkbU8qVBT9DJcNJnmf5bqlZYGfj5+ro8XzYpIpudgE4/9SBGpm5WvTR1mI17
         ZC7mM1gezP1wl5aCWzHFIQNtT1Qm4Ub8b3JRkIFXOvIbBp1ZOE7Sd33oECKwIQZHDR2F
         xpoUlS1HvZE4uWyoIR7ZjO9l42T7MbbvBDKTq1qpPyHTQP+WwMrKso+uYs1jxEb6HowX
         sbPSZbSjSbQ5Y+68UpTMVa8NEB9a2BXW+9nK0G3Iy4NTkZaOUfVE2W/ph8j5GZibUgCF
         HJ6taPMovsm7hslGr7Kjs7VcNNfQUu4Xa3wrrkKcFtxmQN/yxE1zdA0t1dmTLauhZ2IV
         3fHA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b="jx/qjMNx";
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.2.89 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Lm0yXGWALv5OtH02UfOcml8xq9WAPl+ehDUjIFoMd1o=;
        b=iHzaOqLK3OQJ76rIPhw3xpOg0yEkpNNPkrtURnORp+Kw6KjNEr4fZzAJw7yJHc4Emw
         b3ttTUSUfc+Wr4h1qtacLdtVDynvuh7xsMb7KKOlKDnOSBWBl9GBV7kLfohCXCC0R+1f
         v5Ibphrx31/6DE7omAozaKG98IDdSUbTbggvjDHidbKdUwn8EON1QdSAhJYfVJhmM+fq
         lYF4C9zSBS3Rp+49rKlPc0SoSACeaR8oSaUgyki7qt3Ouwbh9lDCJZuvEJ8dJF5PNRCY
         Kz/LhpFSuxLRNQz4HGB31QCOmikihpmd7VP87g3p3sNlm9P7Bo9TTNBQIf+wW/d02y1q
         E7aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Lm0yXGWALv5OtH02UfOcml8xq9WAPl+ehDUjIFoMd1o=;
        b=q22Eoyto2uISFCy+LzI66apoao7i7j2l/RiDNZwsv6Z3YoqiRNIDs8j9sXlpxYVkMx
         QPuQU2xGaB9wrbIYw2HH/HkOBxEjTfw8iCLcT4/OsLLxuFd+p3DVo6cmFH49K0iSSBV3
         gp8fIqRH/iA0AlvcGFKEPcYZvpjEjlhux0kD5Ll07p9tFLgczxFP6S+VcJTZRFxnQbKZ
         WbtS6yrbUxGJTm8NbGwLN6puhwLsGx1DbkWfSlENvE/OTcs7lSt0D06dgzvuhN4fZpCT
         2pO6IfP4Y2A6gAFCpeM2uTiZ5a0eu0zJTs742sAsx6zCnOM8E4Zz5cPZL3TREV5gw/1r
         ad/w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531W6+W/4IKY+IPzxjD3csQ6gcxPoXOEh6c2Ip/LkRavJL1CZc9D
	xnIT/2xYjs6ORRiY4ZVaq6Q=
X-Google-Smtp-Source: ABdhPJzkVo3ijKVPxwGcmzQdJaF0wvw/p999eW0Lzu/uXOseirtmyinEoiCO7Zlri4TWhxtW1ar22Q==
X-Received: by 2002:ac2:5541:: with SMTP id l1mr1897492lfk.89.1601168784699;
        Sat, 26 Sep 2020 18:06:24 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:c7c8:: with SMTP id x191ls2397652lff.0.gmail; Sat, 26
 Sep 2020 18:06:23 -0700 (PDT)
X-Received: by 2002:a19:ee12:: with SMTP id g18mr1920427lfb.515.1601168783599;
        Sat, 26 Sep 2020 18:06:23 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601168783; cv=pass;
        d=google.com; s=arc-20160816;
        b=jcA5s8fp7mFoy6ZsepedqHwIv/+y1MyyRAkBXDWlTPpzqv71sEaqYbb5HtmwSJsLSB
         GvM4AG82Ne4b0WHo/OLy2M6Fyids2Q38uwIAQcPHFoYrGoJBvDkuswaCShbbVyuQI2IS
         oMl1j5outNNPsqNyjY62whfpieVEB9RrdAJHyvKP9W5ASuiyOISfxwLPuvHULeMEwTLZ
         d8w/V9DHPjL4zBDRie2X+jxEK27/I0TTu8YXg/2MzE2JOm7Jv0tgBCNjFmR0zBHQJcTs
         NQd+LXaENTsIzS5G1lhBu+8trG0JUxsHSn7xY0gxew+5hWNGpPm1TxzuVNWhnEyJQd61
         GzNg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=RuURM6osI0yoRWPJev5jU7JLEYmUUV87JISO+jzcKWM=;
        b=EiaqceD6Rrp9gCNKVEJWgNONRVM+3Y47S6j2x8puVMCkqr1JUKeVPzh7zlFtap3Tm8
         UUoQFnwQcw+bJiG/l3goTryJnILwnKxeMwehmy9J4zbPj4BfMH55S5XwxSuUoHrBEWS8
         tRVCCd1QXDMwmb+bIQVlVDO73g72jSY/yRQUFEsUH1HR28W6Q3yceeeqVC+Ec2omNUs1
         a1kGdWfSd9rsUfwaj2dlnigxmmMh33YJ7DeflKo6ppKOevkmc5lHrTYb0RtPm/FYPWDC
         LXyDMJQkR8xp/qkgrG9rFnSEYw3spRvNNpcEpghN6xRnTZBDtmGyWIrc62Wyfbe55Pju
         ynRw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b="jx/qjMNx";
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.2.89 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (mail-eopbgr20089.outbound.protection.outlook.com. [40.107.2.89])
        by gmr-mx.google.com with ESMTPS id q20si79804lji.2.2020.09.26.18.06.23
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 26 Sep 2020 18:06:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.2.89 as permitted sender) client-ip=40.107.2.89;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A+cW7GIlwFy1RMGELHUR1jpFF3KR+AyNpbiE/T0anrGz+sAY5qPBcxajh1vADzBDlQPV0q1jqiKuwr//oWGggQ6iuqAzmMFx7KHXYiKw9aXARm2+XnIgg7xQSWhXV7fHE85Y0M5vcg62XHEyHa7x47QVbK1c6rxpU3M3DJisIS3IYEmcAhHDABUN069H7hqr1UQ6qq29W2nRuvqOUeWoPwo4dk3JhbNulhkNrAa0DTOXP/GQtBCgoJQfK3+nLh8QXZvs5ZXmdSpXqSS3X52KWrqTfr1g3NSE9EXMgm8Lb215kxvCNHBEDXgmK+BAcWl9BRciv1oDjOUaHNE/fgnc8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RuURM6osI0yoRWPJev5jU7JLEYmUUV87JISO+jzcKWM=;
 b=BSyiLpVsr+YAgHkOCJXwvud+bGVR9S5ya3jVic5rtFu8S9XEgEO0f4n3ur4N7iwcQ0yDDVByn0XEI+6LHyK2ztJ7P8ccahpHq7f1ZAONr6Grb06QbPp3B1ww53Nvmut3jqHq95boghyFtZf/X5JcxDJN+LhwrYFAqmFnDM4jNnIgGsPWD3f3BlvsUoNIhafc06/j0tPfjSSrcRntui3pesRXnfojvxmn5K1dUjlTOJkFxqJDIgEOvDCNtFwVixqqrLIc1w87PrHwHRjq3cHqKFSXWh8Q5l0KTJnk2jfnvaFFEDGB3oBi3DgBd9xKIbl6npshpLf9eC9esswllgU/Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR0401MB2375.eurprd04.prod.outlook.com (2603:10a6:4:4a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.22; Sun, 27 Sep
 2020 01:06:22 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::35c5:8c71:91f3:6bc6]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::35c5:8c71:91f3:6bc6%12]) with mapi id 15.20.3412.028; Sun, 27 Sep
 2020 01:06:22 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
CC: Alice Guo <alice.guo@nxp.com>
Subject: RE: [PATCH 6/8] arm64: smmu: Drop duplicate error messages
Thread-Topic: [PATCH 6/8] arm64: smmu: Drop duplicate error messages
Thread-Index: AQHWkxjhFuWnDkXYk0SLlUpOr0UBvql7roig
Date: Sun, 27 Sep 2020 01:06:22 +0000
Message-ID: <DB6PR0402MB2760B0C979C4A651C2F9B63D88340@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <cover.1601023807.git.jan.kiszka@siemens.com>
 <47b390bac76c1ecb797ed6ed2d7c81373e1cc923.1601023807.git.jan.kiszka@siemens.com>
In-Reply-To: <47b390bac76c1ecb797ed6ed2d7c81373e1cc923.1601023807.git.jan.kiszka@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7464c9b2-a824-4f6a-1d4c-08d862818ca0
x-ms-traffictypediagnostic: DB6PR0401MB2375:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR0401MB2375601A778C76E7B32B2A8D88340@DB6PR0401MB2375.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cIvKtJ5qgj9sQkmrcnBinGGfdl9EnzmZfufSGzOoGwBrRsAJyoOzkhifiWzQrWbwU27ygNH/1bI63HFCHvrViMl2RGwMtc7YjQQT915N1qQk4ST8CbM4V7CM3q2Vm/z1KzEaYqz3yrL/sVF4lkBFVgeZNJo/oWVtGjXxM18+MYWB3gifY6vSrQX5SniuOapmlN79PNDm5D58lXq0TBeHiTxXeM2wuHvaMlviXBdaftgiUJ3UABpcepmzLQPUwS7jVKh8Us6jdu0yPGvX3hkxe6FlxNAlF4/2QEulQOsqDzCZS+BT+H96TF5j+6yFag1hXb6rsJiBLiFvc1/2QTrjdJrv2wg1NlkTO91GNZl77znqLcHRJKoHVIgg4fkfcMpL
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(396003)(346002)(376002)(366004)(15650500001)(52536014)(33656002)(8676002)(9686003)(26005)(2906002)(83380400001)(76116006)(66946007)(66476007)(66556008)(44832011)(478600001)(66446008)(86362001)(55016002)(64756008)(71200400001)(186003)(7696005)(8936002)(6506007)(110136005)(4326008)(316002)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: d+ImuE/mkOkittEPSipeLdrEqBB1DVWBCV+IO+cwMnZZ64XqKK4o5WfJfQHh5QIvH9SwWuocCboMAzLZfr9Tvk5Crr3I8pGlECHClkR7MWIWZM2krDqeHf7cl3cAMUjuHvNQ5gkQ1UB6bmnLyvSHUEDKRrwoohI+954Xla47v0Fq//BGPJVFjt4aEGNk0m7G2on7/o1ktroAzRktWiaeN4q4ZP6TLvDo3HJI9kWLP4OuMigskn8oldQZuPmoHhgDnGnnDn4tBjdGFzdPKAZzBEyMwGpYyMQG6/q4tOOsRnH0AaYdRCUzU6bMAr3wUb5DzjSoJOSJrsnMzerWM0Xiq9AxSPwW2gPCqUAx3MMrhtfa+sSZpkhGAEXGZB7zUSZe7OlqE6ZJPS/pugDZ/R/B+cEO5/LTrdX+Y6XMPqHGRANdyhNhy0v2K0GIR8NEpzeqJRt/gsILFgYjBd3q4iznioNRDGeAXKMslT+g448wPccyN1t6BIb6ocPSlts33dqE2flPNqRUmMRHdNEUJiMp38qRTMc1StWYcyaiOHKUL8hXnHyt2gfmg1IEpM43Jr1HHGJn9k53mCkeRe0XSCOg7nj9mq33Nrb/EvaUYbHjYVIJtz87EXhVF0K+3Ev4arKZUeo37lNTo5VyOWE8BnaN9Q==
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7464c9b2-a824-4f6a-1d4c-08d862818ca0
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2020 01:06:22.1192
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v1cRTMEwWqTWmvyO5i0vjn7XDvMkVuL++XsgWCpmnE99yZneqNx2oiXOGN8LU2Ujg2kTvJPRx+XevbX4LjrBoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2375
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b="jx/qjMNx";       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.2.89 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

> Subject: [PATCH 6/8] arm64: smmu: Drop duplicate error messages
> 
> From: Jan Kiszka <jan.kiszka@siemens.com>
> 
> arm_smmu_tlb_sync_global already reports when it fails.
> 
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>  hypervisor/arch/arm64/smmu.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
> index 2cd5157c..b89291e7 100644
> --- a/hypervisor/arch/arm64/smmu.c
> +++ b/hypervisor/arch/arm64/smmu.c
> @@ -887,10 +887,8 @@ static int arm_smmu_cell_init(struct cell *cell)
>  		mmio_write32(ARM_SMMU_GR0(&smmu_device[i])
>  			     + ARM_SMMU_GR0_TLBIVMID, cfg->vmid);
>  		ret = arm_smmu_tlb_sync_global(&smmu_device[i]);
> -		if (ret < 0) {
> -			printk("TLB maintenance operations globally across the SMMU
> failed!\n");
> +		if (ret < 0)
>  			return ret;
> -		}
>  	}
> 
>  	return 0;
> @@ -918,9 +916,7 @@ static void arm_smmu_cell_exit(struct cell *cell)
> 
>  		mmio_write32(ARM_SMMU_GR0(&smmu_device[i]) +
> ARM_SMMU_GR0_TLBIVMID,
>  					  smmu_device[i].cbs[cbndx].cfg->vmid);
> -		ret = arm_smmu_tlb_sync_global(&smmu_device[i]);
> -		if (ret < 0)
> -			printk("TLB maintenance operations globally across the SMMU
> failed!\n");
> +		arm_smmu_tlb_sync_global(&smmu_device[i]);
> 
>  		for_each_smmu_sid(sid, cell->config, n) {
>  			ret = arm_smmu_find_sme(*sid,

Reviewed-by: Peng Fan <peng.fan@nxp.com>

> --
> 2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/DB6PR0402MB2760B0C979C4A651C2F9B63D88340%40DB6PR0402MB2760.eurprd04.prod.outlook.com.
