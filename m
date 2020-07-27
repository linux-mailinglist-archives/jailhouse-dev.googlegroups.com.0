Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBB2HG7H4AKGQEEIWP4TQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13a.google.com (mail-lf1-x13a.google.com [IPv6:2a00:1450:4864:20::13a])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9E822E5D6
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jul 2020 08:25:45 +0200 (CEST)
Received: by mail-lf1-x13a.google.com with SMTP id b16sf4037553lfs.10
        for <lists+jailhouse-dev@lfdr.de>; Sun, 26 Jul 2020 23:25:45 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1595831145; cv=pass;
        d=google.com; s=arc-20160816;
        b=yzhniFtURZfahba8zUyxuHApeVFzvSBNxdRFuionE/aDZBSQsq9BxbWkNoeQKW4o0V
         hGjKc8LxhvC5VidcnoxxVdGll3peiEJe5bJyzdzXQJ9jehLAVYDUIMiNJevVRxhMEnLB
         gajcIMXT4FYjDuDUhxVIZzB63IKsTBe6z2tXnEp+W7BExqwFDk4g/l1fBBDVMba33sle
         mXibdP9RfQ05LckCVNq+wSI9/F5lObXtWgvAXUvVwrZLm3DrCg/+ttvvqt+ufSrb2NFs
         kspJ87r16nj1PpopQwA//UxeuE1esuPPLcGGzVjoDCFsU5FVr0UoA3+uujKxyyv8N2w9
         FguQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to:from:sender:dkim-signature;
        bh=Jq/WsK1u6hUWyGCZRiGk9wDmFBFbER+inDYM5OrJzhI=;
        b=pUpKSKT4/y0KJmyUHXorxcq/zI/zKZ/RYJGOlpsfi8JVsYkmEMStzyJItVYGJNsJvU
         De67sOHO22ggtgLQqSAF/AHVOtd7Mg0IYfmY0/GgmNiuj8VY4hsn+EIuCx9AEYSzjeec
         wezO5odfb/XdKnplcoz15le3Ql+yu86ZvVWvdKuH0Q97KDnDsR+tiibBVtAGibHV78hM
         ec75a1xt1Fn3ZeV+6lfOHoWBKtb8+Goc2jgqBzAtUy2qGU6joVG2HfYBh+hdZ4YVpCGp
         hCo5m/iomDbE5LQBcgeBqmpMf1PBebAGQplmyQpVQEffm3n3xn22nVZQQLJwBhLWpjAs
         KZRA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=azf3ygj6;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.6.59 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Jq/WsK1u6hUWyGCZRiGk9wDmFBFbER+inDYM5OrJzhI=;
        b=THW60Qv/1lVKRPYNElDANq4o3tQvI5HzRv8peqjikUXQaPocPwMge7NNJcdMigsOv7
         tf5znHYtCN4Ed2kev07g6YqLIIOkwMrrGNsM+LMPdgTdkh0k88WPznB+rx4v7dcnuiNs
         VSBKaaV2k4hM3u+UAPYXO1KeD462Vi0xMQ+vOKcRHHmqmpPjFOXuKgmFt26+FBce3B9d
         +RP70+bJUGU9wGnjPUNnoaCRLi7r7fD0+dCuAR34FxsVm6zdaM9EpK5FaniTtaKhAvHG
         kD/XHbPdAZzzxIYZeh+fa9+oYtFzybbV5Yi3QIkAixrmMhrKVQD2pdmwwrYJ5Tcdb02+
         Fwtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:content-transfer-encoding:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Jq/WsK1u6hUWyGCZRiGk9wDmFBFbER+inDYM5OrJzhI=;
        b=KnV9f47N5K4fELsSaax2B5VBhaHCnIRqA71etRMhdVK62boG9MKN4zxZHr2I+ScDk0
         godnKfsvr1H1fTzPzt2Id/sNkQvJ+3kd9zsZsX+H6ZJZMTLmbwKK840f2E7xcA4aqBQ2
         DOi8WFpPA+CBSiRSIzzyBhqeQjchu5r/0NzXcB0r7qYP0zSXs/zXsmJM9pI9PnzI5fVX
         G8Ge9JNKW6j8D5zJ4Ng/uxLJd1lKGcFFCvu6orDU/dwBo/7zGtAEhoQx4Kx+0t0UC0ov
         1w9Rv8pbIYAgpmJgFiDTcLSXqFWxMFE+Fccx4Wi/tgNyFqgNtvxM1ludFdOOIr6bZZli
         1UAA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM53149ijR9MPMopo8woNal1K1mZmIppAvgAzW0EqUVZSrmtIqOEhc
	KmqTowEQz/fOFIIcLCHX6dM=
