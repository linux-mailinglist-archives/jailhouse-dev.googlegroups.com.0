Return-Path: <jailhouse-dev+bncBCWKP54GYYIRBZERSSFAMGQEMSU3UVA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x43f.google.com (mail-pf1-x43f.google.com [IPv6:2607:f8b0:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2FB4100BA
	for <lists+jailhouse-dev@lfdr.de>; Fri, 17 Sep 2021 23:30:14 +0200 (CEST)
Received: by mail-pf1-x43f.google.com with SMTP id f83-20020a623856000000b0043d21dae12esf8303394pfa.2
        for <lists+jailhouse-dev@lfdr.de>; Fri, 17 Sep 2021 14:30:14 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1631914213; cv=pass;
        d=google.com; s=arc-20160816;
        b=V3ZJd/mVrGkuE20YLAPoXNiNN0Yxu1tGPpTzTVdexmLoKGPV8tmiWzqBDQFzmYoH+9
         699xkH2zharJjPWCPnQ90R+SOslQ8i5eHrSXYK33LQJXDMgOnuDDeDLkrEZInLCwNUNh
         0JVibRs3cZFyB/2QoGdqR2pIclaAT0CdFtNi22ZaKUHbhlYknryOZ4eSPw2orkx91BGF
         6JT2mgMsynFyYBfjr/GtUPb+WqSZdmg0cE6BEC0f3gp9RJiJKBA+Kj2PPw3F8ZmeTjSq
         54aBkVUAQeOM2j2w5tQS2oXr3aybNgd/znWeVDvr3UfPn+6bNsFKh9Tu4UNR0ELFtIus
         qL7A==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:sender:dkim-signature;
        bh=3idk6h7AyhHMckIPk+mtfqAq02LhgkY2soreP0/Bgjk=;
        b=Ng/vQn7tHYzvQJXMA8s6pWuPUio/TI6sdWRpVcoOogvkggzCXUS3ut5ps4M4ZKIc99
         M+zmtAyHUb6eOROE8eg3nqmSLaudrOuTSY4dBXE0tLhIzl0VyhIOe4/iYnWrj2nwx1iT
         A6fpGRhlLWKNbIQSWCPP9FdYC6Ge9Ev2DCEPnuAoiDSLzGNrvYy1USHG9phUFXP/yzkL
         voND06YuNo4HqMesRVnbdaF/qPNlByMyfx1ZTLMPWEqq11llxyL2mZ3MemxPajXcw8Ej
         k7GlhI2EOI4Wpw2+wiXY/fKnVmn4RHAtoHUxpXlNaw6O50tpAXYlcK9Pe73bWzti/PGW
         vICw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=lp+76Vlj;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.4.81 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=3idk6h7AyhHMckIPk+mtfqAq02LhgkY2soreP0/Bgjk=;
        b=W5RHIqI/lUEINd5AZvUYkazqOLG8maTjshYMXroWqM0q4pkFxzDGD6FoOZz+Lg/HkU
         Bu/gEZTuVjZNVnGw7X9cyv1fBpxC4k6W5Eyuqz3x2Gn6dX5+zwlp6iCVYcNOFhWagpS2
         H69ki1Z1w4bVuGvi++D7GMDtCK8wXNVpW1cgGpWzhgTe5qilqh/vZ/QE/+ZdpZy95Kdq
         Yt5Wf2tpEHp/WMIJbt4wApJHtBQZ6jL/r9J3LtT1r0j48EGSq9hf9/turirXgtC9nran
         vq+VMIKwc9sZf+hs8jg/7z72wFxC6j7bADON2zGjSNz8hn+2Z/V8A+amleX5JESRqtHz
         mVMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=3idk6h7AyhHMckIPk+mtfqAq02LhgkY2soreP0/Bgjk=;
        b=PtK8N1paukPbGZBVH2OYz9hx0khfka5XZn+4DSa26/FmCbF/Y4jyH1i78b3BDi/PZZ
         VEqknQyoe0kFScsk2RK4McfItySjLM6/k8RAWhxcF6GngfD+toFciO7jUvEBuXRsuiRR
         ScAUGNUe6lSJl8vh++Kihz+zj7WAm+2aercSin30dxoOoItbkOJTYSY6A0SqTAU279rT
         Q4Trc5glz6Ijo+7bVa0AgijYxW4cNXyK+AQyCV6KoAsZGVDekborcSSLsmxLa2NX6qFw
         1La1/7h3XGU4ZOGFudaC/hevu/PwGGJg5ev0b7s0yzAw8DYb9Cn1E40Dk7MRXeYrqbVG
         Rp1w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533gq9qZFzxyTKT6EyXkVkcWCy9FvlzdGsTwWtI6zCnoAWYxji3L
	x8RBv1d9AXDLm/hdzAwD/R8=
X-Google-Smtp-Source: ABdhPJxF+vOaie0s2S3mDZ9CiQrzKGwhb/a81Hd3fyRc1SQpAKLz1l3+SlhXGBMeMlI1PLbVGVA0LA==
X-Received: by 2002:a17:903:22ce:b0:13b:8ec9:adb with SMTP id y14-20020a17090322ce00b0013b8ec90adbmr11485820plg.44.1631914213101;
        Fri, 17 Sep 2021 14:30:13 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:902:a409:: with SMTP id p9ls4492929plq.3.gmail; Fri, 17
 Sep 2021 14:30:12 -0700 (PDT)
X-Received: by 2002:a17:90a:3ec5:: with SMTP id k63mr10559416pjc.185.1631914212410;
        Fri, 17 Sep 2021 14:30:12 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1631914212; cv=pass;
        d=google.com; s=arc-20160816;
        b=Z3ZVH3o2JPeSLwkKn3/ZjhIUJSwIsGZrXywslxCV4egXNw9eHHpGz/L/muQr81SJHl
         S1Kt4RBgl8RQWwLYRLzY16VpDN6ZeZstfMfB+Si10IgWbI1/MnSYDnaOoxK8FzN2Cfsr
         3sqXshgnw6jgrOwCvIkHIjt8oDzDAGqGt8N2rInr85i1jwzYUVBKTIS3tQb9OIBw7Eny
         udr1mR5rCsiazRtOv9cs+lW+XcfimpdTsI/dSDUVOLRYTJvz8zFxF0FO85bSNrwmxlub
         Ld7q3cZv/Eu4NGxseKLcoBZKDkkJ7IYrPBDd2gvVDO+MGRCj0gMIqANSXGq8Vfq2VleQ
         H4tA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature;
        bh=0DpRZ1mDftYbpHI2uaVtlwStv8q4Y1zABfN2NnvzFzI=;
        b=LsbzJItN07Mkj/OBBAwz1XERys+kpPKun7IDA+4lSYiRK/KTggqn7u04T9g82vKNqJ
         6vZsAesGc7Q2dZCi3kXUpnzBrLaUQkJZYXW8vzLN73OhyESdO3xVA+TEmdMe1imwGU9p
         d8Su7krlPVAdP50JD5hlUl3DDOIz4Nsl+GtesiSTqFs+c+NU9CmYGhtxTVDRIi75aGAU
         yDtZcgQFvyH6YpeaqmMpTjligMxQgERyDUDeE35h/mHA+gQX41MpahROghu74rBCYcJo
         4gDsDAjZfQMRu9nrQiN3MtkhoEjfyzBr/dTwOmLSK3ElGSaZYluOsc92yRnAGzE7WAp+
         dBHQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=lp+76Vlj;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.4.81 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (mail-eopbgr40081.outbound.protection.outlook.com. [40.107.4.81])
        by gmr-mx.google.com with ESMTPS id c23si702690pls.5.2021.09.17.14.30.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 Sep 2021 14:30:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.4.81 as permitted sender) client-ip=40.107.4.81;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xjwyz4zS5TnU7R8c3JheYjCwaNYbBSL8o4+5onXvkSXHvrphlEqBwq4f33NNUUez3OHfz0MXtlrB6MADLIIuhJbPsz216UBPl+P/dVk2X8FQuYonAFIrF4eZIb1qsLUrlMlD7gghYopveqy2o9WyQVauNKo0QwwkXjKg6Qyv+7IsM6DNnFv3FN5DFlkE1uzgh8u+aa+Ipb2Z1vqXU8SM8+7DuV8LEMmAm1CYLtQv3tEmjXBjHHK0cBTmWfluDGqtMuAg4jkIjRKDvMUrDWhpfiao4Q7YH7plvppr6XzgW3QApZEQnvjZm6X3yI+aQpAm7jVC9rWP3Mmg2Z4oNgXmfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=0DpRZ1mDftYbpHI2uaVtlwStv8q4Y1zABfN2NnvzFzI=;
 b=FMzndjbu9klVQhKDzidnmvQdC4CBhBqcJJqApogCQYFU3Q9P9tUkpfgVcSMWPKJ/08KxeHjMM26cDeQ7muDqt2BbB+t7RI6Aclg3Yb9x/E4FsNQFFWh3d7R5Zqgx+SmpUM7iK9haP82c7q/RQTRs7h8EgY7VZAvK+k/Vr5ZFtACWp45Bijg/M7P3Te3zDConAsx0USrPO8PkM619g3Jg8IMhiccV7sdvUwhSn+9gNAoYdEeM3wUJitwzsoadZdZugSpi++sfVZKpRYnLHwbaU9CSVlj378De3FbzFo8CHJeD69sDrKEUeP7cA37k+guGSAgVk1I7pcqw1h1Jq4D/8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB5466.eurprd04.prod.outlook.com (2603:10a6:10:8a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Fri, 17 Sep
 2021 21:30:10 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::4868:6843:a39f:aa53]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::4868:6843:a39f:aa53%4]) with mapi id 15.20.4500.018; Fri, 17 Sep 2021
 21:30:10 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
