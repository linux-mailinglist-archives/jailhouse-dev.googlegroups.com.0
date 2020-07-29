Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBB3GZQP4QKGQEUM64V3A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x337.google.com (mail-ot1-x337.google.com [IPv6:2607:f8b0:4864:20::337])
	by mail.lfdr.de (Postfix) with ESMTPS id 98886231816
	for <lists+jailhouse-dev@lfdr.de>; Wed, 29 Jul 2020 05:28:46 +0200 (CEST)
Received: by mail-ot1-x337.google.com with SMTP id n7sf1509998otn.19
        for <lists+jailhouse-dev@lfdr.de>; Tue, 28 Jul 2020 20:28:46 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1595993325; cv=pass;
        d=google.com; s=arc-20160816;
        b=F47V0reF67OEzLv6mhBfdxyCF63+Qecv06D3b7SnPgLKG9oS461544grh+ni1M+5cb
         KomYGkf5tEtmNwqkKefAvjR+mX3A/GTVbQaBku4MVSrpPFymFqYO9Kls66khmnPDq6jj
         Yjna3MZPnGNHtSTVEtJdoAVsxHxtVKTP2Vsqjykta+IdvP0mP9ls/6OIaJ9g5/s+xSLT
         RYNPw6yTQry1E/6EQ0gk2dM+nBXMIHs4mMY5HRQE6ksyCEsBW05+xz4a8tXSm42qgT8q
         lBaeoztIGlYqG0p4zDjxM/TRaWyCbxdELCmeYlkcBylwLRFhQ0EybT5lcMso8IVnOWfU
         KBBw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:sender:dkim-signature;
        bh=fRGz3RbpbH1okoYY62PlO4FPadNm+K0mq6ageOp2Qdg=;
        b=UaQyrblwW0o2h1TnkcGR7NOX9yJo31I0yyXRnntdnFtsUxf5VNx3jyDSXnjVBCgblk
         yxwCFJCS3BPBcXe8CD2Joh5+C2ezJ/kraJ/X2mSGS6J2LSF1nBSn//IWQfawijQK6c/O
         AnKGNKcS3OUxdRTXqUqiqB0BXNPLxqzrIN4STE0ky7TmVR6MBC9IaCgBGMMEvMBg+VSu
         gy86pboOyAI8Ru+e5HEZjzH+qoP+mgGuYy2aDpXv56nqcbgGoGnmD3PcLQTQugHzSBNr
         WjfiDu9eKp+RktPlJVFMRZ+5IbmL83EjirdMenDKSYQH4Xx0VhBzIeiQ4H8Vlhyqc4Y8
         vR+Q==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=czfpU6M1;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.22.84 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=fRGz3RbpbH1okoYY62PlO4FPadNm+K0mq6ageOp2Qdg=;
        b=knlaR+aWkdjLZmyrTRLhuA8q5cvV6uq9emIocDkgtIOV+p9bB9HKPlfEr7D//W6ZjZ
         kUkG+Z/+OCbMX61CUTgEJ+ICbZWybaI0kqCndOwcEjC0KHTwZdTNQzSzTM+gUzoSzM0j
         MtYTUYk2rgf1zfxHsV0T0s3j//la8S+m97DTkZUGQpeX+TCXfdsHYA8ZekcB26AXGW0+
         GKUPrG20YGs8CP+V26v22p2P7RZsHcdfE3nf+F231v9Z6ez2IejUrgQujzH40J41CdN1
         BAeeGpvMZ97flmvYWaTjPZYmE2JSh+J9H/XuPrzUscm93ML1YvZDeqQ/bp3romYKXHXA
         gLGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=fRGz3RbpbH1okoYY62PlO4FPadNm+K0mq6ageOp2Qdg=;
        b=QIch6wgtAGjlfeTX4Uj69IHzM+MZglJH0eL+lAEQOmUFWi02hj+W3X9G6h6MizFW5Y
         OmQKvq08ys9XVS0mL1+xfVOJ/RBgiNvnzPEARdTEUhrVwG+Cn29vGFJxwgogt+7oKrxb
         TWDNzEDbl2E5nCLwS0NANesfaDU6Q1ZQInqxQYIsS4msXMQmny1S9gbcG2QF5dZDvGTc
         rzXX30Aa4J3f+GfoyxmI0PnHlK7zPwt3SqoUfdAQ+hXOXHKVA43bo7p1SvgCOEh9hlqO
         Gaf9siloMhZ3odHm8QpQiDanEitRK43q3oBWkV5rk376wjrTqmMTt/5YLUXvJVlhMC5B
         S27w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531IaRGChqtg5OJ+aUMxNDqgOj0QG2uHpTq+uHw4AqvFrT4hM/bG
	VaIgtRisdveKDWN9pUVkgHI=
