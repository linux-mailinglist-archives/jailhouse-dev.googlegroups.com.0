Return-Path: <jailhouse-dev+bncBCJN5Z66VINBBRMAR6AQMGQELRTEYQI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33f.google.com (mail-wm1-x33f.google.com [IPv6:2a00:1450:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id 5016F3164D7
	for <lists+jailhouse-dev@lfdr.de>; Wed, 10 Feb 2021 12:15:18 +0100 (CET)
Received: by mail-wm1-x33f.google.com with SMTP id b201sf1166752wmb.9
        for <lists+jailhouse-dev@lfdr.de>; Wed, 10 Feb 2021 03:15:18 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1612955718; cv=pass;
        d=google.com; s=arc-20160816;
        b=YajWl3dZsw0WQPG8V3nLEA5iq8nQzgfig5/WWk0CTHc7y1/SW4IoYSGXb9d09huxL3
         NVcQVDZ97w3lu8zQeF3kSqH9wNTKZdxgWUR7oAo90YhjRHCB1U4RIWW7/hq3lkpi5ypq
         A5ov1iT168ZNCX8Niuo7i+UqojKcRvjtkfniUywf2j9WC4Y/OiYSkGZLUKimlarH0WdM
         LLry69V0jX/Wx7JZS0SfrnwN3/s0yWtMAyJZCKbxV/us/WQqkdi2LfFhZHR/zFuT+LHl
         gEG4nGb60xTpS7azcFGMYa0REAY7imJzqEOYjC1Q0yiYECmmFPqn0FmzRfo2C5JjKilY
         haFg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:sender:dkim-signature;
        bh=EaxF4QiN9/1iRKmqD9uloMnRptLX9Vqv6HeMe4uEVQw=;
        b=vJVjwveG3cSNuWGgxumzOXsu5uLGjL718La47wKnQs8OthQ4niFzuRagozj5tEN6T5
         Y5+3DH2s56J/FgWx5+FAaF3XiH2/e6fT1k60HPqzA14KF+yV9+QzeT2W2UK59wXf6P0o
         9r+lM40awTfPEESkCFXZo1WAGdexy2yIhr0W24b9hSxPuS+zcVi2YfJXnL63HCvmte6K
         yD2+xyG9kbfk1DDEzx0AM5dQxlZ0+UdVlaqFsEzkNDRF6mi8+ZUYhIuJr+o+YP9MibJ7
         mDRBsQ0LukzeAVkVRYVm43yl+MMD4Vu6N6c4679XRWCMC2qf+UvNY8ypBd7hr+0252ka
         H+Bw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@ikerlan.es header.s=selector2 header.b=049ckliA;
       arc=pass (i=1 spf=pass spfdomain=ikerlan.es dkim=pass dkdomain=ikerlan.es dmarc=pass fromdomain=ikerlan.es);
       spf=pass (google.com: domain of msainz@ikerlan.es designates 40.107.0.97 as permitted sender) smtp.mailfrom=Msainz@ikerlan.es;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ikerlan.es
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=EaxF4QiN9/1iRKmqD9uloMnRptLX9Vqv6HeMe4uEVQw=;
        b=mrzbtYsj8c2GHVrNRI0p+hQoSycic8vRRUlWNOf/fuWI+GpEnq07X6hHC7Ec44DSqI
         bKbYx91biqQjJ5OvLr/KOjxMiqWD1qVVpwFY3x6yTTmXVNdwHYo+a8J120oGfr7TTWnU
         41IT7knMC7APnJnPxpyUg73hLa+E1NGLWdd5o7A1aTdSHm3j1Qk5UfPElebOsgoCMqTF
         SjDG6n/74JN1F3d4qwifRV+yMA9/9RiWIydpsRfOY+fN3UjbAPxYIz5wHSlQGMJZxeu5
         Vvp1aK1RqaN7sub50l1vVVOmOWiVg4s0N9/YhQo/txflZniuiVLX8l7PLV0vcp/OoMoD
         Wj5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=EaxF4QiN9/1iRKmqD9uloMnRptLX9Vqv6HeMe4uEVQw=;
        b=V0FxxqVem6KR5XyGLnsQn56kBf07FgF6ycOHqAt8Sd/R1lMtJqT+WTHs1og9DwF6/B
         e1kMT7UP+mUVV2QjoNjazpADUH1raBsdMjzr/Lo+W7Qe5KA+UcXuIhQVVike4Z44qs8+
         n0t+xVtKiCe6KvXSh0d9o3we147GQ8INPV4cQISzQ6KTsESPJ7o4mMepxIdwxKgfT60n
         yBfpBjM+TkGeUiIvgJ84Bjh8n0DFC41fHE0mPXFgdJkeA8/JNIDxbq7OP8LBvJXr37wA
         eFcZY152dvGk6ounPyEQPXYw3SA1Q5HtlorwKoqDC8Vg9dBQS3XBqOoyNslP27qdnP6/
         L48A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530686pK0zngU+BuUrI7wG3FBcSyCQWah4EZSipXF+2dTmsMr10y
	yxgB2P+YFtW9InxkaJHL8FU=
X-Google-Smtp-Source: ABdhPJwLjakLKOfnJ7Rn061dMN+7mxJAHSpbhgUioe8Su+1EkdneVa8Yh8+OA05rqWWmfVF9lC0kIg==
X-Received: by 2002:adf:f344:: with SMTP id e4mr3104252wrp.363.1612955717918;
        Wed, 10 Feb 2021 03:15:17 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:4d02:: with SMTP id z2ls2101715wrt.3.gmail; Wed, 10 Feb
 2021 03:15:17 -0800 (PST)
X-Received: by 2002:a5d:524a:: with SMTP id k10mr3065198wrc.394.1612955716699;
        Wed, 10 Feb 2021 03:15:16 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1612955716; cv=pass;
        d=google.com; s=arc-20160816;
        b=pJo+uR6aHfUQ+azbJVkEgiTKePL+8h88jqbzLPH5ieMF59fx0O9gUbogOqDlM2o20J
         TMub4elRZNaMYUMh6QqxsB9vnnJ6iakbltQOn/vw10hhhwd/fnxqUu36jGCtSshkA3rR
         /voZcvN9s1IIUJld+Wrul1R6zZL5DFdDQzBlzAGU4VfqRv90kQtllJ66w/F1Wqyck0zE
         1et2b40HeEqD5MZdfG+rRIzlZLqGxe9lphnXFP2OG2Hp5oijXDTokurNyZr0wrNlYpyn
         mFglLRYM4Y1G1fc/s8jfTbzqTdOSZmnwiK/jpLU683feH+DQlh5t5x8UMDC6E3IG2GzQ
         l0/g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:subject:to
         :from:dkim-signature;
        bh=+FHPb+OkPhw8aWpqktf+ng8h0/Qoex9xS/WLhOy9B84=;
        b=aog0R7NrTqNm0RS/DrOB/yBMKShc1QTk1acbxC9HO289fOCaTl0zvypZ4gm5XvTrHX
         J42aDD6dqyz6Ju+rF0qd4elO0JiMA/D7ErQwMw/WWDHvdQQd8ZmQUJpglIAOlOuS7by/
         59viloDT+Wvr6+GcPk5GcKUjXx/KUAWreNtErVbEzip2vCkygvr6Ou54oY8SrCAJXsLl
         iEv+D2H7tQbpCWO65cKTgyMytOm3jPHAFyJ9Sxx7J54pzRTXZo++GstgyH80F5BgTv9X
         3uLgP+SugcKgAKskeKKOogso63GjwNNsyb9LWRSrUtOz9AaqPpO/7wB0d0FUjIq3b6jp
         J2Rw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ikerlan.es header.s=selector2 header.b=049ckliA;
       arc=pass (i=1 spf=pass spfdomain=ikerlan.es dkim=pass dkdomain=ikerlan.es dmarc=pass fromdomain=ikerlan.es);
       spf=pass (google.com: domain of msainz@ikerlan.es designates 40.107.0.97 as permitted sender) smtp.mailfrom=Msainz@ikerlan.es;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ikerlan.es
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (mail-eopbgr00097.outbound.protection.outlook.com. [40.107.0.97])
        by gmr-mx.google.com with ESMTPS id u65si31503wme.1.2021.02.10.03.15.16
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Feb 2021 03:15:16 -0800 (PST)
Received-SPF: pass (google.com: domain of msainz@ikerlan.es designates 40.107.0.97 as permitted sender) client-ip=40.107.0.97;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ke2zEczaxN4ESh21Mi1SCsoLKuM4flX7yyb584JLlZxBlNBVSiGmg0hOjnL/fsersF9g459CvxXam0LXXTTL9SAF+3WoATWAE6xYxreK57gRwKVYl+XIsNbhqQiq3ZAU1LsesVP9AV//eBBYKKQDuvt4X3rl7i4Ya7yivjlmr4qslA/FrB/Z0qoU+diehuEiVqThwS2WgTiJa10DDU5Yph/DxqOyHeAxaqb2ZuAYqLS+fQALKmwz3qiWPWeWjlksiKBMilBEdoEVIogp6mf7kV2hs/9oTZVIACqkJVieP/uIuJZojc6W6gF/RflCmikt8HeFpmMkR5l1wB3EsVnj3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+FHPb+OkPhw8aWpqktf+ng8h0/Qoex9xS/WLhOy9B84=;
 b=CgwFdYJLvU3/nBmdsPEJtFCvFOKRzSvbrE5hyY/yJpslLtq+G7dVvBHoiwIbFnm59jb33bSzLvIBGxJC3Qa+9/ZVuuQy2Wng+toKyCGAZ8fHJucGO96lO98Nh0nrY4mmPAvAiT3YZ88JOgmhbQNw4+AREA9HAKHC+QDa3M7aoA9OmeD1CQTqq2nP/ov0keWSArQz2Tu8wFU86hvGB/aGH4XN9fgEzIRk4vDjHqgy57VtzmPJ9nyTXm0nTdiGUwUGk1fEFxSGN8dMaaOM6ZbOOE3Q172unRIiOygAjoH/sphYeG8vJZ5z7AJ++oXK2yk+jDDyQgpJRNt5oX0hVZUT6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ikerlan.es; dmarc=pass action=none header.from=ikerlan.es;
 dkim=pass header.d=ikerlan.es; arc=none
Received: from AM0PR03MB4450.eurprd03.prod.outlook.com (2603:10a6:208:ca::33)
 by AM0PR03MB4708.eurprd03.prod.outlook.com (2603:10a6:208:c2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.26; Wed, 10 Feb
 2021 11:15:15 +0000
Received: from AM0PR03MB4450.eurprd03.prod.outlook.com
 ([fe80::b874:4798:756b:9da1]) by AM0PR03MB4450.eurprd03.prod.outlook.com
 ([fe80::b874:4798:756b:9da1%4]) with mapi id 15.20.3825.030; Wed, 10 Feb 2021
 11:15:15 +0000
From: Sainz Markel <Msainz@ikerlan.es>
To: Jan Kiszka <jan.kiszka@siemens.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
Subject: RE: Overflow in MMIO registration
Thread-Topic: Overflow in MMIO registration
Thread-Index: Adb9/f7M/lP2EmDISBKFTcmUvnX2LwADtf2AAGQZjFA=
Date: Wed, 10 Feb 2021 11:15:15 +0000
Message-ID: <AM0PR03MB44507C4040BE5E902027D833B68D9@AM0PR03MB4450.eurprd03.prod.outlook.com>
References: <AM0PR03MB4450A4AD70FFBBA0D726D521B68F9@AM0PR03MB4450.eurprd03.prod.outlook.com>
 <290f756e-4a93-46f8-0eb6-a15206bdc1d7@siemens.com>
In-Reply-To: <290f756e-4a93-46f8-0eb6-a15206bdc1d7@siemens.com>
Accept-Language: en-US
Content-Language: es-ES
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [193.145.247.253]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 796852d7-8963-4997-18aa-08d8cdb52435
x-ms-traffictypediagnostic: AM0PR03MB4708:
x-microsoft-antispam-prvs: <AM0PR03MB4708F275F5A177A974573DA3B68D9@AM0PR03MB4708.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nQHKycx5KI04Jr89TwJBrBuijN5s+hFp0o2ccczTijJBVzJhOh2LsgVcIEjoIHqlv2L1xWqM3XwKjjDHMCiP9AfeA36e2KNm/DZMhbS7jewqCoFNJdWqG9MrWxcD5JizD8CGcNrkygRyHxuzxaoZ5GtJKqQTn1HtzfCi2Bt3U/AgJPujz3WJxt2JwLQDIPXjwIKX6KY6ijec9xl9zlE8s0xNsQKB5dWIEJHsj1YJJTzSq/jyQMcB8vAX0ptCIQwo9NROxtwzhNAmva67JEYafyq5UeCVxszfZtb/yKBbudeTRNWV9r4+1pZXCWqgWdN0ugt18qXZWY1Z+UZ1J9Vnnx9z0+FdTfVarejSMKupk9Vd3V8aTyoO948/xzsJkh/sjHyM4mt7joa8OjgIgfhbcVEmcpPGaXsCajolB/m7ISqZjOZ5Wx88NYcOLMPnEX4uZva8YX/6xFjXGrbRBiRnt7hBmz/4ZtxnMzwCNJh+BoK8Z7vUTiJ9BHK8kM3poJ13AhIFC4BGibegHxBWEj7pJA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB4450.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39840400004)(346002)(366004)(376002)(136003)(26005)(186003)(9686003)(53546011)(6506007)(8936002)(2906002)(55016002)(7696005)(86362001)(99936003)(110136005)(316002)(83380400001)(478600001)(3480700007)(5660300002)(8676002)(66446008)(64756008)(52536014)(71200400001)(33656002)(66556008)(76116006)(66476007)(66576008)(66946007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?M0Rnd3dsTndQMWVPTmNmRnNhcTlNV2w1WUVRQ21QSTFZY09NWWwwOUNmYXhj?=
 =?utf-8?B?VzVBTzVVRFFzOE45eEh1Q1NVQmE4NThVRy9QbUpNVE81RERFVklMRzlzVTln?=
 =?utf-8?B?MWlIMFFUNkdGSEJXWVB6MXQ3b2xPK24zVVVtZ21xdWhBUzJJU3k5ZGpXSEEr?=
 =?utf-8?B?OWovNXlKMVpieG11cFdZaGltUjN2UkZjbldOSWtBMnZVUDBBZFVnT0lmWlNS?=
 =?utf-8?B?c0FGRGc2Zk5obGs2TlVEQ1E1UzhrRVRPWHZpTFYwQUtDbWh4YVJkWjBGa3lP?=
 =?utf-8?B?VEVSd3BqZlZNaHlWYm43SGFYcEN0QnNOT3NLdEVod28zTC91eTVncUpyK0Nr?=
 =?utf-8?B?dDg3V0NLZUxHaGJWeXlHSWtVYUp2dGVYYlN5MFdLYzZkaEYwdTd0NU41NU9M?=
 =?utf-8?B?bVB2eWI3RjRZdHVoaXB1cEViT2RqT2I1MjdGbXkxblJzR09DNENieU9Yd0V4?=
 =?utf-8?B?dDZWU0hWdjU5TzN6WTN3UVg4cXhVV0d4L2xmeERFQllhY0daOHJ0WkwrQU9k?=
 =?utf-8?B?UHZFZS96ZHNuMGdSc2N5UkNiaDB1aUZ5VEcwY3VKSGcvWWVVS3BXNHN5OCt4?=
 =?utf-8?B?d3NZdjRNQWNwd3cyN09zUnBoK3VaSWV6SktqR2JtVHVtV1V3YVlyRUVRQjZ2?=
 =?utf-8?B?UUJXb0xiSG1ObUZ4VVl6WWxrZzFpYlo2YkVtWTc0V0RZWk8xbUh5UVk2bXZW?=
 =?utf-8?B?V2RJSGdhdWJpc1dEcnQ5OVREMlVsOG5tMlIxcmZjUEM1L1Z5emw3WTJGWEFB?=
 =?utf-8?B?NW05RXZ3ZVFmajRBV1JOWVVWeUZlalRQZEUvenRvV084ZjArK00wV1ZkUXBp?=
 =?utf-8?B?eVFTR0NPRmVuMksyQkxNdis4WEpOM3N4TXFBNVI5b051TUZVN2c5a2VKZ05L?=
 =?utf-8?B?V1IxK0NXYW5UaHJDQzd1UjVPT1pod3VGOG94VGVLbFdSZ2dqSFVRRDV2cVor?=
 =?utf-8?B?SHpsNVpDS0tGekxlclBmNEpobEUzd1UvUHBhRjNnTytYSFd5Qy80R3BrZ3Z5?=
 =?utf-8?B?eEZDWXIwOHNrenZ6aUdDSUsvcFR4ODB1ckRIY2VxaGtuUlAxaXNsT1JNMmVw?=
 =?utf-8?B?RFNYTmdxUnoralRGamVjenBBWlVNMUE2RlpoK0U1U0kxdVpFdGR2WGx0NHh6?=
 =?utf-8?B?SGM2NUpJZGVpQVlBMDR3R0ZWdmpsU3J5OHpqWXVnazR1RXByV09FT1o0Mzd6?=
 =?utf-8?B?T2t3QnlmdVVoVnBFeTdPakVKdUc1VThBczZWMzJKaVc1djRYNFFMU0N4VnpV?=
 =?utf-8?B?dEdBejBKelNrQ1YzWDdrQS8xaUVyajU2NWE1T2RKZE5XTkRrbmZzci9uMDY3?=
 =?utf-8?B?bU5UWFpGc2lwdTRxZ2l0dEkrZUkrWXlMay9HS082Y3B6cmdUN050K2hVYVpK?=
 =?utf-8?B?QnBNNXR6T05ESHM3NjVUREZWZjc1dFBhRUJIZUt6dnNQV01VdHpwS0JxVjRM?=
 =?utf-8?B?UExlMGt5ZXI0azA2eTArZVNPd2FjVVlzUGU4NlE0Sk1QS0tNdk9tWWZkeVhP?=
 =?utf-8?B?djN6eG80SS9UUStId0tBTzhTL1lPMmJCU2R6VVFpMWhrdlBrdmhQU0hSNlFW?=
 =?utf-8?B?NWUvR3dKMXpwckpYVzFkd2kwS1cwaXVhcktleUNHQmJvU2IyZDhCejhnM1FF?=
 =?utf-8?B?UHpiUzVpM0RZS0lqcTZDMDM1enNNaXVLTHB5bHJPV2ZlSm9GWE83aUVhdEpN?=
 =?utf-8?B?SDhaY2d6aW1OTkZhS3dlalZtVGdBSDBVdDlkOG8zL2JaQklIdnlDczlkVE5y?=
 =?utf-8?Q?DayQ6Au/2TDSPS1ZpjuTjPsiu1Zfck4l7/Ll3cf?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/mixed;
	boundary="_008_AM0PR03MB44507C4040BE5E902027D833B68D9AM0PR03MB4450eurp_"
MIME-Version: 1.0
X-OriginatorOrg: ikerlan.es
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB4450.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 796852d7-8963-4997-18aa-08d8cdb52435
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2021 11:15:15.2199
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 910ac815-f855-4a08-bf29-90b46552cf11
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LMtKqYfL9pSo7nOADSzq+GS/0/PgcIhBsdEpapk3A2MxWF52tT/3kEzeeeLE6BipN2W7yfuV1IcgfjKIjU8Qsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4708
X-Original-Sender: msainz@ikerlan.es
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ikerlan.es header.s=selector2 header.b=049ckliA;       arc=pass
 (i=1 spf=pass spfdomain=ikerlan.es dkim=pass dkdomain=ikerlan.es dmarc=pass
 fromdomain=ikerlan.es);       spf=pass (google.com: domain of
 msainz@ikerlan.es designates 40.107.0.97 as permitted sender)
 smtp.mailfrom=Msainz@ikerlan.es;       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ikerlan.es
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

--_008_AM0PR03MB44507C4040BE5E902027D833B68D9AM0PR03MB4450eurp_
Content-Type: text/plain; charset="UTF-8"

On 08.02.21 12:24, Kizska Jan wrote:

>Something may have caused a subpage MMIO region to be created (page-unaligned memory region). If that region split-up didn't exist in the root cell already, things will fail. But I suspect that subpage is rather a symptom, not the >cause.

>Where there any compiler warnings when building the config? I would also recommend checking our configs via "jailhouse config check root.cell cell1.cell cell2.cell ...". Or share what you created.

>Jan

>--
>Siemens AG, T RDA IOT
>Corporate Competence Center Embedded Linux

There are no warning during compilation and jailhouse config check command says it is everything correct. 

#jailhouse config check sysconfig.cell core1-cell.cell core2-cell.cell core3-cell.cell core4-cell.cell core5-cell.cell 
  Reading configuration set:
  Root cell:     RootCell (sysconfig.cell)
  Non-root cell: core1-cell (core1-cell.cell)
  Non-root cell: core2-cell (core2-cell.cell)
  Non-root cell: core3-cell (core3-cell.cell)
  Non-root cell: core4-cell (core4-cell.cell)
  Non-root cell: core5-cell (core5-cell.cell)
Overlapping memory regions inside cell: None
Overlapping memory regions with hypervisor: None
Missing PCI MMCONFIG interceptions: None
Missing IOMMU interceptions: None
Missing resource interceptions for architecture x86: None

Attached to the mail the cell files I'm using. The .bin file is the same as for apic-demo.

Thanks a lot for the help :)

Markel.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/AM0PR03MB44507C4040BE5E902027D833B68D9%40AM0PR03MB4450.eurprd03.prod.outlook.com.

--_008_AM0PR03MB44507C4040BE5E902027D833B68D9AM0PR03MB4450eurp_
Content-Type: text/plain; name="core0-cell.c"
Content-Description: core0-cell.c
Content-Disposition: attachment; filename="core0-cell.c"; size=1488;
	creation-date="Wed, 10 Feb 2021 11:13:53 GMT";
	modification-date="Mon, 08 Feb 2021 13:54:02 GMT"
Content-Transfer-Encoding: base64

I2luY2x1ZGUgPGphaWxob3VzZS90eXBlcy5oPgojaW5jbHVkZSA8amFpbGhvdXNlL2NlbGwtY29u
ZmlnLmg+CgpzdHJ1Y3QgewoJc3RydWN0IGphaWxob3VzZV9jZWxsX2Rlc2MgY2VsbDsKCV9fdTY0
IGNwdXNbMV07CglzdHJ1Y3QgamFpbGhvdXNlX21lbW9yeSBtZW1fcmVnaW9uc1syXTsKCXN0cnVj
dCBqYWlsaG91c2VfY2FjaGUgY2FjaGVfcmVnaW9uc1sxXTsKCXN0cnVjdCBqYWlsaG91c2VfcGlv
IHBpb19yZWdpb25zWzNdOwp9IF9fYXR0cmlidXRlX18oKHBhY2tlZCkpIGNvbmZpZyA9IHsKCS5j
ZWxsID0gewoJCS5zaWduYXR1cmUgPSBKQUlMSE9VU0VfQ0VMTF9ERVNDX1NJR05BVFVSRSwKCQku
cmV2aXNpb24gPSBKQUlMSE9VU0VfQ09ORklHX1JFVklTSU9OLAoJCS5uYW1lID0gImNvcmUwLWNl
bGwiLAoJCS5mbGFncyA9IEpBSUxIT1VTRV9DRUxMX1ZJUlRVQUxfQ09OU09MRV9QRVJNSVRURUQs
CgoJCS5jcHVfc2V0X3NpemUgPSBzaXplb2YoY29uZmlnLmNwdXMpLAoJCS5udW1fbWVtb3J5X3Jl
Z2lvbnMgPSBBUlJBWV9TSVpFKGNvbmZpZy5tZW1fcmVnaW9ucyksCgkJLm51bV9jYWNoZV9yZWdp
b25zID0gQVJSQVlfU0laRShjb25maWcuY2FjaGVfcmVnaW9ucyksCgkJLm51bV9pcnFjaGlwcyA9
IDAsCgkJLm51bV9waW9fcmVnaW9ucyA9IEFSUkFZX1NJWkUoY29uZmlnLnBpb19yZWdpb25zKSwK
CQkubnVtX3BjaV9kZXZpY2VzID0gMCwKCgkJLmNvbnNvbGUgPSB7CgkJCS50eXBlID0gSkFJTEhP
VVNFX0NPTl9UWVBFXzgyNTAsCgkJCS5mbGFncyA9IEpBSUxIT1VTRV9DT05fQUNDRVNTX1BJTywK
CQkJLmFkZHJlc3MgPSAweDNmOCwKCQl9LAoJfSwKCgkuY3B1cyA9IHsKCQkweDAxLAoJfSwKCgku
bWVtX3JlZ2lvbnMgPSB7CgkJLyogUkFNICovIHsKCQkJLnBoeXNfc3RhcnQgPSAweDNmMmY0MjQw
LAoJCQkudmlydF9zdGFydCA9IDAsCgkJCS5zaXplID0gMHg0YzRiNDAwLAoJCQkuZmxhZ3MgPSBK
QUlMSE9VU0VfTUVNX1JFQUQgfCBKQUlMSE9VU0VfTUVNX1dSSVRFIHwKCQkJCUpBSUxIT1VTRV9N
RU1fRVhFQ1VURSB8IEpBSUxIT1VTRV9NRU1fTE9BREFCTEUsCgkJfSwKCQkvKiBjb21tdW5pY2F0
aW9uIHJlZ2lvbiAqLyB7CgkJCS52aXJ0X3N0YXJ0ID0gMHg0YzRiNDAwLAoJCQkuc2l6ZSA9IDB4
MDAwMDEwMDAsCgkJCS5mbGFncyA9IEpBSUxIT1VTRV9NRU1fUkVBRCB8IEpBSUxIT1VTRV9NRU1f
V1JJVEUgfAoJCQkJSkFJTEhPVVNFX01FTV9DT01NX1JFR0lPTiwKCQl9LAoJfSwKCgkuY2FjaGVf
cmVnaW9ucyA9IHsKCQl7CgkJCS5zdGFydCA9IDAsCgkJCS5zaXplID0gMiwKCQkJLnR5cGUgPSBK
QUlMSE9VU0VfQ0FDSEVfTDMsCgkJfSwKCX0sCgoJLnBpb19yZWdpb25zID0gewoJCVBJT19SQU5H
RSgweDJmOCwgOCksIC8qIHNlcmlhbCAyICovCgkJUElPX1JBTkdFKDB4M2Y4LCA4KSwgLyogc2Vy
aWFsIDEgKi8KCQlQSU9fUkFOR0UoMHhlMDEwLCA4KSwgLyogT1hQQ0llOTUyIHNlcmlhbCAqLwoJ
fSwKfTsK

--_008_AM0PR03MB44507C4040BE5E902027D833B68D9AM0PR03MB4450eurp_
Content-Type: text/plain; name="core1-cell.c"
Content-Description: core1-cell.c
Content-Disposition: attachment; filename="core1-cell.c"; size=1487;
	creation-date="Wed, 10 Feb 2021 11:13:53 GMT";
	modification-date="Wed, 03 Feb 2021 09:17:32 GMT"
Content-Transfer-Encoding: base64

I2luY2x1ZGUgPGphaWxob3VzZS90eXBlcy5oPgojaW5jbHVkZSA8amFpbGhvdXNlL2NlbGwtY29u
ZmlnLmg+CgpzdHJ1Y3QgewoJc3RydWN0IGphaWxob3VzZV9jZWxsX2Rlc2MgY2VsbDsKCV9fdTY0
IGNwdXNbMV07CglzdHJ1Y3QgamFpbGhvdXNlX21lbW9yeSBtZW1fcmVnaW9uc1syXTsKCXN0cnVj
dCBqYWlsaG91c2VfY2FjaGUgY2FjaGVfcmVnaW9uc1sxXTsKCXN0cnVjdCBqYWlsaG91c2VfcGlv
IHBpb19yZWdpb25zWzNdOwp9IF9fYXR0cmlidXRlX18oKHBhY2tlZCkpIGNvbmZpZyA9IHsKCS5j
ZWxsID0gewoJCS5zaWduYXR1cmUgPSBKQUlMSE9VU0VfQ0VMTF9ERVNDX1NJR05BVFVSRSwKCQku
cmV2aXNpb24gPSBKQUlMSE9VU0VfQ09ORklHX1JFVklTSU9OLAoJCS5uYW1lID0gImNvcmUxLWNl
bGwiLAoJCS5mbGFncyA9IEpBSUxIT1VTRV9DRUxMX1ZJUlRVQUxfQ09OU09MRV9QRVJNSVRURUQs
CgoJCS5jcHVfc2V0X3NpemUgPSBzaXplb2YoY29uZmlnLmNwdXMpLAoJCS5udW1fbWVtb3J5X3Jl
Z2lvbnMgPSBBUlJBWV9TSVpFKGNvbmZpZy5tZW1fcmVnaW9ucyksCgkJLm51bV9jYWNoZV9yZWdp
b25zID0gQVJSQVlfU0laRShjb25maWcuY2FjaGVfcmVnaW9ucyksCgkJLm51bV9pcnFjaGlwcyA9
IDAsCgkJLm51bV9waW9fcmVnaW9ucyA9IEFSUkFZX1NJWkUoY29uZmlnLnBpb19yZWdpb25zKSwK
CQkubnVtX3BjaV9kZXZpY2VzID0gMCwKCgkJLmNvbnNvbGUgPSB7CgkJCS50eXBlID0gSkFJTEhP
VVNFX0NPTl9UWVBFXzgyNTAsCgkJCS5mbGFncyA9IEpBSUxIT1VTRV9DT05fQUNDRVNTX1BJTywK
CQkJLmFkZHJlc3MgPSAweDNmOCwKCQl9LAoJfSwKCgkuY3B1cyA9IHsKCQkweDIsCgl9LAoKCS5t
ZW1fcmVnaW9ucyA9IHsKCQkvKiBSQU0gKi8gewoJCQkucGh5c19zdGFydCA9IDB4NDQwMzM4ODAs
CgkJCS52aXJ0X3N0YXJ0ID0gMCwKCQkJLnNpemUgPSAweDRjNGI0MDAsCgkJCS5mbGFncyA9IEpB
SUxIT1VTRV9NRU1fUkVBRCB8IEpBSUxIT1VTRV9NRU1fV1JJVEUgfAoJCQkJSkFJTEhPVVNFX01F
TV9FWEVDVVRFIHwgSkFJTEhPVVNFX01FTV9MT0FEQUJMRSwKCQl9LAoJCS8qIGNvbW11bmljYXRp
b24gcmVnaW9uICovIHsKCQkJLnZpcnRfc3RhcnQgPSAweDRjNGI0MDAsCgkJCS5zaXplID0gMHgw
MDAwMTAwMCwKCQkJLmZsYWdzID0gSkFJTEhPVVNFX01FTV9SRUFEIHwgSkFJTEhPVVNFX01FTV9X
UklURSB8CgkJCQlKQUlMSE9VU0VfTUVNX0NPTU1fUkVHSU9OLAoJCX0sCgl9LAoKCS5jYWNoZV9y
ZWdpb25zID0gewoJCXsKCQkJLnN0YXJ0ID0gMCwKCQkJLnNpemUgPSAyLAoJCQkudHlwZSA9IEpB
SUxIT1VTRV9DQUNIRV9MMywKCQl9LAoJfSwKCgkucGlvX3JlZ2lvbnMgPSB7CgkJUElPX1JBTkdF
KDB4MmY4LCA4KSwgLyogc2VyaWFsIDIgKi8KCQlQSU9fUkFOR0UoMHgzZjgsIDgpLCAvKiBzZXJp
YWwgMSAqLwoJCVBJT19SQU5HRSgweGUwMTAsIDgpLCAvKiBPWFBDSWU5NTIgc2VyaWFsICovCgl9
LAp9Owo=

--_008_AM0PR03MB44507C4040BE5E902027D833B68D9AM0PR03MB4450eurp_
Content-Type: text/plain; name="core2-cell.c"
Content-Description: core2-cell.c
Content-Disposition: attachment; filename="core2-cell.c"; size=1488;
	creation-date="Wed, 10 Feb 2021 11:13:53 GMT";
	modification-date="Mon, 08 Feb 2021 13:53:22 GMT"
Content-Transfer-Encoding: base64

I2luY2x1ZGUgPGphaWxob3VzZS90eXBlcy5oPgojaW5jbHVkZSA8amFpbGhvdXNlL2NlbGwtY29u
ZmlnLmg+CgpzdHJ1Y3QgewoJc3RydWN0IGphaWxob3VzZV9jZWxsX2Rlc2MgY2VsbDsKCV9fdTY0
IGNwdXNbMV07CglzdHJ1Y3QgamFpbGhvdXNlX21lbW9yeSBtZW1fcmVnaW9uc1syXTsKCXN0cnVj
dCBqYWlsaG91c2VfY2FjaGUgY2FjaGVfcmVnaW9uc1sxXTsKCXN0cnVjdCBqYWlsaG91c2VfcGlv
IHBpb19yZWdpb25zWzNdOwp9IF9fYXR0cmlidXRlX18oKHBhY2tlZCkpIGNvbmZpZyA9IHsKCS5j
ZWxsID0gewoJCS5zaWduYXR1cmUgPSBKQUlMSE9VU0VfQ0VMTF9ERVNDX1NJR05BVFVSRSwKCQku
cmV2aXNpb24gPSBKQUlMSE9VU0VfQ09ORklHX1JFVklTSU9OLAoJCS5uYW1lID0gImNvcmUyLWNl
bGwiLAoJCS5mbGFncyA9IEpBSUxIT1VTRV9DRUxMX1ZJUlRVQUxfQ09OU09MRV9QRVJNSVRURUQs
CgoJCS5jcHVfc2V0X3NpemUgPSBzaXplb2YoY29uZmlnLmNwdXMpLAoJCS5udW1fbWVtb3J5X3Jl
Z2lvbnMgPSBBUlJBWV9TSVpFKGNvbmZpZy5tZW1fcmVnaW9ucyksCgkJLm51bV9jYWNoZV9yZWdp
b25zID0gQVJSQVlfU0laRShjb25maWcuY2FjaGVfcmVnaW9ucyksCgkJLm51bV9pcnFjaGlwcyA9
IDAsCgkJLm51bV9waW9fcmVnaW9ucyA9IEFSUkFZX1NJWkUoY29uZmlnLnBpb19yZWdpb25zKSwK
CQkubnVtX3BjaV9kZXZpY2VzID0gMCwKCgkJLmNvbnNvbGUgPSB7CgkJCS50eXBlID0gSkFJTEhP
VVNFX0NPTl9UWVBFXzgyNTAsCgkJCS5mbGFncyA9IEpBSUxIT1VTRV9DT05fQUNDRVNTX1BJTywK
CQkJLmFkZHJlc3MgPSAweDNmOCwKCQl9LAoJfSwKCgkuY3B1cyA9IHsKCQkweDA0LAoJfSwKCgku
bWVtX3JlZ2lvbnMgPSB7CgkJLyogUkFNICovIHsKCQkJLnBoeXNfc3RhcnQgPSAweDQ4ZDcyZWMw
LAoJCQkudmlydF9zdGFydCA9IDAsCgkJCS5zaXplID0gMHg0YzRiNDAwLAoJCQkuZmxhZ3MgPSBK
QUlMSE9VU0VfTUVNX1JFQUQgfCBKQUlMSE9VU0VfTUVNX1dSSVRFIHwKCQkJCUpBSUxIT1VTRV9N
RU1fRVhFQ1VURSB8IEpBSUxIT1VTRV9NRU1fTE9BREFCTEUsCgkJfSwKCQkvKiBjb21tdW5pY2F0
aW9uIHJlZ2lvbiAqLyB7CgkJCS52aXJ0X3N0YXJ0ID0gMHg0YzRiNDAwLAoJCQkuc2l6ZSA9IDB4
MDAwMDEwMDAsCgkJCS5mbGFncyA9IEpBSUxIT1VTRV9NRU1fUkVBRCB8IEpBSUxIT1VTRV9NRU1f
V1JJVEUgfAoJCQkJSkFJTEhPVVNFX01FTV9DT01NX1JFR0lPTiwKCQl9LAoJfSwKCgkuY2FjaGVf
cmVnaW9ucyA9IHsKCQl7CgkJCS5zdGFydCA9IDAsCgkJCS5zaXplID0gMiwKCQkJLnR5cGUgPSBK
QUlMSE9VU0VfQ0FDSEVfTDMsCgkJfSwKCX0sCgoJLnBpb19yZWdpb25zID0gewoJCVBJT19SQU5H
RSgweDJmOCwgOCksIC8qIHNlcmlhbCAyICovCgkJUElPX1JBTkdFKDB4M2Y4LCA4KSwgLyogc2Vy
aWFsIDEgKi8KCQlQSU9fUkFOR0UoMHhlMDEwLCA4KSwgLyogT1hQQ0llOTUyIHNlcmlhbCAqLwoJ
fSwKfTsK

--_008_AM0PR03MB44507C4040BE5E902027D833B68D9AM0PR03MB4450eurp_
Content-Type: text/plain; name="core3-cell.c"
Content-Description: core3-cell.c
Content-Disposition: attachment; filename="core3-cell.c"; size=1488;
	creation-date="Wed, 10 Feb 2021 11:13:53 GMT";
	modification-date="Mon, 08 Feb 2021 13:53:28 GMT"
Content-Transfer-Encoding: base64

I2luY2x1ZGUgPGphaWxob3VzZS90eXBlcy5oPgojaW5jbHVkZSA8amFpbGhvdXNlL2NlbGwtY29u
ZmlnLmg+CgpzdHJ1Y3QgewoJc3RydWN0IGphaWxob3VzZV9jZWxsX2Rlc2MgY2VsbDsKCV9fdTY0
IGNwdXNbMV07CglzdHJ1Y3QgamFpbGhvdXNlX21lbW9yeSBtZW1fcmVnaW9uc1syXTsKCXN0cnVj
dCBqYWlsaG91c2VfY2FjaGUgY2FjaGVfcmVnaW9uc1sxXTsKCXN0cnVjdCBqYWlsaG91c2VfcGlv
IHBpb19yZWdpb25zWzNdOwp9IF9fYXR0cmlidXRlX18oKHBhY2tlZCkpIGNvbmZpZyA9IHsKCS5j
ZWxsID0gewoJCS5zaWduYXR1cmUgPSBKQUlMSE9VU0VfQ0VMTF9ERVNDX1NJR05BVFVSRSwKCQku
cmV2aXNpb24gPSBKQUlMSE9VU0VfQ09ORklHX1JFVklTSU9OLAoJCS5uYW1lID0gImNvcmUzLWNl
bGwiLAoJCS5mbGFncyA9IEpBSUxIT1VTRV9DRUxMX1ZJUlRVQUxfQ09OU09MRV9QRVJNSVRURUQs
CgoJCS5jcHVfc2V0X3NpemUgPSBzaXplb2YoY29uZmlnLmNwdXMpLAoJCS5udW1fbWVtb3J5X3Jl
Z2lvbnMgPSBBUlJBWV9TSVpFKGNvbmZpZy5tZW1fcmVnaW9ucyksCgkJLm51bV9jYWNoZV9yZWdp
b25zID0gQVJSQVlfU0laRShjb25maWcuY2FjaGVfcmVnaW9ucyksCgkJLm51bV9pcnFjaGlwcyA9
IDAsCgkJLm51bV9waW9fcmVnaW9ucyA9IEFSUkFZX1NJWkUoY29uZmlnLnBpb19yZWdpb25zKSwK
CQkubnVtX3BjaV9kZXZpY2VzID0gMCwKCgkJLmNvbnNvbGUgPSB7CgkJCS50eXBlID0gSkFJTEhP
VVNFX0NPTl9UWVBFXzgyNTAsCgkJCS5mbGFncyA9IEpBSUxIT1VTRV9DT05fQUNDRVNTX1BJTywK
CQkJLmFkZHJlc3MgPSAweDNmOCwKCQl9LAoJfSwKCgkuY3B1cyA9IHsKCQkweDA4LAoJfSwKCgku
bWVtX3JlZ2lvbnMgPSB7CgkJLyogUkFNICovIHsKCQkJLnBoeXNfc3RhcnQgPSAweDRkYWIyNTAw
LAoJCQkudmlydF9zdGFydCA9IDAsCgkJCS5zaXplID0gMHg0YzRiNDAwLAoJCQkuZmxhZ3MgPSBK
QUlMSE9VU0VfTUVNX1JFQUQgfCBKQUlMSE9VU0VfTUVNX1dSSVRFIHwKCQkJCUpBSUxIT1VTRV9N
RU1fRVhFQ1VURSB8IEpBSUxIT1VTRV9NRU1fTE9BREFCTEUsCgkJfSwKCQkvKiBjb21tdW5pY2F0
aW9uIHJlZ2lvbiAqLyB7CgkJCS52aXJ0X3N0YXJ0ID0gMHg0YzRiNDAwLAoJCQkuc2l6ZSA9IDB4
MDAwMDEwMDAsCgkJCS5mbGFncyA9IEpBSUxIT1VTRV9NRU1fUkVBRCB8IEpBSUxIT1VTRV9NRU1f
V1JJVEUgfAoJCQkJSkFJTEhPVVNFX01FTV9DT01NX1JFR0lPTiwKCQl9LAoJfSwKCgkuY2FjaGVf
cmVnaW9ucyA9IHsKCQl7CgkJCS5zdGFydCA9IDAsCgkJCS5zaXplID0gMiwKCQkJLnR5cGUgPSBK
QUlMSE9VU0VfQ0FDSEVfTDMsCgkJfSwKCX0sCgoJLnBpb19yZWdpb25zID0gewoJCVBJT19SQU5H
RSgweDJmOCwgOCksIC8qIHNlcmlhbCAyICovCgkJUElPX1JBTkdFKDB4M2Y4LCA4KSwgLyogc2Vy
aWFsIDEgKi8KCQlQSU9fUkFOR0UoMHhlMDEwLCA4KSwgLyogT1hQQ0llOTUyIHNlcmlhbCAqLwoJ
fSwKfTsK

--_008_AM0PR03MB44507C4040BE5E902027D833B68D9AM0PR03MB4450eurp_
Content-Type: text/plain; name="core4-cell.c"
Content-Description: core4-cell.c
Content-Disposition: attachment; filename="core4-cell.c"; size=1488;
	creation-date="Wed, 10 Feb 2021 11:13:53 GMT";
	modification-date="Mon, 08 Feb 2021 13:53:44 GMT"
Content-Transfer-Encoding: base64

I2luY2x1ZGUgPGphaWxob3VzZS90eXBlcy5oPgojaW5jbHVkZSA8amFpbGhvdXNlL2NlbGwtY29u
ZmlnLmg+CgpzdHJ1Y3QgewoJc3RydWN0IGphaWxob3VzZV9jZWxsX2Rlc2MgY2VsbDsKCV9fdTY0
IGNwdXNbMV07CglzdHJ1Y3QgamFpbGhvdXNlX21lbW9yeSBtZW1fcmVnaW9uc1syXTsKCXN0cnVj
dCBqYWlsaG91c2VfY2FjaGUgY2FjaGVfcmVnaW9uc1sxXTsKCXN0cnVjdCBqYWlsaG91c2VfcGlv
IHBpb19yZWdpb25zWzNdOwp9IF9fYXR0cmlidXRlX18oKHBhY2tlZCkpIGNvbmZpZyA9IHsKCS5j
ZWxsID0gewoJCS5zaWduYXR1cmUgPSBKQUlMSE9VU0VfQ0VMTF9ERVNDX1NJR05BVFVSRSwKCQku
cmV2aXNpb24gPSBKQUlMSE9VU0VfQ09ORklHX1JFVklTSU9OLAoJCS5uYW1lID0gImNvcmU0LWNl
bGwiLAoJCS5mbGFncyA9IEpBSUxIT1VTRV9DRUxMX1ZJUlRVQUxfQ09OU09MRV9QRVJNSVRURUQs
CgoJCS5jcHVfc2V0X3NpemUgPSBzaXplb2YoY29uZmlnLmNwdXMpLAoJCS5udW1fbWVtb3J5X3Jl
Z2lvbnMgPSBBUlJBWV9TSVpFKGNvbmZpZy5tZW1fcmVnaW9ucyksCgkJLm51bV9jYWNoZV9yZWdp
b25zID0gQVJSQVlfU0laRShjb25maWcuY2FjaGVfcmVnaW9ucyksCgkJLm51bV9pcnFjaGlwcyA9
IDAsCgkJLm51bV9waW9fcmVnaW9ucyA9IEFSUkFZX1NJWkUoY29uZmlnLnBpb19yZWdpb25zKSwK
CQkubnVtX3BjaV9kZXZpY2VzID0gMCwKCgkJLmNvbnNvbGUgPSB7CgkJCS50eXBlID0gSkFJTEhP
VVNFX0NPTl9UWVBFXzgyNTAsCgkJCS5mbGFncyA9IEpBSUxIT1VTRV9DT05fQUNDRVNTX1BJTywK
CQkJLmFkZHJlc3MgPSAweDNmOCwKCQl9LAoJfSwKCgkuY3B1cyA9IHsKCQkweDEwLAoJfSwKCgku
bWVtX3JlZ2lvbnMgPSB7CgkJLyogUkFNICovIHsKCQkJLnBoeXNfc3RhcnQgPSAweDUyN2YxYjQw
LAoJCQkudmlydF9zdGFydCA9IDAsCgkJCS5zaXplID0gMHg0YzRiNDAwLAoJCQkuZmxhZ3MgPSBK
QUlMSE9VU0VfTUVNX1JFQUQgfCBKQUlMSE9VU0VfTUVNX1dSSVRFIHwKCQkJCUpBSUxIT1VTRV9N
RU1fRVhFQ1VURSB8IEpBSUxIT1VTRV9NRU1fTE9BREFCTEUsCgkJfSwKCQkvKiBjb21tdW5pY2F0
aW9uIHJlZ2lvbiAqLyB7CgkJCS52aXJ0X3N0YXJ0ID0gMHg0YzRiNDAwLAoJCQkuc2l6ZSA9IDB4
MDAwMDEwMDAsCgkJCS5mbGFncyA9IEpBSUxIT1VTRV9NRU1fUkVBRCB8IEpBSUxIT1VTRV9NRU1f
V1JJVEUgfAoJCQkJSkFJTEhPVVNFX01FTV9DT01NX1JFR0lPTiwKCQl9LAoJfSwKCgkuY2FjaGVf
cmVnaW9ucyA9IHsKCQl7CgkJCS5zdGFydCA9IDAsCgkJCS5zaXplID0gMiwKCQkJLnR5cGUgPSBK
QUlMSE9VU0VfQ0FDSEVfTDMsCgkJfSwKCX0sCgoJLnBpb19yZWdpb25zID0gewoJCVBJT19SQU5H
RSgweDJmOCwgOCksIC8qIHNlcmlhbCAyICovCgkJUElPX1JBTkdFKDB4M2Y4LCA4KSwgLyogc2Vy
aWFsIDEgKi8KCQlQSU9fUkFOR0UoMHhlMDEwLCA4KSwgLyogT1hQQ0llOTUyIHNlcmlhbCAqLwoJ
fSwKfTsK

--_008_AM0PR03MB44507C4040BE5E902027D833B68D9AM0PR03MB4450eurp_
Content-Type: text/plain; name="core5-cell.c"
Content-Description: core5-cell.c
Content-Disposition: attachment; filename="core5-cell.c"; size=1488;
	creation-date="Wed, 10 Feb 2021 11:13:53 GMT";
	modification-date="Mon, 08 Feb 2021 13:53:53 GMT"
Content-Transfer-Encoding: base64

I2luY2x1ZGUgPGphaWxob3VzZS90eXBlcy5oPgojaW5jbHVkZSA8amFpbGhvdXNlL2NlbGwtY29u
ZmlnLmg+CgpzdHJ1Y3QgewoJc3RydWN0IGphaWxob3VzZV9jZWxsX2Rlc2MgY2VsbDsKCV9fdTY0
IGNwdXNbMV07CglzdHJ1Y3QgamFpbGhvdXNlX21lbW9yeSBtZW1fcmVnaW9uc1syXTsKCXN0cnVj
dCBqYWlsaG91c2VfY2FjaGUgY2FjaGVfcmVnaW9uc1sxXTsKCXN0cnVjdCBqYWlsaG91c2VfcGlv
IHBpb19yZWdpb25zWzNdOwp9IF9fYXR0cmlidXRlX18oKHBhY2tlZCkpIGNvbmZpZyA9IHsKCS5j
ZWxsID0gewoJCS5zaWduYXR1cmUgPSBKQUlMSE9VU0VfQ0VMTF9ERVNDX1NJR05BVFVSRSwKCQku
cmV2aXNpb24gPSBKQUlMSE9VU0VfQ09ORklHX1JFVklTSU9OLAoJCS5uYW1lID0gImNvcmU1LWNl
bGwiLAoJCS5mbGFncyA9IEpBSUxIT1VTRV9DRUxMX1ZJUlRVQUxfQ09OU09MRV9QRVJNSVRURUQs
CgoJCS5jcHVfc2V0X3NpemUgPSBzaXplb2YoY29uZmlnLmNwdXMpLAoJCS5udW1fbWVtb3J5X3Jl
Z2lvbnMgPSBBUlJBWV9TSVpFKGNvbmZpZy5tZW1fcmVnaW9ucyksCgkJLm51bV9jYWNoZV9yZWdp
b25zID0gQVJSQVlfU0laRShjb25maWcuY2FjaGVfcmVnaW9ucyksCgkJLm51bV9pcnFjaGlwcyA9
IDAsCgkJLm51bV9waW9fcmVnaW9ucyA9IEFSUkFZX1NJWkUoY29uZmlnLnBpb19yZWdpb25zKSwK
CQkubnVtX3BjaV9kZXZpY2VzID0gMCwKCgkJLmNvbnNvbGUgPSB7CgkJCS50eXBlID0gSkFJTEhP
VVNFX0NPTl9UWVBFXzgyNTAsCgkJCS5mbGFncyA9IEpBSUxIT1VTRV9DT05fQUNDRVNTX1BJTywK
CQkJLmFkZHJlc3MgPSAweDNmOCwKCQl9LAoJfSwKCgkuY3B1cyA9IHsKCQkweDIwLAoJfSwKCgku
bWVtX3JlZ2lvbnMgPSB7CgkJLyogUkFNICovIHsKCQkJLnBoeXNfc3RhcnQgPSAweDU3NTMxMTgw
LAoJCQkudmlydF9zdGFydCA9IDAsCgkJCS5zaXplID0gMHg0YzRiNDAwLAoJCQkuZmxhZ3MgPSBK
QUlMSE9VU0VfTUVNX1JFQUQgfCBKQUlMSE9VU0VfTUVNX1dSSVRFIHwKCQkJCUpBSUxIT1VTRV9N
RU1fRVhFQ1VURSB8IEpBSUxIT1VTRV9NRU1fTE9BREFCTEUsCgkJfSwKCQkvKiBjb21tdW5pY2F0
aW9uIHJlZ2lvbiAqLyB7CgkJCS52aXJ0X3N0YXJ0ID0gMHg0YzRiNDAwLAoJCQkuc2l6ZSA9IDB4
MDAwMDEwMDAsCgkJCS5mbGFncyA9IEpBSUxIT1VTRV9NRU1fUkVBRCB8IEpBSUxIT1VTRV9NRU1f
V1JJVEUgfAoJCQkJSkFJTEhPVVNFX01FTV9DT01NX1JFR0lPTiwKCQl9LAoJfSwKCgkuY2FjaGVf
cmVnaW9ucyA9IHsKCQl7CgkJCS5zdGFydCA9IDAsCgkJCS5zaXplID0gMiwKCQkJLnR5cGUgPSBK
QUlMSE9VU0VfQ0FDSEVfTDMsCgkJfSwKCX0sCgoJLnBpb19yZWdpb25zID0gewoJCVBJT19SQU5H
RSgweDJmOCwgOCksIC8qIHNlcmlhbCAyICovCgkJUElPX1JBTkdFKDB4M2Y4LCA4KSwgLyogc2Vy
aWFsIDEgKi8KCQlQSU9fUkFOR0UoMHhlMDEwLCA4KSwgLyogT1hQQ0llOTUyIHNlcmlhbCAqLwoJ
fSwKfTsK

--_008_AM0PR03MB44507C4040BE5E902027D833B68D9AM0PR03MB4450eurp_
Content-Type: text/plain; name="sysconfig.c"
Content-Description: sysconfig.c
Content-Disposition: attachment; filename="sysconfig.c"; size=10989;
	creation-date="Wed, 10 Feb 2021 11:13:53 GMT";
	modification-date="Mon, 30 Nov 2020 11:10:53 GMT"
Content-Transfer-Encoding: base64

LyoKICogSmFpbGhvdXNlLCBhIExpbnV4LWJhc2VkIHBhcnRpdGlvbmluZyBoeXBlcnZpc29yCiAq
CiAqIENvcHlyaWdodCAoYykgU2llbWVucyBBRywgMjAxNC0yMDE3CiAqCiAqIFRoaXMgd29yayBp
cyBsaWNlbnNlZCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHUEwsIHZlcnNpb24gMi4gIFNl
ZQogKiB0aGUgQ09QWUlORyBmaWxlIGluIHRoZSB0b3AtbGV2ZWwgZGlyZWN0b3J5LgogKgogKiBB
bHRlcm5hdGl2ZWx5LCB5b3UgY2FuIHVzZSBvciByZWRpc3RyaWJ1dGUgdGhpcyBmaWxlIHVuZGVy
IHRoZSBmb2xsb3dpbmcKICogQlNEIGxpY2Vuc2U6CiAqCiAqIFJlZGlzdHJpYnV0aW9uIGFuZCB1
c2UgaW4gc291cmNlIGFuZCBiaW5hcnkgZm9ybXMsIHdpdGggb3Igd2l0aG91dAogKiBtb2RpZmlj
YXRpb24sIGFyZSBwZXJtaXR0ZWQgcHJvdmlkZWQgdGhhdCB0aGUgZm9sbG93aW5nIGNvbmRpdGlv
bnMKICogYXJlIG1ldDoKICoKICogMS4gUmVkaXN0cmlidXRpb25zIG9mIHNvdXJjZSBjb2RlIG11
c3QgcmV0YWluIHRoZSBhYm92ZSBjb3B5cmlnaHQKICogICAgbm90aWNlLCB0aGlzIGxpc3Qgb2Yg
Y29uZGl0aW9ucyBhbmQgdGhlIGZvbGxvd2luZyBkaXNjbGFpbWVyLgogKgogKiAyLiBSZWRpc3Ry
aWJ1dGlvbnMgaW4gYmluYXJ5IGZvcm0gbXVzdCByZXByb2R1Y2UgdGhlIGFib3ZlIGNvcHlyaWdo
dAogKiAgICBub3RpY2UsIHRoaXMgbGlzdCBvZiBjb25kaXRpb25zIGFuZCB0aGUgZm9sbG93aW5n
IGRpc2NsYWltZXIgaW4gdGhlCiAqICAgIGRvY3VtZW50YXRpb24gYW5kL29yIG90aGVyIG1hdGVy
aWFscyBwcm92aWRlZCB3aXRoIHRoZSBkaXN0cmlidXRpb24uCiAqCiAqIFRISVMgU09GVFdBUkUg
SVMgUFJPVklERUQgQlkgVEhFIENPUFlSSUdIVCBIT0xERVJTIEFORCBDT05UUklCVVRPUlMgIkFT
IElTIgogKiBBTkQgQU5ZIEVYUFJFU1MgT1IgSU1QTElFRCBXQVJSQU5USUVTLCBJTkNMVURJTkcs
IEJVVCBOT1QgTElNSVRFRCBUTywgVEhFCiAqIElNUExJRUQgV0FSUkFOVElFUyBPRiBNRVJDSEFO
VEFCSUxJVFkgQU5EIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFCiAqIEFSRSBESVND
TEFJTUVELiBJTiBOTyBFVkVOVCBTSEFMTCBUSEUgQ09QWVJJR0hUIEhPTERFUiBPUiBDT05UUklC
VVRPUlMgQkUKICogTElBQkxFIEZPUiBBTlkgRElSRUNULCBJTkRJUkVDVCwgSU5DSURFTlRBTCwg
U1BFQ0lBTCwgRVhFTVBMQVJZLCBPUgogKiBDT05TRVFVRU5USUFMIERBTUFHRVMgKElOQ0xVRElO
RywgQlVUIE5PVCBMSU1JVEVEIFRPLCBQUk9DVVJFTUVOVCBPRgogKiBTVUJTVElUVVRFIEdPT0RT
IE9SIFNFUlZJQ0VTOyBMT1NTIE9GIFVTRSwgREFUQSwgT1IgUFJPRklUUzsgT1IgQlVTSU5FU1MK
ICogSU5URVJSVVBUSU9OKSBIT1dFVkVSIENBVVNFRCBBTkQgT04gQU5ZIFRIRU9SWSBPRiBMSUFC
SUxJVFksIFdIRVRIRVIgSU4KICogQ09OVFJBQ1QsIFNUUklDVCBMSUFCSUxJVFksIE9SIFRPUlQg
KElOQ0xVRElORyBORUdMSUdFTkNFIE9SIE9USEVSV0lTRSkKICogQVJJU0lORyBJTiBBTlkgV0FZ
IE9VVCBPRiBUSEUgVVNFIE9GIFRISVMgU09GVFdBUkUsIEVWRU4gSUYgQURWSVNFRCBPRgogKiBU
SEUgUE9TU0lCSUxJVFkgT0YgU1VDSCBEQU1BR0UuCiAqCiAqIENvbmZpZ3VyYXRpb24gZm9yIFFF
TVUgU3RhbmRhcmQgUEMgKFEzNSArIElDSDksIDIwMDkpCiAqIGNyZWF0ZWQgd2l0aCAnL3Vzci9s
b2NhbC9saWJleGVjL2phaWxob3VzZS9qYWlsaG91c2UgY29uZmlnIGNyZWF0ZSAtciBkYXRhIHN5
c2NvbmZpZy5jJwogKgogKiBOT1RFOiBUaGlzIGNvbmZpZyBleHBlY3RzIHRoZSBmb2xsb3dpbmcg
dG8gYmUgYXBwZW5kZWQgdG8geW91ciBrZXJuZWwgY21kbGluZQogKiAgICAgICAibWVtbWFwPTB4
NTIwMDAwMCQweDNhMDAwMDAwIgogKi8KCiNpbmNsdWRlIDxqYWlsaG91c2UvdHlwZXMuaD4KI2lu
Y2x1ZGUgPGphaWxob3VzZS9jZWxsLWNvbmZpZy5oPgoKc3RydWN0IHsKCXN0cnVjdCBqYWlsaG91
c2Vfc3lzdGVtIGhlYWRlcjsKCV9fdTY0IGNwdXNbMV07CglzdHJ1Y3QgamFpbGhvdXNlX21lbW9y
eSBtZW1fcmVnaW9uc1sxM107CglzdHJ1Y3QgamFpbGhvdXNlX2lycWNoaXAgaXJxY2hpcHNbMV07
CglzdHJ1Y3QgamFpbGhvdXNlX3BpbyBwaW9fcmVnaW9uc1s5XTsKCXN0cnVjdCBqYWlsaG91c2Vf
cGNpX2RldmljZSBwY2lfZGV2aWNlc1s3XTsKCXN0cnVjdCBqYWlsaG91c2VfcGNpX2NhcGFiaWxp
dHkgcGNpX2NhcHNbM107Cn0gX19hdHRyaWJ1dGVfXygocGFja2VkKSkgY29uZmlnID0gewoJLmhl
YWRlciA9IHsKCQkuc2lnbmF0dXJlID0gSkFJTEhPVVNFX1NZU1RFTV9TSUdOQVRVUkUsCgkJLnJl
dmlzaW9uID0gSkFJTEhPVVNFX0NPTkZJR19SRVZJU0lPTiwKCQkuZmxhZ3MgPSBKQUlMSE9VU0Vf
U1lTX1ZJUlRVQUxfREVCVUdfQ09OU09MRSwKCQkuaHlwZXJ2aXNvcl9tZW1vcnkgPSB7CgkJCS5w
aHlzX3N0YXJ0ID0gMHgzYTAwMDAwMCwKCQkJLnNpemUgPSAweDYwMDAwMCwKCQl9LAoJCS5kZWJ1
Z19jb25zb2xlID0gewoJCQkuYWRkcmVzcyA9IDB4M2Y4LAoJCQkudHlwZSA9IEpBSUxIT1VTRV9D
T05fVFlQRV84MjUwLAoJCQkuZmxhZ3MgPSBKQUlMSE9VU0VfQ09OX0FDQ0VTU19QSU8gfAoJCQkJ
IEpBSUxIT1VTRV9DT05fUkVHRElTVF8xLAoJCX0sCgkJLnBsYXRmb3JtX2luZm8gPSB7CgkJCS5w
Y2lfbW1jb25maWdfYmFzZSA9IDB4YjAwMDAwMDAsCgkJCS5wY2lfbW1jb25maWdfZW5kX2J1cyA9
IDB4ZmYsCgkJCS5pb21tdV91bml0cyA9IHsKCQkJCXsKCQkJCQkudHlwZSA9IEpBSUxIT1VTRV9J
T01NVV9JTlRFTCwKCQkJCQkuYmFzZSA9IDB4ZmVkOTAwMDAsCgkJCQkJLnNpemUgPSAweDEwMDAs
CgkJCQl9LAoJCQl9LAoJCQkueDg2ID0gewoJCQkJLnBtX3RpbWVyX2FkZHJlc3MgPSAweDYwOCwK
CQkJCS52dGRfaW50ZXJydXB0X2xpbWl0ID0gMTI4LAoJCQl9LAoJCX0sCgkJLnJvb3RfY2VsbCA9
IHsKCQkJLm5hbWUgPSAiUm9vdENlbGwiLAoJCQkuY3B1X3NldF9zaXplID0gc2l6ZW9mKGNvbmZp
Zy5jcHVzKSwKCQkJLm51bV9tZW1vcnlfcmVnaW9ucyA9IEFSUkFZX1NJWkUoY29uZmlnLm1lbV9y
ZWdpb25zKSwKCQkJLm51bV9pcnFjaGlwcyA9IEFSUkFZX1NJWkUoY29uZmlnLmlycWNoaXBzKSwK
CQkJLm51bV9waW9fcmVnaW9ucyA9IEFSUkFZX1NJWkUoY29uZmlnLnBpb19yZWdpb25zKSwKCQkJ
Lm51bV9wY2lfZGV2aWNlcyA9IEFSUkFZX1NJWkUoY29uZmlnLnBjaV9kZXZpY2VzKSwKCQkJLm51
bV9wY2lfY2FwcyA9IEFSUkFZX1NJWkUoY29uZmlnLnBjaV9jYXBzKSwKCQl9LAoJfSwKCgkuY3B1
cyA9IHsKCQkweDAwMDAwMDAwMDAwMDAwM2YsCgl9LAoKCS5tZW1fcmVnaW9ucyA9IHsKCQkvKiBN
ZW1SZWdpb246IDAwMDAwMDAwLTAwMDlmYmZmIDogU3lzdGVtIFJBTSAqLwoJCXsKCQkJLnBoeXNf
c3RhcnQgPSAweDAsCgkJCS52aXJ0X3N0YXJ0ID0gMHgwLAoJCQkuc2l6ZSA9IDB4YTAwMDAsCgkJ
CS5mbGFncyA9IEpBSUxIT1VTRV9NRU1fUkVBRCB8IEpBSUxIT1VTRV9NRU1fV1JJVEUgfAoJCQkJ
SkFJTEhPVVNFX01FTV9FWEVDVVRFIHwgSkFJTEhPVVNFX01FTV9ETUEsCgkJfSwKCQkvKiBNZW1S
ZWdpb246IDAwMGYwMDAwLTAwMGZmZmZmIDogU3lzdGVtIFJPTSAqLwoJCXsKCQkJLnBoeXNfc3Rh
cnQgPSAweGYwMDAwLAoJCQkudmlydF9zdGFydCA9IDB4ZjAwMDAsCgkJCS5zaXplID0gMHgxMDAw
MCwKCQkJLmZsYWdzID0gSkFJTEhPVVNFX01FTV9SRUFEIHwgSkFJTEhPVVNFX01FTV9XUklURSwK
CQl9LAoJCS8qIE1lbVJlZ2lvbjogMDAxMDAwMDAtMzlmZmZmZmYgOiBTeXN0ZW0gUkFNICovCgkJ
ewoJCQkucGh5c19zdGFydCA9IDB4MTAwMDAwLAoJCQkudmlydF9zdGFydCA9IDB4MTAwMDAwLAoJ
CQkuc2l6ZSA9IDB4MzlmMDAwMDAsCgkJCS5mbGFncyA9IEpBSUxIT1VTRV9NRU1fUkVBRCB8IEpB
SUxIT1VTRV9NRU1fV1JJVEUgfAoJCQkJSkFJTEhPVVNFX01FTV9FWEVDVVRFIHwgSkFJTEhPVVNF
X01FTV9ETUEsCgkJfSwKCQkvKiBNZW1SZWdpb246IDNmMjAwMDAwLTdmZmRlZmZmIDogU3lzdGVt
IFJBTSAqLwoJCXsKCQkJLnBoeXNfc3RhcnQgPSAweDNmMjAwMDAwLAoJCQkudmlydF9zdGFydCA9
IDB4M2YyMDAwMDAsCgkJCS5zaXplID0gMHg0MGRkZjAwMCwKCQkJLmZsYWdzID0gSkFJTEhPVVNF
X01FTV9SRUFEIHwgSkFJTEhPVVNFX01FTV9XUklURSB8CgkJCQlKQUlMSE9VU0VfTUVNX0VYRUNV
VEUgfCBKQUlMSE9VU0VfTUVNX0RNQSwKCQl9LAoJCS8qIE1lbVJlZ2lvbjogZmQwMDAwMDAtZmRm
ZmZmZmYgOiAwMDAwOjAwOjAxLjAgKi8KCQl7CgkJCS5waHlzX3N0YXJ0ID0gMHhmZDAwMDAwMCwK
CQkJLnZpcnRfc3RhcnQgPSAweGZkMDAwMDAwLAoJCQkuc2l6ZSA9IDB4MTAwMDAwMCwKCQkJLmZs
YWdzID0gSkFJTEhPVVNFX01FTV9SRUFEIHwgSkFJTEhPVVNFX01FTV9XUklURSwKCQl9LAoJCS8q
IE1lbVJlZ2lvbjogZmViODAwMDAtZmViYmZmZmYgOiAwMDAwOjAwOjAyLjAgKi8KCQl7CgkJCS5w
aHlzX3N0YXJ0ID0gMHhmZWI4MDAwMCwKCQkJLnZpcnRfc3RhcnQgPSAweGZlYjgwMDAwLAoJCQku
c2l6ZSA9IDB4NDAwMDAsCgkJCS5mbGFncyA9IEpBSUxIT1VTRV9NRU1fUkVBRCB8IEpBSUxIT1VT
RV9NRU1fV1JJVEUsCgkJfSwKCQkvKiBNZW1SZWdpb246IGZlYmMwMDAwLWZlYmRmZmZmIDogZTEw
MDAgKi8KCQl7CgkJCS5waHlzX3N0YXJ0ID0gMHhmZWJjMDAwMCwKCQkJLnZpcnRfc3RhcnQgPSAw
eGZlYmMwMDAwLAoJCQkuc2l6ZSA9IDB4MjAwMDAsCgkJCS5mbGFncyA9IEpBSUxIT1VTRV9NRU1f
UkVBRCB8IEpBSUxIT1VTRV9NRU1fV1JJVEUsCgkJfSwKCQkvKiBNZW1SZWdpb246IGZlYmYwMDAw
LWZlYmYzZmZmIDogMDAwMDowMDoxYi4wICovCgkJewoJCQkucGh5c19zdGFydCA9IDB4ZmViZjAw
MDAsCgkJCS52aXJ0X3N0YXJ0ID0gMHhmZWJmMDAwMCwKCQkJLnNpemUgPSAweDQwMDAsCgkJCS5m
bGFncyA9IEpBSUxIT1VTRV9NRU1fUkVBRCB8IEpBSUxIT1VTRV9NRU1fV1JJVEUsCgkJfSwKCQkv
KiBNZW1SZWdpb246IGZlYmY0MDAwLWZlYmY0ZmZmIDogMDAwMDowMDowMS4wICovCgkJewoJCQku
cGh5c19zdGFydCA9IDB4ZmViZjQwMDAsCgkJCS52aXJ0X3N0YXJ0ID0gMHhmZWJmNDAwMCwKCQkJ
LnNpemUgPSAweDEwMDAsCgkJCS5mbGFncyA9IEpBSUxIT1VTRV9NRU1fUkVBRCB8IEpBSUxIT1VT
RV9NRU1fV1JJVEUsCgkJfSwKCQkvKiBNZW1SZWdpb246IGZlYmY1MDAwLWZlYmY1ZmZmIDogMDAw
MDowMDoxZi4yICovCgkJewoJCQkucGh5c19zdGFydCA9IDB4ZmViZjUwMDAsCgkJCS52aXJ0X3N0
YXJ0ID0gMHhmZWJmNTAwMCwKCQkJLnNpemUgPSAweDEwMDAsCgkJCS5mbGFncyA9IEpBSUxIT1VT
RV9NRU1fUkVBRCB8IEpBSUxIT1VTRV9NRU1fV1JJVEUsCgkJfSwKCQkvKiBNZW1SZWdpb246IGZl
ZDAwMDAwLWZlZDAwM2ZmIDogUE5QMDEwMzowMCAqLwoJCXsKCQkJLnBoeXNfc3RhcnQgPSAweGZl
ZDAwMDAwLAoJCQkudmlydF9zdGFydCA9IDB4ZmVkMDAwMDAsCgkJCS5zaXplID0gMHgxMDAwLAoJ
CQkuZmxhZ3MgPSBKQUlMSE9VU0VfTUVNX1JFQUQgfCBKQUlMSE9VU0VfTUVNX1dSSVRFLAoJCX0s
CgkJLyogTWVtUmVnaW9uOiAwMDBjMDAwMC0wMDBkZmZmZiA6IFJPTXMgKi8KCQl7CgkJCS5waHlz
X3N0YXJ0ID0gMHhjMDAwMCwKCQkJLnZpcnRfc3RhcnQgPSAweGMwMDAwLAoJCQkuc2l6ZSA9IDB4
MjAwMDAsCgkJCS5mbGFncyA9IEpBSUxIT1VTRV9NRU1fUkVBRCB8IEpBSUxIT1VTRV9NRU1fV1JJ
VEUsCgkJfSwKCQkvKiBNZW1SZWdpb246IDNhNjAwMDAwLTNmMWZmZmZmIDogSkFJTEhPVVNFIElu
bWF0ZSBNZW1vcnkgKi8KCQl7CgkJCS5waHlzX3N0YXJ0ID0gMHgzYTYwMDAwMCwKCQkJLnZpcnRf
c3RhcnQgPSAweDNhNjAwMDAwLAoJCQkuc2l6ZSA9IDB4NGMwMDAwMCwKCQkJLmZsYWdzID0gSkFJ
TEhPVVNFX01FTV9SRUFEIHwgSkFJTEhPVVNFX01FTV9XUklURSwKCQl9LAoJfSwKCgkuaXJxY2hp
cHMgPSB7CgkJLyogSU9BUElDIDAsIEdTSSBiYXNlIDAgKi8KCQl7CgkJCS5hZGRyZXNzID0gMHhm
ZWMwMDAwMCwKCQkJLmlkID0gMHhmZjAwLAoJCQkucGluX2JpdG1hcCA9IHsKCQkJCTB4ZmZmZmZm
ZmYsIDB4ZmZmZmZmZmYsIDB4ZmZmZmZmZmYsIDB4ZmZmZmZmZmYKCQkJfSwKCQl9LAoJfSwKCgku
cGlvX3JlZ2lvbnMgPSB7CgkJLyogUG9ydCBJL086IDAwMDAtMDAxZiA6IGRtYTEgKi8KCQkvKiBQ
SU9fUkFOR0UoMHgwLCAweDIwKSwgKi8KCQkvKiBQb3J0IEkvTzogMDAyMC0wMDIxIDogcGljMSAq
LwoJCS8qIFBJT19SQU5HRSgweDIwLCAweDIpLCAqLwoJCS8qIFBvcnQgSS9POiAwMDQwLTAwNDMg
OiB0aW1lcjAgKi8KCQlQSU9fUkFOR0UoMHg0MCwgMHg0KSwKCQkvKiBQb3J0IEkvTzogMDA1MC0w
MDUzIDogdGltZXIxICovCgkJLyogUElPX1JBTkdFKDB4NTAsIDB4NCksICovCgkJLyogUG9ydCBJ
L086IDAwNjAtMDA2MCA6IGtleWJvYXJkICovCgkJUElPX1JBTkdFKDB4NjAsIDB4MSksCgkJLyog
UG9ydCBJL086IDAwNjQtMDA2NCA6IGtleWJvYXJkICovCgkJUElPX1JBTkdFKDB4NjQsIDB4MSks
CgkJLyogUG9ydCBJL086IDAwNzAtMDA3MSA6IHJ0YzAgKi8KCQlQSU9fUkFOR0UoMHg3MCwgMHgy
KSwKCQkvKiBQb3J0IEkvTzogMDA4MC0wMDhmIDogZG1hIHBhZ2UgcmVnICovCgkJLyogUElPX1JB
TkdFKDB4ODAsIDB4MTApLCAqLwoJCS8qIFBvcnQgSS9POiAwMGEwLTAwYTEgOiBwaWMyICovCgkJ
LyogUElPX1JBTkdFKDB4YTAsIDB4MiksICovCgkJLyogUG9ydCBJL086IDAwYzAtMDBkZiA6IGRt
YTIgKi8KCQkvKiBQSU9fUkFOR0UoMHhjMCwgMHgyMCksICovCgkJLyogUG9ydCBJL086IDAwZjAt
MDBmZiA6IGZwdSAqLwoJCS8qIFBJT19SQU5HRSgweGYwLCAweDEwKSwgKi8KCQkvKiBQb3J0IEkv
TzogMDJmOC0wMmZmIDogc2VyaWFsICovCgkJUElPX1JBTkdFKDB4MmY4LCAweDgpLAoJCS8qIFBv
cnQgSS9POiAwM2MwLTAzZGYgOiB2Z2ErICovCgkJUElPX1JBTkdFKDB4M2MwLCAweDIwKSwKCQkv
KiBQb3J0IEkvTzogMDNlOC0wM2VmIDogc2VyaWFsICovCgkJLyogUElPX1JBTkdFKDB4M2U4LCAw
eDgpLCAqLwoJCS8qIFBvcnQgSS9POiAwM2Y4LTAzZmYgOiBzZXJpYWwgKi8KCQlQSU9fUkFOR0Uo
MHgzZjgsIDB4OCksCgkJLyogUG9ydCBJL086IDA1MTAtMDUxYiA6IFFFTVUwMDAyOjAwICovCgkJ
LyogUElPX1JBTkdFKDB4NTEwLCAweGMpLCAqLwoJCS8qIFBvcnQgSS9POiAwNjAwLTA2MDMgOiBB
Q1BJIFBNMWFfRVZUX0JMSyAqLwoJCS8qIFBJT19SQU5HRSgweDYwMCwgMHg0KSwgKi8KCQkvKiBQ
b3J0IEkvTzogMDYwNC0wNjA1IDogQUNQSSBQTTFhX0NOVF9CTEsgKi8KCQkvKiBQSU9fUkFOR0Uo
MHg2MDQsIDB4MiksICovCgkJLyogUG9ydCBJL086IDA2MDgtMDYwYiA6IEFDUEkgUE1fVE1SICov
CgkJLyogUElPX1JBTkdFKDB4NjA4LCAweDQpLCAqLwoJCS8qIFBvcnQgSS9POiAwNjIwLTA2MmYg
OiBBQ1BJIEdQRTBfQkxLICovCgkJLyogUElPX1JBTkdFKDB4NjIwLCAweDEwKSwgKi8KCQkvKiBQ
b3J0IEkvTzogMDcwMC0wNzNmIDogMDAwMDowMDoxZi4zICovCgkJLyogUElPX1JBTkdFKDB4NzAw
LCAweDQwKSwgKi8KCQkvKiBQb3J0IEkvTzogYzAwMC1jMDNmIDogMDAwMDowMDowMi4wICovCgkJ
UElPX1JBTkdFKDB4YzAwMCwgMHg0MCksCgkJLyogUG9ydCBJL086IGMwODAtYzA5ZiA6IDAwMDA6
MDA6MWYuMiAqLwoJCVBJT19SQU5HRSgweGMwODAsIDB4MjApLAoJfSwKCgkucGNpX2RldmljZXMg
PSB7CgkJLyogUENJRGV2aWNlOiAwMDowMC4wICovCgkJewoJCQkudHlwZSA9IEpBSUxIT1VTRV9Q
Q0lfVFlQRV9ERVZJQ0UsCgkJCS5pb21tdSA9IDAsCgkJCS5kb21haW4gPSAweDAsCgkJCS5iZGYg
PSAweDAsCgkJCS5iYXJfbWFzayA9IHsKCQkJCTB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsIDB4MDAw
MDAwMDAsCgkJCQkweDAwMDAwMDAwLCAweDAwMDAwMDAwLCAweDAwMDAwMDAwLAoJCQl9LAoJCQku
Y2Fwc19zdGFydCA9IDAsCgkJCS5udW1fY2FwcyA9IDAsCgkJCS5udW1fbXNpX3ZlY3RvcnMgPSAw
LAoJCQkubXNpXzY0Yml0cyA9IDAsCgkJCS5tc2lfbWFza2FibGUgPSAwLAoJCQkubnVtX21zaXhf
dmVjdG9ycyA9IDAsCgkJCS5tc2l4X3JlZ2lvbl9zaXplID0gMHgwLAoJCQkubXNpeF9hZGRyZXNz
ID0gMHgwLAoJCX0sCgkJLyogUENJRGV2aWNlOiAwMDowMS4wICovCgkJewoJCQkudHlwZSA9IEpB
SUxIT1VTRV9QQ0lfVFlQRV9ERVZJQ0UsCgkJCS5pb21tdSA9IDAsCgkJCS5kb21haW4gPSAweDAs
CgkJCS5iZGYgPSAweDgsCgkJCS5iYXJfbWFzayA9IHsKCQkJCTB4ZmYwMDAwMDAsIDB4MDAwMDAw
MDAsIDB4ZmZmZmYwMDAsCgkJCQkweDAwMDAwMDAwLCAweDAwMDAwMDAwLCAweDAwMDAwMDAwLAoJ
CQl9LAoJCQkuY2Fwc19zdGFydCA9IDAsCgkJCS5udW1fY2FwcyA9IDAsCgkJCS5udW1fbXNpX3Zl
Y3RvcnMgPSAwLAoJCQkubXNpXzY0Yml0cyA9IDAsCgkJCS5tc2lfbWFza2FibGUgPSAwLAoJCQku
bnVtX21zaXhfdmVjdG9ycyA9IDAsCgkJCS5tc2l4X3JlZ2lvbl9zaXplID0gMHgwLAoJCQkubXNp
eF9hZGRyZXNzID0gMHgwLAoJCX0sCgkJLyogUENJRGV2aWNlOiAwMDowMi4wICovCgkJewoJCQku
dHlwZSA9IEpBSUxIT1VTRV9QQ0lfVFlQRV9ERVZJQ0UsCgkJCS5pb21tdSA9IDAsCgkJCS5kb21h
aW4gPSAweDAsCgkJCS5iZGYgPSAweDEwLAoJCQkuYmFyX21hc2sgPSB7CgkJCQkweGZmZmUwMDAw
LCAweGZmZmZmZmMwLCAweDAwMDAwMDAwLAoJCQkJMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwgMHgw
MDAwMDAwMCwKCQkJfSwKCQkJLmNhcHNfc3RhcnQgPSAwLAoJCQkubnVtX2NhcHMgPSAwLAoJCQku
bnVtX21zaV92ZWN0b3JzID0gMCwKCQkJLm1zaV82NGJpdHMgPSAwLAoJCQkubXNpX21hc2thYmxl
ID0gMCwKCQkJLm51bV9tc2l4X3ZlY3RvcnMgPSAwLAoJCQkubXNpeF9yZWdpb25fc2l6ZSA9IDB4
MCwKCQkJLm1zaXhfYWRkcmVzcyA9IDB4MCwKCQl9LAoJCS8qIFBDSURldmljZTogMDA6MWIuMCAq
LwoJCXsKCQkJLnR5cGUgPSBKQUlMSE9VU0VfUENJX1RZUEVfREVWSUNFLAoJCQkuaW9tbXUgPSAw
LAoJCQkuZG9tYWluID0gMHgwLAoJCQkuYmRmID0gMHhkOCwKCQkJLmJhcl9tYXNrID0gewoJCQkJ
MHhmZmZmYzAwMCwgMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwKCQkJCTB4MDAwMDAwMDAsIDB4MDAw
MDAwMDAsIDB4MDAwMDAwMDAsCgkJCX0sCgkJCS5jYXBzX3N0YXJ0ID0gMCwKCQkJLm51bV9jYXBz
ID0gMSwKCQkJLm51bV9tc2lfdmVjdG9ycyA9IDEsCgkJCS5tc2lfNjRiaXRzID0gMSwKCQkJLm1z
aV9tYXNrYWJsZSA9IDAsCgkJCS5udW1fbXNpeF92ZWN0b3JzID0gMCwKCQkJLm1zaXhfcmVnaW9u
X3NpemUgPSAweDAsCgkJCS5tc2l4X2FkZHJlc3MgPSAweDAsCgkJfSwKCQkvKiBQQ0lEZXZpY2U6
IDAwOjFmLjAgKi8KCQl7CgkJCS50eXBlID0gSkFJTEhPVVNFX1BDSV9UWVBFX0RFVklDRSwKCQkJ
LmlvbW11ID0gMCwKCQkJLmRvbWFpbiA9IDB4MCwKCQkJLmJkZiA9IDB4ZjgsCgkJCS5iYXJfbWFz
ayA9IHsKCQkJCTB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsCgkJCQkweDAwMDAw
MDAwLCAweDAwMDAwMDAwLCAweDAwMDAwMDAwLAoJCQl9LAoJCQkuY2Fwc19zdGFydCA9IDAsCgkJ
CS5udW1fY2FwcyA9IDAsCgkJCS5udW1fbXNpX3ZlY3RvcnMgPSAwLAoJCQkubXNpXzY0Yml0cyA9
IDAsCgkJCS5tc2lfbWFza2FibGUgPSAwLAoJCQkubnVtX21zaXhfdmVjdG9ycyA9IDAsCgkJCS5t
c2l4X3JlZ2lvbl9zaXplID0gMHgwLAoJCQkubXNpeF9hZGRyZXNzID0gMHgwLAoJCX0sCgkJLyog
UENJRGV2aWNlOiAwMDoxZi4yICovCgkJewoJCQkudHlwZSA9IEpBSUxIT1VTRV9QQ0lfVFlQRV9E
RVZJQ0UsCgkJCS5pb21tdSA9IDAsCgkJCS5kb21haW4gPSAweDAsCgkJCS5iZGYgPSAweGZhLAoJ
CQkuYmFyX21hc2sgPSB7CgkJCQkweDAwMDAwMDAwLCAweDAwMDAwMDAwLCAweDAwMDAwMDAwLAoJ
CQkJMHgwMDAwMDAwMCwgMHhmZmZmZmZlMCwgMHhmZmZmZjAwMCwKCQkJfSwKCQkJLmNhcHNfc3Rh
cnQgPSAxLAoJCQkubnVtX2NhcHMgPSAyLAoJCQkubnVtX21zaV92ZWN0b3JzID0gMSwKCQkJLm1z
aV82NGJpdHMgPSAxLAoJCQkubXNpX21hc2thYmxlID0gMCwKCQkJLm51bV9tc2l4X3ZlY3RvcnMg
PSAwLAoJCQkubXNpeF9yZWdpb25fc2l6ZSA9IDB4MCwKCQkJLm1zaXhfYWRkcmVzcyA9IDB4MCwK
CQl9LAoJCS8qIFBDSURldmljZTogMDA6MWYuMyAqLwoJCXsKCQkJLnR5cGUgPSBKQUlMSE9VU0Vf
UENJX1RZUEVfREVWSUNFLAoJCQkuaW9tbXUgPSAwLAoJCQkuZG9tYWluID0gMHgwLAoJCQkuYmRm
ID0gMHhmYiwKCQkJLmJhcl9tYXNrID0gewoJCQkJMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwgMHgw
MDAwMDAwMCwKCQkJCTB4MDAwMDAwMDAsIDB4ZmZmZmZmYzAsIDB4MDAwMDAwMDAsCgkJCX0sCgkJ
CS5jYXBzX3N0YXJ0ID0gMCwKCQkJLm51bV9jYXBzID0gMCwKCQkJLm51bV9tc2lfdmVjdG9ycyA9
IDAsCgkJCS5tc2lfNjRiaXRzID0gMCwKCQkJLm1zaV9tYXNrYWJsZSA9IDAsCgkJCS5udW1fbXNp
eF92ZWN0b3JzID0gMCwKCQkJLm1zaXhfcmVnaW9uX3NpemUgPSAweDAsCgkJCS5tc2l4X2FkZHJl
c3MgPSAweDAsCgkJfSwKCX0sCgoJLnBjaV9jYXBzID0gewoJCS8qIFBDSURldmljZTogMDA6MWIu
MCAqLwoJCXsKCQkJLmlkID0gUENJX0NBUF9JRF9NU0ksCgkJCS5zdGFydCA9IDB4NjAsCgkJCS5s
ZW4gPSAweGUsCgkJCS5mbGFncyA9IEpBSUxIT1VTRV9QQ0lDQVBTX1dSSVRFLAoJCX0sCgkJLyog
UENJRGV2aWNlOiAwMDoxZi4yICovCgkJewoJCQkuaWQgPSBQQ0lfQ0FQX0lEX01TSSwKCQkJLnN0
YXJ0ID0gMHg4MCwKCQkJLmxlbiA9IDB4ZSwKCQkJLmZsYWdzID0gSkFJTEhPVVNFX1BDSUNBUFNf
V1JJVEUsCgkJfSwKCQl7CgkJCS5pZCA9IFBDSV9DQVBfSURfU0FUQSwKCQkJLnN0YXJ0ID0gMHhh
OCwKCQkJLmxlbiA9IDB4MiwKCQkJLmZsYWdzID0gMCwKCQl9LAoJfSwKfTsK

--_008_AM0PR03MB44507C4040BE5E902027D833B68D9AM0PR03MB4450eurp_--
