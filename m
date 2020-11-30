Return-Path: <jailhouse-dev+bncBCJN5Z66VINBB44TSP7AKGQEVE3655Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3d.google.com (mail-yb1-xb3d.google.com [IPv6:2607:f8b0:4864:20::b3d])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3DF2C8231
	for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Nov 2020 11:31:16 +0100 (CET)
Received: by mail-yb1-xb3d.google.com with SMTP id m186sf15253145ybm.22
        for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Nov 2020 02:31:16 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1606732275; cv=pass;
        d=google.com; s=arc-20160816;
        b=l2EPiVvG4r1NiopsI/mrLxr1dpGbvSwPc7VGi0adp8ftQkDE4MhCyUSlfhQ5x1If9u
         oJjvmNfWb1FNlJvhW0IVXk4Ica+g1uXf2co1D3VOpyomWODUUGurjhCVdePxzEJCWnTs
         Y64rrVNzxi+2vs7xa2R+l+vt0zJa6+92mD4wOpu5x2bMWVIY2+c3cEl+BgB+PmOx7UhQ
         fj+LMhxVRgXhp8X5xbVSGxljpkICPLVzbAqv6fjMkTiOdWqEwsNYBtrGmS5wTrMseVv0
         gE2QpLauIz1RHD5rl6j1hed1PFlOWJPA3lVPtg6kGBLaVb/MMzRrntlnn+VO4zf/BQ/Y
         gy1A==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :to:from:sender:dkim-signature;
        bh=MfrGiS8Rv4nPenFdh+bqHJaaBDEUAvtNT7yWXI0nHbg=;
        b=00qiVYewj9iAmuJh2A9vX83XpVHimPPXvPurKHNSmF2El9WpJPSiQxNJiG7mxUaL0U
         4br2m/5HMijJyC1B1hcS98M+8LQxZl696Ur72mX8R7gHJN1l+LDfsRB7kE5EjnaVPDvi
         obpZX39APIiVa0bV29nXDiJBWMI4b1ijxTBP2DLIoUg1dl5O121yfP0u89K2T45c+wBQ
         piMB4ExdQRqjQBsVGBMKV+XCKOb4szGX9qNbvWv3/7zZtM/moviaP3hdIwEGOseTMPBG
         3wpE+B/QJH++SZb36S9x48TTtQgXqZrMwX8OcNfqCrCpUlZkhvIHTLVRhg8e2DC9+BIz
         lFJw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@ikerlan.es header.s=selector2 header.b=mF01BLRR;
       arc=pass (i=1 spf=pass spfdomain=ikerlan.es dkim=pass dkdomain=ikerlan.es dmarc=pass fromdomain=ikerlan.es);
       spf=pass (google.com: domain of msainz@ikerlan.es designates 40.107.7.104 as permitted sender) smtp.mailfrom=Msainz@ikerlan.es;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ikerlan.es
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :accept-language:content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=MfrGiS8Rv4nPenFdh+bqHJaaBDEUAvtNT7yWXI0nHbg=;
        b=A9b38IkdHHV8UAI3fUR6ojYhren/GQzS+LjS+JAMdRxsvuUglBF0qE7v+5Tj9VaFuI
         sCegqPmzEdqD6I/r/D2YSUfXNhr//m9OsXwdnrRN14xHo+LTNFy4R6cPzLc4EZTmPKC/
         o50aOO5rpwEy2cJHzIB6iKcyhFtev30auXIm6KmIejJrkq6c3JJNNtvSegXotkZLUkjM
         e1RwQmD6mi7DC1eaR+NCihg0+OpyIxXEux/yO/qn94nTgt2p4YJtBw8Za25MxK2bYO12
         Atw/+Hs/tHQRvOqnsnicho7AsfbFnD6mz9kkRf4Cer4dwUghgCRkx0cseZ+QN1pOv98r
         tfyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:accept-language:content-language:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=MfrGiS8Rv4nPenFdh+bqHJaaBDEUAvtNT7yWXI0nHbg=;
        b=gowmAstUV74S84br9iYTYMo4GiUjDrMD56MI01VDrdzJVTbSVEBY7R2LjtWFJjb5jf
         j1SyedFQpDwQDCfbRPugSioqkzPagUbG13iEEWou89oDpXmlU+MVCIEmYBOc1dIR0RB5
         ZvyEtEjJcDjkxn42xt1Bugo/HZ6z7sYzdAfejFBwA5ojZP44FoHcDudQIoVE+2Iqlbqs
         TF9kkkTZ+dB1mTkrqK41pNEdlTtNpi5BeXT+Qzzwq+2wbkeu16ncF7N9J/8JWnmZ/B7l
         hxi0KAEfCuhXYlA8oLK5dY9eHdDP8hw3NdVomRwkH5C9Z85/cBsSVBYN0IV2Z4Hb1JjX
         juPw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5328ap2jA9krgFE6CbcPVO4dyLXv38kv0gqEUS2zfNtmFr08TY0I
	NwHfPZy+bK0T01F4vKrSg5A=
