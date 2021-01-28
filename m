Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBB6FFZCAAMGQETWUAV3Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id 450B7306A53
	for <lists+jailhouse-dev@lfdr.de>; Thu, 28 Jan 2021 02:27:21 +0100 (CET)
Received: by mail-wr1-x43b.google.com with SMTP id r5sf2172168wrx.18
        for <lists+jailhouse-dev@lfdr.de>; Wed, 27 Jan 2021 17:27:21 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1611797241; cv=pass;
        d=google.com; s=arc-20160816;
        b=NIctekKq1y9DzIZufofxM5oK82SdlvQviqXIb7mFse09hgmpF/ql2dnrbe5dTY+z72
         EOnrP9YFzocbDmnYaUOE+oRQs5riC7FAiSPJ6Iy4AjSt8lRua5JUEbowojJt+y78E9/Y
         LMdwOfUlH5tWqlod9GFKWzW5xnhP2lzJVVDBXmIe2UDzGZcsUS24hlM4yIwCxWkMNAdI
         JGfFg2Z1KAJ9jnojKjCj0m0qBoIoRKOC4IcsIOc6ak59r9tQs35LTFIc2OE8qdHFPYH9
         we42TlgKovKrja18PZppShTK2hmvYbI3qPKN6Iukq2ciq+3DEYk9oyN7dvEA9YovqC5C
         UNfw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:sender:dkim-signature;
        bh=pyF/VpWqzO4SyEjPtQG0eAR6SD7Yg0Rtv8YHcvxXI9s=;
        b=j1srX9NBAJ8kD7O78cgSF89Z2N4WgQqaELR14FjNdOZEn1tsq3IXzGqQjD5WgAhMbE
         SHZ0bqkuewQlxYHSjT615llikv43kK1ZqVEw17sfWiBooThkgZwxTokPbIdt0urQdb26
         UyMJjhT5wcLSxA2VQdE81S5KoHd5LI45Qg595H+SdnXaELW6jMhekNcCink9sKe3C2pT
         9UMZbwkAnVOzkK3q1Auuw9a2wAqZD1+KLjLTco98UcfPjZAlJUdcrKuqocdHiJfOoR7U
         16g2WI7e218//55KiGbbKufb9LqZW0Lj7Cr0HDidVkEgY14y0ZyHSxI4dMYsr3yTQBm7
         EyLA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b="A8y/FtlD";
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.2.82 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=pyF/VpWqzO4SyEjPtQG0eAR6SD7Yg0Rtv8YHcvxXI9s=;
        b=XCCO59y6M9p++tp9jh0rh2g4PtidZXA4+gDSjlhTOqqWMtOKAWn5QoLl3SxWMLOBdW
         GzzVN8lVcl4rL1UXE+zzO4eOMnc/80tecCOpQIxWCTspgS4g+3NfoEwHKusFANoUTK8R
         wm30Q1Qn0me9ReC0AQ1g0+trPmIgu7FqwJfDA5HpankXZZN7iUOv1xXPMpVHHep3dOjO
         kq0FFZkZsJJoeXhnIwPIoQQx+KrEExReOy/LVHbJ0hxOm0C+oGWN18+OSbidbJgv/Poa
         oM/YjlnqpGpRWDZfyjp39Q0rFGcxjno140mLqZJkpSMtnIld4XukMIRpAQ+IGiRXqXK2
         TBAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=pyF/VpWqzO4SyEjPtQG0eAR6SD7Yg0Rtv8YHcvxXI9s=;
        b=jxTh2zQlxR6Pho/Ud7qNSGOTLIUfMUC9s8F5+f3GIpP4q67bA19lMle+9AxU+x8xMb
         H8D2OReWwRq/pIQkRNKwHcMEwkM4uWzAieNW8/R6vnHsTQB/R/ABnfEsck9aLWUAu4lR
         bo3e+tgyuWGMjFd8LwEM27EppxMXEMftDeMebNNTKTArLkeZKLEJ7h05lVJ29uzuKj4l
         5WD3Vzq22gugsABLgK3Nx7J8BCG95G9QhVIAoalIuv35VJknFMXs3MekfqAEoRIclHNt
         OtaE4fWoJHTcQI3Y4uzxJiOJeHQa7gDPgDxLWD3NXEvbtRHhzwSlAsdygZJsQUzakeXf
         OoRQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532G5h3fPNtlVBiLBMeyLVBlsMRCqRpZf5gCq3cQTOmrh9QRGQEp
	GGHmaSGRBqplNsGFPiuOlHY=
