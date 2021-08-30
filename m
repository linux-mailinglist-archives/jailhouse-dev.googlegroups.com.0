Return-Path: <jailhouse-dev+bncBDBIZ3EL3UDRBWMUWGEQMGQE5LRMNFQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23d.google.com (mail-lj1-x23d.google.com [IPv6:2a00:1450:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDEE3FAFED
	for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Aug 2021 05:02:50 +0200 (CEST)
Received: by mail-lj1-x23d.google.com with SMTP id r16-20020a2eb610000000b001c78e82ce96sf5928216ljn.5
        for <lists+jailhouse-dev@lfdr.de>; Sun, 29 Aug 2021 20:02:50 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1630292569; cv=pass;
        d=google.com; s=arc-20160816;
        b=CaN3niVfuobp62E3HSrm1teDWjt5z5E+NrelqNUEOvCU30u1Olh+b7CWCyXV87s3vm
         RJUc0pORM8tMDL1vBfPXnL6yHPkmVsclm1MCxMubPRy3kfLKvmA3vu7SaaZDlDYERely
         Xvu22BRPtW2fcY1S98wh4odzCyfazvmn2RpcTreRNZmtI++VW+VfJydqfN0cnpsRaKgE
         lyy8OQD+qYzM/utI2PmWW+Pz9QaPpayZYrAKTZOBfwWfvAHcM7uqytUOuUNJFjQH9Pf8
         IqQXeGCCaq/zL7V9SBlhtG+B7CCC7NgEpqJjEpn2DZRjvG0i/HU5dc62bzfWdAtfn4Yc
         0wUw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from:sender:dkim-signature;
        bh=t4u3Vh6Eeg6FvqhaZJJ2+s3K7gQ/wtF6O+JCc+FBqHA=;
        b=SFnjSTP/mphH6tKm/eZ4SiG0Ko3MxhiyEMWE7BuiKSnxe011Kmre7mwQIk3cW9+vdl
         2zCS4gYASTwh5JSToQy6elrMSzK4bmdn3mGNZwmCWVp1iKOsAWIjGMxzvr97i39ukwJy
         jtBtbpiZfNIjVbpyfYEn9BISkt+Szc4tk6RgsMhWKb7FNl3cPDg8B1htLEeHOPKl2Qe1
         CQ9I46jBuS9x/Jn87fu3A9blCgDJvoqq9zpnPLwcLwE5/kX+TEb2tNIYIdGbf3U9klZc
         ZKaIsY6QR7WPdTjBEZ5sC+IcVFRiTymf/qddmP+p4zyWFOCEnjyrce0VW8RA1PXOKY/J
         S8Xw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=VPSHW8ol;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of zhiqiang.hou@nxp.com designates 40.107.0.80 as permitted sender) smtp.mailfrom=zhiqiang.hou@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=t4u3Vh6Eeg6FvqhaZJJ2+s3K7gQ/wtF6O+JCc+FBqHA=;
        b=BzEjr9fZYUGxaMHioVzeqHPfpFnvvrEpmR7bou49F7ZvBDHATTVXy8bhIsUM02OYnz
         Tx3wZiG5ZyQ6ETWryBNmSoT1btMfv3RG6s+d4Q1DRQjUhlaF70yL+9GiNxvXRIr1DLUt
         vybgphPG9LzT2qFyWvdL1lYID/dGKDFlX9FEnnXBQpyVIOg+HP1/cxWK0f6OkzLKA4LV
         hiL2TPLQX7IzSmM1uBQuh3NGjZqf4PN0xZGGiABUq4YMh5JSDk9tdcCQ7XG/QCfOrUpw
         UmX9Mieo+/kfAyHAX7A0uwLFNl54myOnz5BqB1a6L6GO2jqrRp0LpgC2MkmYciwLoHBb
         83Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:content-transfer-encoding:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=t4u3Vh6Eeg6FvqhaZJJ2+s3K7gQ/wtF6O+JCc+FBqHA=;
        b=LqmzPT5sgLGiW5AUz1BTxhj1qWa4H4BK/22zdOtjd0pRvqIYWamYBfho83MhZ/Hmbl
         tr2QvS8aFxzb/4bNkUgmGGbQyTwHq8oDxkWfzRMOrG9DwACze4rDP6gKCvHOTnrVuOEc
         WpPvA/bbi1tfjxpiSwAkNSQ35ziscuOuXYFTu2Z4JE1uLXHgeV/6ToSOUSIfFiTT+YCw
         6AHVmP6B67Erndm3yQUfO5RrtLACc0kyfzhls27F4rUEBwjnaUxIu/lALfm9v/yXCTF6
         aGgzePOug1ZLa+sI/9Hh8v1pS0HDO/vPYAK5J77zmX3o1/oI4ugupzdWd32wNYWDDnqU
         XWxQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531cv6BRPqxLZd3oP/HoWG2p5RO2Ay4O3zMuw+ig6uovp6kqXXMR
	v6wvIrln09rxT0yHipS9TtI=
X-Google-Smtp-Source: ABdhPJwYo68SGHGn0d62KWITHWT1NIJhhzWqelCrleEQzuU+XXLG3vw8vrZmQietBUWUn9YAuiKXLA==
X-Received: by 2002:ac2:41d9:: with SMTP id d25mr15308388lfi.386.1630292569837;
        Sun, 29 Aug 2021 20:02:49 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:3e17:: with SMTP id l23ls2744583lja.3.gmail; Sun, 29 Aug
 2021 20:02:48 -0700 (PDT)
X-Received: by 2002:a2e:a712:: with SMTP id s18mr4717514lje.325.1630292568555;
        Sun, 29 Aug 2021 20:02:48 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1630292568; cv=pass;
        d=google.com; s=arc-20160816;
        b=gXCMcUCZbv2Fn0xE5gsbAXNLkrHOK2Ii57fmHEbqVBhu2s6RXddDqecpiwEy6WfgAc
         4Ujj9oEisQXMLXtlbO5EdbA4xDAVRaY9vDpHmW2su1vT9kcHZ166eTYVtfIx8A9fVmFy
         8Oki31xJa8TNem7cwzdbH+k07Vxnwxe0DmyxrrcNlcfcCBKlnEIwMYA5tkdRZKHYPd0T
         q+fgUo8tRlyoJcAO9XiuRG4jWFuBotyjgmgtWopzPDAX9lLYUvoidTGsII5yY2pSYY4G
         nmo+9ytBI/IkNVT785d4w/Ni3uRRn6k77mOEKUiiuhIoV6rwIdudI8TwzT0DiH6H75a1
         fAlQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature;
        bh=gJYP3GelOuTVzzj00TYdIVxSel9obzIf4ih7rap73RI=;
        b=JRobzNpzxf+HkpRFBbatj3bT6nWQcPT9RnDh22D72E7PJ7+DdSiIY6tP24astc0YIe
         FNygc/gaJYte19amZIkAmm0w6RGjQDNeyuQKGZ5Jhq2lfp0lEcdZmu1IHULVSwwM9Xjc
         i5OhIEJngsbbuhQ0gCJ8H+t6id/lsG1re8WsfF95o6Q+lPKYy/zjGqdx8/tArcIhLb/e
         eEcnjXePVtuHR84hWZZ0vfDx/eA/angf5hXm+bp2XcAiNDhInglBFAffOLfw5G4dicqF
         TWDV80meeLo3I2XqqXqlACdnn8eDEfgbr/C+XKvhyyXB7TXd7l5zVGuj9VzIr6BY6vlQ
         15Qw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=VPSHW8ol;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of zhiqiang.hou@nxp.com designates 40.107.0.80 as permitted sender) smtp.mailfrom=zhiqiang.hou@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (mail-eopbgr00080.outbound.protection.outlook.com. [40.107.0.80])
        by gmr-mx.google.com with ESMTPS id u8si231106lfs.13.2021.08.29.20.02.48
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 29 Aug 2021 20:02:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhiqiang.hou@nxp.com designates 40.107.0.80 as permitted sender) client-ip=40.107.0.80;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K4kYFIG3jik869ArJYKixflqNOCTLphrM5maRM7fcz/EwXYAxOjNE3R7xfYVA2lewqjWYnlkxPoAXghaj21fRRl8o3+E+JoactXx9UVURGDz3KJ0bt98BpbIxtUM7yWp50lFMw6bKgtZlB/bNSZRNY2Idsy+Myh6sOKnxg6ZUxTSqmLdxmBKxFwrutxyLZxM1J1TvlVLWoqEcQ9gO2EigMyum2RyFCR+V1s1tkIV7IT6SEs84L6iqL72NSTfdia49tjawcZzof87j8EfBwL/P9BBwc+WZm2+QyZYa9W/6w0RZSlbIH5XN3/NGWrSz5yueu30HB/X8Oap0TGaA0wxOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gJYP3GelOuTVzzj00TYdIVxSel9obzIf4ih7rap73RI=;
 b=Z3GLvMTzYO4bWz4L2ls/S+4j6fAYQZFp7kK7PjmYY0eZiwbvhQVW3ex9gLiAX6d8UjCtVnPGpXx7ZgckwFVuxyJtOyiRP5hND8suhmkGbD3lW8m7u8HzwYv4eb1Kd999kUDnMnOvkYedNxP8xgfHpGhsZR6AgLEpXVkZq6q9KXKoaZHwHAFZF6jP+Ly/gzOe9r2bh9S8mrKpdA+TqRjL6xYf0SPdsxMMOaIyYEXQpX3RXWsYegxncZ6mgSU0KRfEw8K75B+BTSx2jPvbKiqRdXkqIny7RsDy/Spfu22REjzi9ZJIjR6A6QuCo/00kPTA/r+MCqKmkCwnDDY+X08BAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from HE1PR0402MB3371.eurprd04.prod.outlook.com (2603:10a6:7:85::27)
 by HE1PR0401MB2298.eurprd04.prod.outlook.com (2603:10a6:3:22::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Mon, 30 Aug
 2021 03:02:45 +0000
Received: from HE1PR0402MB3371.eurprd04.prod.outlook.com
 ([fe80::8d8a:89d:e110:3c3b]) by HE1PR0402MB3371.eurprd04.prod.outlook.com
 ([fe80::8d8a:89d:e110:3c3b%6]) with mapi id 15.20.4457.024; Mon, 30 Aug 2021
 03:02:45 +0000
From: "Z.Q. Hou" <zhiqiang.hou@nxp.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
Subject: RE: [PATCH] arm: irqchip: Fix the mask according to access address
 and size
Thread-Topic: [PATCH] arm: irqchip: Fix the mask according to access address
 and size
Thread-Index: AQHXmxbhYfr68tdfjkGRS5idFHzolauG+uuAgAAZduA=
Date: Mon, 30 Aug 2021 03:02:45 +0000
Message-ID: <HE1PR0402MB337191DE611BA6CC480C104D84CB9@HE1PR0402MB3371.eurprd04.prod.outlook.com>
References: <20210827075116.6208-1-Zhiqiang.Hou@nxp.com>
 <2d3cfe41-3c51-34f8-8130-f6b86720d835@siemens.com>
In-Reply-To: <2d3cfe41-3c51-34f8-8130-f6b86720d835@siemens.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4347509e-64eb-43c1-8fb6-08d96b62a44b
x-ms-traffictypediagnostic: HE1PR0401MB2298:
x-microsoft-antispam-prvs: <HE1PR0401MB2298882D569763BE606BCE6F84CB9@HE1PR0401MB2298.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GbDnAIgMocQcyTs4YCxPPXNg6IH/btEfVGFimHgGPFmjDXwOKiSYjN/U8HQBhQKZUfxecAZOhKzBDqq1eRSv4TOwgpE3uA4s9eferDQOZk5BU8F8zCfZXlBNS6aTbS4V9rs0wP2eyoi4urKM1Eox7teF0ZyWsSKriINBzd7r1L4uCp5bKUl1c8w0iYVIfzp2ci3qgbxuJAIbOlY+ZzoR5qgEwOcGu76ZwUY+u1QoGmoKrU5tIiqmITvKhFDdgj0QBi2lF1SoHMXq1xZol5+mqbpDkT149lqnziuJHAXAXbYToHT6HZfaoxf29oLke79Io9AJ7CaGbMMcXY4sNXX2JPW2nxEUIHy7Tu+6QTgJ+MRCNQYp2D/pYXkQvPAEZN/zaazFVYehGOfLyhTpHZzId/CKBxavuU0MqWUmXsMKEvIBhrM4MXFd4VNxsJgrm2BYOAYIeXJjKP/0s60Rv7vHfyvwBYTxbGTBxWDIDDREEkEjafiikIT5Sz9+rjZvnjD3sN73XPLEadSX4JpgzHcfHxOaG29BKlnxwBvyBhJ3XZyOUXoYl/9dVSj2R3clf+QW0Qz2IIBd7wnoGQ0QCeK1IlPtEywHgLdxyJ+F4aIAl6VTYnGbAg0OWg6Y9sf/rr9nGJbmWhkI4po4jxw2iO7at1QmlufH/pwoBdYG+/ZHeakvPKAKYd7eqI40EeIDiYnfgM5+KNjy+CHJKm6V/BiMLw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0402MB3371.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(366004)(136003)(346002)(39860400002)(6506007)(2906002)(66446008)(76116006)(316002)(26005)(38070700005)(110136005)(8936002)(66476007)(66556008)(64756008)(66946007)(83380400001)(33656002)(52536014)(5660300002)(71200400001)(55016002)(8676002)(186003)(9686003)(122000001)(7696005)(38100700002)(53546011)(478600001)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TUxETzM0MkdUWUp0S1QxVlMyNUl5WkJyU0dhcUdVS2hha2h5cTdqNGYya1FS?=
 =?utf-8?B?TW1tSFgvSHN6T05RdHlLTzJrYzY5aFIrMmRPdys5MnVJeGpzazdsZis3aGZi?=
 =?utf-8?B?bjVQM1V2K3U1b2c3RzV6ekxyU3BXZXF6dHRQR1NJK1IzdUlrM1M4WmYvZmZ4?=
 =?utf-8?B?YjRBMzBJeWJHVFhPbFFxVnRWK1ovZ2JJOGFsa3V3cUJwWFFTTW9Lb2xCZnhq?=
 =?utf-8?B?NFRPTTNMb0x0MXExS1VkcUVpUERKcERqOS84RDJlenpTb0pRSzN5RzQwUlAx?=
 =?utf-8?B?ZkUxNUpHenVNdkVLbUxpTGJIRDBudG5SWXBzS0E1eXRBWHNVamNxRktlWDFx?=
 =?utf-8?B?a3ZhTmxwaVZ0ZHlsd3lUTC9IY2xuYUdZNFR4ZzJtWTRuQ280YlIrY3ZBbEFF?=
 =?utf-8?B?eit4WE5VWFRtWllyQUNIN0RHWWhRQlJicW1BR3JGNEFSTVg4RlMvWmpLbUg3?=
 =?utf-8?B?NG1ON2taZkk1U3M3WjVhRk9YdDF5YzlWaUthaGlYNzMwcFh1R3VOcDd5OWZ6?=
 =?utf-8?B?TGRINkhkM3JWYldzbS9vU3NjU1dLbnM1RVdQVjRoWk42Uzc2ZlNyam4yK2pa?=
 =?utf-8?B?NEhwcWRyRmJqL0pkbWJvbG9waXhENEw5ZDBud1lBS3lOME5IREF0TzlkOU40?=
 =?utf-8?B?YTk1RE96ODBTaDEvRHFLN29ZbDVYeFNGUWpQck55aHVWYUN2dTZRcy9mbWZ4?=
 =?utf-8?B?dS9pSzFWczVGQ20xUnNaT0JkdXhSb3E3d2pkSTVlNGZDT2lNVDI1VXFUZEF3?=
 =?utf-8?B?YUtjcmhmb2gxS0JrdFQ4NVJHNWtsTzJjOVMzRlZTOEVDU3pwR0h3Mjd3aFE1?=
 =?utf-8?B?ZHMxRGxleWxFMGt3MWlCb2FkOGVSYnl6R082eU15Y0EwMUQ5dDM4R29vaEVG?=
 =?utf-8?B?VnA2UE56dk9rNzMxQmlsY3FJMGdRc3pKalhtUmpMMTVzSitXZkVpVUdveU9Q?=
 =?utf-8?B?Y012Z3hvRlB6bWVqR3VJc1B5b21VV1ZxeWdqYmtsSTBpNzBBODNYU09hWEV1?=
 =?utf-8?B?UkdQVml1VitnQW0yQThzVEpqVW1HUnNwbFN2aUs2WjJ6N0QrbGgrN01GVzFh?=
 =?utf-8?B?Z2NkeU9YR2xIV1l3S3c0YUkxL0kvcWMvdStIYms2a1JLZHJTOTE0Wk5jUUpm?=
 =?utf-8?B?ZVhKK3QyZVl4Z3MvUFdVTXZSZU9yY040MlFIeEwxOVVMZGNzclVaTFN4RkdQ?=
 =?utf-8?B?Q2NROFhkbEQ0bzhrSjBaYmFpN01CMkF2VnRIdXd6MFRMYmtmeHpHM29ZcU9k?=
 =?utf-8?B?dmJOQ0VPNVFUd1g1UjA5SGpNNHU4bzFhMDRQK3NqQzc1RUVnbjZaRGJ4aXZS?=
 =?utf-8?B?dTdoKzlGRSs4NTBqOGhWc3FoOUh5WVE3M1dBeFlsVFEwQzhzSUVwL0hhaW9m?=
 =?utf-8?B?aGtSNGRNYWdBMjVYakh6RHF6V0x2UnNCNWNMLzRYZ05FdDZnYitnVzBKWlg4?=
 =?utf-8?B?TFhWL0ltR0hjWWhiV0YxOXpwTmhBaEZlbjRlbkVXZmZDRTRkVk5IWnFveEZt?=
 =?utf-8?B?SlVmbVZOdzN0aSs3ekRIWUVSRTBobVBQUks5OE1ReGgzVW4zTGNsN1NsRkEv?=
 =?utf-8?B?VDI2V1VCSnBkcHZxaWo5NFdpU3Bxd0FGV1RYS0UyKzY4Q0J4QmJRd01XTzRj?=
 =?utf-8?B?RmxUWEtUaElBSitzMSs5Q2R4NUJadEhkQlo2MXFqYVdZcGVaZzExNEw1T2xl?=
 =?utf-8?B?VncyejU2a0NTQzh3U3VGM3JFcDgxN3VsWWZya2xZbWR2ZWJGdEJHZ2ZOa1pM?=
 =?utf-8?Q?4BBS7nnVyVW346+wO9V7UX8qqc7tdGcN4rZ3jvb?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0402MB3371.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4347509e-64eb-43c1-8fb6-08d96b62a44b
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2021 03:02:45.5789
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kFnys5GJhaOuPup9lUkLTcqbJNKfb4caHk8ufVdpPx1ry6/0AuPtV0sUoWX23qcGsRipQY6ByCmTmAp5INEXhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0401MB2298
X-Original-Sender: zhiqiang.hou@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=VPSHW8ol;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of
 zhiqiang.hou@nxp.com designates 40.107.0.80 as permitted sender)
 smtp.mailfrom=zhiqiang.hou@nxp.com;       dmarc=pass (p=NONE sp=NONE
 dis=NONE) header.from=nxp.com
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

