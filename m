Return-Path: <jailhouse-dev+bncBCJN5Z66VINBBQUPTD7AKGQEWBJCQPI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x140.google.com (mail-lf1-x140.google.com [IPv6:2a00:1450:4864:20::140])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0AD2C9B01
	for <lists+jailhouse-dev@lfdr.de>; Tue,  1 Dec 2020 10:07:14 +0100 (CET)
Received: by mail-lf1-x140.google.com with SMTP id r18sf682575lff.18
        for <lists+jailhouse-dev@lfdr.de>; Tue, 01 Dec 2020 01:07:14 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1606813634; cv=pass;
        d=google.com; s=arc-20160816;
        b=txCrC6Y0INS16xMNTecs76R3il6WIknHZDo19d9fDUxAkBSax2kEoS86Be9iAOJjAU
         QvXv7TFvFUeRX2/qCW4KsFPhQTaQOVTRPS/PjlDIfgejhUW0XkxShPYwOQrlY1C6/n43
         HDu+AqBh3N3oAxE71mtT5dZzaXNXDeLQVDVTiPG8jVhXWjZRdMnxlGyMZHzuOfT+Ebnu
         SMrKsh3rlYF/sH5nXkVzvK6cdHQKC2sBKdPdB4ywTu1beQtuVL5uG7YlksAhkpQKv+JD
         QTeRhyHNTg74hSlMwfSyx8GooqnVH0+ebyQ6aiPRZ3j8YUevq2+8bO4u1+7sUHQXjNai
         H0jg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:sender:dkim-signature;
        bh=ImYuaj2dbFM/uvJnmOfY2StF/a+Iqsm2G3m3NNSJ5Ls=;
        b=AhM2n1ZJWeY8k43YkyTi5xYZqrYiy3PqTGOSp3wtCcsMdpkp0Ta58+Orww26UuVpUC
         gVdrdY19+nN5gvdURqErM7uxY3BXaXZObdEQl+B6aGmupQ67TvzSKi1aJGLx+4c1H3JM
         9ZUEza0ehyKVMxE9oqn6gm0RD/3q8UO8N2vegGTq+Nrfef4RH4Ufnz5Jse9/lsazurDC
         Jgs+Dvv/uqY15BlZkUpkdhOC/bNFLDeflJQnEPDl4ZaNi3BvNEFWA1DmP0WtTBqZJeUX
         n+99UkPu97i2F09BFY1WiuNUKwkZhJrAZvZGPsw326OV2hp87KACAUdMapB/gq2Syoq7
         JSoQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@ikerlan.es header.s=selector2 header.b=Lsbr1HFk;
       arc=pass (i=1 spf=pass spfdomain=ikerlan.es dkim=pass dkdomain=ikerlan.es dmarc=pass fromdomain=ikerlan.es);
       spf=pass (google.com: domain of msainz@ikerlan.es designates 40.107.9.123 as permitted sender) smtp.mailfrom=Msainz@ikerlan.es;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ikerlan.es
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ImYuaj2dbFM/uvJnmOfY2StF/a+Iqsm2G3m3NNSJ5Ls=;
        b=SL6I0nMrABiXcQ5CV4fpysWCfkUYPsonW/seKIseWDiAGNDN6eztzFTIuANFq52rnv
         S1BGL3ko/NixLNrn8DrzpFCSDFtIGufGLO6nYQHffGHliBP7q5kM0Hz9nb4Q3NjYk+y3
         rtR1bs+FQWcvHbDf1RWPSvm4z+Z3WPymp6479trOd37Ic2k78PQml1PzXEbOhTtAkCMF
         p01/hjp4/BJLC8+lqY5dlhf5Yc2ToLuMJkabhIF/i468TVtZuwNStxU8NrArZvXLfdPN
         nG0XkhtWjqomCVMs2clfUtoA0z5SNYSuekb9FBNgVCzyGKvXzGlneOEl5ynHxq7v6wya
         bT5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ImYuaj2dbFM/uvJnmOfY2StF/a+Iqsm2G3m3NNSJ5Ls=;
        b=UD2vtDmnAjguyNWBgUW/5mTyjckFrnn8vxG8gdzsKDPxuui+Dr9wHaoqbmH0bqymDt
         Vp14kTLliAS7D2/cKqOrhlvywc818CJhiNhPfH3CvMRjpjbpoQRS1VWXekhpsGCA75pD
         FeMmrvZrgXT8njnbMW6GGKxNTlgpikgk+DCQBsQxoFlODEESHAHNUmQyOoUq1EKKdy/C
         VoeBY7+NoprfZuoerdBvBh9TC6GxCPwLSFYtFIJmUX2vXfsNIVF4K0ffyd842hE6G0vq
         BzBMpK9k3kGSt865h8YkR+IQQyZZLLlnOSzPuDHSc/b7KwvhYaBNyoLpKuh+JRm2jjU7
         p58Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532xWGfymdXaanXBRrZq3mtcoNLpOdQiYLH5oJCVR3akyVKnGpAl
	316qqYuE0tAqDil/BO6uHKo=