X-Google-Smtp-Source: ABdhPJyd3HGOfkeTQAFt72C5JyIzsr6nuPU72NPmuBmy+2pR6v1O0NCQ/Ybnu5hdJJz8xeDOaXPcjQ==
X-Received: by 2002:a2e:8e95:: with SMTP id z21mr1047775ljk.143.1595831145132;
        Sun, 26 Jul 2020 23:25:45 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:4845:: with SMTP id 5ls1799653lfy.2.gmail; Sun, 26 Jul
 2020 23:25:44 -0700 (PDT)
X-Received: by 2002:a19:4ce:: with SMTP id 197mr7881165lfe.186.1595831144279;
        Sun, 26 Jul 2020 23:25:44 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1595831144; cv=pass;
        d=google.com; s=arc-20160816;
        b=cZ8PdezXdcI/tlxNUnFUZBuveJ0fSFa6l+MAssULpL6qqSRBcBQ5fawPHx9grn5EQR
         4fzNjrdjPmlBmI0LWRTyPmAM7nLqUjVOn8naUzprZaci+NeC8zTvFhorVeIK/EcwT/GE
         6/nZgD85oZ6B1zxzvc8oyLOgU29YrNoi1TAag17Ry4amPRnU2oQoWnBBYALOEY8dk+LQ
         roRMpeGKCcuDHP8HfJrNym4lcujSMOfSs77pZfAQG6ibjg1+PCLdf6crtO+aDli0BlnF
         A1GtQ7V4noZqte8sKNmsbXIXULyBl8JGpHzVY3pa+UGm7Sd+YROH61mq0p/RPZgG+7PG
         2d6A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=xyRzKPl+THvzK3oqhG4YETr+NoCO8AoiCW5OsL64yNs=;
        b=UyB0Ma1g96mv/5uGh8g/ltlkahJmjQ5gNq2y0vf1RBAFAfrP+dc36lz4op2Pm/bN6w
         P8urk/n4Q4xl0xEaIZqtDHvq08FhO6ppfghuR9K9C9U4Ww8xsD604WrlMIVj85/KK4ML
         rtIWCD+u1W2vOt6XAlUgk9LlaqXuUHhNTZJvtUmsO2+IyRG4RtxUTf6oQUSbrKX/9kKQ
         ONuaM7U30nZ9/eHYR4+6AiTUPf3TXe2sNf/GFpnwgtx5YHPD0Ry5C6ubtJVldHdHbMTd
         DHINbd+GWS3YRX7K/RXUoDeTwudPPQ1xqOc2FOidrGXmaP9N2e0sATgK9aQCcLu0yHgG
         RUZg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=azf3ygj6;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.6.59 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60059.outbound.protection.outlook.com. [40.107.6.59])
        by gmr-mx.google.com with ESMTPS id e2si440445ljg.8.2020.07.26.23.25.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 26 Jul 2020 23:25:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.6.59 as permitted sender) client-ip=40.107.6.59;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gdy9YKnUE2i+jPkaYCsx9hwl6psBSJAyCZd8SlY0PaMkVRLU7ri9Os85mgfypT8ZK8qnKAarWqlCic/VwKZkTr8FWD6aX54RObdADQOTcK8F+Xt2aRq/6A1imnVPeH9RRDeJLv+zzlbOvAMHvZO9bmJvM7eBU2Z8YWW/xZSNlt5gycKPW3aPc1/+DWLlNIBEQEsr29CL+aqVQPeREXGl5Y1ij5Bwhx2vhqnKxNt+GDT6j0/vvur67V6Kbwpu0rY4AXKVQatxjuAdgzzvJPcjcKTlC9OzHpO/1XFLQv5PmVaPZ55gLySUjfCGqnqtfUgtx82tVC144qO848lwNke6og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xyRzKPl+THvzK3oqhG4YETr+NoCO8AoiCW5OsL64yNs=;
 b=D4PbYa8gMBU3PH8DFmMYapRpNtUBz07ojXzZ8yivlxy3zDNVKliM/kZPGE2AwgEogEDVyFBvaB8Cy9EfUD9f8gm1QApoSDO6aKoph9zl2rPkuuruLNyaVJWY3PPiYEazRf8FKO6Ytm2V9mwAbY/PlmnOhuV3gJeYcnVT43yCxdtKJ5rKDrNnSrumgNKo36wygAqRiIv6602flTqwSzfhVfBXZRhzlnRt/oQsIzKpkEnih2tDu0YEsDhgIL919OO0+083xqkbyh5weEy5zbFaOYV1kqC46DdeiSpVtz5aAny7OSCTpPJtKmtX50btEY0rxTEgp5kXcz63LntLRaVJRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB5084.eurprd04.prod.outlook.com (2603:10a6:10:1c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Mon, 27 Jul
 2020 06:25:41 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::2d36:b569:17c:7701]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::2d36:b569:17c:7701%4]) with mapi id 15.20.3216.033; Mon, 27 Jul 2020
 06:25:41 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Peng Fan <peng.fan@nxp.com>, Jan Kiszka <jan.kiszka@siemens.com>, Angelo
 Ruocco <angelo.ruocco.90@gmail.com>