Subject: RE: [PATCH 1/2] Makefile/Kbuild: Fix "FORCE prerequisite is missing"
 warning
Thread-Topic: [PATCH 1/2] Makefile/Kbuild: Fix "FORCE prerequisite is missing"
 warning
Thread-Index: AQHXq5g+nHcHXIQU30KtFjPfxK/0+auoEjKAgACsttA=
Date: Fri, 17 Sep 2021 21:30:10 +0000
Message-ID: <DB6PR0402MB2760A71C98CBB54AACC5A92F88DD9@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <20210917074630.2585329-1-peng.fan@oss.nxp.com>
 <dec7614e-23e8-5381-6528-24c486a038f6@siemens.com>
In-Reply-To: <dec7614e-23e8-5381-6528-24c486a038f6@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7dae5cc4-2fe2-4b45-61a9-08d97a2253c2
x-ms-traffictypediagnostic: DB7PR04MB5466:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB546621BCAEB91D60111AC0F088DD9@DB7PR04MB5466.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:93;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FA6YL76BStv1cdmIXfXpONu8QA/EixKAiVWsKnAfxM9VYg/py2juNP2piewe9apxvhpfKZikkRYiPjfFQ/5FkYG2OzyJzTn2LOFf7ed7ZlLFEG5eB9ju/9rMTcVmn84m7AG+ODtj4L8xftFdsV5IM5C4gX82CKWcOMRRs99pXixT/JzFLb1UpWCDhrTFtlGTZ4YmLYXZvWTHLwVXmVu9/OJKgFocqfzZFSvvZRvPPfF5N7RK3KCxK8aXI4GlI3X+cEdfjhxU2PgpDC+nQt3Yf8ja23dTsQmCo40dbKA9abdF+ZcJpnbApWGmIDRgDzi/k3bnr0GIO8l7fW4aa53yTkcaoV2fyujE36go+9jDqVeEik3xk6wnJGt7poA31xs+Fp04P8KvJSX1Ita6XAheTARbMZodI0PX2Ju5sqy+A2Ti5yfjaej+7n0s+Fg7Ioc6ipQug6QNT9dHUP+OB5c7eZtuaBMvgv/gclYvbQLn8cf0aj7aJlD7sCc4eehBG2aP5uDjuSG5nSULEAhFGrDSipnBAgtSl0J6iKLjOFqvWvNfX8x8aNScOi7+LWXUl7LLlml0lP/Wu8ld6Gl2Qo3zzubcRKhkKFb3eYUgynEpzpNUAIpMXo5tQ31U0wela44klDzTm2fI6Z1zHPcUBG+LQyeyZRcWrG4cG5AZtUKPh7YUPUzcXYh+4bIBSbqy9Bont6iZOZZpUwqrN3fCHeu7cw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(396003)(136003)(376002)(366004)(110136005)(44832011)(7696005)(71200400001)(478600001)(38070700005)(33656002)(2906002)(38100700002)(316002)(52536014)(55016002)(86362001)(186003)(26005)(9686003)(6506007)(53546011)(66556008)(66946007)(5660300002)(64756008)(8936002)(66476007)(8676002)(66446008)(83380400001)(76116006)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZkRmQ0owVnVCSnZVb1c5Mnc1ZzVRUFpQSVNBVmJ5UFE0bFBJbGFvZW5EdDh5?=
 =?utf-8?B?T3JJZTdXMWRRUnh0SVVDWHFnTy8yNi8zT3lEOEwwVXlEdUdzZktaR21NNURN?=
 =?utf-8?B?STZxQXVsZG4yVm5Eak1kQWtISFlLT3JrMnp5TEd0UVZSMVg0S2g5ZFZSZmxl?=
 =?utf-8?B?dEdMV1ZDZGZnS3dIa3VxNW9TbGVGRHU3azRGR3lWQkhvRjhIK3o3MXBKeTRn?=
 =?utf-8?B?c2tXcEdDaGdtMUZnZkxXT2hWUWlBYTU4UVNEY3FBQlFXK2VtSFVOR2oxTERt?=
 =?utf-8?B?YTRHOXpqWlVXWitBTThSbFM4b1lEc244RWtNTmZLbWRLbC9IOFBmclhrejIx?=
 =?utf-8?B?b1hUNnZTVHhlUDBveTU4TS9veVYyOWNjQ1ZhV3hSSXM4TjBWRzdvN2o1cHpH?=
 =?utf-8?B?dHh5N2NUbW8zV3VPU0xMbjFaWVE4dTYyU0d0dFphai9CNmhRZkdwVmtWcjI0?=
 =?utf-8?B?LzdlNDFCRzQ5cUtSM01JTjFTTkV3TzA3MENaRmVFYWRabndUeGZFdGRsSStu?=
 =?utf-8?B?QVh2TFc1eHVzN1pWVWNVYzI5VjVMQ2xlU0hKdkt1TVF0c00xeGpiMnlMRmZ6?=
 =?utf-8?B?cml0WlJzTzhiZm95TFljQUNwRkhwbFhuaC9OV2lCVzd5VUxUTHk5cTR6SWo1?=
 =?utf-8?B?UFV6RU1PVEV1Tkd6VC9zYXdRbjdNZ3VjN2tvbXJvMWpjeUx5bTBmNFl5NkN6?=
 =?utf-8?B?SVBlUXZtRW40TjJnTzNaU2tCR20rSVM3MUdGcTdmZ1J1cEREQmZGWG5JUExi?=
 =?utf-8?B?cVoxT3lUd1VWOXUvRzdFQkJBbXF1OERIaXowanRxNjdsS3lVMFFSR0tnYjNs?=
 =?utf-8?B?N3Zpc0dGV1dYMnVrZzFBcUVmbXAycEduSzJ5SjNRNTJ5MnRvSmpuWU1LdmE4?=
 =?utf-8?B?MWYrMm1Jd1hubUtvRHNnSHdUM1g4cTROeW1DQzVlMEJ1Z3VmaXFjUGRuUXBH?=
 =?utf-8?B?bU96Nzgzc2pTcUxjdFVUWkNiS25VdFJOTXltQzN1Qlk2RE0vQXJGVUVGRDBy?=
 =?utf-8?B?RUdjakJEaWcxQWRzWEtLRnZXTjhkTDBQQzJ0SDN4c3locXZEa09wL0dzdkw5?=
 =?utf-8?B?Tk01Y0xnOFlJN1dtMXBhSDRaRVRGVlBxTmw0UFUrcEhvQzFMTWcrUTBjM1lN?=
 =?utf-8?B?M0FXTjd3OWpHMUdWWURIQi9uWlF1SVFkTjlYZW8vQWR6Wk5yREcyY2JjMzdx?=
 =?utf-8?B?UTZYQjErRFRJZGJURWhPSTFDRXdXRkd4U29zbG5WWElrWk5jSGJYNG1kMlQ3?=
 =?utf-8?B?WXNPR21wZGJibTRQYVlxcUFHN3pNNDRSMFhGaTdZYWlnbXdRYkkxYjUzUm8r?=
 =?utf-8?B?YXlzTW1aYVp4YXVwbkVmeUdJYnB6bFdxNzVMczFmODVjQkdWQVRJRUN5OHFL?=
 =?utf-8?B?dG1qODg3Wk1RS0p0czZJK3NSRERzdnM0MFhtQmxwVVpVNjZCaithckdEQjhQ?=
 =?utf-8?B?MTVOSWlzK1hYd2RmY0hFZ2F0N2NFZXc1THVLQXNtQzhjWE1OUDRrTy9LeTRT?=
 =?utf-8?B?VnpZYmZGVU9XOXdEM05qdUs3UkE4cUpTUkdnTDlJWGFEc3U4bm9CZGtYY05w?=
 =?utf-8?B?ZG5uTkRKSjBGVmhrZW9xY3VvcXhXRXIwK1ZoWUVwczQybVY3ZGJEOEZMV1dj?=
 =?utf-8?B?VXBYeVRnK0FBNFlXbS80R1RoTGNOUldXL3lyQ21Tb1FNbDNUKy9sejBhQkx1?=
 =?utf-8?B?U2lLL3F3eTRVeW9kYzlta1pnQnhYYXVWQTVwTy85N3B3YVBDSVlsUHlOZURH?=
 =?utf-8?Q?0PqJ/jliF9SS+GmH4Qpilbh2APOKqBiCfyNHZrL?=
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dae5cc4-2fe2-4b45-61a9-08d97a2253c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2021 21:30:10.0981
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hSCI6SJ+SzKXCgPUgFOp/3lqUL/L3QkYRxX3SooO6jMKz6lYEdF/UR/nXWRbPduyTvbIljATHFgfBRxY74i8KQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5466
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=lp+76Vlj;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.4.81 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

