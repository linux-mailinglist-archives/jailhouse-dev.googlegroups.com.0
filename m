Return-Path: <jailhouse-dev+bncBCJN5Z66VINBBVUJTGAQMGQE5MEPOCI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23f.google.com (mail-lj1-x23f.google.com [IPv6:2a00:1450:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB74319B9A
	for <lists+jailhouse-dev@lfdr.de>; Fri, 12 Feb 2021 10:05:27 +0100 (CET)
Received: by mail-lj1-x23f.google.com with SMTP id v6sf5252595lji.9
        for <lists+jailhouse-dev@lfdr.de>; Fri, 12 Feb 2021 01:05:27 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1613120727; cv=pass;
        d=google.com; s=arc-20160816;
        b=GrZ0UopYNMKvI95njnJrjKM/xEePt6PXztTlSS4HUdgNHqYCHwDUpM3nzuVwUy9ES1
         6hg+xhmy4ksTBbm15T40b28M+miabBOJUbmAG4qLG6z0JaYD6TroOp0hgWNItJIN25Ic
         IDW7cqzqBNWEmMpgplSThTptzNb6fEcJtxc/K5fg5awO5V0NlU/3sqV+6Py0oWXevWXv
         oq0/UJqV3sxBLJumA8QW58Uq6IKbJUQMf39QBeSmsPmz5eGm1Vcb+c8dkIxzp3Hm/KTA
         dneywEnHSJ9m2k12hu4R1O4rg2wTb1vgqelY54MhXiACWCusjbw/FGdIZT1t5HYalWIr
         EAnQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from:sender:dkim-signature;
        bh=ewS1R3o+gnlAfmc4VcTDaBGW+hzJkPeuLnmripqrnJM=;
        b=o5stAypxJ1O8ouaoTVhdyZdMCibJ+yx4VtzKFdz6N/99/aMRhIZogQXv76Wsygmxi5
         WazSpYIN/q1oRHucn1zKl4/Em6oVsK76BQVRP3pBnzLc29Z/mvM0SXRMmdctPxbV0n+D
         FaVox7L0yYyzSdt6wXLHd2GtA6HL0hhHZHT9mnWXcexwrQiH9O4kqb9Zasv/0g3J4wKs
         NgcVFJtJrF96TAbe247U6LPm1oDQ6hrs2lDxqppibmaz3ACdPo1Fnm1qdvxStBzSqIbA
         wKBGLiD0FjevM9xCkpG/W+pJWHUoFliCHeuVkZUgINjJFtpVy7DSuO1E19qmgKUfG4lZ
         NNQw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@ikerlan.es header.s=selector2 header.b=y6yWN+U6;
       arc=pass (i=1 spf=pass spfdomain=ikerlan.es dkim=pass dkdomain=ikerlan.es dmarc=pass fromdomain=ikerlan.es);
       spf=pass (google.com: domain of msainz@ikerlan.es designates 40.107.4.110 as permitted sender) smtp.mailfrom=Msainz@ikerlan.es;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ikerlan.es
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ewS1R3o+gnlAfmc4VcTDaBGW+hzJkPeuLnmripqrnJM=;
        b=ny3Tsiifj5O1KVUFsLlZdUftRztqgFKifJ2PB711ySlPwNr5ckqih+IbZVuovhL0Jb
         TCeYoGc26g7DwsOeBJNqAmZxxSVur2Qhx6jgtk126uH2GaYpmIm3bOqCoTDhFY6mUiqO
         9a/TP8YFjrxpeSfsatUvQqruh1Bi6u8LSr4MBhlelUBb/Op/mRbPSuUPVditFHAhcYFg
         7iLm8qILwq15bHyRKen/DneukUVobWy6B8J6NpNSVGJrKely/2+Gntq9LHx6UvDsYmuH
         2/klniRf7qqsF1+yAhooTl9DCqs7Nv1AQaVGDVlawH/qMrYsUHbXaAhlHorzt5ORKW73
         sztg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:content-transfer-encoding:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=ewS1R3o+gnlAfmc4VcTDaBGW+hzJkPeuLnmripqrnJM=;
        b=FpP9tiWUv85FJVPYlA/j50OzbsWPsOSynOU7fv3BQYvXnWxjYgj5zLUW4qaT3Habot
         3JaUKSZbHvqFStS8hvDKjqXpIuPxQAzVfzeTsLIuJ4Nngw+SvcwgQ/mB1Wn7wkDKNa7Q
         m2TldOP41r7sfWVhoKI4QEVmpD525aZwJA9NKgLzN3/A2skYraZbNU/BVmjfh2AhUKG7
         caF+G1QwFjVSvHRx1daWqWEzXX0ys7iNgWVhpsjesfLm8xgUtSMdbYt5eD3zCnqQHvcV
         ikkz37DGIQxQky0QUmLLdurb/uCzjwLV9SgqEa1cMLZOcvYfMZfDDHSpsdUk0I73++KK
         wNmw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532/LR6hMcQZxCx1RUTXC9Kdc1bbOqUEsEMDwRZddHflbChTsWd5
	L1ROpBFPsMdRssfiXwGuh6A=
X-Google-Smtp-Source: ABdhPJxN5xcny0yYNxSi3Fkcc9USojRp9TlvCv9F7vUP+gzVZZSkJiZuia56h9x8PJ3rYzi0rk1Tlg==
X-Received: by 2002:a2e:889a:: with SMTP id k26mr1177741lji.30.1613120726841;
        Fri, 12 Feb 2021 01:05:26 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:4adc:: with SMTP id m28ls14176lfp.0.gmail; Fri, 12 Feb
 2021 01:05:25 -0800 (PST)
X-Received: by 2002:ac2:5d4c:: with SMTP id w12mr1021677lfd.610.1613120725827;
        Fri, 12 Feb 2021 01:05:25 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1613120725; cv=pass;
        d=google.com; s=arc-20160816;
        b=GiOJ2fjVvHXpjQ8rAyBiPj6yvtaT+jTcMd/traFprshYRWu2pxkf16su0qETdtlh3v
         c/EppoxRsRktNA1VHGUEnRtnLUHTBIlI0KO+G/tar4sf0jXO/MPe8rmnnFy51aBJJotB
         /sYAp83CqUYQu9rgRzXWJUlBrGNDEsGwKsZs2CJYv2ErLPlxnxajoqO6vp0PIU/CT5h/
         /7Ht72l49R4ZbUdnS4l/pqV2t7PPFHu49k+Z1pDEQge47AGErhZ6Q+cw1evDvQc2nodn
         oPoK8LO1BuHMekHofgCcTLbx2Dt3qbkHS5eKTN8rVp0sOqCqjxBMZ/MGs3h77nc7oiI+
         HBKw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature;
        bh=//RxYZAmP6n3qotx4VyqxCj0WvmtkaZBjzGEhl7C29I=;
        b=ZDigWPUYPOUPOq6f45A3m16XwIsgZ59qUD+N9/Ejg7ZLjm1Ooi06wNpia5EQUBrgYr
         Ao5CrbghX4j9vU+fH1torH8Y7qZpVd/yxLHMdVSH+Df8EZAYqNqdY5NFxgeUDMp5u6Y0
         Rgj8rB30jSgjfbDTqq1aIQI+gfcvDveAyQ7tfAyVwmEw/b+DF05KbcGuOx4SZBNg/W1v
         fKcSeMjPDhJzzsUWWPpxrorlgZrnwnGTogu9qoYQcrdRVW9rVzjHa5ylO6PY71hNao+c
         AICCz41eMSCGIBoTpsZxyo+vRF/mFngy4bJgHINg01N+OA5P3mqJPYW3k8S1ZM+HXjyW
         pLfA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ikerlan.es header.s=selector2 header.b=y6yWN+U6;
       arc=pass (i=1 spf=pass spfdomain=ikerlan.es dkim=pass dkdomain=ikerlan.es dmarc=pass fromdomain=ikerlan.es);
       spf=pass (google.com: domain of msainz@ikerlan.es designates 40.107.4.110 as permitted sender) smtp.mailfrom=Msainz@ikerlan.es;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ikerlan.es
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (mail-eopbgr40110.outbound.protection.outlook.com. [40.107.4.110])
        by gmr-mx.google.com with ESMTPS id w18si494586ljw.1.2021.02.12.01.05.25
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Feb 2021 01:05:25 -0800 (PST)
Received-SPF: pass (google.com: domain of msainz@ikerlan.es designates 40.107.4.110 as permitted sender) client-ip=40.107.4.110;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ah81qMlV4Xut3iPU6WwWorF/GR2yn7YQRbqU9oyZrSM4wq7lf7XJZy9v4O6cDQCAocl64sz3Ts7Vswgj9nKiOlSLKSFkCx8OQaZZoo1jrGOZ8VPXVWwzYjcJ1Z91GEOQRK6OAAnXs5qlt5/Xno10v672j7iDofujHJZmLn3SpUM+aMDJ8x4Eg7MNrznxfUyjENXtxAw0DaexhDl9aawAjaQ29x8GVrzUYecHwvIqZr1VkDqvIVh5SBVy2bdvpgY64MczwJ0qxHpbI3+AZ0oXeUBPQD4guouE4+qWT3yKpZMRWijp0ILCF6ZcMnQi7dgiSNjYf+m+f2lUrpzZ0tRpUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=//RxYZAmP6n3qotx4VyqxCj0WvmtkaZBjzGEhl7C29I=;
 b=lMT3cvp0uDj4MLITzg5Ei8UoDLfSux2+cl1rBUHVYif0Zuy9G9LV+SLub42irwQuYQwdN73Bzf1nbVEKV71p8i5lF9z3qH1YjWkajft8rGVJzpDWysIJShkeYCmo43BlXQ57NLsmwx75GebYxOT/XyFQq6Y4k2QfITOWMq7K1npkU0qZp0j21/lXo1AmYeGo06bJL+quAJ/hjgEAtC9O745XMBzjFXIMvABWmP5TnC3Rxs4gCl5HEeWGi7TXHp4ZVZ1BN7IpNRkIsv2qqGoGzX9TkUQfA1EzibOkEhY/+6Ir5ap8hG/v583RHG6yn31UyUsqpRWwirD7AoQo9FnO3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ikerlan.es; dmarc=pass action=none header.from=ikerlan.es;
 dkim=pass header.d=ikerlan.es; arc=none
Received: from AM0PR03MB4450.eurprd03.prod.outlook.com (2603:10a6:208:ca::33)
 by AM0PR03MB4291.eurprd03.prod.outlook.com (2603:10a6:208:c8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25; Fri, 12 Feb
 2021 09:05:23 +0000
Received: from AM0PR03MB4450.eurprd03.prod.outlook.com
 ([fe80::b874:4798:756b:9da1]) by AM0PR03MB4450.eurprd03.prod.outlook.com
 ([fe80::b874:4798:756b:9da1%4]) with mapi id 15.20.3825.030; Fri, 12 Feb 2021
 09:05:23 +0000
From: Sainz Markel <Msainz@ikerlan.es>
To: Jan Kiszka <jan.kiszka@siemens.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
Subject: RE: Overflow in MMIO registration
Thread-Topic: Overflow in MMIO registration
Thread-Index: Adb9/f7M/lP2EmDISBKFTcmUvnX2LwADtf2AAGQZjFAABO8mAAAAEnsAAFsdrpA=
Date: Fri, 12 Feb 2021 09:05:22 +0000
Message-ID: <AM0PR03MB4450F982DDD1872D12FA09FBB68B9@AM0PR03MB4450.eurprd03.prod.outlook.com>
References: <AM0PR03MB4450A4AD70FFBBA0D726D521B68F9@AM0PR03MB4450.eurprd03.prod.outlook.com>
 <290f756e-4a93-46f8-0eb6-a15206bdc1d7@siemens.com>
 <AM0PR03MB44507C4040BE5E902027D833B68D9@AM0PR03MB4450.eurprd03.prod.outlook.com>
 <c3dbe31c-29f2-af62-d2d6-9f7d47e8381b@siemens.com>
 <c429c272-3ae2-cdaa-6b0a-96f5bbbe6c1c@siemens.com>
In-Reply-To: <c429c272-3ae2-cdaa-6b0a-96f5bbbe6c1c@siemens.com>
Accept-Language: en-US
Content-Language: es-ES
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [193.145.247.253]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1f6ab012-9293-47b3-bbea-08d8cf355488
x-ms-traffictypediagnostic: AM0PR03MB4291:
x-microsoft-antispam-prvs: <AM0PR03MB4291A10A76580DC3D906AFF9B68B9@AM0PR03MB4291.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qYUIGS6HMFC1M0PDPq/BoxY0RpzfnXzftthGbNfxGnkwkqCoQ0xaqTDgDLXE+r2jSP7fEYNbHCKb+acep3eIZAFWEEqeprWlnEjItitDcYyAgLkS2KbmGXBYcDb6Ncd1Ax/JMavA2NLtfiDNPOo4x5525SGH4F6VHZ6R112ThqKVm+K9vXEtnRaaykDQILHDLZCEMLXNTVJT4F4cJN8Oky7Bh6YHjrhs9dcgRyUP4TvlRvje99lR8AJN/VdC1mvEiknW3BpnOtefAj/5absSk06/c+PgQuKBsQSQQNSRSkzTpmj+DtRYmT4eM8VPJ4R6pD/lLYpkoBsoXyINNRL25f1yvWymMEPU1TAFJBVmlly+nuJ3xG8TQBxPk/id3H7BLhAsFKZ2T4ovlooIvSX2K+aSFAy5R4s2ffiDxQIOIaIhn5a1dsPWQJB/4KZbJagCMkY0rmdDB1BTPIp89TTSLc8WzNETjM0m+qrvriYIooxP8y/ugbJknou0TFdsCNImn9LRQP71sz3rOYo1oJaWEw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB4450.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(346002)(39840400004)(376002)(366004)(478600001)(33656002)(2906002)(8936002)(316002)(110136005)(5660300002)(9686003)(55016002)(52536014)(8676002)(83380400001)(71200400001)(76116006)(53546011)(86362001)(6506007)(66446008)(66476007)(64756008)(66556008)(66946007)(66574015)(26005)(186003)(7696005)(3480700007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?MDEyVFNSSDFySjFOYUhzaWV6d1BpME9NbEg0QjdKTy9vSm9YOHlhMzg2K216?=
 =?utf-8?B?RWlqRHJoY00yU0lHN2tDSldGNEY2VXd6L1pFTFFFMWpFRmIvNmlnVEkzY29v?=
 =?utf-8?B?SEJIS3ZrS2JsQUxWbHZUeCt4emNXT0t6RktkZ080bFFSR1E2WFhqS2V3cmM4?=
 =?utf-8?B?dXE2VXNPdjBEeTk1Wm1qb1owOUNQdlhmVjhkUkFzbWp1MVVYWHp0cGpNbDlQ?=
 =?utf-8?B?K0JGL3FGSml4WHlHRG5wVytrNDlBZGFFQTJuVGIvTXpUZGVINmNDTGNZUUNH?=
 =?utf-8?B?dVhyb0E5QW1xVENyR01jb05Rd2JwdXAxNGJEMXRNUjVvREZqYmJvL2Q3MTk2?=
 =?utf-8?B?bno2Q1lsbGVxNEV5amw0UEJubU5xSllzSXdWdWYrWUdIa1pzL3pNamdUeWlY?=
 =?utf-8?B?WCtIc1NRczVSeTFHaHdZbGRSaUJNdUR1VEkyTVM5dUJFekUzR1FpYUM2aWIx?=
 =?utf-8?B?RTVXNjJBL1p6bDU0Z1A0c3BYdjdDMC93Y3JwdnV0Vm1jYm10SU9qemNtb24r?=
 =?utf-8?B?WkthaG1KdjhhWmhQV1AxVUZLdlp6aWx4VklmdDNJMmxxaFR2T0FxcExXRis0?=
 =?utf-8?B?MWhVQ0dsYkR3VVl4YXpLZVBwanRZSTNGckQrUFRTbkZpdlY1MHBNczBUcHRt?=
 =?utf-8?B?WDRVT2NpOWhpeEFIL1FHeGdKQ3c2OCtQbEdZS240MXBJL1V6ZllCNVN6ZjBU?=
 =?utf-8?B?MGd1ZlV6a0ZEVnc2aDEydGJjSzFWdE5YQ1BPQ3NtQXFTdERLcXo0VUJtTTNB?=
 =?utf-8?B?dVI0cnpYQm5FSkx2R3RpYktoOXN4dE1CVnV6ZDVsOWxZT2dMSXVyNDdIQ3pr?=
 =?utf-8?B?TnU3QVplc3hmc1VVOW1lV3pCME9PNS9YQmtkUjZoU1d2dk1oMWRJeXFJblhC?=
 =?utf-8?B?cnZITWJwU0d2STAzL0JFdmlFVzZqSWpBNmxJSzJTK2kxOEJKUFZjRU9hUWhp?=
 =?utf-8?B?SmVmNmpjVEd5YlR5QnBpSnBuRVREbHVOeFZSQkNVb1JJSWtkV0tKS3l1UmRh?=
 =?utf-8?B?V09YcmdvbDVjekZ4NTVoNmhmcjBHQVVPZ0syeGE3cE16MmhpU01iUGVJWWN2?=
 =?utf-8?B?ZzhsSUo3YituNkVzWk13VTFROEFGODczZnAzRlZGdFI1OXNkLzBzemhJcUZ4?=
 =?utf-8?B?bUljTHljVjR5NERra2lIS2ZXOHBPZ2JXM0FvM0VUR01VTDFoSWk2SEQ3R3lO?=
 =?utf-8?B?RkluY254NHY1MGdmRkRLbmdqSWx1Y1JQNzZIcTU4anc5b21RbU4yZEJqS2Ji?=
 =?utf-8?B?Y1JQbU0xQVprMHpPQUtHYllKRkxPZFZ2NWpsZ2o5VWpSWm5zcXZma0hhS2s5?=
 =?utf-8?B?WEQwVUMzU0hJVHVlMGl5S0R5cFBMcVpRSWVtcXZ5bG1tTVRrSEZZaU8zRC9X?=
 =?utf-8?B?K1NhUklNZitPU2FPbDR5ZzkyU2w1WEt5WlNwV0VyOUkzVk56NjlMOStxWlpv?=
 =?utf-8?B?VFV0dnZrbFpURU5idm5YTmFOeUswUFNVWXZKTUJ1K0RHMy9oZnh3eGxxME9m?=
 =?utf-8?B?YWRiay9XMklYNXFtTHRyL0YxeXo0M0huVUhWK1dSbWVlb2RIS2daZGswUm03?=
 =?utf-8?B?TUsvd1NFbzJyVFBXcXRIa2xXQ2hSbUptSS9UUEVieS9ybWM3bmRrOUg5dWND?=
 =?utf-8?B?SFpibUI1Yk8wQUl1Z21KenVWYlFtWFQvZFpxV3FLSG91Ni91b2FRWGFUMDdh?=
 =?utf-8?B?QzdBODluZ2sxZFYvR1N4akw3d0pZL3EwbWdicy9aQytWYVp5aWdWZi9JdnpS?=
 =?utf-8?Q?KaWzh/uuCAHB2ClLli43l7/jlxKjCLgnR4iyqFM?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: ikerlan.es
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB4450.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f6ab012-9293-47b3-bbea-08d8cf355488
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2021 09:05:23.0149
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 910ac815-f855-4a08-bf29-90b46552cf11
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B2nKueRGft0JbEwPYUgSDncmphnAqFz4HMgz77wL9+b6zBedHjX9CTVR0Zh4oaaESPsreA5ejg2y130rYKUWeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4291
X-Original-Sender: msainz@ikerlan.es
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ikerlan.es header.s=selector2 header.b=y6yWN+U6;       arc=pass
 (i=1 spf=pass spfdomain=ikerlan.es dkim=pass dkdomain=ikerlan.es dmarc=pass
 fromdomain=ikerlan.es);       spf=pass (google.com: domain of
 msainz@ikerlan.es designates 40.107.4.110 as permitted sender)
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


-----Mensaje original-----
De: Jan Kiszka <jan.kiszka@siemens.com>=20
Enviado el: mi=C3=A9rcoles, 10 de febrero de 2021 14:33
Para: Sainz Markel <Msainz@ikerlan.es>; jailhouse-dev@googlegroups.com
Asunto: Re: Overflow in MMIO registration

CAUTION: This email originated from outside of the organization. Do not cli=
ck links or open attachments unless you recognize the sender and know the c=
ontent is safe.


On 10.02.21 14:31, Jan Kiszka wrote:
> On 10.02.21 12:15, Sainz Markel wrote:
>> On 08.02.21 12:24, Kizska Jan wrote:
>>
>>> Something may have caused a subpage MMIO region to be created (page-una=
ligned memory region). If that region split-up didn't exist in the root cel=
l already, things will fail. But I suspect that subpage is rather a symptom=
, not the >cause.
>>
>>> Where there any compiler warnings when building the config? I would als=
o recommend checking our configs via "jailhouse config check root.cell cell=
1.cell cell2.cell ...". Or share what you created.
>>
>>> Jan
>>
>>> --
>>> Siemens AG, T RDA IOT
>>> Corporate Competence Center Embedded Linux
>>
>> There are no warning during compilation and jailhouse config check comma=
nd says it is everything correct.
>>
>> #jailhouse config check sysconfig.cell core1-cell.cell core2-cell.cell c=
ore3-cell.cell core4-cell.cell core5-cell.cell
>>   Reading configuration set:
>>   Root cell:     RootCell (sysconfig.cell)
>>   Non-root cell: core1-cell (core1-cell.cell)
>>   Non-root cell: core2-cell (core2-cell.cell)
>>   Non-root cell: core3-cell (core3-cell.cell)
>>   Non-root cell: core4-cell (core4-cell.cell)
>>   Non-root cell: core5-cell (core5-cell.cell) Overlapping memory=20
>> regions inside cell: None Overlapping memory regions with hypervisor:=20
>> None Missing PCI MMCONFIG interceptions: None Missing IOMMU=20
>> interceptions: None Missing resource interceptions for architecture=20
>> x86: None
>>
>> Attached to the mail the cell files I'm using. The .bin file is the same=
 as for apic-demo.
>>
>
> Just looking at core1-cell.c reveals that you are neither aligning on=20
> physical page boundaries for the base nor using page-aligned sizes. So=20
> it is like I predicted. And it is NOT a simple copy of apic-demo.c.
>

>...and we should likely enhance jailhouse-config-check to catch also this =
case.

God, don't know what was thinking at... That's working now, cell starts cor=
rectly. I can't see any output in the console, what did you mean in a previ=
ous main with " Hope you do not let all cells use the same UART console in =
this duplication (PIO 0x3f8 etc.)." I'm now just creating a single cell and=
 no output is being shown...

Markel.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/AM0PR03MB4450F982DDD1872D12FA09FBB68B9%40AM0PR03MB4450.eurprd=
03.prod.outlook.com.
