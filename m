Return-Path: <jailhouse-dev+bncBCJN5Z66VINBBEGTUP7AKGQEI25GYZQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id A97C62CD717
	for <lists+jailhouse-dev@lfdr.de>; Thu,  3 Dec 2020 14:35:12 +0100 (CET)
Received: by mail-wr1-x440.google.com with SMTP id g5sf1253975wrp.5
        for <lists+jailhouse-dev@lfdr.de>; Thu, 03 Dec 2020 05:35:12 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1607002512; cv=pass;
        d=google.com; s=arc-20160816;
        b=TacTdSolN/LeOPv3VTAvQ3QJoSfAvvPO52t0pzI5GIf++ksqwjZ6wDfINScc4+kvD8
         8G+oBwvGlAbQ+qDpy9UAa98IDYU0KWRyDr1bCbEdTasfZUMsFvibsEZQXSnqKdmptOMm
         mpn2AbsVSPZiu68Tq5HNPPPZEDgwIzHizM24b4I0S/0SGaTmd6oCgGB/sEeKlsyGNTXB
         7Tt5focXw5tIwDR7+mS55lzZIRdlKAkwjjHOGF3vlkGJhU6g8oj5sGzzhwfxHGdyxe2b
         nL6eYSEawV8AizlpE71HZWudq+KbtFUq5NuB11BuSnIMBwmuYJh2l0kvEpxTgjY6GkZ3
         m5jA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from:sender:dkim-signature;
        bh=XgswfV35Enbp2ADaUn2WaSR4LLtkc19vwZCWs/wDPlg=;
        b=sjC3n50b6/n+5NG4CP5a0RKCw0yD3mJQXp3u1lXG30J1S6ZtdUfNeEw7JP4sjX80S3
         jKsE1uiL0u1HcqVySNXCj9nrWGwaufbrLrx8p5qPu4q/gLM+hh+/Rc7DCz4fhIIqlnyX
         Ev6M7Fcdczk6YsVwqY5RCYQ5qDw14WXvK41zyKMEwjQLqLLCWRLZNHX/dpf6keCRPaf3
         hDaWuf+xGjzWHNKNbyCW3Wumkpa06LVsQHN+uWrtsYRCOt4jtFJRiWCot+BQJLnD0jOr
         I7/6UVMciHMeY9ifWUlYEvqoPbuBknuOPLyvIj075i5TMJx8WDU3M7WvQQ6lzpp/MPl6
         VSlw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@ikerlan.es header.s=selector2 header.b=smjklq1A;
       arc=pass (i=1 spf=pass spfdomain=ikerlan.es dkim=pass dkdomain=ikerlan.es dmarc=pass fromdomain=ikerlan.es);
       spf=pass (google.com: domain of msainz@ikerlan.es designates 40.107.9.98 as permitted sender) smtp.mailfrom=Msainz@ikerlan.es;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ikerlan.es
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=XgswfV35Enbp2ADaUn2WaSR4LLtkc19vwZCWs/wDPlg=;
        b=ZsffLxqs/JstpwQdzZvYxHUVjfUG0cYihm1m7SHTX8B7cwCA7L0jk8FxGItWbJA1qv
         95xHEftPeAdLrfLt4uPNurH9/x5jB1UNhTYxcflwq/Vp95N2VLfotGT/MAA20aehsqyv
         X/YzdpLJJx+bkKVEG8Z+ktxgsK0oNPEyD5y8Hiqf0Fphn5raA0OBe86VmsEoCq640ATa
         XRBJNf7uGZ+yP6WOD8dkbcBeblPm8mJEODHIlWjj2YUhi3vBINtA+sKmd+nLZNGIqFGv
         yWWEL8UiMC9DfRtfdJ1duqPtibVW78tAKpff8lkBjViGwUgb9FQdrrk7Y7FH53SBLprs
         bxgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:content-transfer-encoding:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=XgswfV35Enbp2ADaUn2WaSR4LLtkc19vwZCWs/wDPlg=;
        b=VjSDHnCU7v8Aghg73HNlClRgWfBO9I99++oaEJL0RP1N4beNEsGzKgkqRZuxSDYNRs
         x/N+Vd4q4+lnPSCaBs2+QffOMmxxXIdip26EpcoYkVBi3KtRqy7f/+pJ1YsZGGcnV5ro
         6s6tz+fNfT5XVT+nrYQVdJDS2begOWYYq68Eua6rOUNmsGizHIRFUYX6Ouukjtv/mKzC
         9DYlQzzdvZ2sAMRhozRS2VSJW9Ygav/Oe4mvm4QptSJF2HC8smYcXj4TJXvA7+P0oHCy
         kY0hH5FstypNlqcFDjZhb1BpHByhRyJUBy+pOauEVx7rhYKLaW4E1u3/1gOTIPnybWAj
         7XQw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM53313G03UyeO/j5VTXdRB4W7dlZSccAo/bvzXOZ3YXfyKHiWW6IQ
	xcMdBp7kM+T0fCeAGaQWvo0=
