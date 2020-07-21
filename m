Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBVM33L4AKGQEAURXTMY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x340.google.com (mail-wm1-x340.google.com [IPv6:2a00:1450:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F0D2278EE
	for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Jul 2020 08:40:22 +0200 (CEST)
Received: by mail-wm1-x340.google.com with SMTP id v6sf636215wmg.1
        for <lists+jailhouse-dev@lfdr.de>; Mon, 20 Jul 2020 23:40:22 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1595313622; cv=pass;
        d=google.com; s=arc-20160816;
        b=BlcI8+pjeBM7TG4QkqExx9mIX81f2gKa2dWcBJvUYN3nhxx5UqhXZ/jTZzZATeyDnA
         gwJhTKwmgS2w7wIA6cC+t9V1to58VXRwTZDJzQVJ1D0t6oVVAgI19xfT3ZHH/0s+/rv8
         ndE1IjQZoGrsWTJKrLhyiXVlYAsUHnkyACiOfuS6cm9k/0bfQErL9zTm0pWNNuO0WrqY
         UJGMpkgJuxHyr/aFvcE3ciYUL7CLBor+B/fGoOFtv/Sis6IEaBELCQ33KQvrRLyvsENX
         q610lYIxbrjEv1cFBidA5njaGVp3UXjqowVSd2UvaxlEGOQs+zWyGGtq3fT/S6cqFOGM
         fIgA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to:from:sender:dkim-signature;
        bh=OA0lddloalCUqAvbt1BHggzqhEyGh9iUVjpYeWnZvKc=;
        b=rBt1fzCNNpvVsw1G3OR/jKo41cm+9qD3BS6Jjk0A5Wo7XqSPkbmR2aGJcI3CugbdIG
         NQb87OigYgxTNMNZ0BfCnCwhJxPP5RTbK3DueuQGUbY8xBVUGCyagPmrinqutZrWr+s2
         O0oCQDext6032Iu8lRcurV1A8bAglzikp3dg0mdAwVqz2pHUNcDXx0L2AXXq0fTK3XKQ
         fRXmVvAC5Pr7YBxJsgbEZeMx9M6MVztbHyOE0WBJc2zdxclIHEy13C41tCTGKn7yhjH3
         GrA5/7YmL5E/3K4tNqLJWu7tl4/a7D4bJ8eJduk1zD7ieT/ru++fNJWmyYJBQlq15QgN
         9bGA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=AK+djUw7;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.8.59 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=OA0lddloalCUqAvbt1BHggzqhEyGh9iUVjpYeWnZvKc=;
        b=lAkEzBztaJkDhsSwfMtQ4Q/7z+PLTHOW1xWAYg739Vo3oI7cISj0IhKd1zJhp9NgpJ
         O5B+8P2/d+9UoIrpBFKhiFitepgptNWzATi+vFc2MwpqKICmaOEPZc2LOoTdC1h50gCh
         xI0fA9pihKP4hzPGLY6k+Ip5CDnlY5uvSfphNnPfF1tBcEplvMecCJROg+pAwhv4X9Bp
         SIkwKCI6to10IXMlycZGXWO6q8OOfJOimiPq4nrmvwe5Br+PocaVoGvnTu3t0aLeg9I3
         OkGUY6EDz+7yDWBsvqwxc39aBu9P8LlWL0LZfRMJS2aJAjKxQMBVT0y4Ss0c/ebAW/6+
         0xGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:content-transfer-encoding:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=OA0lddloalCUqAvbt1BHggzqhEyGh9iUVjpYeWnZvKc=;
        b=Z/8t7FZlpZgHgW6wzaR0tuOSwbeoBaZQ/ydItvuMGy2YMe/RXC75Tq9tQc3GzEAyqX
         4OZFyO4A2TuoX9dW3U5AwUCnU2JeafQ7IhngMVJjhiVSk0G+IYag8ri08or77JgU9Wl1
         tesSUtQbGwZw0yI+o/lm7J23+88MQcDZOxk1FP2kqdGbCtHiVPeuGDv0sBsBbo/RIY0W
         ejWXyRcUNWlXoIarVKbcgOXhYYYOGrjuABNFFNOoMUltuTWQVgcpWowHUN7hH6MlODVe
         SX/FnOW6wxAUlLlV9qeKSB5KTthztEqSSS+I0GV+7jZTaDKWbuDuTMaL+r8DnPBP6Omb
         XWEg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532WRh6Rqu/82ey5gcoq8hZ/ZTScAilEnFzr0oiLoLvUwCZ8xW+J
	Idfw2TSa4RVdSRwVu6Yg5Ug=
X-Google-Smtp-Source: ABdhPJz2gTihTcJ6KjZVN44IUVFL4sDxNyrUHB8sugoqBdYdJKxO+hdq+3eQOwukaGTu1oWqQEsuXw==
X-Received: by 2002:a1c:7d54:: with SMTP id y81mr2701592wmc.110.1595313621720;
        Mon, 20 Jul 2020 23:40:21 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:a587:: with SMTP id o129ls637571wme.2.canary-gmail; Mon,
 20 Jul 2020 23:40:21 -0700 (PDT)
X-Received: by 2002:a1c:7d54:: with SMTP id y81mr2701549wmc.110.1595313621077;
        Mon, 20 Jul 2020 23:40:21 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1595313621; cv=pass;
        d=google.com; s=arc-20160816;
        b=ybt5fJPeUPYvZFih/k92gFmldNsf62XtvAhO1k72IlvtXZI4sOPTZal/D1eE2WtWx6
         llOXc5R5UgLsjwIgLg0BSASArm9NUrOVOk3Y/Ix32kxcyakcUttnrh5c8GB25/hyr57T
         o21t5rCIDMkZ68UyeeBWKzwP7hoO8FeQO49wPmWOb0qWCvCbTF4IneyP4UwkdS/pKnXM
         D11FdAcnK5VmU1EbhFd4CR6+ZEMtkTvH0qcFAno8HVDm/gDXF9jlJpMmslmAT1Ndv6nU
         u2qqBhE5OFWLlJI2qWe05SPxw5A3x0It1cfJcD25NtnxpA/jxWy3UB4+vwf1MXpLxOXW
         gnig==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=I0wejch/fpvvAsh+SnoYisC8szLvnPy40SRjrnPSlh8=;
        b=UNmbIUbp0O/d/HD1jF9QlzyAmIYT/dKD5834FbkI2iQzOgaCQUGWM8RQWjhelJE4Bi
         NQxKqpcdTMEywX30FBbyjfDfnQXZfbbtP8Hu+o/XIMsL3NSyK1I1AE0LG2DP5G1HUPmS
         SO2LFo0b8MVQKGTEAe9IZv5x3TmIV1ctunqMHT74umjn3tfZoYCQRXf7tb8oc8/hvDqI
         TvpxSTTpjpaUM7p9BdeqGET+dIOzJsHE8Hg/lbENGqkqhBNV6upG/UEfN3jNvx8tkGg/
         aRCdDg2Ctp7rQgvt11+zUV6rHMYvuKCbZwxy0AGR8t/p/LU3aqDsfYly/eJqOWAhpQus
         ZgmA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=AK+djUw7;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.8.59 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80059.outbound.protection.outlook.com. [40.107.8.59])
        by gmr-mx.google.com with ESMTPS id y130si91075wmd.2.2020.07.20.23.40.20
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 Jul 2020 23:40:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.8.59 as permitted sender) client-ip=40.107.8.59;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ip+AKJo5RXdjBPTd9gO4+QlY0Hc9R3sv8HRD2Tk/CgmL5un/+1JvfTR2jZh1MhaJUTz5l/oFCh/O1Igj/IZt+EHq4P5gFcB2fSzAzqO9v60cesAlJPofO2E+FOcH5w3YUzbQfP5iwId4ZBYLWMBO2oSI2wlA4L6F9EjkCwk/d5TolaF8hPfV4RZBjZ68EDcaApwa+s3YytztwpD/tmUKVRoxTwWyL9YSOrqsvM4XQ39hLfOyiSK5j9yLKq9v6FtW857pzHeq3LoRm1KzaMFtA1C6bEEd+aJOTL1Zgs5OY50clYc9JUpVzpvOyddlEfJMzhedjSkPIu5UFLB2jvo9nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I0wejch/fpvvAsh+SnoYisC8szLvnPy40SRjrnPSlh8=;
 b=GyZl5lKqs8T9CAwoK3jD4WaqVrvg7SXlgQQ66lfWjZdYdFS86nHrNLqo5H6PhBDJ/9UDxKFkcsVZPAaJjQ6ih4Rm0IdPLScOoTli6s4zcAaOrZAEyS4GQlgI9f33OirtmiQ+CtpPqZauGFcDIqbGy3rKf6OsjJawL7jq40/BRWx4anlgnfsL0tQ9j+x5Ca8V7GYIXtDVzA6qHjHAmS/jk+U/4ngJ5dZGLB3kkLo1Ps8CDJ+zsxlMJA9KQ94ldLnSsmO6LM1CMYv4Y31NjNEYgHUoOchFthBYBfB2Raqmhqn4YfbSKsu2a27r+kSOw3iyRLLWu/Qku+b4CNlMFe+tPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4091.eurprd04.prod.outlook.com (2603:10a6:5:1e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.25; Tue, 21 Jul
 2020 06:40:19 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::2d36:b569:17c:7701]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::2d36:b569:17c:7701%4]) with mapi id 15.20.3195.025; Tue, 21 Jul 2020
 06:40:19 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, Angelo Ruocco
	<angelo.ruocco.90@gmail.com>
