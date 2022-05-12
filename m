Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBKOZ6OJQMGQE5HMJL4Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x638.google.com (mail-ej1-x638.google.com [IPv6:2a00:1450:4864:20::638])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED57524B3F
	for <lists+jailhouse-dev@lfdr.de>; Thu, 12 May 2022 13:16:58 +0200 (CEST)
Received: by mail-ej1-x638.google.com with SMTP id sh14-20020a1709076e8e00b006f4a5de6888sf2704477ejc.8
        for <lists+jailhouse-dev@lfdr.de>; Thu, 12 May 2022 04:16:58 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1652354218; cv=pass;
        d=google.com; s=arc-20160816;
        b=I2rocMbD/ALAadu1BHewUvVH1/wqVRV6+MjlXMwtnk3oFIxbPD8knhpgGLMso0JZcx
         ArbfA23pkU5TE73XRqjAapplE1pKPMI3gT/CdvQyDB3FPDdWHa4i809F4HAfD9oHPsQy
         5/Fg+z2G/ub0P+po0Y57CcrWVmQlfqdi0NNmlzjaeXcLFAuwz6C3aVZbQRy4JvFz6klT
         PQDyGMZdowT5h44GnprLM8dGjeszbUGIrqgXjLF8J7ddYIvi7HidXzSdCi3Ja0g/tEBB
         lH0X1vZl3Jh5bcUosgi8qh2qR3cQjYmKH9ltdpjefE5CqumUSxNKL0u9fZxH21wEuWoB
         UVcQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=L1vv/On3Y8EMKsZGFi55+34XcjJny4jDrNX9YiQENpQ=;
        b=ss9TLpuNCi2W6rI6uGlZ7Ec3Y72LUHjHTNaZ1cdsAkAP9WDIgwrMeItwNtTZDl4IiP
         4wG3mMDsZiqGgyEbDhzAa6j4XuCMxMayEzDA4puj3tnkY9eMn/aaww1/DUdDXilzwUIn
         adqZ+wR9lTpsnlWgwm3dRgRB3jmGqVCQZKiKKqybYqqJ/WnVBlCpBqSs9DrlUt6VXJb3
         r35jVG5JDN4RZFRe6KEUhpBUEB9LtGPU+pnwuFKZn/sEt0oyS6Tln0AOSsdFZ0m0tPtc
         FIHu0wSCRsXSh66QS2FqVZRM4PRnpSYFGao1AAI4y41AoS9sqdhcr44dmpw0649EPcuX
         0Oow==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=G2qGJTpe;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe0e::607 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=L1vv/On3Y8EMKsZGFi55+34XcjJny4jDrNX9YiQENpQ=;
        b=HQbRFM+if4A2OGQR+S3adTzSyLl1Dtv+Pe3GBg7YZOQSWBTT9MkQYb3ab3EPLbYfMx
         Y3ABHmgGOMv7sWCNzPNytDSJQ82QnHW83cwU1sq3iOYk+8ONXT8/LCL/nso7BL7FuETT
         igSI2StHU8s52sTaRsR6A9Wvh9qu8dxUWqUbojsm1cjXVJXw4PIqsqrZJCLpUSmJzUXu
         fTxQVlh+xunv/+nGm305mJ1IphoQKEzaClBNistNDIe5uYywZ9KgQNKJsz4imYWEoEWj
         gu+dZoziLa/6Cwh1SSXhAYfOL3IAMGGyKjkqwAqjhXhudgUgOBKODoGbBK/wDZNsVU2a
         xXpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=L1vv/On3Y8EMKsZGFi55+34XcjJny4jDrNX9YiQENpQ=;
        b=bnjJcSfNBxFTnzfYM62bt8Es5HIDsJEZ6U3IB97Wbou4Xil3zoky0CDGGhBJ16CRQv
         DOnTPOEEPqn92WQiJSm62+IS6C+/rJE4P63MWSV3l2+HWXKlyGA37K0QSBomUL2MFnJh
         VqtTkU/pMSU8VbNz10P7bju+KSzkp9rVoizqmc0I0/NQoO0tC/5VTXf1iFt6Ylfu9Lmr
         3RcBWShxUz7WKco3a9HzO0gZLtWZtp6QEGu+L65AE66nTaCblhC+Tya5rvhupE/Z+SCr
         SIO8NP6eZMUcfJINCrNLwRvTfM9QyuGUvXR7eku7Lh/4bvYEKfFOdbYGjFnWJL5qwLGn
         eTbw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530GXlydT/reTlyZtx8iw20CSthlBTWlKaCPyBXgCNg6w8LCYTNe
	n7VPyGRgWNWWRP6KtLlW0xM=
