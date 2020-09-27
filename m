Return-Path: <jailhouse-dev+bncBDEN32754MOBB65VYH5QKGQEPV2TATA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13d.google.com (mail-lf1-x13d.google.com [IPv6:2a00:1450:4864:20::13d])
	by mail.lfdr.de (Postfix) with ESMTPS id AA13727A025
	for <lists+jailhouse-dev@lfdr.de>; Sun, 27 Sep 2020 11:27:24 +0200 (CEST)
Received: by mail-lf1-x13d.google.com with SMTP id u11sf1043733lfk.22
        for <lists+jailhouse-dev@lfdr.de>; Sun, 27 Sep 2020 02:27:24 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1601198844; cv=pass;
        d=google.com; s=arc-20160816;
        b=cP3c1kp8R8mymgrgge/ELQUoy4X8xyj2wuyAGtAfjABj99MtD4duCu+NNOGR/EyxVI
         0YORxaayqJJwWDABpODonmlaUTdKjV2nhWyGIx7JZtFn6eTQdKKmRwmuvN4ajMtySrLl
         ut1puMw3OdacGcmpMdVACrjZ42z8Z9bL4F7gAJQ6Kh2xmckP2MgvLpuZnYDejVOsTWWV
         ZdKT+dwjHo/N6ZB+Pf9K0R4A6ka1N522d69q3qp4GKRJiwdYpXvRZKcdW+rzJ0CTwHrF
         blDYlJC+BFZ8HqO/KWJ+DWkx6v6gKe7E2TxhDCOLseJQdnAxXhG1Z/5mkbDQZtKJwJxv
         Xrjw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to:from:sender:dkim-signature;
        bh=1YZYCSkSiKJ0zItkOIQ7kWpXlRNO6evy1ApXxd53HoA=;
        b=Tx9FlETyrJg/DT+QVbXNbVGilgbpY5M/8DG96QcZkW5zG29UDd3J3kk+qUd3Ccrmsi
         fQB4EFG5LjteCqFunxtXFyLko4h3FCfOuR2U7psEXdRgiUUaUUKVuUANH2KGoYAf21nl
         6H1GRZa7SsLlTJ97CXF6UgWKp55IMwbPjrmNvlYRE0skJWakjcAo4W6xwak6jqhGQOxu
         gkRKrXtxc7hfdndP1skeuGKWgsVYZNW23+nCOk+ywAuGL9nvGZtuA+d7GCcdg1AizA7+
         O/ZBm7UC19tK+fGFxH8rCcRqLjOo+xALc0WVTng+zjgaVKOMM3KsdHSg6nX1fb7rutpT
         6tSA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=BoYi+E79;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.2.76 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=1YZYCSkSiKJ0zItkOIQ7kWpXlRNO6evy1ApXxd53HoA=;
        b=HyGppXSUjLyn3Qthhc6Jl64EmweV3vVU8wce26T+XKF5vuf6ys9klKwhjIjEqR7Myf
         R96+H33kQ/HoiwKhiZHVF886dq5wfzKMunL4EThm3JL15bT+5iqlASHUbkhzaVy4NoOR
         /pK/WgWoVRCqgtiM9I3AKz93ayjUTLGbxB6sbXckNir2ita3WVxj5RF/QlA4eAlDRskA
         Bb88e0yb8w2kwdbNeI16XcQ+FMYGlF+P/DLNFVKqJQswk9GBeoJWJ1KGUwoRz7QnD/8F
         yMw5buM6kpysI/SBjzk2Y2Z2ZmG4BsiwhVMqAZh3HQGE2L6pZh1YH4T2ujEDdLxLbMPG
         qWVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:content-transfer-encoding:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=1YZYCSkSiKJ0zItkOIQ7kWpXlRNO6evy1ApXxd53HoA=;
        b=mBwxRCODF8mCgLuooK2OpIVd1EO1WisAESl3lhVzjZEM2H0xwXtdF737UWS0zeZaYc
         VFniR+r5VrAfdZJrvO1FwhsgAbKRMQGOgRzG9c403XPdS8UiqGflsCn69C8UMJV3fLZK
         9ND7XrcE98NkiRVLOvRj7R8vr00eeuE3SExuw1CX2ZpvI8C85XvzlRfe+uuVykVJ4hlp
         OEY/p4kCedPpWJgjLbEGdNCJ+9Gv6ROLcUgYZWE/lB3a1RhsG0JLDEEb61QyYqFaDUTw
         5sDFGrwEZ9kwxK1VB4mjQIvKxjdsH7cbm4YMrVSuqa3YFSlF5CtxFtOKmmSibp4Fdu5p
         pdQQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5322S0FDrRnMzDvDr2M6K6qMhWwZERw5LhQriRbaioYrGB3cjkB5
	UcL9TIQjHYkYsI55hzgjRfo=