CC: Nikhil Devshatwar <nikhil.nd@ti.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>, Alice Guo <alice.guo@nxp.com>, Ralf
 Ramsauer <ralf.ramsauer@oth-regensburg.de>, Jose Martins
	<jose.martins@bao-project.org>
Subject: RE: jailhouse jitter?
Thread-Topic: jailhouse jitter?
Thread-Index: AdZQV9Sg2ghlhzPgRlmJb7fpOVsBgwADlDcAAAL01YAAAMZ8gAAGw6oAAAZGpAAALvHKAANegwUAABKcb+A=
Date: Tue, 21 Jul 2020 06:40:19 +0000
Message-ID: <DB6PR0402MB2760B4463A03D7FC4EE3E4E988780@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <DB6PR0402MB2760BE2A66C776875890B5DF886D0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <38ffb4dc-20d6-3404-cc61-ea08ea8066f1@siemens.com>
 <e0b6c5f5-89a0-6e29-6700-e5d5064d4672@ti.com>
 <CADiTV-0qHuXt=wrGCp4RbFWcu=WGsZKB-doXOTxjMVZkRiiiCA@mail.gmail.com>
 <1d5b0ac8-0744-59ab-bb90-8133df4a1525@siemens.com>
 <d0b0c698-7ee2-97dc-7b6e-685f2f169f39@siemens.com>
 <CADiTV-1oJBD+SkAT475xD5iODeo24wqwBSFGu2JQATxqpF1W0w@mail.gmail.com>
 <b96f90ad-23bc-db73-9603-f9eb640804d0@siemens.com>