X-Google-Smtp-Source: ABdhPJyrINK3kZVTiwwPtJWiYyhDyqBUT3YuMjf2B2iz77BPRAkLis4UvQBc/An+AL+/36b5KPUP7A==
X-Received: by 2002:aca:5703:: with SMTP id l3mr5945711oib.43.1595993325063;
        Tue, 28 Jul 2020 20:28:45 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a54:4404:: with SMTP id k4ls159549oiw.8.gmail; Tue, 28 Jul
 2020 20:28:44 -0700 (PDT)
X-Received: by 2002:aca:c057:: with SMTP id q84mr6193120oif.117.1595993324596;
        Tue, 28 Jul 2020 20:28:44 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1595993324; cv=pass;
        d=google.com; s=arc-20160816;
        b=FRkHpdTO9LEGSgE5UHXawc9BszQRtjKcT+ODN5sjzr1kzBOXp31+9eczVDkSZPPI64
         Xzk48RTtNjUXEvjT90s1BakDwI6dP0p27bt126Ps8qHJTbfQdbNrDsieXfWmiAs1Z+ap
         /tQRaKwivesCockfH1FamVCvHG6IVKGwHbQYHKL41MrMeqTzxmzfX0HaQH+5imYBrUa6
         b0uYwjsRc/dFO1rnTfpDYLl7B+vPAIcJ9ifShf+lXx0d4XwzH5EGOqItMnai/54567cL
         wgJafhn8iZCU6OPdvZzQonrUsiTlZo4ezX7+fA1rsZnjiNxYlA+9i8MgSHhDwnyZZemI
         A7vA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=JuQ+zHRg9/Dsesv+wmHLPmIeML6jS7o4NYA/q1NQ0x8=;
        b=c8shtoQSqyTtVchgwTQxgtVk7dn6vs+Ii2VNK24DYlSOza8bkAt3wmEWyG7syb51gm
         CKdfgEXWy7EjhimNTUgmxl6PxkscYdknXixXEZx99H6EIDI8ciQCN2I+WDXoZBOs3WZq
         3Rud4KDS+ah20c3rSzcTmeuk1C3EMtRh6yWaqzoHVzJQe770WhFJRbMa/X8oCAyxC9gX
         59xJzy1IKPehVFT+tDTPkuX4GiINYnN69jJwamMyr93RPOKjOaUN8FG7ZI4qlJm4Zv+J
         Kby1sw+9QvGTOkMqkJ8V10gJlROvtLrQ7R0+b/cGXngriEwz9r152yFuJ26LA3bqmWui
         sGeA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=czfpU6M1;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.22.84 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2084.outbound.protection.outlook.com. [40.107.22.84])
        by gmr-mx.google.com with ESMTPS id n26si88606otk.5.2020.07.28.20.28.44
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Jul 2020 20:28:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.22.84 as permitted sender) client-ip=40.107.22.84;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KmP+Nt2d/7eGSWIo9X8sNToZPtZENHmzfMYE0FURlEtXJQBqUMstBoPbQu8JyWbGmfsPOYSCV53+qEE7hG2J/vbcvK7kxrDL6KwMaOS63LkxmA3QMaATx6Z+rmEbYMBSYnWeJSR0y9XO6QZucONbxId8Tv88Tj4Sj5XwG933Fy6qjYXh7V9ZzHFx+0i2m6/pP6IoUoGJtQEpbfbYAl6OV4T0g8aNC+NPdHqlQ/apowJ6ETUbvFp6h9nco9riBqVmoMkVCEjNGoU+1NdqlAiNr3GkLU2E7PEWHoCOD6HtVpVIjnFqIJ0+NA15SbGdlUiTyl2b29TlifYsyCMUpUvMMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JuQ+zHRg9/Dsesv+wmHLPmIeML6jS7o4NYA/q1NQ0x8=;
 b=laR0FSuKX0qaL3jJDvIhJsmW+NE76UqyygfY/yl9amf8el5gUw63GjLEGJ7c8GIm+zp/SpN/vWO5xZZOHaWAUUEKdI0FBebPZowYUsEhzs55l+d3fhRT/Z9s1jJgShpa+TyaAZ4ndQqt/9ILJdbU8sy9l5A55AahxpipOZXzjaffzyNMlikF+ib1z+WR2U+zX536QTCIqPI2SQp/TX5Ad+EJ8Xrk6H36cFYZNBkrCsQEOHliWChd5PYB1UrrKUiRkem5u9G0CoMZRKmcYR2r4DwVM022q3yT9p6txVvJm7IauC9jRaZmGPtX0A8xoi6PdtjTlptpsgmTIVtfZqJouw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4090.eurprd04.prod.outlook.com (2603:10a6:5:28::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.26; Wed, 29 Jul
 2020 03:28:42 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::2d36:b569:17c:7701]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::2d36:b569:17c:7701%4]) with mapi id 15.20.3216.033; Wed, 29 Jul 2020
 03:28:42 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, Angelo Ruocco
	<angelo.ruocco.90@gmail.com>