X-Google-Smtp-Source: ABdhPJy9n+1GOOOMr7a+3iPvyhFbgQKyG2O7ScCp5NRqmg2/Heysk86AtBeP3zd8yzjoM170PQVAiw==
X-Received: by 2002:a25:7083:: with SMTP id l125mr34461294ybc.250.1606732275695;
        Mon, 30 Nov 2020 02:31:15 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:344b:: with SMTP id b72ls5478800yba.1.gmail; Mon, 30 Nov
 2020 02:31:15 -0800 (PST)
X-Received: by 2002:a5b:886:: with SMTP id e6mr24572683ybq.473.1606732274973;
        Mon, 30 Nov 2020 02:31:14 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1606732274; cv=pass;
        d=google.com; s=arc-20160816;
        b=ekBZT26EBA7FkWRlOSbWYGK1CvrKQfJWIaG5a0dsLiNzUy+CvLJrSiJL/AMM2l+Z1W
         cu52s+u8YvJgexmoXWmJEjcmOl8qMZd+99f1pxdxe5UgY1s48uZC1sUFRr2vvgjg9wQh
         nUTkgm7PTqRL/GT/4xehsEkGf/taeQ2Q5gzzyXhTV8x6XQH7nG2xXSzPs6HYz9movaYJ
         iABxSazI9IwtwrPy89Waa7GeuKa5Dk6PVVCjjeZZzOP+yKstlSua6fhOg2aQhcPP+RLh
         EBkcrxwscNaUpiP4i+qZSyruXMxxnSsLsKKskA8eUwliSZnWTr+NP4RTxmlcNDx5BU7P
         rpmA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-language:accept-language:message-id:date
         :thread-index:thread-topic:subject:to:from:dkim-signature;
        bh=XTsMxP31NAj5ffQ98aSv0Nrfc8Jdk+znrStSRjMfJ6U=;
        b=W8wb1bOMyuatYlsJqx2ukqItgagFHEIeL3ZeRInLuRr3fOlIX3dwB3wuRrCEBXYdqR
         XYNf9G2Xiw/AMIoRFEy+BVMj4+KujD9XZu0qPLSrFvGwVzBaIiBCohGeW9Zki/HvJu3H
         E6wm8yOt056dUwlcVrjP3ufwFyXDMrBLRZo5N/C6gvgK4rAJDen35UsDYf4okK+5/d+6
         QosQj3g/NxZDofZ+b2ieVr6+RuOFaqlUO1T5G8KByaOkoqlAFjq/tTLa4wCphkMMIJzs
         SQqIt9LxwZROt6di6+oKmm15YHYoNjnRx5quck3Qs9Rd7fO7sUPuglvLY0L9Tfe8UB1D
         JAZw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ikerlan.es header.s=selector2 header.b=mF01BLRR;
       arc=pass (i=1 spf=pass spfdomain=ikerlan.es dkim=pass dkdomain=ikerlan.es dmarc=pass fromdomain=ikerlan.es);
       spf=pass (google.com: domain of msainz@ikerlan.es designates 40.107.7.104 as permitted sender) smtp.mailfrom=Msainz@ikerlan.es;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ikerlan.es
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70104.outbound.protection.outlook.com. [40.107.7.104])
        by gmr-mx.google.com with ESMTPS id m3si1256410ybf.1.2020.11.30.02.31.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Nov 2020 02:31:14 -0800 (PST)