X-Google-Smtp-Source: ABdhPJzv3Fnjc/q5GrsyP2KWLD61/E7n3TjR0ra6HE0uP5Fq7L70GRSprs4F2wWOGrxmV1jaN9CHwg==
X-Received: by 2002:a2e:b0fc:: with SMTP id h28mr3812923ljl.114.1601198844114;
        Sun, 27 Sep 2020 02:27:24 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9bc6:: with SMTP id w6ls308837ljj.0.gmail; Sun, 27 Sep
 2020 02:27:22 -0700 (PDT)
X-Received: by 2002:a2e:87c7:: with SMTP id v7mr3862734ljj.13.1601198842728;
        Sun, 27 Sep 2020 02:27:22 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601198842; cv=pass;
        d=google.com; s=arc-20160816;
        b=NfMdM64TAhhYxv7jjwbBBiTL9JThZWIbrJyngV8cJdoBy1Ub3ofQcLXd2A1A7N0UkF
         dWMiaB8kjoHwtvTY+DBYpbhmpLKAvfcccD1bN1TxzCe2evTe4gxArWapV51ttauf/gH7
         TKDWDqDcB9mRNJieLIkYevbLOr5lFS803Ltnntnkbe0bI7hBkxrOGslMVuwx1onB5G4z
         On0GZ02G4VSLz59yV6dcZ7tyysqnJ0xDZftTTubstmfQ0wiJ2Rm3mFHS0Q5kNG3BkrIB
         nZbNbdvWZzFS4+b8zHiDhulzat1aLZaQ3a0UDBTC0bqHdPaN959kiSvllgEZhXL7DA21
         BroQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=N12Z9cVS+w7ZWnrBTtAQ4Ck4l9Ss2Xu0zoT4/RZZPMI=;
        b=K92fM7bPwCFGwMZfxVkr0+fW6Tkgkw1RX83pWyvw7QT/xdyiCwyXtrueh2bvUIkeK6
         a/zk9pARaA0Cuw0CehemJZ+7co47Bu/uRKAOaoTkv0u9DGjLuYyYJzGkqrLUJrMZZBBI
         J9mz+TDU4i7FJyvu41ARq/UrnjTGfgXgRWocicAfLxBrOPRgBRq9e+PM3eAbriP0F/7Q
         o5dFly+vhpW2juQaREUF8bb+mDdhr86Q/690WS0dZiRIvRxeeEW84+SFlweGm0EFgUGn
         Le4DrV1jFl9o1btI4QEPlDKLBSVVFGCs2UwG94tV96YrWNFXyOwXECZcMS34Oi/ovPhh
         SLWQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=BoYi+E79;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.2.76 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (mail-eopbgr20076.outbound.protection.outlook.com. [40.107.2.76])
        by gmr-mx.google.com with ESMTPS id r16si83177ljg.1.2020.09.27.02.27.22
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 27 Sep 2020 02:27:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of alice.guo@nxp.com designates 40.107.2.76 as permitted sender) client-ip=40.107.2.76;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h87XToNFyVO7s3UzdiH6IuOryYr62NA1qdtIRYWmAM7PQQ+h8HcVpkZW/9kklsMUoae+667NZ3RmfUPWyz7eEkfROW2ANUHRRStx0ZVA5Z56plG09qUWQ0J7eMIlApteBkx9q4Jz8mJF1AXgezysQDIUUz4ZJL8ZF2faeZ71F/qW/YtXCGvxgyG9Tdlwf0X/uplXqvrZFQykFP1AohavxOVzyqhuNkONkyi0+FKJhKa3w9OxyOXCuAq+JphJ5Wxh6bINKHuDq+3rb8RLO/UC6ImwUExOorzHhX6XftJBDrHjTtYm0UNOuh5WnJ/tFthqeUCDizQ8CfYAjDZHeYq2Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N12Z9cVS+w7ZWnrBTtAQ4Ck4l9Ss2Xu0zoT4/RZZPMI=;
 b=JY2F+CRCVy2MAp0aYda8dv2lnklR+CWQM2AdPEqSf/JnG17txjWXGY2tObgGyt6jgLK5Jzg/8V7NuXOvy1JGRjcmGrFk+IN2sazTN6JYKOzJKu4VPYhHA/2eUKV4+XkN/V6ppSODfxssCFWR8MRUcJn7O28BdVo55kZlUmE7yh0/UUm09rzvnDBMqBxzAqmUfBDtyJvxSZFFYBzsP0XkqP6VJ1YO+VYQ6RpVYkgRXda5UHFFS4iEejgTkCGYcX6/swLXzC87Fh5IbViPwg0cdcWwlL4Yo8G2Vk4RRNAeBwyadIxJBywV+G5/JPCilwwRY/O9EEIiQ4XppuAEoHiqSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com (2603:10a6:10:127::9)
 by DB3PR0402MB3833.eurprd04.prod.outlook.com (2603:10a6:8:6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20; Sun, 27 Sep
 2020 09:27:17 +0000
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::ed87:8435:3012:9618]) by DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::ed87:8435:3012:9618%8]) with mapi id 15.20.3412.028; Sun, 27 Sep 2020
 09:27:17 +0000
