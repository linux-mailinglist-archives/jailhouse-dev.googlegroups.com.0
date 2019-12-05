Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBWGWUHXQKGQE4X6BYZI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x237.google.com (mail-lj1-x237.google.com [IPv6:2a00:1450:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id F03401139E2
	for <lists+jailhouse-dev@lfdr.de>; Thu,  5 Dec 2019 03:28:40 +0100 (CET)
Received: by mail-lj1-x237.google.com with SMTP id z23sf442000ljk.21
        for <lists+jailhouse-dev@lfdr.de>; Wed, 04 Dec 2019 18:28:40 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1575512920; cv=pass;
        d=google.com; s=arc-20160816;
        b=tneBd9U0QAvVtdxjDzkiM9lg67FVC6+o0MwXk3n4qJttf3rMUy520NiF/Bf7NmoH/I
         2AkFltYFxUZ7cWtrcFMLYg5GR0zgrXn5nnzJ8M13O3x6qnCTXTB8NfNusbEWzxlpzX6+
         Wo2FqZzccvpRInk113cjg4YTL0LgGCgEH/zivVk9l+H0XKKR1VsLDr+iPsopfUhk6LJg
         E1FLVBtpJdxPLbFU9r8dOWuU5IHPuRgsstfBwlUTpkPiYB/DimK0tSs+vimAqGX4jbMF
         SoqItXCGf1UOWWWDEWFf2Yxp8v85b/2PkQqMocRf+6mJZoV5GQ3014ogPBkFd64Y7oaV
         EmGg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to:from:sender:dkim-signature;
        bh=outdhsyPu20+jnieUNCSqWnDflVXLYRCYcQlDk43UCU=;
        b=vde1CXhwbLb/H0JcF5tvkFq8wW6j4Obv0+d7uWOctCv4c5sISTJRFum0XQRBRwPoka
         Y6Ov4ETdSY/8YWhimlJdYQCLn9n4M2Y9/xcc9tiMfSIEmO8RJQhmREIO4wWSGreCRwXf
         p41rZHmaL30DD8nh4jFghSs7J0Xm3Pum7wlPnljkhnC4+KLXeovVbgJpp6wfLwqQhzi2
         OENhEsSgpvko88hgsYqBVjr6x8wiV62ft4ROt/XalXSOpgnRvM6EcBs6nsdsbmLPWLEm
         xjYqHAWuzZ6e++yZC7N5g8ms7qagWn9CCgHuE6PVfGbggmzVKEmgk3gRxEtFFGn07yNJ
         x5Zg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=i1D0XvSE;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.4.61 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=outdhsyPu20+jnieUNCSqWnDflVXLYRCYcQlDk43UCU=;
        b=AYvcAVowwL7OexVufR9Ct5+cUNTPWD9MwDUL7TJdijdfpYVCMnWR3QKorqkodJPDcn
         1pDAaqfyMUKiE2IHBRlkCmpq6lSQ1ft2bzpe6xz+A+mjePxeaMLczUPMsW0vOhFN79jk
         tqqVmRKd8kL0jIUybnfBpFOC2zMRn4PwEBVHLR6yf2+GVZIzDkto5VzzlohdPcdALHjd
         jfyxSFeKF9PyRqIQUkWJJjVwZEjqSsmZ0dOICyUWQLNpc6uUHQvYcXeSrOewvNZW1Nh4
         O8LYpBzLbRImXuvIFxFBIKtlbFjd+Tcvdr8VzX9WDnZ/sWh08oFUwH7S8u5Qp+r46Kn2
         MBfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:content-transfer-encoding:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=outdhsyPu20+jnieUNCSqWnDflVXLYRCYcQlDk43UCU=;
        b=PoPZow5AmCTvGuVYGtDk3KW+8nkWZ++zHtZ04lajBA2kOMcv2OGz3zJfZj+Gx79Ts2
         S4nw1B86gxdMsD82V2r21y8X6hQz/yfhjozuOrwOfnQ8rmjJv+1Y7rNDI+N5lHDeLjGb
         +zjEVm4PVoGGcHuMVO+ZLwqwIf/hvrgqH5KlOA35Z06E+xmunX12rZHifDBEVP2QbnN6
         liWYfIJHtABYZyK/du0luHaqhDArY+tZY2kT16Li7mVzp54wJC5lILNaPkWbm3TfnQYn
         Kv9pPq8UL35XZZPthxKvvkD8ainllK80MAP8A81F1uQmFjuJK0TV7X3xQXDF+zie2VIV
         stOQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAX04lXqnkQ+UbwHWT7a5W1+RNSlCUsPwcR4nfOZ/4hE/7TpJ2f6
	ajQaBSZHfbJb4uKdYJ2vPKw=
X-Google-Smtp-Source: APXvYqya7ZACOjdqrzMWGMGu2/HCNY/61o6iZfh3hFoneba3/fDZbLqarwtzNOA3FcHvRKWJXL1ZfA==
X-Received: by 2002:ac2:52a3:: with SMTP id r3mr3886396lfm.189.1575512920484;
        Wed, 04 Dec 2019 18:28:40 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9912:: with SMTP id v18ls220273lji.5.gmail; Wed, 04 Dec
 2019 18:28:39 -0800 (PST)
X-Received: by 2002:a2e:9a12:: with SMTP id o18mr3859102lji.191.1575512919796;
        Wed, 04 Dec 2019 18:28:39 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1575512919; cv=pass;
        d=google.com; s=arc-20160816;
        b=1JFAAtmVam807oYoTytz+xIFeG7i9enbEuhI9kpGQhBeVJZ0vv7lvXpg2gZx6pufl3
         z5y2e2yVfhZHjioTT2gHMO6HequgWiReNOObBEMUj8iY+5QFDCCIARAKQnm65XaX5YVH
         2TIHgsBZwcKxjz4qDa5dHdkz9Rdf71V8Gt7YqHfuuV2JmS4yRq4gfyn3TEyZ1XiE9ghn
         TSe7WRkJ/rl0ase5Ashd8p5Z5at6kuICqCcZbBEHK8A2TMuA/XPccdOzdZIlIXztO/ug
         sdJlWw+7b0a3nMI3zRYkhoAOydNt9I7q/8HmPuugjwiH4x1eKfzmX0NED3SMCflEVfaw
         HExQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=3iRCRmEzcmA6E4xdHw4QxaTHXJiEXJsShFZ/GNeeo3M=;
        b=qAf+TIQ/jo280Dcm0p2IKlnHLFD7IC7QX5AgOO+cgL1e9TbpPh98mLRJgZOixPz7D0
         nGzZL456mnWjSzmPrppSOy7JvO10Fo+fyvwkZdoiavyJhOgR7y97FjaeRrrt7flRnp2t
         AhnifSsXMB/cZuAdT168b7YOKTHJTksfk/TIxp0WuUJ8LQfhTJjarnnxjERBVcYUrjsz
         JObV+4Po29BUKVLhOx+J41o2Ir+8rK1E3AUN3ajqqHvD4Oy3NXf4i5Pa74AZ05Q8Wp+2
         1Jc5FzxrjHI8CqXcFSupL63tKVLAvAjj/NOoNFXQ7SF3QqpPcOM6ggJE24aWMjztssEV
         TBqQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=i1D0XvSE;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.4.61 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (mail-eopbgr40061.outbound.protection.outlook.com. [40.107.4.61])
        by gmr-mx.google.com with ESMTPS id f11si657816lfm.2.2019.12.04.18.28.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Dec 2019 18:28:39 -0800 (PST)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.4.61 as permitted sender) client-ip=40.107.4.61;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GkZJAyBSj2EK035dBUxFthdqdeqts3V9YAY5o0/PRe+tscIVxFaj6f1sLVnWlEQO964zpH8FPaqupvjhPUzBgZAGRWad08V5zMPpJVRlxOI2y5RmCSfncigH1HwUXbC5ai7B+Bpq6hPnclN6F4i5hVTZxu8IKONFqcj7HMoJ0p2jwzUjN9MoDWWbcNGC1AQ75RIJdTrLv8ygTWSinr8nti7fxtg7C3xGAJnAiRAViC9KpLgAuCaRbJBQpSJyE93ePv2OnHcipFZCVnIlKg4F7v4Jba2ISiJ8ah12PcEhbv8hcIFeoPfNB5yKxfYTNLqpuAsIAW1EK/VTwfs+/6CVMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3iRCRmEzcmA6E4xdHw4QxaTHXJiEXJsShFZ/GNeeo3M=;
 b=h4GFjnjPFOVQWDpOkcVkGbyl6eubNIsFRcGZdoXt3nCj3+5IFfPgdK4xXXHPgbh/GjVd04hDPh7BqXrdBy6Ye5JXqMLku8qYqtUn2Z1h0EiB8nIz0HSQ0dt0gNUYnFG++CkCt2CzJrBtxiKtIbVuZvmCCQKYo6/7emwyarLkweOPVrwVSPxep7xzDVBdb0Xwy8K4ScR829O+AwYJgfInevQ/PZti3ERD+JoOO1AvZnc4wtCc+Jk9+72a71GPg8ByoPPbzIy02Tp3+BfVN73YPjd6DHpXwuc/A5Di8Byzd0J82XECDm8okWPx2DzPXI1KvdJXhZwK3ek7eH7u8VXIKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com (52.135.147.15) by
 AM0PR04MB6369.eurprd04.prod.outlook.com (20.179.252.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.21; Thu, 5 Dec 2019 02:28:37 +0000
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::f16d:a26a:840:f97c]) by AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::f16d:a26a:840:f97c%4]) with mapi id 15.20.2495.014; Thu, 5 Dec 2019
 02:28:37 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