In-Reply-To: <b96f90ad-23bc-db73-9603-f9eb640804d0@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 6e0dac6f-0609-4b99-0d11-08d82d40efdb
x-ms-traffictypediagnostic: DB7PR04MB4091:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB4091E9134D0874B8B6F2294C88780@DB7PR04MB4091.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RCXGYuwxOSkUI96Uy2IHmWXoF09IGbmUWpBma2iBE2L40+HdLsMEZNbhoRHmx/hqkRwdIk1Y/aTELY6efgAQeiTKgQADLjW9bxyar/aNLNP3+TdFqcuw4PQA8jnGcp5HJhDDMHa230mRkf3x0cMnN3N5erXi+7czKo4z4krCyW8Ay3px2Kd/wx6XfK0QAN/51E4eFuVy1PDt6QDIpR3xRDtTKPcCpQJy6KhaBrltymSlqyzAoPOBlCJbH5fnc88qUFppRbqDqHBYlNhYZu0xc8IO3PfDGpXR/RzDLLBsv+eWLKaUH3DSCfCRLIV08492fB+2+/YLS7URdEbTYm4s32skdkksICL5VMIFxWiBFFd9loAai/BO0Qdu8rWK7Ev5Jgr79XLychZfpnJNV9UQkQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(346002)(136003)(396003)(39860400002)(376002)(7696005)(316002)(26005)(33656002)(186003)(66946007)(45080400002)(7116003)(44832011)(9686003)(5660300002)(110136005)(83080400001)(54906003)(6506007)(53546011)(83380400001)(3480700007)(8936002)(8676002)(4326008)(52536014)(71200400001)(66476007)(64756008)(66446008)(66556008)(2906002)(55016002)(76116006)(86362001)(966005)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: fTZPctXBCX0FPRjHw+R0pfSpnfNYilDkYqg0dq8p+MtooC5YtBPNXnTsef2n+d4sqPsyw0P54dYm5jiUQtu9HeQ6qhcnpuJs6kXo5tmFiLvCIG4LjJEYxxn2DQ/RWoWyAUl5h+FVOlpYoCSWD+UYAyNSgKx3ZejpEe1lwuTCs+8IR5EfnbJRf6+gTQItYelL477km/6Tocu7SL43Ce+EIicGVqbxMTL+pc38kuWQtIA8ClypRfVagJ1aZC/wxlA7x9XerqmjX+3YpkzyX8sDRm/xIme/108RNlLBxE8xk7hZX12rJRT6dUrZGIc2IEennoQeI+Sj4bDbfDX1XKF8ODeWhkDZpcoOhgDuGl5/qCjRLkB5mcu9PCOAERmoWfF/YerbOxCiGRjJ1dICL4DheTcg9xFSct3zBfGLQbAgAYADcr9iF0E7cZHSJwW17jIM/Gg7/gmeJ82g3qhonVJgce6z7Xq/6WBfpLtxXjne6P0=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e0dac6f-0609-4b99-0d11-08d82d40efdb
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2020 06:40:19.6922
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JO0kYOr+2wmvM4YiOjJjK8Vf0nVIOUgjGGiNHqZe8Z2VBvxCUUhweZXvSG0bRMeMGQd79Jao+6yJjq8clgvi9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4091
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=AK+djUw7;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.8.59 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

