Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBSH542BAMGQEH5JU7GQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D4B345BB5
	for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Mar 2021 11:11:26 +0100 (CET)
Received: by mail-wr1-x43b.google.com with SMTP id o11sf889400wrc.4
        for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Mar 2021 03:11:26 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1616494281; cv=pass;
        d=google.com; s=arc-20160816;
        b=MaWIkWACUSb0GoFJxZsF95gFEVHVehPETXxU90NWk7nriIROqgbdVpF2pL1n9X6sfI
         ENoGhG2GtRsYzwKxby2dDxsNFou5cd3Cl0ZrrsaRB5zCh2axRyz9oa8npj4gnd0+Zw42
         RbWDmRlfQhEBB7eZ8Vi8wfbsjeBEXds/UVhjlryU/buuIcjsU+2zs6ctNOKMH8gckvAB
         YOlnCgBIic/+ZP2v++n/x9hd1X9qe9Ibi32UfRAPC73qlgt3BA5VH8RimnSphq8ml6SX
         CWEsyUnjpUIXbLiDzZbZ7qSMZLGk/1xfIInZ9fSKXFpRXLlC+mr+AlYts/t2t3Az+N76
         leEQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:sender:dkim-signature;
        bh=2ukSA+nwU8ziNgiMvxup2WKkg37vdiJvmwYmqMZAwjo=;
        b=zG19YMOer8BR3VGJwF3fegcWM8+cAFo1llqFGGqas/DEkkjbizCgq6QbZ5JlQh0zi9
         0jpP58aOeY/omAJxpYsJs5y/7KSyDPqYOxH4j/xintgRhnDsOvCjUGN+2KwLahYIlyTZ
         lYafiGIPUFp17iOYnCqnPCiSExjh4hzpo5ZGJGNgxi161znnoADcfLOLfd1BDnknRRHv
         RTXfBRPtGL8No/YYQ7bYs7MuR9MfpNk8DWFgGX1aJb+Y545mJrv7Z+JbDX7j430wq24F
         A0C7HxZW440g4VZzWhnX8fNhCmBEeJn0frPW7Gi6ssQ4n3zshsghq/RXIclnj1MVOpFL
         BpZQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=p3m7uR0H;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 2a01:111:f400:fe0e::604 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=2ukSA+nwU8ziNgiMvxup2WKkg37vdiJvmwYmqMZAwjo=;
        b=rOdIz8kT65sDBk4k0V7p+AC+y1js5hmABjJ4Fmp4qJp4Yri1Wrlj/GRzoSvrRaVE+0
         PFSWt+siOJ5x87DwOxWtmdWx8MFhLDvgLvyWrnNTzrm71iotW5F3BTlaPhTlHz3l8W8x
         OO1sqZXaWKHvKBwCqlTA/wu8YUdYlw0SuIlFd9IAZ5x/waZqFYRCXJEWRhxuNCjycHSh
         3GvLHPE/hgexQ+yDNo20i5fU3o43SR3vJCUvIJpH9p52p0mHr5b6zOD01kpVWkuKmCO/
         ncPFsAOveCP8k5Yjr6JChgeZotYUlG/KitW/pUrtSr5RpVksqQBdN46/vtFs3DW45mvM
         9WcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=2ukSA+nwU8ziNgiMvxup2WKkg37vdiJvmwYmqMZAwjo=;
        b=CBgRHSB/Ff412RP8w50GQL5adpfdEQcm1QW++HCoO0+2eBf4ixbZ6zFvSTIfyK/STk
         odtUnppkl+RNE52RC+7QWOEI+iXMcgmytN23j7CdQ9jm2yz+0+jWzv7ieH+xIzwq044T
         F//Y8UIX08yySwsiqeBATmfV1PzOD+xHeQNZwYGIzhrfIe/JJvAckxIjMO1QAlch4yGN
         xAV0GkdZjXmKOfrOrT5P1dSAVclLsJtRZqgNcLTI3dy9FhTjbZkGBJOkPFo+LfNE54sr
         J93/3+I9fHHJN9Uku77kXMpauxln+DLP/SNm2rUC0xa8Fz4N6xKX3dHYncb72SxoMHSA
         ZUlQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5319Ws+bXMARc8G39lY8c/jgHUyRIJsXpfOljFFYAsh1ek3J1E+T
	vbW1qngdhjcLX7CW+6EJeQI=
