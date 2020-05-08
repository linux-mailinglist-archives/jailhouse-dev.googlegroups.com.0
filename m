Return-Path: <jailhouse-dev+bncBDEN32754MOBBW432P2QKGQEWL2T5SA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33b.google.com (mail-wm1-x33b.google.com [IPv6:2a00:1450:4864:20::33b])
	by mail.lfdr.de (Postfix) with ESMTPS id 89CE11CA167
	for <lists+jailhouse-dev@lfdr.de>; Fri,  8 May 2020 05:11:24 +0200 (CEST)
Received: by mail-wm1-x33b.google.com with SMTP id o26sf3445979wmh.1
        for <lists+jailhouse-dev@lfdr.de>; Thu, 07 May 2020 20:11:24 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1588907484; cv=pass;
        d=google.com; s=arc-20160816;
        b=GZAIEbiS1AZeeTikdhFwFQTlJcOQMPgkW4h4GByauCDPyHg6xlHgasRDR3xTlp9Ylb
         nv/gRD9T2S2Z87ldGs3jQGKMn5CyGqyU9Fkmz6yIY4o0M318rFVxUJkoOlxxcMISa84i
         r+U9mCx8yc9nhfXsnF2QE1RWkW/IKXYuFUujmX5TfQl3nLCtuPNWgqRvuW5MmHQuUX2c
         AqgeBpbmYPrznz/+jX7etNzvZ0eAFPFbhc4jTc8e2eqXz9mj1AKQBiCqDUI7G1POXUyp
         5f4TzKdUscpPBzF7ATzM2BuzS0uj7xuqWKhU7GuPJPcISPBPoF7V9kNAWJEE0ehNPhVZ
         /7hA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from:sender:dkim-signature;
        bh=B/ipXBOdYS83/hbnVae0wXjzfRe9r+r45UzhPMd9o9E=;
        b=EPPe6edJVTpgHjmnxpcbbts9NwSfDwhnLm0EPYnJp8AbeM3iPrVQ/TGMDlFgMn9F5x
         slYhsbyxbyyKPOlFLgwQVxS/NVTRTLgNuQa6O5YE6vRhRF3/T/Sjrjw/0gy0u/GV9qDG
         axUEjMhoktemPm/n6k0dRnsi88jbPiXXRhY2CBMOohCeVihK5wDKAuV4u9qHzxMDGAL1
         qJN/fgqNwa8QJIG8LZRaCkhgupOA1jSwGfKBfwlrdC+Tnh4LFE2WaVfItgc4gcRbLgPG
         7WqKPum8ec+g7COeOQb01ns4BQTgk6+f1BPj1LFn/VwD2tnDgj51K2xbgwJCv5rft2JO
         kU1A==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=m+TRdjhH;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.0.52 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=B/ipXBOdYS83/hbnVae0wXjzfRe9r+r45UzhPMd9o9E=;
        b=qtLZszjEaTMnt9Ta6jLgq1IFcoHLIFzIvWQ7aYymElS1zG8+tB39V1To8fBK7m4Qdv
         n5bVjhSBCBES7Tk10xb7iv9chO0q7CiGd9oB0ylMrx94qdr28zu/Eul0y9lfVgfxuSIW
         jr1h9BTMqOXdegPUN+7QBzbGpXlEOR5PQph25ZEJtgcdRq+eYF5ylLfqn6CmWQ6L45H9
         aE52xcd0f7UrWrh1YAGVoejYA3ET/shMcMZ2pRpc/XNRI0rp4Y0lT2zAtfxFeH9ndE9t
         MahQUtNUcgAW1hZb8VURWNQdjdhwEy2wDM10u1aBGL12p871hFVoj9YIvlEXuw0pX3Mg
         4I4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:content-transfer-encoding:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=B/ipXBOdYS83/hbnVae0wXjzfRe9r+r45UzhPMd9o9E=;
        b=L9E6ZykcGKUTstPLo9hTFstJsImCXc9sOd8KDwapRtNXrEiYqtHi6RVqfCok1H23sJ
         7PXF+i4p1suBPGqC9wf9QK9tmA3MV0uQa7zgItO4HRzEwZkSRWpF+nqOF3BjLvek0Mls
         9GjfIc1VWfvXuoyz5HHLLVfc/BTRUTfWrmR7YPRN411sEIQx21oVS9/mA9w01iYUV9wN
         Ng4mbu6zoCbdCQ/Fc7Od6ReBhUjKuRS95ELLQ0l7ZmYP8cmTMbbtaZ8vbXoA++uM8bK4
         S/bfOUPAzKAFgp0iYSsO6CWc4ioJJul7chEZnMDzevkhtizZ4EQKm+lOKsDgoDkzFg2u
         K1HA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PuZIWqTKkIHGhd537VG+6pARe/8rbG0bmze1H1FA5oOMTFCTf0qc
	asrtGp0K68GH/7P+MKoGmEA=
X-Google-Smtp-Source: APiQypKAgM2uk0fnUbmlO6JQm+syRnkawYbp9J195KkVv1G1dCIofi0gatH7HhKutGjgdacE5qqoWg==
X-Received: by 2002:a1c:6a0b:: with SMTP id f11mr13453028wmc.123.1588907484087;
        Thu, 07 May 2020 20:11:24 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:fa52:: with SMTP id y18ls54327wrr.9.gmail; Thu, 07 May
 2020 20:11:23 -0700 (PDT)
X-Received: by 2002:a5d:5230:: with SMTP id i16mr302134wra.71.1588907483281;
        Thu, 07 May 2020 20:11:23 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1588907483; cv=pass;
        d=google.com; s=arc-20160816;
        b=nm5wRHSBKBfbOIMqtgdXv2RgsyAdEyCjnkwQ4/UQchpHvUYFd80Q/EqafhH7Luakw2
         72GpSfP6rzZekbBTpC7NuqLIbn23JRgmNpluoLX8kMCZ63FJutDR8v4fOb4jnBfFM49D
         cOBylcaoHgFa/SPNI0NfKsSqYbL2xBaankurrak2C0drlEn7/fkRY/GlwP/a2Z0z06V6
         Nyf0hjdBhW6JCku6CLwt0tAEa8fwd4gwkU2gIBHykAZHLRAr1owSPq80uoUTxG94ASqo
         KH22Wi5boa1bG96FfRe3vYmAl1Yh36/qYJny78AW4hpFywXZppjfdbgcabbjwP7Ub5Zw
         ZJFA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature;
        bh=Vp4nhMBKjCK2BdUsvr4efqb2bM8D/rHRJAbYY54iTh0=;
        b=eAFOQhYiToFTaBiP72AFaikFzMM+YtuoyqHYzRV0bSPiPFVhA4qHJHYsa6zY9pZC6j
         TYy+DhyL1oop0bUCnEjwgmAfPNYWqz6kSi4IjMh/fuVtXlMKOoseSGqNVrD8X9V/jn2u
         FT+k2+fwCe/P5Xk7NNL8cnS+ZmKyDlCJ2LHNiT1OppN+T0PD6Sz92rCpCM3oB6TVBWJ5
         n0/XxFjHP0r1c1zG9n+tJ4RG1SMZch7su5oFAkTcf08UUSSAWF3Am9s7sT5gqODxd4qO
         IhzUqDVsSeUaKgjOOPI4qDRbNohALNXna3NIwZqW4Y/7Us2govC0b93zvCBcx5i6rftp
         x/DA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=m+TRdjhH;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.0.52 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (mail-eopbgr00052.outbound.protection.outlook.com. [40.107.0.52])
        by gmr-mx.google.com with ESMTPS id q17si530155wmg.1.2020.05.07.20.11.23
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 07 May 2020 20:11:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of alice.guo@nxp.com designates 40.107.0.52 as permitted sender) client-ip=40.107.0.52;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lnM8HJZf3nTn3UpwSIt9TjM43t8zBLQS9TC+KkJGMNd1334x9otzIIvS66oNq6AZ9duA6MQBAzkEJHbQBrIcibo2OL3GahIOoDLnbF9joE3ushS+KvG9BjFNARLMyPChstAiz1z0hRmJN35Oy4YKjkQAg6jBYGBpFYDlG16LZcoxUxOnuYXnxz1HvXMteOeNwGtkPA3HT2FrifKkV819l2fglqMqGYW6xB5QCWIf7eArj1ibse1PPQavXrUY9Y92qEP/kE+a24qW73bE57bf8aWFGk6SCNe3RWWh0oYzolhaPQGOyo8iVw4agr7HjUwNHH1HgVRf3RIwve/os47NoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vp4nhMBKjCK2BdUsvr4efqb2bM8D/rHRJAbYY54iTh0=;
 b=NhhMIVWuosbUkwor6NSwedmdzX8lp4VBeVb/tOkwQophpmc7gcvNOPCTJMmbS2JNIdBOQ1iHgC3r4rXvtUYRE6+LH7WwCQ/Vg+J1IC3ZHWBNzO5nzz06+jkZMMvn4R2qlBZs7DUMATYQ2MaxrG2iDtIGBsYg9uVtLP+1H/JPykAw+cjm6qmaAufvCmQ7YQHFiQPKs+6m/h8UEbtnl76pBkPWqNqsfKwkFxQyrICf4PGr3V3JY2NZjvgyClKFybXCvGRcl3ehsm8xbo2iH++MATp8ucjBLyeu5iMRogbdEWvJ9SWA00y41k6iM/RWtGDwSgKzcFNgkXqSt/q0RXr46A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com (2603:10a6:10:127::9)
 by DB8PR04MB6684.eurprd04.prod.outlook.com (2603:10a6:10:105::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.26; Fri, 8 May
 2020 03:11:21 +0000
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::780f:6f6c:db24:2418]) by DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::780f:6f6c:db24:2418%9]) with mapi id 15.20.2979.028; Fri, 8 May 2020
 03:11:21 +0000