> Subject: Re: jailhouse jitter?
>=20
> On 03.07.20 20:08, Angelo Ruocco wrote:
> > Adding Jos=C3=A9 Martins in cc (direct gicv2 injection was his idea) as=
 he
> > might be interested in this.
> >
> > On 02/07/2020, Jan Kiszka <jan.kiszka@siemens.com> wrote:
> >> On 02.07.20 18:45, Jan Kiszka wrote:
> >>> On 02.07.20 15:31, Angelo Ruocco wrote:
> >>>> On 02/07/2020, 'Nikhil Devshatwar' via Jailhouse
> >>>> <jailhouse-dev@googlegroups.com> wrote:
> >>>>> On 02/07/20 5:14 pm, Jan Kiszka wrote:
> >>>>>> BTW, regarding direct interrupt delivery on ARM: In
> >>>>>> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2
> >>>>>>
> Flwn.net%2FArticles%2F820830&amp;data=3D02%7C01%7Cpeng.fan%40nxp.co
> >>>>>>
> m%7C6ecf1e2eb2714099a5ae08d82cf63a2c%7C686ea1d3bc2b4c6fa92cd99
> c5c
> >>>>>>
> 301635%7C0%7C0%7C637308783336041620&amp;sdata=3DPviVkkKPB8Klql5U
> z%2
> >>>>>> B9rhZvAZxG00siR2yx%2F48P6kg4%3D&amp;reserved=3D0, it is
> reported
> >>>>>> that Bao has "found a way to map interrupts directly into
> >>>>>> guests". I didn't find the time yet to check if that is actually
> >>>>>> exit-free delivery, and that as a smart trick or rather a
> >>>>>> problematic hack. Or if that sentence is rather a misunderstanding=
.
> There is also the sentence: "Interrupts [...] have to be mediated through=
 the