> Subject: Re: [PATCH 1/2] Makefile/Kbuild: Fix "FORCE prerequisite is missing"
> warning
> 
> On 17.09.21 09:46, Peng Fan (OSS) wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > With Linux kernel has a change that
> > "kbuild: warn if FORCE is missing for if_changed(_dep,_rule) and
> > filechk", so add FORCE in Makefile/Kbuild to avoid build warning.
> >
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >  Kbuild                         | 4 ++--
> >  configs/Makefile               | 2 +-
> >  hypervisor/Makefile            | 6 +++---
> >  hypervisor/arch/x86/Kbuild     | 6 +++---
> >  inmates/lib/arm64/Makefile.lib | 4 ++--
> >  inmates/lib/x86/Makefile       | 4 ++--
> >  inmates/lib/x86/Makefile.lib   | 4 ++--
> >  tools/Makefile                 | 6 +++---
> >  8 files changed, 18 insertions(+), 18 deletions(-)
> >
> > diff --git a/Kbuild b/Kbuild
> > index b76a8dd7..2863c121 100644
> > --- a/Kbuild
> > +++ b/Kbuild
> > @@ -46,12 +46,12 @@ $(GEN_VERSION_H): $(src)/Makefile FORCE
> >
> >  quiet_cmd_gen_pci_defs = GEN     $@
> >  define cmd_gen_pci_defs
> > -	$^ $(src)/include/jailhouse/pci_defs.h > $@
> > +	$< $(src)/include/jailhouse/pci_defs.h > $@
> >  endef
> >
> >  GEN_PCI_DEFS_PY := $(obj)/pyjailhouse/pci_defs.py
> >
> > -$(GEN_PCI_DEFS_PY): $(src)/scripts/gen_pci_defs.sh
> > +$(GEN_PCI_DEFS_PY): $(src)/scripts/gen_pci_defs.sh FORCE
> >  	$(call if_changed,gen_pci_defs)
> >
> >  subdir-y := hypervisor configs inmates tools diff --git
> > a/configs/Makefile b/configs/Makefile index 74b35f0d..327043b7 100644
> > --- a/configs/Makefile
> > +++ b/configs/Makefile
> > @@ -38,5 +38,5 @@ targets += $(DTS:.dts=.dtb)  # prevent deleting
> > intermediate files which would cause rebuilds
> >  .SECONDARY: $(addprefix $(obj)/,$(CONFIGS:.c=.o))
> >
> > -$(obj)/%.cell: $(obj)/%.o
> > +$(obj)/%.cell: $(obj)/%.o FORCE
> >  	$(call if_changed,objcopy)
> > diff --git a/hypervisor/Makefile b/hypervisor/Makefile index
> > 3807e608..8ae4e332 100644
> > --- a/hypervisor/Makefile
> > +++ b/hypervisor/Makefile
> > @@ -80,7 +80,7 @@ ASM_DEFINES_H :=
> > arch/$(SRCARCH)/include/generated/asm/asm-defines.h
> >
> >  targets := $(ASM_DEFINES_H) arch/$(SRCARCH)/asm-defines.s
> >
> > -$(obj)/arch/$(SRCARCH)/asm-defines.s:
> > $(src)/arch/$(SRCARCH)/asm-defines.c
> > +$(obj)/arch/$(SRCARCH)/asm-defines.s:
> > +$(src)/arch/$(SRCARCH)/asm-defines.c FORCE
> >  	$(call if_changed_dep,cc_s_c)
> >
> >  $(obj)/$(ASM_DEFINES_H): $(obj)/arch/$(SRCARCH)/asm-defines.s
> > @@ -110,13 +110,13 @@ HYPERVISOR$(1)_OBJS = $$(addprefix
> > $$(obj)/,$$(hypervisor$(1)-y))  LDFLAGS_hypervisor$(1).o :=
> > --whole-archive -T
> >
> >  targets += hypervisor$(1).o
> > -$$(obj)/hypervisor$(1).o: $$(src)/hypervisor.lds
> > $$(HYPERVISOR$(1)_OBJS)
> > +$$(obj)/hypervisor$(1).o: $$(src)/hypervisor.lds
> > +$$(HYPERVISOR$(1)_OBJS) FORCE
> >  	$$(call if_changed,ld)
> >
> >  OBJCOPYFLAGS_jailhouse$(1).bin := -O binary -R .eh_frame
> >
> >  targets += jailhouse$(1).bin
> > -$$(obj)/jailhouse$(1).bin: $$(obj)/hypervisor$(1).o
> > +$$(obj)/jailhouse$(1).bin: $$(obj)/hypervisor$(1).o FORCE
> >  	$$(call if_changed,objcopy)
> >  endef
> >
> > diff --git a/hypervisor/arch/x86/Kbuild b/hypervisor/arch/x86/Kbuild
> > index a6badcac..7a42adb4 100644
> > --- a/hypervisor/arch/x86/Kbuild
> > +++ b/hypervisor/arch/x86/Kbuild
> > @@ -40,10 +40,10 @@ intel-objs := vmx.o vtd.o vmx-vmexit.o
> > $(common-objs-y) cat.o  targets += $(amd-objs) $(intel-objs)
> >
> >  quiet_cmd_link_archive = AR      $@
> > -cmd_link_archive = rm -f $@; $(AR) rcs$(KBUILD_ARFLAGS) $@ $^
> > +cmd_link_archive = rm -f $@; $(AR) rcs$(KBUILD_ARFLAGS) $@
> > +$(filter-out FORCE,$^)
> >
> > -$(obj)/lib-amd.a: $(addprefix $(obj)/,$(amd-objs))
> > +$(obj)/lib-amd.a: $(addprefix $(obj)/,$(amd-objs)) FORCE
> >  	$(call if_changed,link_archive)
> >
> > -$(obj)/lib-intel.a: $(addprefix $(obj)/,$(intel-objs))
> > +$(obj)/lib-intel.a: $(addprefix $(obj)/,$(intel-objs)) FORCE
> >  	$(call if_changed,link_archive)
> > diff --git a/inmates/lib/arm64/Makefile.lib
> > b/inmates/lib/arm64/Makefile.lib index 2ea037cd..5df2632d 100644
> > --- a/inmates/lib/arm64/Makefile.lib
> > +++ b/inmates/lib/arm64/Makefile.lib
> > @@ -58,8 +58,8 @@ endef
> >
> >  .SECONDEXPANSION:
> >  $(obj)/%-linked.o: $(INMATES_LIB)/inmate.lds $$(addprefix
> $$(obj)/,$$($$*-y)) \
> > -		   $(INMATES_LIB)/lib.a
> > +		   $(INMATES_LIB)/lib.a FORCE
> >  	$(call if_changed,ld)
> >
> > -$(obj)/%.bin: $(obj)/%-linked.o
> > +$(obj)/%.bin: $(obj)/%-linked.o FORCE
> >  	$(call if_changed,objcopy)
> > diff --git a/inmates/lib/x86/Makefile b/inmates/lib/x86/Makefile index
> > 35f04161..a3e149b3 100644
> > --- a/inmates/lib/x86/Makefile
> > +++ b/inmates/lib/x86/Makefile
> > @@ -51,9 +51,9 @@ lib-y := $(TARGETS) $(TARGETS_64_ONLY)  lib32-y :=
> > $(TARGETS:.o=-32.o) $(TARGETS_32_ONLY)
> >
> >  quiet_cmd_link_archive32 = AR      $@
> > -cmd_link_archive32 = rm -f $@; $(AR) rcs$(KBUILD_ARFLAGS) $@ $^
> > +cmd_link_archive32 = rm -f $@; $(AR) rcs$(KBUILD_ARFLAGS) $@ $*
> 
> Is $* really correct here? Elsewhere, you do a filter-out of FORCE from $^.