From: Alice Guo <alice.guo@nxp.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
CC: Peng Fan <peng.fan@nxp.com>
Subject: RE: [EXT] [PATCH 0/8] arm64: SMMU500 cleanups
Thread-Topic: [EXT] [PATCH 0/8] arm64: SMMU500 cleanups
Thread-Index: AQHWkxjg4CGGRpDnC0mh7yRmq2E+7ql8NFfQ
Date: Sun, 27 Sep 2020 09:27:17 +0000
Message-ID: <DB8PR04MB70656B7EDD4163635048C7A2E2340@DB8PR04MB7065.eurprd04.prod.outlook.com>
References: <cover.1601023807.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1601023807.git.jan.kiszka@siemens.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 375b88fa-b441-4f29-5a8c-08d862c786da
x-ms-traffictypediagnostic: DB3PR0402MB3833:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB3PR0402MB38334A48F61AABC9A20F60AEE2340@DB3PR0402MB3833.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DgoSlRYsSDvlw08wvWKz8uAN/7ces7hW7dVfZVEBHSRZN71Yo0poSbhLOyYeslJ+D4ndWOt5MA7ULK0ZeOk2rAgaCIBCgGGCDdTQqGx+kx2lAQCqycPWyxQswLgZdYLsdx8Fyjog6NQ8LZBDuHJTkqiPKz5ZJqGJ+ajJ011VSYY2cLs3QaWxKVtSBDvmtHQMatpZ1NeIO5wcAfi/HPMr10QDRMocXGSUuE2cxfOP6kd869bJOvRIj2MSMAPZ+oM6025lswXdzE75AAu34zQctPEZ6Peugtjuy5YfKatzQG4rVcNS+FHe111u5hTmg39NThkF1cS7rZBPnMicSlh3Pvj4F9iMeC37ITPibXpAadOECLz2zZUUMrflVL6oyt/M
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB7065.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(136003)(396003)(376002)(366004)(76116006)(66946007)(4744005)(66446008)(4326008)(2906002)(86362001)(316002)(110136005)(8676002)(8936002)(478600001)(44832011)(33656002)(64756008)(66556008)(66476007)(5660300002)(6506007)(26005)(53546011)(186003)(7696005)(52536014)(83380400001)(55016002)(9686003)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: YLZmnjodgjh8ouYm3HoHqMWuF37BmNkLpFJLiCA3clOlQJpMLl2botIHjCSyCW6ylmQrKUu6553CALQUcV7JwYF8kVSGXVH3dkUFOduHMg7ZBqLyOk4YSXcMr3+HTs+eoOXK2Hg5lmeji+Nci0ok86aJeVDkOn8N68qeEtjwu/AII1o9s+STqgo00lyW+e8PndtI4D0DV1Rwng864twS0LMi1Cnaw1DFNmlsyBeo/Y3+1LCN+8lKXo09OSj5JPXmB2Pb0dcQFA+20aJv/dEQnjiPnfkyzIEe3KknQOASjQgG502GHW9YVdn+6y+iSEiuUmqxHj+SGGJPzML8kSRJjFPPqjMV5BtuW/GI+rw1OYsbZcsZWcGzWvdYGFE8GeUIlZImB0wLJTHRieiYLwxwnGV98S4m1TKKAmaKVzUivwnyzzdzwbTLehaHoLpIkTh6PgP8mt1vy8fVfJ5X2MxWknwasO4d8BqhCLN65zgmT9lIOij1N13sbVwKDnyfLFa+ePrkMMdOeR04Yy0G8GZmUVFYpG3LmG2Bpn9EjUw0DOqrWz42qfAIO7HZz7I7T+PVR2/odtbtfnuRmdvo6BOHXaY/cxEhcbXyaS5OBqkpIGXuQQ8r0Xwbg4HzO3t59pbAWgQTjSIQnhPncygKdEwcrg==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7065.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 375b88fa-b441-4f29-5a8c-08d862c786da
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2020 09:27:17.2052
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LE4CMK30F+dlz8/pk2CA4qH/CbWvOa0EA/fovGZnsisWHanq8LwcmBb4j5U+34BxVDisCVap3ToZASyMIJILgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3833
X-Original-Sender: alice.guo@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=BoYi+E79;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of alice.guo@nxp.com
 designates 40.107.2.76 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
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