> hypervisor, which is unfortunate since that increases latency."
> >>>>>>
> >>>>>
> >>>>> I found this interesting and tried to read more about this.
> >>>>> I found some commits at [1] which does the direct injection.
> >>>>> Here is my rough understanding:
> >>>>>
> >>>>> * He is not setting the HCR_EL.FMO bit and that way all virtual
> >>>>> interrupts are turned off
> >>>>> * There is a new handler for handling "lower_el_aarch64_fiq"
> >>>>> which ends up being handled by the Hypervisor
> >>>>> * GICD is still being emulated so guests won't be able to route
> >>>>> interrupts to wrong CPUs. Isolation is maintained
> >>>>> * For triggering interrupts from Hypervisor (SGIs, etc) he is
> >>>>> using SMC calls and has a new service implemented in the ATF [2]
> >>>>> * I could not understand how the lower_el_aarch64_fiq exception is
> >>>>> fired so that the Hypervisor is invoked
> >>>>>
> >>>>> My guess is that most of the code change ihere s to enable
> >>>>> interrupts in the Hypervisor. Resetting HCR_EL2.FMO would send the
> >>>>> interrupts at EL1 directly.
> >>>>
> >>>> Yup, that's more or less it.
> >>>>
> >>>> Just one clarifications, Bao *does* set the HCR_EL2.FMO, it doesn't
> >>>> set the HCR_EL2.HMO. The HMO bit lets the interrupts through, and
> >>>> they
> >>>
> >>> HCR_EL2.HMO? On which revision of the ARMv8 spec are we looking?
> >>> Cannot find that in mine.
> >
> > Ugh, it's a typo, I meant HCR_EL2.IMO, my bad.
> >
> >>>> go directly to EL1/0. The virtual machines have complete access to
> >>>> the gicc and receive IRQs without overhead.
> >>>> As you have already pointed out, gicd is still emulated, so all the
> >>>> operation of "enable/disable/set_tarrget" are slow as usual, and
> >>>> still under control of the hypervisor.
> >>>
> >>> And so is inner-guest SGI (IPI) submission, I suppose. Just like on
> >>> Intel (so far).
> >
> > Yes, everything that's gicd related is still handled by the
> > hypervisor. The logic though is extremely simple, so the cost becomes
> > almost the same as an empty hypercall.
> >
> >>>>
> >>>> The problem is that IRQs are completely invisible to EL2, so Bao
> >>>> needs to use FIQs for its internal functions. And to do that the
> >>>> only way is to go through the secure monitor in EL3 for each
> >>>> operation, having custom services running in the arm trusted firmwar=
e.
> >>>
> >>> Ah, interesting pattern: FIQ becomes the NMI that enables such a
> >>> trick on Intel CPUs. If FIQ triggering architecturally limited to
> >>> EL3, or is that SoC-specific?
> >
> > It's arm specific, FIQs are meant to be only used in the secure world,
> > so EL3 and secure EL1.
> >
> >>> I'm not fully familiar with the ATF/TEE world yet, but your approach
> >>> to model that service as SPD seems to block other use cases, like
> >>> having a full TEE (OP-TEE). Wouldn't it rather make sense to model
> >>> that as TEE app?
> >
> > Yes, it could be done as TEE app, but done like this shouldn't affect
> > other use-cases, that we could of think of anyway...
> >
> >>>>
> >>>> I've even thought of trying something similar in jailhouse, using
> >>>> the linux driver that, running in EL1, could let jailhouse access
> >>>> the IRQs even without the HMO bit set, and therefore allowing
> >>>> direct IRQs access to inmates without the need to put a custom
> >>>> service in the arm trusted firmware, but I found it a bit too intric=
ate.
> >>>>
> >>>
> >>> You can't use the guest to model management interrupts that are
> >>> there to interrupt the guest and inform the hypervisor about a
> >>> high-prio event (like "kill that guest").
> >
> > True, and you have a lot of other problems having to rely on a guest
> > for hypervisor tasks.
> >
> >> I started to read and think about this more - and then I suddenly
> >> found SDEI [1]. Isn't our problem of having a non-IRQ event already
> >> solved by registering on / sending some event 0? And SDEI is implement=
ed
> by ATF.

