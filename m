Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBRHL5P7AKGQEF22D2YQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63a.google.com (mail-ej1-x63a.google.com [IPv6:2a00:1450:4864:20::63a])
	by mail.lfdr.de (Postfix) with ESMTPS id 38AF22DCC59
	for <lists+jailhouse-dev@lfdr.de>; Thu, 17 Dec 2020 07:08:05 +0100 (CET)
Received: by mail-ej1-x63a.google.com with SMTP id g24sf8219119ejh.22
        for <lists+jailhouse-dev@lfdr.de>; Wed, 16 Dec 2020 22:08:05 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1608185285; cv=pass;
        d=google.com; s=arc-20160816;
        b=IH6IHtM5J1WqnCtwqrwuzM3gdsaesb5+GmXM3yDz1yTVX34BQgKvdWp+6ymh8af1uT
         Pbbis6Yp03I9Vh0cGBmjBRNPuW7Sd1eMsinCv7axgEwVViclh85cHYT1X+ZgcMeZwCTW
         zSqrqGuIcEipYfApbKrfNHCPjINqsRKJJ0jnDyGW2Xf9LfxcvG3yRWxbzJmar63ztPqq
         6P5ozVtBd5drrzSxGlpzsxwmMDqwXnPZpA4xlVNjoaRH0acozdeHqj6iBOI9RSGVW55B
         yhHY5W6N0VDTUF7CS7VR7S7S7MioPNO1KR0ZobVlJoTA/xrhICUeGfBOxnAK4GKt7YP5
         2bgQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:sender:dkim-signature;
        bh=UYIadg/zaKtmVElm8b39FoL0Jah+1sRdkKVu86UjsjE=;
        b=wsUpF8A5sPZFli7LQUKF0vBAJ4VOU/qzngxNMeTIkr59JlyTdIJaYKle1aSjbpAsBT
         RXCiJNgFb5NRU87Jo6BtIaztzybWSfbaygbxhGnh186O4s8kk/an9tOhlSdBV0W2wzh+
         7MvFWV9kxMjgWL2giIv2+Xri9TX3Wdv0LV9Dx6Sd/mbBb1P9f1bB5+SJD6+l7qYJJBq8
         hMgppsJuSLOWAsvEFVJN4GGdeUZIrPjmoJgD1VI+SyWej/66qJ13Aq9piCvS9UGAl8+g
         6gPSnBJlu4Z+a7k4UM6Dsa6Zuff+hVxM/RMdZGHAhr1PUb6mqMHWf8P+wzB8rgEqb1Qo
         HmeA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=iOT+sILQ;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.15.54 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=UYIadg/zaKtmVElm8b39FoL0Jah+1sRdkKVu86UjsjE=;
        b=Je6RUcMAF82LZ3wizFMDMFreZFF//5+bcBpf18y+zS+wTU8zXJAq58f5ELfZkih48W
         2B90oDFb1IhGHC5BfT4/pWXmhIrbZ/B2owubuhJ5beoIiEKlG0GziJcxQGeFUwTYLP9h
         8TAchxwh23jm2g4iGNH6ZU8LEBcu48sVqGiCftF5HZFtZQYncEkuZVqFRNn1U26hIPSH
         Bo7tTxxwNrUZaUfMYq6oC4NbJfQZTJq/lrghtZKl9Hk90ee/RUgapQfkFmt65y+iSosD
         EiweDs7TCNcT5ZRMGYl4bsaIS5x7gUjC5B1Ot3PQiwlPZN43YDye4qdclpXpLzE0NWYm
         xX8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=UYIadg/zaKtmVElm8b39FoL0Jah+1sRdkKVu86UjsjE=;
        b=JB3eNj4UWCmRCWpL0b5cjySOY4cTKKpRHMBFfwKRd+HDo4oVI5140YIu8bA/nAwkLV
         s7fmheH66SZ53IB7L/kY1+uImapC4RAjLY2Yr3vWcJkmMGvWysDhedt6AFPyfQxJhbY8
         O/8WNKTYPA/6527wY14CUONI7vdyejkw1cySDq/p4pJKQ3ATACCqM7K5BfwmTn9P85bL
         IHloftqJsWgii8Omm9YZV2DT3p8701TAhPzEFX0igVvIj6G5Jjsn9kewoFk7JaStgTe7
         Rf7CsxirocPxAdoiIrPDXZ7yYxxzSDY+Fwxl+IrimjYUarbJCacb68nf8fPBj/hbtVD4
         07xg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531Hgk6H6dAcu7kDb9QVpaWpDSvBmsJAkEZaPJxsEGQAPmizBFCt
	DgvF7QIvAj0Hza8z2EynAjQ=
