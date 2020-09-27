Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBTGJX75QKGQEM47OEAQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13c.google.com (mail-lf1-x13c.google.com [IPv6:2a00:1450:4864:20::13c])
	by mail.lfdr.de (Postfix) with ESMTPS id 14256279D3F
	for <lists+jailhouse-dev@lfdr.de>; Sun, 27 Sep 2020 03:03:09 +0200 (CEST)
Received: by mail-lf1-x13c.google.com with SMTP id a4sf784866lff.21
        for <lists+jailhouse-dev@lfdr.de>; Sat, 26 Sep 2020 18:03:09 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1601168588; cv=pass;
        d=google.com; s=arc-20160816;
        b=FJ6v2U88BfQKReE3auH5S1ys1T4EIUq15y16tVAy0ztzMLhQpF1+wivH1SsuSQP4W7
         k/Zh3Zba739yh7yhsCEx+pU/0eIwa8Jd9d9Oz2XUZ8Ws6nrVdmd4o114VJ06zWe+/PeQ
         gGYCdV9cg7fqGr5rDgqKkXctbEt9hLVNyV/5v4PlFnWqZh4qA1sH1jyp5iccINrx9JF4
         dg/Y+aw23kL0Y43eu8IdgflsIZK+1zlDg/oP50aClGN+6Oy4a3MItK6Toy85E0LHHbam
         NlHC3JOAi4F+rprIxXczN91ePsO8/2MJnDKmq8LgfEatqElj8Xq/UIQUPUg8xNEGBx3M
         xQxQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:sender:dkim-signature;
        bh=EisvW8iLuLf6lzgiqq3ONQtJNRb9SA2skM+CG38WYMw=;
        b=RWPM7WmKZeCRz8fHtC4wcT1BOjFUhYpTSGSVeEKliaU8zIhqUPOspG7tU38b8/wRjH
         Lm0viVXV+CCrz9PoO36yTfvfddBd/hMLmD6Glgit9hZFHppmq4sDY625SF9/XurkFCCO
         O+5EQtP4oSX4YHsHSAGgFwgxHE7HmOze4203Ggz0bGH7JRVqgFxENR1ATRRHvYzHaPIv
         WkM1jW1BugQDcNrc0uvWt2vYKRUMTbjuo1eRMYjKrmlXhHN+Z9rSX2wj0GOf8ejEteYA
         ciVhs8fq6JEzuCRUllQNMN+P8uOFTcnVfQjNVPv2sMs4CRWOoo+tvHcwW3Yz+JIrgrq8
         7eIg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=rknkDwtZ;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.13.77 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=EisvW8iLuLf6lzgiqq3ONQtJNRb9SA2skM+CG38WYMw=;
        b=SmOXyes6g06G9T2ASSVlMMn5nhr0CQVoy6qJCkq38bwFf975vRMKZhYYKJ6c6w6hjX
         nwiqrdEAt5h0bkJcVTAAqAsGdE9UEjbH1TqdGi+Zl8gUwT4bHpeS0JjlrEJb0zGva1tK
         xVMiOEVrvtb9bP2NskL67UClEE7P5/V8fwihRJXXogdy/pEEPeDIsWnjS92pefA7P1Dr
         15FXriO8gLEu3/4zr8GBK8cktVhFxxHOYoULEANsb3aKlkivW5jqyEGx0ZjrFzNBaY98
         jx4DmL0yp58Lw0QcozUUXwKT1LdVwTE6yLXCc6b+0HtEIf/To+ZFjOrk3E43euvdfGkx
         4dcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=EisvW8iLuLf6lzgiqq3ONQtJNRb9SA2skM+CG38WYMw=;
        b=aq0D3n6xVR6Km/+wYSeVdoqzunigY1rPOFqAyaOxO762iNA0F+OnfYWwrMPh806zA9
         V7VuVGKLwe5gEVyrcGnAoOJniu1LejsOveodypBMSw36yQ9RJjxxEAtdXmpNt5z9fV5k
         lZ4KNPHcqljgcuw8C999qCX2KXo9uLZMDPEyhx0At2sKqhFhEdBrPG0HsyA16a782Ot1
         5DKy4JaZrADJ+mvAd9zEWcMP4V4GerR0pDWy2JJzXNK3squgQJzbx1NKjAX3GS9r2dXo
         YK+3l7duECN4QcgASROLj/VmcgMW+rBizAPTs9XMC8kEIlMrEP+pp1bAIoYX0RwlTu0G
         w3yg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532+bl0/+3/gdGltj2QJXoe44kxROXWH3RFkHOzCMVUO8R9tsHgP
	hISMlHvavTYgih1Ng/iAhFk=
