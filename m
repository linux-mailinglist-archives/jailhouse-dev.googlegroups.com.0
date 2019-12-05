Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBUMFUPXQKGQEGQDTBTI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33b.google.com (mail-wm1-x33b.google.com [IPv6:2a00:1450:4864:20::33b])
	by mail.lfdr.de (Postfix) with ESMTPS id 7469D113D35
	for <lists+jailhouse-dev@lfdr.de>; Thu,  5 Dec 2019 09:41:54 +0100 (CET)
Received: by mail-wm1-x33b.google.com with SMTP id z2sf597622wmf.5
        for <lists+jailhouse-dev@lfdr.de>; Thu, 05 Dec 2019 00:41:54 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1575535314; cv=pass;
        d=google.com; s=arc-20160816;
        b=mcBoUY8W6w90SgvcL205r7cKgjcKSWY28fO8QBXtbp1FBR9zm8o2ZJOLZh98FIWxKA
         K708v61BdAKZ3ImoIxQBD8weMpP10PZb41tqHDUfjSH6QveDD5VeJ5IpTeHh160meZNS
         mBzetUSIUfmccKsXFsSIbx9GZi01hMUP+gupfVAUF/RzlkXJKW0w/mTjI3ANbzAyxInR
         BJHk7e99fN9CekYXH57QeSpoDFsnOTi6c09Fx3QCYZFIlg1IvueZmFlrrDttUvDu7XcR
         4HX9lUBygwzt1x5Wo0wzd2j+VuoIh4IyiKSxPW/94xNLwbfhgMnb7uwL0cO+ZCWXZXHO
         rZrw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to:from:sender:dkim-signature;
        bh=Xni/zlshtxQnAHmyrpkiWxcaUPlb6V1Chl4EA+KPjqE=;
        b=jgHXewtGZ9Q3iTaiJz483OxZ4oDzvtnAES5YAM51nao5TWl6QKMIPy57nTt2oXtgPO
         1ry/WfwIJ1xU3if/0PqxtIXReU8f+kyaulUOwuRHhNKVY4R3Y33lWoVqMBYsfboH1cfB
         Ejhhrd0KK4Sk33jphJp1+/3FFbVQnAfcAWXRAxqZt5YjxbJ/uzGJKM8pjHFxCVGxZy6X
         zfCaUggzB3EYzwS8dPAkG/9rZwtiw60MKztk3IRxEFNTtD4wwzSH3e9wi6cO2qqxGIcj
         JHDK93i3vsX5nyY+DYg2Kho6aTDugnmfs1P9WEog2VmcjsGYgVlt8MF+xRY0v+ul/XSH
         /Gaw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=mg0UXMak;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.6.48 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Xni/zlshtxQnAHmyrpkiWxcaUPlb6V1Chl4EA+KPjqE=;
        b=kx4+SN6zsnU/CqLMNGASZhYNb2lNuMDusi4S5hnRIe8Y5cg/8nLcVAxvRA0qorjE3v
         62HfHeKJ9dS/RuZANhK6vJ9jZqGEmBwP0ZmALgdKnPuulNn6XTCIm/8XjOJpxfC88LCl
         /Zj5+D/IU956/l8MlIwczWarIIGx3Jlc2qHbfC0VePGXMPg7FIG8BmDHI348TpDdKjje
         hbDiOQenYR5uvZLtY7HmNVW25FH64FE5YhYEhu9VOhFcUFUdHqYWyhQrd9OUitXos0xd
         igbVOojRIPtIiT3RX65jANGnQeRaGb436K56MdV+ekHUatRZ0n8zHU4LJKJsLpAtBWg+
         7ASw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:content-transfer-encoding:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Xni/zlshtxQnAHmyrpkiWxcaUPlb6V1Chl4EA+KPjqE=;
        b=nGd3iVT9V1yDKVpDIeynJd2lUXiauFYDTR9xuslx+VQiwfqr6rdIGFRjz5KGp7aar6
         NNTTVOXJM4xKJ5SMLbyOaDF/orbxZ0/2DNpaPqh1SNMu2LcfZSe1O4PlXQEBFh4ukXwk
         AZXtyG/J8QeOuVqlQEX1wD61+MxoU5KOGYFho1nyLoToWMTynFXgkSbxmR3kyNdCLW05
         R7/Oi+gll9nEONVToVJculqa7vDIkm2s5LgJKvl+xRLUNgK3pXi+8wB8LOpygTR0uk44
         Be691AU4nJNTJ1ahHmaln2RaxYG1mdk7AyyRJ4YiYjEvchKVbox9zfs/+v/EJyKeymle
         TxrA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXrqpgBnRVVnWlCPBQJ+pMPPiMEYQwupZiVD7/nYIPz8yw8zdeM
	EqRlqLW1oQ60abtVoG8WxVI=