Hi Jan,

> -----Original Message-----
> From: Jan Kiszka [mailto:jan.kiszka@siemens.com]
> Sent: 2021=E5=B9=B48=E6=9C=8827=E6=97=A5 15:53
> To: Z.Q. Hou <zhiqiang.hou@nxp.com>; jailhouse-dev@googlegroups.com
> Subject: Re: [PATCH] arm: irqchip: Fix the mask according to access addre=
ss and
> size
>=20
> On 27.08.21 09:51, Zhiqiang Hou wrote:
> > From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> >
> > In function restrict_bitmask_access(), the current access_mask is
> > implicitly assuming that it always access the whole register, but some
> > registers are byte-accessible, the Guest may get/set wrong value when
> > it issue a byte or halfword access to these registers.
>=20
> Can you be more specific in the affected scenarios? At least one example =
would
> be good.

Let take GICD_IPRIORITYR as an example, which is a byte-accessible register=
.
Thinking the SPI INTID 33 is assigned to an inmate cell, and Guest wants to=
 set the priority of 33 by byte-accessing.=20

Assuming:
GICD_IPRIORITY8 original value: 0x00000000
Guest set value: 0xa0

Then the current logic like:
The access_mask is calculated as 0xff00, GICD_IPRIORITY8 read back value is=
 0x00. Then 0x00 & ~(0xff00) get 0x00, 0x00 | (0xa0 & 0xff00) get 0x00, the=