X-Google-Smtp-Source: ABdhPJxteMxemlSlvUXOVC5RC1yexh4LOBvk44jVUpGHCvwGJkFpaliz2CrN+p5idgkGg6siADaQoQ==
X-Received: by 2002:a2e:84c7:: with SMTP id q7mr807679ljh.415.1606813634314;
        Tue, 01 Dec 2020 01:07:14 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:bc2a:: with SMTP id b42ls209284ljf.2.gmail; Tue, 01 Dec
 2020 01:07:13 -0800 (PST)
X-Received: by 2002:a2e:9617:: with SMTP id v23mr857138ljh.135.1606813633245;
        Tue, 01 Dec 2020 01:07:13 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1606813633; cv=pass;
        d=google.com; s=arc-20160816;
        b=kPifmwztlVK9WwN1aqRnYNWfSlLxTClc5hDpBNAry3Bz4CpEjzO0x8jBE1mSIYeQov
         Qj2OyL39ozmQwYRT+c2OYNU/TXtoAp2iDiw+G0q8kbD53Yzz6cKCh4rw51Ll1ZNx+pR9
         P66G/3TOK0CXDiNqIp/n9PWndoYCzP0pbYXrCX4tpo2611FvH601OWbonoYh/dqtCiPk
         O/lKscntc4iF2CowMA3Td34mD0iVnVOzEefSQapQwiO3noRuoEDli5tOKZw494RsDM0V
         45Ll+TMtXv99XBiKLMKd1xphoRH3hGyIj0WiepYPgduDCWnaohr8koB6k6ilEKn84USw
         bbCA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature;
        bh=9OCxObb+97jr9Oue1cqATBOMJaQplL+C2QQXpIjmQmk=;
        b=bTj1AW0YRsauTPZxPUCZDmbiGY2CBsRY92nEkQgMyx+ZGQTAOaNo96eYPrbyvKxg9q
         Jm6arUr/pvoMK32gwfqnWnn6AlvgmU/hPQr9pMnZo8J0/EBgNpbBLQ/l84VtyfFds3Bm
         3PNGz19jAXwXWgXC7ApnsihTabaHzKigR0HvZlSz2Fskz3/Lg/bEyygavHoXGdyAaAI+
         D2VNRotIZWYGqqdBu1n4xPKK1PlaAAn873tyZ7ejERz1OiGBlwi/YO8zxV19L+/CDYSE
         1C4+bAEHQi5ye8eRXpHX6/Vbfl/fvddvMwt1PMxiUoydc5FprvwnSQLpS6yKdzcMIdlp
         1Iyw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ikerlan.es header.s=selector2 header.b=Lsbr1HFk;
       arc=pass (i=1 spf=pass spfdomain=ikerlan.es dkim=pass dkdomain=ikerlan.es dmarc=pass fromdomain=ikerlan.es);
       spf=pass (google.com: domain of msainz@ikerlan.es designates 40.107.9.123 as permitted sender) smtp.mailfrom=Msainz@ikerlan.es;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ikerlan.es
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90123.outbound.protection.outlook.com. [40.107.9.123])
        by gmr-mx.google.com with ESMTPS id h19si58670ljh.7.2020.12.01.01.07.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Dec 2020 01:07:13 -0800 (PST)