Tested-by: Alice Guo < alice.guo@nxp.com>

> -----Original Message-----
> From: Jan Kiszka <jan.kiszka@siemens.com>
> Sent: 2020=E5=B9=B49=E6=9C=8825=E6=97=A5 16:50
> To: jailhouse-dev@googlegroups.com
> Cc: Alice Guo <alice.guo@nxp.com>; Peng Fan <peng.fan@nxp.com>
> Subject: [EXT] [PATCH 0/8] arm64: SMMU500 cleanups
>=20
> Caution: EXT Email
>=20
> Please review and test carefully as my current setup (Ultra96-v2) does no=
t seem
> to be complete yet.
>=20
> Jan
>=20
> Jan Kiszka (8):
>   arm64: smmu: Simplify __arm_smmu_tlb_sync
>   arm64: smmu: Allow arm_smmu_init_context_bank to return an error
>   arm64: smmu: Clarify that mapping mismatch is just a warning
>   arm64: smmu: Consolidate translation stage detection and reporting
>   arm64: smmu: Fold __arm_smmu_tlb_sync into single caller
>   arm64: smmu: Drop duplicate error messages
>   arm64: smmu: Handle arm_smmu_find_sme error properly
>   arm64: smmu: Improve output during setup
>=20
>  hypervisor/arch/arm64/smmu.c | 113 +++++++++++++----------------------
>  1 file changed, 40 insertions(+), 73 deletions(-)
>=20
> --
> 2.26.2

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/DB8PR04MB70656B7EDD4163635048C7A2E2340%40DB8PR04MB7065.eurprd=
04.prod.outlook.com.