CC: Nikhil Devshatwar <nikhil.nd@ti.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>, Alice Guo <alice.guo@nxp.com>, Ralf
 Ramsauer <ralf.ramsauer@oth-regensburg.de>, Jose Martins
	<jose.martins@bao-project.org>
Subject: RE: jailhouse jitter?
Thread-Topic: jailhouse jitter?
Thread-Index: AdZQV9Sg2ghlhzPgRlmJb7fpOVsBgwADlDcAAAL01YAAAMZ8gAAGw6oAAAZGpAAALvHKAANegwUAABKcb+ABLTLsQAAAvACAAABJEgAAAlS8AABbEs/w
Date: Wed, 29 Jul 2020 03:28:42 +0000
Message-ID: <DB6PR0402MB276063FAB38B540E81ED7D3288700@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <DB6PR0402MB2760BE2A66C776875890B5DF886D0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <38ffb4dc-20d6-3404-cc61-ea08ea8066f1@siemens.com>
 <e0b6c5f5-89a0-6e29-6700-e5d5064d4672@ti.com>
 <CADiTV-0qHuXt=wrGCp4RbFWcu=WGsZKB-doXOTxjMVZkRiiiCA@mail.gmail.com>
 <1d5b0ac8-0744-59ab-bb90-8133df4a1525@siemens.com>
 <d0b0c698-7ee2-97dc-7b6e-685f2f169f39@siemens.com>
 <CADiTV-1oJBD+SkAT475xD5iODeo24wqwBSFGu2JQATxqpF1W0w@mail.gmail.com>
 <b96f90ad-23bc-db73-9603-f9eb640804d0@siemens.com>
 <DB6PR0402MB2760B4463A03D7FC4EE3E4E988780@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <DB6PR0402MB2760EA5C808D0A49208E7A9788720@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <640c6eb8-07ca-c354-f888-abee87ff49b6@siemens.com>
 <DB6PR0402MB27609A148CE4F1B5DC105D3088720@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <8c4f35ef-1b12-e08a-6d20-85d7c6c0fcad@siemens.com>
