Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBH4LUPXQKGQE23JW2NA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53c.google.com (mail-ed1-x53c.google.com [IPv6:2a00:1450:4864:20::53c])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB4B113D64
	for <lists+jailhouse-dev@lfdr.de>; Thu,  5 Dec 2019 09:53:52 +0100 (CET)
Received: by mail-ed1-x53c.google.com with SMTP id t13sf1380987eds.4
        for <lists+jailhouse-dev@lfdr.de>; Thu, 05 Dec 2019 00:53:52 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1575536032; cv=pass;
        d=google.com; s=arc-20160816;
        b=Yj96pUgUN+t9yyv49RVyetkwHPABCwhSZwQPqBpumTHoMw+uHJp731PLMgQXfPqoCz
         UOk8M9xbgOfXF/Ry5N66d53LDLSP1jVd1XVyDyY7skxm7QEMueXxlRmCA9EVaNA7uD0f
         J9t1Dboy5LNiYHy6VYxFKKwXnWv5akVKThzRPd3iE+FtI2E1FMONRKqTft2z1ng8Fl/t
         WXtDPSjl0Yf5EsBeP7TPAX5HDH9RuWOWfTGDhYZ1HO47eS2W8Vr0EmpQATp2gpAd2RJv
         CSzY3kbi5uJ2h35x6XwtF1z6bdS1TUptNTAk0KzanzaOxe/hLjFYMmcHQ0c817ePtm7B
         mNgg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to:from:sender:dkim-signature;
        bh=26iShueYZ3MNHv25EJzF4y9N6R19MIbNTH4ylkY5FsY=;
        b=cTaQLu3wGeAPBTIpQ39CgVrRhg/TSASHImVFmdnZRGhC+RgwKjc4FJzn6HMxKH2/5E
         te/2qWHAMEM4BkIyokojdQDrOL6bo4+yi0fxFFtrvCKPBskx5Lvded/zMpfv3r0myeyK
         x23ZaYkJvFIBtuHV9V8slwsTU4knaF9PLgVHQENif4xWmOjdUZo5Wa9B7MFUZ2wiKBCH
         G/nfXEyo9Sa/8P+2/8+tEVoDHwYQzktieRNVhog9lMMSvPAtYt9q16g6Ed2AcHnjT/Kd
         yYWRyauKqwZ4501h7BGyvrtHzLpSBDxYn/eMwzR/lV44W4Sw1/aDYHwUVi5NwSjNjnDD
         8r/A==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=ZHsKSrds;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.2.65 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=26iShueYZ3MNHv25EJzF4y9N6R19MIbNTH4ylkY5FsY=;
        b=Su/QUt7eqohBzbim7F34RGcuXqZTWrm8d5s/wmZJTVhocrH2PMYiZjrnf+IUWfUgCX
         GdFGxxLaW57TjTg1GlkjpltXCqAXhCIHH1SDZk1sEIARwxaSHwx9b5Nc1VGewshAL9LW
         2lEzyD9QDN+1FEYwacUUsn38W2XFFCxeFZ7+hSbyLcz7htJ5sU6sCCfi8SWQx1zK5US3
         Oq9DeX90up8KTtjuVGhERfyO4Kcd1t7t24Hovw9qfLkIUHwbW1ZI4KkihRWhx/haTHcb
         JRwvm2zxtQwx1FoaCQPSU/IsusbblY71xOmJEXe7la1duodAamf2m+dQ3/SORMCn2JiV
         AUkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:content-transfer-encoding:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=26iShueYZ3MNHv25EJzF4y9N6R19MIbNTH4ylkY5FsY=;
        b=OO5g48t1wx8mRrMVNSsGIttSxXtXN/JqNhAziTBd+Cq972XOyNa+0D6ZlfHocl8kWH
         yWU0sTGBFuxt9Zndqo7vf35XEoOZ1/AtGznIIqvd+MMIMGKoCxAJ0EBwWAhTCOAlU2YC
         WYoh0SOOLNukfax4lnq6rCkhPRkixKpmzX2AzVnJFQHSkjurlcPHQHrV+JVFoBafDHYZ
         t27GLhi5wMYwIplyRC41xysMGmAupVfrGB/w2krjT/CZepaM2I5ISXiA2q1WzJfwWXaM
         KYuq6I0vhSTgZUzBL61zeSXe6UfeePhYOI6pSpsIrxP6J0acWZyM4SEeNZ3aNXOBDZVU
         el0Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAV4XvtU3iQdu1T9mQ27JjlYiaD2LBdlu+0Au6fhEKDc/tn2I9LQ
	lqaYE90rj5CycQa3JkSRN2U=
