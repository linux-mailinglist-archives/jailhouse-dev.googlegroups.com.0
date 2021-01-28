Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBQVGZCAAMGQEPSZAXAY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43f.google.com (mail-wr1-x43f.google.com [IPv6:2a00:1450:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id BB613306A55
	for <lists+jailhouse-dev@lfdr.de>; Thu, 28 Jan 2021 02:28:34 +0100 (CET)
Received: by mail-wr1-x43f.google.com with SMTP id n18sf2188636wrm.8
        for <lists+jailhouse-dev@lfdr.de>; Wed, 27 Jan 2021 17:28:34 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1611797314; cv=pass;
        d=google.com; s=arc-20160816;
        b=Kv/6kIINTM34yTf6fDU0qu8KB3Ow4cWHVeywk4ls5M/8WlZUYggxGXiLxNMZNjIjd1
         7KytnW0zpQ27wwnMdus3GtnpHvgOqS4mcwAZgEqs5hfV+lxE3nvKjidq1SiLHjEyX2Y1
         tFi5e/d2+w0FCEs2uHuesABBj2lQ7WZw/P305DmqTeWjucAUgXqk1kbAszvE1eCflFOl
         avV0fsC6umtvxTWt1u0NoDafyEWSZxdnmmIEF1nqCsue+MqifbMZk6d5eJqJkrZeFSRJ
         OcqtEh04xOmhWfOnHDbGE/bDDgquqj3yB01BdMOcSj09SWQMgZQtOs2irpt92zbmm786
         h/gQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:sender:dkim-signature;
        bh=vtM9u7+yvLtQlSdNn8kZJpW0b2E0dd//WAS1ELSXlMM=;
        b=LRE7b/bEFkaSgANKZTChkyEKTjqMc4AXJsqIVnxtFy4gWUIGvRV7+UoRLcqBgQuJyz
         jFY/1DpbRnQUIfXXBFs7IxnvyY4RrjNsp+aOX3bXPq2sNHBZys+H/X6N5yM8eVe3plfc
         xeMp4HN/mj22ekBuXgxQ+aU8PznL1g9vMr48WAn2e68z/WfgHVvz0KxrsFKFkm9/4LeV
         zsbSFpAr2G6PDqtmv7CcxOJLa4yjN0093IrOcvLbu4CB2Yd5f4VTWngUpSh7gOa5hUMh
         08QwtfkT/zq6wGjDJarV0WmCxdw5xIKO2/snuz5zZRZSLCMuDhRP9v/lLBzmjsuVfO48
         i5YQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=QObNY8Dk;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.2.64 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=vtM9u7+yvLtQlSdNn8kZJpW0b2E0dd//WAS1ELSXlMM=;
        b=cOS7aofuh8dUvunXT/djZ1EdswbA4++WGRomzBDTgRRKiUp8aaMJLEno7/Zk3LXpnM
         8sBnXdAGhYMtgs8aVPpyxWwMaH+uTYddn8rK4Zw0im0+qXM/UcAI9yEtg6RsZkhijcDx
         ViQLmjxoKM1wqOZI9ICV0tTJuIvYrw+j5LX4OUENM6h1qRkh/mKfK5g7qXtseXsPpuPy
         D4k3cWTuOFLB+0xLwXjuvXAeqGg7cKFy/L+RrQk3tRuZZFFoVt+ViPZeOsXN33KrWEu3
         s3dgOcOzygeLkEv4O6GCXJfzZ8mWE79fuoH4osQUrQIAvhhGi2aIk+UJj5ibslfUz76L
         Sy6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=vtM9u7+yvLtQlSdNn8kZJpW0b2E0dd//WAS1ELSXlMM=;
        b=P1ZlK9yOPTFhc2IU2TsVsEJFmXqCVUiAISBw8NItMxzA/cGj6OdGLLshT1gnUU3drE
         Ss3oR0wyRln2FnjD4RVJyN+jyH3HjYLIo4YIyCuEzmJRyvg80SGRMnZL11aPEeGtlm08
         MLdg2Nf/e+i20n6caCoZYlIqfoqyeuXC9UK361HdTFyTEeI9niVZhCZyo/2clO94mSQm
         hOxcjWzqkTmHFQSxyWBZjQqN+MYPaBtIpPu88dWGQoZJ/aYHnbz5guj+/lvhD53IE/eI
         vXWl3kmt3DpPdCne0msNkU9nmt6Ov/Mmwz/ySlOCe/4eAv9AO0XBxNJYOa3rupXG27Z3
         HlEg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533BpBp8DsH2IKYqU3HLtpu2LRo3kAQQVQpS6WabdRMhRyejR1YB
	2mzcK3H7P86PYGCn2llgcgo=
X-Google-Smtp-Source: ABdhPJy6U4UZSf6XCjugg6QDDbgfLAQoBCxQYWfH2VByXhMWVeAqk1LkEcAUP5pC+rB4v/lVznArLA==
X-Received: by 2002:a1c:398a:: with SMTP id g132mr6335167wma.38.1611797314443;
        Wed, 27 Jan 2021 17:28:34 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:f852:: with SMTP id d18ls836172wrq.2.gmail; Wed, 27 Jan
 2021 17:28:33 -0800 (PST)
X-Received: by 2002:adf:eb05:: with SMTP id s5mr13708982wrn.333.1611797313739;
        Wed, 27 Jan 2021 17:28:33 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1611797313; cv=pass;
        d=google.com; s=arc-20160816;
        b=DyT0HSKWGO/+d1dPN4eFgZJhSVk8RguLLQEWKIjZa3FPCi1KWlVhPGKnUEkAS21g1j
         c/Vh1SZnrriIZFF9KuLo7FvMiFqofzFq9h/buyzQSqL6li6saWYS95ifnP2kKLZ5b+0N
         mryhWCf8/S9eAzTka5Etg7Z9s/d0/SLpP3v8eKHlQ6Dp9FUvqMAUYsh02onWr6C923Lg
         Er4EUTVTnPshCFx1z6iGMF0ONtoKHiar/fsRMYDW1812cI5mbKLLs5GZLJnfmIz7dueu
         JiugoN/bLwY4RM7Awa/y9ArAOJ7s/hvUnj3mfp9b2OLmiE5X+rSLxlmQ3e9PvNEGU/XM
         rdFw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=tVefpb+QyutJsq9ZCaKO02wrBp40+rWXDsZmIts6ORo=;
        b=0TeV7+d7AQeo58w6gSsCAnsbkrL6LZCBj1Zrro8WpFT1TMzC3mmnEtQuZI2gN64AKt
         HO8orLEdYcKzzcafaNHdWiqMEP1vHIx9ND1AkWplXn7AmmrOU0oIxRkbWph/HGqq6tYk
         y8lkzS3Gp3teN1mW7U6sQkwX0ZnOsxeGOt4lMrnkuLn9le4PeClvUz+SA0wZokNak8fZ
         SutJlwuvJ4+or16XAFAmMQ8Yyw/uUeSrQZhHfrtkQXZ3JIszncDmWdfgtoGHnS/RqYAo
         jAR+Kz4NJ2bHdB9fzH1XHEQP9EjxpLb0kfezK0+HhIFobmJT1BvPWkCxgE0Z82gDE45z
         VVfg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=QObNY8Dk;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.2.64 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (mail-eopbgr20064.outbound.protection.outlook.com. [40.107.2.64])
        by gmr-mx.google.com with ESMTPS id w11si224289wrv.0.2021.01.27.17.28.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 Jan 2021 17:28:33 -0800 (PST)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.2.64 as permitted sender) client-ip=40.107.2.64;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SExmlnS9ybnhP2xXOV5UPCclxAAzGTZiSJVIUd3SCA9VkALGIXyAMI4qKzOaJWkMpTHxtTGkfn+vey0gv+MvJ8/ajk1ZKdREycObmY1yXL2IFbA4qltpWdYydhFjY4F+V1w6jDQ8wJMiaNNhuhKIhqeKuX/llrr/AFW8uQ1/6dCT30GKyK9FOlTwOq91oGoXduTBWksgws1ZBBcAL5w2wqWZDMNNgFny7NAxW4BA7FlxHOHUYD89GGIxfQs1lI88ASVs3qYcz+Q1JYS3XZhPdYk5dw1u/yOqIQueOHVRY+cOVCppR0hUnDxSUberVJpTEvosf1KGwgmRXhs4/0nXEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tVefpb+QyutJsq9ZCaKO02wrBp40+rWXDsZmIts6ORo=;
 b=Xmgyj1M2jEBvUfhj8FVWpr0vIqsSfmlTlaj+PvQ0UBr/UM/KN9nqf0VRMpidk0Zhx9hPUBfExKvCdUEU7MUUT0ev3WBzZZZAXMRGW9c6dAUvBbZ3UAkYfCZxaR7vES0WOm8MtJTQnLBRBk3TznLQrqh29qQoMkpL1vOfeteXJ5/BP1QaKAlDWM4PyBU9EKAgroRtw+uF3NTV3xV7HtTcgjTKz/Dbemkj3KInnOJrrZSVlpGzh4jvajsUlyxtU1Y/Kh/zyBvkQ5/JUvrUh79mzOFkewHm858gPblKr29Waz7JTj86R+HeGhAZGTbshHWu3UF+WP8NjjA00dObn6lKXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB5083.eurprd04.prod.outlook.com (2603:10a6:10:15::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Thu, 28 Jan
 2021 01:28:32 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0%9]) with mapi id 15.20.3784.019; Thu, 28 Jan 2021
 01:28:32 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Henning Schild <henning.schild@siemens.com>