X-Google-Smtp-Source: APXvYqw9jhG9Yp5hCUNY72UWfUfzXqnCqSthJLAWL74JqS5DNjp3rYheanZAWKMO86nU3R5kAQuR4Q==
X-Received: by 2002:a7b:cb09:: with SMTP id u9mr3985449wmj.28.1575535314077;
        Thu, 05 Dec 2019 00:41:54 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:cf15:: with SMTP id l21ls1095229wmg.0.canary-gmail; Thu,
 05 Dec 2019 00:41:53 -0800 (PST)
X-Received: by 2002:a1c:638a:: with SMTP id x132mr4226597wmb.43.1575535313451;
        Thu, 05 Dec 2019 00:41:53 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1575535313; cv=pass;
        d=google.com; s=arc-20160816;
        b=omtypfEb7kNK5v3zOeEK6FET858JGydmf2lH5LQspuDPEJjMwnJ5M74zOLedVU4w72
         A6raAVEcQLxswCidYDWOE1JrdJSym2q0oou1GLX36lZRbfZS6EnGbYNJqcF8v2wBSHes
         DO/3KALeYddOC/ers5pa/ZY0Ra5BqTOuQUbLyVvhQFRzz58gOpdlxxmnxVS9AhRBS91S
         zY0ZWKpCGKwbH0+XM2Fdk5TbvaUisKBiIDfOJdSnOHL+Z0OwwbTxuIA4cIPQVurcsQYq
         5xe2DvtTR0BavuOgbvc17W7n+Xf8IgDmpxa6jCC+oKTOF9ZpOzlS8mBrWu+KLM/1cAr3
         kmSQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=hgRS8Y771jBrzHliDlA1LUH+ZGvdV9VtzdN/ZFMLv9I=;
        b=jqfC2M3jZS4pPuxsG7QWgY0XnHYMFrbOq/USwIYmq1/sWwG1xXSEvNJuVX8rRHkfi7
         58JCekjyIigzhjagZVVoWbOy+WpC4D3TRy2oHoiFatoteizEFXM8hy1EujQRnTskbehl
         yx3D3H2FdeOXGmB6vs+H5qbGZETUYM9tkgR6DD5lZT6YaxxktftHRtnFrfgBEm/nXToZ
         jsOFB6IUFtk4KZVVqUzkkM8990BhJyFgJgjCkdJuWweyXwdA3W3zsojxIwFJ2pDAjp4X
         tVHJJ3JZUBI09ar6xth3MMiHZRtQrJSoubj8OYwUWfHl6qmZI6rwBD13N/1lDjN+lNjt
         /dAw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=mg0UXMak;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.6.48 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60048.outbound.protection.outlook.com. [40.107.6.48])
        by gmr-mx.google.com with ESMTPS id i11si76658wml.0.2019.12.05.00.41.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Dec 2019 00:41:53 -0800 (PST)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.6.48 as permitted sender) client-ip=40.107.6.48;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=auxaSd8PLvg+lhlf5OSc9USyz+ztZ7nlgtgvflwXxGsHJjnwjVK4VqNKqCt5MM9i3zGtYRk93fkzTbsGmPNQlOeJeeugMArEfzPYJYWELHh7rp9NR3EYfW0GNLzJXR5tCW95KUOX4QyOTAIeCl8O1oKYt5SIpDE2bGUBgtz2+OP1A1/k/AgTNbBoQsiCUsMVvV2pjo4A+XtqssskIDS7Myx/GBssaFJOCb5pv4wpB7NcpxcC7lRIe8VNeVRJBFvb7c7X4XsroEvMn/HsEJ7dOJaOd1tlNCMZHhARSLn2m7tdCnBZXmpH9iJabiuLy6mx6zEhClqoYZ8rJGPihcZ3QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hgRS8Y771jBrzHliDlA1LUH+ZGvdV9VtzdN/ZFMLv9I=;
 b=L33hJs9TuhwCeNV3W92Gms9O+yhxTyvzMs/DFJpR2bPQZCCZXqhyOXrGvDFm7ag7EXBWmPHx8jTxWVSFvIDdTliLP8EB03b8VsEE2OPFmztksC2td74H/fdveYneTHrYZmTLUI/xDdl9jJ5LDPhCpc8V1sBooiBdVKQ6myB2vBocbhr71ePZe72WDOsiA8wRdqcdicd8p9oSbEVPnCsjl3LNwkhH5pJscsX3SLrxvwb1HaPjw54CAZeU1IDti3f8KDwflmSrzd3spMcqtHfBhc/Vt55E7AJwr0DAWiC8SU3gvEhpSci+wDroQ3aKt93X5e9aCHJNNAyhww3whHsdLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com (52.135.138.150) by
 DB7PR04MB4153.eurprd04.prod.outlook.com (52.134.111.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.22; Thu, 5 Dec 2019 08:41:52 +0000
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::4182:4692:ffbd:43a0]) by DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::4182:4692:ffbd:43a0%6]) with mapi id 15.20.2516.014; Thu, 5 Dec 2019
 08:41:52 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