X-Google-Smtp-Source: ABdhPJyamod4brE+7qBkncAmXNnGQX/N2sTrTfIk0tJtWY/auX61bPJ48S+kgroTfpIlCz8zz9I5JA==
X-Received: by 2002:a19:915d:: with SMTP id y29mr1924617lfj.371.1601168588649;
        Sat, 26 Sep 2020 18:03:08 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:554:: with SMTP id 81ls2390821lff.1.gmail; Sat, 26 Sep
 2020 18:03:07 -0700 (PDT)
X-Received: by 2002:a19:be0b:: with SMTP id o11mr1701792lff.117.1601168587538;
        Sat, 26 Sep 2020 18:03:07 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601168587; cv=pass;
        d=google.com; s=arc-20160816;
        b=BI1pElQukW0r2op41ZNA8u5KYD/Z1Oglfx1z3e3GB1gTL+MQdC8LOD0zrYd3tE9vh6
         Muzfmh1d8dRYBP+qkzeybi7Z3lp8gaK1mKPXiyucBR9LRdE/SaSiWHJL0CyyhBTvpTos
         8rLmifzZMjBoCvHjHBp06ArnSV77d2yht0aIMmkDpeFffdqvq1CdkVQbtCdsxINy5pld
         p2N2udTZRAlx+N2Q0xOpf4FdJQ+PgLtpYVmSsKMFVM4eZdtyaFsKYOy4IHcRRnlkiUE2
         FzccWjS6xYrBS/ppd+zxVyQj6s3YbiJI96+oX3fJV/oMwUj3HG82iD/AEBSTFLFd2/RH
         vxUw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=HhugwE9x/KyafNjaOJ+PWYRfxowpMsOEXEYXJYmK29Q=;
        b=xG83YuqNTxrdNmsrkGcLp2AuKE6AMMZbFRJMkrTLKG0xFGuT4EAWIq+TgZh/pT32oz
         tsXesZmdDbiOBAiTy5BSxYmGk2ZgQhY6LzTb5wTEDoCAQWcSZgOWwGGEoLrte5g7Kmkz
         7O3zHj7n8jMx/Hj6udlW0bf6hHNe2sAbSP6cOEwpauoYPxHtvl37RYWSL1ATWGogrSQC
         Ig4THb0Y/P5gStmFiUXVhfknn4lzyYBH4Fm5GwXfzor/UO/tMJXuQU9wFhVOAJJfX/NT
         mitV1cyAqAMatuHkyHjxn5sf9bGLHzgy9z8hryowwDm6WrXoJIIbwVyuXpkDyR7SnbpT
         sMnQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=rknkDwtZ;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.13.77 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-eopbgr130077.outbound.protection.outlook.com. [40.107.13.77])
        by gmr-mx.google.com with ESMTPS id t80si175321lff.9.2020.09.26.18.03.07
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 26 Sep 2020 18:03:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.13.77 as permitted sender) client-ip=40.107.13.77;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kHOeYNZmlXfWSbu7FT9DVc1H1CoXXn/7Jt1htnO4jB4KjbxNTxk5DZgoDPXtJmonGZuz9ODzYJdq++XKk0JXL42bJiPq7vU4PSYgUrMRGKqExcOMNW8MwjH7ZWaaNAFnmsr9mJETzuopnAsMz9Fh+05E8xA8JO+6iWhkZTRdjpAE9VjZmrnWvydrHwYVOiWWmizf/mJpX/Dd87edM4aR3pEVlbv7QiYvYziz06ZW5S/Er0cZb+dLPD3yBZi6w9ehUz2Dt+oGsf5GZcpEgUTtAHXuo3gjmZMCEd6i2mwHaa4S4DntDrucQf74ff/nDwuCHMWogBgVXHwacrzCkF03Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HhugwE9x/KyafNjaOJ+PWYRfxowpMsOEXEYXJYmK29Q=;
 b=C9eNO++KmcNfBBP39UMHkSjUCgAhIlAoYOoj3hzeCTvlI8pAxk48ZGjnIslAKdeWI8U6vwyvCdvm0AIIMryehRoVjN2IWkusd6H9IdDnHz2RzcniukMNcLvZhgnsHAYoYYQQ8nOjHbUvNL+uyIL94C6JBU24vJZwsjaI7VxSRSFC5SKVO4kMPFM0shM9sPWQ7vmmaTYKdKmqbVCunoNIVmNkw7m9xTzrzHLCCs8qBMRlwvxfoideczxOg83d1pgQJoxgJ8yItgp1j7Fx7VeVSRURAzWQDtRRWmRVg/XJLNSC/7LKtu5OWoXB6JBLk1KV2Vdr7FCk/VASL0lH9+Ep1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR0401MB2375.eurprd04.prod.outlook.com (2603:10a6:4:4a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.22; Sun, 27 Sep
 2020 01:03:05 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::35c5:8c71:91f3:6bc6]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::35c5:8c71:91f3:6bc6%12]) with mapi id 15.20.3412.028; Sun, 27 Sep
 2020 01:03:05 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