X-Google-Smtp-Source: APXvYqwFGfmhAj6TvmGkesHfQKPFYTxMujNdIFDvPIY1skGOz1u/5aWn2+QUqo9tZNd8hvCn5HvbYw==
X-Received: by 2002:a17:906:52c4:: with SMTP id w4mr7674877ejn.99.1575536031870;
        Thu, 05 Dec 2019 00:53:51 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:1d83:: with SMTP id dk3ls587715edb.14.gmail; Thu,
 05 Dec 2019 00:53:51 -0800 (PST)
X-Received: by 2002:aa7:cf83:: with SMTP id z3mr9223628edx.166.1575536031186;
        Thu, 05 Dec 2019 00:53:51 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1575536031; cv=pass;
        d=google.com; s=arc-20160816;
        b=xq3Q/5nB1T2z0lnnxFq917/uED6Yn49n5UkMWxuk0ZDkZZahbzoy8B+1TlJn/DMa8X
         sz1k9fm54tspQ7ldVoTVgO9bUAPqvoi1DpLpiIOPjcSEAEao0palVnfrffssVTK4s2jD
         5zWRAutKW+vOGZnKfaHeB696Y4vt4Udd8P4zYKEkeB94HKv7HGQLUQspyjPyGCiWTEp8
         XNBjk2T18ZFvs7Okp9aMgl1br1WYOLhA6QfQQTGB6fv024f6qdosdavd1EyPamD/HIoK
         m+/9rB31VqVHVcupGNssfFL5rNJTQisC8ygmbM7wxNffvMPD3tAgPQpBS3vyE4FP9dq1
         I2FQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=2v54M+yeveQEqxhysUUrUfKm57e6XTpKvokbnIbaiU0=;
        b=qIPPQbfjgFOwAVhfdCCMHFNgqb+zG7cIlUHK5YskU4EpDWc3ZIwPBSMbm1PAEffxFV
         2j7cVoD++zGlwoIRK+7MQZk9tKspImNU4hua3Jc3hScXBMzedI/vS9kOMgRb2QMEorPm
         jUyqrygJhTGkRYfch1WjwBriQwFU3gxf1L1OXPFY5QpLI0ZcB/vc05QLmr+KiDerlTM2
         DQWSpqiZGJO3KKs6QahP1loTBwrZ3ZDaumMObPVmOEVmy4nbes8kxBkQ6JkvIxFpzak7
         e9Rv6PyJIX7PMbuiyhBBbwG97kT62WwxCNmr49UA7QEUzxHlSQwmke6TSRj428RwBJQy
         poLA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=ZHsKSrds;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.2.65 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (mail-eopbgr20065.outbound.protection.outlook.com. [40.107.2.65])
        by gmr-mx.google.com with ESMTPS id n21si541965eja.0.2019.12.05.00.53.51
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Dec 2019 00:53:51 -0800 (PST)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.2.65 as permitted sender) client-ip=40.107.2.65;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SvvB+lgl4SXmNmftj8/OLrJzJmHUEpMvaTpSZ5DArPr8/YGIXBJ5S9+FXDGNZY6kpM3ErMAuDdl2fKrkYcObdg3zlfl/VnSORHMRosDCzII4AeBCafw7AoH8Pstg1DEqSfWyN6dxqArZFKIT/wZ359FW/GtmRCzr5sZ1vAUAbUvRSnfqGN/3mGVqc6n8hF3tg8F/g/75j1OIzZ86fH+9fJ7g00aAEd8KV3Pbcl16iWpeyZhwmKjgO7YYc6lIr49sacQ3Rp21fLnCrao5BKYTSs+WvI7jNmMsby7NxWm01sUzHNIDxLJRTSj+lwtvPs9SqMRLAKIIbCAaVC3PZOt56A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2v54M+yeveQEqxhysUUrUfKm57e6XTpKvokbnIbaiU0=;
 b=EjG7bMaLhyc9nrujbfSe1Zqyz5l8P82A+DVZPP8iZ3jz0eg2yAmK5NoM5j9Bzl6JmlVmEe2Mumo/71CX7VwnznICWo7FNagVWU7iYYPHuS9gG1Ma1HVld1XgMwxxMcaaw7VPgPqQT29wJtuL3IfKZrb8/ZP3bzqVbxJD+VJjLSGCB7JSaPTE47nxqORtOjSSokTqTjHXckk5Q5otnR79mi09bPvlPC2bobWlQAnbSdVstIGpfGXLwtpINR1jijq/3AMSRbi5YoETDKRg3KiJKAM/7d9QzQvUf0tjBOYhV8wT5B/PCWutNKf0s4Nzk1819qQ4olXE28zPnI27QX5blg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com (52.135.138.150) by
 DB7PR04MB5020.eurprd04.prod.outlook.com (20.176.236.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.13; Thu, 5 Dec 2019 08:53:49 +0000
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::4182:4692:ffbd:43a0]) by DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::4182:4692:ffbd:43a0%6]) with mapi id 15.20.2516.014; Thu, 5 Dec 2019
 08:53:49 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