CC: Alice Guo <alice.guo@nxp.com>
Subject: RE: [PATCH 1/2] arm: irqchip: add lock in irqchip_inject_pending
Thread-Topic: [PATCH 1/2] arm: irqchip: add lock in irqchip_inject_pending
Thread-Index: AQHVqbN5/wzTXUO1YEaDqJRJvOGoW6eoGqIAgAAAlhCAAANTAIAAAjbAgAAA/ACAArB0MA==
Date: Thu, 5 Dec 2019 02:28:37 +0000
Message-ID: <AM0PR04MB44813A2E63BF7C31B34C4E1C885C0@AM0PR04MB4481.eurprd04.prod.outlook.com>
References: <20191203084553.20669-1-peng.fan@nxp.com>
 <3408fd87-22fa-31bc-657d-8661ad3998f3@siemens.com>
 <AM0PR04MB4481FCD642715C2D03DA78EB88420@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <81533a5d-8385-9872-ef22-4bcaa30c98f5@siemens.com>
 <AM0PR04MB44811BEC3EDE072313C1F3B888420@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <46f71ed9-d4a2-d695-2ce5-307bfd13d1ca@siemens.com>
In-Reply-To: <46f71ed9-d4a2-d695-2ce5-307bfd13d1ca@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 99afe296-e1ba-4bd7-4db6-08d7792ad59c
x-ms-traffictypediagnostic: AM0PR04MB6369:|AM0PR04MB6369:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR04MB6369E99167EFA17DF12C8C46885C0@AM0PR04MB6369.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 02426D11FE
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(136003)(396003)(39860400002)(346002)(376002)(366004)(13464003)(189003)(199004)(305945005)(7736002)(8936002)(74316002)(99286004)(81166006)(316002)(33656002)(71190400001)(81156014)(25786009)(71200400001)(110136005)(8676002)(66446008)(14444005)(66946007)(64756008)(66476007)(66556008)(5660300002)(6116002)(44832011)(52536014)(3846002)(2501003)(14454004)(86362001)(2906002)(76176011)(53546011)(6246003)(55016002)(76116006)(9686003)(7696005)(4326008)(186003)(102836004)(478600001)(11346002)(229853002)(6436002)(6506007)(26005);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB6369;H:AM0PR04MB4481.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VlrsDSnWmlQoCpjX9Lx2VHKHsxB9s8OU/y55NgtDjLzqybFG9Xlc0w2EoYwo7xDJ3FlDsu5eXBNI/sOYRhh6Q8zrFBJ7ZtOWRNN/YMei537Kr3JfsCvlroYpKXdJpbYLYCPqBxuX37AtubnBBrKOPhN1MIabLZtBHQoaaWym8UDq8UVQEo2sbr2GS9p3PC0VO7YSrLM/b7rqPLD75R5sdvHihEyxBk/8TSAmE2i850JRaHD41fBhURmKEME2IWadWhwUrbfi+OsX/s+IjgJI8qOQ6bn4Bcvsfa0Y2/2kVMTQ8lVZdU2dAxqKRoWdZ3d/7hblk0c8aEDk+j9VIDmVMbvuIyu+o+tFmG+vKRBnbl8dTTNMe3x2pH9h+niTNkqlCHjfxqKf2k9S/zJSitcW7GpI1OJq2IHQ57ZP+R7v992T0oZe76cz40dXeIULdNDJKdq8uk3ZyRHjcCEvuAISuHvJuTvYmPAJyzheq7X8CgV/5Nn4WeowTqaCBqTuTbjG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99afe296-e1ba-4bd7-4db6-08d7792ad59c
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2019 02:28:37.4093
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PBOEY/p2dQqTOZQIsGJ+voOo+Ah12AxuLMIAg3u4IOA75LFSesE89ATrSBfFlHc1stCAFpsV3l31gMu9BqMxYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6369
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=i1D0XvSE;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.4.61 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