X-Google-Smtp-Source: ABdhPJzRbHcZMlbAVVMuiQNxbIdTUIQ151nuAlTm6dmniHHRNkJ8l0x3PAlDbO4Il225ld8UWxQe8w==
X-Received: by 2002:adf:f08e:: with SMTP id n14mr3695843wro.136.1607002512388;
        Thu, 03 Dec 2020 05:35:12 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c5d2:: with SMTP id n18ls2600705wmk.0.gmail; Thu, 03 Dec
 2020 05:35:11 -0800 (PST)
X-Received: by 2002:a1c:a5d4:: with SMTP id o203mr3402137wme.41.1607002511414;
        Thu, 03 Dec 2020 05:35:11 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1607002511; cv=pass;
        d=google.com; s=arc-20160816;
        b=c6j2w7ixD3a7BjgeL6LzCgcfYaa6qcvB99buoWEKLnU6L53CaQ7QT23TqfgxqEZ2PD
         v5ivQGOKjXUnTKBck73ZTXkF41tZGgDgnDdR+swDoczuPj7uhGI0BHg4K7Egs3XGep/C
         3uisZbCO1nUAovOxCjWL/uEdJElIe3UUW2mTKVsWJFPwIdualGukPLB59SrzzfPQKNfL
         kwAyo5DdCpHDqV+u4mEGPD+7wczqI6VbZ8fnj3MMZm3PHdnjtLpTC+FrjW/J/2fekBgk
         9GPK8GLQKUuqNMJxuOiTasiRkjygvBjOMSB14twn6GvVaKLFyW8XV90uFgU9+OeqCubK
         koAw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature;
        bh=Xj7d432h8WrpmXbjuE99kBLBs+0/r/IXO4wuc++I5oc=;
        b=oaYs4o6XHovdD3y87MBTECRkeD3VJGYxC+BaosgIZGQ+duUTAyMs6jZZB5CJrrC/PT
         Rp0Hsp2QwqNmbCF5OelnF52u3W8Q4LkgJoJd1HDVkLYkiZtyYVyxjfyRQNudxS4b1Jd4
         Uako+Mmd1taXGTM/86qLnJhaabMip9CXS7M2J4NaKx2ZhdMtL8Bm36pFY21FYtiRo99Y
         Wi4/CMUmL1XWJMULdOTjldWE4oOumSB1dk9/wnzeYzMJ9/vyhG6DMfHXmni7l7DLo2Uc
         vJBzPDEqAC4Af091drBEAkkVWIDHDaACIn7bNgdMlIYT3X1XSLs55xFriCOF1Gu2jAMk
         GBlw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ikerlan.es header.s=selector2 header.b=smjklq1A;
       arc=pass (i=1 spf=pass spfdomain=ikerlan.es dkim=pass dkdomain=ikerlan.es dmarc=pass fromdomain=ikerlan.es);
       spf=pass (google.com: domain of msainz@ikerlan.es designates 40.107.9.98 as permitted sender) smtp.mailfrom=Msainz@ikerlan.es;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ikerlan.es
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90098.outbound.protection.outlook.com. [40.107.9.98])
        by gmr-mx.google.com with ESMTPS id r21si67678wra.4.2020.12.03.05.35.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Dec 2020 05:35:11 -0800 (PST)