X-Google-Smtp-Source: ABdhPJyKhLTWTNV400v3mcC6koiohwV4aWJmr/UEk8bCffI6kzRiBq/6nDmK+6DusMxMc1VQ+S8YQQ==
X-Received: by 2002:adf:e7d0:: with SMTP id e16mr14051652wrn.363.1611797240996;
        Wed, 27 Jan 2021 17:27:20 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:dd41:: with SMTP id u1ls3441197wrm.3.gmail; Wed, 27 Jan
 2021 17:27:20 -0800 (PST)
X-Received: by 2002:adf:fb85:: with SMTP id a5mr13633758wrr.331.1611797240189;
        Wed, 27 Jan 2021 17:27:20 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1611797240; cv=pass;
        d=google.com; s=arc-20160816;
        b=aJ8Q5T0GAYX7kFxMPeoCt3AM6EZIVBROYieh23QcN3EQQGcnD0L3hTScA+JsFEJiCK
         wIJLiG3E3mCwjBwcvL+0Jzz3pYhJJDD9H16nWHKrkse2DH5sN+KDf01VpeDl0i0pVaR9
         msq+ZlopM1IfAPgNkC2wcURNYExYLHHQHko0ApjbPLhoX82msdkbckSkof65JFN45Yqo
         7u1cMDA7F3TX7iBYtIzSOHmtGDgfW/5ljdTiAO3dGfwojL1V+JT3ksOJRfbXzEzEJQ4I
         zP7QH6FZG1edwbEt0DiGrdxoYQ9v0fQF26y86hphHemoEon1ZCHbN847n8A97Ss/8s1B
         XLoA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=NEED6AEmXd9VbNqzWgl01ScztQcOMqXXhNLattMRFjs=;
        b=HdVEtggfEuSh3qMIZehjxuytRZE/NC4VCdOsM3KYw6R9S3gdAC25gMcqhHB+WHnknu
         O89V8O95ma8LUE5KUgzt7xE26E3DFgHfzR7jieF5o1b4ec6hkrIT4mcQ468MAZE3ElSW
         H+zv0Cqx/NALEc9nGwBtNKTg8CrW7C0xgJn6azgYqbB9yjfkbWgEdp/QhC9tyOUK2iX9
         pudevgGUk99UyD9qld+s03AN2W3Ed77avad+Nz7cyIgp0gMlLjiXk1xPKI9Wtf2PcrH7
         cJM4iG3jqilbnLDa+Qx8w8DTlvHJEfKaeQS4GRLXXsNoH9WXT0t/s9ULyU1hZFTWwB1H
         mM5w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b="A8y/FtlD";
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.2.82 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (mail-eopbgr20082.outbound.protection.outlook.com. [40.107.2.82])
        by gmr-mx.google.com with ESMTPS id w11si224199wrv.0.2021.01.27.17.27.20
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 Jan 2021 17:27:20 -0800 (PST)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.2.82 as permitted sender) client-ip=40.107.2.82;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V15Jyz9nD6BDhE8voBbpc7ht/Y7CQo5G1W5m/4OA3h7J8OqDEN9ZUzbok10TEYkem44223n6hjfPNnnfqALKYZenAUnNJWfK/MAb5F/swTCGDOAhPIwCWRSQLvHZg9TgR5mfKwDVIrXty7412i+GVchKGLwQmVvKiqp7Y6lc1k0clOmwDfzRNW1fmZ1tWtZtGYVSZD60qZcF0Hz2+3zKecNas9A/R6fQ53V0IaJ4dak0OT36rCxy+o6HQbMG5iSJmZpUIdv6uqmqQIC1R894zLKEckJIhIRReaEue2J0aZgFswz2XX7AHW/1l6RnMvfCgJQJH5yrm5aeKCtSWUdA+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NEED6AEmXd9VbNqzWgl01ScztQcOMqXXhNLattMRFjs=;
 b=aZgdsJrKOT0N/5wNldYacoR/Q8krSyzhZsReyVQFiVM27DYxS459ziHCO1GLNvTcnaHM89nLE993oqcCAAfiIGo9N7yGSFLaFQbvYF1tLsGyJANI0XDU5r7AC6sk4oUjH5iZJ/5W72cFvX8NHIZesNZ0O8gy0q63KsnVSK+gF58mka/IEiC5G0GdVQp32LP6NYKDxmplrqU4EAXSAyBCe4/GiM8IBS3vBUPK2aq5dp2BH/Ds/sJz/PPfvTQ8qfaPOlaqKhoc9gKG3xXtrc+cbZ9VhqrZPmZvkYHhRm0shcA+DUboLRZHzI6d+IospJt6euMM0CQMXGyMyVxOkPdvTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB5083.eurprd04.prod.outlook.com (2603:10a6:10:15::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Thu, 28 Jan
 2021 01:27:19 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0%9]) with mapi id 15.20.3784.019; Thu, 28 Jan 2021
 01:27:19 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