X-Google-Smtp-Source: ABdhPJx2mMUkBhoVm1Sv3vnWPImaLb7RJLoQ0SYeZf56FdG4DVrvcccO1/1IP8Rb0sD0PgPgGbJ0Pg==
X-Received: by 2002:a17:906:3a55:: with SMTP id a21mr34213569ejf.516.1608185284952;
        Wed, 16 Dec 2020 22:08:04 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:2581:: with SMTP id m1ls3101062ejb.0.gmail; Wed, 16
 Dec 2020 22:08:03 -0800 (PST)
X-Received: by 2002:a17:906:3881:: with SMTP id q1mr34302726ejd.490.1608185283769;
        Wed, 16 Dec 2020 22:08:03 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1608185283; cv=pass;
        d=google.com; s=arc-20160816;
        b=xX5NTvfXvNpwm53Lts7kwisICdGoguOSLoJkOlYNxZSbF9rWtGDITh+uciKvMXe8R8
         nPZEcPEPfO3nxvxbsgsDabPaWvAR6IY22CHNwIJSSva3CPY0uFdOok8mh1x6v0WUpKNJ
         IH42TIxeocNB07VyHOHh5JPIr9IVo1yJlTmq3O/v8BlfxqP3Fk11+TE6HZsZtNm1P3ut
         DnAXD6NHOkVqjLyPjgcQHbaG19dKvDmZUPdhh4Ogn5jZ2sXELBXezpr/RlC3ONPnovee
         09T+iH1liqwqjQ/Lc5v2foICY67jKfU1ocUgFxQy9yXQx7NIloYPBpiPJlAfOG/mOeif
         7WyQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature;
        bh=6NQkXJAKxH3y40zMlNWGqVjedBopxMNMh0gbdUUkqdI=;
        b=kaxKr4BTLXLS8mfOmyZ0iA+surmD4+rgZWj6CCTDzEpBRttdCPiODsCQHUasDx93Vs
         4tmUczKWg1AfBa593mf/FLqkz7arqqQf08LhzHDuKSYJgZNSnuQPXj6QyKaCDMK6nCPy
         1K7Q90jPZdgP4gbN7XKI9oMLdYIh8euYVts6VMyzOSrouulBZIlu9BuVaQ4P6vlysdHQ
         bUeavnDt8lEl97FqbbtHDBECC9InGJxXYDLZO/DKjhiZ14e/WEO5baHJnYLXLoiUkkY/
         20rEcxCN2TMEiLLueYcbxtUWucxX1NLknixwjCuMcGkO2XmWbS3dB6XMh+dgEcxZHPW5
         YfMA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=iOT+sILQ;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.15.54 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-eopbgr150054.outbound.protection.outlook.com. [40.107.15.54])
        by gmr-mx.google.com with ESMTPS id cc25si192378edb.2.2020.12.16.22.08.03
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Dec 2020 22:08:03 -0800 (PST)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.15.54 as permitted sender) client-ip=40.107.15.54;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fByEAlf13IsYteli0LZKaa7sucIsITVDy7wbxAfD+ZiYipzYHfKusdDTPIfUG5a1ngOXdVCZh3+fAL5o8WZAPohLtp5/P4NzCaLlXzDxqtVtWmkufcF0FYGfP3B3OFesEns1dUGSgF0lozt3wY/XA2PePqn4kcos6Lpzusbp4LRKoC2vX/ggaot9IzYfHwHhDsBcpYMRGg0sE/5JL9OSktvPKJDdpFnFCAexOkLaCXSLtWZt6Fnn4OfwHyG2AL0u2TmVERTG0DnOEKIlNlq5iRt6fNsrLyARtUmlz6DUJQ5NqKyXQWr+zEHXy0fQxgdhbC5McNZQxn3su6qvSg3f4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6NQkXJAKxH3y40zMlNWGqVjedBopxMNMh0gbdUUkqdI=;
 b=JO7jgglfNUsDle3kuYrGtI9E5XuJjZmMJQW6K1DwVB0jMMLlkRgKCyASFpFFNoGf0MRXQuHqhz1aVA6+QmbPEoFXqqcJuHGrQcXd0tq1U7HguH4qaTl6xw68SsYsWg/boVmw3a2IFL0v3WDLQpw+hnLqXqPegsnIiMvK1vKTZqErvdRbGkJmqAZ++dtFUb+npwv7b6Y+zWia2GCmmqNkHNIIe4t6lZxStyFpOPZ6nhWnSoUFUfzvY978gLKKLgDn9IcfBqs2jJRqKCmEhCLzggTOnerhif0Ogxk6XHDdmAukC3259ni8xWp/gJ849Ja1KJqdw8AtgbP3lQ/hE5zGDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DBAPR04MB7302.eurprd04.prod.outlook.com (2603:10a6:10:1a5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.25; Thu, 17 Dec
 2020 06:08:02 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3654.025; Thu, 17 Dec 2020
 06:08:01 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
Subject: RE: arm64 zero exits
Thread-Topic: arm64 zero exits
Thread-Index: AdbSsg07Ih7IhzzqSB6NTgER6LavbwA/V7YAACK+zLA=
Date: Thu, 17 Dec 2020 06:08:01 +0000
Message-ID: <DB6PR0402MB2760BEBB2CD916A46AED7D5388C40@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <DB6PR0402MB2760E9A43F64FDA9DE46AA9488C60@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <f99a10d5-db9c-fd70-e0ee-87aabe30e596@siemens.com>
In-Reply-To: <f99a10d5-db9c-fd70-e0ee-87aabe30e596@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 000bf93c-e24a-447c-164f-08d8a2521c47
x-ms-traffictypediagnostic: DBAPR04MB7302:
x-microsoft-antispam-prvs: <DBAPR04MB7302053FA4092103FAB20E2D88C40@DBAPR04MB7302.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KYOmYuBvIkVapBXkmM4/2Ero3W+yGFOunw1lXzfE9EVjCIPalwWdUM8J88+k0aF0b53j7FCDIabx8Ih1PwASj6foU7+EXxHm4RBEsd4CanwiKE4EDKr37BybQk0u4AxhbwQxE2k8ocgMz56khAA8l0ESFNZQZEwdfTaD3Rf4FAPbZ5PfTbiinn/k+nRh8CLKZDjaovKKMMWSgOU+dqvgqVLJb7xclxTBCZiCQwUINcCcvLGVIjJc5CVzGbFN//0Lwl1ry37IRgM1lSy+IShdeS4lQJi9Xyw0YTXF98kGiy3C5pRO1qGMxMbH4/30C2i2kqqdisPxbRWmXT3ES+HvQgc+QgqIu5bHDEorVbFkhXcXQwYV7weyUxC99hUUrVzinVVYe1LoPeBfXMyUtU87RA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(396003)(39860400002)(376002)(366004)(110136005)(316002)(55016002)(7116003)(9686003)(44832011)(6506007)(53546011)(2906002)(4744005)(71200400001)(7696005)(8676002)(86362001)(26005)(76116006)(8936002)(64756008)(66556008)(66476007)(66446008)(66946007)(478600001)(5660300002)(33656002)(52536014)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?MUluamd0STFMVktnU3lvd1RBaXp4U1pHa1lsZWlBNFNxQVF6b1BJM2UvQU5J?=
 =?utf-8?B?VlBKdlZOb2RCeU82VWJrNmp0ZHBaTVgrQ01rUnVSSE9iVVhKZ1RpVExvNTJu?=
 =?utf-8?B?Ump3eWpNenNYY25kVjc5cU5aV290Q1oxd1VQUkx2dEVXNWZPV2JDMDlzMnFw?=
 =?utf-8?B?L3JpMXFuWktUQi9KU2JwV3g1Y1RybU1MQ05jWUhaUHJVTDllcWd0ZHNIZm10?=
 =?utf-8?B?aWplWHBhWG9oNFdIalF5TFlWc3djN1BjeWJBR1JucGJISFc2VmFGNnBVODZF?=
 =?utf-8?B?QUExWVRWQkNIVExaVytEdmR6R0xzb0ZCL1I2VmZzMUNWMkpYR1pCajRrbUNF?=
 =?utf-8?B?QkVuTEgvVUpqTEE2QWdzbVduaGpianpkUHNhTGhTWWx0ZmIzZ0lXWFVEczZy?=
 =?utf-8?B?S1RuSlAzekhHNFBBZ0x0MWZxaVozemNsSmNKdld0T2dLSHFJQjJBTDN5aHBv?=
 =?utf-8?B?UzhQamd6QldpR1BBTXkzVno0WVowUjBBUGc1dElKbHB6OEh2ZE5PNTVQT1pR?=
 =?utf-8?B?OUtDRVB0cTlLNXlPTC9VcXNCbGxybEF4bUxZenoyamQxYVVuRzBZcDdNei8v?=
 =?utf-8?B?MGVLZFRYZE9ScFgxN08wc0RwRi9WOW9Vc1Z5QW1LMlgwWkcwM1k2aTNjdENR?=
 =?utf-8?B?bmNqQzl0aVN6eDdkWWx2cks4VzVEYldRSXZ4WDAvczhzOGoxbk9qcVdLa1A4?=
 =?utf-8?B?d1pYQ24wV1gwMUdkOHkwc0lCSmU3K0JDT3dNdWRnbldSdkxZcjZsNVdFM09k?=
 =?utf-8?B?Z1hlY3dRZEpJdXhUeWpTNFFXcVlvYjZrTkZZS2l1V2JPLzF4cDV4aTZBSGYx?=
 =?utf-8?B?ZmJyVzJWaUVDa0hZaHd4akNZRHRtZVIrTyttRk9nT1ZpWEFGa3oyMlhER2U5?=
 =?utf-8?B?N3lxL0NjMjhwK3ZrTGEyTVg1TWZjMHJERnNvWWYwaUt2RVVWZkgxV2oyYjhN?=
 =?utf-8?B?bUhOOWJTZXgxM0pOZkYrcytrSDV1UGpBZVBtOHlSbnR5QVpaRVloMXZMMGp1?=
 =?utf-8?B?S0pDZElLeEVZc28vMGdNNHFQdFo3b0h4TzZQOXFmWDVsdXc0cE1CNXgzOW1y?=
 =?utf-8?B?QkJuZll3dnd3SXVNYTlZQlhhSkxlZHNnYnd0ZnV4SUhjdE9SMkVFd0NKZW1x?=
 =?utf-8?B?VHNBeDlrZ2xmTDVEVlRSM1hHVlN3MXhGbVpGUkNhcWJqcDREZUZnUVhGNmlH?=
 =?utf-8?B?T2hsYTdpeVorMTB1cC90WGpYYWdKMVk0NVIyYnMyblNmRHR2UC9vZG1XampK?=
 =?utf-8?B?cWprenZ4dUlqY0IwL2s1OHMybVpLNnhFVmgrUFpVa3NxR0VPZElUSlN4OHRx?=
 =?utf-8?Q?NMMSixWI5uXKo=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 000bf93c-e24a-447c-164f-08d8a2521c47
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2020 06:08:01.7244
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GQh6cFFev4G7Cl/UHySN2Lw6p0kLBqSXwGxtX8aHYH8XYZXEB659Apk8lE3D74X0zArv5PNRT2DlBWEqpJgw+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7302
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=iOT+sILQ;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.15.54 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

> Subject: Re: arm64 zero exits
> 
> On 15.12.20 08:16, Peng Fan wrote:
> > Hi Jan,
> >
> > Will you merge the arm64 zero exits branch to master? And when?
> >
> 
> Still wanted to also upstream the zynqmp enabling, but I do not find the time...

ok. The i.MX8M part has been upstreamed.

> Did you test that branch against imx8 extensively?

Have not do stress test, but from my sanity test, it runs well.

Thanks,
Peng.

> 
> Maybe I should rebase and post for official review...
> 
> Jan
> 
> --
> Siemens AG, T RDA IOT
> Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/DB6PR0402MB2760BEBB2CD916A46AED7D5388C40%40DB6PR0402MB2760.eurprd04.prod.outlook.com.