CC: Nikhil Devshatwar <nikhil.nd@ti.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>, Alice Guo <alice.guo@nxp.com>, Ralf
 Ramsauer <ralf.ramsauer@oth-regensburg.de>, Jose Martins
	<jose.martins@bao-project.org>
Subject: RE: jailhouse jitter?
Thread-Topic: jailhouse jitter?
Thread-Index: AdZQV9Sg2ghlhzPgRlmJb7fpOVsBgwADlDcAAAL01YAAAMZ8gAAGw6oAAAZGpAAALvHKAANegwUAABKcb+ABLTLsQA==
Date: Mon, 27 Jul 2020 06:25:41 +0000
Message-ID: <DB6PR0402MB2760EA5C808D0A49208E7A9788720@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <DB6PR0402MB2760BE2A66C776875890B5DF886D0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <38ffb4dc-20d6-3404-cc61-ea08ea8066f1@siemens.com>
 <e0b6c5f5-89a0-6e29-6700-e5d5064d4672@ti.com>
 <CADiTV-0qHuXt=wrGCp4RbFWcu=WGsZKB-doXOTxjMVZkRiiiCA@mail.gmail.com>
 <1d5b0ac8-0744-59ab-bb90-8133df4a1525@siemens.com>
 <d0b0c698-7ee2-97dc-7b6e-685f2f169f39@siemens.com>
 <CADiTV-1oJBD+SkAT475xD5iODeo24wqwBSFGu2JQATxqpF1W0w@mail.gmail.com>
 <b96f90ad-23bc-db73-9603-f9eb640804d0@siemens.com>
 <DB6PR0402MB2760B4463A03D7FC4EE3E4E988780@DB6PR0402MB2760.eurprd04.prod.outlook.com>
