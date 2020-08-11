Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBB7E2ZH4QKGQEWYSE6BA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x639.google.com (mail-ej1-x639.google.com [IPv6:2a00:1450:4864:20::639])
	by mail.lfdr.de (Postfix) with ESMTPS id 0909724178F
	for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Aug 2020 09:49:17 +0200 (CEST)
Received: by mail-ej1-x639.google.com with SMTP id pj3sf3150325ejb.19
        for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Aug 2020 00:49:17 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1597132156; cv=pass;
        d=google.com; s=arc-20160816;
        b=VmOWzHtRK4g4C8ug3jxSu1njB59yVT77aaHPakXfavrWyGnYroP1LuOYS5xv2KNwgT
         ej7th0sDpwHO0WPo1JeHiBM7uUy0JGiGOMMR9n8+CvelyeyRtmTvSahggUeaxc1CN12I
         jM7RyHlfiMpx95LK42kf51I7+plJI6mEjgXvkRFyuuVrPEf9kcANd6cbdZHMvrSiFywq
         pOqb6JKXZbTWOqRSLLTEl8gy+7Nm1iXQblnHov6Fq5iZgf1lHDNbb6CbSm9FfY341xLh
         6q+3x5SEzgDk6+6N1DnzR1HWqbdYB8umacKJWlMCXFpy7NG4gi4v2pvwlzKaKhQoRl2S
         I6ig==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:sender:dkim-signature;
        bh=eT7d0A+ucHlAV2ow7TKd1QpBR3ZZKq2lk7SuIzwRogk=;
        b=yxMeeKOzK0NLvXh8r0z8n13jg7MDUFyqauCYL4qKVLnUnBzSacJpgJEdXzCL7SDiiR
         G6LN5W913GSsV30Ae+hYtt2xZrqeyLBJQ/KaART65q9ji6Omk2JGyyT++WhN7Lnj4I/U
         /mSddPfpSQu9Q7j4KOfifRmggg81oDFpR6mDHS9z41T7b0eEOlZupvSCA+QaUKEBIZFI
         Zza65U0K81Soe+tXabBGYugwR5aYry6BcJDmuL8rHql6DBOAyOGCKPrPsOqgTP/wxvuY
         rhCMknOG8KOfqKAX0vplZNo7vxtRGqG7yoH+ufU8K6jy9cQAWn6dJQFp3GxcP1r4X0Ps
         5EuQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=P2faHa4V;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.0.77 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=eT7d0A+ucHlAV2ow7TKd1QpBR3ZZKq2lk7SuIzwRogk=;
        b=SShBGIS4uEgAeULls28Hu2ZGlBtm0bwlFhAqD+SfX1D3VD/2pKZM5j+OsDiIMntQJG
         2hwVcRqWJyh+pAnCT8tsTvjgqzIflsRcOEelfdNOY9MWPF0UT+ao3aNj2eduuqniObrE
         Tbp3Lfm62zCudIwVpVRb0HmrmDQi4OY1awNkRaNVWTsiQjDpPiQqZ/k4uH1QsTQ8gwC1
         J/nj7VKIKJGAwP9DUFWlifLQ2mszWgJx9FrdElAqP+0EszINsT1S4dbZRPXp2tGh4CvC
         VOSJuU4OsZkE4WIbBZuN+K/kBOnig/D/WCreATuMBzUa56Dmu0c8V+DHgBhxBc0OOdG/
         xXfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=eT7d0A+ucHlAV2ow7TKd1QpBR3ZZKq2lk7SuIzwRogk=;
        b=Dts+UYEvIVibb43ej+MMNYRUKwUwCyQpBjYIDeWKn+TpHdO6dtyELkGYb4ze77v/ig
         sfjdeVaSz5Yti/jhfGttahcDgPV3QBOlL4rgg8EulWeKklE/kS/tr4Xz//LDDcqw3pZT
         LpRTTYPdteWgjJM9E70xrUkdt8/I+qPVeQ8v0evIcoE9duLMPX52zGe+ATH0qxAsjX38
         3VM4Z6c6rut22F/z+OoHvOJxeArDliSu+DwxKc6G3XKIcccHomN8jViE/2H8CAU6btZQ
         xG5anXPcSx9J4RrPBWAFrjk0HQVrACWCs0k4B9MnQCnppCaLqVRxNgDtkCt9x/Y0LHnV
         vP8w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533ndEG/cnCNK7c4vFPUufDxAg+VvTdmhEEDEtb9AaccqAWXVCIk
	MOYJwcvo+Tjg/LTORmob7Kw=