CC: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>, Jan
 Kiszka <jan.kiszka@siemens.com>, Alice Guo <alice.guo@nxp.com>
Subject: RE: ivshmem-net issue
Thread-Topic: ivshmem-net issue
Thread-Index: Adb0i/jBtp5nKiTfRr2PQZyagum/CgAUncSAAA2R3dA=
Date: Thu, 28 Jan 2021 01:28:32 +0000
Message-ID: <DB6PR0402MB2760E2A8D41ACC217410A85388BA9@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <DB6PR0402MB2760C0BAFC4117D229FDD5E888BB0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <20210127195845.348673a3@md1za8fc.ad001.siemens.net>
In-Reply-To: <20210127195845.348673a3@md1za8fc.ad001.siemens.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [92.121.68.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d54ad607-0fd3-44e7-ab4b-08d8c32c066a
x-ms-traffictypediagnostic: DB7PR04MB5083:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB5083D227345CBF701442408988BA9@DB7PR04MB5083.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wr4kDBXLwLYBeQ8HoliMy22LpPlVGKdX/Km9drut3uqJXtFDrAkc/4vFaDvPZeSv7nVHdcXz0q1NcNGwD3CM/2Bwx0SSt0cwjvyev7t7uoOBaaSNneIBVy35mk8pCvqvmDGZEckRmMo0Q7OuM7MJRVhNccMjr5GY4PFWnS8LK2zFiyD4SdFcuWajZklfuOnqWuccglfQHD4CL+SsNQ2547M9MtdL9pUuf2W1LhCAW9VGbC3cnJvuoKsVlcfpsdgVHwQBidj09cgtJ0iDN80EZSDsvWQohVgbAagoBU3iz3nDqGImqFn/lKoSH3FusAAGFv9LRBqvZwRrojbZtBLtinzLwcgx+9VI8FZcoGRcfaUUUoB6rJobNHZzPn+PXCbBo3QP3ybXHuOx2pgddZmlFA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(346002)(376002)(39860400002)(136003)(6506007)(478600001)(2906002)(54906003)(83380400001)(66556008)(66476007)(55016002)(316002)(9686003)(26005)(33656002)(3480700007)(6916009)(64756008)(186003)(44832011)(5660300002)(66946007)(66446008)(86362001)(76116006)(71200400001)(8676002)(52536014)(4326008)(8936002)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?rrh1XPUmLG+RI1aXLDFwfJsyXwE5I7es1wrAlY554Z94e+wKxzgEcqgbZM2/?=
 =?us-ascii?Q?AkbdrFn6rUtWF3nHxdxAqQZETonTib5HxW8g44DT0g1rM71rryEbqk91+HJ1?=
 =?us-ascii?Q?MbLTzqxUlmLHW1te8qP4xl4WpQ6Ga7aXAj8fcxxaTUPf29e8ynTGa0zv5hox?=
 =?us-ascii?Q?wUYFHBJvzyF6CBGW5c2DBvWzuPsYV+iNMyahvJ4oR+J4yErf8ib8L/DhHUMA?=
 =?us-ascii?Q?sNIOGGbdRlSdCdpA/bDecupMy1VdIIPRP5nTDqCcUmqBM3Vx0kjQP0++bPM6?=
 =?us-ascii?Q?ZnVCl0JHmwp+LjLdX6ScSQ3fz5Px6iBZFQqfR9xF9ziPtvpOlose8yU/RYUA?=
 =?us-ascii?Q?f0/hfkJaLVJ2i233odrS2pD52pKkrE4U04h2B9Pnr7xeiHiaNMc5lOAZvOqY?=
 =?us-ascii?Q?XImOWbmXU0yLEknWc3RYHmXiD0c4wulTzQ0KutAKDqnqoqA/6XjapZXnljvh?=
 =?us-ascii?Q?ulznZBhwpenlBuL56iGxK8FobTopXBsapZgGaFYd+YQL2gP2A5onLqNi0ihi?=
 =?us-ascii?Q?kQdWPZjDdrLwlentPrjfFQTNYJdKnJJBe+4CAkvo/rm9OQXrupR6vgmTdAi+?=
 =?us-ascii?Q?3xxSmsCPUlzVWIZgFrH0c4OJpWBLWytugKdIePhqfg2FGVQszaENQKhn4DW1?=
 =?us-ascii?Q?kGFRYeoXxXfR9wGXXz6qfxiiL0eOntM3nsyhDQ6CvxgMFGqRG35plg0jl0fj?=
 =?us-ascii?Q?yR2iRdOyeOynQYIEqHNCEA0ThM6J8aqCFfeZWij/LETfiB7GtjnISu5XD0Ha?=
 =?us-ascii?Q?oHAKHbZMoTzcmQ4Ic604zGu+RgThFMfLXduwLzZYXaG3UQir5Afhg75w8y+Y?=
 =?us-ascii?Q?1G1co6/oawFo/h+2sOmvy1oPAz+uGUuudc14u/Qy8auPwnGRXvX9BNUi5Gfd?=
 =?us-ascii?Q?k/9H8M3OIWmVOrsOdwwyTVLOYx6ATZwGd5yMe9DX9JwVay1vk1I4Yuk9wQNg?=
 =?us-ascii?Q?8YTUS1oxXZXDctKk0i3th3iVJHP1Xj7xfozvIhZoekNrhsXt9a9HlqGKcEI8?=
 =?us-ascii?Q?/42m5h8owuRGk4EFwM6tR3PMFbZWofMXMEyg4GVfuidF9vjxm89hMWDG8skt?=
 =?us-ascii?Q?2EhmexQt?=
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d54ad607-0fd3-44e7-ab4b-08d8c32c066a
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2021 01:28:32.5676
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9Kr4U33jgd40TdMiHmxDvQydhXdF6a5sSzEzBYXug/xAJBTbmzFxgZzy4ID4dDQJzREpJiafXI7/nDSyCz8bEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5083
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=QObNY8Dk;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.2.64 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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
> On Wed, 27 Jan 2021 09:08:28 +0000
> Peng Fan <peng.fan@nxp.com> wrote:
> 
> > Hi Jan,
> >
> > When booting inmate Linux, I have ivshmem-net configured. In root cell
> > it shows as eth2.
> >
> > I monitor system network, and see eth2 is assigned a random address.
> 
> This is not "random", this is where some dhcp-clients end up when they do
> not receive an answer to their requests. It is a fallback when there is no
> proper DHCP server and machines still want to gain an address to potentially
> communicate. (zeroconf APIPA)
> 
> So it is worth checking the DHCP server to see why it did not hand out an IP.
> Maybe because of the random MAC that Jan talked about. 

What do you mean DHCP server here? The eth2 is created by ivshmem-net,
it has no physical connection.

Thanks,
Peng.

Or maybe that
> MAC was taken and the client did not have a valid lease for it.
> 
> Henning
> 
> > [ADDR]4: eth2    inet 169.254.232.89/16 brd 169.254.255.255 scope
> > global eth2 valid_lft forever preferred_lft forever [ROUTE]local
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
> > Use Iface default         0.0.0.0         0.0.0.0         U     0
> >  0        0 eth2 default         _gateway        0.0.0.0
> UG
> >  0      0        0 eth1 10.193.102.0    0.0.0.0
> 255.255.255.0
> >   U     0      0        0 eth1 169.254.0.0     0.0.0.0
> > 255.255.0.0     U     0      0        0 eth2
> >
> > It added the eth2 route table and will break nfsroot if we using
> > 10.193.108.x for nfsroot server, because it will match the 1st entry.
> >
> > This is not jailhouse hypervisor issue, I just not sure the eth2
> > behavior, it is systemd does that route change or we need look into
> > ivshmem-net to avoid update route table when creating eth2?
> >
> > Thanks,
> > Peng.
> >
> >

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/DB6PR0402MB2760E2A8D41ACC217410A85388BA9%40DB6PR0402MB2760.eurprd04.prod.outlook.com.
