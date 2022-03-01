Return-Path: <jailhouse-dev+bncBCWKP54GYYIRB2ND62IAMGQEA56TPCQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id A17DE4C819B
	for <lists+jailhouse-dev@lfdr.de>; Tue,  1 Mar 2022 04:24:26 +0100 (CET)
Received: by mail-wr1-x437.google.com with SMTP id b7-20020a05600003c700b001efac398af7sf1404123wrg.22
        for <lists+jailhouse-dev@lfdr.de>; Mon, 28 Feb 2022 19:24:26 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1646105066; cv=pass;
        d=google.com; s=arc-20160816;
        b=RDS1RV+PRkq7tpgW0z08+3MgeU7+6qQOh8Com4YyMhg54qXAX4V1aR2ZQQ6VeRkCE1
         YgLhGQl8mJBDsnqlFxEhfWVobrUGHPA2vn6K3fjbVojyZXagVna4gG0W3POxmzwHo+fx
         VX0RqKgiUUyCkUfxArNQFHO4qUxo9DLgiV8eu9s74Jkwl+hPzmPuewuUMbRMERtKQmr9
         dEBuJK1vKkTuiql1TSxVNPbaiHFpoIFLbeHOlKSTvGDkUWJQWEcSUmQevKRttiVczV1O
         vLFTTXH7b22k1hjraeRUyTBqllDTl4f7BWWW1obWcVKO9obBrKCKeFLW7j6xfIvybtzO
         vVNQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:sender:dkim-signature;
        bh=hUbamt8TVuBiz5WLrIabMgTQl5BODIx854C0vEYwlEE=;
        b=WluRmMX2ZeTrfH1QzpOkAyis8ZQbtAM5ochF/SyWrX0jNTCJCuMdABriifzWusXFE+
         z9pi/eTLp2jn4R4yoRMyomi9vqZgrWZ642zg5/2DJ96Zz/dclqM+B+upE0RJYaY3TzBn
         9tOpxX7cwNT8lSyMovUvpLgB2y6etfOHOzsTPcuzmOoHQI1nfQh3W12PPBEdwfwJeaCO
         43DiRzvZ3lnCLq+wKDBrAWIoY6sHD9M5CKiQTYSl355TeuipBL1jv71Yi81bSAp7bQej
         srTzjnu1WGl/5O6jPXAckqmZ6q53pwzb1e9Yh4U+Kg7tvkKvsQlApEpwro0AU/S5S31Z
         mPiA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=Jt+oSo3j;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 2a01:111:f400:7e1b::61b as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=hUbamt8TVuBiz5WLrIabMgTQl5BODIx854C0vEYwlEE=;
        b=BtgpYbDI0xgfIBYd4+cFWvmvqMec68uA7Juqr/I9ePvkkoQFRJPAwtEFaH/DpRipz9
         gjoB2jdw9engR6uVPPtMGAXFPiJ58xrf3rkdS1sBOZyvKX4ecRxXUDQLpt3LP7UKrI2U
         y0toxOvas2w82zWJZ5Q/khCSnsEGKVIpe2kcDsWYHkNRZvIWHP8V1hZLqr2ViA1D07QM
         4y2Fm6D8B0CI2Vea5WwrgG6jza4Xx+OmYwEizW6Vsszwt4ud8EGIdZMHtrF3VEaVHQT+
         v7T9Bm1gEP8SFPVBMs1imjvwS4aFIIwfAg7pIxX1jber3glPQXJ0+Nwr+2MbJZqGNNH4
         oiLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=hUbamt8TVuBiz5WLrIabMgTQl5BODIx854C0vEYwlEE=;
        b=hmBp8dkcLntMKnU+Vs1NLUnsDNvmg45He2aeVC+OazE4bvQCaBPplRpbtWTJRLVaAR
         /leN8XDFi0V4x/z6/mpqtR+6sWz2ZFk8deEW4YpMeqOxqzHUzZf9FOUK0fNif4gA4Z+Z
         35chUskX2rYWYSjG/Iadb5V7VHCBhRRSFqonzeCGQc4XxqwL5GizPXByRVmkVALCNmNx
         BShcjoUnl7wnV4m3uu5K/qZi02Fwdc6C28WWkmdODlOnatftS0W2Rvn7EMnzMxzRAs1I
         9f3cMJ7blinOdjM0K+GTRbQ2PtwYdIc+PpVaJbupo4e7+VdXgjYiWBKXDEB4g/LmXn77
         4ttg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530UC/67Jh7k0DOnjiq8RQmowYsOL87ZZSDY4QglJ2YrCDaT19rX
	VCThzcU3mGy6U+cs7AAzxXA=
