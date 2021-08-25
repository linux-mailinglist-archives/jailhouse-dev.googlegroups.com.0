Return-Path: <jailhouse-dev+bncBDGILGE54ELBBJE7TCEQMGQE6LDRMIA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33f.google.com (mail-wm1-x33f.google.com [IPv6:2a00:1450:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0293F71FC
	for <lists+jailhouse-dev@lfdr.de>; Wed, 25 Aug 2021 11:38:50 +0200 (CEST)
Received: by mail-wm1-x33f.google.com with SMTP id j135-20020a1c238d000000b002e87aa95b5asf1791035wmj.4
        for <lists+jailhouse-dev@lfdr.de>; Wed, 25 Aug 2021 02:38:50 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1629884325; cv=pass;
        d=google.com; s=arc-20160816;
        b=ztgOBHsLKi32g5D/Rujo840gh6dzQgAI7rmsFFeMc9rcP9eeP/ElZH9se4O9H4gj9v
         PtQImaI129NHAHNxSvdwwGUsQgUxcuCLjtaLMtJaMc3UyVGbQAYajXQgmeS0uAQckMEb
         SCX1iFRBh8fgOoamIsFSyZQCs6KpdbMdrKxA6MhiXMN72SvUgd/axBdIJpYD1od6rirU
         1xK+l3uSP5H+hgkGOF/fFSp7aL76OdgG0oekMDuYha55bPZg8tUGyPDdznZ3kewoIrXi
         jkcB/mNqFneC68hl3KI8Y7R9REdwyzlrfmmJWLDO4IKspYf82VNRLp2Yk4r3aDproJ9U
         cB3Q==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:sender:dkim-signature;
        bh=dqmqzRree+40IT6k+ec0XbfB6+67/0zGFY5gafCH1gk=;
        b=yT37exCHKRBzEJrCjZrw8elDjLiNxP5G7KImsBT/Fg2G8XGfa1L4pxNPjuQn2QVTjS
         qjJCMfbiTybep0dqdiX2gHK28BW+SzW+0u98CXV7dkPUUM+7Yp/atcEioTmAZEfUcLoI
         jBrYXUU+K2h2GxeWNF7TMadkBa6yeVk749S0B9f0AKdBpeT2pM9L5D+1RypqkviVu6e7
         lCoVOCxGCR1g8CujRGkwL3Vwl9fXE7dFQWn+OqHZy5vUTmePn8fPz8Ht3ZjZa7A30aqW
         0Vp/jtnzLl4GfD3+2x88UYaeEz4xUZ9xyWwKppXyL3LbCwU2SKL4RHy9rzRiKVQ6Za60
         z62Q==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@prodrive-technologies.com header.s=selector1 header.b=eM9AxLzv;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.0.100 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=dqmqzRree+40IT6k+ec0XbfB6+67/0zGFY5gafCH1gk=;
        b=fjFfbfTNVYBCyP3MvdKI3ocqyp1XxtpQ6fLPyGMXQDbkiqAMFWJ3jajsv8/OgFhPMN
         Emnk6275NXwdJxDDl3CO0B+581dYJlqTs/vOE0cOQph004czOSIpj+33AyY9ttp6cyJi
         SzRzMcSbRy05F6VWmsFPFa1J3n2C1B2c6j6rOCbo3qgNgs8tSLsY6Mp+RniEg/MspJ58
         tQMeQ4Ltv2kxcg1RUgwqQ8pX8Olx9rTw9e6bD9juDus7/CGGDrD8jud9YEC/uhF8/5XA
         1ISyIpAKOMxup1P5edfIPLDwbw7Neyi/2fanVewecBJHunzP8Jpcqx2CQydcUQayl+go
         AjMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=dqmqzRree+40IT6k+ec0XbfB6+67/0zGFY5gafCH1gk=;
        b=OilpKZPEZIjHpAWeiE7ktlFTumDngrLbiFNI7kC8n8KfuFQ5cSpm0G+flC6s9iBTvT
         PbD1ts3VjuREX/j7sYkGUm3UTPiG7CcDBFDSOR5SoBeFb49UgsAXrjsDE2Wn9MW83TQ/
         LUPq7jM4XDLCeUlPFmHmaKRu1JnTLXey/OjwkPau9aJTr+db3nyPM7EbjzDPSVcgqk0p
         dwRtt2+KbkitjvwcW7jtPfYfoKYHbu0YRmasqJxMBD4yFtcKx/Bn+FU3eKTvXbCRF2ic
         FzVXH4EffMy6Zs07DW1z9EHWSzaOf8K2hTzTOHpsljSn2bSalleIcpnNaw5gSKMOFY7A
         AEsw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532csdL5kU8/Ch2mwCueREEoprKidJ+us2oHGy+Qiyk4jKWcrLo7
	7atXzxa9H8m8s6VYKH9g7uk=
X-Google-Smtp-Source: ABdhPJyTy9gFGSiQwcVYBVqiVHihHwn3Ms0r/6BgaEL3/ATEp3OxhxbLNYe/vwCWpM7sGcAe1ITk6A==
X-Received: by 2002:a05:600c:4309:: with SMTP id p9mr7110029wme.174.1629884324783;
        Wed, 25 Aug 2021 02:38:44 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:e5c5:: with SMTP id a5ls2011919wrn.0.gmail; Wed, 25 Aug
 2021 02:38:43 -0700 (PDT)
X-Received: by 2002:a5d:68d2:: with SMTP id p18mr14072220wrw.43.1629884323879;
        Wed, 25 Aug 2021 02:38:43 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1629884323; cv=pass;
        d=google.com; s=arc-20160816;
        b=m9SoK01CVyHgo9geMhsED7b+8bI1zUk0VfTbSO+vpwoMAv9yoJ5E/t7ADIP5p73M6P
         /y+RdvFvtDD+sAaw9BggBjEYemg+QF0XCn6OFhmzVpQcid7Jqfu9hyCT1I6wmtp6XHek
         NIv+ltt2wSpPCX3Gqebnc/oJgYj+GB/+fxebJOfzkArfZE7R5Rq7RS+9nvd2Vm3TNG7j
         2l0EzW6n/+w3CY3xqToV2xpD0pDugz35kBZR5jNOKN+1jcEshMvrIHaDqR/O+AJCvYQS
         6LXzrW3HT3+LcZ0N62NwHSTD+XPUBwvC2UgJm1r4TaAWjDs/5zi39rrarlGYGuNbCNSO
         xFeg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature;
        bh=d5jefGeo3vDtGT1zIsP2k2bk/wecpiyfe/pk1w/h5NA=;
        b=D9w3W43onFgMWN034D+BWpsBqxzlV1mHK3bIsuvyjOm2rCFnZ3MRp+Hv0Qy+KaXQFy
         vzuTlxMxuOEWF132i+W2TcSEAp4GfdQwJ5k3LnpaK+SsV1bqyQ5p47XJO/vNOREWMUL8
         UY9nGwcQ3d9jnxUxVjhw+QDRbnKJlKcE1Z7iT+uQtM4eM5kd13VSsEYwRaX+wg6abouy
         Rmds9FiW+DZrMjcm4QhKqqeiihxgwx9TywlFoJwX/HLnAlWLRfwU37MG/Ym53u0ixIgL
         wT8iSf9If4WIfck7Rw52p2eAREaXtAurhFCSVwRYLOk4urrmujLz8M7054W+O7hBMJO8
         PW3w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@prodrive-technologies.com header.s=selector1 header.b=eM9AxLzv;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.0.100 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (mail-eopbgr00100.outbound.protection.outlook.com. [40.107.0.100])
        by gmr-mx.google.com with ESMTPS id i4si13092wrc.3.2021.08.25.02.38.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Aug 2021 02:38:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.0.100 as permitted sender) client-ip=40.107.0.100;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GN7/1ER5mpanEhhgW+UaVhJzg2Rj6tpJvSULx9hmnkbB0SioogQI3KKoCXNCqSa9/BFj+Idz6VzNZLmBE6NJmY23UMoKTSmvLPRy3OEW2N6LVZ/11GlhwUpd7f+AHGRpQkIjam+/TbPpKwSBGkwTrP01Uc6MIy6GkB4FRGEDF7mk2uCYl/JRi7KI9SmyTVoEMDjp+8GARiSlAADr2+vdWXTcZl00nTeMhGNOEr1wvc5hBDp7gx/fAno1JM/QNm6ClE+0KJXsVzGPr+tqYWoh7ad31PjSxBueiSNN2U2ep71I/P5QJVGtBuKnOrynj6ZdTNqgubAFAhfZpY7FXMXmcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d5jefGeo3vDtGT1zIsP2k2bk/wecpiyfe/pk1w/h5NA=;
 b=BgorRMXsCDYcTovMEOiCybQ33hCgzhDB4kwdEXqiRqCBJ4Uzz2rm/F1/mzMk0l6Kw6a/yJu+UkJMkagL3dbKOv+419sJAexXGw9B2SehoFpygLv1fkMfGMj5DnlJhYHNHWG151VolaZRmRcREhVegU8e6EwakGWthtie8aaPSoTSoL9xEQpkUln0eI/5gY+FDlExFeCFWPKVePWniabIuJY3V88Nck64i8v2gs40MITMD3M0m5yX+2PTq95LCpTv1BWSF4e37qqwpByiUBpe1s4YT6kkkAmDiGsGoMaTgEpmoe3ZbUXRq425gSIo//GVB3N8rLzLU1akfXrruVBvuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prodrive-technologies.com; dmarc=pass action=none
 header.from=prodrive-technologies.com; dkim=pass
 header.d=prodrive-technologies.com; arc=none
Received: from AS8PR02MB6663.eurprd02.prod.outlook.com (2603:10a6:20b:257::14)
 by AM6PR02MB5348.eurprd02.prod.outlook.com (2603:10a6:20b:32::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Wed, 25 Aug
 2021 09:38:42 +0000
Received: from AS8PR02MB6663.eurprd02.prod.outlook.com
 ([fe80::f949:d45b:acb4:e0fb]) by AS8PR02MB6663.eurprd02.prod.outlook.com
 ([fe80::f949:d45b:acb4:e0fb%3]) with mapi id 15.20.4457.017; Wed, 25 Aug 2021
 09:38:42 +0000
From: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
Subject: RE: [PATCH 2/6] x86/cat.c: Fix CBM for non-root cell w/ root COS.
Thread-Topic: [PATCH 2/6] x86/cat.c: Fix CBM for non-root cell w/ root COS.
Thread-Index: Adb5f4HiGhqrMBl0RNyUOg6lMin2rifrUZ+AABfP4sA=
Date: Wed, 25 Aug 2021 09:38:42 +0000
Message-ID: <AS8PR02MB66632609691667C24AB23E92B6C69@AS8PR02MB6663.eurprd02.prod.outlook.com>
References: <PA4PR02MB66709EAFB592AB3A984173B0B6B59@PA4PR02MB6670.eurprd02.prod.outlook.com>
 <fc2280e8-7800-2a80-a886-32179af203f2@siemens.com>
In-Reply-To: <fc2280e8-7800-2a80-a886-32179af203f2@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 85b05cfa-21dc-472f-1849-08d967ac2043
x-ms-traffictypediagnostic: AM6PR02MB5348:
x-microsoft-antispam-prvs: <AM6PR02MB5348201101D013AE7DBC3521B6C69@AM6PR02MB5348.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YtKA9vHm2bxQqPj6y6CcjGtvYwa8MMCMK/ChmRqvxuOvwzENDbE5UpfHc60/wcUZL6zpY2sw6nl07PVUBnCcLopzs3Agfx9XuYyuqABvwIpZcB39mzhDzyZdWDyihO5o1XCu63ySlusHC4EV3T05HkzfbPIo6QchL2QjOYvHQEok1bCLbzslaGMwZ9Yo0JQtWO+IoLQYcHkZnDNJ/qnBGk1FzWa9Wqfm7lo2VtM4R9QsbWMVBO/ttRBYgAajBdJmZfT8lDQHVnrKRWeWF04Ps555JJJA3hjB/HH1J2pQ601Re18Jf6y2FWbOfSGH+FlsMHSPyp9UOFMHQDlJEszGm35jwLnS4JAVTS5P4Vuck6rUOcNrVeyrKsMKjQrL5m6MlK4dv5mTrfhDIPsAjvNzMr1K9qA2/uOSIF8ORd1CGFHPkdJLgeEdoFpFEac4uvl8KZQSt9CQFOq5i/Ghb0lyL9HRRfOJzQk7koZqkLdHKo3dKmTuOAjRdjRG99rPtb3sGvc5gWdn2r2PGX/Jc4p+zGbYsz8gmEbnPRDbLGGjBCMNP2M7K/l+OjoblXdkVWfsdgQXnFjG1bxviziWcojYYdJOlodkN6xkIYh/MuddusUwpt6ij2/CtozrAMAeO8qF6kpfgxHd1GzMDpvAFvZoxvqJercULpvCM1OkzREej0Qyp1b0xZzJSJnLo/YtrVmllbuIgsb2pjTtw/IgB+U5rw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR02MB6663.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(39850400004)(376002)(346002)(366004)(33656002)(83380400001)(86362001)(478600001)(5660300002)(52536014)(9686003)(76116006)(122000001)(66946007)(8936002)(8676002)(186003)(26005)(66476007)(66556008)(64756008)(66446008)(38070700005)(53546011)(6506007)(7696005)(2906002)(44832011)(110136005)(316002)(38100700002)(71200400001)(55016002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c2wyZlBBOGpWTEFrS1VDNWROZm9LTE44R2lySmJZMmxIVTVqY1RlSUFkWnA4?=
 =?utf-8?B?NWpDRG1LOXltaFNCR09zb0NYK1ozS0hFNFZXUnpmSzhaRExWdll5SUwwN0xB?=
 =?utf-8?B?enRVNVZvektqWm03YWlwZVo4WTgxTko5eEZ2OEh6SGpobmZDRlI2VmZlMHhs?=
 =?utf-8?B?V3lXYWUyWFVhY2ViVjdDVnFia3pKM2RNb0FFSk1taTlSZk0ySG9yTytPL2Jn?=
 =?utf-8?B?UzdrQ0IvSDBDYlNFZ1d5ODZIQmhkbFVGL2RaTFlpdXBQbGZmcTdUcjRBdGJ2?=
 =?utf-8?B?cnpERHBBcHUwT21rekROT1MzdVdJRWF0VW8xWUxsR0NwR1FDbHVwRHFEWHlP?=
 =?utf-8?B?NHZuMC9BdWNJbHNLdFZPUG1kemF3YWRENkdSMGovQ0tqR01EM0dhSW8rdXFL?=
 =?utf-8?B?L1kvWGNhMmRxd25kUEczQURSU2srSTFySzVzaU52QmNmQTJkR1k5L09wTnFy?=
 =?utf-8?B?cHFBUlV5bm1PZGxlSVh2aDhKa2NLbGxhRVhkQXd2eGdBcUFaOEJnUEhzNEZ4?=
 =?utf-8?B?S09vSnhVeUV6d0IybEEwNGFKdzFVbEdObEVMeFJSVjlNZGlpVXBKaW45NTdv?=
 =?utf-8?B?YmJDU0ZxY3oxTFhVdURrVk9HSWZNN2xrQ09yZi9BTTFqNXl2Z2dKRHZOdU82?=
 =?utf-8?B?YVNVa1lsejdKSVdoMjZFSlhNUFJlQVQyaTNQVlo0OWJveTByYnpVaU5JT2VP?=
 =?utf-8?B?THlVS0h5RkdLV1NpTC9SUHU5M0Zrb0gvU3dJWGEzaE0zaWcxNHc4Wkc5blpK?=
 =?utf-8?B?OVhRdXZ1UVltU3BIOGJwSVBIcGhUeEdMbzhLVVhMOG5LeXdPaXRoNXMyRTBN?=
 =?utf-8?B?eVVLYzRsN21mdW5abUdlRHRXeUc5MS8zTkg1M2lYR042VWIveDZneFh6RVEv?=
 =?utf-8?B?SWV1a1NiUVVEWUxkNE8rR2xsUjgzTE9SRzV0b2hlMVBPRmhtVnViTlhMdUNx?=
 =?utf-8?B?dng1bjRuK29yR3BYZ0dTdDZuVWY3QTVkczJwei8veDExdjNZenNUQkY2UlN3?=
 =?utf-8?B?TXhCRmJtc1RkS0NraTZaV1paLzBNK0IzbkM0bjhMTHFJM0U3eVhmL3RTWkhp?=
 =?utf-8?B?VWU5Y005Um1ISjhJLzVFS1lQVnlTemJlOG4waHZFMGROQ0VQMFJmK2xxMXRT?=
 =?utf-8?B?WGx2MlU4aTZOY0U1aVc3aDRUVDBnQk5uVlVONHpHQ0VqdEp3a0JQQmdUdzVv?=
 =?utf-8?B?OGtyWTBsWU9kejByaWFTa0pYS2loc3M1SXduMHNNYzEzRjdUSjluM3l5YUNC?=
 =?utf-8?B?SUY0OXZKN1RHT3B2UXBCWFBZSytIRk85bmtqTjRqOGxIUGR1YkQvMFYxZkhS?=
 =?utf-8?B?RTRqdEVELzNIQ0NBQTNBVFpaT095b2hzZ1BJR0J6blliS1ZPemhDWWdRZGpj?=
 =?utf-8?B?Y2hQV3dCU0FjYWRXOVI2MU52NzRFdmdGVkVRUVJsOHFLWEJWcjU5TzFFdmx4?=
 =?utf-8?B?a2JLcHBuSHI4WFhneC9RU0tvd2pIemVod1pKWkE4Q3NHaElOaGxOTERxODdB?=
 =?utf-8?B?MGdpZWU3dThzNzdUenJZSEpBOWRIWXlJZW1PZGxZOUdKbFBqNXFRZ0NTQVE0?=
 =?utf-8?B?ZStKS2VsY3VyN0djRFBLSUlXZHhpMGU1MzI3eXBYS1NQa0lUWm8xcy9JeVVm?=
 =?utf-8?B?bFV0ai9obWFpeW9sRnc1c08wcDVvbnVWTE9CdHpvSWsyN3oraW16cDBUQThT?=
 =?utf-8?B?QjIwaXhkMzRmK3lXRVdRcFZaVXMrc2tWVEZPZGNsOXQ2L2NJMVFmV3pOUXhz?=
 =?utf-8?Q?xJkoOTFUvv/GSM9S5m4REH5d+2fZHIQvwGDcAZv?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: prodrive-technologies.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB6663.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85b05cfa-21dc-472f-1849-08d967ac2043
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2021 09:38:42.2053
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 612607c9-5af7-4e7f-8976-faf1ae77be60
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pQmSqbMADNqU+Yy2RJmZekhe3TJBOiYhj24qbwfFSIQknQ34ZiJF729U+XnGgRobV+dmKCCsboJV7hcwKJPoldahhuVm+OwerCPs6ETYa3lZdY4+Zbxua1ebLbESaph/KuL2V2wcB1KlBr3KIyr32Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR02MB5348
X-Original-Sender: bram.hooimeijer@prodrive-technologies.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@prodrive-technologies.com header.s=selector1 header.b=eM9AxLzv;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass
 dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com
 designates 40.107.0.100 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
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

> -----Original Message-----
> From: Jan Kiszka
> Sent: dinsdag 24 augustus 2021 23:13

> On 02.02.21 17:44, Bram Hooimeijer wrote:
> > The procedures for shrinking and extending the cat_mask of the rool
> > cell affect other, non-root, cells as well, if these cell use the root COS.
> > That is, when cells are configured without cache regions. The code is
> > updated to reflect these changes not only in the root-cell, but in the
> > struct corresponding to these non-root cells as well.
> >
> > Fixes: 3f04eb1753bb ("x86: Introduce Cache Allocation Technology
> > support for Intel CPUs")
> >
> > Signed-off-by: Bram Hooimeijer
> > <bram.hooimeijer@prodrive-technologies.com>
> > ---
> >  hypervisor/arch/x86/cat.c | 31 +++++++++++++++++++++++++++----
> >  1 file changed, 27 insertions(+), 4 deletions(-)
> >
> > diff --git a/hypervisor/arch/x86/cat.c b/hypervisor/arch/x86/cat.c
> > index f6719b1e..42fd83d9 100644
> > --- a/hypervisor/arch/x86/cat.c
> > +++ b/hypervisor/arch/x86/cat.c
> > @@ -60,6 +60,13 @@ retry:
> >       return cos;
> >  }
> >
> > +/**
> > + * Merge available bits in the CBM back to root by modifying the
> > +cat_mask of
> > + * the root.
> > + *
> > + * It is the callers responsibility to call
> > +cat_update_cell(&root_cell), and
> > + * to modify the cat_mask of the non-root cells sharing the root's COS.
> > + */
> >  static bool merge_freed_mask_to_root(void)  {
> >       bool updated = false;
> > @@ -86,6 +93,7 @@ static bool shrink_root_cell_mask(u64 cell_mask)  {
> >       unsigned int lo_mask_start, lo_mask_len;
> >       u64 lo_mask;
> > +     struct cell *cell;
> >
> >       if ((root_cell.arch.cat_mask & ~cell_mask) == 0) {
> >               /*
> > @@ -125,8 +133,17 @@ static bool shrink_root_cell_mask(u64 cell_mask)
> >               }
> >       }
> >
> > -     printk("CAT: Shrunk root cell bitmask to %08llx\n",
> > -            root_cell.arch.cat_mask);
> > +     /* Cells using the root COS are also affected by shrinking. */
> > +     printk("CAT: Set COS %d bitmask to %08llx for root cell",
> > +            root_cell.arch.cos, root_cell.arch.cat_mask);
> > +     for_each_non_root_cell(cell)
> > +             if (cell->arch.cos == root_cell.arch.cos) {
> > +                     cell->arch.cat_mask = root_cell.arch.cat_mask;
> > +                     printk(", %s", cell->config->name);
> > +             }
> > +     printk("\n");
> > +     /* However, updating the bitmask once suffices. This can be done
> > +      * during code execution, no suspense required. (SDM 17.19.6.3)
> > + */
> >       cat_update_cell(&root_cell);
> >
> >       /* Drop this mask from the freed mask in case it was queued
> > there. */ @@ -201,8 +218,14 @@ static void cat_cell_exit(struct cell *cell)
> >       freed_mask |= cell->arch.cat_mask & orig_root_mask;
> >
> >       if (merge_freed_mask_to_root()) {
> > -             printk("CAT: Extended root cell bitmask to %08llx\n",
> > -                    root_cell.arch.cat_mask);
> > +             printk("CAT: Extended COS %d bitmask to %08llx for root cell",
> > +                    root_cell.arch.cos, root_cell.arch.cat_mask);
> > +             for_each_non_root_cell(oth_cell)
> > +                     if (oth_cell->arch.cos == root_cell.arch.cos) {
> > +                             oth_cell->arch.cat_mask = root_cell.arch.cat_mask;
> > +                             printk(", %s", cell->config->name);
> > +                     }
> > +             printk("\n");
> >               cat_update_cell(&root_cell);
> >       }
> >  }
> >
> 
> Valid point that arch.cat_mask for the sharing cell gets out of sync.
> But what is the practical impact? We don't run cat_update_cell() for sharing
> cells, and cat_cell_exit() does nothing in that case. This is first of all to
> understand the impact of the issue.

Fair point. I am not 100% into the details anymore, but I guess you are right
that this does not have a practical impact. Of course, it can get a practical
impact in the future if someone decides to use the mask for something, so I
thought it would be good to fix it regardless.

> 
> If there is impact, I'm considering to use (also) a mask pointer so that there is
> no need to walk all cells on root cell updates.

Just curious to get a better understanding of jailhouse: would these walks lead
to a performance hit? The other cells would not be preempted, right? So it is 
just a list linear in the number of cells?

Thanks, Bram 

> 
> Jan
> 
> --
> Siemens AG, T RDA IOT
> Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/AS8PR02MB66632609691667C24AB23E92B6C69%40AS8PR02MB6663.eurprd02.prod.outlook.com.