X-Google-Smtp-Source: ABdhPJwxBc4iOYRHqA310CyRbwDJsxt51SuEbzovfi9RFQ7hnaHpfOQPlBo/648JqruqZYRhxSzi1g==
X-Received: by 2002:a05:6402:b4d:b0:425:ec4a:a37e with SMTP id bx13-20020a0564020b4d00b00425ec4aa37emr34043585edb.292.1652354218007;
        Thu, 12 May 2022 04:16:58 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:907:628e:b0:6e8:76c2:5876 with SMTP id
 nd14-20020a170907628e00b006e876c25876ls2750914ejc.7.gmail; Thu, 12 May 2022
 04:16:56 -0700 (PDT)
X-Received: by 2002:a17:907:7212:b0:6f4:fdc7:b7f3 with SMTP id dr18-20020a170907721200b006f4fdc7b7f3mr30029684ejc.16.1652354216349;
        Thu, 12 May 2022 04:16:56 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1652354216; cv=pass;
        d=google.com; s=arc-20160816;
        b=i5RlWbkyfMvgxlyntBMvJxtfmY2zWtXuy7EOjmkiztJ/0vDOobaLa0L9aIkrlMufM5
         esW3thnI0qvgLkvmTRfTBVeBHe6eXkFo/RF0V8EScqIj99lv9nVj+u+aZqQ6eXJaOQCj
         nh9J+6173H85IhossJSykpsjro7cupY8pPZl6W3SGNDXxk9TGQOMpP/edc/5Sx1RTNg1
         jzHZ1q/GdNvrL0/SMhQ5EUcAOWh17XGIds1rn6IATp3DFjZ7NVSebQPqTy5neTxNKNCP
         8EDlyUv7A755R+0zkjvaCvewPTAJ/GXHCAN4oVSLwP58rA7JwjUImKcEvmcbLvAntGry
         6oDA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=5eEqF2jZ3ME+tq7Jr6yyveJ8u77VRpXTH1HFr7bhx8E=;
        b=FfnRALu7Ve5aQzDZ9zw20R+fmq7MkSVe76zBnWd234yfVSzpIJk489hBa06jjlKovG
         LHCtXZ3xYSNxYIekQBqdU9kFiVJae/n5B89AmC5BvTZJf+VPqdokkqNYXIgmjXdyk/mC
         l2fglBKZG5b6DPwHwCgaYysszjPJ7jeCZbf3DDQ6kl4QIbsf05JjMJHy1GPreH1n18VA
         yvt8lMqHnSwA7sM1DHUKTJldiO76iZ3x3i13ftuopdKRSrxCeXd9eyh2D7ojdyZhdeXa
         olA5Tp0m39BoNHrzlYw80UFho7mpHE2z271K64IjplPoDl7Cyko7LNwk8UkDzf/ISIE2
         pDCw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=G2qGJTpe;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe0e::607 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on0607.outbound.protection.outlook.com. [2a01:111:f400:fe0e::607])
        by gmr-mx.google.com with ESMTPS id ee47-20020a056402292f00b00425adbac75dsi323753edb.2.2022.05.12.04.16.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 May 2022 04:16:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe0e::607 as permitted sender) client-ip=2a01:111:f400:fe0e::607;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GYdVFrjB/N/ka1xl4BjfC18Lqr/3WkT9cHWf8BTWnp8la1aIV0ulhGyfDQapwgdQI9RDJBjceZuG8AvzZiAbE8jVhfkdt5jFYS57j1c5UqPx0+4aLeH96jix3HE7ekrOtcdBgE2QsqPGeoZtg9adNTUudSinb6v9hhXyvNpmJ1YnBr0HdRtHX+k/sO8mHlEtrAwfHeagY+TfjfThgmitPlD6KwE9DxnQGL4r2nGoYVnRMveAiEjnXmOogrsMkDSAiQrq4++3A/z5CnS3ZUCRudkZSLKNWBcYPfE0TK4SwA4w/ooemipC4T5VUYNJ/m/JQwJ55pDhgebgH5tkF7ZZlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5eEqF2jZ3ME+tq7Jr6yyveJ8u77VRpXTH1HFr7bhx8E=;
 b=Xl7Ndi5JrLcchiyxb/paiHz5ilfUfLQJI38S1sAfqm9+XYkYQs//OpdeS9enLBh2K1AVjfHqAApFCd4Eep2YrNsXwKMyyT3a3+XjGd+Sjo+ubHj9zVwSK1Hm/Ax7BStHf89M0d5+xAxw8qfkymDlCyZfhNl4QMgGz6Ueb6X4VUyKnJom2gts0mK/zwbIYn5zUuQwZDcAsGr3Vc06Wauayt3zDuYmiZT+bwrCA566nYzVcbvriNGiBUikJD0RNlZBzhW2rxTVoLmfIYoXP0wNqRzkocdufKsX/HHy2C+559V6hmWGnyG0163Q2GZ5UZPHVQZPr8DQqFRW5gVfwc4cJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.73) smtp.rcpttodomain=gmail.com smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