CC: Alice Guo <alice.guo@nxp.com>
Subject: RE: [PATCH 1/2] arm: irqchip: add lock in irqchip_inject_pending
Thread-Topic: [PATCH 1/2] arm: irqchip: add lock in irqchip_inject_pending
Thread-Index: AQHVqbN5/wzTXUO1YEaDqJRJvOGoW6eoGqIAgAAAlhCAAANTAIAAAjbAgAAA/ACAArB0MIAAX2uAgAAJYVA=
Date: Thu, 5 Dec 2019 08:41:52 +0000
Message-ID: <DB7PR04MB44907526C0E8FAB7CEECA8B9885C0@DB7PR04MB4490.eurprd04.prod.outlook.com>
References: <20191203084553.20669-1-peng.fan@nxp.com>
 <3408fd87-22fa-31bc-657d-8661ad3998f3@siemens.com>
 <AM0PR04MB4481FCD642715C2D03DA78EB88420@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <81533a5d-8385-9872-ef22-4bcaa30c98f5@siemens.com>
 <AM0PR04MB44811BEC3EDE072313C1F3B888420@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <46f71ed9-d4a2-d695-2ce5-307bfd13d1ca@siemens.com>
 <AM0PR04MB44813A2E63BF7C31B34C4E1C885C0@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <bef9b0b0-3bc0-4982-3b3d-aa829ad6ceb5@siemens.com>
In-Reply-To: <bef9b0b0-3bc0-4982-3b3d-aa829ad6ceb5@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9461eebf-af70-4b9b-c5ab-08d7795efa0d
x-ms-traffictypediagnostic: DB7PR04MB4153:|DB7PR04MB4153:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB41534AA31CA093B7A85288C7885C0@DB7PR04MB4153.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 02426D11FE
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(136003)(39860400002)(366004)(376002)(346002)(396003)(189003)(199004)(52314003)(13464003)(14444005)(478600001)(81166006)(81156014)(6436002)(305945005)(7736002)(33656002)(74316002)(3846002)(44832011)(316002)(6116002)(110136005)(8936002)(8676002)(25786009)(11346002)(71200400001)(71190400001)(229853002)(14454004)(55016002)(52536014)(6306002)(7696005)(4326008)(5660300002)(76176011)(966005)(45080400002)(2501003)(86362001)(99286004)(66476007)(186003)(26005)(53546011)(6506007)(76116006)(66946007)(66556008)(102836004)(6246003)(66446008)(64756008)(2906002)(9686003);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7PR04MB4153;H:DB7PR04MB4490.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TiUw4u0X3+PzH81tPa2wsxun1mK75D/OVduLzkr+vPkMYwxsEQsucOEGtmBU0SefH4JEMTRBafrhPL4ghmYnStr/pCvCuV1wX3/FrdcfjKwMqA4YaxoEh1Cvi8J77G74MGhEjc9jLzB1wlZNFWedLrStDJhEhtp4H23lY6UDWcukV9X4kRipvLt/gLlz9Lx4WhekKnOhgxxkjsHGT5HC45m3IsGGw0niCxNPXnwmIINrd262EFPK4+MHASqmdHOMYwmIbY9VSb4nfVAG2J964Zb9zI4NvTOnbXmB/MM2PzCPcsA4kCPvQ025xIg9aSXU3/Bdnj7hF1BuyYD32nRq0OHvtLIRo2pc2N6G+0VmAMClJ9GjJXgGKqp4cn5/NKZHdDCbhPn1+8yj9imfnMXtGxmMvmdnLDuL/Scy70bHZeaXKY5Plw4bteVsFnRetinyBIt99TscOFFBCuYRB1eduHD3cspLfoivfVCQwt8dlLhxYUHrvjH0K6/uicxdF+DEB27rzR9RgNC3LK8zrF0SXQ==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9461eebf-af70-4b9b-c5ab-08d7795efa0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2019 08:41:52.4788
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jJBJHmtB4dM3mr5p1Qvy0QlnCDx3bfs8iTwDroKUQ/G+Atg7slazMFMPeBrG4s6xER+YaaEyIW4ZV6iK0ecgkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4153
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=mg0UXMak;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.6.48 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

