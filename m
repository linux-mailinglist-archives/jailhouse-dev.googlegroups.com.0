Return-Path: <jailhouse-dev+bncBCWKP54GYYIRBVHR7GHAMGQEUSZJFZI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pj1-x103e.google.com (mail-pj1-x103e.google.com [IPv6:2607:f8b0:4864:20::103e])
	by mail.lfdr.de (Postfix) with ESMTPS id B378E48BEA8
	for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Jan 2022 07:44:38 +0100 (CET)
Received: by mail-pj1-x103e.google.com with SMTP id s16-20020a17090a881000b001b179d3fbf3sf2026456pjn.4
        for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Jan 2022 22:44:38 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1641969877; cv=pass;
        d=google.com; s=arc-20160816;
        b=HbnpUTMgm0G/xa66Y3AW5Tp8IC/ACtE9YAjZhfYT8AzdNo1YVAWbKxV3v/UiLHBZFV
         4uwotao72sus76tKgtZbQic2lXMkgL2ELQQFE5vuOSzF4c2t5m0bG46scU729M8z5AWt
         eSjybhZbZ9uqhQyDZcz+VHR7Irkjqhu6GlneBouH7JRUd3RW8UtTHXbvUZ6QCODfsQQ0
         qhneDFcCRRpsX2RkJQVle9A/somipmREsMMhD5z2b82xnBT3jhhxbu8V1ghRBj0pZFOL
         v+02sdoEGXj068t+FQsHUst5Ij+7G9AdyrJ1jMl7bYFztn9E7kKZ+az/X8HCZk96pqWd
         2NvQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from:sender:dkim-signature;
        bh=e8IBjNqLzCqFB7kZIPJBzRRlrit/lR2tgiQQql2BMHk=;
        b=A1ZBZLJPT7Cx4WjGXD47AF+zmKv70/4OUHGGk9Ot694rKDfp2nEvVJv3NL1nO2gYQT
         W3ku1jke2zJ39CwOnJUvuk6EOHzIqFFgVFSNQqniVQj8FNVcIfqeirAqL/t5e+DgOKW4
         RDTT5AWS3kSjpVrlFK639i75PcPHGGHWFnC6xa9FpqI0K60jDW/g+VVQ6jAeNBECt1TA
         OLQHpT6WB+tC0mPfSaYuRETZVG/qBdHDuKTwT5ELsYQqut/y/p8rLlW0o5VojErFtuR7
         sdONHThwnXElsHzJWwLIhfQzAwqJKYL0HkLO7k9aLnx570UhKMWFpNdq/dSRKXnwfIO7
         BaoA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=Ucf0BZOw;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 2a01:111:f400:fe08::60a as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=e8IBjNqLzCqFB7kZIPJBzRRlrit/lR2tgiQQql2BMHk=;
        b=nlG7DqBhydh691m7FHe5fE7IgYFs/vI572+V9RtZh3xntZTlnuqz4852x9C49Y9LMU
         8T8Sjnx9HQCvvPjL20o26M5Ztp8gV+N1D8acVrpDPZ/ZhB5A+C7FWHgU8H2g/ZbVHftI
         diMv64kbBODZ9ysoKd5oomUCR+Pr5FYNGmxka5EPPpnUxsYcdZM7O6VMjaMaQLj/05QH
         qfWtdCedO4atLd3tFomvUVIaDGN7tf1FVRdm5kBtnLnI88CpSFPCvCHDovoV26FFjkye
         sM4KT49X3pjmWA0rgFg9tRE+8+YQN8MSACjibeC72S27RUPeRnuviJmDDwDpTSZzFZAa
         mkCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:content-transfer-encoding:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=e8IBjNqLzCqFB7kZIPJBzRRlrit/lR2tgiQQql2BMHk=;
        b=jOVlzP5YTCoMN7qfyDD4uXSyPNC2L/KLNu6oJ55uw2+KWAwIhie6yIkNqnwvkLX8ci
         uFOBLl6bkLUW/GM0U2MY9lkmBSkKqwvIgCLueAF8l7oNut90W9/iuCOOHYBpoZ2bhK8V
         a/dpA5jF6bWNjBfUKUqDPTvpd+dRureLdjKKNSBb3QW7do/LVp9R3l7Lr4EzpcPrX2qM
         CPlOhQETDxmtWApTHXe26798BKRznypsEXnIo1goq3lAJvFCYiIno80Z9PuWsG45wsCW
         lu4K7tlds0fOxcq4tfisVC+4gQY8cCXH+1ugbuAQbsOspx8pZecMRi0KjmHGws+iV4mx
         EqgA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5336JqsRv1tBkyqkINX4Un5r925/F9HlB39Z6JozD4yeZr/gl8AS
	4y+5kz4CLU3q59Me5rGUTwQ=