CC: Alice Guo <alice.guo@nxp.com>
Subject: RE: [PATCH 3/8] arm64: smmu: Clarify that mapping mismatch is just a
 warning
Thread-Topic: [PATCH 3/8] arm64: smmu: Clarify that mapping mismatch is just a
 warning
Thread-Index: AQHWkxjh23CVoSNKwECavYvCRaP2TKl7raDQ
Date: Sun, 27 Sep 2020 01:03:05 +0000
Message-ID: <DB6PR0402MB2760E292EA149F698A6AD32388340@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <cover.1601023807.git.jan.kiszka@siemens.com>
 <05a7d5fdab8a4da1bcbba7a1deab233c3a217f01.1601023807.git.jan.kiszka@siemens.com>
In-Reply-To: <05a7d5fdab8a4da1bcbba7a1deab233c3a217f01.1601023807.git.jan.kiszka@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d466a206-25aa-4206-75f7-08d86281178d
x-ms-traffictypediagnostic: DB6PR0401MB2375:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR0401MB23759D16AD8B3B63C03C133988340@DB6PR0401MB2375.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WIyy/MOXoMflf6WGeqQGBYy847OXx41Mme17BPDMNh/4Xot8Y0Fsok69aCt6/zIE9ZPnR7ztcDdiE0IsUd+P/EwrbaQPSwWMJhVnMk9b3GtaPeHKIukOXSmiGTeCKJMvmTOD7gLqyUIP85anTPG7hSBLzlCw2tSRkaXrG2qccnMMFg944OgvKalPx/DYFEwWLTAaWFZuaTzvpfX1FxxIwdfIeecOWeQS/MH6tnebLeDG709VtjvSB387SMcMT58nQf1CEdzEVN+8n0u47sUMtwa3I3WtVHKMsgJT9aZrWvocoW8bAqwaLmURz/RewARW9dK++j+4nUTyRV606p6jrR5zVy3HowG+9FK86QvwNT7XVAQoIEKbKQRpYtML3xbl
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(136003)(396003)(346002)(376002)(366004)(52536014)(33656002)(8676002)(9686003)(26005)(2906002)(83380400001)(76116006)(66946007)(66476007)(66556008)(44832011)(478600001)(66446008)(86362001)(55016002)(64756008)(71200400001)(186003)(7696005)(8936002)(6506007)(110136005)(4326008)(316002)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: Hx5PpGpm1AzD/RoU7LI7DruEGPAa1B4dt8QcO+kEgy+Dmli4rbM0YJNjy8lUjtsHmgMRBxTGAVAnseZQUSWIS/Jsx7WAEybJhxsXyvF/MdsEaNqpk020gacmk9W8siYX3ffYYvG8K0Yj/NiVZ0gZJoW3gzhzDCYMWJNCn48c4M3eM+hHP3cXcZm5tF3agwCDnUXPMthN69z8M3iAe8U3UJUj5X0tg4ERW5RV6IIXxpW8UsdfobZMDt64vmQfQPNXaw/tvlg3koy9hIWifoxuijXfIfW3NRAtNVotrXF0jZYWQ+/OUNElXVYYV4cWe6JhhMzIqX6SQ4+X7y+BOwpOaOiRJHuFlTtdz3bPdG0loqI8AbittcgOJSiATlJ1OY7NvTWtAPj7Ut4VArtK5mYpYsfqwLqfYNBPp/HeYV+AdGZH9CdPCq5LZPrzPmk1oea5VXI4XyTBDPTxaR1OgCLzKeS0OizqabzsXJ4WflxvWksH+VsGB3uKOgqxY7l1I1yEdhVX8T9XljbE6K0XjTUVuZh+aXa/Wg3tYwR5dVHIifMr5lWrRotJHGZqWDgq3KvNEEH657KSQbFLjkg4fRdl+BAANk4ErcpbgHGI3yipvkv61RdrH8+rhNiT8RS0zYiTRqkn4WnwTOePg9Lj6YD3MQ==
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d466a206-25aa-4206-75f7-08d86281178d
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2020 01:03:05.7685
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Tontm5+d3Q6bf8ZZpWZd59gplqPJNJnzVCPlrvulcBn0tp7/kcMW/gYM8jsime2CBCteYnczXyXxf1cJA78ZEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2375
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=rknkDwtZ;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.13.77 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

