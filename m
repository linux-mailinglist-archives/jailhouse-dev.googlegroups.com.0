Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBVOIX75QKGQEAG5VSZA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43d.google.com (mail-wr1-x43d.google.com [IPv6:2a00:1450:4864:20::43d])
	by mail.lfdr.de (Postfix) with ESMTPS id 0547C279D3C
	for <lists+jailhouse-dev@lfdr.de>; Sun, 27 Sep 2020 03:01:11 +0200 (CEST)
Received: by mail-wr1-x43d.google.com with SMTP id g6sf2951782wrv.3
        for <lists+jailhouse-dev@lfdr.de>; Sat, 26 Sep 2020 18:01:10 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1601168469; cv=pass;
        d=google.com; s=arc-20160816;
        b=Zpv8HPUtSzlXZ9+RWFtocFHFHHOrNn6BMi67KFAKUELGXOZEre3jh9hM3tOHPmwapT
         YS08W/d6VsVw1b/bd5TkfvYedOuehwmYUgWy2RhvMF8kBMptaCdtWlmnbDYKnmRLK9IW
         JmsD4NM1HM4upiQwCDfTbqDRmSw2rIMdGPuDWJKNh2j2GoiC8cZfRAkpTaCJd97vXBvY
         2SfkHyX02pysjEB18imZaR2T9HGX6GzJVidoBmMTvyWVBCCsj9yiCrQ7mCnzud2u29dl
         Te7I4AGCxxLRhu58H6cYmaU1V+jZ6iD/h20+FFr+Qf4+EH0Baqos5Nd5Qx66hU6OSTQY
         b++w==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:sender:dkim-signature;
        bh=UbXWg8wtpylR47pN1AkOAydixRaUat5IiVJQpQuqAB4=;
        b=EhFcQNgtyogQnSRCItO5vteKoHtGKiqlrkE2zs8S3vJhO+bUZVHATEFLmRu8b3zE0o
         fx5TPzlUcpSAPXlnYF+Kn+C/7gbb4uJqfH3p8k5ULHUG/Az7OfXOh4ey2BtF/XCqUY1L
         0MOn6WhyZQoqTjdYUmjjAbrDNYgFZdGQDZWs06AZD4zxokWvhTU8PndHzhQUdJKVde7u
         oa+HGplnwoG3VmpWoRUdZHzX5+hhm+2EKnaS2p99G+28xRWHxqXZO6u0rMpmMJiqfpZ2
         eHVQ3VW2vKLRmNxuNDRFpH10wZGTswMHoM/yQpX4E9wxp+RQmsyOoQntqJjxn6k4j4AI
         5VPg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=qZ1Br5pQ;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.22.40 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=UbXWg8wtpylR47pN1AkOAydixRaUat5IiVJQpQuqAB4=;
        b=BZFHgYU3ktSNPHcT+0jSqSRtJKluVRB/iOVGkEz3YSD/NZ7Z223sJXzQUGXUI1c3sZ
         YoO7P63J6W0rVOUDhSe69Qz8yDaWihwkJcYBxkH4a+z3XpkqF5OmZ2vTazGjEXYcuwyc
         0PtNivTlOsCK21Iom/xFtumXola8v+41ROJv5pb+6fppwBh/kRZ/Nq0nYlfEzuk4nGSS
         bfyB3RWYw8W74GdeOdS5XUa0WAXXhSlevN53nMf176QHnnlEat84e37/uL89vgPg1CNc
         GHCBEg0uS1wyetwty5p/3Tal1V5snItZFqBJoEiijLGxHOAp+g2sURTDaaoc73ZCbWyo
         gLJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=UbXWg8wtpylR47pN1AkOAydixRaUat5IiVJQpQuqAB4=;
        b=A5jTKXVNI9hMipRwFkW7/+HTr9OHGfruBy1szJISEMLwr9GZaVkr3sM0iIEjLOpKjm
         WZtSaGbHVZ3pHX+jf8JsOK2l5UTiM3olsxP3esCG4ip7yRY6wU06kXtRXPgdKoL32H7j
         syb12AMDodhA4sNWfoxiqOSaqHe6oFqOcCLPIMnTX4fyZNGRFm5ed2Qz8Vzyu0rpjss9
         OLlE80YglLAsGbuh/cs8dKqYtmyVBOee4UgoMvVFBQNKIveq7eKQTpIP5H1d/aMtAOI0
         oa2b9/v309UooUPASM0xld9KvY52yFJSo/XuUs1ixoK2VKwL1BueqEyF0OSojiPUuQb9
         Gbbw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530KqQvKnbe7Cd8fTfNaxgtuOAs+UuePR+FMAX0EDQn3ap6dy7Y9
	2eyewh162ixmcAmyTVcXVz0=