X-Google-Smtp-Source: ABdhPJwTmC6/BxNICurawaphXyVHDGIHD8m2btIMyuTrzsRc6hgNrY4SJvg3KAuqJsAnzCJRxJqbyQ==
X-Received: by 2002:a63:8c47:: with SMTP id q7mr7180560pgn.591.1641969877127;
        Tue, 11 Jan 2022 22:44:37 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a63:330f:: with SMTP id z15ls4676112pgz.10.gmail; Tue, 11
 Jan 2022 22:44:36 -0800 (PST)
X-Received: by 2002:a63:9d4a:: with SMTP id i71mr7184797pgd.570.1641969876234;
        Tue, 11 Jan 2022 22:44:36 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1641969876; cv=pass;
        d=google.com; s=arc-20160816;
        b=nLcDmE3JAtDv8bey8m+szzTtarfAVck9h1j/YWJ3fAm0P31RyUKvGuRHJUbau3e1SY
         nSjLBDvCArVYBZ7FDWdGOCDpwOGpoRZq95WF2k8BhPZBsMLrm5Uj2ZsyqU/8wTwNa6VD
         5D1RgkZHFkyqrwbiBG35QmxV4PLj/JlyfmQsR+KPTqLpfkG653grbzgK0JEjKe9QZXRw
         F58+8LOrbcJRW3MIRRxfIRU8kfLYrLTqbrl/bcGF7sUSO+ZHbr8WVM6v2Ls32ZyVNy2N
         M6seS9+hSCi5DzWIpiCIIr/2nmu4TxBjtf04dTif0zxQzffdIjKDUCvfSXXD3zgwymj2
         wUzg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature;
        bh=JgycOaTC6qPSVbnDanxVBsfsT/Sv07F4VCFOfVut4k8=;
        b=va5YJSmhA2i2edb7vMC0ej7jMHP5QJc+c4VBlDvhqA56fAv3e9gQANl57yAklTkDTT
         2NNZqbX042rLxfF4WFa32a1OFQ90HemxUPn3h33lov9MrRlSq/z0o8olo3ruwGXqKv+M
         LPi80cyjofJ+DoIb5alOVOIShJvdTEquoEPykW2Y3F4eR4yMffUK7x20DkyWWTdXv8o3
         68r9SP40Y+cUgZstnIpShOIqhOwyjEF/F2lt26arofdy9kiOipGigLTEo6KYqZPlyR5Y
         SdKz7TEnVfsNEsQEmSQbk/zpTsyawdMe8J48MpxHHZNwfh+wU2PeSxn4rb4lrnfsbN+n
         zA0Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=Ucf0BZOw;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 2a01:111:f400:fe08::60a as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (mail-am5eur03on060a.outbound.protection.outlook.com. [2a01:111:f400:fe08::60a])
        by gmr-mx.google.com with ESMTPS id h23si452342plr.13.2022.01.11.22.44.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Jan 2022 22:44:36 -0800 (PST)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 2a01:111:f400:fe08::60a as permitted sender) client-ip=2a01:111:f400:fe08::60a;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uy/wZCR6RMcMEJr0PcQFJDzM4dbS6PksxzzdIw+qbRDGkmFLhabYm2iZJgrceUrNskTORDEJ4eGCcD7vJ2JfhLL8aQMikUxgBLMMyQgcwlVHD/pwmni8wmq9Vm+EVCmxF3HQmYJm4gP0OBf8FQmXNt3/b9eBEMRyf4i/6BLcx/n1F7KnGFHpHjsgKNTpw+naBiksKQjVLG90Yt17QoUXQyCTkdpWW1jtrupxdaYsvkb1FnZ58k/sEVrjLjaKoGrpwxX7ZTg6ypkLuda8zNCn7WnPEV9io2qSvWlHf1WwE7sNey7urk8U3CzBYmB1xJP1U4WaMllDoQ5S01zJ2KH4+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JgycOaTC6qPSVbnDanxVBsfsT/Sv07F4VCFOfVut4k8=;
 b=BaiNVQZsieu7d1MFxJ9ViXxr/w3kMx9oPqRVpcKrN2fHxkz3uHWX25mEwALYWu6c8ddc9klGj/jOE61KeZ3N4MIat087MFNkNL2r71KgZBnki8Hh/sUNOyQHQ5WUY7JsSheOYfU3CQO4AbttUR0cy2d//r7WVzFZa1RCX7zJiU0osl5AfssvVYDXxL22529Q41uWsxYU5hxgsfHLg9mEPoHbTOmyfXtbcI0MZSK3n0G1UIupdEIcSk7Z+ckJ1WZSoMnDnZ/mVjkg1zKDLqNAoeiip0bDTIMQKFWD+827NnJq54LzgxwvJUbm/hmiWY4LmwZEywv5c0+0SSLcOxIBAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DB9PR04MB9259.eurprd04.prod.outlook.com (2603:10a6:10:371::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Wed, 12 Jan
 2022 06:44:33 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d4dc:8c9a:55d0:81d8]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d4dc:8c9a:55d0:81d8%3]) with mapi id 15.20.4867.011; Wed, 12 Jan 2022
 06:44:33 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