> Subject: [PATCH 3/8] arm64: smmu: Clarify that mapping mismatch is just a
> warning
> 
> From: Jan Kiszka <jan.kiszka@siemens.com>
> 
> The Linux kernel commit c55af7f719cb writes:
> 
> "Such a mismatch could be intentional (to fix wrong register values).
> If its not intentional (e.g. due to wrong DT information) this will very likely
> cause a malfunction of the driver as SMMU_CB_BASE is derived from the size
> of the mapped region. The warning helps to identify the root cause in this
> case."
> 
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>  hypervisor/arch/arm64/smmu.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
> index 3b2d6e15..e8dbf186 100644
> --- a/hypervisor/arch/arm64/smmu.c
> +++ b/hypervisor/arch/arm64/smmu.c
> @@ -679,7 +679,8 @@ static int arm_smmu_device_cfg_probe(struct
> arm_smmu_device *smmu)
>  	size = 1 << (((id >> ID1_NUMPAGENDXB_SHIFT) &
> ID1_NUMPAGENDXB_MASK) + 1);
>  	size <<= smmu->pgshift;
>  	if (smmu->cb_base != gr0_base + size)
> -		printk("SMMU address space size (0x%lx) differs from mapped
> region size (0x%tx)!\n",
> +		printk("Warning: SMMU address space size (0x%lx) "
> +		       "differs from mapped region size (0x%tx)!\n",
>  		       size * 2, (smmu->cb_base - gr0_base) * 2);
> 
>  	smmu->num_s2_context_banks = (id >> ID1_NUMS2CB_SHIFT) &
> ID1_NUMS2CB_MASK;

Reviewed-by: Peng Fan <peng.fan@nxp.com>

> --
> 2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/DB6PR0402MB2760E292EA149F698A6AD32388340%40DB6PR0402MB2760.eurprd04.prod.outlook.com.