Hi Jan,

> -----Original Message-----
> From: Jan Kiszka <jan.kiszka@siemens.com>
> Sent: 2019=E5=B9=B412=E6=9C=883=E6=97=A5 17:18
> To: Peng Fan <peng.fan@nxp.com>; jailhouse-dev@googlegroups.com
> Cc: Alice Guo <alice.guo@nxp.com>
> Subject: Re: [PATCH 1/2] arm: irqchip: add lock in irqchip_inject_pending
>=20
> On 03.12.19 10:15, Peng Fan wrote:
> >> Subject: Re: [PATCH 1/2] arm: irqchip: add lock in
> >> irqchip_inject_pending
> >>
> >> On 03.12.19 09:58, Peng Fan wrote:
> >>>> Subject: Re: [PATCH 1/2] arm: irqchip: add lock in
> >>>> irqchip_inject_pending
> >>>>
> >>>> On 03.12.19 09:27, Peng Fan wrote:
> >>>>> Thinking about core0 is inject SGI to core1, core1 is handling SGI
> >>>>> interrupt.
> >>>>>
> >>>>> That means core0 might be in path to enqueue SGI into the
> >>>>> pending_irqs array, core1 might be in path handling SGI and pick
> >>>>> one from pending_irqs array. So need to use lock to protect
> >>>>> unqueue, not only enqueue.
> >>>>>
> >>>>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> >>>>> ---
> >>>>>
> >>>>> V1:
> >>>>>  The best case is only lock one entry, so no good solution,
> >>>>> because there is possibility that inject fail.
> >>>>>
> >>>>>  hypervisor/arch/arm-common/irqchip.c | 5 +++++
> >>>>>  1 file changed, 5 insertions(+)
> >>>>>
> >>>>> diff --git a/hypervisor/arch/arm-common/irqchip.c
> >>>>> b/hypervisor/arch/arm-common/irqchip.c
> >>>>> index 1c881b64..fbaa3099 100644
> >>>>> --- a/hypervisor/arch/arm-common/irqchip.c
> >>>>> +++ b/hypervisor/arch/arm-common/irqchip.c
> >>>>> @@ -279,11 +279,14 @@ void irqchip_inject_pending(void)
> >>>>>  	struct pending_irqs *pending =3D &this_cpu_public()->pending_irqs=
;
> >>>>>  	u16 irq_id, sender;
> >>>>>
> >>>>> +	spin_lock(&pending->lock);
> >>>>> +
> >>>>>  	while (pending->head !=3D pending->tail) {
> >>>>>  		irq_id =3D pending->irqs[pending->head];
> >>>>>  		sender =3D pending->sender[pending->head];
> >>>>>
> >>>>>  		if (irqchip.inject_irq(irq_id, sender) =3D=3D -EBUSY) {
> >>>>> +			spin_unlock(&pending->lock);
> >>>>>  			/*
> >>>>>  			 * The list registers are full, trigger maintenance
> >>>>>  			 * interrupt and leave.
> >>>>> @@ -295,6 +298,8 @@ void irqchip_inject_pending(void)
> >>>>>  		pending->head =3D (pending->head + 1) % MAX_PENDING_IRQS;
> >>>>>  	}
> >>>>>
> >>>>> +	spin_unlock(&pending->lock);
> >>>>> +
> >>>>>  	/*
> >>>>>  	 * The software interrupt queue is empty - turn off the
> >> maintenance
> >>>>>  	 * interrupt.
> >>>>>
> >>>>
> >>>> Did you see real corruptions?
> >>>
> >>> No. just code inspection currently. We met some SGI inject return
> >>> -EBUSY, so go through the code, and think this piece code needs a loc=
k.
> >>>
> >>>>
> >>>> The idea behind this was that the injection to the lock-less queue
> >>>> happens in a way that it won't make changes visible to the consumer
> >>>> that are inconsistent, hence the barrier in irqchip_set_pending.
> >>>> Looking that again, though, we possibly need another barrier, right
> >>>> before updating
> >>>> pending->tail.
> >>>
> >>> Barrier could not prohibit enqueue/unqueue contention.
> >>> enqueue will check head, unqueue will update head.
> >>
> >> Some topic as with lockless enqueuing: We need a barrier to shield
> >> the readout of the head entry from the update of pending->head. So,
> >> we are definitely lacking barriers here, but I don't think we need
> >> the spinlock between producer and consumer because there is only one
> consumer.
> >
> > Lock-free should be possible, let me work out a non-lock solution.
>=20
> This is what comes to my mind so far, but please re-check carefully:
>=20
> diff --git a/hypervisor/arch/arm-common/irqchip.c
> b/hypervisor/arch/arm-common/irqchip.c
> index 1c881b64..a83cd81d 100644
> --- a/hypervisor/arch/arm-common/irqchip.c
> +++ b/hypervisor/arch/arm-common/irqchip.c
> @@ -246,12 +246,12 @@ void irqchip_set_pending(struct public_per_cpu
> *cpu_public, u16 irq_id)
>  	if (new_tail !=3D pending->head) {
>  		pending->irqs[pending->tail] =3D irq_id;
>  		pending->sender[pending->tail] =3D sender;
> -		pending->tail =3D new_tail;
>  		/*
> -		 * Make the change to pending_irqs.tail visible before the
> -		 * caller sends SGI_INJECT.
> +		 * Make the entry content visible before updating the tail
> +		 * index.
>  		 */
>  		memory_barrier();
> +		pending->tail =3D new_tail;

The spin_unlock implies memory barrier. I think no need memory_barrier here=
.
>  	}
>=20
>  	spin_unlock(&pending->lock);
> @@ -264,6 +264,12 @@ void irqchip_set_pending(struct public_per_cpu
> *cpu_public, u16 irq_id)
>  	if (local_injection) {
>  		irqchip.enable_maint_irq(true);
>  	} else {
> +		/*
> +		 * Make the change to pending_irqs.tail visible before the
> +		 * caller sends SGI_INJECT.
> +		 */
> +		memory_barrier();

Not needed, see above, spin_unlock already done this.

> +
>  		sgi.targets =3D irqchip_get_cpu_target(cpu_public->cpu_id);
>  		sgi.cluster_id =3D
>  			irqchip_get_cluster_target(cpu_public->cpu_id);
> @@ -292,6 +298,12 @@ void irqchip_inject_pending(void)
>  			return;
>  		}
>=20
> +		/*
> +		 * Ensure that the entry was read befor updating the head
> +		 * index.
> +		 */
> +		memory_barrier();
No need. The index update will not be speculative before reading pending->h=
ead.
> +
>  		pending->head =3D (pending->head + 1) % MAX_PENDING_IRQS;

Need a barrier here, to make update visible to producer.

>  	}