Subject: RE: [PATCH] hypervisor: arm/arm64: fix build error
Thread-Topic: [PATCH] hypervisor: arm/arm64: fix build error
Thread-Index: AQHYB3waENO8O45kukyREVaSObB9XKxe7sEAgAABS1A=
Date: Wed, 12 Jan 2022 06:44:33 +0000
Message-ID: <DU0PR04MB94175FA39632BC0AFEA908B088529@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <20220112065619.19432-1-peng.fan@oss.nxp.com>
 <fc104832-1a03-5d06-f12f-dd34bdb2fe60@siemens.com>
In-Reply-To: <fc104832-1a03-5d06-f12f-dd34bdb2fe60@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e55c6402-1b8c-4410-4e4d-08d9d596fe5d
x-ms-traffictypediagnostic: DB9PR04MB9259:EE_
x-microsoft-antispam-prvs: <DB9PR04MB92591BBECF1C91D75E1F5A6C88529@DB9PR04MB9259.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4DCm+ApJ19x8m7XjoYwJLb0z1AHxx9yiSahGxeLessgap1oYloIIdICkgZ1kVmWRdsH7s5VwCcWHWABgiDr/XDfhwDTtGZjpptvAiLL7hRuYDQUvKop9tKC/v6W+1yFtTG8biUZlWJU5qjwsn+QsmkTqxt4XYl6A0VUn4ULJp5imy+G0Wou2Lw98ly4PmyDZi3MkY14f8fd72642FcJ09xdKK6cRbOEk/mdE9vtx88ig86I8JHV8uxxdwiQrIMk50geACqk7p8yXSqmwfdlNgv7MGMvCJP6ehkpPmVunJdWTIkcdwtAk2QOIARRljJZ4Fdedigc0/8Xm5ryMJBBubsCvuLm6qjW+dF+D08sGHtYKngtMBVDqvr4yiQGO4hAd9ynUGnTSZU7h+jGMOsVq0rW7y88xAdZ43n2ICteAAHpd5mtpltT1WrwhdYRws1dEEKZL05/k2kBiMdkVqXOG8vWLEbfoi1RunPjGxHM2OCy+B6wBC7KhoV9XVKQSv+jybVq6bwK5UloV4mdQeuAIhpc/UERnbPa833FGT9r03c70jenwhJ1l5KsGxa8/CjlL+yaWrmS27bBLvIxyM+ijzzjSwnC3Yf62dTXrPMqb7vx0GI6LyJDEza8Csos/KQViTmJdoIXLEeJo2XTca6KtLwIE0c4pWh0kVb6tPaoMp74YKZvtIukgsWPoiVecMSa1/o7fx2z0HV/v1mrFUNRjRg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66446008)(76116006)(9686003)(55016003)(64756008)(66476007)(316002)(110136005)(8676002)(6506007)(53546011)(26005)(66946007)(66556008)(71200400001)(186003)(8936002)(33656002)(38100700002)(122000001)(83380400001)(5660300002)(38070700005)(7696005)(44832011)(52536014)(2906002)(86362001)(508600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VjZtaEtvSHBucHRHR3BlbVlsU3kwTlQ2TTNhY1U2TTNvazdUQ2tBOFMwc0Jm?=
 =?utf-8?B?a2s4Qkh2ZGt4b0xpMXc4MEVyLzZ6dlBZdjNuR3JibkdnajR4bS9NSHN6Y3pY?=
 =?utf-8?B?MWNOSUU2K1BRL1pDWDJHZDc1cWZEZHpBVDZVbmdkdkZEWk9zK1JrQmlrbUg0?=
 =?utf-8?B?SmVRSFkwbGx4a2ZaUlN6MGV3TFpQRDltQ2RrS1ZWWFpsOWVaeFdiRnFmcnFB?=
 =?utf-8?B?QVEwKzBSaUZISHdjU3Y0a3laN0tkdTZzSUlHdm8xcnp4eVJkTmtjMDM2Z1l5?=
 =?utf-8?B?NFhLMms0TUYzSWdCQ0FpVHMyUmozOTBnZHJIREZobGdpb3dpS3VySTZwS3Jq?=
 =?utf-8?B?TWsrM08wbkZwT2VXVk1SZ21DZWJxbVJPYmlIN0NQZUpPbHhGdVErUlFZVUF4?=
 =?utf-8?B?dVRoVXUrVFN5RFY4SWdwL3pQVkZyR253TjFubG9GMlRWR25tUnBCRzdQdmZj?=
 =?utf-8?B?b0JEQ05EVEtjODlRaytqQS9ib2lLaTJtdm82ejFNdlJ6a1BNb1NOaUR1Sm92?=
 =?utf-8?B?aEpna0MzR3JTTjczWXEreHhZVmNUd2FtWUd0YnFLeWVOUDVvUm9JajRvNEhv?=
 =?utf-8?B?REVPQkdhMk5oeVdhbkZUZFQxMlpoSGl3OStDSVdvZW83RVp4cExLN1ltbkMr?=
 =?utf-8?B?bkkvZUFUNG5JTTRQYXUyMmdCMFljNUVtY0FjS0phQzA0SERZcm90bXJ3Z0N3?=
 =?utf-8?B?dUV3Z0ZBLzVYdDU1RFFNZ2FjS3o4QThIelQ5alFRUUt6ZWZYNVI1RVNrbmZz?=
 =?utf-8?B?TUZvSTdyR3Q3MFpoZXRPYU5iNklVdVBBaFdBL1llYTRUdURMaTUyTGhsaXVE?=
 =?utf-8?B?bGU5ODZrVE4vSWNSdDRsZzMwbDFXSENqc1dwWC9ENmE3TjJDOGZ4S1VDOWZC?=
 =?utf-8?B?V0NwSERhNWhTMk1CQ0VVOVR3eXd2YVJlRGYxekVDdEt2VStObVk3VzNmWjJD?=
 =?utf-8?B?c1BMdkxaRGNPaUJLZDc5eDZRUmlSTVRnSkZIQ00yeDR4OGV1K1pkTWlObUIy?=
 =?utf-8?B?a2NBZ0lyeU9mSjduY3RKR2cwQ2dPWEc3WTh5TTUwclg2bGVxOXlrcHIvalZM?=
 =?utf-8?B?ZkdzNWU4YXFDRFF0ZGNwRGJrZzVXd1lmUVVMVkR6elphVFlXazJBQ05JWWNY?=
 =?utf-8?B?YktOd3dpNUsxaHgzYm5YVURXdzZnNWJHam1OakFMcW45NG9ZMWdldSt1MjEy?=
 =?utf-8?B?WWFGelRBL2hGTG5WQnMwWU1rV2dRcHhZWGRkT3U2K3JyZmE3SzNISWNXdkRu?=
 =?utf-8?B?cXBHMTBKcmxjL25JODhPeUoxQVNiZzc3ZGFPay92MGdQbnRwNllJRlhLVkYw?=
 =?utf-8?B?d1JqdmVSbC93U29nK1FxNk5UY2xEQUZzNDVwejNTSnpQWXVOL3BrZDNLSmZ4?=
 =?utf-8?B?KzhOMlIxUGp4T0hUYXZpQWJ4Um1nZGQ5RlYzKzBHSHd4Rnc2dVRJSFJSTDBM?=
 =?utf-8?B?UE5OWG1mdzRzeTNMbk1FODhWSHRwcmJ6KzRMRm1DbzFBUG1wTnZZRDh1cyt5?=
 =?utf-8?B?bEovcjk4cmttb1U0OWFVd2R1K09QV1FFNDJrZFlQbjQ0NWU3M21iNWJWUmd4?=
 =?utf-8?B?N0lxR0lrUDNPVG01TXFmMzBWdC93OThXS0E3Nm5DaHJ2M2tnRlBjY1VSb2Jv?=
 =?utf-8?B?VGVsaWJtckdlc0k0U1d0L3dHQkw4ZFpYZ21zK1dXTURxTDRpTlVWS05nTHNF?=
 =?utf-8?B?aHpad1MvNmN5aE43alh3UnNjZGliOU9ucGZrVG5iZjVySnpsN0lvMGYvZGk4?=
 =?utf-8?B?L3ZHTVZWMGtYWWlmM2NkdjZhMFZqdVY3WEtVU2pKbEhUbCs5V0Nxa0RUWUlt?=
 =?utf-8?B?VUVXMDdnOHZnTkZGaURqS2FEMXQwVFRHUC9IdHRIVkgxTEhaRlc2SlIramlk?=
 =?utf-8?B?Z3lFTzFrY3RSTVdYSXhpeWZIZ1BJSDhnU0RlaW0zM0ZPZ21nZU9paU9rQ1NW?=
 =?utf-8?B?R1hDRVJQZ2l6c1RaUHlSci9JY094VmIwelFVcTJiUUtqVjhzOGlxdXRFa25B?=
 =?utf-8?B?dVFPb1VqK09YVkU4b0hhRjRpL1RvUmY3dXp3VGwzSmhXeFNvcWtJTkxVdDJu?=
 =?utf-8?B?SUc0M1o4dzlhZ1RSeElLYUVHQ1M0QW01YWRmemYwOEVGT0xiUjRSQ2dNM0ha?=
 =?utf-8?B?R0M4YWZPWEN2UVdLaHV1U2JycXluRHBLK1EwQVJLbk5LbWV4U3g0Z0hGNHlB?=
 =?utf-8?B?RFE9PQ==?=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e55c6402-1b8c-4410-4e4d-08d9d596fe5d
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2022 06:44:33.8662
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TN7Ei3psghCJDrOjHg/ybnwxiNsKYWB5CJsDMhelMJSZuJXbkPp1UoksiC+zMc5pjpFmvumET4FXB6IzBO0wmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9259
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=Ucf0BZOw;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 2a01:111:f400:fe08::60a as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

> Subject: Re: [PATCH] hypervisor: arm/arm64: fix build error
>=20
> On 12.01.22 07:56, Peng Fan (OSS) wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > With gcc 5.15, met the following error
>=20
> Which gcc version (surely not "5.15") from which distro? I've tried with
> manually adding -Werror=3Darray-bounds to the build and using gcc-10.3.1,=
 but
> this message didn't trigger.

I use NXP linux 5.15-honister, gcc version 11.2.0.

>=20
> >
> > hypervisor/arch/arm64/control.c:33:9:
> > error: =E2=80=98memset=E2=80=99 offset [0, 255] is out of the bounds [0=
, 0]
> [-Werror=3Darray-bounds]
> >     33 |         memset(&this_cpu_data()->guest_regs, 0, sizeof(union
> registers));
> >        |
> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ~~
> > cc1: all warnings being treated as errors
> >
> > Fix this by use a volatile pointer to keep GCC from determining its
> > value
> >
>=20
> Do we something wrong here, or did the kernel, e.g., had to work around s=
uch
> issues as well? The workaround looks a bit odd.

It is gcc try to determining the array value, but I am not sure why it not.
This patch is to let gcc not determine the array value to avoid
build break.

Regards,
Peng.

>=20
> Jan
>=20
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >   hypervisor/arch/arm/control.c   | 3 ++-
> >   hypervisor/arch/arm64/control.c | 3 ++-
> >   2 files changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/hypervisor/arch/arm/control.c
> > b/hypervisor/arch/arm/control.c index 46125e1a..c9c93982 100644
> > --- a/hypervisor/arch/arm/control.c
> > +++ b/hypervisor/arch/arm/control.c
> > @@ -23,9 +23,10 @@
> >   void arm_cpu_reset(unsigned long pc, bool aarch32)
> >   {
> >   	u32 sctlr;
> > +	union registers * volatile guest_regs =3D
> > +&this_cpu_data()->guest_regs;
> >
> >   	/* Wipe all banked and usr regs */
> > -	memset(&this_cpu_data()->guest_regs, 0, sizeof(union registers));
> > +	memset(guest_regs, 0, sizeof(union registers));
> >
> >   	arm_write_banked_reg(SP_usr, 0);
> >   	arm_write_banked_reg(SP_svc, 0);
> > diff --git a/hypervisor/arch/arm64/control.c
> > b/hypervisor/arch/arm64/control.c index 5b41b393..2c33c5f7 100644
> > --- a/hypervisor/arch/arm64/control.c
> > +++ b/hypervisor/arch/arm64/control.c
> > @@ -22,6 +22,7 @@ void arm_cpu_reset(unsigned long pc, bool aarch32)
> >   {
> >   	u64 hcr_el2;
> >   	u64 fpexc32_el2;
> > +	union registers * volatile guest_regs =3D
> > +&this_cpu_data()->guest_regs;
> >
> >   	/* put the cpu in a reset state */
> >   	/* AARCH64_TODO: handle big endian support */ @@ -30,7 +31,7
> @@
> > void arm_cpu_reset(unsigned long pc, bool aarch32)
> >   	arm_write_sysreg(PMCR_EL0, 0);
> >
> >   	/* wipe any other state to avoid leaking information accross cells *=
/
> > -	memset(&this_cpu_data()->guest_regs, 0, sizeof(union registers));
> > +	memset(guest_regs, 0, sizeof(union registers));
> >
> >   	/* AARCH64_TODO: wipe floating point registers */
> >
>=20
> --
> Siemens AG, Technology
> Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/DU0PR04MB94175FA39632BC0AFEA908B088529%40DU0PR04MB9417.eurprd=
04.prod.outlook.com.