CC: Alice Guo <alice.guo@nxp.com>
Subject: RE: [PATCH 1/2] arm: irqchip: add lock in irqchip_inject_pending
Thread-Topic: [PATCH 1/2] arm: irqchip: add lock in irqchip_inject_pending
Thread-Index: AQHVqbN5/wzTXUO1YEaDqJRJvOGoW6eoGqIAgAAAlhCAAANTAIAAAjbAgAAA/ACAArB0MIAAX2uAgAAJYVCAAAIjAIAAAayA
Date: Thu, 5 Dec 2019 08:53:49 +0000
Message-ID: <DB7PR04MB4490B26A9A7C3CD27C25CB8A885C0@DB7PR04MB4490.eurprd04.prod.outlook.com>
References: <20191203084553.20669-1-peng.fan@nxp.com>
 <3408fd87-22fa-31bc-657d-8661ad3998f3@siemens.com>
 <AM0PR04MB4481FCD642715C2D03DA78EB88420@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <81533a5d-8385-9872-ef22-4bcaa30c98f5@siemens.com>
 <AM0PR04MB44811BEC3EDE072313C1F3B888420@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <46f71ed9-d4a2-d695-2ce5-307bfd13d1ca@siemens.com>
 <AM0PR04MB44813A2E63BF7C31B34C4E1C885C0@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <bef9b0b0-3bc0-4982-3b3d-aa829ad6ceb5@siemens.com>
 <DB7PR04MB44907526C0E8FAB7CEECA8B9885C0@DB7PR04MB4490.eurprd04.prod.outlook.com>
 <b1309642-8acd-1d7c-310f-07b64e5a2940@siemens.com>