From: Alice Guo <alice.guo@nxp.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
Subject: RE: [EXT] Re: [PATCH V1 1/2] arm64: introduce smmu-v2 support
Thread-Topic: [EXT] Re: [PATCH V1 1/2] arm64: introduce smmu-v2 support
Thread-Index: AQHWHg52u7pj+8P85Eaaxdc3/dpqN6iP/WkAgA2JVIA=
Date: Fri, 8 May 2020 03:11:21 +0000
Message-ID: <DB8PR04MB706502222CBEDCC8E97E8877E2A20@DB8PR04MB7065.eurprd04.prod.outlook.com>
References: <1588154521-2897-1-git-send-email-peng.fan@nxp.com>
 <9ab9ab83-186b-5f7e-a44b-921c3d690bfb@siemens.com>
In-Reply-To: <9ab9ab83-186b-5f7e-a44b-921c3d690bfb@siemens.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5f041368-e90b-40ae-bee6-08d7f2fd7bee
x-ms-traffictypediagnostic: DB8PR04MB6684:
x-microsoft-antispam-prvs: <DB8PR04MB6684871794BE0F9107DD13A4E2A20@DB8PR04MB6684.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 039735BC4E
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yoXJsBVjUtq6XDDNEx5sBU+CkHh9Z57BND0CDWhehpdq51ofWhxTdNZeq2p8a5k90XHBfFH7BVMutwrfWrRO/9WcZ+lrT1wUlp2gGmv1XO3D9tGBqVTax8dQltRdP5e/89NZL7gYeBV3vGMsE3ExQAboQBRbz5TPMFjw2DTjw1m5nVGzJ9vaIq/RI2fheS7jcvnkPVhD2CUJVRjCdo947X9+upWsgCYLdrJd+hGImh6lwqzphyBGfPsyILzV2L3Y0FgtOVNtl5agRPHoNPZqIKrcqrxVLuBf0lEcsJ6CnooBrrA/LaG8hm4sMpMmhJQQ/I6kzC+KgSis9fg256P05xhsUjVvWxTUf5UrYpMoJGjncqovBfPhJkWj1dlZSRpLv2Ic18rn164ufK5UrsmiOBXiSAvOxyuCga3PvkoVQ5uYW0Kmvoib6NcV3Njh+2lDtdIHRvULjkgR/650hJ0f4HlUO6SBpu4NocblbXkfQJ2BzRWwrKQr0vWKio94TBkxXE+MnttVl+JgnCKkKKTyd2DVbrDcKg6Zfabo9od30pA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB7065.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(346002)(376002)(396003)(366004)(136003)(33430700001)(53546011)(7696005)(33656002)(316002)(478600001)(110136005)(30864003)(6506007)(71200400001)(33440700001)(66556008)(66946007)(76116006)(66446008)(186003)(8936002)(52536014)(2906002)(66476007)(55016002)(64756008)(8676002)(83320400001)(83280400001)(83310400001)(83290400001)(83300400001)(44832011)(86362001)(9686003)(5660300002)(26005)(2004002)(579004)(559001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: aGutRoa+ZJgtlfrGD2j9mAIhW6/dGWlNKs7EmnVhRQYgdHskp6Kfu/F0X+v1HC6znKwhisbV2tQwjxpjF0kpjX6CuDxLvg56JCxZ/I3aAF1wz8wiON6x1yxnkn+hTeah2F7ycAzUgcRarsNEMaixfgMJVOfhpsKpgkRm82YUC2vvj8NIvRQnfS+YN0bPRAAL47SKmmbEKuGnykOUnmXtSPYiC9nXwYxzhv9rVgH4WaoY5TGcY4n6tSPcgmh3iJOJanrEoJhAGHSsOJJuZSgnoyXtIzc/t9Gzrn99FwRF6HTY0jfEVcgcSXWp+dRznK1R1gu0oLz9SpnAZO+X4B0hoIY6BC4u/x2LVyEeD7A+7W0Tz3qOGMATxGTtbP4Z8fcRKtin0Hi0XDkVLvHikGR5CIPFohR3p+vTOVXkzTtq5jkeuuAsKpILcdHHXu/o5SK3kniJ7spZr2ondNNYqqBSr80cuW1oud1+DwuV8SglxL0=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f041368-e90b-40ae-bee6-08d7f2fd7bee
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2020 03:11:21.5200
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AHRnYzWYuP7pBqDedGFzoKg1mBRaemghRyv+WT5nghdzWTFHE3TQNRcUnl69/SpUtKrpGk0kiG3bYNSmVtEhFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6684
X-Original-Sender: alice.guo@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=m+TRdjhH;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of alice.guo@nxp.com
 designates 40.107.0.52 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
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

Hi Jan, all

do you have any general comments about this smmu v2 patch?

Alice

-----Original Message-----
From: Jan Kiszka <jan.kiszka@siemens.com>=20
Sent: 2020=E5=B9=B44=E6=9C=8829=E6=97=A5 19:53
To: Peng Fan <peng.fan@nxp.com>; Alice Guo <alice.guo@nxp.com>; jailhouse-d=
ev@googlegroups.com
Subject: [EXT] Re: [PATCH V1 1/2] arm64: introduce smmu-v2 support

Caution: EXT Email

On 29.04.20 12:02, peng.fan@nxp.com wrote:
> From: Alice Guo <alice.guo@nxp.com>
>
> Support smmu-v2 mmu500, add sid master support, only support stage2=20
> translation.
>
> Signed-off-by: Alice Guo <alice.guo@nxp.com>
> ---
>   hypervisor/arch/arm64/Kbuild          |   1 +
>   hypervisor/arch/arm64/arm-smmu-regs.h | 220 ++++++
>   hypervisor/arch/arm64/smmu.c          | 926 ++++++++++++++++++++++++++
>   include/jailhouse/cell-config.h       |  15 +
>   include/jailhouse/sizes.h             |  47 ++
>   5 files changed, 1209 insertions(+)
>   create mode 100644 hypervisor/arch/arm64/arm-smmu-regs.h
>   create mode 100644 hypervisor/arch/arm64/smmu.c
>   create mode 100644 include/jailhouse/sizes.h
>
> diff --git a/hypervisor/arch/arm64/Kbuild=20
> b/hypervisor/arch/arm64/Kbuild index c34b0f32..e87c6e53 100644
> --- a/hypervisor/arch/arm64/Kbuild
> +++ b/hypervisor/arch/arm64/Kbuild
> @@ -22,3 +22,4 @@ always :=3D lib.a
>   lib-y :=3D $(common-objs-y)
>   lib-y +=3D entry.o setup.o control.o mmio.o paging.o caches.o traps.o
>   lib-y +=3D iommu.o smmu-v3.o ti-pvu.o
> +lib-y +=3D smmu.o
> diff --git a/hypervisor/arch/arm64/arm-smmu-regs.h=20
> b/hypervisor/arch/arm64/arm-smmu-regs.h
> new file mode 100644
> index 00000000..a1226e4a
> --- /dev/null
> +++ b/hypervisor/arch/arm64/arm-smmu-regs.h
> @@ -0,0 +1,220 @@
> +/*
> + * IOMMU API for ARM architected SMMU implementations.
> + *
> + * This program is free software; you can redistribute it and/or=20
> +modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, write to the Free Software
> + * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307,=
 USA.
> + *
> + * Copyright (C) 2013 ARM Limited
> + *
> + * Author: Will Deacon <will.deacon@arm.com>  */
> +
> +#ifndef _ARM_SMMU_REGS_H
> +#define _ARM_SMMU_REGS_H
> +
> +/* Configuration registers */
> +#define ARM_SMMU_GR0_sCR0            0x0
> +#define sCR0_CLIENTPD                        (1 << 0)
> +#define sCR0_GFRE                    (1 << 1)
> +#define sCR0_GFIE                    (1 << 2)
> +#define sCR0_EXIDENABLE                      (1 << 3)
> +#define sCR0_GCFGFRE                 (1 << 4)
> +#define sCR0_GCFGFIE                 (1 << 5)
> +#define sCR0_USFCFG                  (1 << 10)
> +#define sCR0_VMIDPNE                 (1 << 11)
> +#define sCR0_PTM                     (1 << 12)
> +#define sCR0_FB                              (1 << 13)
> +#define sCR0_VMID16EN                        (1 << 31)
> +#define sCR0_BSU_SHIFT                       14
> +#define sCR0_BSU_MASK                        0x3
> +
> +/* Auxiliary Configuration register */
> +#define ARM_SMMU_GR0_sACR            0x10
> +
> +/* Identification registers */
> +#define ARM_SMMU_GR0_ID0             0x20
> +#define ARM_SMMU_GR0_ID1             0x24
> +#define ARM_SMMU_GR0_ID2             0x28
> +#define ARM_SMMU_GR0_ID3             0x2c
> +#define ARM_SMMU_GR0_ID4             0x30
> +#define ARM_SMMU_GR0_ID5             0x34
> +#define ARM_SMMU_GR0_ID6             0x38
> +#define ARM_SMMU_GR0_ID7             0x3c
> +#define ARM_SMMU_GR0_sGFSR           0x48
> +#define ARM_SMMU_GR0_sGFSYNR0                0x50
> +#define ARM_SMMU_GR0_sGFSYNR1                0x54
> +#define ARM_SMMU_GR0_sGFSYNR2                0x58
> +
> +#define ID0_S1TS                     (1 << 30)
> +#define ID0_S2TS                     (1 << 29)
> +#define ID0_NTS                              (1 << 28)
> +#define ID0_SMS                              (1 << 27)
> +#define ID0_ATOSNS                   (1 << 26)
> +#define ID0_PTFS_NO_AARCH32          (1 << 25)
> +#define ID0_PTFS_NO_AARCH32S         (1 << 24)
> +#define ID0_CTTW                     (1 << 14)
> +#define ID0_NUMIRPT_SHIFT            16
> +#define ID0_NUMIRPT_MASK             0xff
> +#define ID0_NUMSIDB_SHIFT            9
> +#define ID0_NUMSIDB_MASK             0xf
> +#define ID0_EXIDS                    (1 << 8)
> +#define ID0_NUMSMRG_SHIFT            0
> +#define ID0_NUMSMRG_MASK             0xff
> +
> +#define ID1_PAGESIZE                 (1 << 31)
> +#define ID1_NUMPAGENDXB_SHIFT                28
> +#define ID1_NUMPAGENDXB_MASK         7
> +#define ID1_NUMS2CB_SHIFT            16
> +#define ID1_NUMS2CB_MASK             0xff
> +#define ID1_NUMCB_SHIFT                      0
> +#define ID1_NUMCB_MASK                       0xff
> +
> +#define ID2_OAS_SHIFT                        4
> +#define ID2_OAS_MASK                 0xf
> +#define ID2_IAS_SHIFT                        0
> +#define ID2_IAS_MASK                 0xf
> +#define ID2_UBS_SHIFT                        8
> +#define ID2_UBS_MASK                 0xf
> +#define ID2_PTFS_4K                  (1 << 12)
> +#define ID2_PTFS_16K                 (1 << 13)
> +#define ID2_PTFS_64K                 (1 << 14)
> +#define ID2_VMID16                   (1 << 15)
> +
> +#define ID7_MAJOR_SHIFT                      4
> +#define ID7_MAJOR_MASK                       0xf
> +
> +/* Global TLB invalidation */
> +#define ARM_SMMU_GR0_TLBIVMID                0x64
> +#define ARM_SMMU_GR0_TLBIALLNSNH     0x68
> +#define ARM_SMMU_GR0_TLBIALLH                0x6c
> +#define ARM_SMMU_GR0_sTLBGSYNC               0x70
> +#define ARM_SMMU_GR0_sTLBGSTATUS     0x74
> +#define sTLBGSTATUS_GSACTIVE         (1 << 0)
> +
> +/* Stream mapping registers */
> +#define ARM_SMMU_GR0_SMR(n)          (0x800 + ((n) << 2))
> +#define SMR_VALID                    (1 << 31)
> +#define SMR_MASK_SHIFT                       16
> +#define SMR_ID_SHIFT                 0
> +
> +#define ARM_SMMU_GR0_S2CR(n)         (0xc00 + ((n) << 2))
> +#define S2CR_CBNDX_SHIFT             0
> +#define S2CR_CBNDX_MASK                      0xff
> +#define S2CR_EXIDVALID                       (1 << 10)
> +#define S2CR_TYPE_SHIFT                      16
> +#define S2CR_TYPE_MASK                       0x3
> +enum arm_smmu_s2cr_type {
> +     S2CR_TYPE_TRANS,
> +     S2CR_TYPE_BYPASS,
> +     S2CR_TYPE_FAULT,
> +};
> +
> +#define S2CR_PRIVCFG_SHIFT           24
> +#define S2CR_PRIVCFG_MASK            0x3
> +enum arm_smmu_s2cr_privcfg {
> +     S2CR_PRIVCFG_DEFAULT,
> +     S2CR_PRIVCFG_DIPAN,
> +     S2CR_PRIVCFG_UNPRIV,
> +     S2CR_PRIVCFG_PRIV,
> +};
> +
> +/* Context bank attribute registers */
> +#define ARM_SMMU_GR1_CBAR(n)         (0x0 + ((n) << 2))
> +#define CBAR_VMID_SHIFT                      0
> +#define CBAR_VMID_MASK                       0xff
> +#define CBAR_S1_BPSHCFG_SHIFT                8
> +#define CBAR_S1_BPSHCFG_MASK         3
> +#define CBAR_S1_BPSHCFG_NSH          3
> +#define CBAR_S1_MEMATTR_SHIFT                12
> +#define CBAR_S1_MEMATTR_MASK         0xf
> +#define CBAR_S1_MEMATTR_WB           0xf
> +#define CBAR_TYPE_SHIFT                      16
> +#define CBAR_TYPE_MASK                       0x3
> +#define CBAR_TYPE_S2_TRANS           (0 << CBAR_TYPE_SHIFT)
> +#define CBAR_TYPE_S1_TRANS_S2_BYPASS (1 << CBAR_TYPE_SHIFT) #define=20
> +CBAR_TYPE_S1_TRANS_S2_FAULT  (2 << CBAR_TYPE_SHIFT) #define=20
> +CBAR_TYPE_S1_TRANS_S2_TRANS  (3 << CBAR_TYPE_SHIFT)
> +#define CBAR_IRPTNDX_SHIFT           24
> +#define CBAR_IRPTNDX_MASK            0xff
> +
> +#define ARM_SMMU_GR1_CBA2R(n)                (0x800 + ((n) << 2))
> +#define CBA2R_RW64_32BIT             (0 << 0)
> +#define CBA2R_RW64_64BIT             (1 << 0)
> +#define CBA2R_VMID_SHIFT             16
> +#define CBA2R_VMID_MASK                      0xffff
> +
> +#define ARM_SMMU_CB_SCTLR            0x0
> +#define ARM_SMMU_CB_ACTLR            0x4
> +#define ARM_SMMU_CB_RESUME           0x8
> +#define ARM_SMMU_CB_TTBCR2           0x10
> +#define ARM_SMMU_CB_TTBR0            0x20
> +#define ARM_SMMU_CB_TTBR1            0x28
> +#define ARM_SMMU_CB_TTBCR            0x30
> +#define ARM_SMMU_CB_CONTEXTIDR               0x34
> +#define ARM_SMMU_CB_S1_MAIR0         0x38
> +#define ARM_SMMU_CB_S1_MAIR1         0x3c
> +#define ARM_SMMU_CB_PAR                      0x50
> +#define ARM_SMMU_CB_FSR                      0x58
> +#define ARM_SMMU_CB_FAR                      0x60
> +#define ARM_SMMU_CB_FSYNR0           0x68
> +#define ARM_SMMU_CB_S1_TLBIVA                0x600
> +#define ARM_SMMU_CB_S1_TLBIASID              0x610
> +#define ARM_SMMU_CB_S1_TLBIVAL               0x620
> +#define ARM_SMMU_CB_S2_TLBIIPAS2     0x630
> +#define ARM_SMMU_CB_S2_TLBIIPAS2L    0x638
> +#define ARM_SMMU_CB_TLBSYNC          0x7f0
> +#define ARM_SMMU_CB_TLBSTATUS                0x7f4
> +#define ARM_SMMU_CB_ATS1PR           0x800
> +#define ARM_SMMU_CB_ATSR             0x8f0
> +
> +#define SCTLR_S1_ASIDPNE             (1 << 12)
> +#define SCTLR_CFCFG                  (1 << 7)
> +#define SCTLR_CFIE                   (1 << 6)
> +#define SCTLR_CFRE                   (1 << 5)
> +#define SCTLR_E                              (1 << 4)
> +#define SCTLR_AFE                    (1 << 2)
> +#define SCTLR_TRE                    (1 << 1)
> +#define SCTLR_M                              (1 << 0)
> +
> +#define CB_PAR_F                     (1 << 0)
> +
> +#define ATSR_ACTIVE                  (1 << 0)
> +
> +#define RESUME_RETRY                 (0 << 0)
> +#define RESUME_TERMINATE             (1 << 0)
> +
> +#define TTBCR2_SEP_SHIFT             15
> +#define TTBCR2_SEP_UPSTREAM          (0x7 << TTBCR2_SEP_SHIFT)
> +#define TTBCR2_AS                    (1 << 4)
> +
> +#define TTBRn_ASID_SHIFT             48
> +
> +#define FSR_MULTI                    (1 << 31)
> +#define FSR_SS                               (1 << 30)
> +#define FSR_UUT                              (1 << 8)
> +#define FSR_ASF                              (1 << 7)
> +#define FSR_TLBLKF                   (1 << 6)
> +#define FSR_TLBMCF                   (1 << 5)
> +#define FSR_EF                               (1 << 4)
> +#define FSR_PF                               (1 << 3)
> +#define FSR_AFF                              (1 << 2)
> +#define FSR_TF                               (1 << 1)
> +
> +#define FSR_IGN                              (FSR_AFF | FSR_ASF | \
> +                                      FSR_TLBMCF | FSR_TLBLKF)
> +#define FSR_FAULT                    (FSR_MULTI | FSR_SS | FSR_UUT | \
> +                                      FSR_EF | FSR_PF | FSR_TF |=20
> +FSR_IGN)
> +
> +#define FSYNR0_WNR                   (1 << 4)
> +
> +#endif /* _ARM_SMMU_REGS_H */
> diff --git a/hypervisor/arch/arm64/smmu.c=20
> b/hypervisor/arch/arm64/smmu.c new file mode 100644 index=20
> 00000000..ea1b4c1e
> --- /dev/null
> +++ b/hypervisor/arch/arm64/smmu.c
> @@ -0,0 +1,926 @@
> +/*
> + * Jailhouse, a Linux-based partitioning hypervisor
> + *
> + * Copyright 2018-2020 NXP
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2. =20
> +See
> + * the COPYING file in the top-level directory.
> + *
> + * Modified from Linux smmu.c
> + */
> +
> +#include <jailhouse/control.h>
> +#include <jailhouse/ivshmem.h>
> +#include <jailhouse/mmio.h>
> +#include <jailhouse/paging.h>
> +#include <jailhouse/pci.h>
> +#include <jailhouse/printk.h>
> +#include <jailhouse/sizes.h>
> +#include <jailhouse/string.h>
> +#include <jailhouse/unit.h>
> +#include <asm/spinlock.h>
> +#include <jailhouse/cell-config.h>
> +
> +#include "arm-smmu-regs.h"
> +
> +#define ARM_32_LPAE_TCR_EAE          (1 << 31)
> +#define ARM_64_LPAE_S2_TCR_RES1              (1 << 31)
> +
> +#define ARM_LPAE_TCR_EPD1            (1 << 23)
> +
> +#define ARM_LPAE_TCR_TG0_4K          (0 << 14)
> +#define ARM_LPAE_TCR_TG0_64K         (1 << 14)
> +#define ARM_LPAE_TCR_TG0_16K         (2 << 14)
> +
> +#define ARM_LPAE_TCR_SH0_SHIFT               12
> +#define ARM_LPAE_TCR_SH0_MASK                0x3
> +#define ARM_LPAE_TCR_SH_NS           0
> +#define ARM_LPAE_TCR_SH_OS           2
> +#define ARM_LPAE_TCR_SH_IS           3
> +
> +#define ARM_LPAE_TCR_ORGN0_SHIFT     10
> +#define ARM_LPAE_TCR_IRGN0_SHIFT     8
> +#define ARM_LPAE_TCR_RGN_MASK                0x3
> +#define ARM_LPAE_TCR_RGN_NC          0
> +#define ARM_LPAE_TCR_RGN_WBWA                1
> +#define ARM_LPAE_TCR_RGN_WT          2
> +#define ARM_LPAE_TCR_RGN_WB          3
> +
> +#define ARM_LPAE_TCR_SL0_SHIFT               6
> +#define ARM_LPAE_TCR_SL0_MASK                0x3
> +#define ARM_LPAE_TCR_SL0_LVL_2               0
> +#define ARM_LPAE_TCR_SL0_LVL_1               1
> +
> +#define ARM_LPAE_TCR_T0SZ_SHIFT              0
> +#define ARM_LPAE_TCR_SZ_MASK         0xf
> +
> +#define ARM_LPAE_TCR_PS_SHIFT                16
> +#define ARM_LPAE_TCR_PS_MASK         0x7
> +
> +#define ARM_LPAE_TCR_IPS_SHIFT               32
> +#define ARM_LPAE_TCR_IPS_MASK                0x7
> +
> +#define ARM_LPAE_TCR_PS_32_BIT               0x0ULL
> +#define ARM_LPAE_TCR_PS_36_BIT               0x1ULL
> +#define ARM_LPAE_TCR_PS_40_BIT               0x2ULL
> +#define ARM_LPAE_TCR_PS_42_BIT               0x3ULL
> +#define ARM_LPAE_TCR_PS_44_BIT               0x4ULL
> +#define ARM_LPAE_TCR_PS_48_BIT               0x5ULL
> +#define ARM_LPAE_TCR_PS_52_BIT               0x6ULL
> +#define ARM_MMU500_ACTLR_CPRE                (1 << 1)
> +
> +#define ARM_MMU500_ACR_CACHE_LOCK    (1 << 26)
> +#define ARM_MMU500_ACR_S2CRB_TLBEN   (1 << 10)
> +#define ARM_MMU500_ACR_SMTNMB_TLBEN  (1 << 8)
> +
> +#define TLB_LOOP_TIMEOUT             1000000 /* 1s! */
> +#define TLB_SPIN_COUNT                       10
> +
> +/* Maximum number of context banks per SMMU */
> +#define ARM_SMMU_MAX_CBS             128
> +
> +/* SMMU global address space */
> +#define ARM_SMMU_GR0(smmu)           ((smmu)->base)
> +#define ARM_SMMU_GR1(smmu)           ((smmu)->base + (1 << (smmu)->pgshi=
ft))
> +
> +/*
> + * SMMU global address space with conditional offset to access secure
> + * aliases of non-secure registers (e.g. nsCR0: 0x400, nsGFSR: 0x448,
> + * nsGFSYNR0: 0x450)
> + */
> +#define ARM_SMMU_GR0_NS(smmu)                                           =
     \