Received-SPF: pass (google.com: domain of msainz@ikerlan.es designates 40.107.7.104 as permitted sender) client-ip=40.107.7.104;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gDrEdblfpfch9qmRVHHNuBU2YHHsDrLTiTqSFZBEjwmHHk6Z4/+DWM5rLf4JZJtHnYdaFXdGjyMrwZSkZKH0+ZDk5M+D0Y9XudQSoIOxG7rK6nCWWDN6vENOVS4q84xshg8nKhX5GQOTMj0beDYlDmIqx2i+7xtS8nSR91FbGukcKlRKt9D2r7gPk3HjUYM/lXUoFj0yLGg3wJcLqaEeI5GSg4O0Eb7GhLy0mfLypQoKfy6kT2xiKcrh/udqeaIEWITLBx/huq6qZZryysA2JXkc25r9I3tkXrSubrnwci2L079ULUi4P80V5W/Rm9S4FbOZozOUUF8rddgdn+h0Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XTsMxP31NAj5ffQ98aSv0Nrfc8Jdk+znrStSRjMfJ6U=;
 b=IIokN2hpuEY4q7O+NxvTaAfBoePspJ/nX5RTb2g1OqIYH4Dx0Re3gVsGnWKwiE2+Cbz0jE7RSUqaTz2V7st2hUq4RnwjhPnJW+DguQEw85VvjWXAg0LYAG9jL2Ax3ZHSIRsxb9nJLb0L1xn1SuXPEj3M4qiDiSiYnH1FW4Jnqu3AWxAKld/b/JuMcPaLHCPEFMxCwTuZAES7uYYyYkTP3wW0R6F/mkUqD3zszYyuXoYlaBOBiK/jJp9T3aSb7XO5BFu8LnRrrvlhl+gvwUOaqgfl2SmEeeJfTJk0Q9CahIqFtztX0K8MNLrJlZNarfM6At0+cb6yWXVXowJuuZNz2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ikerlan.es; dmarc=pass action=none header.from=ikerlan.es;
 dkim=pass header.d=ikerlan.es; arc=none