In-Reply-To: <DB6PR0402MB2760B4463A03D7FC4EE3E4E988780@DB6PR0402MB2760.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 827ada24-83eb-42b4-d27a-08d831f5e305
x-ms-traffictypediagnostic: DB7PR04MB5084:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB50848F7FA9B61E022DEDC4BC88720@DB7PR04MB5084.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CxU0Im+174ujYqcrSe3YgJdyhdGgPiXLD5M85iY0tXVSHvtiF0s8SpZhg3huhSQbczNALPmm0DZcRjk7E86GusCg8L2ZfnwFvHL2HXfo8lIb2H3FWQFcb1QfAVS8U9i3fIcSOy4pd5ICikfzfM4msUyxmrDYTTk61k3LahqgKw5y2C6ks+iLlIMUddnrzxzopX+RLV5Bj8KFMfIdOjwQgrCym4iRJJeYZmBUFB2/GiYYnMa6cAwlveze61vQPyE5ATzIQ7uP2KPb0/gC50TtV00F6vAoZE/EleSjqWS7LC2R667uUYcFj1kMJpE9tinnlgyEYaEGx5p+2ddv4V7wxSWiTOq1O7I8n+UkMrkX6q2+YKqe7oTFMa3bRb6zn4G1JAbDo4agpJyiVZL1mMHYVw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(39860400002)(346002)(396003)(376002)(366004)(6506007)(9686003)(52536014)(8936002)(53546011)(45080400002)(478600001)(26005)(5660300002)(316002)(4326008)(110136005)(186003)(33656002)(7116003)(54906003)(8676002)(66946007)(66476007)(66556008)(66446008)(64756008)(83080400001)(2906002)(76116006)(86362001)(3480700007)(83380400001)(44832011)(7696005)(966005)(55016002)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: aLTiER4vdqQHyIIbW8L3F3r8GfB9ySLLgkfsKT8MNtODS0i3w9QTZmI3wEkC49uB7OE4YF5IGsp5Yi/aycqyWI4Xzq1DcSMikHouolX8xWFwKifY733lg4JZvIzSESPhCzxLlOikmeMHBztzKezZFpLs7jsN6INQdMVOqz/YJr3bDe+MHxgVKhDMozcCtcidI5GvyjR83yDV+JtpL06gx0iBV2YuuSKBF0wXXx/P+5V16p8Q9DgQ+u/YiHlTd7sczEgbobUayLMUIq94+FdSeko8i7r+Ndxzqje57czThmGLnJjAwzN/0+o97TqMhZKsOKR5QZmqH6ZqQEjHvM5d4B22lk92E30iEK4rHjgS/mCq/rB+7IHxn8OZiVuzn7FRa4E1ARQ3gXo+u5JxNVQibwnUbiDLzL7gGdv5dJ/N8bjz7iGR75t8W7getcbVQ0UEA74kHaoATqflhVP6pG/qwuTYJtEtWPeNUOe1xHGF/kA=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 827ada24-83eb-42b4-d27a-08d831f5e305
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2020 06:25:41.7653
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mrVYWFiNdXUAi7PhtS6q2QtWfxThSzjv3OKeDxC/mooiOuXIuMJnsf45bQZkSfRrifRFkjOCYphIf7oRwX39uA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5084
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=azf3ygj6;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.6.59 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

Hi Jan