X-Google-Smtp-Source: ABdhPJyVaYZJTvpIHc4km5W8nq5ldK9Hh5Ra3aoDaBft4OC4wG1GEsf0Tx6r4mQevEQ4m6zXH02TMg==
X-Received: by 2002:adf:ee0a:: with SMTP id y10mr2991687wrn.177.1616494280948;
        Tue, 23 Mar 2021 03:11:20 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:d1c8:: with SMTP id b8ls2094261wrd.3.gmail; Tue, 23 Mar
 2021 03:11:20 -0700 (PDT)
X-Received: by 2002:a5d:5256:: with SMTP id k22mr3239087wrc.162.1616494280029;
        Tue, 23 Mar 2021 03:11:20 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616494280; cv=pass;
        d=google.com; s=arc-20160816;
        b=TWqPqgPFUUGgWq62yHfUEoy+VS94n+5LOvA6YOXQW7dg9H3Ar2EuYkr79TyE3dWWBD
         /5EsaotQQCmaN7b/5sN1JHz/593GoTO8OWTNaNx9NLe7TMn75OMvTcXnSIALB0ZGwYn1
         mCaqX36mB/mzGHfhRTR4e9NUZ+xxvMioZ/bXdB1OpMFVrGU1KNu7YGX7oFtCywY3DY0P
         dn8+rgIlt+/aGfokh1ZsxpnUPTxhNjWrCwnVzFK5e3ot3EQdFmKAGTBKHDqL8k4CnP0P
         1+YR+fDcptmby/nSZSe8cYk0OX2dQ7FUQxv8MdzSDZ5M1pVi8Cryt+Xxyky6mqyLpoXh
         D2qQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature;
        bh=4dq4ljTqO7wzaOBuuyuyqeyFMW0/jv/o0mAmWpDTBQs=;
        b=YTCPNYun6hE5qgrZEWBPl9cV+815w18V4R49k2MgCVVtgGCPA3B0ZEh9CJwSJWUhXN
         gSB8jS8ZrxUq2krDGvTO94Jq4le/81SZMrhONJCcmlZw145GWG/z9Dj2gAYoMJ37VgID
         5KlQgepbHvRsV4DRByvDb5KQVSomuHaDfpksWJ+GMzCmq96o0Bqr/HzqBZJ9f5N+NT18
         93SeusGaMvAo+KMX8v3zcfNeaonLVmTAB3qdBNL8RlpEjGZjV5SRmGAUW9rv784HqNJG
         6ki7JZyFn2lmor7gGXz/03NXXv+Dj8Zzw5otIJgBAl13st69aze40SxeO5J/aJ+m4pwB
         SPWw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=p3m7uR0H;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 2a01:111:f400:fe0e::604 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on0604.outbound.protection.outlook.com. [2a01:111:f400:fe0e::604])
        by gmr-mx.google.com with ESMTPS id b6si131793wmc.2.2021.03.23.03.11.19
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Mar 2021 03:11:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 2a01:111:f400:fe0e::604 as permitted sender) client-ip=2a01:111:f400:fe0e::604;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C3L5rFMy9QOxoB9d8yN6LnUtPCP9gxJbIFzXgkR3Tq+jV0nEnZ2AhyEi9EkyGhReIYd0+CE44KOp2QokFnTSjbaJ4PdZGaf2QuhLPFDlJfMxbATTIG7pmP6TkcO48rGgFy346UMxuliIQfWXoXKlWHE2V/KNF3S31LrgJfMgmW/LY11GtN6hjldL3z89TFtvQ+I5Bq/zSgC3kqwiCY/lzZprqSvDD57eWbhOIlZPPalbeX2bJl5uuBCEqs0OphSu72TfgCcgYasO1YH3TH4qV6JuI0zC8zRzA7URrPzp7yaQw73RpWGZp7Wru1y5Ma+VopsZNFXdhCgdXQP04LQg+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4dq4ljTqO7wzaOBuuyuyqeyFMW0/jv/o0mAmWpDTBQs=;
 b=dMTOoRUADZzr/9VFcA9Vzz20Kd79m4hvtBl9MZ+MhajJuHMo2dOcNrk3jBK2en6oLuOUEscZjHcBJAwTO/TJnPw5lq0+RYMrCeCtRN9o6z5+OtfzYEGoiHwUDZFv/BisNRhENlUGRV2QPHgyPn/PxQ3ey9v3Hmh5Kg8G1w0NnluFZxN8YpbS96Vcb2eOFIgLLyFIqB9qoYpwK5nxfsRuHq2wv7L/RX41sHC+Vu3BCXEygMU8m9gQ8Uvgbiz7tji+llxaJoFzERjqc3hyS1jfyPrY91Lk7ntBsEgqODQ4RcN8MdOMXdAgqQLVXj7lig/K0ZA+VVdUw7G0T2mISgUh2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DBBPR04MB6028.eurprd04.prod.outlook.com (2603:10a6:10:c1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Tue, 23 Mar
 2021 10:11:18 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0%9]) with mapi id 15.20.3955.025; Tue, 23 Mar 2021
 10:11:18 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