Received: from DB6PR1001CA0019.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:b7::29)
 by HE1PR1001MB1324.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:3:f0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23; Thu, 12 May
 2022 11:16:54 +0000
Received: from DB5EUR01FT070.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:4:b7:cafe::6c) by DB6PR1001CA0019.outlook.office365.com
 (2603:10a6:4:b7::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13 via Frontend
 Transport; Thu, 12 May 2022 11:16:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.73)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.73 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.73; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.73) by
 DB5EUR01FT070.mail.protection.outlook.com (10.152.5.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5250.13 via Frontend Transport; Thu, 12 May 2022 11:16:54 +0000
Received: from DEMCHDC89XA.ad011.siemens.net (139.25.226.103) by
 DEMCHDC9SNA.ad011.siemens.net (194.138.21.73) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 12 May 2022 13:16:54 +0200
Received: from [139.25.68.37] (139.25.68.37) by DEMCHDC89XA.ad011.siemens.net
 (139.25.226.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 12 May
 2022 13:16:54 +0200
Message-ID: <5ea8c025-13f2-4754-479a-21395de9306d@siemens.com>
Date: Thu, 12 May 2022 13:16:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: Kernel panic on enabling root cell
Content-Language: en-US
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
CC: Jailhouse <jailhouse-dev@googlegroups.com>
References: <2dcadf3d-1df9-497a-a530-be01a5da96e9n@googlegroups.com>
 <f0853228-55dd-465b-8db1-01f6d3f26d8fn@googlegroups.com>
 <d22051fb-2c80-2d88-af8c-5f1ccdb69197@siemens.com>
 <CA+V-a8sQAYXHykiGqn8DD8=cL4fv4NcszvgFgza2gE3_MCyRmQ@mail.gmail.com>
 <37be2e7c-c1f4-c5b6-f200-8d1cc48e0ee5@siemens.com>
 <CA+V-a8t-wvud8MF0oyAsHBSUuVQrrkqSr9RWE2tQLCoOzuQikw@mail.gmail.com>
 <fe2e7e92-8530-9913-307f-85437412fd81@siemens.com>
 <CA+V-a8sgPXsMmsKYwE6etP=JG8Ef83Qz4RHoWAZKeHdVHhk_Pw@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <CA+V-a8sgPXsMmsKYwE6etP=JG8Ef83Qz4RHoWAZKeHdVHhk_Pw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [139.25.68.37]
X-ClientProxiedBy: DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) To
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103)
X-TM-AS-Product-Ver: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-AS-Result: No-10--19.534200-8.000000
X-TMASE-MatchedRID: rSftH29dIPQ5QaOxwNGfvo9bHfxDWoib9c0SSBk6D85swYo64ufkVWOJ
	thub07SwY4zJvUjGrxXCaBA5v6nrh8jIZFqzzNvWr4vHsAGpVweGZc0nh03Q7R1kSRHxj+Z53V4
	UShoTXaf6srwzFJ/qAsP/La5NP1Jvc1CRDGuYa05ASosYQrlWjAcb6hGUQ2tTCL8RFER/j9Myyi
	+n+H050RCOwdkP3NVeYAX1zFjEwVo9LPdQhgZ/lh1GpI2Wh7mMa72LzVxTKQURW4LR41Fi8lSMd
	QR/r3EeR6RHdVK85hV2NlrEE6OjjT+q6H5pp3fffQrOflXxFuVpY+rDpJtqXuGECTbIgjb5sVwP
	MKjZm1aKXNybanokTxc7TE9SuU5smvSD3/eM+8LTIDCR7KoHhIy3ARqB9bsbB89GKHo03nbDvsJ
	EJ3LgvOnYh8o5mXik/0etkVHtq/8aUiTYmfzyKd3ZNwOPBqrYAM0/G7XUdeOEsxw9kf3dvEYj0z
	DHPzJp3unRG7yMq8UQyMOxzPzlhV2xMFrvDMyRwsZhPVDrsSPm0GdS2zsXWJUXYcPwQc2nLPSJu
	5jov2bWXfwzppZ8SOK5fhRxt1aAA41sIOnMj8YdFnFuhtKX0KGnquim0WHzpyEWs4H2RqcujMj6
	uE1hubbMVaqtU3gFXjesFOd0pM7i8zVgXoAltkWL4rBlm20vt7DW3B48kkGtIWznhjjBtfoLR4+
	zsDTtAqYBE3k9Mpw=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--19.534200-8.000000