Received-SPF: pass (google.com: domain of msainz@ikerlan.es designates 40.107.9.98 as permitted sender) client-ip=40.107.9.98;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W9M3O52FjCH31k2A0/6P7ImnS82LYtwAu6GgcKnSrjVO5QwdOviGJ9OqpOc6ktZoS1PYsdqdR80zKNeCYhL5nEb87UNqdfFLhOBxFYmAvTSB+/SfBsirJLyVRlwbA7SsPhUmsEgVdIDp65l6SNJ3ZYy7t81qB7RNhqSHUCwwqw/G4AJTssrtRZbtRxxCHbcsNNFeBuE7WWoKgYfJslsZsjEFHoEUck0XcMH+kOcA11t95FE+ek0tKCHop5rQURuxZrS3XoTR97yzMV707Gj6PkZE0ykqiAj7IKHcJbnLzdkqiBfGtThXCbjNXYPPzkeo4Wja0ukk24qyL0d2WTMrRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xj7d432h8WrpmXbjuE99kBLBs+0/r/IXO4wuc++I5oc=;
 b=XP3MmRn7PZYGrIUCX3WN+oSnpagLHflDOeQKS8yWEcmmvNsHejyC2PNzQ2TsksTO7jmBeZjoeuSsJqy8QunDaYOM0xNlA7ICggV6APQosYhY3XTPyioLPInFbIH11hWPbCJGowAK9+Swl3mJq3RTbFJSxnWF9J1XOLTR7B65alpChA57HvsDz7Bf8X6nWQhQnBM2fuE01zo/B+oXKbYD/lxdTGiIiJoSRWCgeFo3oi/DiLKB0b25uFWnD3uVLXMl8BJpeDCaOJo/rN8I5eM6mgk36WxffQ4qg8HYWjBRDI19PwWSGDOyXcju+Xf8T+1vFSsu2viqucjGp8emSMEILA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ikerlan.es; dmarc=pass action=none header.from=ikerlan.es;
 dkim=pass header.d=ikerlan.es; arc=none