I am a bit lost (: How SDEI here would help interrupt inject?

> >>
> >> That would nicely overcome all the problems of the baod patch to ATF
> >> (integration, security, missing gicv3 support, blocking of other
> >> SPDs...). And even if I miss some catch in SDEI, the principle of
> >> synthetic events defined there is what we want for hypervisor
> >> management IPIs.
> >
> > Oh I didn't know about SDEI, it looks promising, but in the current
> > state of the arm developer website I can't find any useful
> > information, it doesn't even seem to be mentioned in the arm
> > architecture reference manual.
> >
> >> The only downside: On a safety critical system, you may rather want
> >> to get the firmware out of the picture during runtime, to reduce the
> >> safety scope to a real minimum. But, IIRC, GICv4 will solve direct
> >> interrupt injection in HW anyway.
> >
> > Yeah, in the GICv4 specifications there's the ability to directly
> > inject the interrupts, but depending on the field it might be too long
> > down the road for someone to wait.
> >
> >
>=20
> Forgot to share:
>=20
> -
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b.
> com%2Fsiemens%2Fjailhouse%2Fcommits%2Fwip%2Farm64-zero-exits&amp
> ;data=3D02%7C01%7Cpeng.fan%40nxp.com%7C6ecf1e2eb2714099a5ae08d82c
> f63a2c%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637308783
> 336041620&amp;sdata=3D4WqAL3pvGByyvJjQH3%2BfiLUHCOLEXa569nSUwFT
> QiTQ%3D&amp;reserved=3D0
> -
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fgit.ki=
szk
> a.org%2F%3Fp%3Darm-trusted-firmware.git%3Ba%3Dshortlog%3Bh%3Drefs
> %2Fheads%2Fqueue&amp;data=3D02%7C01%7Cpeng.fan%40nxp.com%7C6ecf
> 1e2eb2714099a5ae08d82cf63a2c%7C686ea1d3bc2b4c6fa92cd99c5c301635
> %7C0%7C0%7C637308783336041620&amp;sdata=3DBlleBLfrVIlHQ6Gn8MHN%
> 2BWv2v4C2GxBiTDjXzPLaDq8%3D&amp;reserved=3D0
>=20
> All a bit hacky still but apparently no longer exploding. And without run=
time
> exists of the gic-demo.
>=20
> SDEI turned out to be more effort than expected because it is enabled onl=
y in
> very few ATF targets so far. The queue above adds it to QEMU
> (arm64) and ZynqMP (tested on Ultra96). TI-K3, RPi4, ESPRESSO/
> MACCHIATObin should be similarly extensible, and all that also in upstrea=
m -
> at least as configurable feature of those platforms.

I'll check i.MX platforms.

Thanks,
Peng.

>=20
> Jan
>=20
> --
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE
> Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/DB6PR0402MB2760B4463A03D7FC4EE3E4E988780%40DB6PR0402MB2760.eu=
rprd04.prod.outlook.com.