Subject: RE: [PATCH 4/5] imx8mp: support virtio console
Thread-Topic: [PATCH 4/5] imx8mp: support virtio console
Thread-Index: AQHXH6j7FjWvhSxNgkWm9hWSJD2zf6qROXoAgAAgDNA=
Date: Tue, 23 Mar 2021 10:11:18 +0000
Message-ID: <DB6PR0402MB276052F96B3F2A0F956E0EAE88649@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <20210323062536.3888-1-peng.fan@nxp.com>
 <20210323062536.3888-4-peng.fan@nxp.com>
 <181c45a5-3c2f-4244-7681-119bdab4be5b@siemens.com>
In-Reply-To: <181c45a5-3c2f-4244-7681-119bdab4be5b@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b06382b7-5072-481c-5275-08d8ede40002
x-ms-traffictypediagnostic: DBBPR04MB6028:
x-microsoft-antispam-prvs: <DBBPR04MB6028B0C827BF80348CC1800888649@DBBPR04MB6028.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gVLdc7/DJAo6N63UTPlSOD+waswp+byywz+1Y3zCJdXnEgWqk/bXdtRuGuso5VIbnzggZVK/YoFI/vJYx+CStHiYqxXvWAw7JZKxp1JXs1z3G2rA26tT2lyyTpjVDcQN+coFCG0DM32Aeb73UHsa9WjFiex8x1/iZxgaAZKI3buEDuavmUbPbzl+7kIjoNSY+O5DUibUZSrtUHNjfc9+2gE/28XPzEiea+hnyjuQdlM5lUcrxWEE9taZhxRB0b1Pirhcpr1i+4kTk1iPjj2y7RQeEgNVVRr3nvTI/rFeOLdn1g1zdhnaOkqyw3GDWSu77xLLlTYQvWtYQrYifB6WVmSYnYJjRJnJ6Ibk8ECseShzcx1ptWn+OQ73j9QE59quaApAFvBPj84ENPzaxsdyUSHfC69+7TSf4mTVWbgx3w97YgBw893qbv7LutOy6ajwnx15fPddVtBS/e0nwzxHP2lQ3B+7taQMeIGDeMNBw9PU1ffhb8bLXIOcapbZvkhqME9bUeP4UIEL+6ZgL8qpB87OM1yMllI73UjC9uBX0yWwe4UvSDRLa1Yje/e+cDCG6AmpXb8xAY9ttxJPGcw66ya2DxPRGVhRgXqTqJJ7HA72fyAY5y6lo3A1m1hzz+hNrCOGjh3+ye1riauHDpjj92Pw4y2dJ8hrs6UwCPPmmjpB8EixcokpxQRNui2LJfAJ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66476007)(76116006)(66446008)(66556008)(2906002)(33656002)(83380400001)(6506007)(38100700001)(71200400001)(9686003)(55016002)(110136005)(8936002)(64756008)(7696005)(52536014)(44832011)(26005)(5660300002)(53546011)(186003)(8676002)(66946007)(498600001)(86362001)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?emhPY1U3dVBsNTB4dEV6YUxMeWxCVkk5akVRYnhPTXR5dW9tUFZFNHdhSkx0?=
 =?utf-8?B?RllBUzFzZkllZThDNWpyUktMNHR0UHRFajJReGFsajl4Q1NINnBuLzFhTEtD?=
 =?utf-8?B?cy9xZXhnNTYzRFZSMGhycnhZaFc5WlRndUgyenEzVVMvdU9xYkRhK1IyVGdH?=
 =?utf-8?B?Rjl0SDAyTnRVdzNWcFJMY3orVk5IR3NKeUVRRHlYQUNBZjU4TnJYQk13dWdi?=
 =?utf-8?B?QWE2YmpVRGxiUml2SzJIcFl3ajVZRm1jQ3lqNG9BSUgxdDlBb0FKa2c2dXZF?=
 =?utf-8?B?SlBDOUlTaVBvV0l4a25JYkJGbmMrcVhaMkFEdk9hZUhUQng5NFRoL3BBcnAx?=
 =?utf-8?B?bHBRMlhRNDhQbFcrN1NyS2p0bkVuWUZSMm0rM2tERjVUR1RjWTh2UGFQMTFP?=
 =?utf-8?B?bUdkd2dXQUx5SFpWUUc4YisyaVdkYTRTQkNsZ041Q1o4V0F0cWJ0MGRuOFdC?=
 =?utf-8?B?Ny9WUmMxRjNPWWpaU3hEdGVzaHBCMDhkOE5rb2R3WjBMQlcxN3BhYzB4TGts?=
 =?utf-8?B?cmN5cHU4WUFMMzdrWlh5N2V6N015N0djbG0ycWRpWlQvaUJCVHc5WWN0czVC?=
 =?utf-8?B?YXphSllrWDNKQ3l6bTlSMGlBSWk3dmx3d25NYWhyZ0FseHYxdk4vU3J4eUlo?=
 =?utf-8?B?NFdpd2xnRlhBV28ySFFlYW90eUhaajFXRkRHcG4rNVdGQmR5V3RDY1BhMXJ0?=
 =?utf-8?B?MGc5ZS9uTTVWTDcrWEN5SDRVbXJESmJzc0N1eEVXRUFIYkRFbk1uam5XSlQ0?=
 =?utf-8?B?SkRoaFZEengrcXhhWGRYRHZSTndRK2IwZTgxeVhzcjNmOTl0c04vYUhOais5?=
 =?utf-8?B?U3pjcHNOQ2lkbUNEZGZtNFFaTUFqNGNGNzJWVDUyMGVOTVhheHd6dzhGanVn?=
 =?utf-8?B?NVliUlBacnoyRWtveU5jVnpOaUVLKzdTTG4wUk1QQzBqRUo1RkorMHBjazcy?=
 =?utf-8?B?UUpKZ3lya3NSNDBVeWZsZ3NRTFF1Z1J3aGJzQVIxWU83UlF6RTV5TWdCQ01m?=
 =?utf-8?B?TEhxN3lRY3dleWFDZTRjbElSQlo3TWRodzY1emlRZFNTRXZtNUxDNDg5MjVw?=
 =?utf-8?B?NUpVTGJ4b0pBM2VyNG0zRy9FZy80ZFFKbGhXMGp6dnBjS1YzaGRZWnVvUWU5?=
 =?utf-8?B?WnFXaHZVZUJ4WDVjMndLR0krQmVXbGlnVGoxVDN2T1FTNVZvNmxFNWNiS1NB?=
 =?utf-8?B?My9lTy9wSmc2dUphT0czcWVSWVRJaEtCUkl5dmJzek1Ha3owTUZGTXFiM1Ev?=
 =?utf-8?B?VVhoaW9Qd3JoVDI4WDZCRGZTSHBPZDRJY21SdGNMYjlaN2VWU1g1amxMS1N4?=
 =?utf-8?B?bTdiMnNib0hzQnQyRGRIT2V5SHMxMEg1SXhvYmRoOUJYSVBqbWd1TDI1U1lQ?=
 =?utf-8?B?ZU4zRFREbTFrOGJwWW5tYUtWL00rVXI3ZC9waHlTZjFkbDZFMks5cHg3SEda?=
 =?utf-8?B?WGlKdmh0ODV5MCtvYXlrK0MyOGpieWhmOWo5alhNUW9hQU0xOUw1N2VpeXJC?=
 =?utf-8?B?eTRXdzljdUpIVWNsMUpvUllXV0NrNVFIT3FTT1VEOEdEUlA5aHluTkl6Vi9x?=
 =?utf-8?B?MFFQNWl1TFpieHp1NmYwZ00xZUN5U1Y5Q010MnkvUXNudVA1ZjdXRCs0TUl1?=
 =?utf-8?B?ZEhveHpVWjRUWUo3UisveU1IdWIwc0V5czh5d0wzc3djWGg3RHZvWnN2dTdm?=
 =?utf-8?B?QzU4L2RqRmh5UEE0dDJublhjbEx6b3NqdWVjQXkwZ3k4Q2pQcTdVUEcyaHl0?=
 =?utf-8?Q?SzOoPQ2FJL3GN/RsW5dGe7zpyo4uAOyMzHR+Did?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b06382b7-5072-481c-5275-08d8ede40002
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2021 10:11:18.0334
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gdkZbml+R6snssARGGUQiRbDxuB4AA1uYEEZs7QPc7xXZVFcU0BHcWCWX7Md7rQ7F1newUvDqyqDSmULYdQ1pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB6028
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=p3m7uR0H;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 2a01:111:f400:fe0e::604 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