Received: from PA4PR03MB7184.eurprd03.prod.outlook.com (2603:10a6:102:106::13)
 by PR2PR03MB5292.eurprd03.prod.outlook.com (2603:10a6:101:1b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18; Thu, 3 Dec
 2020 13:35:08 +0000
Received: from PA4PR03MB7184.eurprd03.prod.outlook.com
 ([fe80::e85e:1f1d:9e71:5cd7]) by PA4PR03MB7184.eurprd03.prod.outlook.com
 ([fe80::e85e:1f1d:9e71:5cd7%6]) with mapi id 15.20.3632.017; Thu, 3 Dec 2020
 13:35:08 +0000
From: Sainz Markel <Msainz@ikerlan.es>
To: Jan Kiszka <jan.kiszka@siemens.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
Subject: RE: JAILHOUSE_ENABLE: Input/output error
Thread-Topic: JAILHOUSE_ENABLE: Input/output error
Thread-Index: AdbHtiGRUAQsxEsASE+5aK3baCkPlAACrWCAAAAQERAAARHbIAAEC6+AAC2xMaAAAqGbAAAAEPrgADhtfrA=
Date: Thu, 3 Dec 2020 13:35:08 +0000
Message-ID: <PA4PR03MB71846A56477610902A29AE7DB6F20@PA4PR03MB7184.eurprd03.prod.outlook.com>
References: <PA4PR03MB71848B9D591CE51C322E5F9DB6F40@PA4PR03MB7184.eurprd03.prod.outlook.com>
 <e4361d78-779d-dcfa-da6e-fcb8ba4476c9@siemens.com>
 <PA4PR03MB718436DFE4DECCCDA1A7DEBAB6F40@PA4PR03MB7184.eurprd03.prod.outlook.com>
 <PA4PR03MB7184E05AA2075FBE9EE0F931B6F40@PA4PR03MB7184.eurprd03.prod.outlook.com>
 <91a25596-5d4e-ff7e-d64b-b407648ed2b4@siemens.com>
 <PA4PR03MB71849EE161653DBBA71FA26AB6F30@PA4PR03MB7184.eurprd03.prod.outlook.com>
 <965e7e12-274d-42fd-2303-8a4b82ae8fa8@siemens.com>
 <PA4PR03MB71840A37E0D9AB045A451369B6F30@PA4PR03MB7184.eurprd03.prod.outlook.com>
In-Reply-To: <PA4PR03MB71840A37E0D9AB045A451369B6F30@PA4PR03MB7184.eurprd03.prod.outlook.com>
Accept-Language: en-US
Content-Language: es-ES
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [193.145.247.253]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2694c3ed-e112-49c6-17f4-08d89790408a
x-ms-traffictypediagnostic: PR2PR03MB5292:
x-microsoft-antispam-prvs: <PR2PR03MB52922D6F87E0C169FB7EB685B6F20@PR2PR03MB5292.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 03jzSP5PTvalTsmmzgvdygte+J2MH+/lvKksOfMK7IRTbRv9kgL5sxVCB3GoaENyjXa4g1VNKoUKbdJOGHaAFrVOMCEahdU0UmQV39L9DbiN3lT2IlAsw07U0AxfjNwrJLsJrxAvELXKP3S36EUGdag9RPMt/SprXLLPUYAZTm+FmVPcG+rU4uhUhMPzTsHDTWZYdjRpiJ4e/B+OzPf5u723a3BHtaSvTMEIqT4tNSFRi0IB6T7qTB9nIBx7/e9pF9rMhHAWloLgP1yLzA5DYJskPrISyGvHSXbAuemwW2cH8cvSjz8Hy4WnS2ZL3YhRXO9VsiuPE2Axxu+UMnOa7A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7184.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(136003)(346002)(39850400004)(396003)(316002)(8936002)(7696005)(26005)(64756008)(52536014)(9686003)(2906002)(76116006)(66556008)(66476007)(186003)(53546011)(6506007)(83380400001)(55016002)(66574015)(66946007)(66446008)(478600001)(5660300002)(8676002)(71200400001)(110136005)(33656002)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?RmY3YlhZdk91S25PUi9GM1o4MjdCNktDL281QTVwTHlzUUwwa2ROUW1nMGh0?=
 =?utf-8?B?TEFqT0YzNEcwVVZTSmtFRlJ4NHcwd2xsdytlZDJSVCttRGlObmtRMnhBaldR?=
 =?utf-8?B?TTZ3VXVWcUlzakdFc3dzQ3RMVC9uYkhOeVhPQzVITnM1UFlacTByR090K2RV?=
 =?utf-8?B?c2duUmc5N0Y0ZFBBYmZDMEJyQU9NeXpmYVdvWnZnMEl3M25QYXFJSGdhTmt6?=
 =?utf-8?B?Vkk0M0JqZFM3czcvR09yaTFZWkd5ZVVnOVM2YkkvKzlEaXJRTnJKaVNtSHZh?=
 =?utf-8?B?dTNVV2Yxcjd5VFY0ZEV0RWFESEtvbGE3Wm9vV0hycEQ1aGY0dm1jcU0ydjVH?=
 =?utf-8?B?MGl2SDVoWDNsT0p0Y3lyQzRGdkVnbjFVUVI2b1Y5VjY2a1dVNTFGUmV6bjJj?=
 =?utf-8?B?Y2tDMlZHMXFuczhnNmFjRW9SaWJ5K0RHZWNMQmU5VWlrcGwzWEo5d0JhbVE4?=
 =?utf-8?B?QWpFNVJ3WVNCN2c2SmdtR1BaT1d6RDU4MXB4MS9ydEN6MU5uTmxJd2ZDbE5i?=
 =?utf-8?B?eFh4cUliRmI0UFdpdjhXWGYybVRPME5xTG92dTdkb0dzMEVWSjJ2bFFNS2FK?=
 =?utf-8?B?eVZObHBJRlFhbTIrS2lITUo3TS9ZMEdvSlM2dmk1OXMxbE9yRzE2bTdPbjJG?=
 =?utf-8?B?cHpmVGVJUTVXaTQ0R21QYWdVbWd0cU5PaVdCZjJnTm1KQkhTMFpJdlpUSWNQ?=
 =?utf-8?B?eTJOWHhMMjhzMzl3U2h5QThzS2xKQytKN0k3THZ4V1oySm1Qa25oTzVWL3lE?=
 =?utf-8?B?R0FhK1NhVTJndEpQU1EwTEFYcGRWUHc1SFZKSVpIY0ppMlhUcmZ0aVdQSmVX?=
 =?utf-8?B?akJDMitidVd2NExOSFo4dTRuazFnZGdHQWl2YjdHR1ZNYmhFb0tVYjdoQ1I3?=
 =?utf-8?B?Z1pwYVhOUUpQaGk2Zkw3aTBSb3BYZ3gzUHJWOWhOd3pQSTEvYjNHSUcyOW1V?=
 =?utf-8?B?MEN6SWVjOUh4Z1RXb2tXbkdzcHBhNWFyVmd5ajFhRDJRekh0QmI4UmJxcTl3?=
 =?utf-8?B?eTIvUzdYTUpxY0lVZUxob3I5empQWE5tYnkvQ2V1ZkRZQkdSUEJlOS9lNDlw?=
 =?utf-8?B?UVp1REcvUjVJbmxWS1dmTEd2d1JwSW05S0VWb2ZrYUNIaG1pZXRxQmE5aEdO?=
 =?utf-8?B?dy81bUtoR1lLYVM5WXdqcS9xWVR2d1NJc3FTcEJoVEVNMGZMYWU5TmZISmRa?=
 =?utf-8?B?cFhKQzBhL24wT1JYV0tLbE5kcDUyUUxTUlc4ZFA0NGgyZTQ3THFPL25xVzJR?=
 =?utf-8?B?UmN3bGJzZXg4WnFVajFLVitoRmpUSkRCd3lVWXpsY3liNENCNXZMUjRpa1J6?=
 =?utf-8?Q?vO58z18uZY04U=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: ikerlan.es
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7184.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2694c3ed-e112-49c6-17f4-08d89790408a
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2020 13:35:08.6114
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 910ac815-f855-4a08-bf29-90b46552cf11
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zl1tW6OlLZIKqZCT3PyzxG0mSQNe032PB+zSmnvZjc+Xr1cdaWi3iVtgRjl0OV4AszX+ULRuWz+ImLReXGfdvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR03MB5292
X-Original-Sender: msainz@ikerlan.es
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ikerlan.es header.s=selector2 header.b=smjklq1A;       arc=pass
 (i=1 spf=pass spfdomain=ikerlan.es dkim=pass dkdomain=ikerlan.es dmarc=pass
 fromdomain=ikerlan.es);       spf=pass (google.com: domain of
 msainz@ikerlan.es designates 40.107.9.98 as permitted sender)
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

I've been struggling with this with no luck. Any ideas of why this could ha=
ppen? I've found no info at all about this two checkitems, apparently with =
the VT-x virtualization enabled should be enough...

Markel.

-----Mensaje original-----
De: Sainz Markel=20
Enviado el: mi=C3=A9rcoles, 2 de diciembre de 2020 11:38
Para: Jan Kiszka <jan.kiszka@siemens.com>; jailhouse-dev@googlegroups.com
Asunto: RE: JAILHOUSE_ENABLE: Input/output error

The ouput of the command on the VMWare guest:

msainz@ubuntu:~$ sudo jailhouse hardware check [sudo] contrase=C3=B1a para =
msainz:=20
Lo sentimos, vuelva a intentarlo.
[sudo] contrase=C3=B1a para msainz:=20
Feature                         Availability
------------------------------  ------------------
Number of CPUs > 1              ok
Long mode                       ok
x2APIC                          ok

VT-x (VMX)                      ok
  VMX outside SMX               ok
  VMX inside SMX                missing (optional)
  IA32_TRUE_*_CLTS              ok
  NMI exiting                   ok
  Preemption timer              MISSING
  I/O bitmap                    ok
  MSR bitmap                    ok
  Secondary controls            ok
  Optional CR3 interception     ok
  Virtualize APIC access        MISSING
  RDTSCP                        ok
  Unrestricted guest            ok
  INVPCID                       ok
  XSAVES                        ok
  EPT                           ok
    4-level page walk           ok
    EPTP write-back             ok
    2M pages                    ok
    1G pages                    missing (optional)
    INVEPT                      ok
      Single or all-context     ok
  VM-exit save IA32_PAT         ok
  VM-exit load IA32_PAT         ok
  VM-exit save IA32_EFER        ok
  VM-exit load IA32_EFER        ok
  VM-entry load IA32_PAT        ok
  VM-entry load IA32_EFER       ok
  Activity state HLT            ok

VT-d (IOMMU #0)                 ok
  39-bit AGAW                   missing (optional)
  48-bit AGAW                   ok
  2M pages                      missing (optional)
  1G pages                      missing (optional)
  Queued invalidation           ok
  Interrupt remapping           ok
  Extended interrupt mode       ok

Check FAILED!


-----Mensaje original-----
De: Jan Kiszka <jan.kiszka@siemens.com> Enviado el: mi=C3=A9rcoles, 2 de di=
ciembre de 2020 11:35
Para: Sainz Markel <Msainz@ikerlan.es>; jailhouse-dev@googlegroups.com
Asunto: Re: JAILHOUSE_ENABLE: Input/output error

CAUTION: This email originated from outside of the organization. Do not cli=
ck links or open attachments unless you recognize the sender and know the c=
ontent is safe.


On 02.12.20 10:37, Sainz Markel wrote:
> Well, I've been checking the related components. My env is being deployed=
 into Qemu, using the same commands exposed on the Jailhouse Github docs:
>
> qemu-system-x86_64 -machine q35,kernel_irqchip=3Dsplit -m 2G -enable-kvm =
\
>     -smp 6 -device intel-iommu,intremap=3Don,x-buggy-eim=3Don \
>     -cpu host,-kvm-pv-eoi,-kvm-pv-ipi,-kvm-asyncpf,-kvm-steal-time,-kvmcl=
ock \
>     -serial stdio -serial vc \
>     -netdev user,id=3Dnet0,hostfwd=3Dtcp::5555-:22 -device e1000,netdev=
=3Dnet0 \
>     -device intel-hda,addr=3D1b.0 -device hda-duplex \
>     -kernel vmlinuz -append "root=3D/dev/sda intel_iommu=3Doff memmap=3D0=
x5200000\$0x3a000000 vga=3D0x305 console=3DttyS0" \
>     -initrd initrd.cpio.gz \
>     -display none \
>     -parallel none \
>     -serial tcp:127.0.0.1:1234,server,nowait
>
> The Qemu env is inside a Docker container which is being run in --privile=
ged mode to share the kernel with the host:
>
> docker run -it --privileged --net=3Dhost --volume ~/docker_tmp:/tmp
> selene-qemu:1.0
>
> The mentioned host is a VMWare Ubuntu VM which has KVM enabled with nesti=
ng=3D1 parameter:
>
> $ sudo modprobe kvm_intel nested=3D1
>
>  and all the virtualization configs are active in the VMWare config panel=
:
>
> Virtualize Intel VT -x/EPT or AMD-V/RVI yes Virtualize CPU performance=20
> counters yes Virtualize IOMMU yes
>
> Any other thing I should check? Any change that must be done in the outer=
most Windows host?
>

Run "jailhouse hardware check" in a first-level guest (can be any normal Li=
nux distro). It will tell you where VMware falls short in emulating VT-x.

Jan

--
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/PA4PR03MB71846A56477610902A29AE7DB6F20%40PA4PR03MB7184.eurprd=
03.prod.outlook.com.