Received: from PA4PR03MB7184.eurprd03.prod.outlook.com (2603:10a6:102:106::13)
 by PA4PR03MB7182.eurprd03.prod.outlook.com (2603:10a6:102:104::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.24; Mon, 30 Nov
 2020 10:31:09 +0000
Received: from PA4PR03MB7184.eurprd03.prod.outlook.com
 ([fe80::e85e:1f1d:9e71:5cd7]) by PA4PR03MB7184.eurprd03.prod.outlook.com
 ([fe80::e85e:1f1d:9e71:5cd7%6]) with mapi id 15.20.3611.025; Mon, 30 Nov 2020
 10:31:09 +0000
From: Sainz Markel <Msainz@ikerlan.es>
To: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
Subject: jailhouse: request_mem_region failed for hypervisor memory
Thread-Topic: jailhouse: request_mem_region failed for hypervisor memory
Thread-Index: AdbHA59mMTyyeCVKT82fCG3n0EzxOQ==
Date: Mon, 30 Nov 2020 10:31:09 +0000
Message-ID: <PA4PR03MB71849151EBE032D778289555B6F50@PA4PR03MB7184.eurprd03.prod.outlook.com>
Accept-Language: en-US
Content-Language: es-ES
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [193.145.247.253]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e1db8546-1ae5-4d8b-bd02-08d8951b0d5e
x-ms-traffictypediagnostic: PA4PR03MB7182:
x-microsoft-antispam-prvs: <PA4PR03MB7182F34A21783005C5D92E60B6F50@PA4PR03MB7182.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HaVPG9xU4EwtFPffX0eUAKrNv9UIJBk3nlj2uo0BT3Z47/JA7qLtYLirkKIN5PTCO/fk535SErMc96uJChmGwuf0c80/2xqsF0dekzBA9Ok9uLi4tk3UCdt2nvF0oUqwZcidrtp+Z1jK3+oRSmezhi+vnChA9K7tGSYU3PTCMhkxTx/ckpl7uIz36VEFfx2KTODYUUAfpg4H3Dq+p75OPWszImfZN4o/DsbuZmS2BobBYnrOGLeRPSaqcB4SaudbiGufm8IyeBQKLUYqpWXpOSjOud1siUh/o6pqBMZLBnbPMFNO38FA4eV2LEVa+WR2zRjrLGEM5kONtpo44CmPLMTmDcrbafhEq0dHY6t0RHHQG7AcXBFA4Hq90j82IVn19mKilKYWr1EThbmvMehT5tUTXI7CT6pj7xeaM883C8TvrdzjFuBqP+29UanM/sUVZHPot3KvsmOd215dJU6XMA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7184.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(39840400004)(396003)(366004)(346002)(166002)(8936002)(26005)(9686003)(66574015)(52536014)(33656002)(6916009)(5660300002)(2906002)(66446008)(66556008)(66476007)(64756008)(66946007)(76116006)(83380400001)(7696005)(186003)(19627235002)(83080400002)(6506007)(8676002)(86362001)(19627405001)(316002)(71200400001)(55016002)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?RXwrc5QT7LaOJzcEO2itYwALzvpNmZToAta+f7fhK27ucl7NmBUYoyKDGa?=
 =?iso-8859-1?Q?qsTzL0MvVnV7R5L/VXPooiI+mj8uIiKyoVCNdsxWOTDh5UyIb/B3f3YPyD?=
 =?iso-8859-1?Q?shznLjWg3yueKaXFwjmI5rrTaimbKVQUU/XiP5Wy5E2VDE4ejoQBmuQWwB?=
 =?iso-8859-1?Q?eGc3T7LOH7iRRXCyPjARbetmOACTXJNbcqvi0v99TfzLz7TX+vawLQ4AIq?=
 =?iso-8859-1?Q?h41YS2LYP6aZdboBRPn54vkpAhdBioO4Pr1fosmIwrjzklvx6vspPNhpU8?=
 =?iso-8859-1?Q?3eH6+30gWNlkrRIJSkWJbZc5crZ2qFV4NtVVHpPSwH3PQZ1wDxyG8LfvgI?=
 =?iso-8859-1?Q?LP+PcG9UX8x31XxKkKrtHtdIPnZWwWMidvLoRbqiRFdrhrd0+2uEwjJumZ?=
 =?iso-8859-1?Q?+dEMBmAO++qiJSQYxRHSbBZbJsrKcDMqnFRDtHMSjqvSDPaO7v39uUrVoF?=
 =?iso-8859-1?Q?schlX0L5nh6TYajwlIp32sTC9EHO1Hq9T/Wu+g6S9zvuGvAN4VKE3oqmtc?=
 =?iso-8859-1?Q?RSmX2rqeOH63tfgPbUVUJBk5P8UOwtuGuS9C+tpT+feQLtMddTtPgdGyR4?=
 =?iso-8859-1?Q?6iRZRi2pJn8cmFQ1wFN3xYZfHPb5s8PGZQ1CKEmPb2Zj+tM7f7O8ggqeWT?=
 =?iso-8859-1?Q?jJyqYd4Ax0VLuVBwyb64CT6iQNAIUxDNPd4Yq9m9JJ2h+xKI729+uUA3AC?=
 =?iso-8859-1?Q?89PItw3m1xJtIyO0nMxvzRfeZ3v7vHLwACmhtYgFCklyw3pyqMYPcbmQNs?=
 =?iso-8859-1?Q?I/GJf2+PZpF5r8zcl2YUkbaAk7NV5j8bFPuro4MvtzUxpzXxONeGmUMFuy?=
 =?iso-8859-1?Q?/Dg3riHz094ZcX7tuXcS9BD9mCWktHihlQcoWXRXCQURAYAFGemA+OkF6E?=
 =?iso-8859-1?Q?wQvYGy7ttdjv4Vfs/I0BT+7s076gKKjlvc5L1eM8ks/xGS2tSNQSNmlrDm?=
 =?iso-8859-1?Q?5B2idDogaZRNXeGwvlqtVAJDoJUquEHiDv7FGf9+D2FG+vBFsQmTLZWj8g?=
 =?iso-8859-1?Q?GBYgSDPDL6+GgjRHM=3D?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
	boundary="_000_PA4PR03MB71849151EBE032D778289555B6F50PA4PR03MB7184eurp_"
MIME-Version: 1.0
X-OriginatorOrg: ikerlan.es
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7184.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1db8546-1ae5-4d8b-bd02-08d8951b0d5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2020 10:31:09.3216
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 910ac815-f855-4a08-bf29-90b46552cf11
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HxkJQg0L6UIGg074LIa5l2EsxAdYR6Jp1JB8QVr4MIk78jiG0grM3wOCQANYLNQnB0ckDTCJY4tWHsX30zIRjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7182
X-Original-Sender: msainz@ikerlan.es
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ikerlan.es header.s=selector2 header.b=mF01BLRR;       arc=pass
 (i=1 spf=pass spfdomain=ikerlan.es dkim=pass dkdomain=ikerlan.es dmarc=pass
 fromdomain=ikerlan.es);       spf=pass (google.com: domain of
 msainz@ikerlan.es designates 40.107.7.104 as permitted sender)
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

--_000_PA4PR03MB71849151EBE032D778289555B6F50PA4PR03MB7184eurp_
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

After being able to compile all the elements, when I try to enable the cell=
, I get the following error:

/ # jailhouse enable root/jailhouse/configs/x86/sysconfig.cell
[  142.758697] jailhouse: request_mem_region failed for hypervisor memory.
[  142.760507] jailhouse: Did you reserve the memory with "memmap=3D" or "m=
em=3D"?
JAILHOUSE_ENABLE: Invalid argument

I've appended to the kernel the line "root=3D/dev/sda intel_iommu=3Doff mem=
map=3D0x5200000\$0x3a000000 vga=3D0x305"

The value of memmap is defined on the generated sysconfig.c:
* NOTE: This config expects the following to be appended to your kernel cmd=
line
*       "memmap=3D0x5200000$0x3a000000"

Any ideas of what can be wrong?

Thx in advance,


Markel Sainz Oruna
HW eta Komunikazio Sistemak
Sistemas HW y de Comunicaci=C3=B3n
HW and communication systems


msainz@ikerlan.es <mailto:msainz@ikerlan.es>
[https://www.ikerlan.es/resize/branding/ikerlan_icono_twitter.gif]<https://=
twitter.com/IKERLANofficial>
[https://www.ikerlan.es/resize/branding/ikerlan_icono_linkedin.gif]<https:/=
/es.linkedin.com/company/ikerlan>
[https://www.ikerlan.es/resize/branding/ikerlan_icono_youtube.gif]<https://=
www.youtube.com/c/IKERLANofficial>
Tel.: +34 943 71 24 00
P=C2=BA J. M. Arizmendiarrieta, 2 - 20500 Arrasate-Mondrag=C3=B3n (Gipuzkoa=
)
www.ikerlan.es<http://www.ikerlan.es>
[https://www.ikerlan.es/upload/actualidad_noticias/ikerlan_separador.gif]
[https://www.ikerlan.es/resize/branding/Ikerlan_BRTA.jpg]
[https://www.ikerlan.es/upload/actualidad_noticias/SINADURA_EKINTZA_BEREZIA=
K.jpg]
* Mezu honen informazioa isilpekoa izan daiteke eta indarrean dagoen legedi=
ak babesten du. Hutsegite baten ondorioz jaso baduzu, bidal iezaiozu berrir=
o bidaltzaileari eta ezaba ezazu. Milesker zure laguntzagatik. Behar beharr=
ezkoa baino ez inprimatu, gogoratu zure INGURUMENarekiko konpromisoa.
* La informaci=C3=B3n de este correo puede ser confidencial y est=C3=A1 pro=
tegida por la legislaci=C3=B3n vigente. Si ha recibido este correo por erro=
r, reenv=C3=ADelo a su emisor y elim=C3=ADnelo. Gracias por su ayuda. Impri=
me s=C3=B3lo lo imprescindible, recuerda tu compromiso con el MEDIO AMBIENT=
E.
* This e-mail may contain confidential information that is protected by our=
 laws. If you have received this e-mail by mistake, please, notify the send=
er and delete it. Thank you for your help. Before printing think about the =
ENVIRONMENT.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/PA4PR03MB71849151EBE032D778289555B6F50%40PA4PR03MB7184.eurprd=
03.prod.outlook.com.

--_000_PA4PR03MB71849151EBE032D778289555B6F50PA4PR03MB7184eurp_
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
span.EstiloCorreo17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:70.85pt 3.0cm 70.85pt 3.0cm;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-GB" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi all,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">After being able to compile all the elements, when I=
 try to enable the cell, I get the following error:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">/ # jailhouse enable root/jailhouse/configs/x86/sysc=
onfig.cell
<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 142.758697] jailhouse: request_mem_region fa=
iled for hypervisor memory.<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 142.760507] jailhouse: Did you reserve the m=
emory with &quot;memmap=3D&quot; or &quot;mem=3D&quot;?<o:p></o:p></p>
<p class=3D"MsoNormal">JAILHOUSE_ENABLE: Invalid argument<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I&#8217;ve appended to the kernel the line &#8220;ro=
ot=3D/dev/sda intel_iommu=3Doff memmap=3D0x5200000\$0x3a000000 vga=3D0x305&=
#8221;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The value of memmap is defined on the generated sysc=
onfig.c:<o:p></o:p></p>
<p class=3D"MsoNormal">* NOTE: This config expects the following to be appe=
nded to your kernel cmdline<o:p></o:p></p>
<p class=3D"MsoNormal">*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;memmap=
=3D0x5200000$0x3a000000&quot;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Any ideas of what can be wrong?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thx in advance,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" width=3D"370" style=3D"width:277.5pt">
<tbody>
<tr style=3D"height:37.5pt">
<td colspan=3D"3" style=3D"padding:0cm 0cm 0cm 0cm;height:37.5pt">
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.5pt;font-family:&quot=
;Arial&quot;,sans-serif;color:black;text-transform:uppercase;mso-fareast-la=
nguage:EN-GB">Markel Sainz Oruna</span></b><span style=3D"mso-fareast-langu=
age:EN-GB">
<o:p></o:p></span></p>
</td>
</tr>
<tr>
<td colspan=3D"3" style=3D"padding:0cm 0cm 0cm 0cm">
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" width=3D"800" style=3D"width:600.0pt">
<tbody>
<tr>
<td width=3D"200" style=3D"width:150.0pt;padding:0cm 0cm 0cm 0cm">
<p class=3D"MsoNormal"><b><span style=3D"font-size:9.0pt;font-family:&quot;=
Arial&quot;,sans-serif;color:#333333;mso-fareast-language:EN-GB">HW eta Kom=
unikazio Sistemak</span></b><span style=3D"mso-fareast-language:EN-GB"><o:p=
></o:p></span></p>
</td>
</tr>
<tr>
<td style=3D"padding:0cm 0cm 0cm 0cm">
<p class=3D"MsoNormal"><span lang=3D"ES" style=3D"font-size:9.0pt;font-fami=
ly:&quot;Arial&quot;,sans-serif;color:#333333;mso-fareast-language:EN-GB">S=
istemas HW y de Comunicaci=C3=B3n</span><span lang=3D"ES" style=3D"mso-fare=
ast-language:EN-GB"><o:p></o:p></span></p>
</td>
</tr>
<tr>
<td style=3D"padding:0cm 0cm 0cm 0cm">
<p class=3D"MsoNormal"><b><span style=3D"font-size:9.0pt;font-family:&quot;=
Arial&quot;,sans-serif;color:#333333;mso-fareast-language:EN-GB">HW and com=
munication systems</span></b><span style=3D"mso-fareast-language:EN-GB"><o:=
p></o:p></span></p>
</td>
</tr>
<tr>
<td style=3D"padding:0cm 0cm 0cm 0cm">
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-GB">&nbsp;<o:=
p></o:p></span></p>
</td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal"><span style=3D"display:none;mso-fareast-language:EN-=
GB"><o:p>&nbsp;</o:p></span></p>
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" width=3D"800" style=3D"width:600.0pt">
<tbody>
<tr>
<td style=3D"padding:0cm 0cm 0cm 0cm">
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-GB"><a href=
=3D"mailto:msainz@ikerlan.es"><b><span style=3D"font-size:9.0pt;font-family=
:&quot;Arial&quot;,sans-serif;color:#333333;text-decoration:none">msainz@ik=
erlan.es
</span></b></a><o:p></o:p></span></p>
</td>
<td width=3D"100" rowspan=3D"2" valign=3D"top" style=3D"width:75.0pt;paddin=
g:0cm 0cm 0cm 0cm">
<div align=3D"right">
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" width=3D"75" style=3D"width:56.25pt">
<tbody>
<tr>
<td width=3D"25" style=3D"width:18.75pt;padding:0cm 0cm 0cm 0cm">
<p class=3D"MsoNormal" align=3D"right" style=3D"text-align:right"><a href=
=3D"https://twitter.com/IKERLANofficial" target=3D"_blank"><span style=3D"c=
olor:blue;mso-fareast-language:EN-GB;text-decoration:none"><img border=3D"0=
" width=3D"20" height=3D"20" style=3D"width:.2083in;height:.2083in" id=3D"_=
x0000_i1030" src=3D"https://www.ikerlan.es/resize/branding/ikerlan_icono_tw=
itter.gif"></span></a><span style=3D"mso-fareast-language:EN-GB"><o:p></o:p=
></span></p>
</td>
<td width=3D"25" style=3D"width:18.75pt;padding:0cm 0cm 0cm 0cm">
<p class=3D"MsoNormal" align=3D"right" style=3D"text-align:right"><a href=
=3D"https://es.linkedin.com/company/ikerlan" target=3D"_blank"><span style=
=3D"color:blue;mso-fareast-language:EN-GB;text-decoration:none"><img border=
=3D"0" width=3D"20" height=3D"20" style=3D"width:.2083in;height:.2083in" id=
=3D"_x0000_i1029" src=3D"https://www.ikerlan.es/resize/branding/ikerlan_ico=
no_linkedin.gif"></span></a><span style=3D"mso-fareast-language:EN-GB"><o:p=
></o:p></span></p>
</td>
<td width=3D"25" style=3D"width:18.75pt;padding:0cm 0cm 0cm 0cm">
<p class=3D"MsoNormal" align=3D"right" style=3D"text-align:right"><a href=
=3D"https://www.youtube.com/c/IKERLANofficial" target=3D"_blank"><span styl=
e=3D"color:blue;mso-fareast-language:EN-GB;text-decoration:none"><img borde=
r=3D"0" width=3D"20" height=3D"20" style=3D"width:.2083in;height:.2083in" i=
d=3D"_x0000_i1028" src=3D"https://www.ikerlan.es/resize/branding/ikerlan_ic=
ono_youtube.gif"></span></a><span style=3D"mso-fareast-language:EN-GB"><o:p=
></o:p></span></p>
</td>
</tr>
</tbody>
</table>
</div>
</td>
</tr>
<tr>
<td style=3D"padding:0cm 0cm 0cm 0cm">
<p class=3D"MsoNormal"><b><span style=3D"font-size:9.0pt;font-family:&quot;=
Arial&quot;,sans-serif;color:#333333;mso-fareast-language:EN-GB">Tel.: +34 =
943 71 24 00</span></b><span style=3D"mso-fareast-language:EN-GB"><o:p></o:=
p></span></p>
</td>
</tr>
<tr>
<td style=3D"padding:0cm 0cm 0cm 0cm">
<p class=3D"MsoNormal"><span lang=3D"ES" style=3D"font-size:9.0pt;font-fami=
ly:&quot;Arial&quot;,sans-serif;color:#333333;mso-fareast-language:EN-GB">P=
=C2=BA J. M. Arizmendiarrieta, 2 - 20500 Arrasate-Mondrag=C3=B3n (Gipuzkoa)=
</span><span lang=3D"ES" style=3D"mso-fareast-language:EN-GB"><o:p></o:p></=
span></p>
</td>
<td style=3D"padding:0cm 0cm 0cm 0cm">
<p class=3D"MsoNormal" align=3D"right" style=3D"text-align:right"><span sty=
le=3D"mso-fareast-language:EN-GB"><a href=3D"http://www.ikerlan.es"><b><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#=
24ED31;text-decoration:none">www.ikerlan.es</span></b></a><o:p></o:p></span=
></p>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr style=3D"height:13.5pt">
<td colspan=3D"3" style=3D"padding:0cm 0cm 0cm 0cm;height:13.5pt">
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-GB"><img bord=
er=3D"0" width=3D"800" height=3D"44" style=3D"width:8.3333in;height:.4583in=
" id=3D"_x0000_i1027" src=3D"https://www.ikerlan.es/upload/actualidad_notic=
ias/ikerlan_separador.gif"></span><span style=3D"mso-fareast-language:EN-GB=
"><o:p></o:p></span></p>
</td>
</tr>
<tr>
<td width=3D"366" style=3D"width:274.5pt;padding:0cm 0cm 0cm 0cm">
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-GB"><img bord=
er=3D"0" width=3D"200" height=3D"96" style=3D"width:2.0833in;height:1.0in" =
id=3D"_x0000_i1026" src=3D"https://www.ikerlan.es/resize/branding/Ikerlan_B=
RTA.jpg"></span><span style=3D"mso-fareast-language:EN-GB"><o:p></o:p></spa=
n></p>
</td>
<td width=3D"400" style=3D"width:300.0pt;padding:0cm 0cm 0cm 0cm">
<p class=3D"MsoNormal" align=3D"right" style=3D"text-align:right"><span sty=
le=3D"mso-fareast-language:EN-GB"><img border=3D"0" width=3D"357" height=3D=
"75" style=3D"width:3.7187in;height:.7812in" id=3D"_x0000_i1025" src=3D"htt=
ps://www.ikerlan.es/upload/actualidad_noticias/SINADURA_EKINTZA_BEREZIAK.jp=
g"></span><span style=3D"mso-fareast-language:EN-GB"><o:p></o:p></span></p>
</td>
<td style=3D"padding:0cm 0cm 0cm 0cm"></td>
</tr>
<tr style=3D"height:10.5pt">
<td colspan=3D"3" style=3D"padding:0cm 0cm 0cm 0cm;height:10.5pt"></td>
</tr>
<tr>
<td colspan=3D"3" style=3D"padding:0cm 0cm 0cm 0cm">
<p class=3D"MsoNormal"><span lang=3D"ES" style=3D"font-size:7.5pt;font-fami=
ly:&quot;Arial&quot;,sans-serif;color:#333333;mso-fareast-language:EN-GB">&=
#8226; Mezu honen informazioa isilpekoa izan daiteke eta indarrean dagoen l=
egediak babesten du. Hutsegite baten ondorioz jaso baduzu,
 bidal iezaiozu berriro bidaltzaileari eta ezaba ezazu. Milesker zure lagun=
tzagatik. Behar beharrezkoa baino ez inprimatu, gogoratu zure INGURUMENarek=
iko konpromisoa.
<br>
&#8226; La informaci=C3=B3n de este correo puede ser confidencial y est=C3=
=A1 protegida por la legislaci=C3=B3n vigente. Si ha recibido este correo p=
or error, reenv=C3=ADelo a su emisor y elim=C3=ADnelo. Gracias por su ayuda=
. Imprime s=C3=B3lo lo imprescindible, recuerda tu compromiso con el
 MEDIO AMBIENTE.<br>
</span><span style=3D"font-size:7.5pt;font-family:&quot;Arial&quot;,sans-se=
rif;color:#333333;mso-fareast-language:EN-GB">&#8226; This e-mail may conta=
in confidential information that is protected by our laws. If you have rece=
ived this e-mail by mistake, please, notify the sender
 and delete it. Thank you for your help. Before printing think about the EN=
VIRONMENT.</span><span style=3D"mso-fareast-language:EN-GB"><o:p></o:p></sp=
an></p>
</td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/PA4PR03MB71849151EBE032D778289555B6F50%40PA4PR03MB=
7184.eurprd03.prod.outlook.com?utm_medium=3Demail&utm_source=3Dfooter">http=
s://groups.google.com/d/msgid/jailhouse-dev/PA4PR03MB71849151EBE032D7782895=
55B6F50%40PA4PR03MB7184.eurprd03.prod.outlook.com</a>.<br />

--_000_PA4PR03MB71849151EBE032D778289555B6F50PA4PR03MB7184eurp_--