> Subject: Re: [PATCH 4/5] imx8mp: support virtio console
> 
> On 23.03.21 07:25, peng.fan@nxp.com wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > Support virtio console
> 
> Not accurate: You also add virtio-blk devices.
> 
> Where do you take the memory from? 

We reserved 2MB ivshmem in the very beginning, so no need reserve
more for virtio.

Some words on how you rearrange
> things would be good.
> 
> And there is no impact on the demo-inmate config?

Not check that, I'll check.

> 
> >
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >  configs/arm64/imx8mp-linux-demo.c | 81
> ++++++++++++++++++++++++++-----
> >  configs/arm64/imx8mp.c            | 80
> ++++++++++++++++++++++++------
> >  2 files changed, 134 insertions(+), 27 deletions(-)
> >
> > diff --git a/configs/arm64/imx8mp-linux-demo.c
> > b/configs/arm64/imx8mp-linux-demo.c
> > index ff0cdffb..1e0a9f1c 100644
> > --- a/configs/arm64/imx8mp-linux-demo.c
> > +++ b/configs/arm64/imx8mp-linux-demo.c
> > @@ -21,9 +21,9 @@
> >  struct {
> >  	struct jailhouse_cell_desc cell;
> >  	__u64 cpus[1];
> > -	struct jailhouse_memory mem_regions[15];
> > +	struct jailhouse_memory mem_regions[23];
> >  	struct jailhouse_irqchip irqchips[2];
> > -	struct jailhouse_pci_device pci_devices[2];
> > +	struct jailhouse_pci_device pci_devices[4];
> >  } __attribute__((packed)) config = {
> >  	.cell = {
> >  		.signature = JAILHOUSE_CELL_DESC_SIGNATURE, @@ -43,7 +43,8
> @@
> > struct {
> >  	},
> >
> >  	.mem_regions = {
> > -		/* IVHSMEM shared memory region for 00:00.0 (demo )*/ {
> > +		/* IVSHMEM shared memory region (virtio-blk front) */
> > +		{
> >  			.phys_start = 0xfd900000,
> >  			.virt_start = 0xfd900000,
> >  			.size = 0x1000,
> > @@ -52,25 +53,57 @@ struct {
> >  		{
> >  			.phys_start = 0xfd901000,
> >  			.virt_start = 0xfd901000,
> > +			.size = 0xdf000,
> > +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> > +				JAILHOUSE_MEM_ROOTSHARED,
> > +		},
> > +		{ 0 },
> > +		{ 0 },
> > +		/* IVSHMEM shared memory region (virtio-con front) */
> > +		{
> > +			.phys_start = 0xfd9e0000,
> > +			.virt_start = 0xfd9e0000,
> > +			.size = 0x1000,
> > +			.flags = JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_ROOTSHARED,
> > +		},
> > +		{
> > +			.phys_start = 0xfd9e1000,
> > +			.virt_start = 0xfd9e1000,
> > +			.size = 0xf000,
> > +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> > +				JAILHOUSE_MEM_ROOTSHARED,
> > +		},
> > +		{ 0 },
> > +		{ 0 },
> > +		/* IVHSMEM shared memory region for 00:00.0 (demo )*/
> > +		{
> > +			.phys_start = 0xfd9f0000,
> > +			.virt_start = 0xfd9f0000,
> > +			.size = 0x1000,
> > +			.flags = JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_ROOTSHARED,
> > +		},
> > +		{
> > +			.phys_start = 0xfd9f1000,
> > +			.virt_start = 0xfd9f1000,
> >  			.size = 0x9000,
> >  			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> >  				JAILHOUSE_MEM_ROOTSHARED,
> >  		},
> >  		{
> > -			.phys_start = 0xfd90a000,
> > -			.virt_start = 0xfd90a000,
> > +			.phys_start = 0xfd9fa000,
> > +			.virt_start = 0xfd9fa000,
> >  			.size = 0x2000,
> >  			.flags = JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_ROOTSHARED,
> >  		},
> >  		{
> > -			.phys_start = 0xfd90c000,
> > -			.virt_start = 0xfd90c000,
> > +			.phys_start = 0xfd9fc000,
> > +			.virt_start = 0xfd9fc000,
> >  			.size = 0x2000,
> >  			.flags = JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_ROOTSHARED,
> >  		},
> >  		{
> > -			.phys_start = 0xfd90e000,
> > -			.virt_start = 0xfd90e000,
> > +			.phys_start = 0xfd9fe000,
> > +			.virt_start = 0xfd9fe000,
> >  			.size = 0x2000,
> >  			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> >  				JAILHOUSE_MEM_ROOTSHARED,
> > @@ -143,22 +176,44 @@ struct {
> >  	},
> >
> >  	.pci_devices = {
> > +		{
> > +			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> > +			.domain = 1,
> > +			.bdf = 2 << 3,
> > +			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> > +			.shmem_regions_start = 0,
> > +			.shmem_dev_id = 1,
> > +			.shmem_peers = 2,
> > +			.shmem_protocol =
> JAILHOUSE_SHMEM_PROTO_VIRTIO_FRONT +
> > +				VIRTIO_DEV_BLOCK,
> > +		},
> > +		{
> > +			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> > +			.domain = 1,
> > +			.bdf = 3 << 3,
> > +			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> > +			.shmem_regions_start = 4,
> > +			.shmem_dev_id = 1,
> > +			.shmem_peers = 2,
> > +			.shmem_protocol =
> JAILHOUSE_SHMEM_PROTO_VIRTIO_FRONT +
> > +				VIRTIO_DEV_CONSOLE,
> > +		},
> >  		{ /* IVSHMEM 00:00.0 (demo) */
> >  			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> > -			.domain = 0,
> > +			.domain = 1,
> 
> Please pull patch 5 before this one and do all the domain adjustments in one
> place.

Sure.

Thanks,
Peng.

> 
> >  			.bdf = 0 << 3,
> >  			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> > -			.shmem_regions_start = 0,
> > +			.shmem_regions_start = 8,
> >  			.shmem_dev_id = 2,
> >  			.shmem_peers = 3,
> >  			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
> >  		},
> >  		{ /* IVSHMEM 00:01.0 (networking) */
> >  			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> > -			.domain = 0,
> > +			.domain = 1,
> >  			.bdf = 1 << 3,
> >  			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> > -			.shmem_regions_start = 5,
> > +			.shmem_regions_start = 13,
> >  			.shmem_dev_id = 1,
> >  			.shmem_peers = 2,
> >  			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH, diff
> --git
> > a/configs/arm64/imx8mp.c b/configs/arm64/imx8mp.c index
> > a1e221f9..3f758980 100644
> > --- a/configs/arm64/imx8mp.c
> > +++ b/configs/arm64/imx8mp.c
> > @@ -18,9 +18,9 @@
> >  struct {
> >  	struct jailhouse_system header;
> >  	__u64 cpus[1];
> > -	struct jailhouse_memory mem_regions[15];
> > +	struct jailhouse_memory mem_regions[23];
> >  	struct jailhouse_irqchip irqchips[3];
> > -	struct jailhouse_pci_device pci_devices[2];
> > +	struct jailhouse_pci_device pci_devices[4];
> >  } __attribute__((packed)) config = {
> >  	.header = {
> >  		.signature = JAILHOUSE_SYSTEM_SIGNATURE, @@ -42,7 +42,7 @@
> struct {
> >  			.pci_mmconfig_base = 0xfd700000,
> >  			.pci_mmconfig_end_bus = 0,
> >  			.pci_is_virtual = 1,
> > -			.pci_domain = 0,
> > +			.pci_domain = 1,
> >
> >  			.arm = {
> >  				.gic_version = 3,
> > @@ -68,7 +68,8 @@ struct {
> >  	},
> >
> >  	.mem_regions = {
> > -		/* IVHSMEM shared memory region for 00:00.0 (demo )*/ {
> > +		/* IVSHMEM shared memory region (virtio-blk back-end) */
> > +		{
> >  			.phys_start = 0xfd900000,
> >  			.virt_start = 0xfd900000,
> >  			.size = 0x1000,
> > @@ -77,24 +78,53 @@ struct {
> >  		{
> >  			.phys_start = 0xfd901000,
> >  			.virt_start = 0xfd901000,
> > +			.size = 0xdf000,
> > +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> > +		},
> > +		{ 0 },
> > +		{ 0 },
> > +		/* IVSHMEM shared memory region (virtio-con back-end) */
> > +		{
> > +			.phys_start = 0xfd9e0000,
> > +			.virt_start = 0xfd9e0000,
> > +			.size = 0x1000,
> > +			.flags = JAILHOUSE_MEM_READ,
> > +		},
> > +		{
> > +			.phys_start = 0xfd9e1000,
> > +			.virt_start = 0xfd9e1000,
> > +			.size = 0xf000,
> > +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> > +		},
> > +		{ 0 },
> > +		{ 0 },
> > +		/* IVHSMEM shared memory region for 00:00.0 (demo )*/ {
> > +			.phys_start = 0xfd9f0000,
> > +			.virt_start = 0xfd9f0000,
> > +			.size = 0x1000,
> > +			.flags = JAILHOUSE_MEM_READ,
> > +		},
> > +		{
> > +			.phys_start = 0xfd9f1000,
> > +			.virt_start = 0xfd9f1000,
> >  			.size = 0x9000,
> >  			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE ,
> >  		},
> >  		{
> > -			.phys_start = 0xfd90a000,
> > -			.virt_start = 0xfd90a000,
> > +			.phys_start = 0xfd9fa000,
> > +			.virt_start = 0xfd9fa000,
> >  			.size = 0x2000,
> >  			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE ,
> >  		},
> >  		{
> > -			.phys_start = 0xfd90c000,
> > -			.virt_start = 0xfd90c000,
> > +			.phys_start = 0xfd9fc000,
> > +			.virt_start = 0xfd9fc000,
> >  			.size = 0x2000,
> >  			.flags = JAILHOUSE_MEM_READ,
> >  		},
> >  		{
> > -			.phys_start = 0xfd90e000,
> > -			.virt_start = 0xfd90e000,
> > +			.phys_start = 0xfd9fe000,
> > +			.virt_start = 0xfd9fe000,
> >  			.size = 0x2000,
> >  			.flags = JAILHOUSE_MEM_READ,
> >  		},
> > @@ -167,22 +197,44 @@ struct {
> >  	},
> >
> >  	.pci_devices = {
> > +		{
> > +			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> > +			.domain = 1,
> > +			.bdf = 2 << 3,
> > +			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> > +			.shmem_regions_start = 0,
> > +			.shmem_dev_id = 0,
> > +			.shmem_peers = 2,
> > +			.shmem_protocol =
> JAILHOUSE_SHMEM_PROTO_VIRTIO_BACK +
> > +				VIRTIO_DEV_BLOCK,
> > +		},
> > +		{
> > +			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> > +			.domain = 1,
> > +			.bdf = 3 << 3,
> > +			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> > +			.shmem_regions_start = 4,
> > +			.shmem_dev_id = 0,
> > +			.shmem_peers = 2,
> > +			.shmem_protocol =
> JAILHOUSE_SHMEM_PROTO_VIRTIO_BACK +
> > +				VIRTIO_DEV_CONSOLE,
> > +		},
> >  		{ /* IVSHMEM 0000:00:00.0 (demo) */
> >  			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> > -			.domain = 0,
> > +			.domain = 1,
> >  			.bdf = 0 << 3,
> >  			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> > -			.shmem_regions_start = 0,
> > +			.shmem_regions_start = 8,
> >  			.shmem_dev_id = 0,
> >  			.shmem_peers = 3,
> >  			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
> >  		},
> >  		{ /* IVSHMEM 0000:00:01.0 (networking) */
> >  			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> > -			.domain = 0,
> > +			.domain = 1,
> >  			.bdf = 1 << 3,
> >  			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> > -			.shmem_regions_start = 5,
> > +			.shmem_regions_start = 13,
> >  			.shmem_dev_id = 0,
> >  			.shmem_peers = 2,
> >  			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
> >
> 
> Jan
> 
> --
> Siemens AG, T RDA IOT
> Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/DB6PR0402MB276052F96B3F2A0F956E0EAE88649%40DB6PR0402MB2760.eurprd04.prod.outlook.com.