My version,

diff --git a/hypervisor/arch/arm-common/irqchip.c b/hypervisor/arch/arm-com=
mon/irqchip.c
index 1c881b64..5abf1c37 100644
--- a/hypervisor/arch/arm-common/irqchip.c
+++ b/hypervisor/arch/arm-common/irqchip.c
@@ -247,13 +247,12 @@ void irqchip_set_pending(struct public_per_cpu *cpu_p=
ublic, u16 irq_id)
                pending->irqs[pending->tail] =3D irq_id;
                pending->sender[pending->tail] =3D sender;
                pending->tail =3D new_tail;
-               /*
-                * Make the change to pending_irqs.tail visible before the
-                * caller sends SGI_INJECT.
-                */
-               memory_barrier();
        }

+       /*
+        * spin_unlock will make the change to pending_irqs.tail and
+        * entry content visible before the caller sends SGI_INJECT.
+        */
        spin_unlock(&pending->lock);

        /*
@@ -293,6 +292,9 @@ void irqchip_inject_pending(void)
                }

                pending->head =3D (pending->head + 1) % MAX_PENDING_IRQS;
+
+               /* Make the change to pending->head visible to enqueue. */
+               memory_barrier();
        }

        /*

Thanks,
Peng.
>=20
>=20
> Thanks for bringing this up!
>=20
> Jan
>=20
> --
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE Corporate
> Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/AM0PR04MB44813A2E63BF7C31B34C4E1C885C0%40AM0PR04MB4481.eurprd=
04.prod.outlook.com.