X-TMASE-Version: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-SNTS-SMTP: 5D056FE45DE0120FDD8F6C6063CF52A8AE083ADB1CE255CBDAE4687B8FC13DE42000:8
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 93ca5ee2-bec2-44fa-bae9-08da3408ebdc
X-MS-TrafficTypeDiagnostic: HE1PR1001MB1324:EE_
X-Microsoft-Antispam-PRVS: <HE1PR1001MB1324421D02739753D0255D0395CB9@HE1PR1001MB1324.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5uXXMo0IGK5L8YSGQHipEmM1uRzxvm8yxFuTWK1cKp3XwyWIT5QNZiku/F5iaV7bOQlG0Q56uvn2hmc+gKzH31Jbbeb65166VORsx0EmBKldxwJXpD1ZuFuYz20bvJj9vWMCVdOUMmnV7K7wdzRs0p5PC1/1kHj1US9zS9tMenBehzf4OqmwPOgtXUx8f62+LQ8ZNamjAmfKn2QbOKje7dOkjHToDHxGg3KKvr6gNF2aZY8F2Fi5/jNIjBVtKng82IxLpW4Tt2EQw6HcQ0tzBQn8CgWx1XD6uru/yV7TPDArIMOW5EEshHzXXYVPN0DZyK5CFt94MgPH/A6Um+Xee+Sh5RQPPZC4uuy9rRna9yK4aKIAc8kuWqrV6XFG30M/zgTtvd4ourIFVOgCFLLEkjDUoAiRXKeuX6uGHPTm/lrwES9uxywbTj/J8rIFfV0FxRAKqbO+pnUM2dU0ncK33z0eH2sNrWS1qfpElxHUS5SGaqiUSojz6Yq68fcn/swlqWtGWU/pHZHfkD3PW5oggRzBJp2xM4m2F3r3Gae+QxEjO5zfBKef0or4rwgn+GUeolwPVOxIjzBUznW3b9HMQRbh3DG0CtXfyQGRP3IBEYrYFJXrseDJE+6pmhqB9G+NGa438BOqV5aHprFFP08E5ql5hX5MIET+MWBnl6R4tfiihQlcLSmYNYj8tbvZHQmZEJk2KmLS87fd/+PTQ4qCPCc4hME61BF55pkvH8agZIewoxHWSulsFlLaTs0nHpr6zQ64IfWaHiQ6EG2bZtKy2g==
X-Forefront-Antispam-Report: CIP:194.138.21.73;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(70206006)(36860700001)(40460700003)(186003)(2616005)(8676002)(4326008)(70586007)(16526019)(508600001)(956004)(316002)(5660300002)(44832011)(31696002)(8936002)(86362001)(6916009)(81166007)(336012)(53546011)(82310400005)(36756003)(356005)(26005)(82960400001)(47076005)(31686004)(16576012)(2906002)(6706004)(3940600001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2022 11:16:54.7215
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93ca5ee2-bec2-44fa-bae9-08da3408ebdc
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.73];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR01FT070.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR1001MB1324
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=G2qGJTpe;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates
 2a01:111:f400:fe0e::607 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