n finally 0x00 will be written back.

With this fix, the access_mask will become (0xff00 >> 8) & 0xff =3D 0xff, s=
o finally the 0xa0 will be written back.

>=20
> >
> > Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> > ---
> >  hypervisor/arch/arm-common/irqchip.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/hypervisor/arch/arm-common/irqchip.c
> > b/hypervisor/arch/arm-common/irqchip.c
> > index 256af114..daae5512 100644
> > --- a/hypervisor/arch/arm-common/irqchip.c
> > +++ b/hypervisor/arch/arm-common/irqchip.c
> > @@ -69,6 +69,9 @@ restrict_bitmask_access(struct mmio_access *mmio,
> unsigned int reg_index,
> >  		if (irqchip_irq_in_cell(cell, first_irq + irq))
> >  			access_mask |=3D irq_bits << (irq * bits_per_irq);
> >
> > +	access_mask >>=3D 8 * (mmio->address & 0x3);
> > +	access_mask &=3D (1UL << (mmio->size * 8)) - 1;
> > +
>=20
> Are we only talking about mitigating wrong results affecting the issuing =
cell? Or
> does the wrong mask have the potential to corrupt content that affects ot=
her
> cells as well? In the latter case, we must not rely on the cell-provided =
access size,
> I strongly suspect.

Correct, other cells' content also can be corrupted, and resolved by this f=
ix. The cell-provided access size is not a problem as the final mask is 'ma=
sk of size field' AND 'mask  calculated from the IRQ assignment'.

Thanks,
Zhiqiang

>=20
> Jan
>=20
> >  	if (!mmio->is_write) {
> >  		/* Restrict the read value */
> >  		mmio_perform_access(gicd_base, mmio);
> >
>=20
> --
> Siemens AG, T RDA IOT
> Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/HE1PR0402MB337191DE611BA6CC480C104D84CB9%40HE1PR0402MB3371.eu=
rprd04.prod.outlook.com.
