Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBSOKVL6QKGQEZJCJO5Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x43c.google.com (mail-pf1-x43c.google.com [IPv6:2607:f8b0:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id 664172AD8DF
	for <lists+jailhouse-dev@lfdr.de>; Tue, 10 Nov 2020 15:35:55 +0100 (CET)
Received: by mail-pf1-x43c.google.com with SMTP id s12sf9446666pfu.11
        for <lists+jailhouse-dev@lfdr.de>; Tue, 10 Nov 2020 06:35:55 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1605018954; cv=pass;
        d=google.com; s=arc-20160816;
        b=mej7HHZ7j1Y7jiQrBzTlgqEkPcwy6wEqRfjaNoefgPS9Yyzd+z2KZOTwXEnnZNqMqC
         v3Lm7NZ5Sl0lu4RDbC9DRxt5qMMghyQ176V9hp85pw8TGafvtI2DRB1ZgI3VFUmpsdfK
         uOjYmj+iedYTmbVvq1oWl2L+fA6MJl95S33omjFzymFFJ8rmdoeLlS2Q3lZtBoyI6C1w
         82s7rSfJr/M7Qi3JG8xRoZBtdoGz2bIjksD4+zOJU6HZatjQc4RLqd2hbwOjC6csxpuU
         atUcyDrXO2VCjqiyZHjqIbT2yRjPMg40mnUVh5NWPE5UaJHynpuL9NPmQHDX/Xg9ZHEi
         MC3Q==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from:sender:dkim-signature;
        bh=rjrCebsHpyCzeGuVTiWt483VgR2sW3SMZoMSX7/w7Lc=;
        b=OBDUaaCNaGK7WIb8J3ZdqO2WoHzAAQEUwdVu4Jn4xCevkgMLqh0L5sulcZkwPVQosS
         kew0f7JxtM3jJdGLcO8SAfuPCNFsuft6H9JTFERWO0ucTc6VQ15ffgyoQFLA3Gz5miCu
         L6+GylifYTMCaAST5maId3YztCeT9xTHeqs1tNHGvGUORq4EoGkFVPuJ7YKNWutiOhJb
         B6R8TS6VgPdhC5IYkY+qg7Fx3u+K962VzGDw1ZFdPQemg/VKN4k4Qz9d/QEEwNfuo1e2
         uxX+9YB3gus9Td0jIswMwvNq7nCDeE/vZdTrSrT4eLqO3YVIjpZciUUnm/uVZsXtrVdY
         rG2A==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=Z0FCbY+a;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.13.41 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=rjrCebsHpyCzeGuVTiWt483VgR2sW3SMZoMSX7/w7Lc=;
        b=jjLzaJ3wLhOQ+GalrMMX47tTAt6QyPlZ7HzpDAzoyXMlVGj/VIFIg+P/c3KrElUUVP
         Tq0wfSfN1i7/JQa4VnXgoAkI3WobL6uF/cgFJu20OJrRCFTh6XbOzQtI2tIB1LbDWmXT
         j7WJUOSfZrD7wP+fpQhCdh/WgId+2WB62woVxvDE3GHmDsbFwPtre7TeQR4xPD8mNKHt
         wyXiL6xqtJRczpvO7rPxSUPXELIp27Aics4KnJhnDKSZovN/mThawdXJGdBVdC4QXUC/
         uxXIYQ7kL96hKE48xFtHjQbSMKYq9HAs3Ck6yOGnB7xILWC2GIDFjSyMzVU4OvjGKYKg
         6n/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:content-transfer-encoding:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=rjrCebsHpyCzeGuVTiWt483VgR2sW3SMZoMSX7/w7Lc=;
        b=TphZ8cY7PrSmfR9q7zAezOf7NmLtxH4S98jOJ3micuHgW0hsfx539EK4YKjtOj2V9t
         QdD06I+is6LChpDBma8dxF36fxjYBhMim7SF67rek+ktuaoP1Xrn+eyX+vSI8stWjwur
         NNhte/y5PwA8rzarG+bqdczTma9xVZLGMt5HCQ2oWtZB0eSU/rB3mABww95HDcT8+cSn
         g/kUNJAYiG4Vds7Wksc5xk9EXtFcG0Mc5y5dLHBuHqRKbkz8Gb80HhzggnmvxJza8/Vb
         EjuZPD6ZTvW4dhqmJ/nrgptjuhc9YGZ2uo1Uvtq7S34lZ5Rz5nfnNgAomH6YZEzg25fc
         8mkg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531wzs0whRYzRLF5Qu4VUsh2ZhH6RfBZ1njImtjBwIWQm2kxjO71
	I8wpe7TzBLV1fRaDmv/obgk=
X-Google-Smtp-Source: ABdhPJyW0XQhrut5JtxYlLl6LZCXDGv0OOUTrpG3ID43HSFkuCHfgWAKDOCX2UyDHx+T9+hWrF+gLQ==
X-Received: by 2002:a17:902:868e:b029:d7:eb0d:79e8 with SMTP id g14-20020a170902868eb02900d7eb0d79e8mr6094632plo.12.1605018954031;
        Tue, 10 Nov 2020 06:35:54 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a62:483:: with SMTP id 125ls4774262pfe.6.gmail; Tue, 10 Nov
 2020 06:35:53 -0800 (PST)
X-Received: by 2002:a63:7703:: with SMTP id s3mr18020989pgc.9.1605018953013;
        Tue, 10 Nov 2020 06:35:53 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1605018953; cv=pass;
        d=google.com; s=arc-20160816;
        b=JIdUSmZtrjcRVAx07ZJuDLIGj5w5EiT1HnAsolAX1Ti2ARCOYgJPfW57Azw7iSwcKY
         Yo3IDLSeU3JMYeS48L+3n6MOkXwowvxXpeG9Fn5aMtufSbTdHEyNElr3Z2upZtV6+h1J
         DeaQvzlFLd5g9uoe6oz+PpTFtVa4at5dXiCLpHxSnx9Se8PoqiO/Vg/LNTjaI7HEKpLJ
         gOXg74nbJ3yon3MOLDrlyQUXklFTw2CM8SVPm4z0LPY46YaGjtLE1C1Q9ZkO0tJu7yHk
         mXTFkWmwUG9VA4KP9Dt7VBjXYam5T4Vf83dd1EyQq05ZaNr/S5NEPDopuxpuy2l1J1B3
         uppw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature;
        bh=7aKo7hNxZK0MdtU+p38hIiCRTHelTeMt6/31YXz53eQ=;
        b=ydHZHzcjwPVd9JFxTSBYcBln7sfJ/Cg56T9MQH2fAwjrDTklOjjJcHu/XJUNTtlam6
         HxiA12LmKcliP3X+PRZBlQCTHzpuwQ/Qx2YYL5wORYl6PEKdx51ghcU1I+2Bd/Um/5Sx
         72gFsnNQI6zAne0R3tb5dMQmRh8NkqzTlx2u3uO5BO9rTDRqUkwQ/t7lDhqo8Z0/Cdh5
         N+nakgLDKlPebHAI98KMKzA9WI+ydwRafAVlUh9Y4bQ2xZDgx5XS/DSC0vjZvgNBKh2O
         Gcb4NRqRGy+F1EAE7EXqaWPThFZ4sOdQKKZ72d0E7Xzgqwbz2IathLUEQ9BDCeSrw4O3
         jJTA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=Z0FCbY+a;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.13.41 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-eopbgr130041.outbound.protection.outlook.com. [40.107.13.41])
        by gmr-mx.google.com with ESMTPS id z12si250247pjf.3.2020.11.10.06.35.52
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Nov 2020 06:35:52 -0800 (PST)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.13.41 as permitted sender) client-ip=40.107.13.41;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VQxPzmb4CAo1CGMJKNNqzWZBgpkDPOGKMatRDhC3GCQN+/294I0coB218wbzQxfKRDYQ85j0KBswjkXesf0PSlxvAMPuPVTdvcYmyv11kl19gsnk/2YIlCZXCjY7XStMZc2wCoReq7NvMdq9dK4nuh6CU8pHMpNMDg0JOPd+WcZdS1YSB/kP4ikVvoCw5WAXdaYDcRNRrhqJSmELI9nBqs8mioI1BJ09lVt9NEPUGVy/+Z34/9ZVP4OBJlP8IB8bMZM6ANGTvUcNxHXNlc6YAsipLv5scVcTWLiL4fr+2IZwv9Subc/DsSOzq0NEKpqo/6cXUuiYuQprvN9dUp6AOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7aKo7hNxZK0MdtU+p38hIiCRTHelTeMt6/31YXz53eQ=;
 b=aBuWRCscTALjiMAlul7QZMCTQfi5EaLXUVbMnOcJ4H5HqAizC+dx6RqBxG40lUyXe+9fLlpKVisB4yr7frXyaWJ2Z5B2TI0zsj61D28sSAdEyW1QgE7ULJbP3XTyRk8W6/HFkHXc4BWLNQEvuFtzA8g/h2hytsQ+/ixLSYzcCeQfenxT6JgtOKMV3kW/JoyjS/zHhpBdl0gVtSJfaof0vIujxbbhmQemlnhP1E6kYCb9V+3FwnxTA4I14TW8wKlIxP4IemXtAtwyPZungv1lM2oD8ZvkMq8ROhm1pZGCKDv3P3AAb40PQsYb80mwtqYBDl92RWVWnSPOWTo7UZbGGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB8PR04MB7050.eurprd04.prod.outlook.com (2603:10a6:10:129::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Tue, 10 Nov
 2020 14:35:49 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::ec42:b6d0:7666:19ef]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::ec42:b6d0:7666:19ef%8]) with mapi id 15.20.3541.025; Tue, 10 Nov 2020
 14:35:49 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