X-Google-Smtp-Source: ABdhPJwWe8e3FOLE1NVwqaBC2Vk3OgN6aQG2cx62L2hL7iGjNjBtrgPWIKlk7meyCqI2x4hGIy8l2w==
X-Received: by 2002:adf:e343:0:b0:1f0:7a2:99f2 with SMTP id n3-20020adfe343000000b001f007a299f2mr1055339wrj.96.1646105066414;
        Mon, 28 Feb 2022 19:24:26 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6000:2a9:b0:1ef:8a00:36a with SMTP id
 l9-20020a05600002a900b001ef8a00036als1266252wry.0.gmail; Mon, 28 Feb 2022
 19:24:25 -0800 (PST)
X-Received: by 2002:a5d:534d:0:b0:1ef:956e:320a with SMTP id t13-20020a5d534d000000b001ef956e320amr8334852wrv.613.1646105065224;
        Mon, 28 Feb 2022 19:24:25 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1646105065; cv=pass;
        d=google.com; s=arc-20160816;
        b=fMUvU4942Ttm4gWIlXPj36IgEbDZuN1B8SnIEfedyx5KanNOl3g9QqiN0RUk8ztSr9
         50efbcFIKLgCvunRlvd4fXxyk6IZVl+2HKQGKKEWMvK/Q4njTXZjoDgMsYJm8OqIzdEp
         OpMsBkdMmEIc4SrxdiqJhWz1xysvmeJaWoteC1+XbxUyFe7GbWmP75fRMd9OjTpDS+Id
         Xg6b2fdb3e1CsKuVNKSmtQbHg9Zlo0teOy04wgxXes27B6ley5C9CW3QJP8Ml2fBg1T7
         /DJbo43cpH1c3mGvSeMNfv/zV3h28uH29ANOBTjOqKI8BgfdnzVfMyve121Q5rSOSzUK
         3H8Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature;
        bh=FpS45isNNUR3zUTN20GhGGoVLcg+9NbKeKvmgAB6KBY=;
        b=jQP0WOBXCg9pDQlbfbIOjko8WdE98OC5KetYUYfEMUXV4n87Tk3eaH/cttLrkbLuZt
         7RyJlVYBhDWSlIje9vow3msSSSLj60n15ltS9oKeC7CRuRDxD3i6NMpwvOt3UXP5upwV
         jR2qByXDHCRqbi77ZlmzWgLa5CNLEBhGzmrYGqT5WmVNgbRP/sqHOSWj8PFRnkJIiBWu
         rKdi1l8aNaoHrO0MD2nYEwgYckqTdp0QMm+2kfjQo6JrUWAkNi5UT9WA+ZCKALxvrYjj
         XJH36ijBRfPJod24DwM9Aogc/8T9PUA1EgH+IvT6iD48V7Tx6Zo1CK/b9V3dAdRRmBYl
         /lOg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=Jt+oSo3j;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 2a01:111:f400:7e1b::61b as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2061b.outbound.protection.outlook.com. [2a01:111:f400:7e1b::61b])
        by gmr-mx.google.com with ESMTPS id u1-20020a056000038100b001eff9a5b12bsi133041wrf.0.2022.02.28.19.24.25
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Feb 2022 19:24:25 -0800 (PST)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 2a01:111:f400:7e1b::61b as permitted sender) client-ip=2a01:111:f400:7e1b::61b;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HbeE+81mJcmTExnmJHTwAYhBOOyNL3xT6ustUbtpk9Yn/Rnp3CQ3XtqoG7VUrzOa+b8U1GPvlMgsnNJlq1v2tgb/FOQfVb+hTrSreZM9/ErArqKI7Zf0IIZklVVBqTJsTCSfGG+NL7W+iigLPrWCx+NwA/uiENf1xZ8qyak431q1Afs1qyaEYQBOYnYYbrUgblWEvYgNfU/KM/Luomw59Ggq3ecRbU7axvlZQ8Y0IqDiO/lIjJN8AqIpkwEXNc+YxvmOYKvS2ldsYZoJ+jkjXHVuf2Y0rK9yQMpgbw6C0FDDNTMqi/Vn1wimFSiOoaVWjLiCoWJnfz7a/oHDkQkUrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FpS45isNNUR3zUTN20GhGGoVLcg+9NbKeKvmgAB6KBY=;
 b=Gzsk2Qglf/FI51OufLXFSe7audMGOLIqmFvxLABal+XUJfun4WkMKyZinDnAv6F9TZjltV0G5suxaOxpxO6SerNmaKx3NkYhwIj32a2EXcfvhLecfJTQES3MqHxaxfjsZZ5/vYNb9iQuJHi4JR99lfTqK6B9US3VeC6c4H2iOvlAlq96tN94JBaiE+CJtT6khSo1LjR9isYRjKEvmlEYuV2UIFRPYT6xmgqcw6RdEBWAMc+YuYtxCENRW7BUv5s3iEUjVPukmnJwEJFtW9jA9eqIg9FBYc7XXYw+n2BZJhuR/+Yrn7+4+CRs4yeGJ1y8en43nLquN+uF79Dm6eCfmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by VI1PR0402MB3792.eurprd04.prod.outlook.com (2603:10a6:803:20::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Tue, 1 Mar
 2022 03:24:23 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::552c:ed46:26dc:77cc]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::552c:ed46:26dc:77cc%4]) with mapi id 15.20.4995.018; Tue, 1 Mar 2022
 03:24:23 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	"jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>, Jan Kiszka
	<jan.kiszka@siemens.com>