> Subject: RE: jailhouse jitter?
>=20
> > Subject: Re: jailhouse jitter?
> >
> > On 03.07.20 20:08, Angelo Ruocco wrote:
> > > Adding Jos=C3=A9 Martins in cc (direct gicv2 injection was his idea) =
as
> > > he might be interested in this.
> > >
> > > On 02/07/2020, Jan Kiszka <jan.kiszka@siemens.com> wrote:
> > >> On 02.07.20 18:45, Jan Kiszka wrote:
> > >>> On 02.07.20 15:31, Angelo Ruocco wrote:
> > >>>> On 02/07/2020, 'Nikhil Devshatwar' via Jailhouse
> > >>>> <jailhouse-dev@googlegroups.com> wrote:
> > >>>>> On 02/07/20 5:14 pm, Jan Kiszka wrote:
> > >>>>>> BTW, regarding direct interrupt delivery on ARM: In
> > >>>>>> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F
> > >>>>>> %252
> > >>>>>>
> >
> Flwn.net%2FArticles%2F820830&amp;data=3D02%7C01%7Cpeng.fan%40nxp.co
> > >>>>>>
> >
> m%7C6ecf1e2eb2714099a5ae08d82cf63a2c%7C686ea1d3bc2b4c6fa92cd99
> > c5c
> > >>>>>>
> >
> 301635%7C0%7C0%7C637308783336041620&amp;sdata=3DPviVkkKPB8Klql5U
> > z%2
> > >>>>>> B9rhZvAZxG00siR2yx%2F48P6kg4%3D&amp;reserved=3D0, it is
> > reported
> > >>>>>> that Bao has "found a way to map interrupts directly into
> > >>>>>> guests". I didn't find the time yet to check if that is
> > >>>>>> actually exit-free delivery, and that as a smart trick or
> > >>>>>> rather a problematic hack. Or if that sentence is rather a
> misunderstanding.
> > There is also the sentence: "Interrupts [...] have to be mediated
> > through the hypervisor, which is unfortunate since that increases laten=
cy."
> > >>>>>>
> > >>>>>
> > >>>>> I found this interesting and tried to read more about this.
> > >>>>> I found some commits at [1] which does the direct injection.
> > >>>>> Here is my rough understanding:
> > >>>>>
> > >>>>> * He is not setting the HCR_EL.FMO bit and that way all virtual
> > >>>>> interrupts are turned off
> > >>>>> * There is a new handler for handling "lower_el_aarch64_fiq"
> > >>>>> which ends up being handled by the Hypervisor
> > >>>>> * GICD is still being emulated so guests won't be able to route
> > >>>>> interrupts to wrong CPUs. Isolation is maintained
> > >>>>> * For triggering interrupts from Hypervisor (SGIs, etc) he is
> > >>>>> using SMC calls and has a new service implemented in the ATF [2]
> > >>>>> * I could not understand how the lower_el_aarch64_fiq exception
> > >>>>> is fired so that the Hypervisor is invoked
> > >>>>>
> > >>>>> My guess is that most of the code change ihere s to enable
> > >>>>> interrupts in the Hypervisor. Resetting HCR_EL2.FMO would send
> > >>>>> the interrupts at EL1 directly.
> > >>>>
> > >>>> Yup, that's more or less it.
> > >>>>
> > >>>> Just one clarifications, Bao *does* set the HCR_EL2.FMO, it
> > >>>> doesn't set the HCR_EL2.HMO. The HMO bit lets the interrupts
> > >>>> through, and they
> > >>>
> > >>> HCR_EL2.HMO? On which revision of the ARMv8 spec are we looking?
> > >>> Cannot find that in mine.
> > >
> > > Ugh, it's a typo, I meant HCR_EL2.IMO, my bad.
> > >
> > >>>> go directly to EL1/0. The virtual machines have complete access
> > >>>> to the gicc and receive IRQs without overhead.
> > >>>> As you have already pointed out, gicd is still emulated, so all
> > >>>> the operation of "enable/disable/set_tarrget" are slow as usual,
> > >>>> and still under control of the hypervisor.
> > >>>
> > >>> And so is inner-guest SGI (IPI) submission, I suppose. Just like
> > >>> on Intel (so far).
> > >
> > > Yes, everything that's gicd related is still handled by the
> > > hypervisor. The logic though is extremely simple, so the cost
> > > becomes almost the same as an empty hypercall.
> > >
> > >>>>
> > >>>> The problem is that IRQs are completely invisible to EL2, so Bao
> > >>>> needs to use FIQs for its internal functions. And to do that the
> > >>>> only way is to go through the secure monitor in EL3 for each
> > >>>> operation, having custom services running in the arm trusted
> firmware.
> > >>>
> > >>> Ah, interesting pattern: FIQ becomes the NMI that enables such a
> > >>> trick on Intel CPUs. If FIQ triggering architecturally limited to
> > >>> EL3, or is that SoC-specific?
> > >
> > > It's arm specific, FIQs are meant to be only used in the secure
> > > world, so EL3 and secure EL1.
> > >
> > >>> I'm not fully familiar with the ATF/TEE world yet, but your
> > >>> approach to model that service as SPD seems to block other use
> > >>> cases, like having a full TEE (OP-TEE). Wouldn't it rather make
> > >>> sense to model that as TEE app?
> > >
> > > Yes, it could be done as TEE app, but done like this shouldn't
> > > affect other use-cases, that we could of think of anyway...
> > >
> > >>>>
> > >>>> I've even thought of trying something similar in jailhouse, using
> > >>>> the linux driver that, running in EL1, could let jailhouse access
> > >>>> the IRQs even without the HMO bit set, and therefore allowing
> > >>>> direct IRQs access to inmates without the need to put a custom
> > >>>> service in the arm trusted firmware, but I found it a bit too intr=
icate.
> > >>>>
> > >>>
> > >>> You can't use the guest to model management interrupts that are
> > >>> there to interrupt the guest and inform the hypervisor about a
> > >>> high-prio event (like "kill that guest").
> > >
> > > True, and you have a lot of other problems having to rely on a guest
> > > for hypervisor tasks.
> > >
> > >> I started to read and think about this more - and then I suddenly
> > >> found SDEI [1]. Isn't our problem of having a non-IRQ event already
> > >> solved by registering on / sending some event 0? And SDEI is
> > >> implemented
> > by ATF.
>=20
> I am a bit lost (: How SDEI here would help interrupt inject?
>=20
> > >>
> > >> That would nicely overcome all the problems of the baod patch to
> > >> ATF (integration, security, missing gicv3 support, blocking of
> > >> other SPDs...). And even if I miss some catch in SDEI, the
> > >> principle of synthetic events defined there is what we want for
> > >> hypervisor management IPIs.
> > >
> > > Oh I didn't know about SDEI, it looks promising, but in the current
> > > state of the arm developer website I can't find any useful
> > > information, it doesn't even seem to be mentioned in the arm
> > > architecture reference manual.
> > >
> > >> The only downside: On a safety critical system, you may rather want
> > >> to get the firmware out of the picture during runtime, to reduce
> > >> the safety scope to a real minimum. But, IIRC, GICv4 will solve
> > >> direct interrupt injection in HW anyway.
> > >
> > > Yeah, in the GICv4 specifications there's the ability to directly
> > > inject the interrupts, but depending on the field it might be too
> > > long down the road for someone to wait.
> > >
> > >
> >
> > Forgot to share:
> >
> > -
> >
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b.
> >
> com%2Fsiemens%2Fjailhouse%2Fcommits%2Fwip%2Farm64-zero-exits&amp
> > ;data=3D02%7C01%7Cpeng.fan%40nxp.com%7C6ecf1e2eb2714099a5ae08d8
> 2c
> >
> f63a2c%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637308783
> >
> 336041620&amp;sdata=3D4WqAL3pvGByyvJjQH3%2BfiLUHCOLEXa569nSUwFT
> > QiTQ%3D&amp;reserved=3D0
> > -
> > https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fgit.=
k
> > iszk
> a.org%2F%3Fp%3Darm-trusted-firmware.git%3Ba%3Dshortlog%3Bh%3Drefs
> > %2Fheads%2Fqueue&amp;data=3D02%7C01%7Cpeng.fan%40nxp.com%7C6e
> cf
> >
> 1e2eb2714099a5ae08d82cf63a2c%7C686ea1d3bc2b4c6fa92cd99c5c301635
> > %7C0%7C0%7C637308783336041620&amp;sdata=3DBlleBLfrVIlHQ6Gn8MHN
> %
> > 2BWv2v4C2GxBiTDjXzPLaDq8%3D&amp;reserved=3D0
> >
> > All a bit hacky still but apparently no longer exploding. And without
> > runtime exists of the gic-demo.
> >
> > SDEI turned out to be more effort than expected because it is enabled
> > only in very few ATF targets so far. The queue above adds it to QEMU
> > (arm64) and ZynqMP (tested on Ultra96). TI-K3, RPi4, ESPRESSO/
> > MACCHIATObin should be similarly extensible, and all that also in
> > upstream - at least as configurable feature of those platforms.
>=20
> I'll check i.MX platforms.

I tested the SDEI on i.MX8MM, it shows the jitter became smaller.

Without SDEI, the gic-demo jitter is 999ns+
With SDEI, the gic-demo jitter is 124ns~246ns.

Indeed no more vmexits.

But the max jitter, some times SDEI bigger only when program start up, most=
ly because of CACHE WARM UP I think.

Will you move SDEI support to jailhouse mainline?

Thanks,
Peng.

>=20
> Thanks,
> Peng.
>=20
> >
> > Jan
> >
> > --
> > Siemens AG, Corporate Technology, CT RDA IOT SES-DE Corporate
> > Competence Center Embedded Linux
>=20
> --
> You received this message because you are subscribed to the Google Groups
> "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send an
> email to jailhouse-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgroup=
s
> .google.com%2Fd%2Fmsgid%2Fjailhouse-dev%2FDB6PR0402MB2760B4463A
> 03D7FC4EE3E4E988780%2540DB6PR0402MB2760.eurprd04.prod.outlook.co
> m&amp;data=3D02%7C01%7Cpeng.fan%40nxp.com%7C3a26236d791743a6f86
> 508d82d40f145%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C63
> 7309104236572621&amp;sdata=3DR2N6gPwNR%2FBnGLi1M6l1Yg%2F8U4mki
> uRsWrxPW9PmE8Y%3D&amp;reserved=3D0.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/DB6PR0402MB2760EA5C808D0A49208E7A9788720%40DB6PR0402MB2760.eu=
rprd04.prod.outlook.com.