> Subject: Re: [PATCH 1/2] arm: irqchip: add lock in irqchip_inject_pending
>=20
> On 05.12.19 03:28, Peng Fan wrote:
> > Hi Jan,
> >
> >> -----Original Message-----
> >> From: Jan Kiszka <jan.kiszka@siemens.com>
> >> Sent: 2019=E5=B9=B412=E6=9C=883=E6=97=A5 17:18
> >> To: Peng Fan <peng.fan@nxp.com>; jailhouse-dev@googlegroups.com
> >> Cc: Alice Guo <alice.guo@nxp.com>
> >> Subject: Re: [PATCH 1/2] arm: irqchip: add lock in
> >> irqchip_inject_pending
> >>
> >> On 03.12.19 10:15, Peng Fan wrote:
> >>>> Subject: Re: [PATCH 1/2] arm: irqchip: add lock in
> >>>> irqchip_inject_pending
> >>>>
> >>>> On 03.12.19 09:58, Peng Fan wrote:
> >>>>>> Subject: Re: [PATCH 1/2] arm: irqchip: add lock in
> >>>>>> irqchip_inject_pending
> >>>>>>
> >>>>>> On 03.12.19 09:27, Peng Fan wrote:
> >>>>>>> Thinking about core0 is inject SGI to core1, core1 is handling
> >>>>>>> SGI interrupt.
> >>>>>>>
> >>>>>>> That means core0 might be in path to enqueue SGI into the
> >>>>>>> pending_irqs array, core1 might be in path handling SGI and pick
> >>>>>>> one from pending_irqs array. So need to use lock to protect
> >>>>>>> unqueue, not only enqueue.
> >>>>>>>
> >>>>>>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> >>>>>>> ---
> >>>>>>>
> >>>>>>> V1:
> >>>>>>>  The best case is only lock one entry, so no good solution,
> >>>>>>> because there is possibility that inject fail.
> >>>>>>>
> >>>>>>>  hypervisor/arch/arm-common/irqchip.c | 5 +++++
> >>>>>>>  1 file changed, 5 insertions(+)
> >>>>>>>
> >>>>>>> diff --git a/hypervisor/arch/arm-common/irqchip.c
> >>>>>>> b/hypervisor/arch/arm-common/irqchip.c
> >>>>>>> index 1c881b64..fbaa3099 100644
> >>>>>>> --- a/hypervisor/arch/arm-common/irqchip.c
> >>>>>>> +++ b/hypervisor/arch/arm-common/irqchip.c
> >>>>>>> @@ -279,11 +279,14 @@ void irqchip_inject_pending(void)
> >>>>>>>  	struct pending_irqs *pending =3D
> &this_cpu_public()->pending_irqs;
> >>>>>>>  	u16 irq_id, sender;
> >>>>>>>
> >>>>>>> +	spin_lock(&pending->lock);
> >>>>>>> +
> >>>>>>>  	while (pending->head !=3D pending->tail) {
> >>>>>>>  		irq_id =3D pending->irqs[pending->head];
> >>>>>>>  		sender =3D pending->sender[pending->head];
> >>>>>>>
> >>>>>>>  		if (irqchip.inject_irq(irq_id, sender) =3D=3D -EBUSY) {
> >>>>>>> +			spin_unlock(&pending->lock);
> >>>>>>>  			/*
> >>>>>>>  			 * The list registers are full, trigger maintenance
> >>>>>>>  			 * interrupt and leave.
> >>>>>>> @@ -295,6 +298,8 @@ void irqchip_inject_pending(void)
> >>>>>>>  		pending->head =3D (pending->head + 1) %
> MAX_PENDING_IRQS;
> >>>>>>>  	}
> >>>>>>>
> >>>>>>> +	spin_unlock(&pending->lock);
> >>>>>>> +
> >>>>>>>  	/*
> >>>>>>>  	 * The software interrupt queue is empty - turn off the
> >>>> maintenance
> >>>>>>>  	 * interrupt.
> >>>>>>>
> >>>>>>
> >>>>>> Did you see real corruptions?
> >>>>>
> >>>>> No. just code inspection currently. We met some SGI inject return
> >>>>> -EBUSY, so go through the code, and think this piece code needs a l=
ock.
> >>>>>
> >>>>>>
> >>>>>> The idea behind this was that the injection to the lock-less
> >>>>>> queue happens in a way that it won't make changes visible to the
> >>>>>> consumer that are inconsistent, hence the barrier in
> irqchip_set_pending.
> >>>>>> Looking that again, though, we possibly need another barrier,
> >>>>>> right before updating
> >>>>>> pending->tail.
> >>>>>
> >>>>> Barrier could not prohibit enqueue/unqueue contention.
> >>>>> enqueue will check head, unqueue will update head.
> >>>>
> >>>> Some topic as with lockless enqueuing: We need a barrier to shield
> >>>> the readout of the head entry from the update of pending->head. So,
> >>>> we are definitely lacking barriers here, but I don't think we need
> >>>> the spinlock between producer and consumer because there is only
> >>>> one
> >> consumer.
> >>>
> >>> Lock-free should be possible, let me work out a non-lock solution.
> >>
> >> This is what comes to my mind so far, but please re-check carefully:
> >>
> >> diff --git a/hypervisor/arch/arm-common/irqchip.c
> >> b/hypervisor/arch/arm-common/irqchip.c
> >> index 1c881b64..a83cd81d 100644
> >> --- a/hypervisor/arch/arm-common/irqchip.c
> >> +++ b/hypervisor/arch/arm-common/irqchip.c
> >> @@ -246,12 +246,12 @@ void irqchip_set_pending(struct public_per_cpu
> >> *cpu_public, u16 irq_id)
> >>  	if (new_tail !=3D pending->head) {
> >>  		pending->irqs[pending->tail] =3D irq_id;
> >>  		pending->sender[pending->tail] =3D sender;
> >> -		pending->tail =3D new_tail;
> >>  		/*
> >> -		 * Make the change to pending_irqs.tail visible before the
> >> -		 * caller sends SGI_INJECT.
> >> +		 * Make the entry content visible before updating the tail
> >> +		 * index.
> >>  		 */
> >>  		memory_barrier();
> >> +		pending->tail =3D new_tail;
> >
> > The spin_unlock implies memory barrier. I think no need memory_barrier
> here.
>=20
> We /might/ be fine here for the archs we support, but Linux is more
> strict:
>=20
> "(2) RELEASE operation implication:
>=20
>      Memory operations issued before the RELEASE will be completed
> before the
>      RELEASE operation has completed.
>=20
>      Memory operations issued after the RELEASE may be completed before
> the
>      RELEASE operation has completed."
>=20
> Now, the x86 is ordered anyway, ARMv7 indeed has the same barrier in the
> unload as in the memory_barrier(). However, ARM64 is not that clear to me=
.

ARM64 STLRH:
Store-Release Register Halfword stores a halfword from a 32-bit register to=
 a
 memory location. The instruction also has memory ordering semantics as=20
described in Load-Acquire, Load-AcquirePC, and Store-Release on page B2-108=
.

DDI0487D version, B2-108:
The Load-Acquire, Load-AcquirePC, and Store-Release instructions can remove
the requirement to use the explicit DMB instruction.

Hope this is clear.

Thanks,
Peng.

>=20
> Jan
>=20
> >>  	}
> >>
> >>  	spin_unlock(&pending->lock);
> >> @@ -264,6 +264,12 @@ void irqchip_set_pending(struct public_per_cpu
> >> *cpu_public, u16 irq_id)
> >>  	if (local_injection) {
> >>  		irqchip.enable_maint_irq(true);
> >>  	} else {
> >> +		/*
> >> +		 * Make the change to pending_irqs.tail visible before the
> >> +		 * caller sends SGI_INJECT.
> >> +		 */
> >> +		memory_barrier();
> >
> > Not needed, see above, spin_unlock already done this.
> >
> >> +
> >>  		sgi.targets =3D irqchip_get_cpu_target(cpu_public->cpu_id);
> >>  		sgi.cluster_id =3D
> >>  			irqchip_get_cluster_target(cpu_public->cpu_id);
> >> @@ -292,6 +298,12 @@ void irqchip_inject_pending(void)
> >>  			return;
> >>  		}
> >>
> >> +		/*
> >> +		 * Ensure that the entry was read befor updating the head
> >> +		 * index.
> >> +		 */
> >> +		memory_barrier();
> > No need. The index update will not be speculative before reading
> pending->head.
> >> +
> >>  		pending->head =3D (pending->head + 1) % MAX_PENDING_IRQS;
> >
> > Need a barrier here, to make update visible to producer.
> >
> >>  	}
> >
> > My version,
> >
> > diff --git a/hypervisor/arch/arm-common/irqchip.c
> > b/hypervisor/arch/arm-common/irqchip.c
> > index 1c881b64..5abf1c37 100644
> > --- a/hypervisor/arch/arm-common/irqchip.c
> > +++ b/hypervisor/arch/arm-common/irqchip.c
> > @@ -247,13 +247,12 @@ void irqchip_set_pending(struct public_per_cpu
> *cpu_public, u16 irq_id)
> >                 pending->irqs[pending->tail] =3D irq_id;
> >                 pending->sender[pending->tail] =3D sender;
> >                 pending->tail =3D new_tail;
> > -               /*
> > -                * Make the change to pending_irqs.tail visible before
> the
> > -                * caller sends SGI_INJECT.
> > -                */
> > -               memory_barrier();
> >         }
> >
> > +       /*
> > +        * spin_unlock will make the change to pending_irqs.tail and
> > +        * entry content visible before the caller sends SGI_INJECT.
> > +        */
> >         spin_unlock(&pending->lock);
> >
> >         /*
> > @@ -293,6 +292,9 @@ void irqchip_inject_pending(void)
> >                 }
> >
> >                 pending->head =3D (pending->head + 1) %
> > MAX_PENDING_IRQS;
> > +
> > +               /* Make the change to pending->head visible to
> enqueue. */
> > +               memory_barrier();
> >         }
> >
> >         /*
> >
> > Thanks,
> > Peng.
> >>
> >>
> >> Thanks for bringing this up!
> >>
> >> Jan
> >>
> >> --
> >> Siemens AG, Corporate Technology, CT RDA IOT SES-DE Corporate
> >> Competence Center Embedded Linux
>=20
>=20
> --
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE Corporate
> Competence Center Embedded Linux
>=20
> --
> You received this message because you are subscribed to the Google Groups
> "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send an
> email to jailhouse-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgroup=
s
> .google.com%2Fd%2Fmsgid%2Fjailhouse-dev%2Fbef9b0b0-3bc0-4982-3b3d-
> aa829ad6ceb5%2540siemens.com&amp;data=3D02%7C01%7Cpeng.fan%40nxp
> .com%7C10ff76f9bdad430d02d208d77959a6aa%7C686ea1d3bc2b4c6fa92cd
> 99c5c301635%7C0%7C0%7C637111298262016631&amp;sdata=3Dz9GG03UgG
> tQUqoaRzSrZip%2BA0pM7mxUM5YrAJmJ6QPI%3D&amp;reserved=3D0.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/DB7PR04MB44907526C0E8FAB7CEECA8B9885C0%40DB7PR04MB4490.eurprd=
04.prod.outlook.com.