In-Reply-To: <b1309642-8acd-1d7c-310f-07b64e5a2940@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 8f74f007-9dc1-4ea5-cab2-08d77960a583
x-ms-traffictypediagnostic: DB7PR04MB5020:|DB7PR04MB5020:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB50200A58535A1BAA649C64FA885C0@DB7PR04MB5020.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 02426D11FE
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(376002)(346002)(366004)(39860400002)(396003)(136003)(52314003)(13464003)(199004)(189003)(4326008)(5660300002)(52536014)(186003)(6116002)(102836004)(3846002)(66446008)(66556008)(66476007)(26005)(66946007)(64756008)(6436002)(14444005)(71200400001)(316002)(71190400001)(86362001)(76116006)(14454004)(76176011)(7696005)(74316002)(7736002)(305945005)(99286004)(53546011)(55016002)(2501003)(478600001)(2906002)(229853002)(6506007)(9686003)(6246003)(110136005)(25786009)(44832011)(8676002)(8936002)(81156014)(11346002)(81166006)(33656002);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7PR04MB5020;H:DB7PR04MB4490.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JT6fti1dyBRKCQyQcMFha3uPV73gJKSQvSnriHBP9RSuS5KM7zwnfOh/5RrYjj0Rt1st9BDgk0K+Pd4EbVgpWWAX/ZeLQ+ePu9IBhrhHI4ysKRzqm96uNU/6SAfivgFJuNLgs7Z1f4V4ipZa5tYferDFnbagEmgs2p0a8bwWEkiv5gldFtU+yiL0+QBktA5kqZq+sbHobVCr/g+ZnbP+u3A1Plak7FQT5EMN1d4xCR3nZOSyIZJRdytuUo7TjuZW17b4M9zgFLnPPdx6bsKMkxU0vBbjkBtFxVOYXW0N4wZDytldP7JfGyA5nxImRFu2oiikEqPv2cgpo4V8OU7XrcUsop+7uuUrC9ZDFo0ex/QUwi+lF7YEcbtf/2uLwe3XSgw5bYiz7NZcUDNjVfAiqU8EIrxXgmcYeyaLISM0TW0AhrNbxEwSU8Mpz1R1sc4TB+EDZYCj0xwf9R7AnfzMPmmhL2vXCd+A1iId/7zMbut18ynaUSkBKSZnWTdbTHcoV3CdUCh63iEzWQ2/3wDTHg==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f74f007-9dc1-4ea5-cab2-08d77960a583
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2019 08:53:49.5224
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EznMdHeE9wPHCNNvUFHAn/fEAZtQ3gSGZVz+vgfRaTPkbx1uW/M8pxbvBU0qiZ27M2LxrnhkA9Af2LS/fl9u5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5020
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=ZHsKSrds;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.2.65 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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
> On 05.12.19 09:41, Peng Fan wrote:
> >> Subject: Re: [PATCH 1/2] arm: irqchip: add lock in
> >> irqchip_inject_pending
> >>
> >> On 05.12.19 03:28, Peng Fan wrote:
> >>> Hi Jan,
> >>>
> >>>> -----Original Message-----
> >>>> From: Jan Kiszka <jan.kiszka@siemens.com>
> >>>> Sent: 2019=E5=B9=B412=E6=9C=883=E6=97=A5 17:18
> >>>> To: Peng Fan <peng.fan@nxp.com>; jailhouse-dev@googlegroups.com
> >>>> Cc: Alice Guo <alice.guo@nxp.com>
> >>>> Subject: Re: [PATCH 1/2] arm: irqchip: add lock in
> >>>> irqchip_inject_pending
> >>>>
> >>>> On 03.12.19 10:15, Peng Fan wrote:
> >>>>>> Subject: Re: [PATCH 1/2] arm: irqchip: add lock in
> >>>>>> irqchip_inject_pending
> >>>>>>
> >>>>>> On 03.12.19 09:58, Peng Fan wrote:
> >>>>>>>> Subject: Re: [PATCH 1/2] arm: irqchip: add lock in
> >>>>>>>> irqchip_inject_pending
> >>>>>>>>
> >>>>>>>> On 03.12.19 09:27, Peng Fan wrote:
> >>>>>>>>> Thinking about core0 is inject SGI to core1, core1 is handling
> >>>>>>>>> SGI interrupt.
> >>>>>>>>>
> >>>>>>>>> That means core0 might be in path to enqueue SGI into the
> >>>>>>>>> pending_irqs array, core1 might be in path handling SGI and
> >>>>>>>>> pick one from pending_irqs array. So need to use lock to
> >>>>>>>>> protect unqueue, not only enqueue.
> >>>>>>>>>
> >>>>>>>>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> >>>>>>>>> ---
> >>>>>>>>>
> >>>>>>>>> V1:
> >>>>>>>>>  The best case is only lock one entry, so no good solution,
> >>>>>>>>> because there is possibility that inject fail.
> >>>>>>>>>
> >>>>>>>>>  hypervisor/arch/arm-common/irqchip.c | 5 +++++
> >>>>>>>>>  1 file changed, 5 insertions(+)
> >>>>>>>>>
> >>>>>>>>> diff --git a/hypervisor/arch/arm-common/irqchip.c
> >>>>>>>>> b/hypervisor/arch/arm-common/irqchip.c
> >>>>>>>>> index 1c881b64..fbaa3099 100644
> >>>>>>>>> --- a/hypervisor/arch/arm-common/irqchip.c
> >>>>>>>>> +++ b/hypervisor/arch/arm-common/irqchip.c
> >>>>>>>>> @@ -279,11 +279,14 @@ void irqchip_inject_pending(void)
> >>>>>>>>>  	struct pending_irqs *pending =3D
> >> &this_cpu_public()->pending_irqs;
> >>>>>>>>>  	u16 irq_id, sender;
> >>>>>>>>>
> >>>>>>>>> +	spin_lock(&pending->lock);
> >>>>>>>>> +
> >>>>>>>>>  	while (pending->head !=3D pending->tail) {
> >>>>>>>>>  		irq_id =3D pending->irqs[pending->head];
> >>>>>>>>>  		sender =3D pending->sender[pending->head];
> >>>>>>>>>
> >>>>>>>>>  		if (irqchip.inject_irq(irq_id, sender) =3D=3D -EBUSY) {
> >>>>>>>>> +			spin_unlock(&pending->lock);
> >>>>>>>>>  			/*
> >>>>>>>>>  			 * The list registers are full, trigger maintenance
> >>>>>>>>>  			 * interrupt and leave.
> >>>>>>>>> @@ -295,6 +298,8 @@ void irqchip_inject_pending(void)
> >>>>>>>>>  		pending->head =3D (pending->head + 1) %
> >> MAX_PENDING_IRQS;
> >>>>>>>>>  	}
> >>>>>>>>>
> >>>>>>>>> +	spin_unlock(&pending->lock);
> >>>>>>>>> +
> >>>>>>>>>  	/*
> >>>>>>>>>  	 * The software interrupt queue is empty - turn off the
> >>>>>> maintenance
> >>>>>>>>>  	 * interrupt.
> >>>>>>>>>
> >>>>>>>>
> >>>>>>>> Did you see real corruptions?
> >>>>>>>
> >>>>>>> No. just code inspection currently. We met some SGI inject
> >>>>>>> return -EBUSY, so go through the code, and think this piece code
> needs a lock.
> >>>>>>>
> >>>>>>>>
> >>>>>>>> The idea behind this was that the injection to the lock-less
> >>>>>>>> queue happens in a way that it won't make changes visible to
> >>>>>>>> the consumer that are inconsistent, hence the barrier in
> >> irqchip_set_pending.
> >>>>>>>> Looking that again, though, we possibly need another barrier,
> >>>>>>>> right before updating
> >>>>>>>> pending->tail.
> >>>>>>>
> >>>>>>> Barrier could not prohibit enqueue/unqueue contention.
> >>>>>>> enqueue will check head, unqueue will update head.
> >>>>>>
> >>>>>> Some topic as with lockless enqueuing: We need a barrier to
> >>>>>> shield the readout of the head entry from the update of
> >>>>>> pending->head. So, we are definitely lacking barriers here, but I
> >>>>>> don't think we need the spinlock between producer and consumer
> >>>>>> because there is only one
> >>>> consumer.
> >>>>>
> >>>>> Lock-free should be possible, let me work out a non-lock solution.
> >>>>
> >>>> This is what comes to my mind so far, but please re-check carefully:
> >>>>
> >>>> diff --git a/hypervisor/arch/arm-common/irqchip.c
> >>>> b/hypervisor/arch/arm-common/irqchip.c
> >>>> index 1c881b64..a83cd81d 100644
> >>>> --- a/hypervisor/arch/arm-common/irqchip.c
> >>>> +++ b/hypervisor/arch/arm-common/irqchip.c
> >>>> @@ -246,12 +246,12 @@ void irqchip_set_pending(struct
> >>>> public_per_cpu *cpu_public, u16 irq_id)
> >>>>  	if (new_tail !=3D pending->head) {
> >>>>  		pending->irqs[pending->tail] =3D irq_id;
> >>>>  		pending->sender[pending->tail] =3D sender;
> >>>> -		pending->tail =3D new_tail;
> >>>>  		/*
> >>>> -		 * Make the change to pending_irqs.tail visible before the
> >>>> -		 * caller sends SGI_INJECT.
> >>>> +		 * Make the entry content visible before updating the tail
> >>>> +		 * index.
> >>>>  		 */
> >>>>  		memory_barrier();
> >>>> +		pending->tail =3D new_tail;
> >>>
> >>> The spin_unlock implies memory barrier. I think no need
> >>> memory_barrier
> >> here.
> >>
> >> We /might/ be fine here for the archs we support, but Linux is more
> >> strict:
> >>
> >> "(2) RELEASE operation implication:
> >>
> >>      Memory operations issued before the RELEASE will be completed
> >> before the
> >>      RELEASE operation has completed.
> >>
> >>      Memory operations issued after the RELEASE may be completed
> >> before the
> >>      RELEASE operation has completed."
> >>
> >> Now, the x86 is ordered anyway, ARMv7 indeed has the same barrier in
> >> the unload as in the memory_barrier(). However, ARM64 is not that clea=
r
> to me.
> >
> > ARM64 STLRH:
> > Store-Release Register Halfword stores a halfword from a 32-bit
> > register to a  memory location. The instruction also has memory
> > ordering semantics as described in Load-Acquire, Load-AcquirePC, and
> Store-Release on page B2-108.
> >
> > DDI0487D version, B2-108:
> > The Load-Acquire, Load-AcquirePC, and Store-Release instructions can
> > remove the requirement to use the explicit DMB instruction.
> >
> > Hope this is clear.
>=20
> OK, let's document this in our spinlock implementations, to ensure that
> potential future ones (and there will be at least one further arch added =
in to
> mid-term) will read that and follow that semantic.=20

Yes. Add a comment to arm64 spin_lock/unlock code is enough?

Then we can go away
> without the explicit barriers in my diff.

Please review the following diff the same one posted earlier.=20

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
jailhouse-dev/DB7PR04MB4490B26A9A7C3CD27C25CB8A885C0%40DB7PR04MB4490.eurprd=
04.prod.outlook.com.