> +     ((smmu)->base +                                                 \
> +             ((smmu->options & ARM_SMMU_OPT_SECURE_CFG_ACCESS)       \
> +                     ? 0x400 : 0))
> +
> +/* Translation context bank */
> +#define ARM_SMMU_CB(smmu, n) ((smmu)->cb_base + ((n) <<=20
> +(smmu)->pgshift))
> +
> +#define MSI_IOVA_BASE                        0x8000000
> +#define MSI_IOVA_LENGTH                      0x100000
> +
> +struct arm_smmu_s2cr {
> +     enum arm_smmu_s2cr_type         type;
> +     enum arm_smmu_s2cr_privcfg      privcfg;
> +     u8                              cbndx;
> +};
> +
> +struct arm_smmu_smr {
> +     u16                             mask;
> +     u16                             id;
> +     bool                            valid;
> +};
> +
> +struct arm_smmu_cb {
> +     u64                             ttbr[2];
> +     u32                             tcr[2];
> +     u32                             mair[2];
> +     struct arm_smmu_cfg             *cfg;
> +};
> +
> +struct arm_smmu_device {
> +     void    *base;
> +     void    *cb_base;
> +     u32     num_masters;
> +     unsigned long                   pgshift;
> +
> +#define ARM_SMMU_FEAT_COHERENT_WALK  (1 << 0)
> +#define ARM_SMMU_FEAT_STREAM_MATCH   (1 << 1)
> +#define ARM_SMMU_FEAT_TRANS_S1               (1 << 2)
> +#define ARM_SMMU_FEAT_TRANS_S2               (1 << 3)
> +#define ARM_SMMU_FEAT_TRANS_NESTED   (1 << 4)
> +#define ARM_SMMU_FEAT_TRANS_OPS              (1 << 5)
> +#define ARM_SMMU_FEAT_VMID16         (1 << 6)
> +#define ARM_SMMU_FEAT_FMT_AARCH64_4K (1 << 7)
> +#define ARM_SMMU_FEAT_FMT_AARCH64_16K        (1 << 8)
> +#define ARM_SMMU_FEAT_FMT_AARCH64_64K        (1 << 9)
> +#define ARM_SMMU_FEAT_FMT_AARCH32_L  (1 << 10) #define=20
> +ARM_SMMU_FEAT_FMT_AARCH32_S  (1 << 11)
> +#define ARM_SMMU_FEAT_EXIDS          (1 << 12)
> +     u32                             features;
> +
> +#define ARM_SMMU_OPT_SECURE_CFG_ACCESS (1 << 0)
> +     u32                             options;
> +     enum arm_smmu_arch_version      version;
> +     enum arm_smmu_implementation    model;
> +
> +     u32                             num_context_banks;
> +     u32                             num_s2_context_banks;
> +     struct arm_smmu_cb              *cbs;
> +
> +     u32                             num_mapping_groups;
> +     u16                             streamid_mask;
> +     u16                             smr_mask_mask;
> +     struct arm_smmu_smr             *smrs;
> +     struct arm_smmu_s2cr            *s2crs;
> +     struct arm_smmu_cfg             *cfgs;
> +
> +     unsigned long                   va_size;
> +     unsigned long                   ipa_size;
> +     unsigned long                   pa_size;
> +     unsigned long                   pgsize_bitmap;
> +
> +     u32                             num_global_irqs;
> +     u32                             num_context_irqs;
> +     unsigned int                    *irqs;
> +
> +     spinlock_t                      global_sync_lock;
> +};
> +
> +enum arm_smmu_context_fmt {
> +     ARM_SMMU_CTX_FMT_NONE,
> +     ARM_SMMU_CTX_FMT_AARCH64,
> +     ARM_SMMU_CTX_FMT_AARCH32_L,
> +     ARM_SMMU_CTX_FMT_AARCH32_S,
> +};
> +
> +struct arm_smmu_cfg {
> +     u8                              cbndx;
> +     u8                              irptndx;
> +     union {
> +             u16                     asid;
> +             u16                     vmid;
> +     };
> +     u32                             cbar;
> +     enum arm_smmu_context_fmt       fmt;
> +};
> +#define INVALID_IRPTNDX                      0xff
> +
> +enum arm_smmu_domain_stage {
> +     ARM_SMMU_DOMAIN_S1 =3D 0,
> +     ARM_SMMU_DOMAIN_S2,
> +     ARM_SMMU_DOMAIN_NESTED,
> +     ARM_SMMU_DOMAIN_BYPASS,
> +};
> +
> +#define s2cr_init_val (struct arm_smmu_s2cr){        \
> +     .type =3D S2CR_TYPE_BYPASS,               \
> +}
> +
> +
> +static struct arm_smmu_device smmu_device; static unsigned long=20
> +pgsize_bitmap =3D -1; static u16 arm_sid_mask;
> +
> +static void arm_smmu_write_smr(struct arm_smmu_device *smmu, int idx)=20
> +{
> +     struct arm_smmu_smr *smr =3D smmu->smrs + idx;
> +     u32 reg =3D smr->id << SMR_ID_SHIFT | smr->mask << SMR_MASK_SHIFT;
> +
> +     if (!(smmu->features & ARM_SMMU_FEAT_EXIDS) && smr->valid)
> +             reg |=3D SMR_VALID;
> +     mmio_write32(ARM_SMMU_GR0(smmu) + ARM_SMMU_GR0_SMR(idx), reg); }
> +
> +static void arm_smmu_write_s2cr(struct arm_smmu_device *smmu, int=20
> +idx) {
> +     struct arm_smmu_s2cr *s2cr =3D smmu->s2crs + idx;
> +     u32 reg =3D (s2cr->type & S2CR_TYPE_MASK) << S2CR_TYPE_SHIFT |
> +               (s2cr->cbndx & S2CR_CBNDX_MASK) << S2CR_CBNDX_SHIFT |
> +               (s2cr->privcfg & S2CR_PRIVCFG_MASK) <<=20
> +S2CR_PRIVCFG_SHIFT;
> +
> +     if (smmu->features & ARM_SMMU_FEAT_EXIDS && smmu->smrs &&
> +         smmu->smrs[idx].valid)
> +             reg |=3D S2CR_EXIDVALID;
> +     mmio_write32(ARM_SMMU_GR0(smmu) + ARM_SMMU_GR0_S2CR(idx), reg);=20
> +}
> +
> +static void arm_smmu_write_sme(struct arm_smmu_device *smmu, int idx)=20
> +{
> +     if (smmu->smrs)
> +             arm_smmu_write_smr(smmu, idx);
> +
> +     arm_smmu_write_s2cr(smmu, idx);
> +}
> +
> +/* Wait for any pending TLB invalidations to complete */ static void=20
> +__arm_smmu_tlb_sync(struct arm_smmu_device *smmu,
> +                             void *sync, void *status) {
> +     unsigned int spin_cnt, delay;
> +
> +     mmio_write32(sync, 0);
> +     for (delay =3D 1; delay < TLB_LOOP_TIMEOUT; delay *=3D 2) {
> +             for (spin_cnt =3D TLB_SPIN_COUNT; spin_cnt > 0; spin_cnt--)=
 {
> +                     if (!(mmio_read32(status) & sTLBGSTATUS_GSACTIVE))
> +                             return;
> +                     cpu_relax();
> +             }
> +     }
> +     printk("TLB sync timed out -- SMMU may be deadlocked\n"); }
> +
> +static void arm_smmu_tlb_sync_global(struct arm_smmu_device *smmu) {
> +     void *base =3D ARM_SMMU_GR0(smmu);
> +
> +     spin_lock(&smmu->global_sync_lock);
> +     __arm_smmu_tlb_sync(smmu, base + ARM_SMMU_GR0_sTLBGSYNC,
> +                         base + ARM_SMMU_GR0_sTLBGSTATUS);
> +     spin_unlock(&smmu->global_sync_lock);
> +}
> +
> +#define ARM_SMMU_CB_VMID(cfg)                ((cfg)->cbndx + 1)
> +static void arm_smmu_init_context_bank(struct arm_smmu_device *smmu,
> +                                    struct arm_smmu_cfg *cfg,
> +                                    struct cell *cell) {
> +     struct arm_smmu_cb *cb =3D &smmu->cbs[cfg->cbndx];
> +     struct paging_structures *pg_structs;
> +     unsigned long cell_table;
> +     u32 reg;
> +
> +     cb->cfg =3D cfg;
> +
> +     /* VTCR */
> +     reg =3D ARM_64_LPAE_S2_TCR_RES1 |
> +          (ARM_LPAE_TCR_SH_IS << ARM_LPAE_TCR_SH0_SHIFT) |
> +          (ARM_LPAE_TCR_RGN_WBWA << ARM_LPAE_TCR_IRGN0_SHIFT) |
> +          (ARM_LPAE_TCR_RGN_WBWA << ARM_LPAE_TCR_ORGN0_SHIFT);
> +
> +     reg |=3D (ARM_LPAE_TCR_SL0_LVL_1 << ARM_LPAE_TCR_SL0_SHIFT);
> +
> +     switch (PAGE_SIZE) {
> +     case SZ_4K:
> +             reg |=3D ARM_LPAE_TCR_TG0_4K;
> +             break;
> +     case SZ_64K:
> +             reg |=3D ARM_LPAE_TCR_TG0_64K;
> +             break;
> +     }
> +
> +     switch (smmu->pa_size) {
> +     case 32:
> +             reg |=3D (ARM_LPAE_TCR_PS_32_BIT << ARM_LPAE_TCR_PS_SHIFT);
> +             break;
> +     case 36:
> +             reg |=3D (ARM_LPAE_TCR_PS_36_BIT << ARM_LPAE_TCR_PS_SHIFT);
> +             break;
> +     case 40:
> +             reg |=3D (ARM_LPAE_TCR_PS_40_BIT << ARM_LPAE_TCR_PS_SHIFT);
> +             break;
> +     case 42:
> +             reg |=3D (ARM_LPAE_TCR_PS_42_BIT << ARM_LPAE_TCR_PS_SHIFT);
> +             break;
> +     case 44:
> +             reg |=3D (ARM_LPAE_TCR_PS_44_BIT << ARM_LPAE_TCR_PS_SHIFT);
> +             break;
> +     case 48:
> +             reg |=3D (ARM_LPAE_TCR_PS_48_BIT << ARM_LPAE_TCR_PS_SHIFT);
> +             break;
> +     case 52:
> +             reg |=3D (ARM_LPAE_TCR_PS_52_BIT << ARM_LPAE_TCR_PS_SHIFT);
> +             break;
> +     default:
> +             printk("Not supported\n");
> +             break;
> +             /* TODO */
> +             //goto out_free_data;
> +     }
> +
> +     reg |=3D (64ULL - smmu->ipa_size) << ARM_LPAE_TCR_T0SZ_SHIFT;
> +
> +     cb->tcr[0] =3D reg;
> +
> +     pg_structs =3D &cell->arch.mm;
> +     cell_table =3D paging_hvirt2phys(pg_structs->root_table);
> +     u64 vttbr =3D 0;
> +
> +     vttbr |=3D (u64)cell->config->id << VTTBR_VMID_SHIFT;
> +     vttbr |=3D (u64)(cell_table & TTBR_MASK);
> +     cb->ttbr[0] =3D vttbr;
> +}
> +
> +static void arm_smmu_write_context_bank(struct arm_smmu_device *smmu,=20
> +int idx) {
> +     u32 reg;
> +     struct arm_smmu_cb *cb =3D &smmu->cbs[idx];
> +     struct arm_smmu_cfg *cfg =3D cb->cfg;
> +     void *cb_base, *gr1_base;
> +
> +     cb_base =3D ARM_SMMU_CB(smmu, idx);
> +
> +     /* Unassigned context banks only need disabling */
> +     if (!cfg) {
> +             mmio_write32(cb_base + ARM_SMMU_CB_SCTLR, 0);
> +             return;
> +     }
> +
> +     gr1_base =3D ARM_SMMU_GR1(smmu);
> +
> +     /* CBA2R */
> +     if (smmu->version > ARM_SMMU_V1) {
> +             if (cfg->fmt =3D=3D ARM_SMMU_CTX_FMT_AARCH64)
> +                     reg =3D CBA2R_RW64_64BIT;
> +             else
> +                     reg =3D CBA2R_RW64_32BIT;
> +             /* 16-bit VMIDs live in CBA2R */
> +             if (smmu->features & ARM_SMMU_FEAT_VMID16)
> +                     reg |=3D cfg->vmid << CBA2R_VMID_SHIFT;
> +
> +             mmio_write32(gr1_base + ARM_SMMU_GR1_CBA2R(idx), reg);
> +     }
> +
> +     /* CBAR */
> +     reg =3D cfg->cbar;
> +     if (smmu->version < ARM_SMMU_V2)
> +             reg |=3D cfg->irptndx << CBAR_IRPTNDX_SHIFT;
> +
> +     /*
> +      * Use the weakest shareability/memory types, so they are
> +      * overridden by the ttbcr/pte.
> +      */
> +     if (!(smmu->features & ARM_SMMU_FEAT_VMID16)) {
> +             /* 8-bit VMIDs live in CBAR */
> +             reg |=3D cfg->vmid << CBAR_VMID_SHIFT;
> +     }
> +     mmio_write32(gr1_base + ARM_SMMU_GR1_CBAR(idx), reg);
> +
> +     /*
> +      * TTBCR
> +      * We must write this before the TTBRs, since it determines the
> +      * access behaviour of some fields (in particular, ASID[15:8]).
> +      */
> +     mmio_write32(cb_base + ARM_SMMU_CB_TTBCR, cb->tcr[0]);
> +
> +     /* TTBRs */
> +     if (cfg->fmt =3D=3D ARM_SMMU_CTX_FMT_AARCH32_S) {
> +             mmio_write32(cb_base + ARM_SMMU_CB_CONTEXTIDR, cfg->asid);
> +             mmio_write32(cb_base + ARM_SMMU_CB_TTBR0, cb->ttbr[0]);
> +             mmio_write32(cb_base + ARM_SMMU_CB_TTBR1, cb->ttbr[1]);
> +     } else {
> +             mmio_write64(cb_base + ARM_SMMU_CB_TTBR0, cb->ttbr[0]);
> +     }
> +
> +     /* SCTLR */
> +     reg =3D SCTLR_CFCFG | SCTLR_CFIE | SCTLR_CFRE | SCTLR_AFE | SCTLR_T=
RE |
> +             SCTLR_M;
> +
> +     mmio_write32(cb_base + ARM_SMMU_CB_SCTLR, reg); }
> +
> +static void arm_smmu_device_reset(struct arm_smmu_device *smmu) {
> +     void *gr0_base =3D ARM_SMMU_GR0(smmu);
> +     int i;
> +     u32 reg, major;
> +
> +     /* clear global FSR */
> +     reg =3D mmio_read32(ARM_SMMU_GR0_NS(smmu) + ARM_SMMU_GR0_sGFSR);
> +     mmio_write32(ARM_SMMU_GR0_NS(smmu) + ARM_SMMU_GR0_sGFSR, reg);
> +
> +     /*
> +      * Reset stream mapping groups: Initial values mark all SMRn as
> +      * invalid and all S2CRn as bypass unless overridden.
> +      */
> +     for (i =3D 0; i < smmu->num_mapping_groups; ++i)
> +             arm_smmu_write_sme(smmu, i);
> +
> +     if (smmu->model =3D=3D ARM_MMU500) {
> +             /*
> +              * Before clearing ARM_MMU500_ACTLR_CPRE, need to
> +              * clear CACHE_LOCK bit of ACR first. And, CACHE_LOCK
> +              * bit is only present in MMU-500r2 onwards.
> +              */
> +             reg =3D mmio_read32(gr0_base + ARM_SMMU_GR0_ID7);
> +             major =3D (reg >> ID7_MAJOR_SHIFT) & ID7_MAJOR_MASK;
> +             reg =3D mmio_read32(gr0_base + ARM_SMMU_GR0_sACR);
> +             if (major >=3D 2)
> +                     reg &=3D ~ARM_MMU500_ACR_CACHE_LOCK;
> +             /*
> +              * Allow unmatched Stream IDs to allocate bypass
> +              * TLB entries for reduced latency.
> +              */
> +             reg |=3D ARM_MMU500_ACR_SMTNMB_TLBEN | ARM_MMU500_ACR_S2CRB=
_TLBEN;
> +             mmio_write32(gr0_base + ARM_SMMU_GR0_sACR, reg);
> +     }
> +
> +     /* Make sure all context banks are disabled and clear CB_FSR  */
> +     for (i =3D 0; i < smmu->num_context_banks; ++i) {
> +             void *cb_base =3D ARM_SMMU_CB(smmu, i);
> +
> +             arm_smmu_write_context_bank(smmu, i);
> +             mmio_write32(cb_base + ARM_SMMU_CB_FSR, FSR_FAULT);
> +             /*
> +              * Disable MMU-500's not-particularly-beneficial next-page
> +              * prefetcher for the sake of errata #841119 and #826419.
> +              */
> +             if (smmu->model =3D=3D ARM_MMU500) {
> +                     reg =3D mmio_read32(cb_base + ARM_SMMU_CB_ACTLR);
> +                     reg &=3D ~ARM_MMU500_ACTLR_CPRE;
> +                     mmio_write32(cb_base + ARM_SMMU_CB_ACTLR, reg);
> +             }
> +     }
> +
> +     /* Invalidate the TLB, just in case */
> +     mmio_write32(gr0_base + ARM_SMMU_GR0_TLBIALLH, 0);
> +     mmio_write32(gr0_base + ARM_SMMU_GR0_TLBIALLNSNH, 0);
> +
> +     reg =3D mmio_read32(ARM_SMMU_GR0_NS(smmu) + ARM_SMMU_GR0_sCR0);
> +
> +     /* Enable fault reporting */
> +     reg |=3D (sCR0_GFRE | sCR0_GFIE | sCR0_GCFGFRE | sCR0_GCFGFIE);
> +
> +     /* Disable TLB broadcasting. */
> +     reg |=3D (sCR0_VMIDPNE | sCR0_PTM);
> +
> +     /* Enable client access, handling unmatched streams as appropriate =
*/
> +     reg &=3D ~sCR0_CLIENTPD;
> +     reg &=3D ~sCR0_USFCFG;
> +
> +     /* Disable forced broadcasting */
> +     reg &=3D ~sCR0_FB;
> +
> +     /* Don't upgrade barriers */
> +     reg &=3D ~(sCR0_BSU_MASK << sCR0_BSU_SHIFT);
> +
> +     if (smmu->features & ARM_SMMU_FEAT_VMID16)
> +             reg |=3D sCR0_VMID16EN;
> +
> +     if (smmu->features & ARM_SMMU_FEAT_EXIDS)
> +             reg |=3D sCR0_EXIDENABLE;
> +
> +     /* Push the button */
> +     arm_smmu_tlb_sync_global(smmu);
> +     mmio_write32(ARM_SMMU_GR0_NS(smmu) + ARM_SMMU_GR0_sCR0, reg); }
> +
> +static int arm_smmu_id_size_to_bits(int size) {
> +     switch (size) {
> +     case 0:
> +             return 32;
> +     case 1:
> +             return 36;
> +     case 2:
> +             return 40;
> +     case 3:
> +             return 42;
> +     case 4:
> +             return 44;
> +     case 5:
> +     default:
> +             return 48;
> +     }
> +}
> +
> +static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu) {
> +     unsigned long size;
> +     void *gr0_base =3D ARM_SMMU_GR0(smmu);
> +     u32 id;
> +     bool cttw_reg, cttw_fw =3D smmu->features & ARM_SMMU_FEAT_COHERENT_=
WALK;
> +     int i;
> +
> +     printk("probing hardware configuration...\n");
> +     printk("SMMUv%d with:\n", smmu->version =3D=3D ARM_SMMU_V2 ? 2 : 1)=
;
> +
> +     /* ID0 */
> +     id =3D mmio_read32(gr0_base + ARM_SMMU_GR0_ID0);
> +
> +     /* Restrict stage 2 */
> +     id &=3D ~(ID0_S1TS | ID0_NTS);
> +
> +     if (id & ID0_S2TS) {
> +             smmu->features |=3D ARM_SMMU_FEAT_TRANS_S2;
> +             printk("\tstage 2 translation\n");
> +     }
> +
> +     if (!(smmu->features &
> +             (ARM_SMMU_FEAT_TRANS_S1 | ARM_SMMU_FEAT_TRANS_S2))) {
> +             printk("\tno translation support!\n");
> +             return -ENODEV;
> +     }
> +
> +     /*
> +      * In order for DMA API calls to work properly, we must defer to wh=
at
> +      * the FW says about coherency, regardless of what the hardware cla=
ims.
> +      * Fortunately, this also opens up a workaround for systems where t=
he
> +      * ID register value has ended up configured incorrectly.
> +      */
> +     cttw_reg =3D !!(id & ID0_CTTW);
> +     if (cttw_fw || cttw_reg)
> +             printk("\t%scoherent table walk\n", cttw_fw ? "" : "non-");
> +     if (cttw_fw !=3D cttw_reg)
> +             printk("\t(IDR0.CTTW overridden by FW=20
> + configuration)\n");
> +
> +     /* Max. number of entries we have for stream matching/indexing */
> +     if (smmu->version =3D=3D ARM_SMMU_V2 && id & ID0_EXIDS) {
> +             smmu->features |=3D ARM_SMMU_FEAT_EXIDS;
> +             size =3D 1 << 16;
> +     } else {
> +             size =3D 1 << ((id >> ID0_NUMSIDB_SHIFT) & ID0_NUMSIDB_MASK=
);
> +     }
> +     smmu->streamid_mask =3D size - 1;
> +
> +     if (id & ID0_SMS) {
> +             smmu->features |=3D ARM_SMMU_FEAT_STREAM_MATCH;
> +             size =3D (id >> ID0_NUMSMRG_SHIFT) & ID0_NUMSMRG_MASK;
> +             if (size =3D=3D 0) {
> +                     printk("stream-matching supported, but no SMRs pres=
ent!\n");
> +                     return -ENODEV;
> +             }
> +
> +             /* Zero-initialised to mark as invalid */
> +             smmu->smrs =3D page_alloc(&mem_pool,
> +                                     PAGES(size * sizeof(*smmu->smrs)));
> +             if (!smmu->smrs)
> +                     return -ENOMEM;
> +             memset(smmu->smrs, 0, PAGES(size *=20
> + sizeof(*smmu->smrs)));
> +
> +             printk("\tstream matching with %lu register groups", size);
> +     }
> +     /* s2cr->type =3D=3D 0 means translation, so initialise explicitly =
*/
> +     smmu->s2crs =3D page_alloc(&mem_pool, PAGES(size * (sizeof(*smmu->s=
2crs) + sizeof(*smmu->cfgs))));
> +     if (!smmu->s2crs) {
> +             page_free(&mem_pool, smmu->smrs,
> +                       PAGES(size * sizeof(*smmu->smrs)));
> +             return -ENOMEM;
> +     }
> +
> +     smmu->cfgs =3D (struct arm_smmu_cfg *)(smmu->s2crs + size);
> +
> +     /* Configure to bypass */
> +     for (i =3D 0; i < size; i++)
> +             smmu->s2crs[i] =3D s2cr_init_val;
> +
> +     smmu->num_mapping_groups =3D size;
> +
> +     if (smmu->version < ARM_SMMU_V2 || !(id & ID0_PTFS_NO_AARCH32)) {
> +             smmu->features |=3D ARM_SMMU_FEAT_FMT_AARCH32_L;
> +             if (!(id & ID0_PTFS_NO_AARCH32S))
> +                     smmu->features |=3D ARM_SMMU_FEAT_FMT_AARCH32_S;
> +     }
> +
> +     /* ID1 */
> +     id =3D mmio_read32(gr0_base + ARM_SMMU_GR0_ID1);
> +     smmu->pgshift =3D (id & ID1_PAGESIZE) ? 16 : 12;
> +
> +     /* Check for size mismatch of SMMU address space from mapped region=
 */
> +     size =3D 1 << (((id >> ID1_NUMPAGENDXB_SHIFT) & ID1_NUMPAGENDXB_MAS=
K) + 1);
> +     size <<=3D smmu->pgshift;
> +     if (smmu->cb_base !=3D gr0_base + size)
> +             printk("SMMU address space size (0x%lx) differs from mapped=
 region size (0x%tx)!\n",
> +                    size * 2, (smmu->cb_base - gr0_base) * 2);
> +
> +     smmu->num_s2_context_banks =3D (id >> ID1_NUMS2CB_SHIFT) & ID1_NUMS=
2CB_MASK;
> +     smmu->num_context_banks =3D (id >> ID1_NUMCB_SHIFT) & ID1_NUMCB_MAS=
K;
> +     if (smmu->num_s2_context_banks > smmu->num_context_banks) {
> +             printk("impossible number of S2 context banks!\n");
> +             return -ENODEV;
> +     }
> +     /* TODO Check More */
> +     smmu->num_context_irqs =3D smmu->num_context_banks;
> +
> +     printk("\t%u context banks (%u stage-2 only)\n",
> +            smmu->num_context_banks, smmu->num_s2_context_banks);
> +
> +     smmu->cbs =3D page_alloc(&mem_pool, PAGES(smmu->num_context_banks *=
 sizeof(*smmu->cbs)));
> +     if (!smmu->cbs) {
> +             /* TODO: Free smrs s2cr */
> +             return -ENOMEM;
> +     }
> +
> +     /* ID2 */
> +     id =3D mmio_read32(gr0_base + ARM_SMMU_GR0_ID2);
> +     size =3D arm_smmu_id_size_to_bits((id >> ID2_IAS_SHIFT) & ID2_IAS_M=
ASK);
> +     /* Reuse cpu table */
> +     smmu->ipa_size =3D MIN(size, get_cpu_parange());
> +
> +     /* The output mask is also applied for bypass */
> +     size =3D arm_smmu_id_size_to_bits((id >> ID2_OAS_SHIFT) & ID2_OAS_M=
ASK);
> +     smmu->pa_size =3D size;
> +
> +     if (id & ID2_VMID16)
> +             smmu->features |=3D ARM_SMMU_FEAT_VMID16;
> +
> +     /*
> +      * What the page table walker can address actually depends on which
> +      * descriptor format is in use, but since a) we don't know that yet=
,
> +      * and b) it can vary per context bank, this will have to do...
> +      * TODO: DMA?
> +      */
> +
> +     if (smmu->version < ARM_SMMU_V2) {
> +             smmu->va_size =3D smmu->ipa_size;
> +             if (smmu->version =3D=3D ARM_SMMU_V1_64K)
> +                     smmu->features |=3D ARM_SMMU_FEAT_FMT_AARCH64_64K;
> +     } else {
> +             size =3D (id >> ID2_UBS_SHIFT) & ID2_UBS_MASK;
> +             smmu->va_size =3D arm_smmu_id_size_to_bits(size);
> +             if (id & ID2_PTFS_4K)
> +                     smmu->features |=3D ARM_SMMU_FEAT_FMT_AARCH64_4K;
> +             if (id & ID2_PTFS_16K)
> +                     smmu->features |=3D ARM_SMMU_FEAT_FMT_AARCH64_16K;
> +             if (id & ID2_PTFS_64K)
> +                     smmu->features |=3D ARM_SMMU_FEAT_FMT_AARCH64_64K;
> +     }
> +
> +     /* Now we've corralled the various formats, what'll it do? */
> +     if (smmu->features & ARM_SMMU_FEAT_FMT_AARCH32_S)
> +             smmu->pgsize_bitmap |=3D SZ_4K | SZ_64K | SZ_1M | SZ_16M;
> +     if (smmu->features &
> +         (ARM_SMMU_FEAT_FMT_AARCH32_L | ARM_SMMU_FEAT_FMT_AARCH64_4K))
> +             smmu->pgsize_bitmap |=3D SZ_4K | SZ_2M | SZ_1G;
> +     if (smmu->features & ARM_SMMU_FEAT_FMT_AARCH64_16K)
> +             smmu->pgsize_bitmap |=3D SZ_16K | SZ_32M;
> +     if (smmu->features & ARM_SMMU_FEAT_FMT_AARCH64_64K)
> +             smmu->pgsize_bitmap |=3D SZ_64K | SZ_512M;
> +
> +     if (pgsize_bitmap =3D=3D -1UL)
> +             pgsize_bitmap =3D smmu->pgsize_bitmap;
> +     else
> +             pgsize_bitmap |=3D smmu->pgsize_bitmap;
> +     printk("\tSupported page sizes: 0x%08lx\n",=20
> + smmu->pgsize_bitmap);
> +
> +
> +     if (smmu->features & ARM_SMMU_FEAT_TRANS_S1)
> +             printk("\tStage-1: %lu-bit VA -> %lu-bit IPA\n",
> +                    smmu->va_size, smmu->ipa_size);
> +
> +     if (smmu->features & ARM_SMMU_FEAT_TRANS_S2)
> +             printk("\tStage-2: %lu-bit IPA -> %lu-bit PA\n",
> +                    smmu->ipa_size, smmu->pa_size);
> +
> +     return 0;
> +}
> +
> +static void arm_smmu_test_smr_masks(struct arm_smmu_device *smmu) {
> +     void *gr0_base =3D ARM_SMMU_GR0(smmu);
> +     u32 smr;
> +
> +     if (!smmu->smrs)
> +             return;
> +
> +     /*
> +      * SMR.ID bits may not be preserved if the corresponding MASK
> +      * bits are set, so check each one separately. We can reject
> +      * masters later if they try to claim IDs outside these masks.
> +      */
> +     smr =3D smmu->streamid_mask << SMR_ID_SHIFT;
> +     mmio_write32(gr0_base + ARM_SMMU_GR0_SMR(0), smr);
> +     smr =3D mmio_read32(gr0_base + ARM_SMMU_GR0_SMR(0));
> +     smmu->streamid_mask =3D smr >> SMR_ID_SHIFT;
> +
> +     smr =3D smmu->streamid_mask << SMR_MASK_SHIFT;
> +     mmio_write32(gr0_base + ARM_SMMU_GR0_SMR(0), smr);
> +     smr =3D mmio_read32(gr0_base + ARM_SMMU_GR0_SMR(0));
> +     smmu->smr_mask_mask =3D smr >> SMR_MASK_SHIFT; }
> +
> +static int arm_smmu_find_sme(u16 id, u16 mask) {
> +     struct arm_smmu_device *smmu =3D &smmu_device;
> +     struct arm_smmu_smr *smrs =3D smmu->smrs;
> +     int i, free_idx =3D -EINVAL;
> +
> +     /* Stream indexing is blissfully easy */
> +     if (!smrs)
> +             return id;
> +
> +     /* Validating SMRs is... less so */
> +     for (i =3D 0; i < smmu->num_mapping_groups; ++i) {
> +             if (!smrs[i].valid) {
> +                     /*
> +                      * Note the first free entry we come across, which
> +                      * we'll claim in the end if nothing else matches.
> +                      */
> +                     if (free_idx < 0)
> +                             free_idx =3D i;
> +                     continue;
> +             }
> +             /*
> +              * If the new entry is _entirely_ matched by an existing en=
try,
> +              * then reuse that, with the guarantee that there also cann=
ot
> +              * be any subsequent conflicting entries. In normal use we'=
d
> +              * expect simply identical entries for this case, but there=
's
> +              * no harm in accommodating the generalisation.
> +              */
> +             if ((mask & smrs[i].mask) =3D=3D mask &&
> +                 !((id ^ smrs[i].id) & ~smrs[i].mask)) {
> +                     return i;
> +             }
> +             /*
> +              * If the new entry has any other overlap with an existing =
one,
> +              * though, then there always exists at least one stream ID
> +              * which would cause a conflict, and we can't allow that ri=
sk.
> +              */
> +             if (!((id ^ smrs[i].id) & ~(smrs[i].mask | mask)))
> +                     return -EINVAL;
> +     }
> +
> +     return free_idx;
> +}
> +
> +static bool arm_smmu_free_sme(struct arm_smmu_device *smmu, int idx)=20
> +{
> +     smmu->s2crs[idx] =3D s2cr_init_val;
> +     if (smmu->smrs) {
> +             smmu->smrs[idx].id =3D 0;
> +             smmu->smrs[idx].mask =3D 0;
> +             smmu->smrs[idx].valid =3D false;
> +     }
> +
> +     return true;
> +}
> +
> +#define for_each_smmu_sid(sid, config, counter)                         =
     \
> +     for ((sid) =3D jailhouse_cell_stream_ids(config), (counter) =3D 0; =
 \
> +          (counter) < (config)->num_stream_ids;                      \
> +          (sid)++, (counter)++)
> +
> +static int arm_smmu_cell_init(struct cell *cell) {
> +     struct arm_smmu_device *smmu =3D &smmu_device;
> +     enum arm_smmu_s2cr_type type =3D S2CR_TYPE_TRANS;
> +     struct arm_smmu_s2cr *s2cr =3D smmu->s2crs;
> +     struct arm_smmu_cfg *cfg =3D &smmu->cfgs[cell->config->id];
> +     struct arm_smmu_smr *smr;
> +     const __u32 *sid;
> +     unsigned int n;
> +     int ret, idx;
> +
> +     /* If no sids, ignore */
> +     if (!cell->config->num_stream_ids)
> +             return 0;
> +
> +     if (smmu->features & (ARM_SMMU_FEAT_FMT_AARCH64_64K |
> +                           ARM_SMMU_FEAT_FMT_AARCH64_16K |
> +                           ARM_SMMU_FEAT_FMT_AARCH64_4K))
> +             cfg->fmt =3D ARM_SMMU_CTX_FMT_AARCH64;
> +
> +     cfg->cbar =3D CBAR_TYPE_S2_TRANS;
> +
> +     /* We use cell->config->id here, one cell use one context */
> +     cfg->cbndx =3D cell->config->id;
> +
> +     if (smmu->version < ARM_SMMU_V2) {
> +             /* TODO */
> +     } else {
> +             cfg->irptndx =3D cfg->cbndx;
> +     }
> +
> +     cfg->vmid =3D cfg->cbndx + 1;
> +
> +     arm_smmu_init_context_bank(smmu, cfg, cell);
> +     arm_smmu_write_context_bank(smmu, cfg->cbndx);
> +
> +     smr =3D smmu->smrs;
> +
> +     for_each_smmu_sid(sid, cell->config, n) {
> +             ret =3D arm_smmu_find_sme(*sid, arm_sid_mask);
> +             if (ret < 0)
> +                     printk("arm_smmu_find_sme error %d\n", ret);
> +             idx =3D ret;
> +
> +             if (type =3D=3D s2cr[idx].type && cfg->cbndx =3D=3D s2cr[id=
x].cbndx)
> +                     printk("%s error\n", __func__);
> +
> +             s2cr[idx].type =3D type;
> +             s2cr[idx].privcfg =3D S2CR_PRIVCFG_DEFAULT;
> +             s2cr[idx].cbndx =3D cfg->cbndx;
> +
> +             arm_smmu_write_s2cr(smmu, idx);
> +
> +
> +             smr[idx].id =3D *sid;
> +             smr[idx].mask =3D arm_sid_mask;
> +             smr[idx].valid =3D true;
> +
> +             arm_smmu_write_smr(smmu, idx);
> +     }
> +
> +     printk("Found %d masters\n", n);
> +
> +     return 0;
> +}
> +
> +static void arm_smmu_cell_exit(struct cell *cell) {
> +     const __u32 *sid;
> +     struct arm_smmu_device *smmu =3D &smmu_device;
> +     unsigned int n;
> +     int ret, idx;
> +     int cbndx =3D cell->config->id;
> +
> +     if (!cell->config->num_stream_ids)
> +             return;
> +
> +     /* If no sids, ignore */
> +     if (cell->config->num_stream_ids) {
> +             for_each_smmu_sid(sid, cell->config, n) {
> +                     ret =3D arm_smmu_find_sme(*sid, arm_sid_mask);
> +                     if (ret < 0)
> +                             printk("arm_smmu_find_sme error %d\n", ret)=
;
> +                     idx =3D ret;
> +
> +                     if (arm_smmu_free_sme(smmu, idx)) {
> +                             arm_smmu_write_sme(smmu, idx);
> +                     }
> +
> +                     smmu->cbs[cbndx].cfg =3D NULL;
> +                     arm_smmu_write_context_bank(smmu, cbndx);
> +             }
> +     }
> +}
> +
> +static int arm_smmu_init(void)
> +{
> +     int err;
> +     __u64 phys_addr;
> +     __u32 size;
> +     struct arm_smmu_device *smmu =3D &smmu_device;
> +
> +     smmu->features &=3D ~ARM_SMMU_FEAT_COHERENT_WALK;
> +
> +     phys_addr =3D system_config->platform_info.arm.iommu_units[0].base;
> +     if (!phys_addr) {
> +             printk("No SMMU\n");
> +             return 0;
> +     }
> +
> +     size =3D system_config->platform_info.arm.iommu_units[0].size;
> +
> +     smmu->version =3D
> +             system_config->platform_info.arm.iommu_units[0].arm_smmu_ar=
ch;
> +     smmu->model =3D
> +             system_config->platform_info.arm.iommu_units[0].arm_smmu_im=
pl;
> +     arm_sid_mask =3D
> +             system_config->platform_info.arm.iommu_units[0].arm_sid_mas=
k;
> +     smmu->base =3D paging_map_device(phys_addr, size);
> +     if (!smmu->base)
> +             return -ENOMEM;
> +
> +     smmu->cb_base =3D smmu->base + size / 2;
> +
> +     err =3D arm_smmu_device_cfg_probe(smmu);
> +     if (err)
> +             return err;
> +
> +     if (smmu->version =3D=3D ARM_SMMU_V2 &&
> +         smmu->num_context_banks !=3D smmu->num_context_irqs) {
> +             printk("found only %d context interrupt(s) but %d required\=
n",
> +                    smmu->num_context_irqs, smmu->num_context_banks);
> +             /* TODO: page free smr s2cr cbs */
> +             return -ENODEV;
> +     }
> +
> +     /* TODO: request irq */
> +
> +     arm_smmu_device_reset(smmu);
> +     arm_smmu_test_smr_masks(smmu);
> +
> +     /*
> +      * For ACPI and generic DT bindings, an SMMU will be probed before
> +      * any device which might need it, so we want the bus ops in place
> +      * ready to handle default domain setup as soon as any SMMU exists.
> +      */
> +     /* TODO: How handle PCI iommu? */
> +
> +     return arm_smmu_cell_init(&root_cell); }
> +
> +DEFINE_UNIT_MMIO_COUNT_REGIONS_STUB(arm_smmu);
> +DEFINE_UNIT_SHUTDOWN_STUB(arm_smmu);
> +DEFINE_UNIT(arm_smmu, "ARM SMMU");
> diff --git a/include/jailhouse/cell-config.h=20
> b/include/jailhouse/cell-config.h index 30ec5d06..a6a7d8c1 100644
> --- a/include/jailhouse/cell-config.h
> +++ b/include/jailhouse/cell-config.h
> @@ -266,6 +266,10 @@ struct jailhouse_iommu {
>                       __u32 tlb_size;
>               } __attribute__((packed)) tipvu;
>       };
> +
> +     __u32 arm_sid_mask;
> +     __u32 arm_smmu_arch;
> +     __u32 arm_smmu_impl;
>   } __attribute__((packed));
>
>   struct jailhouse_pio {
> @@ -290,6 +294,17 @@ struct jailhouse_pio {
>   #define SYS_FLAGS_VIRTUAL_DEBUG_CONSOLE(flags) \
>       !!((flags) & JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE)
>
> +enum arm_smmu_arch_version {
> +     ARM_SMMU_V1,
> +     ARM_SMMU_V1_64K,
> +     ARM_SMMU_V2,
> +};
> +
> +enum arm_smmu_implementation {
> +     GENERIC_SMMU,
> +     ARM_MMU500,
> +};
> +
>   /**
>    * General descriptor of the system.
>    */
> diff --git a/include/jailhouse/sizes.h b/include/jailhouse/sizes.h new=20
> file mode 100644 index 00000000..ce3e8150
> --- /dev/null
> +++ b/include/jailhouse/sizes.h
> @@ -0,0 +1,47 @@
> +/*
> + * include/linux/sizes.h
> + *
> + * This program is free software; you can redistribute it and/or=20
> +modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +#ifndef __LINUX_SIZES_H__
> +#define __LINUX_SIZES_H__
> +
> +#define SZ_1                         0x00000001
> +#define SZ_2                         0x00000002
> +#define SZ_4                         0x00000004
> +#define SZ_8                         0x00000008
> +#define SZ_16                                0x00000010
> +#define SZ_32                                0x00000020
> +#define SZ_64                                0x00000040
> +#define SZ_128                               0x00000080
> +#define SZ_256                               0x00000100
> +#define SZ_512                               0x00000200
> +
> +#define SZ_1K                                0x00000400
> +#define SZ_2K                                0x00000800
> +#define SZ_4K                                0x00001000
> +#define SZ_8K                                0x00002000
> +#define SZ_16K                               0x00004000
> +#define SZ_32K                               0x00008000
> +#define SZ_64K                               0x00010000
> +#define SZ_128K                              0x00020000
> +#define SZ_256K                              0x00040000
> +#define SZ_512K                              0x00080000
> +
> +#define SZ_1M                                0x00100000
> +#define SZ_2M                                0x00200000
> +#define SZ_4M                                0x00400000
> +#define SZ_8M                                0x00800000
> +#define SZ_16M                               0x01000000
> +#define SZ_32M                               0x02000000
> +#define SZ_64M                               0x04000000
> +#define SZ_128M                              0x08000000
> +#define SZ_256M                              0x10000000
> +#define SZ_512M                              0x20000000
> +
> +#define SZ_1G                                0x40000000
> +#define SZ_2G                                0x80000000
> +
> +#endif /* __LINUX_SIZES_H__ */
>

Ah, this is great! I'll look into details "soon".

Do you (or anyone else) happen to know if that should also be compatible wi=
th SMMU on the Ultrascale+? The latter I have in hands right now, unfortuna=
tely not any i.MX8 board.

Jan

--
Siemens AG, Corporate Technology, CT RDA IOT SES-DE Corporate Competence Ce=
nter Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/DB8PR04MB706502222CBEDCC8E97E8877E2A20%40DB8PR04MB7065.eurprd=
04.prod.outlook.com.