X-Google-Smtp-Source: ABdhPJxzJXB3nTJTtUZULeRwTMwKwUtdXk+RT1cSXZLNubsl+opdRrzivuMNAr/VNq/aZB0zi8J6FA==
X-Received: by 2002:adf:f24f:: with SMTP id b15mr12400634wrp.301.1601168469783;
        Sat, 26 Sep 2020 18:01:09 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:dd0a:: with SMTP id a10ls7748102wrm.2.gmail; Sat, 26 Sep
 2020 18:01:08 -0700 (PDT)
X-Received: by 2002:a5d:6886:: with SMTP id h6mr11977360wru.374.1601168468630;
        Sat, 26 Sep 2020 18:01:08 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601168468; cv=pass;
        d=google.com; s=arc-20160816;
        b=qo5HZ9b6baY4CDMGyjt9M5l19gKbHnW/xI13V0L1JP7B3iN67WAqIbBOZuLPx72HuP
         o+E9QXCmQKZcqxXXW3E/cnb43Jdb3gP0ojH8AfA/PSC9XWBjaY32sveJiv8ZedaAwbQV
         W0cCFH95dTNRR70RP5+ikgNMNmn7nO+gSzi/SiYtlqfFUOK48dHN6NtHutRYrHkkDAAl
         xxLvunRnFfblDYqZY9eOgG4ALc/VUMYUVwhG2cd2V7/pY95IG1TrMsfRbBRQoDLE4D1z
         8YyJdtRE6XaiEesMvbn/h6nKGtF1hzDU7tn543ny4GrzhoR0YfMPAMVKegmoOI8WMF7d
         /O8Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=eshkNHRv8W0wEG15lWLx6f4EUlh53RXCSu0LdUzYvGY=;
        b=yGCGA6TQyOgW6z5Ok/QKskC32R68UNfKnRnpF9BlJnsOCSd8NCdSEjQ9eEEaG7qov/
         GBdH72pmNMpXyY+YPPExGqhGyqPSptse19OrFXTrcMQiQUr8Repl/KNddNEYL7XpUWhy
         UVqbThbqUChBfbSDkluZ2hGCqAi/wZSaJapLImSdjkyc/8eHxHW7mOgx/gjFWU1ZtpGa
         /g/oWwgMTuIeDWFpUe8bpFf5TYClrx7cNxc4Tvm1CJfH2DBv1bYE4vN8AaTGaZKA1px0
         9UtpP3bwmYJxpE+pKMT6R5P94PrcleNrBOrsxPyK8R7Pd7jKqPJY+RX41mginAutmvMo
         j8hw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=qZ1Br5pQ;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.22.40 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2040.outbound.protection.outlook.com. [40.107.22.40])
        by gmr-mx.google.com with ESMTPS id z17si79330wrm.2.2020.09.26.18.01.08
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 26 Sep 2020 18:01:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.22.40 as permitted sender) client-ip=40.107.22.40;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d3XfEG/HQtlT0Dp3RMWfKwnezi9rS23Kiy6FNCxY1JvFDq7zL7UXnim/9R7PRdVeQNZZOx4Xl+i/oUZLuohPhRYwcz3j+eIGYQUn4CMQqe4aInBceXTXqjW8XvG8I29tCw44HMRF1NTQK3TazkRGWXKBKeDi1cKbrCqpYAqnrnNcJosdnKzOCv6nAG3L/Xti+7GBBLa5INDJj2qpw5qQOk2wYMVHhwiqQ6fjDKGCqdrcjkUr8ovAW0HpGsUObY7tejQin7kx/XIHGsHbdrky2Ch9kDPVBDrLK4jB8cwmlWGhTXd1SeStqcKmlBPT3JOCnoCW9Iy+A4a2ynwJc8zwbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eshkNHRv8W0wEG15lWLx6f4EUlh53RXCSu0LdUzYvGY=;
 b=ixqIzTkxHf5hme6zofyJZrAiBoPiz/l7P605LC+ZDh6Z+CZrTLKUW4sepkuTlNVjtjGstMQ8+flnrONn+lWvV+pj2CHik1azqM1IMc+go4jkeaPN5734AwVce3vv5ZwZ4/3sMu+cNBAs6pZNDraaN894cAjy3W2UipsTs/uEHYedXJytjXxoU47y33jpysHK/yDKfVpePVNKsoa3inXWn5j2Z3j3QoEIzdbfn2NBPIHuyW4ZT+4XwTIJHM7IuMIF9vgSq5vuF+A5BIv9uPj7b+4RWGeJEbi+GkQ8t7z+1Ci7V1FaA8kLVWMns/w1RjeRKx61TAgnt6uFQUVhIaKG0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR0402MB2935.eurprd04.prod.outlook.com (2603:10a6:4:9d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.25; Sun, 27 Sep
 2020 01:01:07 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::35c5:8c71:91f3:6bc6]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::35c5:8c71:91f3:6bc6%12]) with mapi id 15.20.3412.028; Sun, 27 Sep
 2020 01:01:07 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