In-Reply-To: <8c4f35ef-1b12-e08a-6d20-85d7c6c0fcad@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 09a7476a-c937-4db4-7266-08d8336f7e62
x-ms-traffictypediagnostic: DB7PR04MB4090:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB40908E640461309B01368F9688700@DB7PR04MB4090.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /h6iq2a9TxArem2fQWlRLwzRr/tX757CquyZpWlryH1LFMEyiVNBrOVJYKhu1lNdq6sCQOjt/tYpvS+4hQr01UzHPbY8RgjdPnWKW8KHHWhn7nzqjqIZSAbj2CI6nxD2I3rk7ohh3YElCavD3R8rTHKvsU2c7uQ6DI541C6qs17mMgzw3atpjnIYmPZ142CFvSnJoE3/VhaP9PT22ZEcONAOk+UvNFqZfKuBbF4wnMCRxN/OgtYHTT0bCMhurNVd+198S6NdzRF0qdIZz2iLdaj4Mw6O1DlbAQB3uO9JNCDLsB0GLUZo6VLQCdSnPDtSjYgj1Q986soAuVm742H6PilrzyeMBf42DD1uaJeMQCHKUjLOyk8FJ2V8QlICDt7z9GB1ILxQwzAPrDR/8RFxRQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(136003)(39860400002)(366004)(346002)(376002)(71200400001)(8936002)(66476007)(66556008)(76116006)(7116003)(2906002)(3480700007)(83380400001)(66946007)(55016002)(64756008)(66446008)(44832011)(4326008)(9686003)(8676002)(316002)(7696005)(33656002)(52536014)(6506007)(53546011)(86362001)(5660300002)(54906003)(478600001)(26005)(186003)(966005)(110136005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: xVhHpG0F0ZXwzQh+M6btPVkCKTTlFr0Rd54wKkh5jhuhwkxYk7wRpePIk4dOXiczv7H/vl668QFZncDuGgRocoCvJ/PjkCmk5+Aj6jBrHCkDd7cwqKYA+d5uQ6a0zldsX5JKkQT3PmnX3/kqyQC7frZrTWwXz90Nyq/18tvrLnhCYL1hj7tj3kSwJCI94dK06O7362AACunNM3PopUKg5HKEO9UaSB5NY064v7APOyB61c7V93n32X2SjCcHE09cmQejo5F4lgNVRBFJ+TNCMjz5tzIn2kXyUUJEbJEch6k2gGDsxy82o+wbsVAqkD1kmCGFeIIo23Oyo0d0QVkRDYCyMUqMw1x7ujKSOiXNuKPoWHeyALsKAue6qShX/bZPCf+qtxsq1hHUT18nkGa6lIfsP/o+5R/ClRkpH7u7xVU4nXn4qSAOCE3UTZe10BJsruI9jX/i1w2uGly0X6AiP5tUxIs+x9IqrnPJQDiRtUrjTAmCGhD0Z+VyLG2f9Db2
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09a7476a-c937-4db4-7266-08d8336f7e62
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2020 03:28:42.6383
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eXP3VE4aaPeMH6b3Vu/uTI7lDpXJ5qLPdz1GcYAJROXWlITxnhLShj9/7CLFEJlxYrv3JBghNaQK65xugDaDsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4090
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=czfpU6M1;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.22.84 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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
> 
> On 27.07.20 08:56, Peng Fan wrote:
> >> Subject: Re: jailhouse jitter?
> >>
> >> On 27.07.20 08:25, Peng Fan wrote:
> >>> Hi Jan
> >>
> >> ...
> >>
> >>>
> >>> I tested the SDEI on i.MX8MM, it shows the jitter became smaller.
> >>>
> >>> Without SDEI, the gic-demo jitter is 999ns+ With SDEI, the gic-demo
> >>> jitter is 124ns~246ns.
> >>>
> >>> Indeed no more vmexits.
> >>>
> >>> But the max jitter, some times SDEI bigger only when program start
> >>> up,
> >> mostly because of CACHE WARM UP I think.
> >>
> >> That is one source. If you add a warm-up period, they can be
> >> mitigated, though.
> >>
> >> The other source might be last-level cache sharing. If there are
> >> cache-miss counters, maybe you can check if those increase along the
> peaks.
> >
> > Yes. When I add stress-ng in root cell, the jitter became larger sometimes.
> >
> 
> I've seen the same on the ultra96. My cache theory should be validated,
> though, because I would have assumed that all of the gic demo fits into a
> core-local cache.

After thinking more about root cell color, when booting jailhouse before Linux.

We are not using 1:1 mapping anymore or we could use 1:1 mapping with many
pieces of small ram area.

So I think the first 1 is better, but when use kmalloc for dma usage sometimes,
it will bring issues, because not 1:1 mapping, unless we let all drivers use
dedicated dma area reserved and not colored.

> 
> >
> >>
> >>>
> >>> Will you move SDEI support to jailhouse mainline?
> >>
> >> Once the to-dos are addressed. Any contributions?
> >
> > I'll read more into your patches and check the to-dos you listed in
> > the jailhouse commit log to see what I could help there.
> >
> 
> Item one (SDEI probing) is almost resolved.
> 
> >>
> >> BTW, did you have to patch ATF for your experiment? Will you upstream
> >> that patch?
> >
> > Yes. I'll upstream that. Quite simple, I only enabled one SDEI private event.
> >
> 
> Perfect.

Sent out.
https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/5116

Thanks,
Peng.

> 
> Jan
> 
> --
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE Corporate
> Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/DB6PR0402MB276063FAB38B540E81ED7D3288700%40DB6PR0402MB2760.eurprd04.prod.outlook.com.