CC: Alice Guo <alice.guo@nxp.com>
Subject: RE: ivshmem-net issue
Thread-Topic: ivshmem-net issue
Thread-Index: Adb0i/jBtp5nKiTfRr2PQZyagum/CgANeKYAABSsuuA=
Date: Thu, 28 Jan 2021 01:27:18 +0000
Message-ID: <DB6PR0402MB276080104F69211A21A3E3D488BA9@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <DB6PR0402MB2760C0BAFC4117D229FDD5E888BB0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <919da75f-be40-9b65-b260-2373403275a6@siemens.com>
In-Reply-To: <919da75f-be40-9b65-b260-2373403275a6@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [92.121.68.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: cb964199-2a03-4626-4fcb-08d8c32bda98
x-ms-traffictypediagnostic: DB7PR04MB5083:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB508351213C01887DD2A53F4488BA9@DB7PR04MB5083.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: brSfUrGVvxy7hXX/w0wz1BXieEGylwHAM0Lqw9pb2dqO1iGsYTYXWnT876xz5pp7gXUPX9jbIJqHV8JNn9DJaNyFzspz0vZ48dRYeM2PqQeclSbNlL5RSEbuQzsH6nEcpGP03fUf8X+Rc45Bp186QHNxyEgvX8nAR6Z1pKtNQlDXXnDyAkYUP6BWskGkJYR0aYNkGUYccuggL5oI5tg7ibBMkxftAekVDZ3uQhMCHOZIOi0/n8/YGV+PuqZXp1yKUv+oaNBOV+HYJWtbFk65h5O9mr2lSZdPvkRwCw3P6oeh+9/XUYidyjB/MKRzEGp5lu/Gqix4dz+LeAzj3U/V20Fkv8TXY6kWPTO/bNYyFPcBk8vLRimjeNkfWswOFpiI8fpsfFeDyMwEerRYkyLx4g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(346002)(376002)(39860400002)(136003)(6506007)(478600001)(2906002)(53546011)(83380400001)(66556008)(110136005)(66476007)(55016002)(316002)(9686003)(26005)(33656002)(3480700007)(64756008)(186003)(44832011)(5660300002)(66946007)(66446008)(86362001)(76116006)(71200400001)(8676002)(52536014)(4326008)(8936002)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?bFRlU0xCbi8rS2NNN2ZTWHNQd2hCd2tNUTA3VVlza1lCNDVhVkRqMXdZVHJK?=
 =?utf-8?B?VlpPQVM1SEFOMVduQ3RVVW9BRFkvcHVETDU0YU82QVZjNWJZc1lLdUNkUWU3?=
 =?utf-8?B?SUhDVkNOR1dWdEplVkg4V25rZVBtWlJvK3lsUWNPV0FpUVRyZ0Z0QzN5ZmND?=
 =?utf-8?B?SnhzVmQ5QlFYUlV0L2NEN3plSlQyRmYwdUt5UXhPYVZNS1pFdjRWZU9qWEJD?=
 =?utf-8?B?UU01dEpYUExuNVN5UTUvYjAybHQrT2lvc3k2ZWtsQy9DTUxuSlJ6ZkZCNEdi?=
 =?utf-8?B?VFB2OVZvTnZ2bDgrdU9PZFFCR3hxSG1KYlMya3ZhSXBra0xPM2w1TndBZ2h1?=
 =?utf-8?B?bTdINzdyZ04zejZ4bHFjNDVGa2lmR2tUL29KM1o1RFBkUE14NnpSTE5hMFB1?=
 =?utf-8?B?QnI4NHpnNlhVN2tFSWRRdFpWcndkUmRFRmp4TjJTSzJXRDJKblJVdUJwM3A4?=
 =?utf-8?B?ZFBSVzRWZmhCQmtCV3JJbHQwQTZ5cDErRjdSY2hoOXpmQTdOeUh5QmtUMVIy?=
 =?utf-8?B?M2hFbFpOSGFjQzNkOWt1RDBSQ3o0cmszR0V5RDNZalFYRmZ2N0ZudDUxMFFD?=
 =?utf-8?B?L1RKYXA5ck9DR2xtbnhWb3NxTGxVMkdPMzJFQmxVYVJocFUzQzN1WUdka2li?=
 =?utf-8?B?U3YxSHpLb2cyN1ZLaDFNdEh0OTZrcGhKSWZSWHhXRTdsU1BZZEZCLy9aSUtn?=
 =?utf-8?B?cTlDSzVFOEk5bVJrY1VkeDFTWS9mYUtLMmJzc0hDaGJ0RlNnODBnRjU3L1V5?=
 =?utf-8?B?T2xENkZyK3crVWlqdE9weFZGN0hYaUxEL3IxcFpGeU00RHljK0NWYWdHZGxx?=
 =?utf-8?B?Tmk5TkVrWG5sK0dKaGZoRDRnMXk2TWRZWmsvTXhadEJVMGpSbmd1bktzMWFE?=
 =?utf-8?B?dkhqSm9FZzBsc29kWkdNL1lKc1pOcVVGWW1oNWhVTEVnbVowaHF4dGcrcDBp?=
 =?utf-8?B?ZnhkaTA0RzN1TUhqWlFpdTU5K0ZrNkxXZlEvYi8yV21qRWVtN2hZOXdBWndp?=
 =?utf-8?B?NjlLbVFsZEt1WnN5dW8ySG8vT2pkdGV0MVA0Y3N0dGErV3d6WnNkZnNxbVJK?=
 =?utf-8?B?QU83WW5iejF5NXgwbE1idThhTnZCbDNlV1h2T3U2c3E2S0ZsSEt3K1VBa3JZ?=
 =?utf-8?B?ajdQNjFSaVpEdzJ2OXZXYy9pSGlCUkVQYmkzY0NWRENsNlhIbk5CNjErQVlV?=
 =?utf-8?B?dVkvbWoyWGloeVpPdm9TdVR1NUU5RmdWZ3I0TGdoelBVbm0xQVJRV21wL3Br?=
 =?utf-8?B?azIyUVo2c0JtN2h6cVdSRE16ajl5cWFBbUVyRWVPU3NNbmFveE1LMVBkNzc5?=
 =?utf-8?B?NCs2S1VvZFEyQklwVWpiK1JtcFVFSjIrdVZ5cnZld2cvQ29mclMzSjlCdzFZ?=
 =?utf-8?B?WjhpQzg3WmE3TTQ5Y3Rtd09Oc2NvLytEeUxGcmtHNW5Zdi9CMVRoN09uK0Q2?=
 =?utf-8?Q?LgwS3sRr?=
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb964199-2a03-4626-4fcb-08d8c32bda98
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2021 01:27:19.0490
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /alDLNvrU1mcT+0ROm6A+GAILcSuJODEoPSlQZrNgWBheY7L5HwDZJDyQh+QdiROzj7AWX+AenKiDFtRQN6Fvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5083
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b="A8y/FtlD";       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.2.82 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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


> Subject: Re: ivshmem-net issue
> 
> On 27.01.21 10:08, Peng Fan wrote:
> > Hi Jan,
> >
> > When booting inmate Linux, I have ivshmem-net configured. In root cell it
> shows as eth2.
> >
> > I monitor system network, and see eth2 is assigned a random address.
> >
> > [ADDR]4: eth2    inet 169.254.232.89/16 brd 169.254.255.255 scope
> global eth2
> >        valid_lft forever preferred_lft forever [ROUTE]local
> > 169.254.232.89 dev eth2 table local proto kernel scope host src
> > 169.254.232.89 [ROUTE]broadcast 169.254.255.255 dev eth2 table local
> > proto kernel scope link src 169.254.232.89
> > [ROUTE]169.254.0.0/16 dev eth2 proto kernel scope link src
> > 169.254.232.89 [ROUTE]broadcast 169.254.0.0 dev eth2 table local proto
> > kernel scope link src 169.254.232.89 [ROUTE]default dev eth2 scope
> > link
> >
> >
> > And also in route table, it added two entries going through eth2, I
> > not understand why it will add one entry that default use eth2 with
> > gateway 0.0.0.0 #route Kernel IP routing table
> > Destination     Gateway         Genmask         Flags Metric Ref
> Use Iface
> > default         0.0.0.0         0.0.0.0         U     0      0
> 0 eth2
> > default         _gateway        0.0.0.0         UG    0      0
> 0 eth1
> > 10.193.102.0    0.0.0.0         255.255.255.0   U     0      0
> 0 eth1
> > 169.254.0.0     0.0.0.0         255.255.0.0     U     0      0
> 0 eth2
> >
> > It added the eth2 route table and will break nfsroot if we using
> > 10.193.108.x for nfsroot server, because it will match the 1st entry.
> >
> > This is not jailhouse hypervisor issue, I just not sure the eth2
> > behavior, it is systemd does that route change or we need look into
> > ivshmem-net to avoid update route table when creating eth2?
> 
> I would suspect that this is something specific to your network management
> system. Is it systemd-networkd?

Yes. Just not understand a wrong route table to match all is added and use
the ivshmem-net created eth2 interface.

Thanks,
Peng.

> 
> In any case, the only things that should be more special about ivshmem-net is
> that it comes up with random MAC addresses (which is unusual but not
> unique) and that it hotplugs (which is rather common, thing of USB WIFI
> sticks).
> 
> Jan
> 
> --
> Siemens AG, T RDA IOT
> Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/DB6PR0402MB276080104F69211A21A3E3D488BA9%40DB6PR0402MB2760.eurprd04.prod.outlook.com.