Received-SPF: pass (google.com: domain of msainz@ikerlan.es designates 40.107.9.123 as permitted sender) client-ip=40.107.9.123;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lb5DYSi26oIc8FgkS+dewcLQZgoMTM2jGSM2+1A5jkuTnQn0AwI+YYxsP+xmRIczDXglpR8HBEG191X7IZvrozl8MiRPvcfGKDfnhRZNSbWO12+KPmtIVXDxvxKK0TxCEuLpbu74htvLhGTs5joLMfjUJ7SeAe+Dsp4PMImV0fl6ucoNErg30FWwuGS7fmwTh7Vrv9g174jqDK8brKeaPmRjOz1Z8/jCjUzvG00ycOfiZRDiB0Tj0zmclQTHH/Sfqlll5fO7/wKaWt8MQu0tfLztcuF8Z87i0e+PgS+aE/vfeCN00oSJI8ydFCNWmilQwaSxdg7pVha4mbzEaUgDMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9OCxObb+97jr9Oue1cqATBOMJaQplL+C2QQXpIjmQmk=;
 b=IbU1EThlSAc0AAHETODG4hXo98cnZ7WQQ94YmddIzuoVttfi7rjxujOL1Tcc7XaNbNSC34JkvWQr80lVoYnX9m9tG7EXmmgevf1Cm+LZYLBESCLAcKxQJxN6qBdWxV7cJqcUWIUF0hAXks/gK+Qca90Uo4Z8Crg8omgkti3rTPkD1TJa+ocEsNTDmuGpt04CJOXJEKty4GvrfdNZcCW55NcdFMKY+QQw0Y7C43G5CNJ7rm4PM7GMDH1g6/KnLXAIzAdcTjXqZ2VeCubOirYKI5wRpVV6OghK3kqpCU8QhHDnH5b3BXZC1fR3hwC1Vhzu5SFX3Nzu3In6CEywq+jhUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ikerlan.es; dmarc=pass action=none header.from=ikerlan.es;
 dkim=pass header.d=ikerlan.es; arc=none