CC: Alice Guo <alice.guo@nxp.com>
Subject: RE: [PATCH 1/8] arm64: smmu: Simplify __arm_smmu_tlb_sync
Thread-Topic: [PATCH 1/8] arm64: smmu: Simplify __arm_smmu_tlb_sync
Thread-Index: AQHWkxjh3l+w06vgb0+aK5HG4zdZVql7rQyw
Date: Sun, 27 Sep 2020 01:01:07 +0000
Message-ID: <DB6PR0402MB27608E36E5F701C1EACB68B088340@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <cover.1601023807.git.jan.kiszka@siemens.com>
 <c1a7dd847f9b06e592a93d51ff0f50d7f6d88b37.1601023807.git.jan.kiszka@siemens.com>
In-Reply-To: <c1a7dd847f9b06e592a93d51ff0f50d7f6d88b37.1601023807.git.jan.kiszka@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1bdc29d5-56b0-46ab-466e-08d86280d103
x-ms-traffictypediagnostic: DB6PR0402MB2935:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR0402MB293579BE5647AE52A339FFF488340@DB6PR0402MB2935.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MFkqSboGr5PeAhCie+axt2KGsFVGSB5LTMj5B0IcOa4DWAVasCGQ4zktEo1J8HGr0T+FP1XzY0HpByYCmF0PjQAltUz0VofKKOpgbnny/c6akHTvmBo1ERlgAwQqGT1zxD8FJq0o2TvrmKrtsWMmxyjp8hkWSQMEAMZj83mZnNFTr7o/58ySZtrYXU9XxvbAOqgy/N4wwbf5simZysvGXWGTZdeyWm+CXf7INNS/puf02IGIDgU6Oaq0HzlAUpNHXF8s2VOFTh9Ssdvk6Li+LgMbm1rwsV1WrqDFzN+zp7GsJuCHyzD85547SVsAgkYO9ovcBOVJN3GC3Uhoy8+0U9aA0hWT7+KQCLmZYR79K1bDRnqm7yAyjyLpvi3WqSOT
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(346002)(376002)(396003)(136003)(86362001)(8936002)(64756008)(66556008)(66476007)(5660300002)(2906002)(316002)(478600001)(26005)(186003)(7696005)(55016002)(9686003)(52536014)(71200400001)(110136005)(8676002)(4326008)(83380400001)(6506007)(76116006)(66946007)(33656002)(44832011)(66446008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: pAG5qccMFrLjWBFssjzT8XVkYIyZ0m4Dpn0mgOvll5zTzd7kq8QFim+TWKih6Oin1Twh7qbvrRY0jF9UpSPAeQP1KQLp/zG85M4WBOQdbNS8a5wtAUKb2W/zNmXMh3d2lIp5XbZkTVJ3DMmc55vxmTKA/hiEUlH6fNRImW0FO6c8j6PT2FsvEo2GuIRxw1Dak6u36eCkA2pOA8S9a24l5DOfxpNuKsQYlT3iAXptNVYVA5d1ISrEWOUAyqypWMXIRMtH0fjqdK+nx06n1D3WHq+uBQH2c4EBdpNgZjtWIzAsX25NIaFpHciKknUZEK4YeZGtx0LS6lYs1Xq1tTVroRr8XV1efJ5Xm0Y8hiVuMgGC5V8Q9JmrEPA2VH8XaF3Sua7x12EqzbqlYpXujeRe1Usw+aRxdsQUrfgB1ExaUD2GLM4gjTZgYQBcsyeap3RtTTm0bSGu7r7vGrFkSIYPsN0ohOWQ+b3DsPYWye0xtvX7IODsvNk/hWqxYk8QdYLDsWGYADZ2U5KnrPuOSwIRUg4YBhWkn5Q1cgDNsThmCwf7qEFXgH7gGLng4ZuQLH3gxH4BlYKg04creHBEYAtUyEeNxH5jR7Bd9qFw4wiUDuWaZPQ0de+kq6YLsjO4BUIjqdVuU2x37sFKah0iwsm70A==
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bdc29d5-56b0-46ab-466e-08d86280d103
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2020 01:01:07.4274
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3wXbljQc5NG3izvYpRzZq/r4Y+fkWaLsjZuYS50vX9AnL/n63ay345VpdNkjlQLLSLB/oGYQL4TCbiR8HrRQ5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2935
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=qZ1Br5pQ;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.22.40 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

> Subject: [PATCH 1/8] arm64: smmu: Simplify __arm_smmu_tlb_sync
> 
> From: Jan Kiszka <jan.kiszka@siemens.com>
> 
> No need for a two-stage loop here. Just test and then delay before the next
> try. This aligns us with the original version in Linux.
> 
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>  hypervisor/arch/arm64/smmu.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
> index eea5d2b0..8975e8b7 100644
> --- a/hypervisor/arch/arm64/smmu.c
> +++ b/hypervisor/arch/arm64/smmu.c
> @@ -67,7 +67,6 @@
>  #define ARM_LPAE_TCR_PS_52_BIT		0x6ULL
> 
>  #define TLB_LOOP_TIMEOUT		1000000
> -#define TLB_SPIN_COUNT			10
> 
>  /* SMMU global address space */
>  #define ARM_SMMU_GR0(smmu)		((smmu)->base)
> @@ -325,16 +324,14 @@ static void arm_smmu_write_sme(struct
> arm_smmu_device *smmu, int idx)  static int __arm_smmu_tlb_sync(struct
> arm_smmu_device *smmu,
>  				void *sync, void *status)
>  {
> -	unsigned int spin_cnt, delay, i;
> +	unsigned int delay, i;
> 
>  	mmio_write32(sync, 0);
>  	for (delay = 1; delay < TLB_LOOP_TIMEOUT; delay *= 2) {
> -		for (spin_cnt = TLB_SPIN_COUNT; spin_cnt > 0; spin_cnt--) {
> -			if (!(mmio_read32(status) & sTLBGSTATUS_GSACTIVE))
> -				return 0;
> +		if (!(mmio_read32(status) & sTLBGSTATUS_GSACTIVE))
> +			return 0;
> +		for (i = 0; i < 10 * 1000000; i++)
>  			cpu_relax();
> -		}
> -		for (i = 0; i < 10 * 1000000; i++);
>  	}
>  	printk("TLB sync timed out -- SMMU may be deadlocked\n");
> 

Reviewed-by: Peng Fan <peng.fan@nxp.com>

> --
> 2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/DB6PR0402MB27608E36E5F701C1EACB68B088340%40DB6PR0402MB2760.eurprd04.prod.outlook.com.