Subject: RE: qemu arm64 question
Thread-Topic: qemu arm64 question
Thread-Index: AdgsgeF0MBxawNBISdeukrlmtotnDwAMhj8AABnjJ4A=
Date: Tue, 1 Mar 2022 03:24:23 +0000
Message-ID: <DU0PR04MB941737809971DD137334533A88029@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <DU0PR04MB941706295948C00D9D24F4E588019@DU0PR04MB9417.eurprd04.prod.outlook.com>
 <4e848e2a-b83f-1acb-149e-1625351aadd8@oth-regensburg.de>
In-Reply-To: <4e848e2a-b83f-1acb-149e-1625351aadd8@oth-regensburg.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cc8d5172-913d-4c3f-5c01-08d9fb32fb79
x-ms-traffictypediagnostic: VI1PR0402MB3792:EE_
x-microsoft-antispam-prvs: <VI1PR0402MB3792459366908FD9C0842C9488029@VI1PR0402MB3792.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: i6CmNaLUQgQFEgY4fVX3jM4NfZS7uvv0SKeZ+v/+ptlYK9673QsRR6rnVxnY0AMr6+my+5186IEpXug9d8m0vn7mdHFTu6Niil/YxO7Bo0T5nC/3Ek300aMRPP23plTto/NfWO+4rvii8Ku1m/tYNqPNr+ts2h4ojlEyctKx+21UUVnpXgJ/gQtOJskDDWmHC1rYqPRowpoGqxOZzKsHQKkTYcj3kSgZ19Wn/ZI1i6jafScsAzk+NSCNq6P1/CxeuTDygYk5WPWeBw1GmNmyeb01jiz3ViSs5CNZHGB1vFDtiWt9DI9oDMC1T3It6umRIQcBwIjr5BFR/UJVMQLocKBU5sKDvbHyJOx8SYD7A2CnvJIuixl2PpQMJMeEx9AwB5zuus8DapRsbL7Fl/46oqyEsoR5M0tMtEzvsXihvL4aaz8kD8LDUZr0wBykeK48IT62QJdczHhuGu1xrAZdGJrq920CxPnn90CPYg6R6pCVjxf8sNSEfH/Ga4ucR3EqPEwXL3nMr9MhrItn7qKGj2MGkQUDuUjEaaumZQOq6MRWntoE9gU2RptbjzF7C78hWZpir05E1Wek1syYCLvaUMRFWokcqU2wpIKOPY/NlP90WNnGyWA8i0qV5sOyYE1n/yqdlxSUWi8ISuQCU28Fx8f2BWEAIWX7h/xUdftAf3dEuJ5fa6+DOpFI2X+cqYXcEEieoZebu9sUwkEdKyAKZw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(26005)(186003)(508600001)(76116006)(83380400001)(6506007)(9686003)(33656002)(7696005)(55016003)(122000001)(110136005)(71200400001)(38070700005)(53546011)(8676002)(316002)(5660300002)(7116003)(66476007)(2906002)(66446008)(66556008)(66946007)(38100700002)(64756008)(8936002)(86362001)(44832011)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SlUzODlqYUhvNHdEc3lSb2NyRkxqR3Y2eW1uak4vL2tiSmVpYmVKV2JZTzFZ?=
 =?utf-8?B?c0hwVWltTDY2bWtMN0dkSmJzOWFnaS9CRzhZOHFmakEyR2dyNS9aUzV4aTli?=
 =?utf-8?B?N2Z2TzdIVGRnTmxtY2h3MmE4ZWlVN2Fnb2R1STI3VDJsYXhTaWZacEdaK0Zh?=
 =?utf-8?B?QmZlZTMvbUFuRUM5Y05TV3VMZ2Y3RkFveExMM0Q0am9JZWUyTHZuNFk2Nk5H?=
 =?utf-8?B?M3oyelhxT2pGOU8xbFhTRmJTbjlKMlN6SU14K2c0N0ZjekdtVWRpbEVEaFFD?=
 =?utf-8?B?OXBLMVhxM3hsQk0yZXJIV1gxNXNnNkxZYkQ5Q2R4WjZ0b0J5ZmNaSitUZ3g1?=
 =?utf-8?B?bzhWYkVOQ2I3U0tNQUt2NTNQSUtHUkVVcHh5eHp6b3JxUWVsSzZDa3dsZldO?=
 =?utf-8?B?KzZ2UWNlQW9EU3hFOVF6djlmQUM3KzltY1h5U3QrMnBtQU44MSsyeXZBamRG?=
 =?utf-8?B?V01hNUdHK1NSa0x4MU1yMk8wczh0ZURNWk5MU1dwV3dTdEZwL3NWRUJIOWJ1?=
 =?utf-8?B?T3ZCQU1OR2JEQW5WR05SYUlnZ0lDTGl6NHJ6S2Q4VTFoZ29ZeHNqWjhWUGJZ?=
 =?utf-8?B?S05CMnYzTWRkYnlYT1RacHFnVHh2bFo1QTVlN3Q0Yk9xZEtJWlhWUDBOSHVJ?=
 =?utf-8?B?dWsxR2N0RlVOODJjUmZuNUdyT1VSYzhhZ1ZxN0JYZ1UzSy9DSTVYSjJlWkdr?=
 =?utf-8?B?ajFRb3MvVDRUWFBXME5xcS9OUEQvY0FxMm5ITGVWOTQrbmk4UHpqdmJlc2Zm?=
 =?utf-8?B?cERJbmYrUlpraUc2SWNiNVhLQmZ6MGVrMmZnR2VuRkNxVlVLc2d4UmlnUHZl?=
 =?utf-8?B?NDQzTU55cHN5VE9QL1E5L0F5eFIvdDlEQ2ZRMlhmZmtkaEpMVmpTYlVoMVcy?=
 =?utf-8?B?QktuK2VVMGlqUzNJL09odis4a0d3NWhIUDZKcTJnc1NhdWZSV2ZNM0ZER1dV?=
 =?utf-8?B?emp0QzU2RERsOHI1bk5zbXpPNjJYTFd1Q3B2N0xuRTlTY0o1eks0YUZibUpP?=
 =?utf-8?B?Z1ptRHZ2SWFLVDRvUDlEU0w3ZUlFeTE5dHlrTkkyaXlaNm16dU00QUJ6eFpZ?=
 =?utf-8?B?VzNEemFmaW83TTNuZXkyNXNjRmx6b3FTSXFmY1JHallZT1pJUzN2cm94d2hM?=
 =?utf-8?B?V3hJdFF2MmVmbVIzL0lYNkFFcjBZSkdOTlNxVVV6dHpBQVdwN0hqV0Vnbzlm?=
 =?utf-8?B?NFQvYlVqbzBkRE1POEkxdUV1bnRTbHl6ZDI0bXdUSzBFQ2FPam5PZFNPSkFQ?=
 =?utf-8?B?cFlLZ3AyVVdzSGhmWnNOVGlYRzFyMlZEQnRYYVN0NEx1bW94ZXB0TjUza1ly?=
 =?utf-8?B?YkdHMGprZEd5SzFZV1I4cit0Z0hqa0hIc1QyR09Ua05vdTJneHpSNDBhNjFR?=
 =?utf-8?B?NWgyZzFrei9ZMnprM3h6MklmZHhlMDc4QVZIOGxXaGllYkRIVDhWUmYyN29S?=
 =?utf-8?B?SHVxUGprWjJoV29QZnRScFJxMXNWT1p4dGR4K3VNblJFYlRYVTg2MTVVbCtZ?=
 =?utf-8?B?aVkxdWU5RHNNemZla2FHVzBQSE5VR1BTWW0xNG55TEpUVWNqYjJ3eGF1RUpH?=
 =?utf-8?B?bmVZMXZtMHFlclhmU3dHOHRGeUs5cHpETlczYjhqWTdKMWZDZXhBSEhsVndP?=
 =?utf-8?B?dFQzMWNaSTVTVitJdHVtdnRyM01pT3BaejVkSEJxTmFHR014RGNJMkNWV3pW?=
 =?utf-8?B?OUpNUWwxbUg1MDRMcE9TRGJqNXI0SXVCODI2Sm5tMGN0a3Q1MTFkZjc0emhH?=
 =?utf-8?B?NlF3a2RnQjlHSkR2aFR1SU85N1RkcnVsWFVmZ0ZqNmthM3hWTFRCcHcraXk0?=
 =?utf-8?B?dm5TSTMyZkF0cUpNazAralVhOHZZWVY1V2NzeHVFNTFSVHV5THdzTi9uTWlE?=
 =?utf-8?B?R2xDSFdzRzRxNlRYWDNJRDJUR3o3dHhMN0ZUd3FleWh3Ri95dHlmRnQ2K0Ir?=
 =?utf-8?B?RlNRajhxL3c4RERaZmpvZFdRNVFFdFh1bnNMSnRyVnhRYmMrR2JKNUs5T0Vm?=
 =?utf-8?B?Zk1qSGZjcG5NR1p4aWREWmJRNzVlTFVYQWFsYnZOU3lIa0c4UFRIRkZOSW4x?=
 =?utf-8?B?Q0UzbzN1UXdKend6djlHZjdhVmloS1dqaHV0UWFGdVJYbEk4bmloSGVGZ0Jn?=
 =?utf-8?B?WHU1U01sUkJkVE5sY0FFQk05ZHdtU0t1czAwVXpoVGlZOEhzdE5LU2NzTDM3?=
 =?utf-8?Q?WmotgsR+yF+YUzNG9p88QNo=3D?=
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc8d5172-913d-4c3f-5c01-08d9fb32fb79
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2022 03:24:23.4825
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tG21scADwNBtKOCLuBKNCrDtm1V21nbczDzGqpHz0u82W2MBqRJesBgddW9RrXIuoNg4YlIHaawiHdzMQbrGnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3792
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=Jt+oSo3j;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 2a01:111:f400:7e1b::61b as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

> Subject: Re: qemu arm64 question
> 
> Hi Peng,
> 
> On 28/02/2022 10:03, Peng Fan wrote:
> > Hi Jan, all
> >
> > Qemu arm64 inmate linux and root cell linux share one hardware uart,
> right?
> > If right, how both linux share one uart, could you help explain more?
> 
> Define the memory region in both, the root and non-root cell, inside the
> non-root cell, use the JAILHOUSE_MEM_ROOTSHARED flag. However, the IRQ
> can not be assigned to both and will only arrive in one cell. Beware of strange
> scenarios that may occur, when both cells try to access the same physical
> device.

Yeah. Have you ever tried secure uart? I am thinking to extent qemu virt
model with two uarts.

> 
> If it's just about the possibility of being able to write to the console in the
> non-root cell, I'd prefer the putc-hypercall.

I am enabling zephyr arm64 + jailhouse on qemu platform, a uart would
would be good, but putc-hypercall should be ok for near-term bringup.

Thanks
Peng.

> 
> Thanks
>    Ralf
> 
> >
> > Thanks,
> > Peng.
> >

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/DU0PR04MB941737809971DD137334533A88029%40DU0PR04MB9417.eurprd04.prod.outlook.com.