Received: from PA4PR03MB7184.eurprd03.prod.outlook.com (2603:10a6:102:106::13)
 by PR2PR03MB5339.eurprd03.prod.outlook.com (2603:10a6:101:19::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20; Tue, 1 Dec
 2020 09:07:11 +0000
Received: from PA4PR03MB7184.eurprd03.prod.outlook.com
 ([fe80::e85e:1f1d:9e71:5cd7]) by PA4PR03MB7184.eurprd03.prod.outlook.com
 ([fe80::e85e:1f1d:9e71:5cd7%6]) with mapi id 15.20.3611.025; Tue, 1 Dec 2020
 09:07:11 +0000
From: Sainz Markel <Msainz@ikerlan.es>
To: Jan Kiszka <jan.kiszka@siemens.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
Subject: RE: JAILHOUSE_ENABLE: Input/output error
Thread-Topic: JAILHOUSE_ENABLE: Input/output error
Thread-Index: AdbHtiGRUAQsxEsASE+5aK3baCkPlAACrWCAAAAQERA=
Date: Tue, 1 Dec 2020 09:07:11 +0000
Message-ID: <PA4PR03MB718436DFE4DECCCDA1A7DEBAB6F40@PA4PR03MB7184.eurprd03.prod.outlook.com>
References: <PA4PR03MB71848B9D591CE51C322E5F9DB6F40@PA4PR03MB7184.eurprd03.prod.outlook.com>
 <e4361d78-779d-dcfa-da6e-fcb8ba4476c9@siemens.com>
In-Reply-To: <e4361d78-779d-dcfa-da6e-fcb8ba4476c9@siemens.com>
Accept-Language: en-US
Content-Language: es-ES
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [193.145.247.253]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1b801fe9-5b59-43e8-1d37-08d895d87cc6
x-ms-traffictypediagnostic: PR2PR03MB5339:
x-microsoft-antispam-prvs: <PR2PR03MB533987F1149811BAE6599A77B6F40@PR2PR03MB5339.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: o1dqqfpD6n/wBe0S2BvfWwSdDm6IDKcNgZtuuBMNZamdbt2jVDaf5R+gR9RBOZUb++uQEMw4FXdFVCm6yxTXnt09we/1HinGNBpAE4Gkja9T8A46+OWoxpKC6uAnh3VgfewaKk7FwZ31BgXDCTuPMNAFVIV05Wmz/FPP/xRJCSplqH5rRgch2Hd5zziRYun57C9VX+Ce8emZZGgEcVDn89lHWEd0opOx3JiXsOafiCdroDjlnMr8b6nqYnuSoj2XYJlsLjY0zrsJxBolIVcrEEULh67pYtmtNAlvNfBwp/1x+r10Iq0NV+yOVwbPkyes
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7184.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39840400004)(376002)(346002)(396003)(366004)(136003)(55016002)(5660300002)(66446008)(9686003)(6506007)(53546011)(71200400001)(66476007)(110136005)(66946007)(316002)(8676002)(66556008)(8936002)(64756008)(478600001)(76116006)(186003)(33656002)(86362001)(26005)(52536014)(2906002)(7696005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?TkRocU9RNmFSU0p4SG5GdldQSUtBamR2bUpLaXZ6emNlbC94cGlGcDBvT1JH?=
 =?utf-8?B?RWlQaHVBUWUvQUNwY21KbFJqa255MjV6eGFXamE5eGhFM2RnK1o0aXZ0K0NX?=
 =?utf-8?B?OFluQVdQcDduaGRBc1VSbDZlamE3VTFZd3BRZmIvQ21jeURRckNYQ1lQeGo1?=
 =?utf-8?B?MFhudGdlcFRRRmZMVFIvSVdtT2U2UE9pZ0FSWVQzOGM0dWE4dGpCTHhiM29u?=
 =?utf-8?B?Q2NzQVNyTTlBTjQrN09MN0tLSTJjb1hjTnJNMzJHOERzdXlUQjFiZXlYdmlx?=
 =?utf-8?B?blZPNmk5UVV0SHZjZlRUSEp2K3dGQ3dFSHZRRUFTQUNRNWEvSUtsVUdKRVJy?=
 =?utf-8?B?QWJuRXdrZVNqdmh3ZG5yT1ZIc2lQVUg2Wi83Z1AzV1A2ZDhHb0FJODhoV2F3?=
 =?utf-8?B?aEh4VWNHT3pCNzFqNFA4SVBsemhNS2Ivc2RPbU5KZlpITWRYcDI0WkplWTl3?=
 =?utf-8?B?UG1XUnZSQ01wWWNXbTlFSFFad3FDYUVCQ2RVMGZoMFNCRmZHbUR5cVF1MzJP?=
 =?utf-8?B?azI2MlZGVUxOQTVvVHgvM3BLVFFCNE9BSUpIb2hzUVVQMktKTjFkQVZsOGw4?=
 =?utf-8?B?UWNLTGQ4UDJFSk5NWmtGa3R3L3RIeURxQis0aHJiRVFGMk5NaWhSTHRGY25w?=
 =?utf-8?B?azQxU1FiRk9WWit6czJDaGx0L29QelhwVENnLzJZUTg2T1I2NWlUTFI1dWdk?=
 =?utf-8?B?em9rWFJNSVBmRk82WERKVWJoRTNKMlJRTUI0S05LWUpxUi9lUXIvTFlteDQ0?=
 =?utf-8?B?NzRsTnA2SnIvd0lCZjNac3BrOE1NblBRZGUxd0kzQTByeU9ibnlDcDhhSXZD?=
 =?utf-8?B?TytZUVRvK0Rab1pnS3ZFVzZTQnhXcE9QNHZ1RkpBTzdFaTErbHhJNnlvMEZn?=
 =?utf-8?B?azhsSEpzTzJWUXdBSkVRaUhlWTlOWTlYNjhRTEowTVRnTW1UOTQ4cTVmYXdx?=
 =?utf-8?B?SWtOdHVCSnRMaWczTEhRcVJkMzNsbEJwZnlCb0o1eFE5WTJ4Ulk0NjgzQVR6?=
 =?utf-8?B?d1BKdXF6Wk5wa29JN012ZnVqVW0vOHhQWkgxNFlhTTRjRVkxZWdZWVhVVXpF?=
 =?utf-8?B?T3RqTFRHby9vZUdQSThkOWkzMUE0Y0x5OWZOMHdxVmdibjQyR0FPenF2TUNw?=
 =?utf-8?B?OVlvblQyM2hzYjMxNW15QW1ZV2trVXlXM0JsazIzMDEycHJrbC9hSXRzb1po?=
 =?utf-8?B?UGRXTFlHRnE4REp3YUVhcEFCOW1NMktTZlJpWFNqNVNNMDVIZk1GVEF5alU1?=
 =?utf-8?B?aXRXd2tSUEhZVzBQNHpHeWxXTnl2Mkk3Y1hDSFhxNmc4eEVybE56ZW9jRUdZ?=
 =?utf-8?Q?IQId8Nemj7w1I=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: ikerlan.es
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7184.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b801fe9-5b59-43e8-1d37-08d895d87cc6
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2020 09:07:11.0513
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 910ac815-f855-4a08-bf29-90b46552cf11
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f18/0T7ZAZgzZRGp+1rG65QYOTteL/LpvTpBkmHxtSTltS3q8L5UTF7CCzF8MjkPWwiC+dykspYEnpGK80kRaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR03MB5339
X-Original-Sender: msainz@ikerlan.es
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ikerlan.es header.s=selector2 header.b=Lsbr1HFk;       arc=pass
 (i=1 spf=pass spfdomain=ikerlan.es dkim=pass dkdomain=ikerlan.es dmarc=pass
 fromdomain=ikerlan.es);       spf=pass (google.com: domain of
 msainz@ikerlan.es designates 40.107.9.123 as permitted sender)
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

I did not. I'm running this on a busybox based Linux. No Python installation possible. I'm going to check the mentioned docs, any other output I could upload for you, not dependant on Python?

-----Mensaje original-----
De: Jan Kiszka <jan.kiszka@siemens.com> 
Enviado el: martes, 1 de diciembre de 2020 10:04
Para: Sainz Markel <Msainz@ikerlan.es>; jailhouse-dev@googlegroups.com
Asunto: Re: JAILHOUSE_ENABLE: Input/output error

CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you recognize the sender and know the content is safe.


On 01.12.20 08:48, Sainz Markel wrote:
> Hi there,
>
> After being able to resolve the cmdline issue, the following error 
> comes up when trying to enable the cell:
>
> ~/jailhouse/configs/x86 # jailhouse enable sysconfig.cell
>
> Initializing Jailhouse hypervisor v0.12 (197-g2f52a11d) on CPU 5 Code 
> location: 0xfffffffff0000050 Using x2APIC
> JAILHOUSE_ENABLE: Input/output error
>

Did your target pass "jailhouse hardware check"? If so, enable
CONFIG_TRACE_ERROR (see Documentation/hypervisor-configuration.md) to
get the origin of this.

Jan

--
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/PA4PR03MB718436DFE4DECCCDA1A7DEBAB6F40%40PA4PR03MB7184.eurprd03.prod.outlook.com.