Yeah, need use filter-out

> 
> >
> > -$(obj)/lib32.a: $(addprefix $(obj)/,$(lib32-y))
> > +$(obj)/lib32.a: $(addprefix $(obj)/,$(lib32-y)) FORCE
> >  	$(call if_changed,link_archive32)
> >
> >  targets += $(lib32-y)
> > diff --git a/inmates/lib/x86/Makefile.lib
> > b/inmates/lib/x86/Makefile.lib index 872b7ce0..b5748565 100644
> > --- a/inmates/lib/x86/Makefile.lib
> > +++ b/inmates/lib/x86/Makefile.lib
> > @@ -57,10 +57,10 @@ endef
> >  # obj/NAME-linked.o: ... obj/$(NAME-y) lib/lib[32].a
> >  .SECONDEXPANSION:
> >  $(obj)/%-linked.o: $(INMATES_LIB)/inmate.lds $$(addprefix
> $$(obj)/,$$($$*-y)) \
> > -		   $(INMATES_LIB)/$$(if $$($$*_32),lib32.a,lib.a)
> > +		   $(INMATES_LIB)/$$(if $$($$*_32),lib32.a,lib.a) FORCE
> >  	$(call if_changed,ld)
> >
> > -$(obj)/%.bin: $(obj)/%-linked.o
> > +$(obj)/%.bin: $(obj)/%-linked.o FORCE
> >  	$(call if_changed,objcopy)
> >
> >  # 32-bit (i386) support
> > diff --git a/tools/Makefile b/tools/Makefile index 4faf9430..1108433a
> > 100644
> > --- a/tools/Makefile
> > +++ b/tools/Makefile
> > @@ -111,7 +111,7 @@ define cmd_gen_man
> >  	sed 's/$${VERSION}/$(shell cat $(src)/../VERSION)/g' $< > $@  endef
> >
> > -$(obj)/%: $(obj)/%.o
> > +$(obj)/%: $(obj)/%.o FORCE
> >  	$(call if_changed,ld)
> >
> >  CFLAGS_jailhouse-gcov-extract.o	:= -I$(src)/../hypervisor/include \
> > @@ -122,13 +122,13 @@ LDFLAGS_jailhouse-gcov-extract := -lgcov
> > -fprofile-arcs  targets += jailhouse-gcov-extract.o  always-y +=
> > jailhouse-gcov-extract
> >
> > -$(obj)/jailhouse-config-collect: $(src)/jailhouse-config-create
> > $(src)/jailhouse-config-collect.tmpl
> > +$(obj)/jailhouse-config-collect: $(src)/jailhouse-config-create
> > +$(src)/jailhouse-config-collect.tmpl FORCE
> >  	$(call if_changed,gen_collect)
> >
> >  targets += $(MAN8_PAGES)
> >  always-y +=  $(MAN8_PAGES)
> >
> > -$(obj)/%.8: $(src)/%.8.in
> > +$(obj)/%.8: $(src)/%.8.in FORCE
> >  	$(call if_changed,gen_man)
> >
> >  install-bin: $(BINARIES) $(DESTDIR)$(sbindir)
> >
> 
> Looks good otherwise.
> 
> This affects 5.15+, right? Worth mentioning in the commit log.

I met issue with 5.14-rc7. 

Regards,
Peng.

> 
> Jan
> 
> --
> Siemens AG, T RDA IOT
> Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/DB6PR0402MB2760A71C98CBB54AACC5A92F88DD9%40DB6PR0402MB2760.eurprd04.prod.outlook.com.