On 12.05.22 13:06, Lad, Prabhakar wrote:
> Hi Jan,
> 
> On Thu, May 12, 2022 at 11:24 AM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>
>> On 12.05.22 09:01, Lad, Prabhakar wrote:
>>> Hi Jan,
>>>
>>> On Thu, May 12, 2022 at 6:45 AM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>>>
>>>> On 11.05.22 19:09, Lad, Prabhakar wrote:
>>>>> Hi Jan,
>>>>>
>>>>> On Wed, May 11, 2022 at 4:11 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>>>>>
>>>>>> On 11.05.22 13:20, Prabhakar Lad wrote:
>>>>>>> To add further more details:
>>>>>>>
>>>>>>> I am using jailhouse-enabling/5.10 Linux branch [0] with -next branch
>>>>>>> for jailhouse [1].
>>>>>>>
>>>>>>> I added some debug prints and I see the panic is caused when entry()
>>>>>>> function is called (in enter_hypervisor). The entry function lands into
>>>>>>> assembly code (entry.S). I dont have a JTAG to see which exact
>>>>>>> instruction is causing this issue.
>>>>>>
>>>>>> So, already the first instruction in the loaded hypervisor binary is not
>>>>>> executable? That would explain why we see no hypervisor output at all.
>>>>>>
>>>>> To clarify when the hypervisor is loaded the output will be via
>>>>> debug_console specified in the root cell config?
>>>>>
>>>>
>>>> Correct - if you reach entry() in setup.c.
>>>>
>>>>>> Was that memory region properly reserved from Linux (via DTB carve-out
>>>>>> e.g.)?
>>>>>>
>>>>> Yes I have the below memory reserved in my dts:
>>>>>
>>>>>     memory@48000000 {
>>>>>         device_type = "memory";
>>>>>         /* first 128MB is reserved for secure area. */
>>>>>         reg = <0x0 0x48000000 0x0 0x78000000>;
>>>>>     };
>>>>>
>>>>>     reserved-memory {
>>>>>         #address-cells = <2>;
>>>>>         #size-cells = <2>;
>>>>>         ranges;
>>>>>
>>>>>         jh_inmate@a7f00000 {
>>>>>             status = "okay";
>>>>>             no-map;
>>>>>             reg = <0x00 0xa7f00000 0x00 0xf000000>;
>>>>>         };
>>>>>
>>>>>         jailhouse: jailhouse@b6f00000 {
>>>>>             status = "okay";
>>>>>             reg = <0x0 0xb6f00000 0x0 0x1000000>;
>>>>>             no-map;
>>>>>         };
>>>>>     };
>>>>>
>>>>> Linux does report the hole in RAM:
>>>>>
>>>>> root@smarc-rzg2l:~# cat /proc/iomem  |  grep RAM
>>>>> 48000000-a7efffff : System RAM
>>>>> b7f00000-bfffffff : System RAM
>>>>>
>>>>> And below is my root cell config related to hypervisor memory:
>>>>>
>>>>>         .hypervisor_memory = {
>>>>>             .phys_start = 0xb6f00000,
>>>>>             .size =       0x1000000,
>>>>>         },
>>>>>
>>>>> Is there anything obvious I have missed above?
>>>>>
>>>>
>>>> Nothing obvious to me so far.
>>>>
>>>> So, is this really the first instruction in
>>>> hypervisor/arch/arm64/entry.S, arch_entry, that triggers the undefinstr?
>>>> Check the reported address by Linux against the disassembly of the
>>>> hypervisor. You could also play with adding 'ret' as first instruction,
>>>> to check if that returns without a crash.
>>>>
>>> I did play around with ret, below is my observation:
>>>
>>> Up until line 98 [0] just before calling arm_dcaches_flush adding ret
>>> returned without a crash. Adding a ret at line 99 [1] ie after
>>> arm_dcaches_flush it never returned.
>>>
>>> So I continued with adding ret in  arm_dcaches_flush, I added ret as a
>>> first statement in arm_dcaches_flush and was able to see the panic!
>>
>> Which Jailhouse revision are you building? Already disassembled
>> hypervisor.o around arch_entry and arm_dcaches_flush? This is what I
>> have here for next:
>>
> I'm using the next branch too.
> 
>> 0000ffffc0203efc <arm_dcaches_flush>:
>>     ffffc0203efc:       d53b0024        mrs     x4, ctr_el0
>>     ffffc0203f00:       d3504c84        ubfx    x4, x4, #16, #4
>>     ...
>>
>> 0000ffffc0204800 <arch_entry>:
>>     ffffc0204800:       aa0003f0        mov     x16, x0
>>     ffffc0204804:       aa1e03f1        mov     x17, x30
>>     ...
>>     ffffc0204844:       d2800042        mov     x2, #0x2                        // #2
>>     ffffc0204848:       97fffdad        bl      ffffc0203efc <arm_dcaches_flush>
>>
>> You could check if there is such a relative call in your case as well.
> yes it does exist, below is the snippet:
> 
> 0000ffffc0204000 <arch_entry>:
>     ffffc0204000:    aa0003f0     mov    x16, x0
>     ffffc0204004:    aa1e03f1     mov    x17, x30
>     ffffc0204008:    10fdffc0     adr    x0, ffffc0200000 <hypervisor_header>
>     ffffc020400c:    f9402412     ldr    x18, [x0, #72]
>     ffffc0204010:    5800fd0f     ldr    x15, ffffc0205fb0 <sdei_handler+0x2c>
>     ffffc0204014:    900000e1     adrp    x1, ffffc0220000 <__page_pool>
>     ffffc0204018:    79406002     ldrh    w2, [x0, #48]
>     ffffc020401c:    d2880003     mov    x3, #0x4000
>  // #16384
>     ffffc0204020:    9b030441     madd    x1, x2, x3, x1
>     ffffc0204024:    f842c02e     ldur    x14, [x1, #44]
>     ffffc0204028:    5800fc8d     ldr    x13, ffffc0205fb8 <sdei_handler+0x34>
>     ffffc020402c:    f840c02c     ldur    x12, [x1, #12]
>     ffffc0204030:    cb0d018b     sub    x11, x12, x13
>     ffffc0204034:    924051c1     and    x1, x14, #0x1fffff
>     ffffc0204038:    8b0101ef     add    x15, x15, x1
>     ffffc020403c:    f9001c0f     str    x15, [x0, #56]
>     ffffc0204040:    f9400401     ldr    x1, [x0, #8]
>     ffffc0204044:    d2800042     mov    x2, #0x2                       // #2
>     ffffc0204048:    97ffff6c     bl    ffffc0203df8 <arm_dcaches_flush>
>     ffffc020404c:    5800fba1     ldr    x1, ffffc0205fc0 <sdei_handler+0x3c>
>     ffffc0204050:    8b0b0021     add    x1, x1, x11
>     ffffc0204054:    d2800000     mov    x0, #0x0                       // #0
>     ffffc0204058:    f100025f     cmp    x18, #0x0
>     ffffc020405c:    54000041     b.ne    ffffc0204064
> <arch_entry+0x64>  // b.any
>     ffffc0204060:    d2800020     mov    x0, #0x1                       // #1
>     ffffc0204064:    d4000002     hvc    #0x0
>     ffffc0204068:    d4000002     hvc    #0x0
>     ffffc020406c:    14000000     b    ffffc020406c <arch_entry+0x6c>
> 
>> Then you could check, before jumping into arch_entry from the
>> hypervisor, that the opcode at the actual arm_dcaches_flush address is
>> as expected. But maybe already the building injects an issue here.
>>
> Any pointers on how I could do that?
> 

arm_dcaches_flush is loaded at arch_entry (header->entry +
hypervisor_mem) - 0x208. Read the u32 at that address and check if it is
what is in your hypervisor.o (likely also d53b0024).

If that is the case, not the jump but that "mrs     x4, ctr_el0" may
actually be the problem. Check out hypervisor/arch/arm64/caches.S and
see if that code, specifically dcache_line_size, causes trouble outside
of Jailhouse as well, maybe as inline assembly in the driver module.

Jan

-- 
Siemens AG, Technology
Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/5ea8c025-13f2-4754-479a-21395de9306d%40siemens.com.