X-Google-Smtp-Source: ABdhPJzha7/Nck+5yCluVsOZa0IBtlEJROK8GEiRuscmSlWwgrYn1VZKH01n/iNiySgnGKN7sPCysQ==
X-Received: by 2002:aa7:c513:: with SMTP id o19mr24837368edq.327.1597132156799;
        Tue, 11 Aug 2020 00:49:16 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:c40c:: with SMTP id j12ls1576681edq.2.gmail; Tue, 11 Aug
 2020 00:49:16 -0700 (PDT)
X-Received: by 2002:a05:6402:415:: with SMTP id q21mr11206066edv.71.1597132156323;
        Tue, 11 Aug 2020 00:49:16 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597132156; cv=pass;
        d=google.com; s=arc-20160816;
        b=bChnl3sTZuk/7DT0WBzXQ67e3DX8s2yAzTES8IDVe46YUCzUh6ZTUDDADezTn0bGjS
         gcNnIbZUab7kDtEmvP25rJ2pfJBtJ/LE8n4MBTNc9ucEwTJNErNb94SCm/+Ol1WzYfsq
         9tB5skPY/16IKZ7y0WqMrX70QwbbIc/gHbOOpfrRNa0Z8nKZft3/4a6w9+YcvlV/9DYg
         hLWRZllTWKEubI25guoVzGq0u8NDt9hahS6kZiO1d21H814NDz02TBKbq8zjU3JCrh7v
         metColDST/K1pXzsLTCahfPGAERls+iT4wGM4FTin9uFTP/uDgJs8rw8zhs50pU59WvH
         72aA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=GximuoEXH1u4dj68jkBVXqPHk9cDQ5i+i9ZkWEDwyao=;
        b=GENOCz+YkfpBO85rY8kfiVlTTVmMVbCwanRM9nVeEJcqfdAOpGHgHiE8UDeP9BU4tN
         IpnIaiJZLHUg44G7ofCcY017IJh1o4fmVZFD61ga+bLfIoa5Qa0IgCQz3M41hHfe8Wqy
         GBNDGj1evY1qT+eOUHO0AtvMKNkWRjiYAkQLgVU7KImPewt1qoe2A4puQkydAVYEPDK2
         7/UOuqkUPrF8nSAss0hC4Eu9xrja1KuRQYGPtclFvD8PTCfvpF1s5bbSg9AFhquBXH8Q
         xYO5JKqhZNYpFnA6VqJzkogecPTZXMuJSCoFAqlgcU/bmf5HxH7JCUbzi3XRKrLUz4nA
         l7cw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=P2faHa4V;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.0.77 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (mail-eopbgr00077.outbound.protection.outlook.com. [40.107.0.77])
        by gmr-mx.google.com with ESMTPS id q14si888904ejo.0.2020.08.11.00.49.16
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Aug 2020 00:49:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.0.77 as permitted sender) client-ip=40.107.0.77;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DaIcNDSLu2fS6uL84H+UsWcTqDEgZynQerFKd6ymVC8sAPVXbebDcfFwb1zydO3K+zE70D3fO4Tpmav7JZngyBCgrHi2zGrWlyNXqy+0eIPewdMEmw99iK0DEyCGFoxh++nGBjs8AsAPlu5LT0s0HxvhEjpI1AAFJ7kqWxKEwUWdCJIDm6xQQhxE4XcngQCnwoJaSP317q3ASyfczbSr35BBXizFKNDQcqjvOSZU9XVhSWz20qGQUTQsTt4qgPnJdTywYjKf8jp9r+emgYPRaHIPqbqsjdm467al2NJ6sQH5T8mqeirr7kdQEdg6GnGYsV4pJc6Ya20NXx4deOwBgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GximuoEXH1u4dj68jkBVXqPHk9cDQ5i+i9ZkWEDwyao=;
 b=RzHQkUk+I+uSzk41JKF3XhnEOYX+Of+/71CrV0h5+GAi/++I5yWW5w0TkhXVy/nsheGm3eXv24bo8yBeGhpt/gNM4BDI3m2YP7azIqzMKtGUYTvPGlEJEpFHs3Rc9ersrE6Tg0cKF1c8/Q62rPfG576wSKpv4FkluEo3Lm+MlvmnA6p2z/Kp2ytsM1E56TkKIARwQiRyewzHknvadFDEHb3ZxtPd/FbfH7070ISymLNE5LyxqKxpSKvEKtbx4MQ2htC2FZ4Mgb08oniJmDIqeaYEAxvTxg5WhT+FdHTHATmRPgri63pmvhO6+s8d7sDXn9Bd7hIigpM5JpVeWC7iRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from AM5PR0402MB2756.eurprd04.prod.outlook.com
 (2603:10a6:203:99::22) by AM6PR04MB5029.eurprd04.prod.outlook.com
 (2603:10a6:20b:9::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.20; Tue, 11 Aug
 2020 07:49:15 +0000
Received: from AM5PR0402MB2756.eurprd04.prod.outlook.com
 ([fe80::485:d415:5f2f:e599]) by AM5PR0402MB2756.eurprd04.prod.outlook.com
 ([fe80::485:d415:5f2f:e599%10]) with mapi id 15.20.3261.025; Tue, 11 Aug 2020
 07:49:15 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
CC: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>, Alice
 Guo <alice.guo@nxp.com>
Subject: RE: [PATCH 08/10] arm64: sysregs: correct SCTLR_EL1_RES
Thread-Topic: [PATCH 08/10] arm64: sysregs: correct SCTLR_EL1_RES
Thread-Index: AQHWbGRFNsJMjlZQR0OFT0cwrAb6rqkyizKAgAADD4A=
Date: Tue, 11 Aug 2020 07:49:15 +0000
Message-ID: <AM5PR0402MB275665257ADDAFEAE4B42B8688450@AM5PR0402MB2756.eurprd04.prod.outlook.com>
References: <20200807030632.28259-1-peng.fan@nxp.com>
 <20200807030632.28259-9-peng.fan@nxp.com>
 <4821d0a0-f8f3-582b-1182-9c5424f68ec3@siemens.com>
In-Reply-To: <4821d0a0-f8f3-582b-1182-9c5424f68ec3@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 75a9d62d-8fda-4530-908c-08d83dcb0ba5
x-ms-traffictypediagnostic: AM6PR04MB5029:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB5029529308E161BDB12D836C88450@AM6PR04MB5029.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: C/+tle+xwz7tou7Pl49y7SRyy7j+jc/TgMkea0tj4yVib8ZXj1Xcgbfo5Zg8NUxxpDNJ2Vlz+JGjev29MfL8L+h44cE303oIC7j9ztJKMLBjLsXDLUryukwBTMec9CxTQGh5CbzAgMpSbu7nWZl8PyehR9AnAYZanCjo2OvYOLvHYRSADo/z9jbJBOXbD0uRzvXF4x1CdtBaRS5VfdjOR3wE9ynHc1Op7wYc8VJY8y/tk6JvnkCTzIaBRA8dDPH9nDR6x/9hbvowkrqQJBjEANDlf2TJPhlFDjZO2cqO9ByEnVZlg/p3ZE4h3dgCeuA01DivkisjS6746Q8Wbq5B5Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR0402MB2756.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(39860400002)(396003)(376002)(346002)(136003)(186003)(8676002)(7696005)(478600001)(86362001)(44832011)(2906002)(33656002)(8936002)(26005)(71200400001)(53546011)(76116006)(316002)(66946007)(5660300002)(6506007)(9686003)(64756008)(66556008)(55016002)(52536014)(4326008)(54906003)(83380400001)(6916009)(66476007)(66446008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: gNWiexy9JK+Gxz3LGIP5m/Nn1HS6TQ/jENB0mdPEJFjC8vu5/NnMdRvj1YxSbMpaydJCVMwoqsCGeZMXnQ126lskYlwQwKosgr1sTb0dx//SolpV7O9wNdUlnxIflcVmZGz8gKAZizIDRLc4Hb5tkMvpavo+oQBfA+TpUTsurFho4kWHVH1NHlft06re1UBMZKp0OnDoz8iq1Kz2FF9ibLQAfR5LEmq9zMHOQC2qiWmKaBAUNz0J0cUUWpxqeHFrlZyEPELA+YNIh0AwtxPPkkurhtZbOEgVW083ERtsETc9PmKAOZRnvM/D20YHJwAK5YmD/ZV0r1kd0Caue42i5FKqkexI+KWseh5ceQGNo1fNndIpiwP95NAmOImcSxLgbIFtOYApkq6oZ0NhXy7KIqa1+pmgOtDKmPNB2f56eCXAsOOIRcA09XE19LeiIWY8FHfi0AtnDIOX5B5r8UG97SrDXMWbRA32AgGFdMT8jHhLvMttTLMUy+MiTcFImuaOVS8rp2PyBu+j7E8P8OwDJuI8Us9DY6LnVjq5ALETI01+V5mHWLo01W88vi+/yOYuVsM8JbXnMSUcN0VXD5WocIgYRPxuImI13a4lsJS+PnrGjAIiDOar8SFkYwias2i31mmIxAzQtlD2+RSChlmLDw==
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM5PR0402MB2756.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75a9d62d-8fda-4530-908c-08d83dcb0ba5
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2020 07:49:15.5110
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dptvgaJRA4oU4k/olF7wYkoHWs1XqL14HzFuD4X7i48U2uRO+lOfLd83XEsAimAs/vOXU19ddceT4sNMYjgK0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5029
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=P2faHa4V;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.0.77 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

> Subject: Re: [PATCH 08/10] arm64: sysregs: correct SCTLR_EL1_RES
> 
> On 07.08.20 05:06, peng.fan@nxp.com wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > bit23 is SPAN, not reserved bit.
> >
> 
> This is not correct, see D7.2.81 in the ARMv8 manual.
> 
> Where did you get this from? What is it trying to fix?

DDI0487D_a_armv8_arm, 
" D12.2.100 SCTLR_EL1, System Control Register (EL1)"

This is just to align with Linux Kernel, since the head.S
in the bootloader needs this.

Regards,
Peng.

> 
> Jan
> 
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >  hypervisor/arch/arm64/include/asm/sysregs.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/hypervisor/arch/arm64/include/asm/sysregs.h
> > b/hypervisor/arch/arm64/include/asm/sysregs.h
> > index 0105b109..a7370373 100644
> > --- a/hypervisor/arch/arm64/include/asm/sysregs.h
> > +++ b/hypervisor/arch/arm64/include/asm/sysregs.h
> > @@ -64,7 +64,7 @@
> >  #define SCTLR_EE_BIT	(1 << 25)
> >  #define SCTLR_UCI_BIT	(1 << 26)
> >
> > -#define SCTLR_EL1_RES1	((1 << 11) | (1 << 20) | (3 << 22) | (3 << 28))
> > +#define SCTLR_EL1_RES1	((1 << 11) | (1 << 20) | (1 << 22) | (3 << 28))
> >  #define SCTLR_EL2_RES1	((3 << 4) | (1 << 11) | (1 << 16) | (1 << 18)
> 	\
> >  			| (3 << 22) | (3 << 28))
> >
> >
> 
> --
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE Corporate
> Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/AM5PR0402MB275665257ADDAFEAE4B42B8688450%40AM5PR0402MB2756.eurprd04.prod.outlook.com.