Subject: RE: Jailhouse Hypervsior on Slack: New Account Details
Thread-Topic: Jailhouse Hypervsior on Slack: New Account Details
Thread-Index: AQHWt0LWLF0EGLnuhU2Kg6TsZUW/xanBHSSAgAAD9wCAAE2BsA==
Date: Tue, 10 Nov 2020 14:35:49 +0000
Message-ID: <DB6PR0402MB2760C66DE7FD74F9350EDD0588E90@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <01010175b1758008-a5c3cccf-f630-4771-9a1f-5ecdbeaa73b1-000000@us-west-2.amazonses.com>
 <ea6be253-519b-83d7-7d57-01563593712c@siemens.com>
 <b1cc6338-a8d7-d324-af4a-f263eee31909@siemens.com>
In-Reply-To: <b1cc6338-a8d7-d324-af4a-f263eee31909@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [92.121.68.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f0c5dcbb-8148-492b-3c67-08d88585eb1c
x-ms-traffictypediagnostic: DB8PR04MB7050:
x-microsoft-antispam-prvs: <DB8PR04MB705088F70F717B7EE4E383F488E90@DB8PR04MB7050.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OIABtz19YLzpcX6hHFuspQlGE8+7Xf/bKH5Vms0D3d9x0DVhpuH/VPM+FRxaIa8xbVOUILg6krBAs8xK6szjp+69uYqpWiOxZiwQzSxzWoYwgVzzcVQcCGgPVNfYlJYvdKemPwGOvNmR2RYckQtPVP7W1VZS7UwmgTxOmsl7LJ5SaoZfZEwWpZ5exuYNxyQgJi0LTCj2/Dh0XEgjg4sT5Gh+V2aRMbr4uaDuoKgoMY1OnX5GML2UtZraVzVp1YRpq0zvqK0hiNupLSJeRDCKuspgwvvT9ctco9ywNJsNJQd8fUupL0VLhOhoV5wukOkSHBFRTTq3Nlv34CEqhK6iCeOyq+CslmgiPny8YMuTOMOmrRIZzWqg8HGbPWj7i0OUDLbh9r+vleB1weJ+QMEVHQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(44832011)(33656002)(52536014)(7696005)(8676002)(966005)(2906002)(83380400001)(53546011)(186003)(71200400001)(8936002)(26005)(6506007)(498600001)(55016002)(45080400002)(66446008)(66476007)(66946007)(64756008)(5660300002)(9686003)(66556008)(15650500001)(86362001)(76116006)(110136005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: d7+MdSFxrXsEtW8EEJZhumjfpLZ7koDGjy9dzGlvic+NZnxOY1yL6osQYQfqSWtOBXxkph9TzNuPsk0+DPgi/JL05GMUx/Z3zjxfqeDCf2LYVmRCHvtAZprms0QNd9yB9pTd2gDmI6oN3Ye4rWdYOdIWwaWUzIAUK6eKahEoj1B+9X/j1NJHxlf4bcO2ZPRmvXVGvHNJIszovD3IHPlOG8ivtiK25lxtNauWKeZTMjlWR346pIbevtQVf/U8g6306877MCupv3+UkPGNZj7lcazVKZtqSbLB/TYRExlN8j+o9tEBVijuF9B/1Y/BZO6eGDMI4Ba2mZHSpjsaynML7MvVwmYHSJ7+FbUkHPNd0AyhB/3DVWZ5ONVHtubhSZ++yun9gBaLmGK5W0LQJZwWL9YjDkcm3b/7lEZaG1rhs2Cd04CpzwjqEJ7ydyUgV/IGPkUPyqgpH4eIFiWo88vW/My7JXIMT13gReegNf0pjYEhFIfsSRqFLI3gMZrGI5je/iqFvOTDFTy2xQwrxXIAchHXAznBtwrkKgSjcd3U5NCrJSpj6yrGE9NuO2VBKpnSDlR/PVq1pjZ82WSfp/r3lSdXmQ6UO5vUcZBcZlT98onLcfqUGQf4AWYGLO4+9/+OjcfXskkFZxsCEE6DVIKiEQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0c5dcbb-8148-492b-3c67-08d88585eb1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2020 14:35:49.3796
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z45JnV6O/OQn5fulELOo9ewRfC/bIDGQkxCuHrRo8uXqWT9ySlJ5T+pHGadM5ULIGMWqin89UAdXz6K7m6QSaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7050
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=Z0FCbY+a;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.13.41 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

> To: jailhouse-dev@googlegroups.com; Peng Fan <peng.fan@nxp.com>
> Subject: Re: Jailhouse Hypervsior on Slack: New Account Details
>=20
>=20
> On 10.11.20 10:42, Jan Kiszka wrote:
> >
> > On 10.11.20 10:21, 'Slack' via Jailhouse wrote:
> >> Here are your account details, along with some tips to help you get
> >> started.
> >>
> >>
> >>   Welcome to Slack
> >>
> >> Ta-da! You=E2=80=99ve joined your first Slack workspace and we couldn=
=E2=80=99t be
> >> more delighted. Here are your account details, along with some tips
> >> to help you get started.
> >>
> >>
> >>         Workspace name: Jailhouse Hypervsior
> >>
> >> J
> >>
> >>
> >>       Jailhouse Hypervsior
> >>
> >>
> >>         jailhousehypervsior.slack.com
> >>
> >> Open Slack
> >> <https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fj=
a
> >>
> ilhousehypervsior.slack.com%2Fx-p1495803348528-1489807884627-148987
> 32
> >>
> 48707%2Fmessages%2FC01EKPMAJ3A&amp;data=3D04%7C01%7Cpeng.fan%4
> 0nxp.com%
> >>
> 7C1b9a4c8fa5164ec201e008d8855ef505%7C686ea1d3bc2b4c6fa92cd99c5c
> 301635
> >> %7C0%7C0%7C637405990167370349%7CUnknown%7CTWFpbGZsb3d8ey
> JWIjoiMC4wLjA
> >>
> wMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;s
> data=3D
> >> %2FPGdyfnTRCcBke58RJyDWwuDbH5xkpiu28B8zl4rOIo%3D&amp;reserve
> d=3D0>
> >>
> >
> > ...
> >
> > Seems this happens when you click on the invitation shared on the ML.
> > Please avoid that.
> >
> > Would be great to see a more OSS friendly solution, but it seems there
> > are no scalable offerings of Mattermost, e.g., for Open Source projects=
.
> >
> > Also note that this channel has a typo...
> >
>=20
> And I failed finding out how to join this with my account. Slack is not
> particularly user friendly in this regard.
>=20
> I think it's better to remind people of our existing IRC channel, one tha=
t also
> provide a web UI [1].

ok, I just find slack help me a lot when doing zephyr stuff, so just share =
one.

IRC is blocked local NXP IT, I am not able to connect, web should be ok.

Thanks,
Peng.

>=20
> Jan
>=20
> [1]
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwebch
> at.freenode.net%2F%23jailhouse&amp;data=3D04%7C01%7Cpeng.fan%40nxp.c
> om%7C1b9a4c8fa5164ec201e008d8855ef505%7C686ea1d3bc2b4c6fa92cd9
> 9c5c301635%7C0%7C0%7C637405990167370349%7CUnknown%7CTWFpbG
> Zsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6
> Mn0%3D%7C1000&amp;sdata=3DAOJPaGAtr7NO4Pm6YQUii16%2BkQb0LrOw
> wL6NKU8Q0Hw%3D&amp;reserved=3D0
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
jailhouse-dev/DB6PR0402MB2760C66DE7FD74F9350EDD0588E90%40DB6PR0402MB2760.eu=
rprd04.prod.outlook.com.
